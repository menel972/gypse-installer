import 'package:gypse_installer/questions/data/firebase/ws_delete_requests.dart';
import 'package:gypse_installer/questions/domain/repository/delete_requests_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteRequestsRepositoryImpl extends DeleteRequestsRepository {
  final WsDeleteRequests _request;

  DeleteRequestsRepositoryImpl(this._request);

  @override
  Future<void> deleteQuestion(String id) async =>
      await _request.deleteQuestion(id);

  static AutoDisposeProvider<DeleteRequestsRepository>
      wsDeleteRequestsProvider() =>
          Provider.autoDispose<DeleteRequestsRepository>(
              (AutoDisposeProviderRef<DeleteRequestsRepository> ref) =>
                  DeleteRequestsRepositoryImpl(
                      ref.read(WsDeleteRequests.wsDeleteRequestsProvider())));
}
