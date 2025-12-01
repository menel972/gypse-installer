import 'package:gypse_installer/questions/data/firebase/ws_add_requests.dart';
import 'package:gypse_installer/questions/domain/models/question.dart';
import 'package:gypse_installer/questions/domain/repository/add_requests_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddRequestsRepositoryImpl extends AddRequestsRepository {
  final WsAddRequests _request;

  AddRequestsRepositoryImpl(this._request);

  @override
  Future<void> addQuestion(Question question) async =>
      await _request.addQuestion(question.toData());

  static AutoDisposeProvider<AddRequestsRepository> wsAddRequestsProvider() =>
      Provider.autoDispose<AddRequestsRepository>(
          (AutoDisposeProviderRef<AddRequestsRepository> ref) =>
              AddRequestsRepositoryImpl(
                  ref.read(WsAddRequests.wsAddRequestsProvider())));
}
