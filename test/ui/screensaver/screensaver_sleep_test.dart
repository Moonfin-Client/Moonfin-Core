import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Manager extends PlaybackManager {
  final events = <String>[];
  var stopReport = Completer<void>();

  @override
  Future<void> stop({bool userInitiated = true}) async {
    events.add('stop');
  }

  @override
  Future<void> get lastStopReport => stopReport.future;
}

const _press = KeyDownEvent(
  physicalKey: PhysicalKeyboardKey.arrowDown,
  logicalKey: LogicalKeyboardKey.arrowDown,
  timeStamp: Duration.zero,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _Manager manager;

  setUp(() async {
    PlatformDetection.setTvMode(true);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.sleepAfterIdle, 30);
    manager = _Manager();
  });

  tearDown(() {
    PlatformDetection.setTvMode(false);
    manager.dispose();
  });

  void idle(void Function(FakeAsync async, ScreensaverController c) body) {
    fakeAsync((async) {
      final controller = ScreensaverController(prefs, manager)
        ..exitApp = () async => manager.events.add('exit');
      body(async, controller);
      controller.dispose();
    });
  }

  test('closes the app once the set time passes with nothing going on', () {
    idle((async, _) {
      async.elapse(const Duration(minutes: 29));
      expect(manager.events, isEmpty);

      async.elapse(const Duration(minutes: 1));
      expect(manager.events, ['exit']);
    });
  });

  test('a button press starts the wait over', () {
    idle((async, controller) {
      async.elapse(const Duration(minutes: 20));
      controller.handleKeyEvent(_press);
      async.elapse(const Duration(minutes: 20));
      expect(manager.events, isEmpty);

      async.elapse(const Duration(minutes: 10));
      expect(manager.events, ['exit']);
    });
  });

  test('never closes while something is playing', () {
    idle((async, _) {
      manager.state.setPlaying(true);
      async.flushMicrotasks();

      async.elapse(const Duration(hours: 3));
      expect(manager.events, isEmpty);
    });
  });

  test('a paused title is stopped and reported before the app closes', () {
    manager.queueService.setQueue([
      const AggregatedItem(id: 'film', serverId: 'server', rawData: {}),
    ]);
    idle((async, _) {
      // Made on the fake clock, so completing it runs there too.
      manager.stopReport = Completer<void>();
      async.elapse(const Duration(minutes: 30));
      expect(manager.events, ['stop'], reason: 'waiting on the stop report');

      manager.stopReport.complete();
      async.flushMicrotasks();
      expect(manager.events, ['stop', 'exit']);
    });
  });

  test('stays open when the setting is off', () async {
    await prefs.set(UserPreferences.sleepAfterIdle, 0);
    idle((async, _) {
      async.elapse(const Duration(hours: 5));
      expect(manager.events, isEmpty);
    });
  });

  group('on Apple TV', () {
    void appleTv(void Function(FakeAsync async, ScreensaverController c) body) {
      idle((async, controller) {
        controller.handBackInsteadOfExit = true;
        body(async, controller);
      });
    }

    test('the screen goes back to tvOS and Moonfin stays open', () {
      appleTv((async, controller) {
        expect(controller.holdsScreenOn, isTrue);

        async.elapse(const Duration(minutes: 30));
        expect(controller.holdsScreenOn, isFalse);
        expect(manager.events, isEmpty);
      });
    });

    test('a paused title is left where it is', () {
      manager.queueService.setQueue([
        const AggregatedItem(id: 'film', serverId: 'server', rawData: {}),
      ]);
      appleTv((async, _) {
        async.elapse(const Duration(minutes: 30));
        expect(manager.events, isEmpty);
      });
    });

    test('a button press takes the screen back', () {
      appleTv((async, controller) {
        async.elapse(const Duration(minutes: 30));

        controller.handleKeyEvent(_press);
        expect(controller.holdsScreenOn, isTrue);
      });
    });

    test('waking from the tvOS screensaver takes the screen back', () {
      appleTv((async, controller) {
        async.elapse(const Duration(minutes: 30));

        controller.activityPaused = true;
        controller.activityPaused = false;
        expect(controller.holdsScreenOn, isTrue);
      });
    });
  });
}
