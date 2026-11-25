import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/platform_detection.dart';

/// Gives the test window the screen of a typical device of [layout], since
/// the settings and setup previews lay out at the app window's real size. A
/// desktop gets 1280×800, just over the 1200×760 a macOS window can shrink to.
void usePreviewScreenOf(InterfaceLayout layout) => usePreviewScreen(
  switch (layout) {
    InterfaceLayout.tv => const Size(1920, 1080),
    InterfaceLayout.phone => const Size(390, 844),
    _ => const Size(1280, 800),
  },
);

/// Gives the test window [size] logical pixels until the test ends.
void usePreviewScreen(Size size) {
  final view =
      TestWidgetsFlutterBinding.instance.platformDispatcher.implicitView!;
  view.physicalSize = size;
  view.devicePixelRatio = 1;
  addTearDown(view.reset);
}
