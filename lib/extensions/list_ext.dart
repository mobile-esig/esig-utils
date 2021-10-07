extension ListExt<T> on List<T> {
  T? get firstOrNull {
    if (this.isNotEmpty) return this.first;
    return null;
  }
}
