import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:moonfin/util/fullscreen_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// The window_manager calls that change the window while it enters and
  /// leaves fullscreen, with the title bar style spelled out.
  Future<List<String>> enterAndLeaveFullscreen(
    TargetPlatform platform, {
    required bool maximized,
  }) async {
    debugDefaultTargetPlatformOverride = platform;
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
              return maximized;
            case 'isVisible':
              return true;
            case 'setFullScreen':
              fullscreen = (call.arguments as Map)['isFullScreen'] as bool;
            case 'setTitleBarStyle':
              calls.add(
                'setTitleBarStyle:${(call.arguments as Map)['titleBarStyle']}',
              );
              return null;
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
    return calls;
  }

  test('a maximized window is never restored on Windows', () async {
    expect(
      await enterAndLeaveFullscreen(TargetPlatform.windows, maximized: true),
      [
        'setTitleBarStyle:hidden',
        'setFullScreen',
        'setFullScreen',
        'setTitleBarStyle:normal',
      ],
    );
  });

  test('an unmaximized window just goes fullscreen on Windows', () async {
    expect(
      await enterAndLeaveFullscreen(TargetPlatform.windows, maximized: false),
      ['setFullScreen', 'setFullScreen'],
    );
  });

  test('a zoomed window is never unzoomed on macOS', () async {
    expect(
      await enterAndLeaveFullscreen(TargetPlatform.macOS, maximized: true),
      ['setFullScreen', 'setFullScreen'],
    );
  });

  test('a maximized window is still restored on Linux', () async {
    expect(
      await enterAndLeaveFullscreen(TargetPlatform.linux, maximized: true),
      ['unmaximize', 'setFullScreen', 'setFullScreen', 'maximize'],
    );
  });

  test('playback only exits fullscreen after a completed windowed entry', () {
    expect(FullscreenHelper.shouldExitPlaybackFullscreen(false), isTrue);
    expect(FullscreenHelper.shouldExitPlaybackFullscreen(true), isFalse);
    expect(FullscreenHelper.shouldExitPlaybackFullscreen(null), isFalse);
  });

  group('maximizedAfterWindowEvent', () {
    tearDown(() => debugDefaultTargetPlatformOverride = null);

    test('follows maximize and unmaximize and ignores the rest', () {
      expect(
        FullscreenHelper.maximizedAfterWindowEvent('maximize', false),
        true,
      );
      expect(
        FullscreenHelper.maximizedAfterWindowEvent('unmaximize', true),
        false,
      );
      expect(FullscreenHelper.maximizedAfterWindowEvent('resize', true), true);
    });

    test('leaving fullscreen on Windows means the window was restored', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      expect(
        FullscreenHelper.maximizedAfterWindowEvent('leave-full-screen', true),
        false,
      );
    });

    test('leaving fullscreen on macOS keeps the window zoomed', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      expect(
        FullscreenHelper.maximizedAfterWindowEvent('leave-full-screen', true),
        true,
      );
    });
  });
}
