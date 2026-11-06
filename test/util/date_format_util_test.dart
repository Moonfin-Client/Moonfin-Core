import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/date_format_util.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
  });
  group('date_format_util', () {
    final testDate = DateTime(2026, 11, 19, 14, 30);

    test('formatShortDate respects explicit settings', () {
      expect(
        formatShortDate(testDate, setting: DateFormatSetting.monthDay),
        'Nov 19',
      );
      expect(
        formatShortDate(testDate, setting: DateFormatSetting.dayMonth),
        '19 Nov',
      );
      expect(
        formatShortDate(testDate, locale: 'en_US', setting: DateFormatSetting.system),
        'Nov 19',
      );
      expect(
        formatShortDate(testDate, locale: 'en_GB', setting: DateFormatSetting.system),
        '19 Nov',
      );
    });

    test('formatShortDayName respects explicit settings', () {
      expect(
        formatShortDayName(testDate, setting: DateFormatSetting.monthDay),
        'Thu, Nov 19',
      );
      expect(
        formatShortDayName(testDate, setting: DateFormatSetting.dayMonth),
        'Thu 19 Nov',
      );
    });

    test('formatFullCalendarDate respects explicit settings', () {
      expect(
        formatFullCalendarDate(testDate, setting: DateFormatSetting.monthDay),
        'Thursday, November 19, 2026',
      );
      expect(
        formatFullCalendarDate(testDate, setting: DateFormatSetting.dayMonth),
        'Thursday, 19 November 2026',
      );
      expect(
        formatFullCalendarDate(
          testDate,
          setting: DateFormatSetting.monthDay,
          includeYear: false,
        ),
        'Thursday, November 19',
      );
      expect(
        formatFullCalendarDate(
          testDate,
          setting: DateFormatSetting.dayMonth,
          includeYear: false,
        ),
        'Thursday, 19 November',
      );
    });

    test('date format functions read from UserPreferences when registered', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      addTearDown(() => GetIt.instance.unregister<UserPreferences>());

      await prefs.set(UserPreferences.dateFormat, DateFormatSetting.dayMonth);
      expect(formatShortDate(testDate), '19 Nov');
      expect(formatShortDayName(testDate), 'Thu 19 Nov');
      expect(formatFullCalendarDate(testDate), 'Thursday, 19 November 2026');

      await prefs.set(UserPreferences.dateFormat, DateFormatSetting.monthDay);
      expect(formatShortDate(testDate), 'Nov 19');
      expect(formatShortDayName(testDate), 'Thu, Nov 19');
      expect(formatFullCalendarDate(testDate), 'Thursday, November 19, 2026');
    });

    test('falls back gracefully to en_US for locales lacking intl symbols', () {
      expect(
        formatShortDate(testDate, locale: 'ug', setting: DateFormatSetting.monthDay),
        'Nov 19',
      );
      expect(
        formatShortDate(testDate, locale: 'ug', setting: DateFormatSetting.dayMonth),
        '19 Nov',
      );
      expect(
        formatShortDayName(testDate, locale: 'ug', setting: DateFormatSetting.monthDay),
        'Thu, Nov 19',
      );
      expect(
        formatFullCalendarDate(testDate, locale: 'ug', setting: DateFormatSetting.monthDay),
        'Thursday, November 19, 2026',
      );
    });
  });
}
