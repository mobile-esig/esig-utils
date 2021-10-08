import 'package:esig_utils/esig_utils.dart';
import 'package:esig_utils/extensions/list_ext.dart';

extension StringExt on String {
  /// Faz com que apenas o caractere inicial da String seja maiúsculo
  String get capitalize =>
      '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';

  /// Aplica o capitalize em todas as palavras separadas por ' ' da String
  String get capitalizeFirstofEach =>
      this.trim().split(' ').map((str) => str.capitalize).join(' ');

  String get firstTwoNames {
    final nomes = this.split(' ');
    return EsigUtils.textoSeparado(
        nomes.getNullable(0), nomes.getNullable(1), ' ');
  }
}
