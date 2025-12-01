import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/questions/data/repository/fetch_requests_repository_impl.dart';
import 'package:gypse_installer/questions/domain/repository/fetch_requests_repository.dart';
import 'package:gypse_installer/questions/presentation/models/ui_question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetQuestionByBookUsecase {
  final FetchRequestsRepository _repository;

  GetQuestionByBookUsecase(this._repository);

  Future<List<UiQuestion>> invoke(Book book) async =>
      await _repository.getQuestionByBook(book).then((result) =>
          result.map((question) => question.toPresentation()).toList());

  static AutoDisposeProvider<GetQuestionByBookUsecase>
      getQuestionByBookUsecaseProvider() =>
          Provider.autoDispose<GetQuestionByBookUsecase>(
              (AutoDisposeProviderRef<GetQuestionByBookUsecase> ref) =>
                  GetQuestionByBookUsecase(ref.read(
                      FetchRequestsRepositoryImpl.wsFetchRequestsProvider())));
}

class GetQuestionByTextUsecase {
  final FetchRequestsRepository _repository;

  GetQuestionByTextUsecase(this._repository);

  Future<List<UiQuestion>> invoke(String question) async =>
      await _repository.getQuestionByText(question).then((result) =>
          result.map((question) => question.toPresentation()).toList());

  static AutoDisposeProvider<GetQuestionByTextUsecase>
      getQuestionByTextUsecaseProvider() =>
          Provider.autoDispose<GetQuestionByTextUsecase>(
              (AutoDisposeProviderRef<GetQuestionByTextUsecase> ref) =>
                  GetQuestionByTextUsecase(ref.read(
                      FetchRequestsRepositoryImpl.wsFetchRequestsProvider())));
}
