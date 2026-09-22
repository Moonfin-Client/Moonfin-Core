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

  /// Sits above [requester] so a long name gets the tile's full width rather
  /// than being cut out of a sentence.
  final String requestedByLabel;

  final String requester;
  final String date;
  final double scale;

  /// Scrolls the title when it doesn't fit. The caller decides, so only the
  /// tile under the pointer or the focus scrolls rather than the whole grid.
  final bool marqueeTitle;

  /// Fills the fixed status slot: the download bar or the status pill.
  final Widget status;

  final List<Widget> actions;

  const SeerrRequestTileCaption({
    super.key,
    required this.title,
    required this.requestedByLabel,
    required this.requester,
    required this.date,
    required this.scale,
    required this.status,
    this.marqueeTitle = false,
    this.actions = const [],
  });

  /// Height a tile reserves beyond its poster at scale 1.
  ///
  /// Sized for the fullest caption, which is a pending request a manager can
  /// approve or decline: inset, title, status slot, the requester over two
  /// lines, date and the action row, with a few pixels over for font line
  /// heights.
  static const double reservedHeight = 165;

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
          Text(
            requestedByLabel,
            style: subtleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            requester,
            style: subtleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
          if (actions.isNotEmpty) ...[
            SizedBox(height: 6 * scale),
            Row(children: actions),
          ],
        ],
      ),
    );
  }
}
