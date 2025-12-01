import 'package:flutter/material.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';

class GypseElevatedButton extends ElevatedButton {
  final String label;

  const GypseElevatedButton({
    super.key,
    required this.label,
    super.onPressed,
    super.child,
  });

  @override
  Widget get child => Text(
        label,
        maxLines: 1,
        style: Font.s(color: onPressed != null ? Colors.white : Colors.black),
      );

  @override
  ButtonStyle? get style => ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: WidgetStateProperty.resolveWith(
            (_) => onPressed != null ? Colors.black : Colors.grey[300]),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: onPressed != null ? Colors.black : Colors.grey,
              width: 1,
            ),
          ),
        ),
      );
}
