// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/questions/data/models/ws_answer_response.dart';
import 'package:gypse_installer/questions/domain/models/question.dart';

/** WS QUESTION RESPONSE */
///<i><small>`Data Layer`</small></i>
///## Question's response <i><small>(received from the database)</small></i>
///
///```
///final String? uId;
///final WsQuestionData? fr;
///final WsQuestionData? en;
///final WsQuestionData? es;
///```
///
///Data received from the `Firebase Firestore database`is parsed into a `WsQuestionResponse` using the [WsQuestionResponse.fromMap] factory constructor.
///<br><br>
///The `WsQuestionResponse` is parsed to the `Domain Layer` using the [WsQuestionResponse.toDomain] method.
///<br><br>
///It contains the database response for a question.
class WsQuestionResponse extends Equatable {
  final String? uId;
  final WsQuestionData? fr;
  final WsQuestionData? en;
  final WsQuestionData? es;

  ///<i><small>`Data Layer`</small></i>
  ///### Question's response <i><small>(received from the database)</small></i>
  ///#### `WsQuestionResponse` constructor
  ///<br>
  ///It contains the database response for a question.
  WsQuestionResponse({
    this.uId = '',
    this.fr,
    this.en,
    this.es,
  });

  @override
  List<Object?> get props => [uId, fr, en, es];

  /// <i><small>`Data Layer`</small></i><br>
  /// <b>Tries to parse the database response in a [WsQuestionResponse].</b>
  /// <br><hr><br>
  ///<i>EXCEPTIONS :
  /// <li>If any of the member variables are not present in the response, default null values will be assigned to them.
  /// <li>If an exception occurs, the `catch` will return a new instance of `WsQuestionResponse` with initial values.
  factory WsQuestionResponse.fromMap(Map<String, dynamic>? map) {
    try {
      return WsQuestionResponse(
        uId: map?['uId'] ?? '',
        fr: WsQuestionData.fromMap(map?['fr']),
        en: WsQuestionData.fromMap(map?['en']),
        es: WsQuestionData.fromMap(map?['es']),
      );
    } catch (e) {
      e.log();
      return WsQuestionResponse();
    }
  }

  Map<String, dynamic> toMap(String id) {
    try {
      return {
        'uId': id,
        'fr': fr?.toMap(id),
        'en': en?.toMap(id),
        'es': es?.toMap(id),
      };
    } catch (e) {
      e.log(tag: 'WsQuestionResponse.toMap');
      return {};
    }
  }

  /// <i><small>`Data Layer`</small></i><br>
  /// Converts a `WsQuestionResponse` into a `Question` according to the language of the user.
  Question toDomain({Locales locale = Locales.fr}) {
    switch (locale) {
      case Locales.fr:
        return Question(
          uId: uId ?? '',
          question: fr?.question ?? '',
          book: fr?.book ?? '',
          answers: fr?.answers.map((e) => e.toDomain()).toList() ?? [],
        );
      case Locales.en:
        return Question(
          uId: uId ?? '',
          question: en?.question ?? '',
          book: en?.book ?? '',
          answers: en?.answers.map((e) => e.toDomain()).toList() ?? [],
        );
      default:
        return Question(
          uId: uId ?? '',
          question: es?.question ?? '',
          book: es?.book ?? '',
          answers: es?.answers.map((e) => e.toDomain()).toList() ?? [],
        );
    }
  }
}

/** WS QUESTION DATA */

///<i><small>`Data Layer`</small></i>
///## Question's informations <i><small>(received from the database)</small></i>
///
///```
///final String? question;
///final String? book;
///```
///
///Data received from the `Firebase Firestore database`is parsed into a `WsQuestionData` using the [WsQuestionData.fromMap] factory constructor.
///<br><br>
///It contains the informations of a question.
class WsQuestionData extends Equatable {
  final String? question;
  final String? book;
  final List<WsAnswerResponse> answers;

  ///<i><small>`Data Layer`</small></i>
  ///### Question's informations <i><small>(received from the database)</small></i>
  ///#### `WsQuestionData` constructor
  ///<br>
  ///It contains the informations of a question.
  WsQuestionData({
    this.question = '',
    this.book = '',
    this.answers = const [],
  });

  @override
  List<Object?> get props => [question, book, answers];

  /// <i><small>`Data Layer`</small></i><br>
  /// <b>Tries to parse the database response in a [WsQuestionData].</b>
  /// <br><hr><br>
  ///<i>EXCEPTIONS :
  /// <li>If any of the member variables are not present in the response, default null values will be assigned to them.
  /// <li>If an exception occurs, the `catch` will return a new instance of `WsQuestionData` with initial values.
  factory WsQuestionData.fromMap(Map<String, dynamic>? map) {
    try {
      return WsQuestionData(
        question: map?['question'],
        book: map?['book'],
        answers: ((map?['answers'] as List<dynamic>?)
                    ?.map((answer) => WsAnswerResponse.fromMap(answer)))
                ?.toList() ??
            [],
      );
    } catch (e) {
      e.log();
      return WsQuestionData();
    }
  }

  Map<String, dynamic> toMap(String id) {
    try {
      return {
        'question': question,
        'book': book,
        'answers': [...answers.map((e) => e.toMap(id))],
      };
    } catch (e) {
      e.log(tag: 'WsQuestionData.toMap');
      return {};
    }
  }
}
