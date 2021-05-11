import 'package:esig_utils/extensions/date_time.dart';
import 'package:esig_utils/extensions/zero_pad.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('ZeroPad: ', () {
    test('Aplica padding em um dígito', () {
      expect(1.pad, equals('01'));
      expect(11.pad, equals('11'));
      expect(0.pad, equals('00'));
      expect(null.pad, equals(''));
    });
  });

  group('DateTime: ', () {
    test('Equal', () async {
      DateTime data1 = DateTime(2020, 1, 1);
      DateTime data2 = DateTime(2020, 1, 1);

      // Mesma data
      expect(data1.equal(data2), isTrue);

      // Mesma data, horas diferentes
      data1 = DateTime(2020, 1, 1, 1, 2, 3);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equal(data2), isTrue);

      // Datas diferentes, horas iguais
      data1 = DateTime(2020, 1, 2);
      data2 = DateTime(2020, 1, 1);
      expect(data1.equal(data2), isTrue);
    });
  });
}