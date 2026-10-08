import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../marquee_text.dart';

/// The caption under a poster in the requests grid.
///
/// The grid sizes its tiles before layout, so the caption has a fixed
/// reservation rather than a measured height. Keeping the caption here, next
/// to that number, is what lets a test catch the two drifting apart.
class SeerrRequestTileCaption extends StatelessWidget {
  final String title;

  /// The whole "Requested by name" sentence, shown when it fits the tile.
  final String requestedByLine;

  /// Above [requester] when [requestedByLine] does not fit, so a long name
  /// gets the tile's full width rather than being cut out of a sentence.
  final String requestedByLabel;

  final String requester;
  final String date;
  final double scale;

  /// Scrolls the title when it doesn't fit. The caller decides, so only the
  /// tile under the pointer or the focus scrolls rather than the whole grid.
  final bool marqueeTitle;

  /// Fills the fixed status slot: the download bar or the status pill.
  final Widget status;

  const SeerrRequestTileCaption({
    super.key,
    required this.title,
    required this.requestedByLine,
    required this.requestedByLabel,
    required this.requester,
    required this.date,
    required this.scale,
    required this.status,
    this.marqueeTitle = false,
  });

  /// Height a tile reserves beyond its poster at scale 1 and system text
  /// size 100%.
  ///
  /// Inset, title, status slot, the requester over two lines and the date,
  /// with a few pixels over for font line heights.
  static const double reservedHeight = 127;

  /// The part of [reservedHeight] that is text: the title line and three
  /// 12px lines. It grows with the system text size, the rest does not.
  /// Measured: the caption grows by about 71 per 1.0 of text scale.
  static const double _textHeight = 72;

  /// [reservedHeight] with the text part grown by [textScaler]. Without it a
  /// TV set to a larger font cut the date off the bottom of every tile.
  static double heightFor(double scale, TextScaler textScaler) =>
      (reservedHeight + textScaler.scale(_textHeight) - _textHeight) * scale;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final textScaler = MediaQuery.textScalerOf(context);
    final titleFontSize = 14 * scale;
    final titleStyle = TextStyle(
      color: onSurface,
      fontSize: titleFontSize,
      fontWeight: FontWeight.w600,
    );
    final subtleStyle = TextStyle(
      color: onSurface.withValues(alpha: 0.54),
      fontSize: 12 * scale,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        10 * scale,
        8 * scale,
        10 * scale,
        10 * scale,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // A marquee scrolls inside its box, so the line needs its own
          // height rather than taking one from the text.
          SizedBox(
            height: textScaler.scale(titleFontSize) * 1.2 + 2,
            width: double.infinity,
            child: marqueeTitle
                ? MarqueeText(text: title, style: titleStyle)
                : Text(
                    title,
                    style: titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          SizedBox(height: 4 * scale),
          // Fixed height. The bar is taller than a status word and the poster
          // takes what the caption leaves, so reserve one height to keep
          // posters level across a row.
          SizedBox(
            height: 26 * scale,
            width: double.infinity,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: status,
            ),
          ),
          SizedBox(height: 4 * scale),
          // One line when the sentence fits. The tile still reserves two, so
          // a short name leaves a line free under the date.
          LayoutBuilder(
            builder: (context, constraints) {
              final painter = TextPainter(
                text: TextSpan(text: requestedByLine, style: subtleStyle),
                textDirection: Directionality.of(context),
                textScaler: textScaler,
                maxLines: 1,
              )..layout(maxWidth: constraints.maxWidth);
              final fits = !painter.didExceedMaxLines;
              painter.dispose();
              final lines = fits
                  ? [requestedByLine]
                  : [requestedByLabel, requester];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final line in lines)
                    Text(
                      line,
                      style: subtleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              );
            },
          ),
          if (date.isNotEmpty)
            Text(
              date,
              style: TextStyle(
                color: onSurface.withValues(alpha: 0.38),
                fontSize: 12 * scale,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
