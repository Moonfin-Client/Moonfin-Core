import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';

String _formatExplicitDate(String pattern, DateTime date, String? locale) {
  try {
    return DateFormat(pattern, locale).format(date);
  } catch (_) {
    return DateFormat(pattern, 'en_US').format(date);
  }
}

/// Formats a short month/day date (e.g. for upcoming episode rows, media bar, next-up).
/// Respects the user's DateFormatSetting preference (system, monthDay, dayMonth).
String formatShortDate(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) {
  final DateFormatSetting effectiveSetting = setting ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? (GetIt.instance<UserPreferences>().get(UserPreferences.dateFormat) ??
              DateFormatSetting.system)
          : DateFormatSetting.system);

  switch (effectiveSetting) {
    case DateFormatSetting.monthDay:
      return _formatExplicitDate('MMM d', date, locale);
    case DateFormatSetting.dayMonth:
      return _formatExplicitDate('d MMM', date, locale);
    case DateFormatSetting.system:
      try {
        return DateFormat.MMMd(locale).format(date);
      } catch (_) {
        return DateFormat.MMMd('en_US').format(date);
      }
  }
}

/// Formats a short weekday + month/day date (e.g. "Thu, Nov 19" or "Thu 19 Nov").
String formatShortDayName(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) {
  final DateFormatSetting effectiveSetting = setting ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? (GetIt.instance<UserPreferences>().get(UserPreferences.dateFormat) ??
              DateFormatSetting.system)
          : DateFormatSetting.system);

  switch (effectiveSetting) {
    case DateFormatSetting.monthDay:
      return _formatExplicitDate('EEE, MMM d', date, locale);
    case DateFormatSetting.dayMonth:
      return _formatExplicitDate('EEE d MMM', date, locale);
    case DateFormatSetting.system:
      try {
        return DateFormat.MMMEd(locale).format(date);
      } catch (_) {
        return DateFormat.MMMEd('en_US').format(date);
      }
  }
}

/// Formats a full calendar date with weekday (e.g. "Thursday, November 19, 2026" or "Thursday, 19 November 2026").
String formatFullCalendarDate(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
  bool includeYear = true,
}) {
  final DateFormatSetting effectiveSetting = setting ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? (GetIt.instance<UserPreferences>().get(UserPreferences.dateFormat) ??
              DateFormatSetting.system)
          : DateFormatSetting.system);

  switch (effectiveSetting) {
    case DateFormatSetting.monthDay:
      return includeYear
          ? _formatExplicitDate('EEEE, MMMM d, y', date, locale)
          : _formatExplicitDate('EEEE, MMMM d', date, locale);
    case DateFormatSetting.dayMonth:
      return includeYear
          ? _formatExplicitDate('EEEE, d MMMM y', date, locale)
          : _formatExplicitDate('EEEE, d MMMM', date, locale);
    case DateFormatSetting.system:
      try {
        return includeYear
            ? DateFormat.yMMMMEEEEd(locale).format(date)
            : DateFormat.MMMMEEEEd(locale).format(date);
      } catch (_) {
        return includeYear
            ? DateFormat.yMMMMEEEEd('en_US').format(date)
            : DateFormat.MMMMEEEEd('en_US').format(date);
      }
  }
}

