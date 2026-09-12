import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../screens/livetv/epg/epg_genre.dart';

/// One channel in the quick channel carousel. Pure presentation: the host
/// owns scrolling, focus, and data — this only renders what it is given.
/// [centered] marks the card pinned at the viewport centre, which gets an
/// accent border and focus glow instead of the plain card border.
///
/// The programme block mirrors the guide cell: a top-aligned regular-weight
/// title over a muted metadata line. The card is far taller than a guide row,
/// so it spends the extra height on a second title line instead of dropping
/// the metadata.
class ChannelCarouselCard extends StatelessWidget {
  static const String _metaSeparator = ' · ';

  /// Text metrics are identical across every card in a frame, so measuring is
  /// memoised: a card build otherwise lays out up to seven [TextPainter]s.
  static final Map<(String, TextStyle, TextScaler), double> _metrics = {};
  static const int _metricsCap = 1024;

  final String? channelNumber;
  final String channelName;
  final String? logoUrl;
  final bool isFavorite;
  final String? programTitle;

  /// Broadcast window (`8:00 PM - 9:00 PM`); first item of the metadata line.
  final String? timeLabel;

  /// Official rating (`TV-14`), shown after the time.
  final String? rating;

  /// Localised category labels (`Sports`, `News`), shown after the rating.
  final List<String> tags;

  final EpgGenre? genre;
  final bool isLive;
  final double progress; // 0..1, meaningful only when isLive
  final bool hasTimer;
  final bool centered;

  /// Draws the programme block as a skeleton: the schedule is still on its
  /// way rather than genuinely empty.
  final bool programLoading;

  /// Laid-out width. Defaults to [cardWidth]; the strip overrides it with the
  /// width [layoutFor] derives from the viewport.
  final double width;

  /// Preferred card width, and the target [layoutFor] aims at.
  static const double cardWidth = 200;
  static const double cardHeight = 108;
  static const double cardSpacing = 10;

  /// The logo owns the header's right edge; it grows to the header band's
  /// height so it never reaches the programme text below it.
  static const double _logoHeight = 30;
  static const double _logoMaxWidth = 44;
  static const double cardPitch = cardWidth + cardSpacing;

  /// Band a derived card width has to land in before it is considered.
  static const double minCardWidth = 150;
  static const double maxCardWidth = 280;

  /// Absolute floor: below this the programme block has nothing to say, so a
  /// narrower strip takes fewer cards instead.
  static const double _minLegibleWidth = 96;

  /// Upper bound on the whole-card count, so a very wide window cannot turn
  /// the strip into a row of slivers.
  static const int _maxCardCount = 15;

  static const double _radius = 10;

  /// Full-bleed genre bar down the leading edge.
  static const double _genreBarWidth = 4;

  static const EdgeInsets _contentPadding = EdgeInsets.fromLTRB(12, 8, 8, 8);
  double get _contentWidth => width - 12 - 8; // _contentPadding horizontal
  static const double _contentHeight =
      cardHeight - 8 - 8; // _contentPadding vertical

  static const double _headerGap = 6;
  static const double _statusGap = 3;

  const ChannelCarouselCard({
    super.key,
    required this.channelNumber,
    required this.channelName,
    this.logoUrl,
    required this.isFavorite,
    required this.programTitle,
    required this.timeLabel,
    this.rating,
    this.tags = const [],
    required this.genre,
    required this.isLive,
    required this.progress,
    required this.hasTimer,
    required this.centered,
    this.programLoading = false,
    this.width = cardWidth,
  });

