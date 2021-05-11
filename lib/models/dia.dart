class Dia {
  DateTime data = DateTime(0);
  bool presente = false;
  bool houveAula = false;

  Dia(int ano, int mes, int dia) {
    if (mes < 1) mes = 1;
    if (mes > 12) mes = 12;

    data = DateTime(ano, mes, dia);
  }
  Dia.fromDateTime(DateTime d) {
    data = d;
  }

  int get ano => this.data.year;
  int get mes => this.data.month;
  int get dia => this.data.day;

  @override
  bool operator ==(d) {
    return d is Dia &&
        this.ano == d.ano &&
        this.mes == d.mes &&
        this.dia == d.dia;
  }

  @override
  int get hashCode => data.hashCode;

  String toString() => this.data.toString();

  Dia get maisUmDia => Dia.fromDateTime(this.data.add(Duration(days: 1)));
  Dia get menosUmDia => Dia.fromDateTime(this.data.subtract(Duration(days: 1)));
  bool get primeiroDoMes => this.data.day == 1;
  bool get util =>
      this.data.weekday >= DateTime.monday &&
      this.data.weekday <= DateTime.friday;
  int get emMilisegs => this.data.millisecondsSinceEpoch;
  Dia get copia => Dia(this.data.year, this.data.month, this.data.day);
}
