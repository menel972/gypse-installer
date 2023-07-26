import 'package:gypse_installer/add/domain/models/question.dart';

abstract class AddRequestsRepository {
  Future<void> addQuestion(Question question);
}
