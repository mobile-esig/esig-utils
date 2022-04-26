import 'package:intl/intl.dart';

class EsigDateUtils {
  /// Dias da semana na classe DateTime não seguem ordem conveniente.
  /// Lá, [DateTime.monday == 1] mas [DateTime.sunday == 7], ao invés de 0.
  static const int sunday = 0;
  static const int monday = 1;
  static const int tuesday = 2;
  static const int wednesday = 3;
  static const int thursday = 4;
  static const int friday = 5;
  static const int saturday = 6;

  /// Recebe String com formato 'dd-MM-aaaa hh-mm' e retorna 'dd/MM/aaaa'.
  /// Ex.: '11-10-2020 03:00' é convertido para '11/10/2020'
  static String formatDMA(String data) {
    return data.split(' ').first.replaceAll('-', '/');
  }

  static DateTime datetimeFromString(String data, {format = 'dd/MM/yyyy'}) {
    return DateFormat(format).parse(data);
  }

  /// Recebe String com formato 'dd-MM-aaaa hh-mm' e retorna o DateTime
  /// correspondente.
  static DateTime formatDateDMAHM(String date) {
    List<String> dataHora = date.split(' ');
    String data = dataHora[0];
    String hora = dataHora[1];

    List<String> dma = data.split('-');
    List<String> hm = hora.split(':');

    return DateTime(
      int.parse(dma[2]),
      int.parse(dma[1]),
      int.parse(dma[0]),
      int.parse(hm[0]),
      int.parse(hm[1]),
    );
  }

  // Sobre formatar datas: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
  static String formatDateTime(DateTime? data,
      {String format = 'dd/MM/yyyy HH:mm:ss'}) {
    if (data == null) return '';
    return DateFormat(format, 'pt_BR').format(data);
  }

  static String getNomeMesAbrev(int mes) {
    var dataComMes = DateTime(0, mes);
    var nomeMes = DateFormat.MMM('pt_BR').format(dataComMes).toUpperCase();

    return nomeMes;
  }

  static String getNomeMes(int mes) {
    var dataComMes = DateTime(0, mes);
    var nomeMes = DateFormat.MMMM('pt_BR').format(dataComMes).toUpperCase();
    return nomeMes;
  }

  /// Retorna os nomes em português dos [meses] em letras maiúsculas separados
  /// por ' / '
  static String getNomeMeses(List<int> meses) {
    List<DateTime> datasComMes = meses.map((mes) => DateTime(0, mes)).toList();
    List<String> nomes = [];

    for (var data in datasComMes) {
      nomes.add(DateFormat.MMMM('pt_BR').format(data).toUpperCase());
    }

    return nomes.join(' / ');
  }

  static int bimestre(DateTime data) => ((data.month - 1) / 2 + 1).toInt();
  static int trimestre(DateTime data) => ((data.month - 1) / 3 + 1).toInt();
  static int semestre(DateTime data) => data.month > 6 ? 2 : 1;

  static int formatMonthToInt(String month) {
    switch (month) {
      case 'JAN':
        return 1;
      case 'FEV':
        return 2;
      case 'MAR':
        return 3;
      case 'ABR':
        return 4;
      case 'MAI':
        return 5;
      case 'JUN':
        return 6;
      case 'JUL':
        return 7;
      case 'AGO':
        return 8;
      case 'SET':
        return 9;
      case 'OUT':
        return 10;
      case 'NOV':
        return 11;
      case 'DEZ':
        return 12;
      default:
        return 0;
    }
  }
}
