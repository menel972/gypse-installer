import 'package:equatable/equatable.dart';
import 'package:gypse_installer/add/domain/models/answer.dart';
import 'package:gypse_installer/add/domain/models/question.dart';

class UiQuestion extends Equatable {
  final String book;
  final String text;
  final String answer1;
  final String url;
  final String verse;
  final String verseRef;
  final String answer2;
  final String answer3;
  final String answer4;

  const UiQuestion({
    required this.book,
    required this.text,
    required this.answer1,
    required this.url,
    required this.verse,
    required this.verseRef,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });

  @override
  List<Object?> get props => [book, text];

  Question toQDomain() => Question('', QLang(text, book));

  List<Answer> toRDomain(String qId) => [
        Answer(
          id: '',
          questionId: qId,
          confirme: true,
          content: RLang(
              texte: answer1, link: url, versetRef: verse, verset: verseRef),
        ),
        Answer(
          id: '',
          questionId: qId,
          confirme: false,
          content: RLang(texte: answer2),
        ),
        Answer(
          id: '',
          questionId: qId,
          confirme: false,
          content: RLang(texte: answer3),
        ),
        Answer(
          id: '',
          questionId: qId,
          confirme: false,
          content: RLang(texte: answer4),
        ),
      ];
}
