import 'package:equatable/equatable.dart';
import 'package:gypse_installer/add/presentation/models/ui_question.dart';

class AddQuestionState extends Equatable {
  final String question;
  final String questionError;

  final String book;
  final String bookShort;
  final String bookError;

  final String answer1;
  final String answer1Error;

  final String url;
  final String urlError;

  final String verseRef;
  final String verseRefError;

  final String verse;
  final String verseError;

  final String answer2;
  final String answer2Error;

  final String answer3;
  final String answer3Error;

  final String answer4;
  final String answer4Error;

  const AddQuestionState({
    this.question = '',
    this.questionError = ' ',
    this.book = '',
    this.bookShort = '',
    this.bookError = ' ',
    this.answer1 = '',
    this.answer1Error = ' ',
    this.url = '',
    this.urlError = ' ',
    this.verse = '',
    this.verseError = ' ',
    this.verseRef = '',
    this.verseRefError = ' ',
    this.answer2 = '',
    this.answer2Error = ' ',
    this.answer3 = '',
    this.answer3Error = ' ',
    this.answer4 = '',
    this.answer4Error = ' ',
  });

  @override
  List<Object?> get props => [
        question,
        questionError,
        book,
        bookShort,
        bookError,
        answer1,
        answer1Error,
        url,
        urlError,
        verse,
        verseError,
        verseRef,
        verseRefError,
        answer2,
        answer2Error,
        answer3,
        answer3Error,
        answer4,
        answer4Error,
      ];

  AddQuestionState copyWith({
    String? question,
    String? questionError,
    String? book,
    String? bookShort,
    String? bookError,
    String? answer1,
    String? answer1Error,
    String? url,
    String? urlError,
    String? verse,
    String? verseError,
    String? verseRef,
    String? verseRefError,
    String? answer2,
    String? answer2Error,
    String? answer3,
    String? answer3Error,
    String? answer4,
    String? answer4Error,
  }) =>
      AddQuestionState(
        question: question ?? this.question,
        questionError: questionError ?? this.questionError,
        book: book ?? this.book,
        bookShort: bookShort ?? this.bookShort,
        bookError: bookError ?? this.bookError,
        answer1: answer1 ?? this.answer1,
        answer1Error: answer1Error ?? this.answer1Error,
        url: url ?? this.url,
        urlError: urlError ?? this.urlError,
        verse: verse ?? this.verse,
        verseError: verseError ?? this.verseError,
        verseRef: verseRef ?? this.verseRef,
        verseRefError: verseRefError ?? this.verseRefError,
        answer2: answer2 ?? this.answer2,
        answer2Error: answer2Error ?? this.answer2Error,
        answer3: answer3 ?? this.answer3,
        answer3Error: answer3Error ?? this.answer3Error,
        answer4: answer4 ?? this.answer4,
        answer4Error: answer4Error ?? this.answer4Error,
      );

  UiQuestion toQuestion() => UiQuestion(
      book: book,
      text: question,
      answer1: answer1,
      url: url,
      verse: verse,
      verseRef: '$bookShort $verseRef',
      answer2: answer2,
      answer3: answer3,
      answer4: answer4);
}
