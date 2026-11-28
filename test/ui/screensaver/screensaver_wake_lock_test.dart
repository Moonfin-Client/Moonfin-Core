import 'dart:async';
import 'dart:io';
import 'dart:ui' show AppLifecycleState;

import 'package:fake_async/fake_async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';

class _RecordingWakeLock extends WakelockPlusPlatformInterface {
  _RecordingWakeLock(this.requests);

  final List<bool> requests;

  @override
  bool get isMock => true;

  @override
  Future<void> toggle({required bool enable}) async => requests.add(enable);
}

/// Holds every request open until the test completes it, so requests that
/// overlap on a real bus can overlap here too.
class _SlowWakeLock extends WakelockPlusPlatformInterface {
  final requests = <bool>[];
  final pending = <Completer<void>>[];
  var inFlight = 0;
  var maxInFlight = 0;

  @override
  bool get isMock => true;

  @override
  Future<void> toggle({required bool enable}) async {
    requests.add(enable);
    inFlight++;
    if (inFlight > maxInFlight) maxInFlight = inFlight;
    final done = Completer<void>();
    pending.add(done);
    try {
      await done.future;
    } finally {
      inFlight--;
    }
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late PlaybackManager manager;
  late WakelockPlusPlatformInterface original;

  setUp(() async {
    original = wakelockPlusPlatformInstance;
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    manager = PlaybackManager();
  });

  tearDown(() {
    wakelockPlusPlatformInstance = original;
    PlatformDetection.setTvMode(false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    manager.dispose();
  });

  group('on the TV layout', () {
    setUp(() => PlatformDetection.setTvMode(true));
    tearDown(() => PlatformDetection.setTvMode(false));

    test('a refresh does not take a second wake lock', () {
      final requests = <bool>[];
      wakelockPlusPlatformInstance = _RecordingWakeLock(requests);

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);
        async.elapse(Duration.zero);
        expect(controller.holdsScreenOn, isTrue);
        expect(requests, [true]);

        controller.refreshWakeLock();
        controller.refreshWakeLock();
        async.elapse(Duration.zero);

        expect(requests, [true]);
        controller.dispose();
        async.elapse(Duration.zero);
        expect(requests, [true, false]);
      });
    });
  });

  group('on the desktop layout', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop));
    tearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );

    test('a playback session takes one wake lock and releases it', () {
      final requests = <bool>[];
      wakelockPlusPlatformInstance = _RecordingWakeLock(requests);

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);
        async.elapse(Duration.zero);
        expect(requests, isEmpty);

        controller.setPlaybackActive(true);
        async.elapse(Duration.zero);
        expect(requests, [true]);

        controller.setPlaybackActive(false);
        async.elapse(Duration.zero);
        expect(requests, [true, false]);

        controller.setPlaybackActive(true);
        controller.refreshWakeLock();
        async.elapse(Duration.zero);
        expect(requests, [true, false, true]);

        controller.dispose();
        async.elapse(Duration.zero);
        expect(requests, [true, false, true, false]);
      });
    });

    test('requests never overlap and the newest state wins', () {
      final platform = _SlowWakeLock();
      wakelockPlusPlatformInstance = platform;

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);
        controller.setPlaybackActive(true);
        controller.setPlaybackActive(false);
        controller.setPlaybackActive(true);
        controller.setPlaybackActive(false);
        async.flushMicrotasks();
        expect(platform.requests, [true]);

        platform.pending.last.complete();
        async.flushMicrotasks();
        expect(platform.requests, [true, false]);

        platform.pending.last.complete();
        async.flushMicrotasks();
        expect(platform.requests, [true, false]);
        expect(platform.maxInFlight, 1);
        controller.dispose();
      });
    });

    test('a failed enable is retried without a second lock', () {
      final platform = _SlowWakeLock();
      wakelockPlusPlatformInstance = platform;

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);
        controller.setPlaybackActive(true);
        controller.setPlaybackActive(false);
        controller.setPlaybackActive(true);
        async.flushMicrotasks();
        platform.pending.last.completeError(Exception('refused'));
        async.flushMicrotasks();

        controller.refreshWakeLock();
        async.flushMicrotasks();
        platform.pending.last.complete();
        async.flushMicrotasks();
        controller.refreshWakeLock();
        async.flushMicrotasks();

        expect(platform.requests, [true, true]);
        expect(platform.maxInFlight, 1);
        controller.dispose();
      });
    });
  });

  test('a desktop window that only loses focus keeps playback awake', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    expect(
      ScreensaverController.pausesActivity(AppLifecycleState.inactive),
      isFalse,
    );
    expect(
      ScreensaverController.pausesActivity(AppLifecycleState.hidden),
      isTrue,
    );

    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(
      ScreensaverController.pausesActivity(AppLifecycleState.inactive),
      isTrue,
    );
    expect(
      ScreensaverController.pausesActivity(AppLifecycleState.resumed),
      isFalse,
    );
  });

  // media_kit's Video takes its own wake lock, and wakelock_plus on Linux only
  // remembers the newest one, so a second owner leaks a lock per playback.
  test('every media_kit Video leaves the wake lock to the controller', () {
    final missing = <String>[];
    for (final file in Directory('lib').listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) continue;
      final source = file.readAsStringSync();
      for (final match in RegExp(r'\bVideo\(').allMatches(source)) {
        var depth = 0;
        var end = match.end - 1;
        do {
          final char = source[end++];
          if (char == '(') depth++;
          if (char == ')') depth--;
        } while (depth > 0);
        if (!source.substring(match.start, end).contains('wakelock: false')) {
          final line = '\n'.allMatches(source.substring(0, match.start)).length;
          missing.add('${file.path}:${line + 1}');
        }
      }
    }
    expect(missing, isEmpty);
  });
}
