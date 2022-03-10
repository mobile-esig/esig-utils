@Deprecated('Dia será removido em releases futuras e não deve ser usado')
class Dia {
  late DateTime data;

  /// Quantidade de horários neste [Dia]
  int qtdHorarios = 0;

  /// Quantos horários o aluno faltou neste [Dia].
  /// OBS: `qtdPresencas = qtdHorario - qtdFaltas`
  int qtdFaltas = 0;

  /// Indica se houve aula neste dia
  bool houveAula = false;

  Dia(int ano, int mes, int dia) {
    if (mes < 1) mes = 1;
    if (mes > 12) mes = 12;

    data = DateTime(ano, mes, dia);
  }
  Dia.fromDateTime(DateTime d) {
    data = d;
  }

  int get ano => data.year;
  int get mes => data.month;
  int get dia => data.day;

  int get qtdPresencas => qtdHorarios - qtdFaltas;

  @override
  bool operator ==(other) {
    return other is Dia &&
        ano == other.ano &&
        mes == other.mes &&
        dia == other.dia;
  }

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => data.toString();

  Dia get maisUmDia => Dia.fromDateTime(data.add(const Duration(days: 1)));
  Dia get menosUmDia => Dia.fromDateTime(data.subtract(const Duration(days: 1)));
  bool get primeiroDoMes => data.day == 1;
  bool get util =>
      data.weekday >= DateTime.monday &&
      data.weekday <= DateTime.friday;
  int get emMilisegs => data.millisecondsSinceEpoch;
  Dia get copia => Dia(data.year, data.month, data.day);
}
