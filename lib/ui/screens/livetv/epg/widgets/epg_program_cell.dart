import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/marquee_text.dart';
import '../epg_genre.dart';

/// A single program in the guide grid. Pure presentation: the host positions it
/// (left/width along the timeline) and owns focus, passing [focused]. The genre
/// shows as a colored left bar on Material and a subtle dot on Apple; the on-now
/// program gets a progress bar, scheduled recordings a red dot.
///
/// [placeholderLabel] renders centered muted text over neutral filler, for a
/// real schedule gap; leave it null for a genre-filtered hole, which must stay
/// unlabelled. [loading] and [failed] override everything else with their own
/// treatment for a non-program placeholder cell spanning the whole row.
class EpgProgramCell extends StatelessWidget {
  static const String _metaSeparator = ' \u00B7 ';

  /// Below this content width the metadata line is dropped entirely.
  static const double _minMetaWidth = 96;

  final String title;

  final EpgGenre genre;
  final bool isLive;
  final bool isPast;
  final double progress; // 0..1
  final bool hasTimer;
  final bool focused;
  final bool apple;

  final String? placeholderLabel;
  final bool loading;
  final bool failed;
  final double textLeftPadding;

  /// Programme started before the visible window's left edge; shows a compact
  /// double-chevron continuation marker that survives even when the title has
  /// no room at all.
  final bool startsBeforeWindow;

  /// Official rating (`TV-G`, `PG-13`); first item of the metadata line.
  final String? rating;

  /// Category labels (`Sports`, `News`) shown after the rating.
  final List<String> tags;

