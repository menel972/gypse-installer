import 'package:flutter/material.dart';
import 'package:gypse_installer/common/theme/dimensions.dart';
import 'package:gypse_installer/common/theme/text_themes.dart';

extension Space on Dimensions {
  SizedBox spaceW() => SizedBox(width: width);
  SizedBox spaceH() => SizedBox(height: height);
}

extension Pads on Dimensions {
  EdgeInsets padW() => EdgeInsets.symmetric(horizontal: width);
  EdgeInsets padH() => EdgeInsets.symmetric(vertical: height);
  Padding paddingW(Widget? child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: child,
    );
  }

  Padding paddingH(Widget? child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height),
      child: child,
    );
  }
}

extension Print on Object {
  void log() => debugPrint(toString());
}

extension Snack on String {
  void sucsess(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          this,
          style: const Font.m(color: Colors.black),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
      ));

  void failure(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          this,
          style: const Font.m(color: Colors.black),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ));
}
