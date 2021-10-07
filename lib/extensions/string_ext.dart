extension CapitalizeExtension on String {
  String get capitalize =>
      '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  String get capitalizeFirstofEach =>
      this.split(' ').map((str) => str.capitalize).join(' ');
}
