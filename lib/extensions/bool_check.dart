extension boolExt on bool? {
  /// Verifica valor booleano de variável que pode ser nula.
  /// Considera `null` equivalente à `false`.
  bool get check => this ?? false;
}
