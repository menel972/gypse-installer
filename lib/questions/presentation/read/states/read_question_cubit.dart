import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/questions/domain/usecase/delete_requests_usecase.dart';
import 'package:gypse_installer/questions/domain/usecase/fetch_requests_usecase.dart';
import 'package:gypse_installer/questions/presentation/models/ui_question.dart';

part 'read_question_state.dart';

class ReadQuestionCubit extends Cubit<ReadQuestionState> {
  ReadQuestionCubit({
    required GetQuestionByBookUsecase getQuestionByBookUsecase,
    required GetQuestionByTextUsecase getQuestionByTextUsecase,
    required DeleteQuestionUsecase deleteQuestionUsecase,
  }) : super(const ReadQuestionState.initial()) {
    _getQuestionByBookUsecase = getQuestionByBookUsecase;
    _getQuestionByTextUsecase = getQuestionByTextUsecase;
    _deleteQuestionUsecase = deleteQuestionUsecase;
    textController = TextEditingController();
  }

  late final GetQuestionByBookUsecase _getQuestionByBookUsecase;
  late final GetQuestionByTextUsecase _getQuestionByTextUsecase;
  late final DeleteQuestionUsecase _deleteQuestionUsecase;

  late final TextEditingController textController;

  // FILTERS
  void onBookSelected(String bookTitle) {
    final Book book = Book.values.firstWhere(
      (element) => element.label == bookTitle,
    );
    emit(state.copyWith(
      bookFilter: book,
      questionFilter: state.questionFilter,
    ));
  }

  void onQuestionTapped(String question) {
    emit(state.copyWith(
      questionFilter: question,
    ));
  }

  void onClearQuestionFilter() {
    textController.clear();

    emit(state.copyWith(
      questionFilter: null,
    ));
  }

  // FETCH QUESTIONS
  Future<void> getQuestions({bool forceGet = false}) async {
    if (state.questionFilter != null) {
      await _getQuestionByText();
    } else {
      await _getQuestionByBook(forceGet: forceGet);
    }
  }

  Future<void> _getQuestionByBook({required bool forceGet}) async {
    emit(state.copyWith(status: Status.loading));

    if (!forceGet && _checkCache()) return;

    try {
      final List<UiQuestion> questions =
          await _getQuestionByBookUsecase.invoke(state.bookFilter!);

      emit(state.copyWith(
        questions: questions,
        questionFilter: state.questionFilter,
        status: Status.success,
      ));

      _updateCache(questions);
    } catch (e) {
      emit(state.copyWith(
        questionFilter: state.questionFilter,
        message: e.toString(),
        status: Status.error,
      ));
      return;
    }
  }

  Future<void> _getQuestionByText() async {
    emit(state.copyWith(status: Status.loading));

    try {
      final List<UiQuestion> questions =
          await _getQuestionByTextUsecase.invoke(state.questionFilter!);

      emit(state.copyWith(
        questions: questions,
        bookFilter: state.bookFilter,
        questionFilter: state.questionFilter,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        bookFilter: state.bookFilter,
        questionFilter: state.questionFilter,
        message: e.toString(),
        status: Status.error,
      ));
      return;
    }
  }

  // DELETE QUESTION
  Future<void> deleteQuestion(UiQuestion question) async {
    try {
      // await _deleteQuestionUsecase.invoke(question.uId);

      final List<UiQuestion> questions = state.questions..remove(question);

      emit(state.copyWith(
        questions: questions,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        status: Status.error,
      ));
      return;
    }
  }

  // CACHE
  bool _checkCache() {
    if (state.cache.containsKey(state.bookFilter!)) {
      emit(state.copyWith(
        questions: state.cache[state.bookFilter!],
        questionFilter: state.questionFilter,
        status: Status.success,
      ));
      return true;
    } else {
      return false;
    }
  }

  void _updateCache(List<UiQuestion> questions) {
    final Map<Book, List<UiQuestion>> cache = {...state.cache}
      ..update(state.bookFilter!, (_) => questions, ifAbsent: () => questions);

    cache[state.bookFilter!] = questions;
    emit(state.copyWith(
      cache: cache,
      questionFilter: state.questionFilter,
    ));
  }
}
