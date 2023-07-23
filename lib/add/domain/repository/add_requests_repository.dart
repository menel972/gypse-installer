import 'package:gypse_installer/add/domain/models/answer.dart';
import 'package:gypse_installer/add/domain/models/question.dart';

abstract class AddRequestsRepository {
  Future<String> addQuestion(Question question);
  Future<String> addAnswer(Answer answer);
}
