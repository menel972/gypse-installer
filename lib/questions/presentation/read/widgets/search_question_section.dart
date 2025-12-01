part of '../read_question_view.dart';

class SearchQuestionSection extends StatelessWidget {
  const SearchQuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadQuestionCubit, ReadQuestionState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final ReadQuestionCubit cubit = context.read<ReadQuestionCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Dimensions.xxs(context).spaceW(),
                  Expanded(
                    child: Autocomplete(
                      fieldViewBuilder: ((
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                      ) {
                        return TextFormField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onEditingComplete: onFieldSubmitted,
                          decoration: const InputDecoration(
                              hintText: 'Choisis un livre :'),
                        );
                      }),
                      optionsBuilder: (TextEditingValue value) {
                        if (value.text == '') {
                          return const Iterable<String>.empty();
                        }

                        return Book.values
                            .map((Book book) => book.label)
                            .where((String label) {
                          return label
                              .toLowerCase()
                              .startsWith(value.text.toLowerCase());
                        });
                      },
                      onSelected: cubit.onBookSelected,
                    ),
                  ),
                  Dimensions.xxxs(context).spaceW(),
                  const Text('ou', style: Font.m(color: Colors.black)),
                  Dimensions.xxxs(context).spaceW(),
                  Expanded(
                      child: TextFormField(
                    controller: cubit.textController,
                    decoration: InputDecoration(
                      labelText: 'Tape une question :',
                      suffixIcon: state.questionFilter != null
                          ? GestureDetector(
                              onTap: cubit.onClearQuestionFilter,
                              child: const Icon(Icons.clear),
                            )
                          : null,
                    ),
                    onFieldSubmitted: cubit.onQuestionTapped,
                  )),
                  Dimensions.xxs(context).spaceW(),
                  GypseElevatedButton(
                    label: 'Rechercher 🔎',
                    onPressed:
                        state.isSearchEnabled ? cubit.getQuestions : null,
                  ),
                ],
              ),
              if (state.questionFilter != null) ...[
                Dimensions.xxs(context).spaceH(),
                Text(
                  'La recherche ne prendra en compte que la question.',
                  style: Font.l(color: Colors.grey[700]),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
