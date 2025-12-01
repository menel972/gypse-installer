import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/questions/data/firebase/ws_fetch_requests.dart';
import 'package:gypse_installer/questions/data/models/ws_question_response.dart';
import 'package:gypse_installer/questions/domain/models/question.dart';
import 'package:gypse_installer/questions/domain/repository/fetch_requests_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FetchRequestsRepositoryImpl extends FetchRequestsRepository {
  final WsFetchRequests _request;

  FetchRequestsRepositoryImpl(this._request);

  @override
  Future<List<Question>> getQuestionByBook(Book book) async => await _request
      .fetchQuestionsByBook(book.label)
      .then((List<WsQuestionResponse> result) =>
          result.map((wsQuestion) => wsQuestion.toDomain()).toList());

  @override
  Future<List<Question>> getQuestionByText(String question) async =>
      await _request.fetchQuestionsByText(question).then(
          (List<WsQuestionResponse> result) =>
              result.map((wsQuestion) => wsQuestion.toDomain()).toList());

  static AutoDisposeProvider<FetchRequestsRepository>
      wsFetchRequestsProvider() =>
          Provider.autoDispose<FetchRequestsRepository>(
              (AutoDisposeProviderRef<FetchRequestsRepository> ref) =>
                  FetchRequestsRepositoryImpl(
                      ref.read(WsFetchRequests.wsFetchRequestsProvider())));
}
