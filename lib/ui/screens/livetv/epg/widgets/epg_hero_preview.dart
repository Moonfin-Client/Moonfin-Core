import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';
import '../../../../widgets/bounded_network_image.dart';
import '../../../../widgets/marquee_text.dart';

/// Landscape hero band that previews the focused program. Pure presentation.
/// The host feeds it the focused values (typically via a ValueListenableBuilder)
/// so only this band rebuilds as focus moves. Idiom aware: frosted glass on
/// Apple, a tokenized translucent panel on Material.
class EpgHeroPreview extends StatelessWidget {
  static const double compactHeight = 144;
  static const double plateWidth = compactHeight * 0.75;
  static const Color _logoPlate = Color(0xEF353940);

  final String? title;

  /// Optional channel/program split used when the guide focus is on the
  /// channel rail rather than a program cell.
  final String? programTitle;

  /// Episode title and/or `S6:E19`, appended after [programTitle] in a
  /// lighter, smaller style so the show name still leads.
  final String? programSubtitle;
  final String? channelLogoUrl;

  /// The focused program's own artwork (or its series' poster — see
  /// [GuideProgram.artworkSource]), when available. Takes the channel
  /// logo's place in the plate, full band height, cropped to fill rather
  /// than letterboxed; the channel logo remains the fallback and stays
  /// letterboxed so its wordmark isn't cropped.
  final String? programImageUrl;
  final String? timeLabel;
  final String? genreLabel;

  /// Parental classification (`TV-14`, `PG-13`, ...), shown in the call-sign
  /// line after genre.
  final String? officialRating;

  /// Community score on a 0-10 scale, shown last in the call-sign line —
  /// it's the first thing dropped by the line's own ellipsis when space
  /// runs out.
  final double? communityRating;

  /// Short badge text (`Premiere`, `Repeat`) shown as a small pill next to
  /// the title. Null shows no badge.
  final String? badgeLabel;
  final String? synopsis;
  final bool isLive;
  final bool apple;
  final bool compact;

