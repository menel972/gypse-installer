part of '../read_question_view.dart';

class ReadQuestionAppbar extends AppBar {
  final BuildContext context;
  ReadQuestionAppbar(this.context, {super.key});

  @override
  Widget? get title => const Text(
        '- INSTALLER',
        style: Font.l(color: Colors.black87),
      );

  @override
  Widget? get leading => Image.asset('$imagesPath/appicon_gypse.png');

  @override
  List<Widget>? get actions => [
        InkWell(
          onTap: () => context.go(Screen.add.path),
          child: Center(
              child: Dimensions.xxs(context).paddingW(const Text(
            'Ajouter une question',
            style: Font.s(
              color: Colors.black87,
            ),
          ))),
        ),
      ];

  @override
  double? get scrolledUnderElevation => 0;
}
