import 'package:flutter/material.dart';

class SizeScreen {
  static double perWidth(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.width * percentage) / 100;
  }

  static double perHeight(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.height * percentage) / 100;
  }

  static double fracWidth(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.width / divisor;
  }

  static double fracHeight(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.height / divisor;
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @Deprecated('Usar [fracWidth(context, 2)] produzirá o mesmo efeito.')
  static double halfWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  @Deprecated('Usar [fracHeight(context, 2)] produzirá o mesmo efeito.')
  static double halfHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }
}
