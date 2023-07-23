import 'package:flutter/material.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';

class InputTheme extends InputDecorationTheme {
  @override
  InputBorder? get enabledBorder =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));

  @override
  InputBorder? get focusedBorder => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2));

  @override
  InputBorder? get errorBorder =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.red));

  @override
  bool get filled => true;

  @override
  Color? get fillColor => Colors.black12;

  @override
  TextStyle? get labelStyle => const Font.m(color: Colors.black87);

  @override
  TextStyle? get suffixStyle => const Font.s(color: Colors.red);
}
