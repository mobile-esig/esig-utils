import 'package:esig_utils/extensions/int_ext.dart';

extension DateTimExtension on DateTime {
  /// Compara igualdade entre dois [DateTime] desconsiderando tempo
  bool equalDate(DateTime other) =>
      this.day == other.day &&
      this.month == other.month &&
      this.year == other.year;

  /// Compara igualdade entre dois [DateTime] desconsiderando data.
  /// É possível configurar para considerar segundos.
  bool equalTime(DateTime other, [bool includeSeconds = true]) {
    bool isSecondsEqual = includeSeconds ? this.second == other.second : true;

    return this.hour == other.hour &&
        this.minute == other.minute &&
        isSecondsEqual;
  }

  /// Retorna String com data formatada.
  /// É possível configurar o caractere separador.
  String formattedDate([String separator = '/']) =>
      '${this.day.pad}$separator${this.month.pad}$separator${this.year}';

  /// Retorna String com tempo formatado.
  /// É possível configurar o caractere separador.
  /// É possível configurar se deve incluir segundos.
  String formattedTime([bool includeSeconds = true, String separator = ':']) {
    String time = '${this.hour.pad}$separator${this.minute.pad}';

    if (includeSeconds) time += '$separator${this.second.pad}';

    return time;
  }

  /// Retorna String com data e tempo formatados.
  /// É possível configurar o caractere separador de cada uma das informações.
  /// É possível configurar se tempo deve incluir segundos.
  String formattedDateTime([
    bool includeSeconds = false,
    String dateSeparator = '/',
    String timeSeparator = ':',
  ]) =>
      '${this.formattedDate(dateSeparator)} ${this.formattedTime(includeSeconds, timeSeparator)}';
}
