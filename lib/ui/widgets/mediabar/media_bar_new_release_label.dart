import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../../../l10n/app_localizations.dart';

/// What a series slide says when its episodes aired lately, like the "New
/// season" a streaming service puts on its home page. A small label, then the
/// season or episode in large type so it reads at a glance, even from the
/// couch. A thin bar ties both lines to the logo above.
///
/// Bare text on the artwork, like the rest of the bar. Neutral on purpose: the
/// accent means focus and progress here, and the artwork supplies the color.
class MediaBarNewReleaseLine extends StatelessWidget {
  final MediaBarNewReleaseInfo release;

  /// The season or episode under the label. Phones keep the label alone.
  final bool showMessage;

  /// Centered layouts drop the bar, which only works against a left edge.
  /// So does the label alone: the bar is there to tie two lines together.
  final CrossAxisAlignment alignment;

  const MediaBarNewReleaseLine({
    super.key,
    required this.release,
    this.showMessage = true,
    this.alignment = CrossAxisAlignment.start,
  });

  static final _shadows = [
    Shadow(blurRadius: 4, color: AppColorScheme.scrim.withValues(alpha: 0.54)),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final label = switch (release.kind) {
      MediaBarNewRelease.newSeries => l10n.mediaBarNewSeries,
      MediaBarNewRelease.newSeason => l10n.mediaBarNewSeason,
      MediaBarNewRelease.newEpisodes => l10n.mediaBarNewEpisodes,
    };
    final detail = showMessage ? _detail(l10n) : null;

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
        if (detail != null)
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

    if (alignment == CrossAxisAlignment.center || detail == null) return text;

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
