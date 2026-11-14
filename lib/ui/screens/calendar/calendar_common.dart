import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/calendar_entry.dart';
import '../../../data/repositories/calendar_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/date_format_util.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import '../../widgets/top_toolbar.dart';
import 'calendar_controller.dart';

const calendarMovieColor = Color(0xFFF2A93B);
const calendarReadyColor = Color(0xFF5BC46A);
const calendarMissingColor = Color(0xFFE0A15A);

UserPreferences get _prefs => GetIt.instance<UserPreferences>();

/// Content insets that clear the top bar or the collapsed left rail.
EdgeInsets calendarChromeInsets(BuildContext context) {
  final safe = MediaQuery.paddingOf(context);
  final top = safe.top;
  if (PlatformDetection.useMobileUi) {
    final bar = NavigationLayout.usesBottomNavbar
        ? 0.0
        : TopToolbar.heightFor(context);
    // An opened folding phone on its side keeps the clock in a top corner,
    // so the sides clear the system's insets too.
    return EdgeInsets.only(
      top: top + 8 + bar,
      left: 16 + safe.left,
      right: 16 + safe.right,
    );
  }
  final position = NavigationLayout.sanitizeNavbarPosition(
    _prefs.get(UserPreferences.navbarPosition),
  );
  if (position == NavbarPosition.left) {
    return EdgeInsets.only(top: top + 28, left: 104, right: 48);
  }
  return EdgeInsets.only(
    top: top + (PlatformDetection.isTV ? 95 : 80),
    left: 48,
    right: 48,
  );
}

String calendarTime(BuildContext context, CalendarEntry e) {
  final l10n = AppLocalizations.of(context);
  if (!e.hasTime) return l10n.calendarAllDay;
  final locale = l10n.localeName;
  final h24 = _prefs.get(UserPreferences.use24HourClock);
  return (h24 ? DateFormat.Hm(locale) : DateFormat.jm(locale)).format(e.date);
}

String calendarDayName(BuildContext context, DateTime day, DateTime today) {
  final l10n = AppLocalizations.of(context);
  final diff = DateTime(day.year, day.month, day.day).difference(today).inDays;
  if (diff == 0) return l10n.upcomingEpisodeToday;
  if (diff == 1) return l10n.upcomingEpisodeTomorrow;
  if (diff == -1) return l10n.adminActivityYesterday;
  return formatShortDayName(day, locale: l10n.localeName);
}

/// When it airs, like "Today at 9:00 PM", or the day alone for a movie.
String calendarWhen(BuildContext context, CalendarEntry e, DateTime today) {
  final day = calendarDayName(context, e.day, today);
  if (!e.hasTime) return day;
  return AppLocalizations.of(context)
      .calendarDayAtTime(day, calendarTime(context, e));
}

String? calendarBadgeLabel(AppLocalizations l10n, CalendarBadge? badge) =>
    switch (badge) {
      CalendarBadge.seriesPremiere => l10n.calendarBadgeSeriesPremiere,
      CalendarBadge.seasonPremiere => l10n.calendarBadgeSeasonPremiere,
      CalendarBadge.midseasonFinale => l10n.calendarBadgeMidseasonFinale,
      CalendarBadge.seasonFinale => l10n.calendarBadgeSeasonFinale,
      CalendarBadge.seriesFinale => l10n.calendarBadgeSeriesFinale,
      null => null,
    };

bool get calendarShowsBadges => _prefs.get(UserPreferences.calendarShowBadges);

String calendarReleaseLabel(AppLocalizations l10n, CalendarRelease r) =>
    switch (r) {
      CalendarRelease.cinema => l10n.calendarReleaseCinema,
      CalendarRelease.digital => l10n.calendarReleaseDigital,
      CalendarRelease.physical => l10n.calendarReleasePhysical,
      CalendarRelease.airing => '',
    };

/// The line under the title: the episode code and name, or the movie's
/// release type and year.
String calendarSubtitle(
  AppLocalizations l10n,
  CalendarEntry e, {
  bool hideSpoilers = false,
}) {
  if (e.isMovie) {
    return [
      calendarReleaseLabel(l10n, e.release),
      if (e.year != null) '${e.year}',
    ].join(' · ');
  }
  final code = e.seasonNumber != null && e.episodeNumber != null
      ? l10n.seasonEpisodeLabel(e.seasonNumber!, e.episodeNumber!)
      : null;
  return [
    ?code,
    if (!hideSpoilers && e.episodeTitle != null) e.episodeTitle!,
  ].join(' · ');
}

