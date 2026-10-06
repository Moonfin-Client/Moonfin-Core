import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/media3_video_control');
const _events = MethodChannel('moonfin/media3_video_events');

// A sidecar added after the source opened re-prepares the player, and an
// episode with several subtitle files showed that as a run of restarts. Sent
// with the source, they are all in the first prepare.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Media3PlayerBackend backend;
  final calls = <MethodCall>[];

  setUp(() async {
    calls.clear();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, (call) async {
          calls.add(call);
          return null;
        });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_events, (_) async => null);
    backend = Media3PlayerBackend(UserPreferences(store));
  });

  tearDown(() {
    backend.dispose();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_control, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_events, null);
  });

  Map<dynamic, dynamic> sourceArguments() =>
      calls.singleWhere((call) => call.method == 'setSource').arguments as Map;

  test('the sidecars a source came with go out with the source', () async {
    const sidecars = [
      {
        'url': 'http://server/1.srt',
        'codec': 'srt',
        'language': 'hin',
        'title': 'Hindi',
      },
      {
        'url': 'http://server/2.srt',
        'codec': 'srt',
        'language': 'eng',
        'title': 'English',
      },
    ];

    await backend.play(<String, dynamic>{
      'url': 'http://server/video.mkv',
      'mediaType': 'video',
      'externalSubtitles': sidecars,
    });

    expect(sourceArguments()['externalSubtitles'], sidecars);
  });

  test('a source with no sidecars declares none', () async {
    await backend.play(<String, dynamic>{
      'url': 'http://server/video.mkv',
      'mediaType': 'video',
    });

    expect(sourceArguments()['externalSubtitles'], isEmpty);
  });
}
