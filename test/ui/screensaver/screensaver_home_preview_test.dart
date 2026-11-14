import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A home card can preview a whole trailer, which runs longer than the
/// screensaver's delay.
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

  test('the screensaver waits for a card preview to end', () {
    fakeAsync((async) {
      final controller = ScreensaverController(prefs, manager);
      controller.setHomePreviewActive(true);
      async.elapse(const Duration(minutes: 6));
      expect(controller.visible.value, isFalse);

      controller.setHomePreviewActive(false);
      async.elapse(const Duration(minutes: 6));
      expect(controller.visible.value, isTrue);
      controller.dispose();
    });
  });

  test('with the screensaver off, a card preview holds the screen', () async {
    await prefs.set(UserPreferences.screensaverEnabled, false);
    fakeAsync((async) {
      final controller = ScreensaverController(prefs, manager);
      expect(controller.holdsScreenOn, isFalse);

      controller.setHomePreviewActive(true);
      expect(controller.holdsScreenOn, isTrue);

      controller.setHomePreviewActive(false);
      expect(controller.holdsScreenOn, isFalse);
      controller.dispose();
    });
  });
}
