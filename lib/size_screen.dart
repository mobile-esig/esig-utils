import 'package:flutter/material.dart';

class SizeScreen {
  /// Retorna largura total
  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Retorna altura total
  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Retorna percentual da largura total
  static double perWidth(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.width * percentage) / 100;
  }

  /// Retorna percentual da altura total
  static double perHeight(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.height * percentage) / 100;
  }

  /// Retorna fração da largura total
  static double fracWidth(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.width / divisor;
  }

  /// Retorna fração da altura total
  static double fracHeight(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.height / divisor;
  }

  /// Retorna metade da largura total
  @Deprecated('Usar [fracWidth(context, 2)] produzirá o mesmo efeito.')
  static double halfWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  /// Retorna metade da altura total
  @Deprecated('Usar [fracHeight(context, 2)] produzirá o mesmo efeito.')
  static double halfHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }
}
