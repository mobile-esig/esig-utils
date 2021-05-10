import 'package:intl/intl.dart';

class EsigDateUtils {
  /// Recebe String com formato 'dd-MM-aaaa hh-mm' e retorna 'dd/MM/aaaa'.
  ///
  /// Ex.: '11-10-2020 03:00' é convertido para '11/10/2020'
  static String formatDMA(String data) {
    return data.split(' ')[0].replaceAll('-', '/');
  }

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

  static DateTime formatDate(String data) {
    return DateFormat('yyyy-MM-dd').parse(data);
  }

  static String formatDateDMA(DateTime data) {
    return DateFormat("dd-MMM-yyyy", 'pt_BR')
        .format(data)
        .toUpperCase()
        .replaceAll('-', ' ');
  }

  static String formatDateDMAHMS(DateTime data) {
    return DateFormat("dd-MM-yyyy HH:mm:ss").format(data);
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

  static int bimestre(DateTime data) {
    return ((data.month - 1) / 2 + 1).toInt();
  }

  static int trimestre(DateTime data) {
    return ((data.month - 1) / 3 + 1).toInt();
  }

  static int semestre(DateTime data) {
    return data.month > 6 ? 2 : 1;
  }

  static int formatMonthToInt(String month) {
    switch (month) {
      case "JAN":
        return 1;
        break;
      case "FEV":
        return 2;
        break;
      case "MAR":
        return 3;
        break;
      case "ABR":
        return 4;
        break;
      case "MAI":
        return 5;
        break;
      case "JUN":
        return 6;
        break;
      case "JUL":
        return 7;
        break;
      case "AGO":
        return 8;
        break;
      case "SET":
        return 9;
        break;
      case "OUT":
        return 10;
        break;
      case "NOV":
        return 11;
        break;
      case "DEZ":
        return 12;
        break;
      default:
        return 0;
    }
  }
}
