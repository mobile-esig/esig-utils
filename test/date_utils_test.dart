import 'package:esig_utils/models/dia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../lib/date_utils.dart';

void main() {
  initializeDateFormatting('pt_BR', null);

  final nomesMeses = [
    'JANEIRO',
    'FEVEREIRO',
    'MARÇO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO',
  ];

  group('EsigDateUtils: ', () {
    Dia dia;
    List<Dia> dias;

    test('Extensions', () {
      dia = Dia(2020, 1, 1);
      expect(dia.menosUmDia, Dia(2019, 12, 31));

      dia = dia.menosUmDia;
      expect(dia.maisUmDia, Dia(2020, 1, 1));

      dia = Dia(2020, 10, 25); // domingo
      var diaUtil = [false, true, true, true, true, true, false];

      diaUtil.forEach((du) {
        expect(dia.util, du);
        dia = dia.maisUmDia;
      });
    });

    test('strDMAToDia', () {
      expect(EsigDateUtils.strDiaMesAnoToDia('02-03-2020'), Dia(2020, 3, 2));
      expect(EsigDateUtils.strDiaMesAnoToDia('01-02-2021'), Dia(2021, 2, 1));
    });

    test('getNomeDiaSemana', () {
      var diaNomes = [
        'DOMINGO',
        'SEGUNDA-FEIRA',
        'TERÇA-FEIRA',
        'QUARTA-FEIRA',
        'QUINTA-FEIRA',
        'SEXTA-FEIRA',
        'SÁBADO'
      ];
      dia = Dia(2020, 10, 25);

      diaNomes.forEach((diaNome) {
        expect(EsigDateUtils.getNomeDiaSemana(dia), diaNome);
        dia = dia.maisUmDia;
      });
    });

    test('getPrimeiroDomingo', () {
      // Passando dia perto do final do mês
      dia = Dia(2020, 10, 30);
      expect(EsigDateUtils.getPrimeiroDomingo(dia), Dia(2020, 9, 27));

      // Passando primeiro dia do mês
      dia = Dia(2020, 9, 1);
      expect(EsigDateUtils.getPrimeiroDomingo(dia), Dia(2020, 8, 30));

      // Passando primeiro dia do mês
      dia = Dia(2020, 10, 1);
      expect(EsigDateUtils.getPrimeiroDomingo(dia), Dia(2020, 9, 27));
    });

    test('getUltimoSabado', () {
      // Passando o próprio resultado
      dia = Dia(2020, 10, 31);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 31));

      // Passando primeiro dia do mês
      dia = Dia(2020, 9, 1);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 3));

      // Passando dia perto do final do mês
      dia = Dia(2020, 10, 30);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 31));
    });

    test('último dia do mês', () {
      expect(Dia(2020, 10, 0), Dia(2020, 9, 30));
      expect(Dia(2020, 11, 0), Dia(2020, 10, 31));
      expect(Dia(2021, 1, 0), Dia(2020, 12, 31));
    });

    test('ultimoSabado', () {
      // Passando dia perto do final do mês
      dia = Dia(2020, 10, 30);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 31));

      // Passando primeiro dia do mês
      dia = Dia(2020, 9, 1);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 3));

      // Passando primeiro dia do mês
      dia = Dia(2020, 10, 1);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 10, 31));

      // Passando último dia do ano 2020
      dia = Dia(2020, 12, 31);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2021, 1, 2));

      // Passando primeiro dia do ano 2020
      dia = Dia(2020, 1, 1);
      expect(EsigDateUtils.getUltimoSabado(dia), Dia(2020, 2, 1));
    });

    test('getNomeMeses', () {
      int i = 1;
      nomesMeses.forEach((nomeMes) {
        expect(EsigDateUtils.getNomeMeses([i]), nomeMes);
        i++;
      });

      for (i = DateTime.january; i <= DateTime.december; i++) {
        for (int j = DateTime.january; j <= DateTime.december; j++) {
          expect(EsigDateUtils.getNomeMeses([i, j]),
              '${nomesMeses[i - 1]} / ${nomesMeses[j - 1]}');
        }
      }
    });

    test('getListaDias', () {
      // Passando primeiro e último dia de outubro
      dias = EsigDateUtils.getListaDias(Dia(2020, 10, 1), Dia(2020, 10, 31));
      expect(dias.length, 31);
      expect(dias.first, Dia(2020, 10, 1));
      expect(dias.last, Dia(2020, 10, 31));

      /// Passando ano bissexto
      dias = EsigDateUtils.getListaDias(Dia(2020, 1, 1), Dia(2020, 12, 31));
      expect(dias.length, 366);

      /// Passando ano não bissexto
      dias = EsigDateUtils.getListaDias(Dia(2019, 1, 1), Dia(2019, 12, 31));
      expect(dias.length, 365);

      /// Passando um [ultimo] antes de [inicio]
      dias = EsigDateUtils.getListaDias(Dia(2020, 2, 1), Dia(2020, 1, 1));
      expect(dias.length, 0);

      /// Função não deve alterar valores de [inicio] e [fim]
      Dia inicio = Dia(2020, 1, 1), fim = Dia(2020, 2, 31);
      dias = EsigDateUtils.getListaDias(inicio, fim);
      expect(inicio, Dia(2020, 1, 1));
      expect(fim, Dia(2020, 2, 31));
    });

    test('Bimestre', () async {
      expect(EsigDateUtils.bimestre(DateTime(2020, 01, 01)), 1);
      expect(EsigDateUtils.bimestre(DateTime(2020, 02, 01)), 1);

      expect(EsigDateUtils.bimestre(DateTime(2020, 03, 01)), 2);
      expect(EsigDateUtils.bimestre(DateTime(2020, 04, 01)), 2);

      expect(EsigDateUtils.bimestre(DateTime(2020, 05, 01)), 3);
      expect(EsigDateUtils.bimestre(DateTime(2020, 06, 01)), 3);

      expect(EsigDateUtils.bimestre(DateTime(2020, 07, 01)), 4);
      expect(EsigDateUtils.bimestre(DateTime(2020, 08, 01)), 4);

      expect(EsigDateUtils.bimestre(DateTime(2020, 09, 01)), 5);
      expect(EsigDateUtils.bimestre(DateTime(2020, 10, 01)), 5);

      expect(EsigDateUtils.bimestre(DateTime(2020, 11, 01)), 6);
      expect(EsigDateUtils.bimestre(DateTime(2020, 12, 01)), 6);
    });

    test('Trimestre', () async {
      expect(EsigDateUtils.trimestre(DateTime(2020, 01, 01)), 1);
      expect(EsigDateUtils.trimestre(DateTime(2020, 02, 01)), 1);
      expect(EsigDateUtils.trimestre(DateTime(2020, 03, 01)), 1);

      expect(EsigDateUtils.trimestre(DateTime(2020, 04, 01)), 2);
      expect(EsigDateUtils.trimestre(DateTime(2020, 05, 01)), 2);
      expect(EsigDateUtils.trimestre(DateTime(2020, 06, 01)), 2);

      expect(EsigDateUtils.trimestre(DateTime(2020, 07, 01)), 3);
      expect(EsigDateUtils.trimestre(DateTime(2020, 08, 01)), 3);
      expect(EsigDateUtils.trimestre(DateTime(2020, 09, 01)), 3);

      expect(EsigDateUtils.trimestre(DateTime(2020, 10, 01)), 4);
      expect(EsigDateUtils.trimestre(DateTime(2020, 11, 01)), 4);
      expect(EsigDateUtils.trimestre(DateTime(2020, 12, 01)), 4);
    });

    test('Semestre', () async {
      expect(EsigDateUtils.semestre(DateTime(2020, 01, 01)), 1);
      expect(EsigDateUtils.semestre(DateTime(2020, 02, 01)), 1);
      expect(EsigDateUtils.semestre(DateTime(2020, 03, 01)), 1);
      expect(EsigDateUtils.semestre(DateTime(2020, 04, 01)), 1);
      expect(EsigDateUtils.semestre(DateTime(2020, 05, 01)), 1);
      expect(EsigDateUtils.semestre(DateTime(2020, 06, 01)), 1);

      expect(EsigDateUtils.semestre(DateTime(2020, 07, 01)), 2);
      expect(EsigDateUtils.semestre(DateTime(2020, 08, 01)), 2);
      expect(EsigDateUtils.semestre(DateTime(2020, 09, 01)), 2);
      expect(EsigDateUtils.semestre(DateTime(2020, 10, 01)), 2);
      expect(EsigDateUtils.semestre(DateTime(2020, 11, 01)), 2);
      expect(EsigDateUtils.semestre(DateTime(2020, 12, 01)), 2);
    });
  });
}
