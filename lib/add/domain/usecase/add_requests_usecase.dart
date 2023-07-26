import 'package:gypse_installer/add/data/repository/add_requests_repository_impl.dart';
import 'package:gypse_installer/add/domain/repository/add_requests_repository.dart';
import 'package:gypse_installer/add/presentation/models/ui_question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionUsecase {
  final AddRequestsRepository _repository;

  AddQuestionUsecase(this._repository);

  Future<void> invoke(UiQuestion question) async =>
      await _repository.addQuestion(question.toDomain());

  static AutoDisposeProvider<AddQuestionUsecase> wsAddRequestsProvider() =>
      Provider.autoDispose<AddQuestionUsecase>(
          (AutoDisposeProviderRef<AddQuestionUsecase> ref) =>
              AddQuestionUsecase(
                  ref.read(AddRequestsRepositoryImpl.wsAddRequestsProvider())));
}
