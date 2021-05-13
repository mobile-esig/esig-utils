import 'package:esig_utils/extensions/zero_pad.dart';

extension DateTimExt on DateTime {
  equal(DateTime d) =>
      this.day == d.day && this.month == d.month && this.year == d.year;

  get formattedDate => '${this.day.pad}/${this.month.pad}/${this.year}';
  get formattedTime => '${this.hour.pad}:${this.minute.pad}:${this.second.pad}';
}
