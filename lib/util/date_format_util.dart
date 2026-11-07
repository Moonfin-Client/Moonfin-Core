import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';

String _format(
  DateTime date,
  String? locale,
  DateFormatSetting? setting, {
  required DateFormat Function(String? locale) system,
  required String monthDay,
  required String dayMonth,
}) {
  final DateFormatSetting chosen =
      setting ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? GetIt.instance<UserPreferences>().get(UserPreferences.dateFormat)
          : DateFormatSetting.system);
  DateFormat formatFor(String? localeName) => switch (chosen) {
    DateFormatSetting.system => system(localeName),
    DateFormatSetting.monthDay => DateFormat(monthDay, localeName),
    DateFormatSetting.dayMonth => DateFormat(dayMonth, localeName),
  };
  try {
    return formatFor(locale).format(date);
  } catch (_) {
    // intl has no date data for some app languages, so those read in English.
    return formatFor('en_US').format(date);
  }
}

/// A short date, like "Nov 19" or "19 Nov", in the order the user picked.
String formatShortDate(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) => _format(
  date,
  locale,
  setting,
  system: DateFormat.MMMd,
  monthDay: 'MMM d',
  dayMonth: 'd MMM',
);

/// A short date with its weekday, like "Thu, Nov 19" or "Thu 19 Nov".
String formatShortDayName(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) => _format(
  date,
  locale,
  setting,
  system: DateFormat.MMMEd,
  monthDay: 'EEE, MMM d',
  dayMonth: 'EEE d MMM',
);

/// The full date with its weekday and year, like "Thursday, November 19, 2026"
/// or "Thursday, 19 November 2026".
String formatFullCalendarDate(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) => _format(
  date,
  locale,
  setting,
  system: DateFormat.yMMMMEEEEd,
  monthDay: 'EEEE, MMMM d, y',
  dayMonth: 'EEEE, d MMMM y',
);
