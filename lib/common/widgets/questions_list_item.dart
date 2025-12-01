import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/theme/dimensions.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';
import 'package:gypse_installer/questions/presentation/models/ui_question.dart';
import 'package:gypse_installer/questions/presentation/read/states/read_question_cubit.dart';

class QuestionsListItem extends StatelessWidget {
  const QuestionsListItem(this.question, {super.key});

  final UiQuestion question;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Dismissible(
        key: Key(question.uId),
        onDismissed: (_) {
          context.read<ReadQuestionCubit>().deleteQuestion(question);
          print('${question.text} Dismissed');
        },
        direction: DismissDirection.endToStart,
        crossAxisEndOffset: 0.7,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: Dimensions.xxs(context).width),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: ExpansionTile(
          leading: SizedBox(
            width: Dimensions.s(context).width,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    question.uId,
                    style: const Font.s(color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Dimensions.xxs(context).spaceW(),
                Expanded(
                  child: Text(
                    question.book.fr,
                    style: const Font.m(color: Colors.black, bold: true),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            question.text,
            style: const Font.l(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black),
          ),
          children: question.answers
              .map((answer) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.xxs(context).width,
                      vertical: 8,
                    ),
                    color: answer.isRightAnswer
                        ? Colors.green[50]
                        : Colors.red[50],
                    child: Row(
                      children: [
                        Icon(
                          answer.isRightAnswer ? Icons.check : Icons.close,
                          color:
                              answer.isRightAnswer ? Colors.green : Colors.red,
                        ),
                        Dimensions.xxxs(context).spaceW(),
                        Text(
                          answer.text,
                          style: const Font.m(color: Colors.black),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
