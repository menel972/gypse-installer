import 'package:equatable/equatable.dart';

class WsAnswer extends Equatable {
  final String id;
  final String questionId;
  final bool confirme;
  final WsRLang fr;
  final WsRLang? en;
  final WsRLang? es;

  const WsAnswer({
    required this.id,
    required this.questionId,
    required this.confirme,
    required this.fr,
    this.en,
    this.es,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        confirme,
        fr,
        en,
        es,
      ];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'questionId': questionId,
        'confirme': confirme,
        'fr': fr.toMap(),
        'en': en?.toMap(),
        'es': es?.toMap(),
      };

  factory WsAnswer.fromMap(Map<String, dynamic> map) => WsAnswer(
        id: map['id'] as String,
        questionId: map['questionId'] as String,
        confirme: map['confirme'] as bool,
        fr: WsRLang.fromMap(map['fr']),
        en: map['en'] != null ? WsRLang.fromMap(map['en']) : null,
        es: map['es'] != null ? WsRLang.fromMap(map['es']) : null,
      );
}

class WsRLang extends Equatable {
  final String texte;
  final String? link;
  final String? versetRef;
  final String? verset;

  const WsRLang({
    required this.texte,
    this.link,
    this.versetRef,
    this.verset,
  });

  @override
  List<Object?> get props => [texte, link, versetRef, verset];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'texte': texte,
        'link': link,
        'versetRef': versetRef,
        'verset': verset,
      };

  factory WsRLang.fromMap(Map<String, dynamic> map) => WsRLang(
        texte: map['texte'] as String,
        link: map['link'] != null ? map['link'] as String : null,
        versetRef: map['versetRef'] != null ? map['versetRef'] as String : null,
        verset: map['verset'] != null ? map['verset'] as String : null,
      );
}
