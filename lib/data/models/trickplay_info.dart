import 'dart:ui' show Rect;

import 'package:server_core/server_core.dart';

class TrickplayInfo {
  final int width;
  final int height;
  final int tileWidth;
  final int tileHeight;
  final int interval;
  final List<TrickplayFrameInfo> frames;

  const TrickplayInfo({
    required this.width,
    required this.height,
    required this.tileWidth,
    required this.tileHeight,
    required this.interval,
    this.frames = const [],
  });

  factory TrickplayInfo.fromThumbnailSet(
    TrickplayThumbnailSet thumbnailSet, {
    required int width,
  }) {
    final sorted =
        thumbnailSet.thumbnails
            .map(
              (thumbnail) => TrickplayFrameInfo(
                positionTicks: thumbnail.positionTicks,
                imageTag: thumbnail.imageTag,
              ),
            )
            .where((frame) => frame.isValid)
            .toList()
          ..sort((a, b) => a.positionTicks.compareTo(b.positionTicks));

    final frames = <TrickplayFrameInfo>[];
    for (final frame in sorted) {
      if (frames.isNotEmpty &&
          frames.last.positionTicks == frame.positionTicks) {
        frames[frames.length - 1] = frame;
      } else {
        frames.add(frame);
      }
    }

    final height = (width / thumbnailSet.aspectRatio).round();
    final interval = frames.length > 1
        ? ((frames[1].positionTicks - frames[0].positionTicks) ~/ 10000).clamp(
            1,
            1 << 31,
          )
        : 10000;
    return TrickplayInfo(
      width: width,
      height: height,
      tileWidth: 1,
      tileHeight: 1,
      interval: interval,
      frames: List.unmodifiable(frames),
    );
  }

  bool get usesIndividualFrames => frames.isNotEmpty;

  bool get isValid {
    if (width <= 0 || height <= 0) return false;
    // The frames were filtered as the list was built, and this runs on every
    // scrub, so it can't afford to walk them again.
    if (usesIndividualFrames) return true;
    return tileWidth > 0 && tileHeight > 0 && interval > 0;
  }

  int get tilesPerImage => tileWidth * tileHeight;

  TrickplayTileResolution resolveTile(Duration position) {
    if (usesIndividualFrames) {
      final positionTicks = position.inMicroseconds * 10;
      var low = 0;
      var high = frames.length - 1;
      while (low <= high) {
        final middle = low + ((high - low) >> 1);
        if (frames[middle].positionTicks <= positionTicks) {
          low = middle + 1;
        } else {
          high = middle - 1;
        }
      }
      final imageIndex = high.clamp(0, frames.length - 1);
      final frame = frames[imageIndex];
      return TrickplayTileResolution(
        imageIndex: imageIndex,
        sourceRect: Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        thumbWidth: width.toDouble(),
        thumbHeight: height.toDouble(),
        tileWidth: 1,
        tileHeight: 1,
        positionTicks: frame.positionTicks,
        imageTag: frame.imageTag,
      );
    }

    final positionMs = position.inMilliseconds;
    final tileIndex = positionMs ~/ interval;
    final perImage = tilesPerImage;
    final tileOffset = tileIndex % perImage;
    final imageIndex = tileIndex ~/ perImage;

    final col = tileOffset % tileWidth;
    final row = tileOffset ~/ tileWidth;
    final offsetX = (col * width).toDouble();
    final offsetY = (row * height).toDouble();

    return TrickplayTileResolution(
      imageIndex: imageIndex,
      sourceRect: Rect.fromLTWH(
        offsetX,
        offsetY,
        width.toDouble(),
        height.toDouble(),
      ),
      thumbWidth: width.toDouble(),
      thumbHeight: height.toDouble(),
      tileWidth: tileWidth,
      tileHeight: tileHeight,
    );
  }

  static TrickplayInfo? fromItemData(
    Map<String, dynamic> rawData, {
    String? mediaSourceId,
  }) {
    final trickplay = rawData['Trickplay'] as Map<String, dynamic>?;
    if (trickplay == null || trickplay.isEmpty) return null;

    Map<String, dynamic>? resolutions;
    if (mediaSourceId != null && trickplay.containsKey(mediaSourceId)) {
      resolutions = (trickplay[mediaSourceId] as Map?)?.cast<String, dynamic>();
    }
    resolutions ??=
        (trickplay.values.first as Map?)?.cast<String, dynamic>();

    if (resolutions == null || resolutions.isEmpty) return null;

    final info =
        (resolutions.values.first as Map?)?.cast<String, dynamic>();
    if (info == null) return null;

    return TrickplayInfo(
      width: (info['Width'] as num?)?.toInt() ?? 0,
      height: (info['Height'] as num?)?.toInt() ?? 0,
      tileWidth: (info['TileWidth'] as num?)?.toInt() ?? 0,
      tileHeight: (info['TileHeight'] as num?)?.toInt() ?? 0,
      interval: (info['Interval'] as num?)?.toInt() ?? 0,
    );
  }
}

class TrickplayTileResolution {
  final int imageIndex;
  final Rect sourceRect;
  final double thumbWidth;
  final double thumbHeight;
  final int tileWidth;
  final int tileHeight;
  final int? positionTicks;
  final String? imageTag;

  const TrickplayTileResolution({
    required this.imageIndex,
    required this.sourceRect,
    required this.thumbWidth,
    required this.thumbHeight,
    required this.tileWidth,
    required this.tileHeight,
    this.positionTicks,
    this.imageTag,
  });
}

class TrickplayFrameInfo {
  final int positionTicks;
  final String imageTag;

  const TrickplayFrameInfo({
    required this.positionTicks,
    required this.imageTag,
  });

  bool get isValid => positionTicks >= 0 && imageTag.isNotEmpty;
}

class TrickplayTile {
  final String url;
  final Map<String, String> headers;
  final TrickplayTileResolution resolution;

  const TrickplayTile({
    required this.url,
    required this.headers,
    required this.resolution,
  });

  Rect get sourceRect => resolution.sourceRect;
  double get thumbWidth => resolution.thumbWidth;
  double get thumbHeight => resolution.thumbHeight;
  int get tileWidth => resolution.tileWidth;
  int get tileHeight => resolution.tileHeight;
}
