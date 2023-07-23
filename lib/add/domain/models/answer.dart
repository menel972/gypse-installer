import 'package:equatable/equatable.dart';
import 'package:gypse_installer/add/data/models/ws_answer.dart';

class Answer extends Equatable {
  final String id;
  final String questionId;
  final bool confirme;
  final RLang content;

  const Answer({
    required this.id,
    required this.questionId,
    required this.confirme,
    required this.content,
  });

  @override
  List<Object?> get props => [id, questionId, confirme, content];

  WsAnswer toData() => WsAnswer(
      id: id, questionId: questionId, confirme: confirme, fr: content.toData());

  factory Answer.fromData(WsAnswer data) => Answer(
      id: data.id,
      questionId: data.questionId,
      confirme: data.confirme,
      content: RLang.fromData(data.fr));
}

class RLang extends Equatable {
  final String texte;
  final String? link;
  final String? versetRef;
  final String? verset;

  const RLang({
    required this.texte,
    this.link,
    this.versetRef,
    this.verset,
  });

  @override
  List<Object?> get props => [texte, link, versetRef, verset];

  WsRLang toData() =>
      WsRLang(texte: texte, link: link, versetRef: versetRef, verset: verset);

  factory RLang.fromData(WsRLang data) => RLang(
      texte: data.texte,
      link: data.link,
      versetRef: data.versetRef,
      verset: data.verset);
}
