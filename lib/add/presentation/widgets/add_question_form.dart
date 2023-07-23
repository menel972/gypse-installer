import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gypse_installer/add/domain/usecase/add_requests_usecase.dart';
import 'package:gypse_installer/add/presentation/models/ui_question.dart';
import 'package:gypse_installer/add/presentation/state/add_question_bloc.dart';
import 'package:gypse_installer/add/presentation/state/add_question_state.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/theme/buttuon_theme.dart';
import 'package:gypse_installer/common/theme/dimensions.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionForm extends HookConsumerWidget {
  AddQuestionForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> addContent(UiQuestion content) =>
        ref.read(AddContentUsecase.wsAddRequestsProvider()).invoke(content);

    return BlocConsumer<AddQuestionBloc, AddQuestionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _formKey,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) => [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Question :',
                              suffix: Text(state.questionError),
                            ),
                            onChanged: (value) => context
                                .read<AddQuestionBloc>()
                                .onQuestionChanged(value: value),
                          ),
                        ),
                        Dimensions.xxs(context).spaceW(),
                        const Text('Livre :',
                            style: Font.m(color: Colors.black87)),
                        SizedBox(
                            width: Dimensions.screen(context).width * 0.005),
                        Expanded(
                          flex: 1,
                          child: Autocomplete(
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
                            onSelected: (value) => context
                                .read<AddQuestionBloc>()
                                .onBookSelected(value: value),
                          ),
                        ),
                      ],
                    ),
                    Dimensions.xs(context).spaceH(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Réponse 1 ✔️ :',
                        suffix: Text(state.answer1Error),
                      ),
                      onChanged: (value) => context
                          .read<AddQuestionBloc>()
                          .onAnswer1Changed(value: value),
                    ),
                    Dimensions.xxs(context).spaceH(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Lien :',
                              suffix: Text(state.urlError),
                            ),
                            onChanged: (value) => context
                                .read<AddQuestionBloc>()
                                .onUrlChanged(value: value),
                          ),
                        ),
                        Dimensions.xxs(context).spaceW(),
                        Text(
                            state.bookShort.isNotEmpty
                                ? '${state.bookShort} :'
                                : 'livre :',
                            style: const Font.m(color: Colors.black87)),
                        SizedBox(
                            width: Dimensions.screen(context).width * 0.005),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Référence :',
                              suffix: Text(state.verseRefError),
                            ),
                            onChanged: (value) => context
                                .read<AddQuestionBloc>()
                                .onVerseRefChanged(value: value),
                          ),
                        ),
                      ],
                    ),
                    Dimensions.xxs(context).spaceH(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Verset :',
                        suffix: Text(state.verseError),
                      ),
                      onChanged: (value) => context
                          .read<AddQuestionBloc>()
                          .onVerseChanged(value: value),
                    ),
                    Dimensions.xs(context).spaceH(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Réponse 2 ❌ :',
                        suffix: Text(state.answer2Error),
                      ),
                      onChanged: (value) => context
                          .read<AddQuestionBloc>()
                          .onAnswer2Changed(value: value),
                    ),
                    Dimensions.xxs(context).spaceH(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Réponse 3 ❌ :',
                        suffix: Text(state.answer3Error),
                      ),
                      onChanged: (value) => context
                          .read<AddQuestionBloc>()
                          .onAnswer3Changed(value: value),
                    ),
                    Dimensions.xxs(context).spaceH(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Réponse 4 ❌ :',
                        suffix: Text(state.answer4Error),
                      ),
                      onChanged: (value) => context
                          .read<AddQuestionBloc>()
                          .onAnswer4Changed(value: value),
                    ),
                    Dimensions.xs(context).spaceH(),
                    Dimensions.m(context).paddingW(
                      GypseElevatedButton(
                        onPressed: () {
                          if (context
                              .read<AddQuestionBloc>()
                              .onSendRequested()) {
                            addContent(state.toQuestion());
                            _formKey.currentState!.reset();
                            '"${state.question}" envoyé !'.sucsess(context);
                          } else {
                            context
                                .read<AddQuestionBloc>()
                                .checkError()
                                ?.failure(context);
                          }
                        },
                        label: "Envoyer",
                      ),
                    ),
                  ][index],
                ),
              ),
            ),
          );
        });
  }
}
