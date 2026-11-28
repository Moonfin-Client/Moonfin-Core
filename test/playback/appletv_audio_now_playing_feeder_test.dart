import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/appletv_audio_now_playing_feeder.dart';
import 'package:moonfin/playback/native_apple_player_backend.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

// On tvOS music has no player screen, so the feeder takes the presses that
// reach the engine's music session.

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

class _FakeBackend implements NativeApplePlayerBackend {
  final actions = StreamController<Map<String, dynamic>>.broadcast();
  final metadata = <Map<Symbol, dynamic>>[];

  @override
  Stream<Map<String, dynamic>> get uiActionStream => actions.stream;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #setUiMetadata) {
      metadata.add(invocation.namedArguments);
    }
    return Future<void>.value();
  }
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String serverId) => _ArtClient();
}

class _ArtClient extends Fake implements MediaServerClient {
  @override
  ImageApi get imageApi => _CoverImageApi();
}

class _CoverImageApi extends Fake implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'Primary/$itemId/$tag';
}

const _song = AggregatedItem(
  id: 'song',
  serverId: 'server',
  rawData: {
    'Type': 'Audio',
    'Name': 'Song',
    'AlbumId': 'album',
    'AlbumPrimaryImageTag': 'cover',
  },
);

const _movie = AggregatedItem(
  id: 'movie',
  serverId: 'server',
  rawData: {'Type': 'Movie', 'Name': 'Movie'},
);

void main() {
  late _RecordingManager manager;
  late _FakeBackend backend;

  setUp(() {
    manager = _RecordingManager();
    backend = _FakeBackend();
    AppleTvAudioNowPlayingFeeder(
      manager: manager,
      clientFactory: _FakeClientFactory(),
      backend: backend,
    ).start();
  });

  Future<void> press(List<Map<String, dynamic>> commands) async {
    commands.forEach(backend.actions.add);
    await pumpEventQueue();
  }

  test('presses during music drive playback', () async {
    manager.queueService.setQueue([_song]);
    await pumpEventQueue();

    await press([
      {'event': 'play'},
      {'event': 'pause'},
      {'event': 'seek', 'positionMs': 42000},
      {'event': 'next'},
      {'event': 'previous'},
    ]);

    expect(manager.calls, ['resume', 'pause', 'seek 42000', 'next', 'previous']);
  });

  test('presses during video are left to its player screen', () async {
    manager.queueService.setQueue([_movie]);
    await pumpEventQueue();

    await press([
      {'event': 'pause'},
      {'event': 'next'},
    ]);

    expect(manager.calls, isEmpty);
  });

  test('sends the cover as artworkUrl, not logoUrl', () async {
    manager.queueService.setQueue([_song]);
    await pumpEventQueue();

    final last = backend.metadata.last;
    expect(last[#artworkUrl], 'Primary/album/cover');
    expect(last[#logoUrl] ?? '', isEmpty);
  });
}
