part of '../read_question_view.dart';

class QuestionsListView extends StatelessWidget {
  QuestionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadQuestionCubit, ReadQuestionState>(
      builder: (context, state) {
        print('QuestionsListView build');
        if (state.initialState) return _initialView;

        if (state.loadingState) return _loadingView;

        if (state.errorState) return _errorView(state.message);

        if (state.emptyState) return _emptyView;

        return ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: Dimensions.xxs(context).height,
          ),
          itemCount: state.questionsCount,
          separatorBuilder: (context, index) =>
              Dimensions.xxxs(context).spaceH(),
          itemBuilder: (context, index) {
            final UiQuestion question = state.questions[index];

            return QuestionsListItem(question);
          },
        );
      },
    );
  }

  final Widget _initialView = const Center(
    child: Text(
      'Lance une recherche',
      style: TextStyle(fontSize: 30),
    ),
  );

  final Widget _loadingView = Center(
    child: Opacity(
      opacity: 0.7,
      child: Image.asset('$imagesPath/appicon_gypse.png', height: 200)
          .animate(onComplete: (controller) => controller.repeat())
          .shimmer(duration: 2.seconds),
    ),
  );

  Widget _errorView(String? message) => Center(
        child: Text(
          'An error occurred : $message',
          style: const TextStyle(fontSize: 30),
        ),
      );

  final Widget _emptyView = const Center(
    child: Text(
      'No questions found',
      style: TextStyle(fontSize: 30),
    ),
  );
}
