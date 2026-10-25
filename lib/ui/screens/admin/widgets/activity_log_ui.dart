import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../util/calendar_days.dart';

String activityBucketLabel(DateTime date, AppLocalizations l10n, {DateTime? now}) {
  final reference = now ?? DateTime.now();
  final diff = reference.difference(date);

  if (diff.inMinutes < 5) {
    return l10n.adminActivityJustNow;
  }
  if (diff.inMinutes < 60) {
    return l10n.adminActivityLastHour;
  }

  final daysAgo = calendarDaysBetween(date.toLocal(), reference.toLocal());
  if (daysAgo <= 0) {
    return l10n.adminActivityToday;
  }
  if (daysAgo == 1) {
    return l10n.adminActivityYesterday;
  }
  return l10n.adminActivityOlder;
}

List<Object> buildActivityListItems(
  List<ActivityLogEntry> entries,
  AppLocalizations l10n, {
  DateTime? now,
}) {
  final items = <Object>[];
  final reference = now ?? DateTime.now();
  String? lastBucket;

  for (final entry in entries) {
    final bucket = activityBucketLabel(entry.date, l10n, now: reference);
    if (bucket != lastBucket) {
      items.add(bucket);
      lastBucket = bucket;
    }
    items.add(entry);
  }

  return items;
}

String activityTimeAgo(DateTime date, AppLocalizations l10n, {bool compact = true}) {
  final diff = DateTime.now().difference(date);
  if (compact) {
    if (diff.inMinutes < 1) return l10n.adminActivityNow;
    if (diff.inMinutes < 60) return l10n.adminActivityMinutesShort(diff.inMinutes);
    if (diff.inHours < 24) return l10n.adminActivityHoursShort(diff.inHours);
    if (diff.inDays < 7) return l10n.adminActivityDaysShort(diff.inDays);
    final local = date.toLocal();
    return l10n.adminActivityDateShort(local.month, local.day);
  }

  if (diff.inDays > 0) return l10n.adminActivityDaysAgo(diff.inDays);
  if (diff.inHours > 0) return l10n.adminActivityHoursAgo(diff.inHours);
  if (diff.inMinutes > 0) return l10n.adminActivityMinutesAgo(diff.inMinutes);
  return l10n.adminActivityJustNow;
}

/// The server's LogLevel names, in the order the severity filter lists them.
const activitySeverities = [
  'Trace',
  'Debug',
  'Information',
  'Warning',
  'Error',
  'Critical',
  'None',
];

String activitySeverityLabel(String severity, AppLocalizations l10n) =>
    switch (severity) {
      'Trace' => l10n.adminLogLevelTrace,
      'Debug' => l10n.adminLogLevelDebug,
      'Information' => l10n.adminLogLevelInformation,
      'Warning' => l10n.adminLogLevelWarning,
      'Error' => l10n.adminLogLevelError,
      'Critical' => l10n.adminLogLevelCritical,
      'None' => l10n.adminLogLevelNone,
      _ => severity,
    };

(Color, Widget) activitySeverityIndicator(String severity, ThemeData theme) {
  switch (severity.toLowerCase()) {
    case 'error':
    case 'critical':
      return (
        theme.colorScheme.error,
        Icon(Icons.error_outline, size: 15, color: theme.colorScheme.error),
      );
    case 'warning':
    case 'warn':
      return (
        AppColorScheme.recordingScheduled,
        Icon(
          Icons.warning_amber,
          size: 15,
          color: AppColorScheme.recordingScheduled,
        ),
      );
    case 'information':
      return (
        theme.colorScheme.primary,
        Icon(Icons.info_outline, size: 15, color: theme.colorScheme.primary),
      );
    default:
      return (
        theme.colorScheme.outlineVariant,
        Icon(
          Icons.info_outline,
          size: 15,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      );
  }
}