import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/playback/native_apple_player_backend.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import '../util/media_segment_fakes.dart' show testPrefs;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  for (final (name, create)
      in <(String, PlayerBackend Function(UserPreferences))>[
        ('media3_video', Media3PlayerBackend.new),
        ('ios_aether', AetherBackend.new),
        ('native_apple_player', NativeApplePlayerBackend.new),
      ]) {
    test('$name preserves delay until a new viewing session', () async {
      final prefs = await testPrefs();
      final calls = <MethodCall>[];
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      final control = MethodChannel('moonfin/${name}_control');
      final events = MethodChannel('moonfin/${name}_events');
      messenger.setMockMethodCallHandler(control, (call) async {
        calls.add(call);
        return null;
      });
      messenger.setMockMethodCallHandler(events, (_) async => null);
      final backend = create(prefs);
      addTearDown(() {
        backend.dispose();
        prefs.dispose();
        messenger.setMockMethodCallHandler(control, null);
        messenger.setMockMethodCallHandler(events, null);
      });

      Future<void> open(int? session, {String url = 'https://server/video'}) =>
          backend.play({'url': url, 'subtitleDelaySessionId': session, 'secondarySubtitleTrackId': 3});
      Map source() => calls.lastWhere((c) => c.method == 'setSource').arguments as Map;

      await open(1);
      expect(source()['secondarySubtitleTrackId'], 3);
      await backend.setSubtitleDelay(1.25);
      await backend.disableSubtitleTrack();
      await backend.setSecondarySubtitle(embeddedTrackId: 2);
      expect(calls.last.arguments['embeddedTrackId'], 2);
      await backend.setSecondarySubtitle();
      expect(calls.last.arguments['embeddedTrackId'], isNull);
      expect(backend.subtitleDelaySeconds, 1.25);

      for (final (session, expected) in [(1, 1.25), (2, 0.0), (null, 0.0)]) {
        await backend.setSubtitleDelay(1.25);
        await backend.stop();
        await open(session, url: 'https://server/new-transcode');
        expect(source()['subtitleDelayMs'], (expected * 1000).round());
        expect(backend.subtitleDelaySeconds, expected);
      }
    });
  }
}
