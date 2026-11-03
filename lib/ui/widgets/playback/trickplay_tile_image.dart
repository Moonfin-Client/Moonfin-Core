import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../adaptive/sf_symbol.dart';

/// The preview and its precaches build their sheet providers here so they
/// share one image cache entry.
ImageProvider trickplaySheetProvider(
  String url,
  Map<String, String> headers, {
  required int sheetWidth,
  required int sheetHeight,
}) {
  final decode = trickplaySheetDecodeSize(
    sheetWidth,
    sheetHeight,
    PaintingBinding.instance.imageCache.maximumSizeBytes,
  );
  return ResizeImage.resizeIfNeeded(
    decode?.width,
    decode?.height,
    CachedNetworkImageProvider(url, headers: headers.isEmpty ? null : headers),
  );
}

/// The size to decode a sheet at, or null for its full size. A sheet gets at
/// most a third of the image cache so the one on screen, the next one and the
/// rest of the artwork fit together. libjpeg-turbo decodes whole eighths
/// directly, which is also faster than a full decode.
({int width, int height})? trickplaySheetDecodeSize(
  int sheetWidth,
  int sheetHeight,
  int cacheBytes,
) {
  var eighths = 8;
  // Rounded up like libjpeg-turbo's own output, so no resize pass follows.
  int scaled(int pixels) => (pixels * eighths + 7) ~/ 8;
  while (eighths > 1 &&
      scaled(sheetWidth) * scaled(sheetHeight) * 4 > cacheBytes ~/ 3) {
    eighths--;
  }
  if (eighths == 8) return null;
  return (width: scaled(sheetWidth), height: scaled(sheetHeight));
}

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
