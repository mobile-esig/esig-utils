import 'package:esig_utils/esig_utils.dart';
import 'package:flutter/material.dart';
import 'date_time.dart';

extension DateTimeRangeExtension on DateTimeRange {
  bool get intervaloDeUmDia => start.equalDate(end);

  /// Retorna intervalo formatado com datas inicial e final separadas por [separador]
  String formattedDateRange([String separadador = ' à ']) {
    if (intervaloDeUmDia) {
      return start.formattedDate();
    } else {
      return EsigUtils.textoSeparado(
        start.formattedDate(),
        end.formattedDate(),
        separadador,
      );
    }
  }

  List<DateTime> get toDateTimeList => List<DateTime>.generate(
        duration.inDays + 1,
        (index) => start.add(
          Duration(days: index),
        ),
      );
}