  const EpgHeroPreview({
    super.key,
    required this.title,
    this.programTitle,
    this.programSubtitle,
    this.channelLogoUrl,
    this.programImageUrl,
    required this.timeLabel,
    required this.genreLabel,
    this.officialRating,
    this.communityRating,
    this.badgeLabel,
    required this.synopsis,
    required this.isLive,
    required this.apple,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final channelTitleStyle =
        (textTheme.bodyLarge ??
                const TextStyle(fontSize: AppTypography.fontSizeMd))
            .copyWith(fontWeight: FontWeight.w600);
    final programTitleStyle =
        (textTheme.headlineSmall ??
                const TextStyle(fontSize: AppTypography.fontSize2xl))
            .copyWith(fontWeight: FontWeight.w600);
    // Regular weight and a step down in size, so the episode title and
    // S/E number read as secondary detail rather than competing with the
    // show name for attention.
    final programSubtitleStyle = programTitleStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize:
          (programTitleStyle.fontSize ?? AppTypography.fontSize2xl) - 4,
      color: muted,
    );
    final metaStyle =
        (textTheme.bodyMedium ??
                const TextStyle(fontSize: AppTypography.fontSizeSm))
            .copyWith(color: muted);
    final synopsisStyle =
        (textTheme.bodyMedium ??
                const TextStyle(fontSize: AppTypography.fontSizeSm))
            .copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.72),
              fontSize: compact ? AppTypography.fontSizeMd : null,
              height: 1.2,
            );
    // Ordered highest to lowest priority: the line's own maxLines:1 ellipsis
    // drops from the end, so whatever doesn't fit is the least important
    // thing here rather than whatever happens to be longest.
    final meta = [
      if (isLive) 'Live',
      if (timeLabel != null) timeLabel,
      if (genreLabel != null && genreLabel!.isNotEmpty) genreLabel,
      if (officialRating != null && officialRating!.isNotEmpty) officialRating,
      if (communityRating != null) communityRating!.toStringAsFixed(1),
    ].whereType<String>().join('  ·  ');

    final hasChannelPreview = channelLogoUrl != null || programTitle != null;
    final channelLine = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: channelTitleStyle,
          ),
        ),
        if (badgeLabel != null) ...[
          const SizedBox(width: 8),
          _HeroBadge(label: badgeLabel!),
        ],
        if (meta.isNotEmpty) ...[
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              meta,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: metaStyle,
            ),
          ),
        ],
      ],
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasChannelPreview) ...[
          channelLine,
          if (programTitle != null && programTitle!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: compact ? 2 : 4),
              child: programSubtitle == null || programSubtitle!.isEmpty
                  ? Text(
                      programTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: programTitleStyle,
                    )
                  : Text.rich(
                      TextSpan(
                        text: programTitle,
                        style: programTitleStyle,
                        children: [
                          TextSpan(
                            text: programSubtitle,
                            style: programSubtitleStyle,
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
        ] else
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
        if (!hasChannelPreview && meta.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 6),
          Text(
            meta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: metaStyle,
          ),
        ],
        if (synopsis != null && synopsis!.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 8),
          MarqueeText(
            text: synopsis!,
            maxLines: 3,
            style: synopsisStyle,
            millisPerPixel: kLiveTvDescriptionMarqueeMillisPerPixel,
            pauseDurationMs: 1600,
            showDotSeparator: false,
          ),
        ],
      ],
    );

    final plateImageUrl = programImageUrl ?? channelLogoUrl;
    // Program artwork arrives after the channel logo, via a debounced
    // per-program lookup the bulk guide fetch can't carry (see
    // LiveTvGuideScreen._scheduleArtworkLookup). The plate's own width and
    // fit stay fixed regardless of which is showing, so that arrival is a
    // crossfade rather than a resize — a shape change compounded with the
    // content swap is what actually read as the jerky pop.
    final usingArtwork = programImageUrl != null;
    final imagePlate = plateImageUrl == null
        ? null
        : SizedBox(
            width: plateWidth,
            child: DecoratedBox(
              // The plate colour is a backdrop for transparent-background
              // logo PNGs. Artwork is an opaque photo that covers the box
              // completely, so the colour would only ever show through a
              // loading gap — pure noise there, not a backdrop.
              decoration: BoxDecoration(
                color: usingArtwork ? Colors.transparent : _logoPlate,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: BoundedNetworkImage(
                  key: ValueKey(plateImageUrl),
                  imageUrl: plateImageUrl,
                  fit: usingArtwork ? BoxFit.cover : BoxFit.contain,
                  fadeInDuration: Duration.zero,
                  // Tracks the plate's rendered width at the 2.0 device
                  // pixel ratio BoundedNetworkImage itself clamps to.
                  maxWidth: (plateWidth * 2).round(),
                ),
              ),
            ),
          );

    final textPadding = EdgeInsets.fromLTRB(
      imagePlate != null ? 8 : 12,
      compact ? 2 : 6,
      12,
      compact ? 2 : 6,
    );
    final inner = imagePlate == null
        ? Padding(padding: textPadding, child: text)
        : Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              imagePlate,
              Expanded(child: Padding(padding: textPadding, child: text)),
            ],
          );

    final content = compact
        ? SizedBox(height: compactHeight, child: inner)
        : inner;

    return apple
        ? adaptiveGlass(
            context: context,
            cornerRadius: 18,
            blur: 18,
            fallbackColor: AppColorScheme.surface.withValues(alpha: 0.4),
            tint: Colors.white.withValues(alpha: 0.06),
            child: content,
          )
        : Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColorScheme.surface.withValues(alpha: 0.45),
              borderRadius: AppRadius.circular(16),
            ),
            child: content,
          );
  }
}

/// Small pill for a premiere/repeat badge next to the title.
class _HeroBadge extends StatelessWidget {
  final String label;

  const _HeroBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColorScheme.accent.withValues(alpha: 0.18),
        borderRadius: AppRadius.circular(4),
        border: Border.all(color: AppColorScheme.accent.withValues(alpha: 0.5)),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
          color: AppColorScheme.accent,
        ),
      ),
    );
  }
}
