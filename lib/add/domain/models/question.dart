import 'package:equatable/equatable.dart';
import 'package:gypse_installer/add/data/models/ws_question.dart';

class Question extends Equatable {
  final String id;
  final QLang content;

  const Question(this.id, this.content);

  @override
  List<Object> get props => [id, content];

  WsQuestion toData() => WsQuestion(id: id, fr: content.toData());

  factory Question.fromData(WsQuestion data) =>
      Question(data.id, QLang.fromData(data.fr));
}

class QLang extends Equatable {
  final String texte;
  final String livre;

  const QLang(this.texte, this.livre);

  @override
  List<Object> get props => [texte, livre];

  WsQLang toData() => WsQLang(texte: texte, livre: livre);

  factory QLang.fromData(WsQLang data) => QLang(data.texte, data.livre);
}
