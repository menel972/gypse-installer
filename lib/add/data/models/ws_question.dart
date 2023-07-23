import 'package:equatable/equatable.dart';

class WsQuestion extends Equatable {
  final String id;
  final WsQLang fr;
  final WsQLang? en;
  final WsQLang? es;

  const WsQuestion({
    required this.id,
    required this.fr,
    this.en,
    this.es,
  });

  @override
  List<Object?> get props => [id, fr, en, es];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'fr': fr.toMap(),
        'en': en?.toMap(),
        'es': es?.toMap(),
      };

  factory WsQuestion.fromMap(Map<String, dynamic> map) => WsQuestion(
        id: map['id'] as String,
        fr: WsQLang.fromMap(map['fr']),
        en: map['en'] != null ? WsQLang.fromMap(map['en']) : null,
        es: map['es'] != null ? WsQLang.fromMap(map['es']) : null,
      );
}

class WsQLang extends Equatable {
  final String texte;
  final String livre;

  const WsQLang({
    required this.texte,
    required this.livre,
  });

  @override
  List<Object> get props => [texte, livre];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'texte': texte,
        'livre': livre,
      };

  factory WsQLang.fromMap(Map<String, dynamic> map) => WsQLang(
        texte: map['texte'] as String,
        livre: map['livre'] as String,
      );
}
