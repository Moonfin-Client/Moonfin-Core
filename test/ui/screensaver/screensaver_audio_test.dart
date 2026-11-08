import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late PlaybackManager manager;

  setUp(() async {
    PlatformDetection.setTvMode(true);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    manager = PlaybackManager();
  });

  tearDown(() {
    PlatformDetection.setTvMode(false);
    manager.dispose();
  });

  /// Plays an item of [type] past the screensaver's five minute default and
  /// says whether the screensaver came up.
  Future<bool> screensaverShows(
    String type, {
    required bool duringAudio,
  }) async {
    await prefs.set(UserPreferences.screensaverDuringAudio, duringAudio);
    var shown = false;
    fakeAsync((async) {
      final controller = ScreensaverController(prefs, manager);
      manager.queueService.setQueue([
        AggregatedItem(id: 'item', serverId: 'server', rawData: {'Type': type}),
      ]);
      manager.state.setPlaying(true);
      async.flushMicrotasks();

      async.elapse(const Duration(minutes: 6));
      shown = controller.visible.value;
      controller.dispose();
    });
    return shown;
  }

  test(
    'an audiobook plays under the screensaver when that is allowed',
    () async {
      expect(await screensaverShows('AudioBook', duringAudio: true), isTrue);
    },
  );

  test('so does music', () async {
    expect(await screensaverShows('Audio', duringAudio: true), isTrue);
  });

  test('with the setting off, audio keeps the screensaver away', () async {
    expect(await screensaverShows('AudioBook', duringAudio: false), isFalse);
  });

  test('a film never plays under the screensaver', () async {
    expect(await screensaverShows('Movie', duringAudio: true), isFalse);
  });
}
