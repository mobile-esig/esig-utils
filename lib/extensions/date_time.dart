import 'package:esig_utils/extensions/int_ext.dart';

extension DateTimeExtension on DateTime {
  /// Compara igualdade entre dois [DateTime] desconsiderando tempo
  bool equalDate(DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  /// Compara igualdade entre dois [DateTime] desconsiderando data.
  /// É possível configurar para considerar segundos.
  bool equalTime(DateTime other, [bool includeSeconds = true]) {
    bool isSecondsEqual = includeSeconds ? second == other.second : true;
    return hour == other.hour && minute == other.minute && isSecondsEqual;
  }

  /// Retorna String com data formatada.
  /// É possível configurar o caractere separador.
  String formattedDate([String separator = '/']) =>
      '${day.pad}$separator${month.pad}$separator$year';

  /// Retorna String com tempo formatado.
  /// É possível configurar o caractere separador.
  /// É possível configurar se deve incluir segundos.
  String formattedTime([bool includeSeconds = true, String separator = ':']) {
    String time = '${hour.pad}$separator${minute.pad}';
    if (includeSeconds) time += '$separator${second.pad}';
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
      '${formattedDate(dateSeparator)} ${formattedTime(includeSeconds, timeSeparator)}';

  /// Remove informação de hora, minuto, segundo e milisegundo
  /// Retorna o mesmo DateTime com somente ano, mês e dia
  DateTime get horaInicial => DateTime(year, month, day);

  /// Retorna um DateTime com o mesmo ano, mês e dia.
  /// Porém, com a hora configurada às 23:59:59
  DateTime get horaFinal => DateTime(year, month, day, 23, 59, 59);

  /// Retorna o mesmo [this] se estiver numa data passada.
  /// Retorna DateTime.now() se [this] for uma data futura.
  /// Cálculo não considera informações de hora, minuto e segundo.
  DateTime get truncateFuture {
    final now = DateTime.now().horaInicial;
    if (horaInicial.isAfter(now)) {
      return now;
    }
    return this;
  }

  bool get isDatePast => horaInicial.isBefore(DateTime.now().horaInicial);
}
