import 'package:flutter/material.dart';

class Dimensions extends Size {
  final BuildContext context;

  Dimensions.xxs(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.02,
          MediaQuery.of(context).size.height * 0.02,
        );

  Dimensions.xs(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.height * 0.05,
        );

  Dimensions.s(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.1,
        );

  Dimensions.m(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.2,
          MediaQuery.of(context).size.height * 0.2,
        );

  Dimensions.l(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.3,
          MediaQuery.of(context).size.height * 0.3,
        );

  Dimensions.xl(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.4,
          MediaQuery.of(context).size.height * 0.4,
        );

  Dimensions.xxl(this.context)
      : super(
          MediaQuery.of(context).size.width * 0.5,
          MediaQuery.of(context).size.height * 0.5,
        );

  Dimensions.screen(this.context)
      : super(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        );
}
