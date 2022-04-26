extension IntExtension on int {
  /// FormDateTime.fromMillisecondsSinceEpoch(a)ta valores para terem pelo menos 2 dígitos.
  String get pad => this >= 0 && this < 10 ? '0' + toString() : toString();

  /// Converte inteiros no formato timestamp para [DateTime]
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);

  /// Retorna 's' se módulo de valor é diferente de 1
  String get plural => abs() == 1 ? '' : 's';
}