  /// Strip geometry for an available width. The strip is centre-locked, so
  /// only an odd number of whole cards can sit symmetrically around the
  /// centre; taking the pitch as the width over that odd count leaves exactly
  /// one gutter of slack and so never clips a card at either edge.
  static ({double pitch, double width, int count}) layoutFor(
    double stripWidth,
  ) {
    if (!stripWidth.isFinite || stripWidth <= 0) {
      return (pitch: cardPitch, width: cardWidth, count: 1);
    }
    // Quantised to half a dp: the strip's item extent is multiplied by a
    // five-figure item count, and an arbitrary fraction there accumulates
    // enough error to trip the sliver's own scroll-extent assertion. Rounding
    // down keeps the whole run inside the strip.
    double pitchFor(int count) => (stripWidth / count * 2).floorToDouble() / 2;
    double widthFor(int count) => pitchFor(count) - cardSpacing;
    var best = 0;
    var bestDistance = double.infinity;
    var widest = 0;
    // Even counts are allowed: the strip is centre-locked, so an even number
    // of pitches puts a half card bleeding off each edge, symmetrically.
    for (var count = 1; count <= _maxCardCount; count++) {
      final candidate = widthFor(count);
      if (candidate < _minLegibleWidth) break;
      widest = count;
      if (candidate < minCardWidth || candidate > maxCardWidth) continue;
      final distance = (candidate - cardWidth).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        best = count;
      }
    }
    // Nothing landed in the comfortable band: take as many still-legible cards
    // as the strip allows rather than one enormous one.
    final count = best != 0 ? best : math.max(1, widest);
    return (pitch: pitchFor(count), width: widthFor(count), count: count);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final borders = ThemeRegistry.active.borders;
    final accent = AppColorScheme.accent;
    final accentColor = genre?.color ?? accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.6);
    final scaler = MediaQuery.textScalerOf(context);

    // Regular weight throughout: the centred card already reads from its
    // accent border and glow. Title and metadata are one step up from
    // bodySmall/labelSmall; the 108 dp height still fits a wrapped title over
    // the metadata line.
    final titleStyle = (textTheme.bodyLarge ?? const TextStyle()).copyWith(
      fontWeight: FontWeight.w400,
      color: AppColorScheme.onSurface,
    );
    final metaStyle = (textTheme.labelLarge ?? const TextStyle(fontSize: 14))
        .copyWith(color: muted);
    // One step up from bodyMedium: the header is logo-height anyway, so the
    // channel name can afford the extra 2 dp without pushing the programme
    // block.
    final nameStyle = (textTheme.titleMedium ?? const TextStyle()).copyWith(
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onSurface,
    );
    // The number is how a viewer actually identifies a channel, so it leads
    // the header: heavier than the call sign and a step larger again.
    final numberStyle = (textTheme.titleLarge ?? const TextStyle()).copyWith(
      fontWeight: FontWeight.w700,
      color: AppColorScheme.onSurface,
    );

    // The content box is known from the given width, so the fit decisions that
    // used to run inside a LayoutBuilder are made here instead: a relayout
    // boundary per card cost more than the arithmetic it guarded.
    final titleLine = _lineHeight(titleStyle, scaler);
    final metaLine = _lineHeight(metaStyle, scaler);
    final headerHeight = math.max(_logoHeight, _lineHeight(numberStyle, scaler));
    final belowHeader = _contentHeight - headerHeight - _headerGap;
    final metaItems = _fittingMeta(_contentWidth, metaStyle, scaler);
    final showMeta =
        metaItems.isNotEmpty && belowHeader >= titleLine + metaLine;
    // The card has room to wrap and keep the metadata; only a scaled-up text
    // size takes the second line back.
    final wrapTitle =
        programTitle != null &&
        belowHeader >= 2 * titleLine + (showMeta ? metaLine : 0.0);

    return SizedBox(
      width: width,
      height: cardHeight,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // A hint of the programme's genre over a dark base, so the card
          // carries a little colour without competing with its own text. A
          // programme with no genre falls back to plain dark grey.
          color: Color.alphaBlend(
            (genre?.color ?? AppColorScheme.surfaceVariant).withValues(
              alpha: centered ? 0.22 : 0.14,
            ),
            AppColorScheme.surface,
          ).withValues(alpha: centered ? 0.88 : 0.74),
          borderRadius: AppRadius.circular(_radius),
          border: Border.fromBorderSide(
            centered
                ? borders.focusBorder.copyWith(color: accent)
                : borders.cardBorder,
          ),
          boxShadow: centered ? borders.focusGlow : null,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: _genreBarWidth, color: accentColor),
            ),
            Padding(
              padding: _contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerRow(nameStyle, numberStyle),
                  const SizedBox(height: _headerGap),
                  if (programTitle != null)
                    Text(
                      programTitle!,
                      maxLines: wrapTitle ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    )
                  else if (programLoading)
                    _programPlaceholder(),
                  if (showMeta)
                    Text(
                      metaItems.join(_metaSeparator),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                      style: metaStyle,
                    ),
                ],
              ),
            ),
            // Progress reads as a seekbar, not as card structure: range tokens
            // rather than the genre colour, inset from the genre bar and from
            // both card edges so it never looks like a border.
            if (isLive && progress > 0)
              Positioned(
                left: _genreBarWidth + AppSpacing.spaceSm,
                right: AppSpacing.spaceSm,
                bottom: AppSpacing.spaceSm,
                child: LinearProgressIndicator(
                  value: progress.clamp(0.0, 1.0),
                  minHeight: 4,
                  borderRadius: AppRadius.circular(2),
                  backgroundColor: AppColorScheme.rangeTrack,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColorScheme.rangeProgress,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Stands in for the programme block while its data is still unfetched. The
  /// channel's own identity always renders, so a card the strip has run past
  /// reads as loading rather than as empty.
  Widget _programPlaceholder() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _placeholderBar(double.infinity, 10),
      const SizedBox(height: 6),
      _placeholderBar(math.max(0, _contentWidth * 0.5), 8),
    ],
  );

  Widget _placeholderBar(double barWidth, double barHeight) => Container(
    width: barWidth,
    height: barHeight,
    decoration: BoxDecoration(
      color: AppColorScheme.onSurface.withValues(alpha: 0.12),
      borderRadius: AppRadius.circular(3),
    ),
  );

  /// Logo leads, the heart sits with the channel number it belongs to, and
  /// the recording dot trails so nothing crowds the identity.
  Widget _headerRow(TextStyle nameStyle, TextStyle numberStyle) => Row(
    children: [
      if (isFavorite) ...[
        const Icon(Icons.favorite, size: 13, color: AppColors.red500),
        const SizedBox(width: 4),
      ],
      if (channelNumber != null) ...[
        Text(
          channelNumber!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: numberStyle,
        ),
        const SizedBox(width: 6),
      ],
      Expanded(
        child: Text(
          channelName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: nameStyle,
        ),
      ),
      if (hasTimer) ...[
        const SizedBox(width: _statusGap),
        const Icon(
          Icons.fiber_manual_record,
          size: 10,
          color: Color(0xFFE0685C),
        ),
      ],
      if (logoUrl != null && logoUrl!.isNotEmpty) ...[
        const SizedBox(width: 8),
        _logo(),
      ],
    ],
  );

  /// Sized to the header band and right-aligned: `contain` keeps a wide
  /// wordmark or a square icon intact rather than cropping either.
  Widget _logo() => SizedBox(
    height: _logoHeight,
    width: _logoMaxWidth,
    child: CachedNetworkImage(
      imageUrl: logoUrl!,
      fit: BoxFit.contain,
      alignment: Alignment.centerRight,
      errorWidget: (context, url, error) => const SizedBox.shrink(),
      placeholder: (context, url) => const SizedBox.shrink(),
    ),
  );

  /// Metadata that fits the given width — time, then rating, then tags —
  /// dropping from the end once the line is full.
  List<String> _fittingMeta(double width, TextStyle style, TextScaler scaler) {
    final items = <String>[
      for (final item in [timeLabel, rating, ...tags])
        if (item != null && item.trim().isNotEmpty) item.trim(),
    ];
    if (items.isEmpty) return const [];
    if (!width.isFinite) return items;

    final fitted = <String>[];
    var used = 0.0;
    for (final item in items) {
      final piece = fitted.isEmpty ? item : '$_metaSeparator$item';
      final pieceWidth = _textWidth(piece, style, scaler);
      if (used + pieceWidth > width) break;
      used += pieceWidth;
      fitted.add(item);
    }
    return fitted;
  }

  static double _measure(
    String cacheKey,
    String text,
    TextStyle style,
    TextScaler scaler,
    double Function(TextPainter) pick,
  ) {
    final key = (cacheKey, style, scaler);
    final cached = _metrics[key];
    if (cached != null) return cached;
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaler: scaler,
      maxLines: 1,
    )..layout();
    final value = pick(painter);
    painter.dispose();
    if (_metrics.length >= _metricsCap) _metrics.clear();
    _metrics[key] = value;
    return value;
  }

  static double _lineHeight(TextStyle style, TextScaler scaler) =>
      _measure('h', 'Ag', style, scaler, (p) => p.height.ceilToDouble());

  static double _textWidth(String text, TextStyle style, TextScaler scaler) =>
      _measure('w$text', text, style, scaler, (p) => p.width);


}
