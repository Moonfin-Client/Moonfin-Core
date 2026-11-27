import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../data/models/aggregated_item.dart';
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

/// A medium date with its year, like "Nov 19, 2026" or "19 Nov 2026", in the
/// order the user picked.
String formatMediumDate(
  DateTime date, {
  String? locale,
  DateFormatSetting? setting,
}) => _format(
  date,
  locale,
  setting,
  system: DateFormat.yMMMd,
  monthDay: 'MMM d, y',
  dayMonth: 'd MMM y',
);

/// Formats an item's release or air date for the details metadata row.
///
/// When [showFullDate] is true and [item.premiereDate] is available, returns
/// the full localized date (e.g. "Mar 15, 2024" or "15 Mar 2024"). Otherwise
/// falls back to [item.productionYear].
String? formatDetailReleaseDate(
  AggregatedItem item, {
  required bool showFullDate,
  String? locale,
  DateFormatSetting? setting,
}) {
  if (showFullDate && item.premiereDate != null) {
    return formatMediumDate(
      item.premiereDate!,
      locale: locale,
      setting: setting,
    );
  }
  return item.productionYear?.toString();
}

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
