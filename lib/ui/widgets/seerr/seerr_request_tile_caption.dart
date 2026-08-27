import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The caption under a poster in the requests grid.
///
/// The grid sizes its tiles before layout, so the caption has a fixed
/// reservation rather than a measured height. Keeping the caption here, next
/// to that number, is what lets a test catch the two drifting apart.
class SeerrRequestTileCaption extends StatelessWidget {
  final String title;
  final String requestedBy;
  final String date;
  final double scale;

  /// Fills the fixed status slot: the download bar or the status pill.
  final Widget status;

  final List<Widget> actions;

  const SeerrRequestTileCaption({
    super.key,
    required this.title,
    required this.requestedBy,
    required this.date,
    required this.scale,
    required this.status,
    this.actions = const [],
  });

  /// Height a tile reserves beyond its poster at scale 1.
  ///
  /// Sized for the fullest caption, which is a pending request a manager can
  /// approve or decline: inset, title, status slot, requester, date and the
  /// action row, with a few pixels over for font line heights.
  static const double reservedHeight = 150;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
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
          Text(
            title,
            style: TextStyle(
              color: onSurface,
              fontSize: 14 * scale,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
            requestedBy,
            style: TextStyle(
              color: onSurface.withValues(alpha: 0.54),
              fontSize: 12 * scale,
            ),
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
