extension intExtension on int {
  // Formata valores para terem pelo menos 2 dígitos.
  // TODO: adaptar para usuário escolher tamanho da string
  String get pad => this < 10 ? '0' + this.toString() : this.toString();

  // Forma reduzida de converter timestamp para DateTime
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
