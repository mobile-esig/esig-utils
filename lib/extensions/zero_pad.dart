extension PadExtension on int {
  String get pad {
    if (this == null) return '';
    return this < 10 ? '0' + this.toString() : this.toString();
  }
}
