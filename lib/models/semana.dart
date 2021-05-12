import 'package:esig_utils/models/dia.dart';
import 'package:esig_utils/date_utils.dart';

class Semana {
  List<Dia> dias = [];

  int primeiroDiaUtil = EsigDateUtils.monday;
  int ultimoDiaUtil = EsigDateUtils.friday +
      1; // Salva um dia a mais devido às funções de intervalo excludente, por exemplo: sublist()

  Semana(this.dias);

  List<Dia> get diasUteis {
    try {
      return this.dias.sublist(primeiroDiaUtil, ultimoDiaUtil);
    } catch (e) {
      return [];
    }
  }

  List<Dia> uteisDoAno(int ano) => this
      .dias
      .sublist(primeiroDiaUtil, ultimoDiaUtil)
      .where((dia) => dia.ano == ano)
      .toList();

  /// Verifica se [d] está entre [dias.first] e [dias.last]
  bool contem(Dia d) =>
      this.dias.first.emMilisegs <= d.emMilisegs &&
      this.dias.last.emMilisegs >= d.emMilisegs;

  /// Semana é valida se [dias] tiver 7 dias, começar do domingo e terminar no
  /// sábado. Não verifica dias entre [dias.first] e [dias.last].
  bool get valida =>
      this.dias.length == 7 &&
      this.dias.first.data.weekday == DateTime.sunday &&
      this.dias.last.data.weekday == DateTime.saturday;

  @override
  bool operator ==(s) {
    return s is Semana &&
        this.dias.first == s.dias.first &&
        this.dias.last == s.dias.last;
  }

  @override
  int get hashCode => dias.hashCode;
}
