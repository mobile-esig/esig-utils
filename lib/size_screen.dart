import 'package:flutter/material.dart';

class SizeScreen {
  static double perWidth(BuildContext context, int percentagem) {
    return (MediaQuery.of(context).size.width * percentagem) / 100;
  }

  static double perHeight(BuildContext context, int percentagem) {
    return (MediaQuery.of(context).size.height * percentagem) / 100;
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double halfWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  static double halfHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }
}
