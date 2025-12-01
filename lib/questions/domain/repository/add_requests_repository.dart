import 'package:gypse_installer/questions/domain/models/question.dart';

abstract class AddRequestsRepository {
  Future<void> addQuestion(Question question);
}
