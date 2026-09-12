import 'package:flutter/material.dart';

import '../adaptive/sf_symbol.dart';

/// Paints a single thumbnail out of a trickplay sprite sheet.
///
/// A sheet holds a [tileWidth] by [tileHeight] grid of thumbnails, so showing
/// one means scaling the whole sheet up until a single tile covers this
/// widget, then sliding the wanted tile into view. [sourceRect] is the tile's
/// position in the sheet's own pixels.
class TrickplayTileImage extends StatefulWidget {
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
  State<TrickplayTileImage> createState() => _TrickplayTileImageState();
}

class _TrickplayTileImageState extends State<TrickplayTileImage> {
  TrickplayTileImage? _displayedTile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image(
          image: widget.sheet,
          fit: BoxFit.fill,
          gaplessPlayback: true,
          filterQuality: FilterQuality.high,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame != null || wasSynchronouslyLoaded) {
              _displayedTile = widget;
            }
            // Retain the crop as well as the old image until the new sheet is
            // decoded; applying a new crop to the old sheet shows a wrong tile.
            final tile = _displayedTile ?? widget;
            final tileW = tile.thumbWidth * tile.tileWidth;
            final tileH = tile.thumbHeight * tile.tileHeight;
            final sheetWidth = tileW * (constraints.maxWidth / tile.thumbWidth);
            final sheetHeight =
                tileH * (constraints.maxHeight / tile.thumbHeight);
            return OverflowBox(
              // Both bounds have to be set, otherwise the sheet keeps the parent's
              // minimum and settles at its own intrinsic size, which leaves the
              // alignment below pointing at the wrong tile.
              minWidth: sheetWidth,
              minHeight: sheetHeight,
              maxWidth: sheetWidth,
              maxHeight: sheetHeight,
              alignment: Alignment(
                tile.tileWidth <= 1
                    ? 0.0
                    : -1.0 +
                          2.0 *
                              tile.sourceRect.left /
                              (tileW - tile.thumbWidth),
                tile.tileHeight <= 1
                    ? 0.0
                    : -1.0 +
                          2.0 *
                              tile.sourceRect.top /
                              (tileH - tile.thumbHeight),
              ),
              child: child,
            );
          },
          errorBuilder: (_, _, _) => Container(
            color: Colors.white.withValues(alpha: 0.08),
            alignment: Alignment.center,
            child: AdaptiveIcon(
              Icons.movie,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
        );
      },
    );
  }
}
