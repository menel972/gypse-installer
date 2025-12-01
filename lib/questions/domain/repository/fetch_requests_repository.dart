import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/questions/domain/models/question.dart';

abstract class FetchRequestsRepository {
  Future<List<Question>> getQuestionByBook(Book book);

  Future<List<Question>> getQuestionByText(String question);
}
