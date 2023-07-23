import 'package:flutter/material.dart';

class Font extends TextStyle {
  final bool bold;

  @override
  TextDecoration? get decoration => TextDecoration.none;

  @override
  FontWeight? get fontWeight => bold ? FontWeight.w700 : FontWeight.w400;

  @override
  String? get fontFamily => 'NotoSansDisplay';

  const Font.xl({
    required super.color,
    this.bold = false,
    super.fontSize = 22,
    super.letterSpacing = 1,
  });

  const Font.l({
    required super.color,
    this.bold = false,
    super.fontSize = 18,
    super.letterSpacing = 0.8,
  });

  const Font.m({
    required super.color,
    this.bold = false,
    super.fontSize = 16,
    super.letterSpacing = 0.7,
  });

  const Font.s({
    required super.color,
    this.bold = false,
    super.fontSize = 14,
    super.letterSpacing = 0.6,
  });

  const Font.xs({
    required super.color,
    this.bold = false,
    super.fontSize = 12,
    super.letterSpacing = 0.5,
  });
}
