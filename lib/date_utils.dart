import 'package:esig_utils/models/dia.dart';
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
  ///
  /// Ex.: '11-10-2020 03:00' é convertido para '11/10/2020'
  static String formatDMA(String data) {
    return data.split(' ')[0].replaceAll('-', '/');
  }

  /// Recebe String no formato 'dd-MM-yyyy' e retorna um [Dia] correspondente
  static Dia strDiaMesAnoToDia(String data) {
    return Dia.fromDateTime(DateFormat('dd-MM-yyyy').parse(data));
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

  static DateTime formatDate(String data) {
    return DateFormat('yyyy-MM-dd').parse(data);
  }

  @Deprecated('Usar formatDateTime(...) passando a data e o formato desejado')
  static String formatDateDMA(DateTime data) {
    return '';
  }

  static String formatDateTime(DateTime data,
      {String format = 'dd/MM/yyyy HH:mm:ss'}) {
    return DateFormat(format, 'pt_BR').format(data);
  }

  static String getNomeDiaSemana(Dia dia) {
    return DateFormat.EEEE('pt_BR').format(dia.data).toUpperCase();
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

    datasComMes.forEach((data) {
      nomes.add(DateFormat.MMMM('pt_BR').format(data).toUpperCase());
    });

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

  /// Começa busca pelo 1º dia do mês de [dia]
  static Dia getPrimeiroDomingo(Dia dia) {
    Dia primeiroDomingo = Dia(dia.ano, dia.mes, 1);

    while (primeiroDomingo.data.weekday != DateTime.sunday) {
      primeiroDomingo = primeiroDomingo.menosUmDia;
    }

    return primeiroDomingo;
  }

  /// Começa busca pelo último dia do mês do [dia] passado
  static Dia getUltimoSabado(Dia dia) {
    Dia ultimoSabado = dia.mes == DateTime.december
        ? Dia(dia.ano, DateTime.december, 31)
        : Dia(dia.ano, dia.mes + 1, 0);

    while (ultimoSabado.data.weekday != DateTime.saturday) {
      ultimoSabado = ultimoSabado.maisUmDia;
    }

    return ultimoSabado;
  }

  static List<Dia> getListaDias(Dia primeiro, Dia ultimo) {
    List<Dia> lista = [];
    Dia atual = primeiro.copia;

    while (atual.data.compareTo(ultimo.data) <= 0) {
      lista.add(atual);
      atual = atual.maisUmDia;
    }

    return lista;
  }
}
