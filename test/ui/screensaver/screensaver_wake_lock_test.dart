import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';

/// Records every enable and disable the app asks the platform for. The plugin
/// hands out a fresh inhibition per enable and releases only the newest one, so
/// enabling while already held leaks an inhibition that nothing ever releases
/// and keeps the desktop from ever idling for the rest of the session.
class _RecordingWakeLock extends WakelockPlusPlatformInterface {
  _RecordingWakeLock(this.requests, {this.failures = 0});

  final List<bool> requests;

  /// Number of enable attempts that fail, standing in for a platform that
  /// refuses the lock.
  int failures;
  bool _held = false;

  @override
  bool get isMock => true;

  @override
  Future<void> toggle({required bool enable}) async {
    requests.add(enable);
    if (enable && failures > 0) {
      failures--;
      throw Exception('wake lock unavailable');
    }
    _held = enable;
  }

  @override
  Future<bool> get enabled async => _held;
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

    test('a forced refresh does not take a second wake lock', () {
      final requests = <bool>[];
      wakelockPlusPlatformInstance = _RecordingWakeLock(requests);

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);
        async.elapse(Duration.zero);
        expect(controller.holdsScreenOn, isTrue);
        expect(requests, [true]);

        // Startup and every screensaver visibility change refresh with force.
        // Forcing re-asserts the lock; it must not acquire a second one.
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

    test('a failed acquisition is retried by the next refresh', () {
      final requests = <bool>[];
      wakelockPlusPlatformInstance = _RecordingWakeLock(requests, failures: 1);

      fakeAsync((async) {
        final controller = ScreensaverController(prefs, manager);

        controller.setPlaybackActive(true);
        async.elapse(Duration.zero);
        expect(requests, [true]);

        // The attempt failed, so the refresh has to be allowed to take the lock
        // rather than giving up for the rest of the session.
        controller.refreshWakeLock();
        async.elapse(Duration.zero);
        expect(requests, [true, true]);

        controller.setPlaybackActive(false);
        async.elapse(Duration.zero);
        expect(requests, [true, true, false]);

        controller.dispose();
        async.elapse(Duration.zero);
      });
    });
  });
}
