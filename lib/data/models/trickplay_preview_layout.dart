import 'dart:math' as math;

import 'trickplay_strip_resolution.dart';

class TrickplayPreviewLayout {
  const TrickplayPreviewLayout._();

  static const seekThumbRadius = 7.0;

  static double trackXForPosition({
    required double positionMs,
    required double durationMs,
    required double trackWidth,
  }) {
    final fraction = durationMs > 0
        ? (positionMs / durationMs).clamp(0.0, 1.0)
        : 0.0;
    return seekThumbRadius +
        fraction * math.max(trackWidth - 2 * seekThumbRadius, 0.0);
  }

  static double resolveSingleLeft({
    required double positionMs,
    required double durationMs,
    required double trackWidth,
    required double tileWidth,
    required bool followScrub,
  }) {
    if (!followScrub) return (trackWidth - tileWidth) / 2;
    final thumbX = trackXForPosition(
      positionMs: positionMs,
      durationMs: durationMs,
      trackWidth: trackWidth,
    );
    return (thumbX - tileWidth / 2)
        .clamp(0.0, math.max(0.0, trackWidth - tileWidth))
        .toDouble();
  }

  static TrickplayStripLayout resolveStrip({
    required double mainTileLeft,
    required double trackWidth,
    required double tileWidth,
    required double spacing,
    int maxSlotsPerSide = 500,
    double overflowMargin = 0,
  }) {
    final step = tileWidth + spacing;
    if (step <= 0) {
      return TrickplayStripLayout(
        leftCount: 0,
        rightCount: 0,
        leftOffset: mainTileLeft,
      );
    }
    final leftCount = (((mainTileLeft + overflowMargin) / step).floor() + 1)
        .clamp(0, maxSlotsPerSide);
    final rightCount =
        (((trackWidth + overflowMargin - mainTileLeft - tileWidth) / step)
                .floor() +
            1)
            .clamp(0, maxSlotsPerSide);
    return TrickplayStripLayout(
      leftCount: leftCount,
      rightCount: rightCount,
      leftOffset: mainTileLeft - leftCount * step,
    );
  }

  static const verticalTravelBottomMargin = 150.0;

  static const verticalTravelTopMargin = 120.0;

  static double resolveVerticalTravelMax({
    required double rawMaxTravel,
    required double trackWidth,
  }) {
    return math.max(math.min(rawMaxTravel, trackWidth), 0.0);
  }

  static double resolveVerticalTravel(
    int verticalPositionPercent, {
    required double maxTravel,
  }) {
    final percent = verticalPositionPercent.clamp(0, 100) / 100;
    return percent * math.max(maxTravel, 0.0);
  }

  static TrickplayPreviewPlan plan({
    required double trackWidth,
    required int scalePercent,
    required double aspect,
    required double maxHeightBudget,
    required double positionMs,
    required double durationMs,
    required bool followScrub,
    required int verticalPositionPercent,
    required bool isStrip,
    required double spacing,
    required double overflowMargin,
    required Duration seekPosition,
    required Duration totalDuration,
    required int stepMs,
  }) {
    final tileSize = resolveTileSize(
      trackWidth: trackWidth,
      scalePercent: scalePercent,
      aspect: aspect,
      maxHeightBudget: maxHeightBudget,
    );
    final verticalTravel = resolveVerticalTravel(
      verticalPositionPercent,
      maxTravel: resolveVerticalTravelMax(
        rawMaxTravel: maxHeightBudget - tileSize.height,
        trackWidth: trackWidth,
      ),
    );
    final mainTileLeft = resolveSingleLeft(
      positionMs: positionMs,
      durationMs: durationMs,
      trackWidth: trackWidth,
      tileWidth: tileSize.width,
      followScrub: followScrub,
    );
    final strip = isStrip
        ? resolveStrip(
            mainTileLeft: mainTileLeft,
            trackWidth: trackWidth,
            tileWidth: tileSize.width,
            spacing: spacing,
            overflowMargin: overflowMargin,
          )
        : TrickplayStripLayout(
            leftCount: 0,
            rightCount: 0,
            leftOffset: mainTileLeft,
          );
    final slots = TrickplayStripResolver.resolve(
      fakeTimelinePosition: seekPosition,
      totalDuration: totalDuration,
      stepMs: stepMs,
      slotCount: strip.slotCount,
      highlightIndex: strip.highlightIndex,
    );
    return TrickplayPreviewPlan(
      tileWidth: tileSize.width,
      tileHeight: tileSize.height,
      verticalTravel: verticalTravel,
      leftOffset: strip.leftOffset,
      leftCount: strip.leftCount,
      rightCount: strip.rightCount,
      slotsByIndex: {for (final slot in slots) slot.slotIndex: slot},
    );
  }

  static TrickplayTileSize resolveTileSize({
    required double trackWidth,
    required int scalePercent,
    required double aspect,
    required double maxHeightBudget,
  }) {
    final scale = 0.5 + (scalePercent.clamp(10, 100) - 10) / 90 * 1.5;
    final safeHeightBudget = math.max(maxHeightBudget, 32.0);
    final safeTrackWidth = math.max(trackWidth, 24.0);
    final desiredHeight = (safeHeightBudget * (scale / 2.0)).clamp(
      24.0,
      safeHeightBudget,
    );
    final height = math.min(desiredHeight, safeTrackWidth * aspect);
    return TrickplayTileSize(width: height / aspect, height: height);
  }
}

/// Everything a preview needs to draw itself, worked out once here so the
/// player and the settings preview do not drift apart.
class TrickplayPreviewPlan {
  final double tileWidth;
  final double tileHeight;
  final double verticalTravel;
  final double leftOffset;
  final int leftCount;
  final int rightCount;
  final Map<int, TrickplayStripSlot> slotsByIndex;

  const TrickplayPreviewPlan({
    required this.tileWidth,
    required this.tileHeight,
    required this.verticalTravel,
    required this.leftOffset,
    required this.leftCount,
    required this.rightCount,
    required this.slotsByIndex,
  });
}

class TrickplayTileSize {
  final double width;
  final double height;

  const TrickplayTileSize({required this.width, required this.height});
}

class TrickplayStripLayout {
  final int leftCount;
  final int rightCount;
  final double leftOffset;

  const TrickplayStripLayout({
    required this.leftCount,
    required this.rightCount,
    required this.leftOffset,
  });

  int get slotCount => leftCount + 1 + rightCount;
  int get highlightIndex => leftCount;
}
