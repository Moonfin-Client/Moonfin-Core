import 'package:window_manager/window_manager.dart';

import 'platform_detection.dart';

bool _wasMaximized = false;

bool isSupported() => PlatformDetection.isDesktop;

Future<void> lockLandscape() async {}

Future<void> unlockOrientation() async {}

Future<bool> isFullscreen() async {
  if (!PlatformDetection.isDesktop) return false;
  return windowManager.isFullScreen();
}

Future<void> setFullscreen(bool value) async {
  if (!PlatformDetection.isDesktop) return;
  try {
    final current = await windowManager.isFullScreen();
    if (value == current) return;
    // On Windows, window_manager saves the window style the first time it
    // switches and writes it back later, so a style saved before the window
    // shows hides it and leaves its last frame on screen. On launch this can
    // run before show() lands, so wait for the window first.
    final visible =
        PlatformDetection.isWindows &&
        (value ? await _waitUntilVisible() : await windowManager.isVisible());
    if (value) {
      // macOS fullscreen hides the title bar itself and puts a zoomed window
      // back afterwards, so it skips the restore below.
      _wasMaximized =
          !PlatformDetection.isMacOS && await windowManager.isMaximized();
      if (_wasMaximized) {
        // A maximized window keeps its title bar in fullscreen. On Windows
        // hide it instead of restoring, which animates the window down and up.
        if (PlatformDetection.isWindows) {
          await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
        } else {
          await windowManager.unmaximize();
        }
      }
      await windowManager.setFullScreen(true);
    } else {
      await windowManager.setFullScreen(false);
      if (_wasMaximized) {
        if (PlatformDetection.isWindows) {
          await windowManager.setTitleBarStyle(TitleBarStyle.normal);
        } else {
          await windowManager.maximize();
        }
        _wasMaximized = false;
      }
    }
    // An earlier switch may have saved the style while hidden, so bring the
    // window back if this one hid it.
    if (visible && !await windowManager.isVisible()) {
      await windowManager.show();
    }
  } catch (_) {}
}

Future<bool> _waitUntilVisible() async {
  for (var i = 0; i < 60; i++) {
    if (await windowManager.isVisible()) return true;
    await Future<void>.delayed(const Duration(milliseconds: 16));
  }
  return false;
}
