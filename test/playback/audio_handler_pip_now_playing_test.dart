import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/platform/pip_service.dart';
import 'package:moonfin/playback/audio_handler.dart';
import 'package:moonfin/playback/last_playback_session_store.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:playback_core/playback_core.dart';

// Closing Picture in Picture on iOS leaves the shared Now Playing entry
// without Moonfin's info, so the handler sends it all again.

class _FakeBrowse implements MediaBrowseService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeClientFactory implements MediaServerClientFactory {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeSessionStore implements LastPlaybackSessionStore {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<PlaybackState> states;
  late List<MediaItem?> items;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    GetIt.instance.registerSingleton<PipService>(PipService());
    final handler = MoonfinAudioHandler(
      PlaybackManager(),
      _FakeClientFactory(),
      _FakeBrowse(),
      _FakeSessionStore(),
    );
    states = [];
    items = [];
    handler.playbackState.skip(1).listen(states.add);
    handler.mediaItem.skip(1).listen(items.add);
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
  });

  Future<void> sendPiPChanged(bool inPiP) async {
    await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage(
          'org.moonfin.ios/pip',
          const StandardMethodCodec().encodeMethodCall(
            MethodCall('onPiPChanged', inPiP),
          ),
          (_) {},
        );
    await pumpEventQueue();
  }

  test('closing Picture in Picture sends the state and media item again',
      () async {
    await sendPiPChanged(false);

    expect(states, hasLength(1));
    expect(items, hasLength(1));
  });

  test('opening Picture in Picture leaves them alone', () async {
    await sendPiPChanged(true);

    expect(states, isEmpty);
    expect(items, isEmpty);
  });
}
