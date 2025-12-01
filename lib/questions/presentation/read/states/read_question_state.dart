part of 'read_question_cubit.dart';

class ReadQuestionState extends Equatable {
  const ReadQuestionState({
    required this.questions,
    required this.bookFilter,
    required this.questionFilter,
    required this.cache,
    required this.message,
    required this.status,
  });

  const ReadQuestionState.initial({
    this.questions = const [],
    this.bookFilter,
    this.questionFilter,
    this.cache = const {},
    this.message,
    this.status = Status.initial,
  });

  @override
  List<Object?> get props => [questions, bookFilter, questionFilter];

  final List<UiQuestion> questions;
  final Book? bookFilter;
  final String? questionFilter;
  final Map<Book, List<UiQuestion>> cache;
  final String? message;
  final Status status;

  bool get isSearchEnabled => bookFilter != null || questionFilter != null;

  int get questionsCount => questions.length;

  String get request => questionFilter ?? bookFilter!.label;

  bool get initialState => status == Status.initial;

  bool get successState => status == Status.success;

  bool get loadingState => status == Status.loading;

  bool get errorState => status == Status.error;

  bool get emptyState => questions.isEmpty && status != Status.loading;

  ReadQuestionState copyWith({
    List<UiQuestion>? questions,
    Book? bookFilter,
    String? questionFilter,
    Map<Book, List<UiQuestion>>? cache,
    String? message,
    Status? status,
  }) {
    return ReadQuestionState(
      questions: questions ?? this.questions,
      bookFilter: bookFilter ?? this.bookFilter,
      questionFilter: questionFilter,
      cache: cache ?? this.cache,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
