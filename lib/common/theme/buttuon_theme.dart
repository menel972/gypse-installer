import 'package:flutter/material.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';

class GypseElevatedButton extends ElevatedButton {
  final String label;

  const GypseElevatedButton({
    super.key,
    required this.label,
    required super.onPressed,
    super.child,
  });

  @override
  Widget get child => Text(
        label,
        maxLines: 1,
        style: const Font.s(color: Colors.white),
      );

  @override
  ButtonStyle? get style => ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.resolveWith((_) => Colors.black),
      );
}
