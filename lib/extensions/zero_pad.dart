extension ZeroPadExtension on int {
  String get pad {
    return this < 10 ? '0' + this.toString() : this.toString();
  }
}
