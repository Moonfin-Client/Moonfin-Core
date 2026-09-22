import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// The smallest strip to reserve at an edge whose bar is hidden and so reports
/// no inset of its own.
const double _kMinEdgeStrip = 48.0;

/// Whether a vertical drag starting at [dy] belongs to the system rather than
/// the player. A swipe from the top edge pulls down the notification shade and
/// one from the bottom edge is the navigation gesture, so the player leaves
/// both alone instead of changing brightness or volume under them.
///
/// [height] is the height of the surface the drag was measured against and
/// [insets] its padding.
bool startsInSystemEdgeStrip(double dy, double height, EdgeInsets insets) {
  final top = math.max(insets.top, _kMinEdgeStrip);
  final bottom = math.max(insets.bottom, _kMinEdgeStrip);
  return dy < top || dy > height - bottom;
}
