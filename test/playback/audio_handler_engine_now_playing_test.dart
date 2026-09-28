import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/platform/pip_service.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/playback/audio_handler.dart';
import 'package:moonfin/playback/last_playback_session_store.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

// iOS shows the engine's own Now Playing session while music plays, so the
// handler has to fill it in and act on its presses.

class _RecordingManager extends PlaybackManager {
  final calls = <String>[];

  @override
  Future<void> resume() async => calls.add('resume');

  @override
  Future<void> pause() async => calls.add('pause');

  @override
  Future<void> seekTo(Duration position) async =>
      calls.add('seek ${position.inMilliseconds}');

  @override
  Future<void> next() async => calls.add('next');

  @override
  Future<void> previous() async => calls.add('previous');
}

class _FakeEngine extends Fake implements AetherBackend {
  final commands = StreamController<Map<String, dynamic>>.broadcast();
  final shown = <String>[];

  @override
  Stream<Map<String, dynamic>> get remoteCommandStream => commands.stream;

  @override
  Future<void> setNowPlaying({
    required String title,
    required String artist,
    required String? artworkUrl,
    required bool hasNext,
  }) async => shown.add('$title by $artist');
}

class _FakeClient extends Fake implements MediaServerClient {}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String serverId) => _FakeClient();
}

class _FakeBrowse extends Fake implements MediaBrowseService {}

class _FakeSessionStore extends Fake implements LastPlaybackSessionStore {
  @override
  Future<void> save(LastPlaybackSession session) async {}
}

const _song = AggregatedItem(
  id: 'song',
  serverId: 'server',
  rawData: {'Type': 'Audio', 'Name': 'Song', 'Artists': ['Artist']},
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingManager manager;
  late _FakeEngine engine;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    engine = _FakeEngine();
    GetIt.instance
      ..registerSingleton<PipService>(PipService())
      ..registerSingleton<AetherBackend>(engine);
    manager = _RecordingManager();
    MoonfinAudioHandler(
      manager,
      _FakeClientFactory(),
      _FakeBrowse(),
      _FakeSessionStore(),
    );
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
  });

  test('the playing track fills the engine session', () async {
    manager.queueService.setQueue([_song]);
    await pumpEventQueue();

    expect(engine.shown, contains('Song by Artist'));
  });

  test('presses on the engine session drive playback', () async {
    manager.queueService.setQueue([_song]);
    await pumpEventQueue();

    for (final command in [
      {'event': 'play'},
      {'event': 'pause'},
      {'event': 'seek', 'positionMs': 42000},
      {'event': 'next'},
      {'event': 'previous'},
    ]) {
      engine.commands.add(command);
    }
    await pumpEventQueue();

    expect(manager.calls, ['resume', 'pause', 'seek 42000', 'next', 'previous']);
  });
}
