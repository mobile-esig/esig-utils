extension IntExtension on int {
  /// Formata valores para terem pelo menos 2 dígitos.
  String get pad =>
      this >= 0 && this < 10 ? '0' + toString() : toString();

  /// Converte inteiros no formato timestamp para [DateTime]
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
