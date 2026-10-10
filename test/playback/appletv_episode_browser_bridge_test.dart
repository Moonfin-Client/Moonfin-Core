import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/appletv_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/appletv_video_control');
const _events = MethodChannel('moonfin/appletv_video_events');

Future<void> _send(Map<String, dynamic> payload) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(payload),
        (_) {},
      );
}

// The browser is drawn natively but owned here, so the button, the panel and
// every pick cross the channel. A dropped event is a button that does nothing.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final calls = <MethodCall>[];
  late AppleTvBackend backend;

  setUp(() async {
    calls.clear();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_control, (call) async {
      calls.add(call);
      return null;
    });
    messenger.setMockMethodCallHandler(_events, (_) async => null);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    backend = AppleTvBackend(UserPreferences(store));
  });

  tearDown(() => backend.dispose());

  test('tells the player whether to offer the Episodes button', () async {
    Future<Object?> sent({required bool canBrowse}) async {
      await backend.setUiMetadata(
        topTitle: '',
        topSubtitle: '',
        chapters: const [],
        hasPrevious: true,
        hasNext: false,
        skipForwardMs: 30000,
        skipBackMs: 10000,
        audioTracks: const [],
        subtitleTracks: const [],
        canBrowseEpisodes: canBrowse,
      );
      return (calls.last.arguments as Map)['canBrowseEpisodes'];
    }

    expect(await sent(canBrowse: true), isTrue);
    expect(await sent(canBrowse: false), isFalse);
  });

  test('opens, refreshes and closes the panel by name', () async {
    const content = {'title': 'The Show', 'episodes': <Object>[]};
    await backend.showEpisodeBrowser(content);
    expect(calls.last.method, 'showEpisodeBrowser');
    expect(calls.last.arguments, content);

    await backend.updateEpisodeBrowser(content);
    expect(calls.last.method, 'updateEpisodeBrowser');

    await backend.hideEpisodeBrowser();
    expect(calls.last.method, 'hideEpisodeBrowser');
  });

  test('hands every browser event on to the host', () async {
    final received = <Map<String, dynamic>>[];
    final sub = backend.uiActionStream.listen(received.add);
    addTearDown(sub.cancel);

    final sentEvents = <Map<String, dynamic>>[
      {'event': 'openEpisodes'},
      {'event': 'selectEpisodesSeason', 'seasonId': 's1'},
      {'event': 'selectEpisode', 'episodeId': 'e3'},
      {'event': 'episodesClosed'},
    ];
    for (final event in sentEvents) {
      await _send(event);
    }
    await pumpEventQueue();

    expect(received, sentEvents);
  });
}
