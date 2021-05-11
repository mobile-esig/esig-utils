import 'package:flutter_test/flutter_test.dart';

import '../lib/esig_utils.dart';

void main() {
  setUp(() {});

  group('Mask formatter: ', () {
    test('CPF', () async {
      String cpf;

      // Dígitos não nulos
      cpf = EsigUtils.formatCpfCnpj(18398328428);
      expect(cpf, '183.983.284-28');

      // Faltando 2 dígitos
      cpf = EsigUtils.formatCpfCnpj(398328428);
      expect(cpf, '003.983.284-28');

      // Somente um dígito
      cpf = EsigUtils.formatCpfCnpj(1);
      expect(cpf, '000.000.000-01');
    });

    test('CNPJ', () async {
      String cnpj;

      /// Dígitos não nulos
      cnpj = EsigUtils.formatCpfCnpj(19560156000155);
      expect(cnpj, '19.560.156/0001-55');

      /// Faltando 2 dígitos
      cnpj = EsigUtils.formatCpfCnpj(560156000155);
      expect(cnpj, '00.560.156/0001-55');

      /// Faltando 3 dígitos, já é considerado um CPF
    });
  });

  group('convertToReal: ', () {
    test('valores positivos', () {
      expect(EsigUtils.convertToReal(0), '0,00');
      expect(EsigUtils.convertToReal(1), '1,00');
      expect(EsigUtils.convertToReal(1000), '1.000,00');
      expect(EsigUtils.convertToReal(-1000000), '-1.000.000,00');
    });
  });

  group('formatValuesToResume: ', () {
    test('valores positivos', () {
      expect(EsigUtils.compactCurrencyBRFormat(72), '72,0');
      expect(EsigUtils.compactCurrencyBRFormat(721), '721');
      expect(EsigUtils.compactCurrencyBRFormat(7212), '7,21K');
      expect(EsigUtils.compactCurrencyBRFormat(72123), '72,1K');
      expect(EsigUtils.compactCurrencyBRFormat(721234), '721K');
      expect(EsigUtils.compactCurrencyBRFormat(72123456), '72,1M');
    });

    test('valores negativos', () {
      expect(EsigUtils.compactCurrencyBRFormat(-72), '-72,0');
      expect(EsigUtils.compactCurrencyBRFormat(-721), '-721');
      expect(EsigUtils.compactCurrencyBRFormat(-7212), '-7,21K');
      expect(EsigUtils.compactCurrencyBRFormat(-72123), '-72,1K');
      expect(EsigUtils.compactCurrencyBRFormat(-721234), '-721K');
      expect(EsigUtils.compactCurrencyBRFormat(-72123456), '-72,1M');
    });
  });
}