Color calendarColor(BuildContext context, CalendarEntry e, DateTime now) {
  if (previewValue(context, UserPreferences.calendarColorBy) ==
      CalendarColorBy.status) {
    return switch (e.statusAt(now)) {
      CalendarStatus.ready => calendarReadyColor,
      CalendarStatus.upcoming => AppColorScheme.accent,
      CalendarStatus.missing => calendarMissingColor,
    };
  }
  return e.isMovie ? calendarMovieColor : AppColorScheme.accent;
}

/// Artwork with a plain fallback, so a title with no art still holds its slot.
class CalendarArt extends StatelessWidget {
  const CalendarArt({
    super.key,
    required this.url,
    required this.aspectRatio,
    this.radius = 8,
    this.icon = Icons.movie_outlined,
  });

  final String? url;
  final double aspectRatio;
  final double radius;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final fallback = Container(
      color: AppColorScheme.surface,
      alignment: Alignment.center,
      child: Icon(icon, color: AppColorScheme.onSurface.withValues(alpha: 0.3)),
    );
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: AppRadius.circular(radius),
        child: url == null
            ? fallback
            : BoundedNetworkImage(
                imageUrl: url!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => fallback,
              ),
      ),
    );
  }
}

/// Art for an entry: the episode still when there is one and spoilers allow
/// it, otherwise the series or movie backdrop.
String? calendarThumbUrl(CalendarEntry e, {bool hideSpoilers = false}) =>
    (!hideSpoilers ? e.stillUrl : null) ?? e.backdropUrl ?? e.posterUrl;

class CalendarTag extends StatelessWidget {
  const CalendarTag(this.label, {super.key, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.18),
      borderRadius: AppRadius.circular(6),
    ),
    child: Text(
      label,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    ),
  );
}

List<Widget> calendarTags(BuildContext context, CalendarEntry e, DateTime now) {
  final l10n = AppLocalizations.of(context);
  final badge = calendarShowsBadges ? calendarBadgeLabel(l10n, e.badge) : null;
  return [
    if (badge != null) CalendarTag(badge, color: AppColorScheme.accent),
    if (e.inLibrary)
      CalendarTag(l10n.calendarStatusInLibrary, color: calendarReadyColor)
    else if (e.statusAt(now) == CalendarStatus.missing)
      CalendarTag(l10n.missing, color: calendarMissingColor),
    if (!e.monitored)
      CalendarTag(
        l10n.calendarNotMonitored,
        color: AppColorScheme.onSurface.withValues(alpha: 0.6),
      ),
  ];
}

/// A pill button that fills on focus like the rest of the app's TV buttons.
class CalendarButton extends StatelessWidget {
  const CalendarButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.primary = false,
    this.focusNode,
    this.autofocus = false,
    this.compact = false,
    this.onNavigateLeft,
    this.onNavigateRight,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool primary;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool compact;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      onSelect: onPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      borderRadius: 24,
      disableScale: true,
      useBackgroundFocus: true,
      descendantsAreFocusable: false,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      semanticLabel: label,
      child: Builder(
        builder: (context) {
          final highlighted = FocusableWrapper.isHighlighted(context);
          final fg = highlighted
              ? FocusTheme.solidFocusForeground
              : primary
              ? AppColorScheme.onAccent
              : AppColorScheme.onSurface;
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 14 : 20,
              vertical: compact ? 8 : 11,
            ),
            decoration: BoxDecoration(
              color: highlighted
                  ? Colors.transparent
                  : primary
                  ? AppColorScheme.accent
                  : AppColorScheme.onSurface.withValues(alpha: 0.12),
              borderRadius: AppRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: compact ? 18 : 20, color: fg),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: fg,
                    fontSize: compact ? 13 : 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CalendarMessage extends StatelessWidget {
  const CalendarMessage({
    super.key,
    required this.icon,
    required this.message,
    this.onRetry,
  });

  final IconData icon;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColorScheme.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.8),
              fontSize: 16,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 20),
            CalendarButton(
              label: AppLocalizations.of(context).retry,
              icon: Icons.refresh_rounded,
              onPressed: onRetry,
              autofocus: true,
            ),
          ],
        ],
      ),
    ),
  );
}

