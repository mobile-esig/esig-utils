import 'package:esig_utils/extensions/date_time.dart';
import 'package:esig_utils/extensions/zero_pad.dart';
import 'package:esig_utils/extensions/bool_check.dart';
import 'package:esig_utils/extensions/string_ext.dart';
import 'package:esig_utils/extensions/list_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('ZeroPad: ', () {
    test('Aplica padding em um dígito', () {
      expect(1.pad, equals('01'));
      expect(11.pad, equals('11'));
      expect(0.pad, equals('00'));
    });
  });

  group('DateTime: ', () {
    test('EqualDate', () async {
      DateTime data1 = DateTime(2020, 1, 1);
      DateTime data2 = DateTime(2020, 1, 1);

      // Mesma data
      expect(data1.equalDate(data2), isTrue);

      // Mesma data, horas diferentes
      data1 = DateTime(2020, 1, 1, 1, 2, 3);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equalDate(data2), isTrue);

      // Datas diferentes, horas iguais
      data1 = DateTime(2020, 1, 2);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equalDate(data2), isFalse);
    });

    test('EqualTime', () async {
      DateTime data1 = DateTime(2020, 1, 1);
      DateTime data2 = DateTime(2020, 1, 1);

      // Mesma data
      expect(data1.equalTime(data2), isTrue);

      // Mesma data, horas diferentes
      data1 = DateTime(2020, 1, 1, 1, 2, 3);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equalTime(data2), isFalse);

      // Datas diferentes, horas iguais
      data1 = DateTime(2020, 1, 2);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equalTime(data2), isTrue);
    });

    test('FormattedDate', () {
      DateTime data = DateTime(2020, 1, 1);

      // Data comum
      expect(data.formattedDate(), equals('01/01/2020'));

      // Separador
      expect(data.formattedDate('-'), equals('01-01-2020'));
    });

    test('FormattedTime', () {
      DateTime data = DateTime(2020, 1, 1, 23, 59, 00);

      // Data comum com segundos e separador padrão
      expect(data.formattedTime(), equals('23:59:00'));

      // Excluir segundos
      expect(data.formattedTime(false), equals('23:59'));

      // Separador
      expect(data.formattedTime(true, '-'), equals('23-59-00'));
    });
  });

  group('Bool Check:', () {
    test('Check', () {
      bool? a;
      expect(a, null);
      expect(a.check, false);

      a = true;
      expect(a, true);
      expect(a.check, true);

      a = false;
      expect(a, false);
      expect(a.check, false);
    });
  });

  group('CapitalizeExtension:', () {
    test('Capitalize', () {
      String a = 'fulano smith çegonha | 1';

      expect(a.capitalize, 'Fulano smith çegonha | 1');
      expect(a, 'fulano smith çegonha | 1'); // Testa imutabilidade
    });

    test('Capitalize First of Each', () {
      String a = 'fulano smith çegonha | 1';

      expect(a.capitalizeFirstofEach, 'Fulano Smith Çegonha | 1');
      expect(a, 'fulano smith çegonha | 1'); // Testa imutabilidade
    });
  });

  group('ListExt<T>', () {
    test('firstOrNull', () {
      List<int> hasFirst = [0, 1, 2];
      expect(hasFirst.firstOrNull, equals(0));
      expect(hasFirst, equals([0, 1, 2]));

      List<int> noFirst = [];
      expect(noFirst.firstOrNull, isNull);
      expect(noFirst, equals([]));
    });
  });
}
