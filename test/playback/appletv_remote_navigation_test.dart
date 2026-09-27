import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/appletv_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const control = MethodChannel('moonfin/appletv_video_control');
  const events = MethodChannel('moonfin/appletv_video_events');
  final calls = <MethodCall>[];
  late AppleTvBackend backend;

  setUp(() async {
    calls.clear();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(control, (call) async {
      calls.add(call);
      return null;
    });
    messenger.setMockMethodCallHandler(events, (_) async => null);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    backend = AppleTvBackend(UserPreferences(store));
  });

  tearDown(() => backend.dispose());

  test('the session navigation bridge preserves each command', () async {
    for (final command in [
      'moveup',
      'movedown',
      'moveleft',
      'moveright',
      'select',
      'back',
    ]) {
      await backend.sendRemoteNavigation(command);
      expect(calls.last.method, 'remoteNavigation');
      expect(calls.last.arguments, {'command': command});
    }
  });

  test(
    'audio-only playback does not claim the visible native player',
    () async {
      expect(backend.isPlayerPresented, isFalse);
      await backend.play({
        'url': 'https://example.com/audio',
        'mediaType': 'audio',
      });
      expect(backend.isPlayerPresented, isFalse);
      await backend.dismissPlayer();
      await backend.play({
        'url': 'https://example.com/video',
        'mediaType': 'video',
      });
      expect(backend.isPlayerPresented, isTrue);
      await backend.dismissPlayer();
      expect(backend.isPlayerPresented, isFalse);
    },
  );
}
