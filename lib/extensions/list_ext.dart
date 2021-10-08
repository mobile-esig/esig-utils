extension ListExt<T> on List<T> {
  /// Testa se índice é válido para essa lista
  bool isIndexValid(int index) =>
      this.isNotEmpty && index >= 0 && index < this.length;

  /// Retorna elemento na posição [index].
  /// Caso índice seja inválido, retorna null.
  T? getNullable(int index) {
    if (this.isIndexValid(index)) {
      return this[index];
    }
    return null;
  }

  /// Retona primeiro elemento da lista, caso exista.
  /// Caso contrário, retorna null.
  T? get firstOrNull => this.getNullable(0);
}
