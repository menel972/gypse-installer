import 'package:go_router/go_router.dart';
import 'package:gypse_installer/add/presentation/add_view.dart';
import 'package:gypse_installer/common/enums.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Screen.add.path,
      builder: (context, state) => const AddView(),
    ),
  ],
);
