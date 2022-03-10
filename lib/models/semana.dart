import 'package:esig_utils/models/dia.dart';
import 'package:esig_utils/date_utils.dart';

@Deprecated('Semana será removida em releases futuras e não deve ser usada')
class Semana {
  List<Dia> dias = [];

  int primeiroDiaUtil = EsigDateUtils.monday;
  int ultimoDiaUtil = EsigDateUtils.friday +
      1; // Salva um dia a mais devido às funções de intervalo excludente, por exemplo: sublist()

  Semana(this.dias);

  List<Dia> get diasUteis {
    try {
      return dias.sublist(primeiroDiaUtil, ultimoDiaUtil);
    } catch (e) {
      return [];
    }
  }

  List<Dia> uteisDoAno(int ano) => dias
      .sublist(primeiroDiaUtil, ultimoDiaUtil)
      .where((dia) => dia.ano == ano)
      .toList();

  /// Verifica se [d] está entre [dias.first] e [dias.last]
  bool contem(Dia d) =>
      dias.first.emMilisegs <= d.emMilisegs &&
      dias.last.emMilisegs >= d.emMilisegs;

  /// Semana é valida se [dias] tiver 7 dias, começar do domingo e terminar no
  /// sábado. Não verifica dias entre [dias.first] e [dias.last].
  bool get valida =>
      dias.length == 7 &&
      dias.first.data.weekday == DateTime.sunday &&
      dias.last.data.weekday == DateTime.saturday;

  @override
  bool operator ==(other) {
    return other is Semana &&
        dias.first == other.dias.first &&
        dias.last == other.dias.last;
  }

  @override
  int get hashCode => dias.hashCode;
}
