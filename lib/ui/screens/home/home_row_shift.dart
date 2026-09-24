import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

/// How a home row is drawn while the info overlay or full-screen rows are
/// active: hidden, faded, shifted up, or clipped where it passes behind the
/// overlay.
///
/// The row builder used to return a different widget tree for each of these
/// cases, a bare child for one, an Opacity for another, a Visibility for a
/// third, so as focus moved and a row changed case its element tree was torn
/// down and built again. Now every row is wrapped the same way and only the
/// values change.
@immutable
class HomeRowShift {
  const HomeRowShift({
    this.hidden = false,
    this.ignorePointer = false,
    this.opacity = 1.0,
    this.shift = 0.0,
    this.clipTop = 0.0,
  });

  static const none = HomeRowShift();

  /// Laid out but neither painted nor ticking. Its elements and images stay.
  final bool hidden;
  final bool ignorePointer;
  final double opacity;

  /// Points to move the row up by.
  final double shift;

  /// Points of the row's top to clip away, for the classic overlay.
  final double clipTop;

  bool get needsClip => clipTop > 0 || shift > 0;

  @override
  bool operator ==(Object other) =>
      other is HomeRowShift &&
      other.hidden == hidden &&
      other.ignorePointer == ignorePointer &&
      other.opacity == opacity &&
      other.shift == shift &&
      other.clipTop == clipTop;

  @override
  int get hashCode =>
      Object.hash(hidden, ignorePointer, opacity, shift, clipTop);
}

/// How far into the overlay band a row has travelled, from 0 at the edge to
/// 1 once it is fully behind.
double _overlayProgress(double rowViewportTop, double overlayBottom) {
  const transitionRange = 40.0;
  return ((overlayBottom + 20 - rowViewportTop) / transitionRange).clamp(
    0.0,
    1.0,
  );
}

/// How far a row slides up as the overlay reaches it.
double homeRowOverlayShift({
  required double rowViewportTop,
  required double rowExtent,
  required double overlayBottom,
}) {
  if (rowViewportTop >= overlayBottom + 20) return 0;
  final fullShift = (rowViewportTop + rowExtent + 10).clamp(
    0.0,
    double.infinity,
  );
  final progress = _overlayProgress(rowViewportTop, overlayBottom);
  return Curves.easeIn.transform(progress) * fullShift * 1.5;
}

/// The treatment for one row. [classicClipTop] is only read in classic mode.
HomeRowShift homeRowShiftFor({
  required bool overlayActive,
  required bool fullScreenV2,
  required bool classicMode,
  required bool isFocusedRow,
  required int rowDistance,
  required double rowViewportTop,
  required double rowExtent,
  required double viewportHeight,
  required double overlayBottom,
  required double classicClipTop,
}) {
  if (!overlayActive && !fullScreenV2) return HomeRowShift.none;

  if (classicMode) {
    if (classicClipTop <= 0.0) return HomeRowShift.none;
    return HomeRowShift(clipTop: classicClipTop);
  }

  final rowViewportBottom = rowViewportTop + rowExtent;
  final isVisibleOnScreen =
      rowViewportBottom > 0 && rowViewportTop < viewportHeight;
  final isUnderOverlay = rowViewportBottom <= overlayBottom + 8;

  if (isFocusedRow) return HomeRowShift.none;

  // Neighbours stay in the tree, invisible, so focus can move to them.
  if (rowDistance == 1) {
    return const HomeRowShift(ignorePointer: true, opacity: 0.0);
  }

  // Far rows off screen stop painting and ticking but keep their elements,
  // and with them their decoded posters, so scrolling back doesn't start
  // from placeholders.
  if (rowDistance > 1 && !isVisibleOnScreen) {
    return const HomeRowShift(ignorePointer: true, opacity: 0.0, hidden: true);
  }

  if (isUnderOverlay) {
    return const HomeRowShift(ignorePointer: true, opacity: 0.0);
  }

  final shift = homeRowOverlayShift(
    rowViewportTop: rowViewportTop,
    rowExtent: rowExtent,
    overlayBottom: overlayBottom,
  );
  if (shift <= 0) return HomeRowShift.none;

  final progress = _overlayProgress(rowViewportTop, overlayBottom);
  final opacity = (1.0 - (progress * 1.4)).clamp(0.0, 1.0);
  return HomeRowShift(shift: shift, opacity: opacity);
}
