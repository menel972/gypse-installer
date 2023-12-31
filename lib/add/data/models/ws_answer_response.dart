// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:gypse_installer/add/domain/models/answer.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';

/** WS ANSWER RESPONSE */

///<i><small>`Data Layer`</small></i>
///## Answer's response <i><small>(received from the database)</small></i>
///
///```
///final String? uId;
///final String? questionId;
///final bool? isRightAnswer;
///final WsAnswerData? fr;
///final WsAnswerData? en;
///final WsAnswerData? es;
///```
///
///Data received from the `Firebase Firestore database`is parsed into a `WsAnswerResponse` using the [WsAnswerResponse.fromMap] factory constructor.
///<br><br>
///The `WsAnswerResponse` is parsed to the `Domain Layer` using the [WsAnswerResponse.toDomain] method.
///<br><br>
///It contains the database response for an answer.
class WsAnswerResponse extends Equatable {
  final String? questionId;
  final bool? isRightAnswer;
  final WsAnswerData? fr;
  final WsAnswerData? en;
  final WsAnswerData? es;

  ///<i><small>`Data Layer`</small></i>
  ///### Answer's response <i><small>(received from the database)</small></i>
  ///#### `WsAnswerResponse` constructor
  ///<br><br>
  ///The `WsAnswerResponse` is parsed to the `Domain Layer` using the [WsAnswerResponse.toDomain] method.
  ///<br><br>
  ///It contains the database response for an answer.
  WsAnswerResponse({
    this.questionId = '',
    this.isRightAnswer = false,
    this.fr,
    this.en,
    this.es,
  });

  @override
  List<Object?> get props => [questionId, isRightAnswer, fr, en, es];

  /// <i><small>`Data Layer`</small></i><br>
  /// <b>Tries to parse the database response in a [WsAnswerResponse].</b>
  /// <br><hr><br>
  ///<i>EXCEPTIONS :
  /// <li>If any of the member variables are not present in the response, default null values will be assigned to them.
  /// <li>If an exception occurs, the `catch` will return a new instance of `WsAnswerResponse` with initial values.
  factory WsAnswerResponse.fromMap(Map<String, dynamic>? map) {
    try {
      return WsAnswerResponse(
        questionId: map?['questionId'] ?? '',
        isRightAnswer: map?['isRightAnswer'] ?? false,
        fr: WsAnswerData.fromMap(map?['fr']),
        en: WsAnswerData.fromMap(map?['en']),
        es: WsAnswerData.fromMap(map?['es']),
      );
    } catch (e) {
      e.log();
      return WsAnswerResponse();
    }
  }

  Map<String, dynamic> toMap(String id) {
    try {
      return {
        'questionId': id,
        'isRightAnswer': isRightAnswer,
        'fr': fr?.toMap(),
        'en': en?.toMap(),
        'es': es?.toMap(),
      };
    } catch (e) {
      e.log(tag: 'WsAnswerResponse.toMap');
      return {};
    }
  }

  /// <i><small>`Data Layer`</small></i><br>
  /// Converts a `WsAnswerData` into an `Answer` according to the language of the user.
  Answer toDomain({Locales locale = Locales.fr}) {
    switch (locale) {
      case Locales.fr:
        return Answer(
          qId: questionId ?? '',
          isRightAnswer: isRightAnswer ?? false,
          answer: fr?.answer ?? '',
          url: fr?.url ?? '',
          verse: fr?.verse ?? '',
          verseReference: fr?.verseReference ?? '',
        );
      case Locales.en:
        return Answer(
          qId: questionId ?? '',
          isRightAnswer: isRightAnswer ?? false,
          answer: en?.answer ?? '',
          url: en?.url ?? '',
          verse: en?.verse ?? '',
          verseReference: en?.verseReference ?? '',
        );
      default:
        return Answer(
          qId: questionId ?? '',
          isRightAnswer: isRightAnswer ?? false,
          answer: es?.answer ?? '',
          url: es?.url ?? '',
          verse: es?.verse ?? '',
          verseReference: es?.verseReference ?? '',
        );
    }
  }
}

/** WS ANSWER DATA */

///<i><small>`Data Layer`</small></i>
///## Answer's informations <i><small>(received from the database)</small></i>
///
///```
///final String? answer;
///final String? url;
///final String? verse;
///final String? verseReference;
///```
///
///Data received from the `Firebase Firestore database`is parsed into a `WsAnswerData` using the [WsAnswerData.fromMap] factory constructor.
///<br><br>
///It contains the informations of an answer.
class WsAnswerData extends Equatable {
  final String? answer;
  final String? url;
  final String? verse;
  final String? verseReference;

  ///<i><small>`Data Layer`</small></i>
  ///### Answer's informations <i><small>(received from the database)</small></i>
  ///#### `WsAnswerData` constructor
  ///<br>
  ///It contains the informations of an answer.
  WsAnswerData({
    this.answer = '',
    this.url = '',
    this.verse = '',
    this.verseReference = '',
  });

  @override
  List<Object?> get props => [answer, url, verse, verseReference];

  /// <i><small>`Data Layer`</small></i><br>
  /// <b>Tries to parse the database response in a [WsAnswerData].</b>
  /// <br><hr><br>
  ///<i>EXCEPTIONS :
  /// <li>If any of the member variables are not present in the response, default null values will be assigned to them.
  /// <li>If an exception occurs, the `catch` will return a new instance of `WsAnswerData` with initial values.
  factory WsAnswerData.fromMap(Map<String, dynamic>? map) {
    try {
      return WsAnswerData(
        answer: map?['answer'],
        url: map?['url'],
        verse: map?['verse'],
        verseReference: map?['versetReference'],
      );
    } catch (e) {
      e.log();
      return WsAnswerData();
    }
  }

  Map<String, dynamic> toMap() {
    try {
      return {
        'answer': answer,
        'url': url,
        'verse': verse,
        'verseReference': verseReference,
      };
    } catch (e) {
      e.log(tag: 'WsAnswerData.toMap');
      return {};
    }
  }
}
