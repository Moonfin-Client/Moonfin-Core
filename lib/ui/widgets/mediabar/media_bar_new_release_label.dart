import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/calendar_days.dart';

/// What a slide says when it's new, like the "New season" a streaming service
/// puts on its home page: a series whose episodes aired lately, or a new
/// movie. A small label, then the season, episode or date in large type so it
/// reads at a glance, even from the couch. A thin bar ties both lines to the
/// logo above.
///
/// Bare text on the artwork, like the rest of the bar. Neutral on purpose: the
/// accent means focus and progress here, and the artwork supplies the color.
class MediaBarNewReleaseLine extends StatelessWidget {
  final MediaBarNewReleaseInfo release;

  /// The season or episode under the label. Phones keep the label alone.
  final bool showMessage;

  /// Centered layouts drop the bar, which only works against a left edge.
  final CrossAxisAlignment alignment;

  /// Inside a card, the card's edge already does the bar's job.
  final bool showBar;

  /// Taglines run too long for a phone, even on two lines.
  final bool showTagline;

  const MediaBarNewReleaseLine({
    super.key,
    required this.release,
    this.showMessage = true,
    this.alignment = CrossAxisAlignment.start,
    this.showBar = true,
    this.showTagline = true,
  });

  // A tight shadow for a crisp edge. The contrast on a light image comes from
  // the layout's overlay, or MediaBarCornerLight where it has none.
  static final _shadows = [
    Shadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      color: AppColorScheme.scrim.withValues(alpha: 0.7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final kind = switch (release.kind) {
      MediaBarNewRelease.newSeries ||
      MediaBarNewRelease.upcomingSeries => l10n.mediaBarNewSeries,
      MediaBarNewRelease.newSeason => l10n.mediaBarNewSeason,
      MediaBarNewRelease.newEpisodes => l10n.mediaBarNewEpisodes,
      MediaBarNewRelease.newMovie => l10n.mediaBarNewMovie,
      MediaBarNewRelease.upcomingEpisode => l10n.mediaBarUpcomingEpisode,
      MediaBarNewRelease.upcomingSeason => l10n.mediaBarUpcomingSeason(
        release.season,
      ),
      MediaBarNewRelease.upcomingMovie => l10n.mediaBarUpcomingMovie,
    };
    final day = release.kind.isUpcoming && release.date != null
        ? _upcomingDay(context, l10n, release.date!)
        : null;
    // Phones keep one line, so the day of what's upcoming, or the latest new
    // episode, follows the label instead of going under it.
    final suffix =
        day ??
        (release.kind == MediaBarNewRelease.newEpisodes ? _detail(l10n) : null);
    final label = !showMessage && suffix != null ? '$kind · $suffix' : kind;
    final detail = showMessage ? day ?? _detail(l10n) : null;
    // A tagline is a quote from the poster, so it reads as one: italic, and
    // allowed a second line since taglines run long.
    final quote =
        showMessage &&
            showTagline &&
            day == null &&
            release.kind == MediaBarNewRelease.newMovie
        ? release.tagline
        : null;

    final text = Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColorScheme.onSurface,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            shadows: _shadows,
          ),
        ),
        if (quote != null)
          Text(
            quote,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
            // The same type as the other lines, only slanted.
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColorScheme.onSurface,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              height: 1.15,
              shadows: _shadows,
            ),
          )
        else if (detail != null)
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColorScheme.onSurface,
              fontWeight: FontWeight.w700,
              height: 1.15,
              shadows: _shadows,
            ),
          ),
      ],
    );

    // The bar stays with the label alone too, so every flagged slide reads
    // the same.
    if (alignment == CrossAxisAlignment.center || !showBar) return text;

    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface,
              borderRadius: AppRadius.circular(1),
            ),
            child: const SizedBox(width: 2),
          ),
          const SizedBox(width: 10),
          Flexible(child: text),
        ],
      ),
    );
  }

  /// Today, Tomorrow, This Thursday within the week, then the date.
  static String _upcomingDay(
    BuildContext context,
    AppLocalizations l10n,
    DateTime date,
  ) {
    final locale = Localizations.localeOf(context).toString();
    final local = date.toLocal();
    final days = calendarDaysBetween(DateTime.now(), local);
    if (days <= 0) return l10n.upcomingEpisodeToday;
    if (days == 1) return l10n.upcomingEpisodeTomorrow;
    if (days < 7) {
      return l10n.mediaBarThisWeekday(DateFormat.EEEE(locale).format(local));
    }
    return l10n.mediaBarOnDate(DateFormat.MMMd(locale).format(local));
  }

  String? _detail(AppLocalizations l10n) {
    final episode = release.episode;
    return switch (release.kind) {
      MediaBarNewRelease.newSeries ||
      MediaBarNewRelease.newSeason => l10n.seasonNumber(release.season),
      _ when episode != null => l10n.seasonEpisodeLabel(
        release.season,
        episode,
      ),
      _ => null,
    };
  }
}
