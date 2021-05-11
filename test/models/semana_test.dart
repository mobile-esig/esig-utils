import 'package:esig_utils/models/dia.dart';
import 'package:esig_utils/models/semana.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/date_utils.dart';

void main() {
  group('Semana:', () {
    Semana s;
    test('construção', () {
      /// Semana que começa em 2019 e termina em 2020
      s = Semana(
          EsigDateUtils.getListaDias(Dia(2019, 12, 29), Dia(2020, 1, 4)));
      expect(s.primeiroDiaUtil, EsigDateUtils.monday);
      expect(s.ultimoDiaUtil, EsigDateUtils.friday + 1);
      expect(s.dias.length, 7);

      /// Semana sem dias
      s = Semana([]);
      expect(s.primeiroDiaUtil, EsigDateUtils.monday);
      expect(s.ultimoDiaUtil, EsigDateUtils.friday + 1);
      expect(s.dias.length, 0);
    });

    test('diasUteis', () {
      /// Semana comum
      s = Semana(
          EsigDateUtils.getListaDias(Dia(2019, 12, 29), Dia(2020, 1, 4)));
      expect(s.diasUteis.length, 5);

      /// Semana sem dias
      s = Semana([]);
      expect(s.diasUteis.length, 0);
    });

    test('uteisDoAno', () {
      /// Semana que começa em 2019 e termina em 2020
      s = Semana(
          EsigDateUtils.getListaDias(Dia(2019, 12, 29), Dia(2020, 1, 4)));
      expect(s.uteisDoAno(2020), [
        Dia(2020, 1, 1),
        Dia(2020, 1, 2),
        Dia(2020, 1, 3),
      ]);
      expect(s.uteisDoAno(2019), [Dia(2019, 12, 30), Dia(2019, 12, 31)]);
    });
  });
}
