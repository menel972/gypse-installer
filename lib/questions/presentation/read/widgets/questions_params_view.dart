part of '../read_question_view.dart';

class QuestionsParamsView extends StatelessWidget {
  const QuestionsParamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadQuestionCubit, ReadQuestionState>(
      builder: (context, state) {
        if (!state.successState) return const SizedBox.shrink();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Requête : ${state.request}',
              style: const Font.m(color: Colors.grey),
            ),
            Text(
              'Résultat trouvé : ${state.questionsCount}',
              style: const Font.m(color: Colors.grey),
            ),
            GypseElevatedButton(
                label: 'Relancer',
                onPressed: () => context
                    .read<ReadQuestionCubit>()
                    .getQuestions(forceGet: true)),
          ],
        );
      },
    );
  }
}
