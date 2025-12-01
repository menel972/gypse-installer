import 'package:go_router/go_router.dart';
import 'package:gypse_installer/questions/presentation/add/add_view.dart';
import 'package:gypse_installer/questions/presentation/read/read_question_view.dart';
import 'package:gypse_installer/common/enums.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Screen.add.path,
      builder: (context, state) => const AddView(),
    ),
    GoRoute(
      path: Screen.get.path,
      builder: (context, state) => const ReadQuestionView(),
    ),
  ],
);
