import 'package:flutter/widgets.dart';

/// Box art shape rules, in multiples of a surface's portrait card width.
abstract final class RetroArtworkShape {
  /// Art never draws taller than the portrait card.
  static const double portraitHeightRatio = 1.34;

  static const double landscapeMaxWidthFactor = 1.5;
  static const double landscapeWidthSlope = 1.16;
  static const double minAspectRatio = 0.69;
  static const double maxAspectRatio = 1.5;

  /// Portrait and square art keep the card width and get shorter; landscape
  /// widens up to [landscapeMaxWidthFactor]. Null is today's portrait card.
  static RetroArtworkCellFactors cellFor(double? aspectRatio) {
    if (aspectRatio == null || !aspectRatio.isFinite || aspectRatio <= 0) {
      return RetroArtworkCellFactors.portrait;
    }
    final ratio = aspectRatio.clamp(minAspectRatio, maxAspectRatio).toDouble();
    if (ratio <= 1) {
      final height = 1 / ratio;
      return RetroArtworkCellFactors(
        width: 1,
        height: height < portraitHeightRatio ? height : portraitHeightRatio,
      );
    }
    final grown = 1 + (ratio - 1) * landscapeWidthSlope;
    final width = grown < landscapeMaxWidthFactor
        ? grown
        : landscapeMaxWidthFactor;
    return RetroArtworkCellFactors(width: width, height: width / ratio);
  }

  /// Whether art would leave a visible gap in a cell of [cellAspectRatio].
  static bool needsFill(double? aspectRatio, double cellAspectRatio) {
    if (aspectRatio == null || cellAspectRatio <= 0) return false;
    final difference = aspectRatio / cellAspectRatio;
    return difference < 0.95 || difference > 1.05;
  }
}

@immutable
class RetroArtworkCellFactors {
  const RetroArtworkCellFactors({required this.width, required this.height});

  static const RetroArtworkCellFactors portrait = RetroArtworkCellFactors(
    width: 1,
    height: RetroArtworkShape.portraitHeightRatio,
  );

  final double width;
  final double height;

  double get aspectRatio => width / height;

  @override
  bool operator ==(Object other) =>
      other is RetroArtworkCellFactors &&
      other.width == width &&
      other.height == height;

  @override
  int get hashCode => Object.hash(width, height);
}
