import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:moonfin/util/fullscreen_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Restoring a maximized window before fullscreen and maximizing it after
  // animated it down and back up on Windows.
  test('a maximized window is never restored on Windows', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);

    var fullscreen = false;
    final calls = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'), (
          call,
        ) async {
          switch (call.method) {
            case 'isFullScreen':
              return fullscreen;
            case 'isMaximized':
            case 'isVisible':
              return true;
            case 'setFullScreen':
              fullscreen = (call.arguments as Map)['isFullScreen'] as bool;
          }
          if (!call.method.startsWith('is')) calls.add(call.method);
          return null;
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('window_manager'),
            null,
          ),
    );

    await FullscreenHelper.setFullscreen(true);
    await FullscreenHelper.setFullscreen(false);

    expect(calls, [
      'setTitleBarStyle',
      'setFullScreen',
      'setFullScreen',
      'setTitleBarStyle',
    ]);
  });
}
