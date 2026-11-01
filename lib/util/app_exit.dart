import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:window_manager/window_manager.dart';

import '../data/database/offline_database.dart';
import '../playback/mpv_player_registry.dart';
import 'platform_detection.dart';

class AppExit {
  static const MethodChannel _platformChannel = MethodChannel(
    'org.moonfin.androidtv/platform',
  );

  static const MethodChannel _appleTvSystemChannel = MethodChannel(
    'moonfin/appletv_system',
  );

  static bool _toreDown = false;

  /// Releases native resources that would otherwise be killed mid-operation
  /// when the process exits. Most importantly it closes the drift/SQLite
  /// database so its background isolate shuts down gracefully instead of
  /// aborting (SIGABRT) during teardown. Idempotent and safe to call from
  /// every exit path 
  static Future<void> prepareForExit() async {
    if (_toreDown) return;
    _toreDown = true;
    await MpvPlayerRegistry.instance.disposeAll();
    if (GetIt.instance.isRegistered<OfflineDatabase>()) {
      try {
        await GetIt.instance<OfflineDatabase>().close();
      } catch (_) {}
    }
  }

  static Future<void> closeApp() async {
    await prepareForExit();

    if (PlatformDetection.isAndroid) {
      try {
        final handled =
            await _platformChannel.invokeMethod<bool>('exitApp') ?? false;
        if (handled) return;
      } catch (e, st) {
        debugPrint('[AppExit] Android platform channel error: $e\n$st');
      }
    }

    if (PlatformDetection.isAppleTV) {
      try {
        await _appleTvSystemChannel.invokeMethod('exitApp');
        return;
      } catch (e, st) {
        debugPrint('[AppExit] Apple TV exit channel error: $e\n$st');
      }
    }

    if (PlatformDetection.isDesktop) {
      try {
        await windowManager.close();
        return;
      } catch (_) {}
    }

    await SystemNavigator.pop();
  }
}
