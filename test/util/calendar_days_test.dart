import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/calendar_days.dart';

void main() {
  group('calendarDaysBetween', () {
    test('counts dates, not elapsed hours', () {
      expect(
        calendarDaysBetween(DateTime(2026, 10, 24, 23, 30), DateTime(2026, 10, 25, 0, 30)),
        1,
      );
      expect(
        calendarDaysBetween(DateTime(2026, 10, 24, 0, 30), DateTime(2026, 10, 24, 23, 30)),
        0,
      );
      expect(
        calendarDaysBetween(DateTime(2026, 10, 25, 1), DateTime(2026, 10, 23, 23)),
        -2,
      );
    });

    // US zones: the clocks go forward on Mar 14 2027 and back on Nov 1 2026,
    // making those local days 23 and 25 hours long.
    test('a daylight saving change does not shorten or stretch a day', () {
      expect(calendarDaysBetween(DateTime(2027, 3, 14), DateTime(2027, 3, 15)), 1);
      expect(calendarDaysBetween(DateTime(2027, 3, 13), DateTime(2027, 3, 15)), 2);
      expect(calendarDaysBetween(DateTime(2026, 11, 1), DateTime(2026, 11, 2)), 1);
    });

    test('crosses months and years', () {
      expect(calendarDaysBetween(DateTime(2026, 12, 31, 22), DateTime(2027, 1, 1, 2)), 1);
      expect(calendarDaysBetween(DateTime(2028, 2, 28), DateTime(2028, 3, 1)), 2);
    });
  });
}
