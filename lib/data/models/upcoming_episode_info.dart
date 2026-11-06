import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../util/calendar_days.dart';

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

  /// The answer is cached and a details screen can stay open, so an episode
  /// that was upcoming when it was fetched is not upcoming forever.
  bool get hasAired {
    final local = airDate.toLocal();
    final now = DateTime.now();
    return DateTime(
      local.year,
      local.month,
      local.day,
    ).isBefore(DateTime(now.year, now.month, now.day));
  }

  /// Whether this is the episode right after episode [episode] of season
  /// [season]. A next season that is already in the library is only queued
  /// once the finale ends, so anything further along means the viewer has
  /// more to watch first.
  bool follows(int? season, int? episode) {
    if (season == null || episode == null) return false;
    return (seasonNumber == season && episodeNumber == episode + 1) ||
        (seasonNumber == season + 1 && episodeNumber == 1);
  }

  /// Formats the upcoming episode string according to relative date rules:
  /// - Today -> "Next: Today (S2:E1)"
  /// - Tomorrow -> "Next: Tomorrow (S2:E1)"
  /// - Within 7 days -> "Next: Tuesday (S2:E1)"
  /// - Beyond 7 days -> "Next: Oct 15 (S2:E1)"
  String format(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();

    final localAirDate = airDate.toLocal();
    final diffDays = calendarDaysBetween(DateTime.now(), localAirDate);

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
