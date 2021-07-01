import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:intl/intl.dart';

class EsigUtils {
  /// Formatação aplicada à valores monetários
  static const String NUMBER_FORMAT = '###,##0.00';

  static Map<String, dynamic> addParams(
    Map<String, dynamic> map,
    Map<String, dynamic> objects,
  ) {
    objects.forEach((key, value) {
      if (value != null) {
        map[key] = value;
      }
    });

    return map;
  }

  static String convertToReal(double valor) {
    if (valor == 0) return '0,00';
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
      strCpfCnpj = strCpfCnpj.padLeft(14, '0');
      var cnpjController =
          MaskedTextController(text: strCpfCnpj, mask: '00.000.000/0000-00');
      return cnpjController.text;
    } else {
      strCpfCnpj = strCpfCnpj.padLeft(11, '0');
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

  /// Usado em senhas
  static String convertToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  /// Retorna String "[s1][separador][s2]", quando [s1] e [s2] são não nulos.
  /// Retorna somente uma das Strings quando a outra for nula.
  static String textoSeparado(String? s1, String? s2, String? separador) {
    if (s1 != null && s2 != null && separador != null)
      return s1 + separador + s2;

    if (s1 != null) return s1;

    if (s2 != null) return s2;

    return '';
  }
}
