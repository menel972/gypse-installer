import 'package:gypse_installer/questions/data/repository/delete_requests_repository_impl.dart';
import 'package:gypse_installer/questions/domain/repository/delete_requests_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteQuestionUsecase {
  final DeleteRequestsRepository _repository;

  DeleteQuestionUsecase(this._repository);

  Future<void> invoke(String id) async => await _repository.deleteQuestion(id);

  static AutoDisposeProvider<DeleteQuestionUsecase>
      deleteQuestionUsecaseProvider() => Provider.autoDispose<
              DeleteQuestionUsecase>(
          (AutoDisposeProviderRef<DeleteQuestionUsecase> ref) =>
              DeleteQuestionUsecase(ref.read(
                  DeleteRequestsRepositoryImpl.wsDeleteRequestsProvider())));
}
