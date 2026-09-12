import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';

/// Information about a series' next upcoming episode to air.
class UpcomingEpisodeInfo {
  final int seasonNumber;
  final int episodeNumber;
  final DateTime airDate;
  final String? title;

  const UpcomingEpisodeInfo({
    required this.seasonNumber,
    required this.episodeNumber,
    required this.airDate,
    this.title,
  });

  /// Formats the upcoming episode string according to relative date rules:
  /// - Today -> "Next: Today (S2:E1)"
  /// - Tomorrow -> "Next: Tomorrow (S2:E1)"
  /// - Within 7 days -> "Next: Tuesday (S2:E1)"
  /// - Beyond 7 days -> "Next: Oct 15 (S2:E1)"
  String format(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();

    final localAirDate = airDate.toLocal();
    final localNow = DateTime.now().toLocal();
    final airDay = DateTime(
      localAirDate.year,
      localAirDate.month,
      localAirDate.day,
    );
    final today = DateTime(localNow.year, localNow.month, localNow.day);
    final diffDays = airDay.difference(today).inDays;

    final String dateText;
    if (diffDays == 0) {
      dateText = l10n.upcomingEpisodeToday;
    } else if (diffDays == 1) {
      dateText = l10n.upcomingEpisodeTomorrow;
    } else if (diffDays > 1 && diffDays < 7) {
      dateText = DateFormat.EEEE(locale).format(localAirDate);
    } else {
      dateText = DateFormat.MMMd(locale).format(localAirDate);
    }

    return l10n.upcomingEpisodeNext(dateText, seasonNumber, episodeNumber);
  }
}
