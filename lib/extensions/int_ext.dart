extension intExtension on int {
  /// Formata valores para terem pelo menos 2 dígitos.
  String get pad => this < 10 ? '0' + this.toString() : this.toString();

  /// Converte inteiros no formato timestamp para [DateTime]
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
