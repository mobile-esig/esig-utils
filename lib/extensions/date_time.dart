import 'package:esig_utils/extensions/zero_pad.dart';

extension DateTimExt on DateTime {
  bool equal(DateTime d) =>
      this.day == d.day && this.month == d.month && this.year == d.year;

  String get formattedDate => '${this.day.pad}/${this.month.pad}/${this.year}';
  String get formattedTime => '${this.hour.pad}:${this.minute.pad}:${this.second.pad}';
}
