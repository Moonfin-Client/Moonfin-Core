import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/appletv_backend.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  for (final tv in [true, false]) {
    group(tv ? 'tvOS' : 'Aether', () {
      final prefix = tv ? 'appletv_video' : 'ios_aether';
      final calls = <MethodCall>[];
      late PlayerBackend backend;
      late UserPreferences prefs;
      bool disposed = false;
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

      Future<void> tracks(int count) async {
        await messenger.handlePlatformMessage(
          'moonfin/${prefix}_events',
          const StandardMethodCodec().encodeSuccessEnvelope({
            'event': 'tracksChanged',
            'textTrackCount': count,
          }),
          (_) {},
        );
        await Future<void>.delayed(Duration.zero);
      }

      setUp(() async {
        disposed = false;
        calls.clear();
        messenger.setMockMethodCallHandler(
          MethodChannel('moonfin/${prefix}_control'),
          (call) async {
            calls.add(call);
            return null;
          },
        );
        messenger.setMockMethodCallHandler(
          MethodChannel('moonfin/${prefix}_events'),
          (_) async => null,
        );
        SharedPreferences.setMockInitialValues({});
        final store = PreferenceStore();
        await store.init();
        prefs = UserPreferences(store);
        backend = tv ? AppleTvBackend(prefs) : AetherBackend(prefs);
        await Future<void>.delayed(Duration.zero);
      });
      tearDown(() {
        if (!disposed) backend.dispose();
        prefs.dispose();
      });

      test(
        'zero-track readiness retains choice until its track arrives',
        () async {
          await tracks(0);
          await backend.waitForTracksReady();
          await backend.setSubtitleTrack(2);
          expect(calls.where((c) => c.method == 'setSubtitleTrack'), isEmpty);
          await backend.setAudioTrack(1);
          expect(calls.last.method, 'setAudioTrack');
          await tracks(1);
          expect(calls.where((c) => c.method == 'setSubtitleTrack'), isEmpty);
          await tracks(2);
          final selections = calls
              .where((c) => c.method == 'setSubtitleTrack')
              .toList();
          expect(selections, hasLength(1));
          expect(selections.single.arguments['index'], 2);
          await tracks(28);
          expect(
            calls.where((c) => c.method == 'setSubtitleTrack'),
            hasLength(1),
          );
        },
      );

      testWidgets(
        'pending choice survives seven seconds before track discovery',
        (tester) async {
          await tester.runAsync(() => tracks(0));
          await backend.setSubtitleTrack(1);
          // Advance the fake clock without adding real time to the test run.
          await tester.pump(const Duration(seconds: 7));
          expect(calls.where((c) => c.method == 'setSubtitleTrack'), isEmpty);
          await tester.runAsync(() => tracks(1));
          final selections = calls
              .where((c) => c.method == 'setSubtitleTrack')
              .toList();
          expect(selections, hasLength(1));
          expect(selections.single.arguments['index'], 1);
        },
      );

      for (final action in ['off', 'stop', 'source', 'caption', 'choice', 'dispose']) {
        test('$action supersedes a pending choice', () async {
          await tracks(0);
          await backend.setSubtitleTrack(2);
          switch (action) {
            case 'off':
              await backend.disableSubtitleTrack();
            case 'stop':
              await backend.stop();
            case 'source':
              await backend.play({'url': 'https://example.com/next'});
            case 'caption':
              await backend.setEmbeddedCaptionTrack(1);
            case 'choice':
              await backend.setSubtitleTrack(1);
            case 'dispose':
              backend.dispose();
              disposed = true;
          }
          calls.clear();
          await tracks(2);
          final selections = calls
              .where((c) => c.method == 'setSubtitleTrack')
              .toList();
          if (action == 'choice') {
            expect(selections, hasLength(1));
            expect(selections.single.arguments['index'], 1);
          } else {
            expect(selections, isEmpty);
          }
        });
      }

      test('external selection supersedes pending embedded choice', () async {
        await backend.setSubtitleTrack(2);
        await backend.setSubtitleTrack(
          3,
          isExternalSubtitle: true,
          externalSubtitleUrl: 'https://example.com/sub.srt',
        );
        expect(calls.last.method, 'setSubtitleTrack');
        expect(calls.last.arguments['isExternalSubtitle'], true);
        calls.clear();
        await tracks(28);
        expect(calls.where((c) => c.method == 'setSubtitleTrack'), isEmpty);
      });
    });
  }
}
