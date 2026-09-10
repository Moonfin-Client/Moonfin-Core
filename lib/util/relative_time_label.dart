import '../l10n/app_localizations.dart';

/// "just now", "5m ago", "3h ago", "2d ago" for a past [at].
String relativeTimeLabel(AppLocalizations l10n, DateTime at, {DateTime? now}) {
  final elapsed = (now ?? DateTime.now()).difference(at);
  if (elapsed.inMinutes < 1) return l10n.justNow;
  if (elapsed.inHours < 1) return l10n.minutesAgo(elapsed.inMinutes);
  if (elapsed.inDays < 1) return l10n.hoursAgo(elapsed.inHours);
  return l10n.daysAgo(elapsed.inDays);
}
