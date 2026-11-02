import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/screens/admin/widgets/activity_log_ui.dart';

void main() {
  final l10n = AppLocalizationsEn();

  // The server sends UTC, so each entry is made at a local time and sent that way.
  String bucket(DateTime localEntry, DateTime localNow) =>
      activityBucketLabel(localEntry.toUtc(), l10n, now: localNow);

  group('activity headings follow the local calendar', () {
    final now = DateTime(2026, 10, 25, 3);

    test('earlier today is Today', () {
      expect(bucket(DateTime(2026, 10, 25, 0, 30), now), l10n.adminActivityToday);
    });

    test('late yesterday is Yesterday', () {
      expect(bucket(DateTime(2026, 10, 24, 23), now), l10n.adminActivityYesterday);
    });

    test('late the day before yesterday is Older, though under 48 hours ago', () {
      expect(bucket(DateTime(2026, 10, 23, 23), now), l10n.adminActivityOlder);
    });
  });

  test('an older entry shows its local date', () {
    final today = DateTime.now();
    final entry = DateTime(today.year, today.month, today.day - 10, 23, 30);

    expect(
      activityTimeAgo(entry.toUtc(), l10n),
      l10n.adminActivityDateShort(entry.month, entry.day),
    );
  });
}
