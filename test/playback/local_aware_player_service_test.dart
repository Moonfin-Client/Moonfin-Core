import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/playback/local_aware_player_service.dart';

class _Server extends Fake implements PlayerService {
  _Server(this.events, {this.fail = false});

  final List<String> events;
  final bool fail;

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async {
    events.add('reported');
    if (fail) throw StateError('server down');
  }
}

class _Offline extends Fake implements OfflineRepository {
  _Offline(this.events);

  final List<String> events;

  @override
  Future<void> updatePlaybackPosition(String itemId, int positionTicks) async {
    events.add('recorded');
  }
}

StreamResolutionResult _resolution({required bool local}) =>
    StreamResolutionResult(
      streamUrl: local
          ? 'file:///downloads/episode.mkv'
          : 'http://server.test/stream',
      mediaSourceId: 'source-1',
      playMethod: StreamPlayMethod.directPlay,
      isLocalMedia: local,
    );

void main() {
  const item = {'Id': 'episode-1'};
  late List<String> events;

  setUp(() => events = []);

  LocalAwarePlayerService service({bool reachable = true, bool fail = false}) =>
      LocalAwarePlayerService(
        _Server(events, fail: fail),
        _Offline(events),
        canReachServer: () => reachable,
        onStopped: (stopped, resolution, position) => events.add(
          'stopped ${stopped['Id']}'
          '${resolution.isLocalMedia ? ' from its download' : ''}'
          ' at ${position.inSeconds}s',
        ),
      );

  test('a streamed stop is reported before anything hears of it', () async {
    await service().onPlaybackStop(
      item,
      _resolution(local: false),
      Duration.zero,
    );

    expect(events, ['reported', 'stopped episode-1 at 0s']);
  });

  test('a downloaded stop is recorded and reported first', () async {
    await service().onPlaybackStop(
      item,
      _resolution(local: true),
      const Duration(minutes: 40),
    );

    expect(events, [
      'recorded',
      'reported',
      'stopped episode-1 from its download at 2400s',
    ]);
  });

  test('a downloaded stop offline still tells the listener', () async {
    await service(reachable: false).onPlaybackStop(
      item,
      _resolution(local: true),
      Duration.zero,
    );

    expect(events, ['recorded', 'stopped episode-1 from its download at 0s']);
  });

  test('a failed streamed report still tells the listener', () async {
    await expectLater(
      service(fail: true).onPlaybackStop(
        item,
        _resolution(local: false),
        Duration.zero,
      ),
      throwsStateError,
    );

    expect(events, ['reported', 'stopped episode-1 at 0s']);
  });
}
