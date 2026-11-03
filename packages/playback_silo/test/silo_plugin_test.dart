import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

/// A client that fails the test if anything touches the network (the
/// resolver is covered by `silo_start_test.dart`).
class _NoNetworkClient implements MediaServerClient {
  @override
  ServerType get serverType => ServerType.silo;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      fail('playback_silo should not call ${invocation.memberName} yet');
}

const _resolution = StreamResolutionResult(
  streamUrl: 'https://silo.example/api/v2/stream/s1',
  mediaSourceId: '4598',
  playMethod: StreamPlayMethod.directPlay,
);

void main() {
  final plugin = SiloPlugin(_NoNetworkClient());

  test('session reporting is a no-op that makes no requests', () async {
    final service = plugin.createPlaySessionService();
    const item = {'Id': 'movie-imdb-tt0295701'};
    await service.onPlaybackStart(item, _resolution, positionTicks: 0);
    await service.onPlaybackProgress(
      item,
      _resolution,
      const Duration(seconds: 30),
      isPaused: true,
    );
    await service.onPlaybackStop(item, _resolution, const Duration(minutes: 1));
    await service.stopTranscoding(_resolution);
    await service.closeLiveStream('x');
    service.dispose();
  });

  test('builds the Silo resolver and session service', () {
    expect(plugin.createStreamResolver(), isA<MediaStreamResolver>());
    expect(plugin.createPlaySessionService(), isA<PlayerService>());
  });
}
