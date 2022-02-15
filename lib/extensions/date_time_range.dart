import 'package:esig_utils/esig_utils.dart';
import 'package:flutter/material.dart';
import 'date_time.dart';

extension DateTimeRangeExtension on DateTimeRange {
  bool get intervaloDeUmDia => this.start.equalDate(this.end);

  /// Retorna intervalo formatado com datas inicial e final separadas por [separador]
  String formattedDateRange([String separadador = ' à ']) {
    if (intervaloDeUmDia) {
      return this.start.formattedDate();
    } else {
      return EsigUtils.textoSeparado(
        this.start.formattedDate(),
        this.end.formattedDate(),
        separadador,
      );
    }
  }
}
