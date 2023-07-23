import 'package:gypse_installer/add/data/repository/add_requests_repository_impl.dart';
import 'package:gypse_installer/add/domain/repository/add_requests_repository.dart';
import 'package:gypse_installer/add/presentation/models/ui_question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionUsecase {
  final AddRequestsRepository _repository;

  AddQuestionUsecase(this._repository);

  Future<String> invoke(UiQuestion question) async =>
      await _repository.addQuestion(question.toQDomain());

  static AutoDisposeProvider<AddQuestionUsecase> wsAddRequestsProvider() =>
      Provider.autoDispose<AddQuestionUsecase>(
          (AutoDisposeProviderRef<AddQuestionUsecase> ref) =>
              AddQuestionUsecase(
                  ref.read(AddRequestsRepositoryImpl.wsAddRequestsProvider())));
}

class AddAnswerUsecase {
  final AddRequestsRepository _repository;

  AddAnswerUsecase(this._repository);

  Future<void> invoke(UiQuestion question, String qId) async {
    for (var i = 0; i < 4; i++) {
      await _repository.addAnswer(question.toRDomain(qId)[i]);
    }
  }

  static AutoDisposeProvider<AddAnswerUsecase> wsAddRequestsProvider() =>
      Provider.autoDispose<AddAnswerUsecase>(
          (AutoDisposeProviderRef<AddAnswerUsecase> ref) => AddAnswerUsecase(
              ref.read(AddRequestsRepositoryImpl.wsAddRequestsProvider())));
}

class AddContentUsecase {
  final AddQuestionUsecase addQuestion;
  final AddAnswerUsecase addAnswer;

  AddContentUsecase({required this.addQuestion, required this.addAnswer});

  Future<void> invoke(UiQuestion question) async {
    String qId = await addQuestion.invoke(question);
    await addAnswer.invoke(question, qId);
  }

  static AutoDisposeProvider<AddContentUsecase> wsAddRequestsProvider() =>
      Provider.autoDispose<AddContentUsecase>(
          (AutoDisposeProviderRef<AddContentUsecase> ref) => AddContentUsecase(
                addQuestion:
                    ref.read(AddQuestionUsecase.wsAddRequestsProvider()),
                addAnswer: ref.read(AddAnswerUsecase.wsAddRequestsProvider()),
              ));
}
