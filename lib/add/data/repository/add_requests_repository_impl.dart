import 'package:gypse_installer/add/data/firebase/ws_add_requests.dart';
import 'package:gypse_installer/add/domain/models/question.dart';
import 'package:gypse_installer/add/domain/models/answer.dart';
import 'package:gypse_installer/add/domain/repository/add_requests_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddRequestsRepositoryImpl extends AddRequestsRepository {
  final WsAddRequests _request;

  AddRequestsRepositoryImpl(this._request);

  @override
  Future<String> addAnswer(Answer answer) async =>
      await _request.addAnswer(answer.toData());

  @override
  Future<String> addQuestion(Question question) async =>
      await _request.addQuestion(question.toData());

  static AutoDisposeProvider<AddRequestsRepository> wsAddRequestsProvider() =>
      Provider.autoDispose<AddRequestsRepository>(
          (AutoDisposeProviderRef<AddRequestsRepository> ref) =>
              AddRequestsRepositoryImpl(
                  ref.read(WsAddRequests.wsAddRequestsProvider())));
}
