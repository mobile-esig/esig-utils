import 'package:esig_utils/models/dia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Dia dia;
  group('Dia: ', () {
    test('construção', () {
      /// Construção de dia comum
      dia = Dia(1, 1, 1);
      expect(dia, Dia(1, 1, 1));

      /// Limite superior de mês é 12
      dia = Dia(2020, 13, 1);
      expect(dia, Dia(2020, 12, 1));

      /// Limite inferior de mês é 1
      dia = Dia(2020, 0, 1);
      expect(dia, Dia(2020, 1, 1));

      /// A partir de um DateTime comum
      dia = Dia.fromDateTime(DateTime(2020, 12, 31));
      expect(dia, Dia(2020, 12, 31));

      /// A partir de um DateTime com último dia de janeiro
      dia = Dia.fromDateTime(DateTime(2020, 2, 0));
      expect(dia, Dia(2020, 1, 31));
    });

    test('extensions', () {
      /// maisUmDia deve retornar outro objeto com um dia a mais
      dia = Dia(2020, 1, 31);
      Dia amanha = dia.maisUmDia;
      expect(amanha.hashCode != dia.hashCode, true);
      expect(amanha, Dia(2020, 2, 1));

      /// maisUmDia deve retornar outro objeto com um dia a mais
      dia = Dia(2020, 12, 31);
      amanha = dia.maisUmDia;
      expect(amanha.hashCode != dia.hashCode, true);
      expect(amanha, Dia(2021, 1, 1));

      dia = Dia(2021, 1, 1);
      Dia copia = dia.copia;
      expect(copia == dia, isTrue);
      dia = Dia(2020, 2, 2);
      expect(copia == dia, isFalse);
    });
  });

  test('faltas', () {
    Dia d = Dia(2021, 1, 1);

    expect(d.qtdFaltas, equals(0));
    expect(d.qtdHorarios, equals(0));
    expect(d.qtdPresencas, equals(0));

    d.qtdFaltas = 5;
    d.qtdHorarios = 10;
    expect(d.qtdFaltas, equals(5));
    expect(d.qtdHorarios, equals(10));
    expect(d.qtdPresencas, equals(5));

    d.qtdFaltas = 10;
    d.qtdHorarios = 5;
    expect(d.qtdFaltas, equals(10));
    expect(d.qtdHorarios, equals(5));
    expect(d.qtdPresencas, equals(-5));
  });
}
