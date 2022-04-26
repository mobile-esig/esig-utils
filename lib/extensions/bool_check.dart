extension BoolExtension on bool {
  int get toInt {
    return this ? 1 : 0;
  }
}

@Deprecated(
    'Extension não se mostrou útil nas aplicações, será removida em breve')
extension NullableBoolExtension on bool? {
  /// Verifica valor booleano de variável que pode ser nula.
  /// Considera `null` equivalente à `false`.
  bool get check => this ?? false;
}
