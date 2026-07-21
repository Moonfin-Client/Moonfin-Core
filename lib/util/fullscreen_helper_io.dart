import 'package:window_manager/window_manager.dart';

import 'platform_detection.dart';

bool _wasMaximized = false;

Future<bool> isFullscreen() async {
  if (!PlatformDetection.isDesktop) return false;
  return windowManager.isFullScreen();
}

Future<void> setFullscreen(bool value) async {
  if (!PlatformDetection.isDesktop) return;
  try {
    final current = await windowManager.isFullScreen();
    if (value == current) return;
    if (value) {
      _wasMaximized = await windowManager.isMaximized();
      if (_wasMaximized) {
        // If maximized, we must unmaximize/restore first to avoid title bar remaining visible
        await windowManager.unmaximize();
      }
      await windowManager.setFullScreen(true);
    } else {
      await windowManager.setFullScreen(false);
      if (_wasMaximized) {
        await windowManager.maximize();
        _wasMaximized = false;
      }
    }
  } catch (_) {}
}
