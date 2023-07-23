import 'package:change_case/change_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gypse_installer/add/presentation/state/add_question_state.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/errors/input_validators.dart';

class AddQuestionBloc extends Cubit<AddQuestionState> {
  AddQuestionBloc() : super(const AddQuestionState());

  static const int questionLimit = 100;
  static const int answerLimit = 50;
  static const int verseLimit = 180;

  bool onSendRequested() {
    if (checkError() != null) {
      return false;
    }
    return true;
  }

  void onQuestionChanged({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(questionError: isEmpty(value)));
      return;
    }
    if (charLimit(value, questionLimit) != null) {
      emit(state.copyWith(questionError: charLimit(value, questionLimit)));
      return;
    }
    emit(state.copyWith(question: value, questionError: ''));
  }

  void onBookSelected({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(bookError: isEmpty(value)));
      return;
    }

    if (isBook(value) != null) {
      emit(state.copyWith(bookError: isBook(value)));
      return;
    }
    Book verse = Book.values.firstWhere((e) => e.label == value);

    emit(state.copyWith(
        book: value, bookError: '', bookShort: verse.name.toTitleCase()));
  }

  void onAnswer1Changed({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(answer1Error: isEmpty(value)));
      return;
    }
    if (charLimit(value, answerLimit) != null) {
      emit(state.copyWith(answer1Error: charLimit(value, answerLimit)));
      return;
    }
    emit(state.copyWith(answer1: value, answer1Error: ''));
  }

  void onUrlChanged({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(urlError: isEmpty(value)));
      return;
    }
    if (isUrl(value) != null) {
      emit(state.copyWith(urlError: isUrl(value)));
      return;
    }
    emit(state.copyWith(url: value, urlError: ''));
  }

  void onVerseChanged({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(verseError: isEmpty(value)));
      return;
    }
    if (charLimit(value, verseLimit) != null) {
      emit(state.copyWith(verseError: charLimit(value, verseLimit)));
      return;
    }
    emit(state.copyWith(verse: value, verseError: ''));
  }

  void onVerseRefChanged({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(verseRefError: isEmpty(value)));
      return;
    }
    emit(state.copyWith(verseRef: value, verseRefError: ''));
  }

  void onAnswer2Changed({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(answer2Error: isEmpty(value)));
      return;
    }
    if (charLimit(value, answerLimit) != null) {
      emit(state.copyWith(answer2Error: charLimit(value, answerLimit)));
      return;
    }
    emit(state.copyWith(answer2: value, answer2Error: ''));
  }

  void onAnswer3Changed({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(answer3Error: isEmpty(value)));
      return;
    }
    if (charLimit(value, answerLimit) != null) {
      emit(state.copyWith(answer3Error: charLimit(value, answerLimit)));
      return;
    }
    emit(state.copyWith(answer3: value, answer3Error: ''));
  }

  void onAnswer4Changed({String value = ''}) {
    if (isEmpty(value) != null) {
      emit(state.copyWith(answer4Error: isEmpty(value)));
      return;
    }
    if (charLimit(value, answerLimit) != null) {
      emit(state.copyWith(answer4Error: charLimit(value, answerLimit)));
      return;
    }
    emit(state.copyWith(answer4: value, answer4Error: ''));
  }

  String? checkError() {
    if (state.questionError.isNotEmpty) {
      return '[ERROR] | Question : ${state.questionError}';
    }
    if (state.bookError.isNotEmpty) {
      return '[ERROR] | Livre : ${state.bookError}';
    }
    if (state.answer1Error.isNotEmpty) {
      return '[ERROR] | Réponse 1 : ${state.answer1Error}';
    }
    if (state.urlError.isNotEmpty) {
      return '[ERROR] | Lien : ${state.urlError}';
    }
    if (state.verseRefError.isNotEmpty) {
      return '[ERROR] | Référence : ${state.verseRefError}';
    }
    if (state.verseError.isNotEmpty) {
      return '[ERROR] | Verset : ${state.verseError}';
    }
    if (state.answer2Error.isNotEmpty) {
      return '[ERROR] | Réponse 2 : ${state.answer2Error}';
    }
    if (state.answer3Error.isNotEmpty) {
      return '[ERROR] | Réponse 3 : ${state.answer3Error}';
    }
    if (state.answer4Error.isNotEmpty) {
      return '[ERROR] | Réponse 4 : ${state.answer4Error}';
    }
    return null;
  }
}
