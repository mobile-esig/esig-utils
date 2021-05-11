import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:intl/intl.dart';

class EsigUtils {
  /// Formatação aplicada à valores monetários
  static const String NUMBER_FORMAT = '###,##0.00';

  static Map<String, dynamic> addParams(
      Map<String, dynamic> map, Map<String, dynamic> objects) {
    objects.forEach((key, value) {
      if (value != null) {
        map[key] = value;
      }
    });

    return map;
  }

  static String convertToReal(double valor) {
    if (valor == 0) return "0,00";
    return NumberFormat(NUMBER_FORMAT, 'pt_BR').format(valor);
  }

  /// Recebe um inteiro que representa ou um CPF ou um CNPJ. Itentifica do que
  /// se trata com base na quantidade de dígitos.
  ///
  /// Realiza tratamento preenchendo com zeros à esquerda quando faltar
  /// caracteres. CPF deve ter 11; Já CNPJ, 14.
  ///
  /// Retorna o texto formatado.
  static String formatCpfCnpj(int cpfCnpj) {
    String strCpfCnpj = cpfCnpj.toString();

    if (strCpfCnpj.length > 11) {
      strCpfCnpj = '0' * (14 - strCpfCnpj.length) + strCpfCnpj;
      var cnpjController =
          MaskedTextController(text: strCpfCnpj, mask: '00.000.000/0000-00');
      return cnpjController.text;
    } else {
      strCpfCnpj = '0' * (11 - strCpfCnpj.length) + strCpfCnpj;
      var cpfController =
          MaskedTextController(text: strCpfCnpj, mask: '000.000.000-00');
      return cpfController.text;
    }
  }

  /// Ex: 72.123 vira '72,1K'
  ///     -72.123.123 vira '-72,1M'
  static String compactCurrencyBRFormat(double valor) =>
      NumberFormat.compactCurrency(symbol: '', decimalDigits: 1)
          .format(valor)
          .replaceFirst('.', ',');

  static String convertToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
