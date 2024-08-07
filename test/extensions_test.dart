import 'package:esig_utils/extensions/bool_check.dart';
import 'package:esig_utils/extensions/date_time.dart';
import 'package:esig_utils/extensions/date_time_range.dart';
import 'package:esig_utils/extensions/int_ext.dart';
import 'package:esig_utils/extensions/list_ext.dart';
import 'package:esig_utils/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {});

  group('Integer Extension: ', () {
    test('Aplica padding em um dígito', () {
      expect(1.pad, equals('01'));
      expect(10.pad, equals('10'));
      expect(11.pad, equals('11'));
      expect(0.pad, equals('00'));
      expect((-1).pad, equals('-1'));
    });

    test('toDateTime', () {
      var agora = DateTime(2020, 1, 1);
      int agoraEmMilliSeconds = agora.millisecondsSinceEpoch;
      expect(agoraEmMilliSeconds, equals(1577836800000));
      expect(agoraEmMilliSeconds.toDateTime, isA<DateTime>());
      expect(agoraEmMilliSeconds.toDateTime, equals(DateTime(2020, 1, 1)));

      int? dateTimeNull;
      expect(dateTimeNull, isNull);
      //expect(dateTimeNull?.toDateTime, isNull);
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

    test('horaInicial', () {
      final d = DateTime(2022, 1, 1, 1, 1, 1);
      final horaInicial = d.horaInicial;
      expect(horaInicial, DateTime(2022, 1, 1));
      expect(d, DateTime(2022, 1, 1, 1, 1, 1));
      expect(d.isAtSameMomentAs(horaInicial), isFalse);
    });

    test('horaFinal', () {
      final d = DateTime(2022, 1, 1, 1, 1, 1);
      final horaFinal = d.horaFinal;
      expect(horaFinal, DateTime(2022, 1, 1, 23, 59, 59));
      expect(d, DateTime(2022, 1, 1, 1, 1, 1));
      expect(d.isAtSameMomentAs(horaFinal), isFalse);
    });

    test('truncateFuture', () {
      final passado = DateTime.now().subtract(const Duration(days: 1));
      final futuro = DateTime.now().add(const Duration(days: 1));

      final passadotruncado = passado.truncateFuture;
      final futurotruncado = futuro.truncateFuture;

      expect(passado.isAtSameMomentAs(passadotruncado), isTrue);
      expect(futuro.isAtSameMomentAs(futurotruncado), isFalse);
      // futuroTruncado < futuro
      expect(futuro.compareTo(futurotruncado) > 0, isTrue);
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

  group('StringExt:', () {
    test('Capitalize', () {
      String lowerCaseName = 'fulano smith çegonha | 1';
      expect(lowerCaseName.capitalize, 'Fulano smith çegonha | 1');
      expect(lowerCaseName, 'fulano smith çegonha | 1'); // Testa imutabilidade

      String upperCaseName = 'FULANO SMITH ÇEGONHA | 1';
      expect(upperCaseName.capitalize, 'Fulano smith çegonha | 1');
      expect(upperCaseName, 'FULANO SMITH ÇEGONHA | 1'); // Testa imutabilidade
    });

    test('Capitalize First of Each', () {
      String normalName = 'fulano smith çegonha | 1';
      expect(normalName.capitalizeFirstofEach, 'Fulano Smith Çegonha | 1');
      expect(normalName, 'fulano smith çegonha | 1'); // Testa imutabilidade

      String upperCaseName = 'FULANO SMITH ÇEGONHA | 1';
      expect(upperCaseName.capitalizeFirstofEach, 'Fulano Smith Çegonha | 1');
      expect(upperCaseName, 'FULANO SMITH ÇEGONHA | 1'); // Testa imutabilidade

      String randomName = ' | 1 ? ` ';
      expect(randomName.capitalizeFirstofEach, '| 1 ? `');
      expect(randomName, ' | 1 ? ` '); // Testa imutabilidade
    });

    test('firstTwoNames', () {
      String longName = 'Fulano smith çegonha da Silva';
      expect(longName.firstTwoNames, 'Fulano smith');
      expect(longName, 'Fulano smith çegonha da Silva');

      String singleName = 'Fulano';
      expect(singleName.firstTwoNames, 'Fulano');
      expect(singleName, 'Fulano');

      String noName = '';
      expect(noName.firstTwoNames, '');
      expect(noName, '');
    });
  });

  group('ListExt<T>:', () {
    test('firstOrNull', () {
      List<int> hasFirst = [0, 1, 2];
      expect(hasFirst.firstOrNull, equals(0));
      expect(hasFirst, equals([0, 1, 2]));

      List<int> noFirst = [];
      expect(noFirst.firstOrNull, isNull);
      expect(noFirst, equals([]));
    });

    test('isIndexValid', () {
      List<int> Z = [10, 11];
      expect(Z.isIndexValid(-1), isFalse);
      expect(Z.isIndexValid(0), isTrue);
      expect(Z.isIndexValid(1), isTrue);
      expect(Z.isIndexValid(2), isFalse);
      expect(Z, equals([10, 11]));

      List empty = [];
      expect(empty.isIndexValid(-1), isFalse);
      expect(empty.isIndexValid(0), isFalse);
      expect(empty, isEmpty);
    });

    test('getNullable', () {
      List<int> Z = [1, 2];
      expect(Z.getNullable(-1), isNull);
      expect(Z.getNullable(0), equals(1));
      expect(Z.getNullable(1), equals(2));
      expect(Z.getNullable(2), isNull);
      expect(Z, equals([1, 2]));
    });
  });

  group('DateTimeRange', () {
    test('toDateTimeList', () {
      final range = DateTimeRange(
        start: DateTime(2022, 1, 1),
        end: DateTime(2022, 1, 31),
      );

      final dateTimes = range.toDateTimeList;

      expect(dateTimes, isA<List<DateTime>>());
      expect(dateTimes.length, equals(31));
      expect(dateTimes.first, equals(DateTime(2022, 1, 1)));
      expect(dateTimes.last, equals(DateTime(2022, 1, 31)));
    });

    test('intervaloDeUmDia', () {
      final rangeDia = DateTimeRange(
        start: DateTime(2022, 1, 1),
        end: DateTime(2022, 1, 1),
      );

      final rangeAno = DateTimeRange(
        start: DateTime(2022, 1, 1),
        end: DateTime(2023, 1, 1),
      );

      expect(rangeDia.intervaloDeUmDia, isTrue);
      expect(rangeAno.intervaloDeUmDia, isFalse);
    });
  });
}
