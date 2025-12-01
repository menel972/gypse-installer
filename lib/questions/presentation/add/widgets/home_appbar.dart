import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gypse_installer/common/enums.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/strings.dart';
import 'package:gypse_installer/common/theme/dimensions.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';

class HomeAppbar extends AppBar {
  final BuildContext context;
  HomeAppbar(this.context, {super.key});

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
          onTap: () => context.go(Screen.get.path),
          child: Center(
              child: Dimensions.xxs(context).paddingW(const Text(
            'Mes questions',
            style: Font.s(
              color: Colors.black87,
            ),
          ))),
        ),
      ];
}
