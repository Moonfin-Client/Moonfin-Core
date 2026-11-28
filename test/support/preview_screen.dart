import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/platform_detection.dart';

/// Gives the test window a phone's screen for the phone interface, since the
/// previews on a native phone or tablet lay out at the app window's real size.
void usePreviewScreenOf(InterfaceLayout layout) {
  if (layout == InterfaceLayout.phone) usePreviewScreen(const Size(390, 844));
}

/// Gives the test window [size] logical pixels until the test ends.
void usePreviewScreen(Size size) {
  final view =
      TestWidgetsFlutterBinding.instance.platformDispatcher.implicitView!;
  view.physicalSize = size;
  view.devicePixelRatio = 1;
  addTearDown(view.reset);
}
