import 'package:equatable/equatable.dart';
import 'package:gypse_installer/questions/data/models/ws_question_response.dart';
import 'package:gypse_installer/questions/domain/models/answer.dart';
import 'package:gypse_installer/questions/presentation/models/ui_question.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';

///<i><small>`Domain Layer`</small></i>
///## Question's data <i><small>(received from the data layer)</small></i>
///
///```
///final String uId;
///final String question;
///final String book;
///```
///
///The `Question` is parsed to the `Presentation Layer` using the [Question.toPresentation] method.
///<br><br>
///It contains all the data for a question.
class Question extends Equatable {
  final String uId;
  final String question;
  final String book;
  final List<Answer> answers;

  ///<i><small>`Domain Layer`</small></i>
  ///### Question's data <i><small>(received from the data layer)</small></i>
  ///#### `Question` constructor
  ///<br>
  ///It contains all the data for a question.
  const Question({
    required this.uId,
    required this.question,
    required this.book,
    required this.answers,
  });

  @override
  List<Object> get props => [uId, question, book, answers];

  /// <i><small>`Domain Layer`</small></i><br>
  /// Converts a `Question` into an `UiQuestion` according to the language of the user.
  UiQuestion toPresentation({Locales locale = Locales.fr}) {
    switch (locale) {
      case Locales.fr:
        return UiQuestion(uId,
            text: question,
            book: Books.values.firstWhere((b) => b.fr == book),
            answers: answers.map((e) => e.toPresentation()).toList());
      case Locales.en:
        return UiQuestion(uId,
            text: question,
            book: Books.values.firstWhere((b) => b.en == book),
            answers: answers.map((e) => e.toPresentation()).toList());
      default:
        return UiQuestion(uId,
            text: question,
            book: Books.values.firstWhere((b) => b.es == book),
            answers: answers.map((e) => e.toPresentation()).toList());
    }
  }

  WsQuestionResponse toData() {
    try {
      return WsQuestionResponse(
        uId: uId,
        fr: WsQuestionData(
            question: question,
            book: book,
            answers: [...answers.map((e) => e.toData())]),
      );
    } catch (e) {
      e.log(tag: 'Question.toData');
      return WsQuestionResponse();
    }
  }
}