  const EpgProgramCell({
    super.key,
    required this.title,
    required this.genre,
    required this.isLive,
    this.isPast = false,
    required this.progress,
    required this.hasTimer,
    required this.focused,
    required this.apple,
    this.placeholderLabel,
    this.loading = false,
    this.failed = false,
    this.textLeftPadding = 0,
    this.startsBeforeWindow = false,
    this.rating,
    this.tags = const [],
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.55);
    final radius = apple ? 12.0 : 6.0;

    final Color bg;
    if (focused) {
      bg = apple
          ? Colors.white.withValues(alpha: 0.18)
          : const Color(0xFF1C2C3C);
    } else if (apple) {
      bg = Colors.white.withValues(alpha: 0.06);
    } else {
      bg = isLive
          ? genre.color.withValues(alpha: 0.14)
          : AppColorScheme.surface.withValues(alpha: 0.5);
    }

    final focusBorder = focused
        ? Border.all(color: accent, width: apple ? 1.5 : 2)
        : null;

    // Loading and failed placeholders span the whole row while programs are
    // unresolved for this channel; both override the normal program layout.
    if (loading) {
      return Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadius.circular(radius),
          border: focusBorder,
        ),
        child: Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: muted),
          ),
        ),
      );
    }
    if (failed) {
      final errorColor = AppColorScheme.statusError;
      return Container(
        decoration: BoxDecoration(
          color: errorColor.withValues(alpha: 0.12),
          borderRadius: AppRadius.circular(radius),
          border:
              focusBorder ??
              Border.all(color: errorColor.withValues(alpha: 0.4)),
        ),
        child: Center(child: Icon(Icons.refresh, size: 16, color: errorColor)),
      );
    }

    // Regular weight throughout: focus and on-now already read from the
    // background tint and the focus border.
    final titleStyle = (textTheme.bodySmall ?? const TextStyle()).copyWith(
      fontWeight: FontWeight.w400,
      color: placeholderLabel != null ? muted : AppColorScheme.onSurface,
    );

    final metaStyle = (textTheme.labelSmall ?? const TextStyle(fontSize: 10))
        .copyWith(color: muted);

    final markerStyle = titleStyle.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
    );
    final showMarker = startsBeforeWindow && placeholderLabel == null;

    // Structural boundary marker: full-bleed, hard-edged, genre-tinted.
    const separatorWidth = 3.0;

    final programCell = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(radius),
        border: focusBorder,
      ),
      child: Stack(
        children: [
          if (!apple)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: separatorWidth,
                color: genre.color.withValues(
                  alpha: focused || isLive ? 0.9 : 0.5,
                ),
              ),
            ),
          LayoutBuilder(
            builder: (context, cell) {
              // A marker cell this narrow gives up its inset so the continuation
              // glyph still fits.
              final padding = showMarker && cell.maxWidth < 48
                  ? EdgeInsets.fromLTRB(2 + textLeftPadding, 4, 2, 4)
                  : EdgeInsets.fromLTRB(
                      (apple ? 10 : 12) + textLeftPadding,
                      4,
                      8,
                      4,
                    );

              final scaler = MediaQuery.textScalerOf(context);
              final titleLine = _lineHeight(titleStyle, scaler);
              final metaLine = _lineHeight(metaStyle, scaler);
              final innerWidth = cell.maxWidth.isFinite
                  ? cell.maxWidth - padding.horizontal
                  : double.infinity;
              final innerHeight = cell.maxHeight.isFinite
                  ? cell.maxHeight - padding.vertical
                  : double.infinity;

              // Metadata earns a line only when the row is tall enough for it
              // on top of a full title line; the title is never given up.
              final metaItems =
                  placeholderLabel == null && innerWidth >= _minMetaWidth
                  ? _fittingMeta(innerWidth, metaStyle, scaler)
                  : const <String>[];
              final showMetaLine =
                  metaItems.isNotEmpty && innerHeight >= titleLine + metaLine;
              // The dot and the timer marker are dropped before the title is:
              // a cell this narrow has no room for either.
              final ornaments = (apple ? 12.0 : 0.0) + (hasTimer ? 15.0 : 0.0);
              final showOrnaments =
                  !innerWidth.isFinite || innerWidth >= ornaments + 12;
              final wrapTitle =
                  placeholderLabel == null &&
                  innerWidth >= _minMetaWidth &&
                  innerHeight >=
                      2 * titleLine + (showMetaLine ? metaLine : 0.0);

              return Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  // Programmes read from the top down; a gap label stays centred.
                  mainAxisAlignment: placeholderLabel != null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    showMarker
                        ? _markerRow(titleStyle, markerStyle)
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (apple && showOrnaments) ...[
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: _genreDot(),
                                ),
                                const SizedBox(width: 6),
                              ],
                              Flexible(
                                child:
                                    focused &&
                                        !wrapTitle &&
                                        placeholderLabel == null
                                    ? MarqueeText(
                                        text: title,
                                        style: titleStyle,
                                        showDotSeparator: false,
                                      )
                                    : Text(
                                        placeholderLabel ?? title,
                                        maxLines: wrapTitle ? 2 : 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: titleStyle,
                                      ),
                              ),
                              if (hasTimer && showOrnaments) ...[
                                const SizedBox(width: 6),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: _timerDot(),
                                ),
                              ],
                            ],
                          ),
                    if (showMetaLine)
                      Text(
                        metaItems.join(_metaSeparator),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        style: metaStyle,
                      ),
                  ],
                ),
              );
            },
          ),
          // Progress reads as a seekbar, not as cell structure: range tokens
          // rather than the genre colour, on its own visible track, and held
          // clear of the boundary marker by a visible gap.
          if (isLive && progress > 0)
            Positioned(
              left: apple ? 0 : separatorWidth + AppSpacing.spaceSm,
              right: 0,
              bottom: 0,
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 4,
                backgroundColor: AppColorScheme.rangeTrack,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColorScheme.rangeProgress,
                ),
              ),
            ),
        ],
      ),
    );

    return isPast ? Opacity(opacity: 0.55, child: programCell) : programCell;
  }

  Widget _genreDot() => Container(
    width: 6,
    height: 6,
    decoration: BoxDecoration(color: genre.color, shape: BoxShape.circle),
  );

  Widget _timerDot() =>
      const Icon(Icons.fiber_manual_record, size: 9, color: Color(0xFFE0685C));

  /// Width-priority title row for a programme that started before the window:
  /// every slot is measured and allotted in order, so the continuation marker
  /// is served before the title and cannot be squeezed out or overflow the row.
  Widget _markerRow(TextStyle titleStyle, TextStyle markerStyle) {
    const markerWidth = 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        var remaining = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : double.infinity;
        double take(double want) {
          final got = want.clamp(0.0, remaining);
          remaining -= got;
          return got;
        }

        final dot = apple ? take(12) : 0.0;
        final marker = take(markerWidth);
        final gap = take(4);
        final timer = hasTimer ? take(15) : 0.0;
        final titleWidth = remaining.isFinite ? remaining : double.infinity;

        return Row(
          children: [
            if (apple)
              SizedBox(
                width: dot,
                child: Center(child: _genreDot()),
              ),
            SizedBox(
              width: marker,
              child: Icon(
                Icons.keyboard_double_arrow_left_rounded,
                size: 15,
                color: markerStyle.color,
              ),
            ),
            SizedBox(width: gap),
            SizedBox(
              width: titleWidth,
              child: focused
                  ? MarqueeText(
                      text: title,
                      style: titleStyle,
                      showDotSeparator: false,
                    )
                  : Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
            ),
            if (hasTimer)
              SizedBox(
                width: timer,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _timerDot(),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Metadata that fits the given width, rating first and tags after, dropping
  /// from the end once the line is full.
  List<String> _fittingMeta(double width, TextStyle style, TextScaler scaler) {
    final items = <String>[
      if (rating != null && rating!.trim().isNotEmpty) rating!.trim(),
      for (final tag in tags)
        if (tag.trim().isNotEmpty) tag.trim(),
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

  static double _lineHeight(TextStyle style, TextScaler scaler) {
    final painter = TextPainter(
      text: TextSpan(text: 'Ag', style: style),
      textDirection: TextDirection.ltr,
      textScaler: scaler,
      maxLines: 1,
    )..layout();
    final height = painter.height;
    painter.dispose();
    return height.ceilToDouble();
  }

  static double _textWidth(String text, TextStyle style, TextScaler scaler) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaler: scaler,
      maxLines: 1,
    )..layout();
    final width = painter.width;
    painter.dispose();
    return width;
  }
}
