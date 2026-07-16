import 'package:flutter/material.dart';

import '../adaptive/sf_symbol.dart';

/// Paints a single thumbnail out of a trickplay sprite sheet.
///
/// A sheet holds a [tileWidth] by [tileHeight] grid of thumbnails, so showing
/// one means scaling the whole sheet up until a single tile covers this
/// widget, then sliding the wanted tile into view. [sourceRect] is the tile's
/// position in the sheet's own pixels.
class TrickplayTileImage extends StatelessWidget {
  final ImageProvider sheet;
  final Rect sourceRect;
  final double thumbWidth;
  final double thumbHeight;
  final int tileWidth;
  final int tileHeight;

  const TrickplayTileImage({
    super.key,
    required this.sheet,
    required this.sourceRect,
    required this.thumbWidth,
    required this.thumbHeight,
    required this.tileWidth,
    required this.tileHeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tileW = thumbWidth * tileWidth;
        final tileH = thumbHeight * tileHeight;
        final sheetWidth = tileW * (constraints.maxWidth / thumbWidth);
        final sheetHeight = tileH * (constraints.maxHeight / thumbHeight);
        return OverflowBox(
          // Both bounds have to be set, otherwise the sheet keeps the parent's
          // minimum and settles at its own intrinsic size, which leaves the
          // alignment below pointing at the wrong tile.
          minWidth: sheetWidth,
          minHeight: sheetHeight,
          maxWidth: sheetWidth,
          maxHeight: sheetHeight,
          alignment: Alignment(
            tileWidth <= 1
                ? 0.0
                : -1.0 + 2.0 * sourceRect.left / (tileW - thumbWidth),
            tileHeight <= 1
                ? 0.0
                : -1.0 + 2.0 * sourceRect.top / (tileH - thumbHeight),
          ),
          child: Image(
            image: sheet,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.medium,
            errorBuilder: (_, _, _) => Container(
              color: Colors.white.withValues(alpha: 0.08),
              alignment: Alignment.center,
              child: AdaptiveIcon(
                Icons.movie,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
        );
      },
    );
  }
}
