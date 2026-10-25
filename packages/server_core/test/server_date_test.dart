import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('parseServerDate', () {
    test('a date the server sent comes back as sent', () {
      final date = parseServerDate('2026-10-24T23:00:00.0000000Z');

      expect(date, DateTime.utc(2026, 10, 24, 23));
      expect(date!.isUtc, isTrue);
    });

    test('a date-only value stays on its day', () {
      expect(parseServerDate('2005-09-22T00:00:00.0000000Z'),
          DateTime.utc(2005, 9, 22));
    });

    test('a missing, empty or unreadable date is null', () {
      expect(parseServerDate(null), isNull);
      expect(parseServerDate(''), isNull);
      expect(parseServerDate('not a date'), isNull);
      expect(parseServerDate(42), isNull);
    });

    // .NET's DateTime.MinValue, which Jellyfin and Emby send for a date they
    // don't have. In local time west of UTC it would fall in year 0.
    test('the .NET minimum date is null', () {
      expect(parseServerDate('0001-01-01T00:00:00.0000000Z'), isNull);
      expect(parseServerDate('0001-01-01T00:00:00'), isNull);
    });

    test('a minimum date already shifted into year 0 is null', () {
      expect(parseServerDate('0001-01-01T03:00:00+05:00'), isNull);
      expect(parseServerDate('0000-12-31T19:03:58-04:56'), isNull);
    });
  });
}
