import 'package:flutter/widgets.dart';

/// How far to hold the trickplay preview back from the camera housing, so it
/// covers the same rect as the picture it stands in for.
///
/// The video surface itself is held back natively, where `safeAreaInsets`
/// still describes the hardware while the player runs immersive. Only the left
/// and right sides matter, which is where the housing sits in landscape.
EdgeInsets trickplayHousingInset({
  required bool keepClear,
  required EdgeInsets viewPadding,
}) {
  if (!keepClear) return EdgeInsets.zero;
  return EdgeInsets.only(left: viewPadding.left, right: viewPadding.right);
}