String calendarProblemText(AppLocalizations l10n, CalendarProblem p) =>
    switch (p) {
      CalendarProblem.adminsOnly => l10n.calendarProblemAdminsOnly,
      CalendarProblem.needsAdminSeerr => seerrBrand(
        l10n.calendarProblemNeedsSeerr,
      ),
      CalendarProblem.notConfigured => l10n.calendarProblemNotConfigured,
      CalendarProblem.failed => l10n.calendarProblemFailed,
    };

/// The loading, problem and empty states every view shares. Returns null
/// once there is something to show.
Widget? calendarStateView(
  BuildContext context,
  CalendarController c, {
  required bool empty,
  required String emptyText,
}) {
  if (c.loading) {
    return const Center(child: CircularProgressIndicator());
  }
  final problem = c.problem;
  if (problem != null) {
    return CalendarMessage(
      icon: Icons.event_busy_rounded,
      message: calendarProblemText(AppLocalizations.of(context), problem),
      onRetry: problem == CalendarProblem.adminsOnly
          ? null
          : () => c.load(refresh: true),
    );
  }
  if (empty) {
    return CalendarMessage(
      icon: Icons.event_available_rounded,
      message: emptyText,
    );
  }
  return null;
}

bool get _seerrAvailable => GetIt.instance<PluginSyncService>().seerrAvailable;

/// Opens what the user picked for a card: Play when that's the setting and
/// it's on the server, otherwise its details.
void calendarSelect(BuildContext context, CalendarEntry e) {
  final play =
      _prefs.get(UserPreferences.calendarSelectAction) ==
      CalendarSelectAction.play;
  if (play && e.inLibrary) {
    calendarPlay(context, e);
    return;
  }
  calendarOpenDetails(context, e);
}

void calendarPlay(BuildContext context, CalendarEntry e) {
  final id = e.playableId;
  if (id == null) return;
  context.push(Destinations.item(id, autoPlay: true));
}

/// The episode or movie page when it's on the server, the series page for an
/// episode that isn't yet, and the Seerr page for a title the server lacks.
void calendarOpenDetails(BuildContext context, CalendarEntry e) {
  final id = e.episodeId ?? e.itemId;
  if (id != null) {
    context.push(Destinations.item(id));
    return;
  }
  _openSeerr(context, e);
}

void calendarOpenSeries(BuildContext context, CalendarEntry e) {
  if (e.itemId != null) {
    context.push(Destinations.item(e.itemId!));
    return;
  }
  _openSeerr(context, e);
}

bool calendarCanOpen(CalendarEntry e) =>
    e.itemId != null ||
    e.episodeId != null ||
    (_seerrAvailable && e.tmdbId != null);

/// The request button belongs on titles Sonarr or Radarr won't fetch.
bool calendarShowsRequest(CalendarEntry e) =>
    !e.monitored &&
    !e.inLibrary &&
    e.tmdbId != null &&
    _seerrAvailable &&
    _prefs.get(UserPreferences.calendarRequestButton);

void calendarRequest(BuildContext context, CalendarEntry e) =>
    _openSeerr(context, e);

void _openSeerr(BuildContext context, CalendarEntry e) {
  if (!_seerrAvailable || e.tmdbId == null) return;
  context.push(
    Destinations.seerrMedia(
      '${e.tmdbId}',
      mediaType: e.isMovie ? 'movie' : 'tv',
      title: e.title,
    ),
  );
}

Future<void> calendarToggleReminder(
  BuildContext context,
  CalendarController c,
  CalendarEntry e,
) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  final failed = AppLocalizations.of(context).calendarReminderFailed;
  final result = await c.toggleReminder(e);
  if (result == null) {
    messenger?.showSnackBar(SnackBar(content: Text(failed)));
  }
}

bool calendarCanRemind(CalendarController c, CalendarEntry e) =>
    c.remindersEnabled && !e.inLibrary && e.reminderKey != null;
