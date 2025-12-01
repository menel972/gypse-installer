import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/strings.dart';
import 'package:gypse_installer/common/theme/buttuon_theme.dart';
import 'package:gypse_installer/common/theme/dimensions.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';
import 'package:gypse_installer/common/widgets/questions_list_item.dart';
import 'package:gypse_installer/questions/domain/usecase/delete_requests_usecase.dart';
import 'package:gypse_installer/questions/domain/usecase/fetch_requests_usecase.dart';
import 'package:gypse_installer/questions/presentation/models/ui_question.dart';
import 'package:gypse_installer/questions/presentation/read/states/read_question_cubit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'widgets/questions_list_view.dart';
part 'widgets/questions_params_view.dart';
part 'widgets/read_question_appbar.dart';
part 'widgets/search_question_section.dart';

class ReadQuestionView extends HookConsumerWidget {
  const ReadQuestionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ReadQuestionAppbar(context),
      body: BlocProvider<ReadQuestionCubit>(
        create: (_) => ReadQuestionCubit(
          getQuestionByBookUsecase: ref.read(
            GetQuestionByBookUsecase.getQuestionByBookUsecaseProvider(),
          ),
          getQuestionByTextUsecase: ref.read(
            GetQuestionByTextUsecase.getQuestionByTextUsecaseProvider(),
          ),
          deleteQuestionUsecase: ref.read(
            DeleteQuestionUsecase.deleteQuestionUsecaseProvider(),
          ),
        ),
        child: Column(
          children: [
            const SearchQuestionSection(),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Dimensions.xxs(context).spaceH(),
            const QuestionsParamsView(),
            Expanded(child: QuestionsListView()),
          ],
        ),
      ),
    );
  }
}
