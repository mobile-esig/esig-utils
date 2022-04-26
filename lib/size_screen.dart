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

  /// Retorna percentual da largura total.
  /// percentage vai de 0 à 100
  static double perWidth(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.width * percentage) / 100;
  }

  /// Retorna percentual da altura total.
  /// percentage vai de 0 à 100
  static double perHeight(BuildContext context, int percentage) {
    return (MediaQuery.of(context).size.height * percentage) / 100;
  }

  /// Retorna fração da largura total.
  /// divisor vai de 0 à 1
  static double fracWidth(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.width / divisor;
  }

  /// Retorna fração da altura total
  /// divisor vai de 0 à 1
  static double fracHeight(BuildContext context, double divisor) {
    return MediaQuery.of(context).size.height / divisor;
  }
}
