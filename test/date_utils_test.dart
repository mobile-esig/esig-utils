// ignore_for_file: deprecated_member_use_from_same_package

import 'package:esig_utils/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

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
    test('datetimeFromString', () {
      var d = EsigDateUtils.datetimeFromString('01/02/2022');
      expect(d, DateTime(2022, 2, 1));

      d = EsigDateUtils.datetimeFromString('01-02-2022', format: 'dd-MM-yyyy');
      expect(d, DateTime(2022, 2, 1));

      d = EsigDateUtils.datetimeFromString('01/02/2022 03:59',
          format: 'dd/MM/yyyy HH:mm');
      expect(d, DateTime(2022, 2, 1, 3, 59));
    });

    test('getNomeMeses', () {
      int i = 1;
      for (var nomeMes in nomesMeses) {
        expect(EsigDateUtils.getNomeMeses([i]), nomeMes);
        i++;
      }

      for (i = DateTime.january; i <= DateTime.december; i++) {
        for (int j = DateTime.january; j <= DateTime.december; j++) {
          expect(EsigDateUtils.getNomeMeses([i, j]),
              '${nomesMeses[i - 1]} / ${nomesMeses[j - 1]}');
        }
      }
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
