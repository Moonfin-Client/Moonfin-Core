import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/appletv_audio_now_playing_feeder.dart';
import 'package:moonfin/playback/appletv_backend.dart';
import 'package:playback_core/playback_core.dart';

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

class _FakeBackend implements AppleTvBackend {
  final actions = StreamController<Map<String, dynamic>>.broadcast();

  @override
  Stream<Map<String, dynamic>> get uiActionStream => actions.stream;

  @override
  dynamic noSuchMethod(Invocation invocation) => Future<void>.value();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

const _song = AggregatedItem(
  id: 'song',
  serverId: 'server',
  rawData: {'Type': 'Audio', 'Name': 'Song'},
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
}
