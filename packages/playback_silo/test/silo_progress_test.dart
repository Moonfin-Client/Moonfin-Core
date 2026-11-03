import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';
const _progressPath = '/api/v2/playback/$_session/progress';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

SiloRoute _receipt(String outcome, int sequence) => SiloTestServer.json({
  'outcome': outcome,
  'accepted': {'sequence': sequence, 'position': 1.0, 'is_paused': false},
});

/// A started session, its client and its stream.
Future<
  ({
    SiloTestServer server,
    SiloMediaServerClient client,
    StreamResolutionResult stream,
    PlayerService service,
  })
>
_started(Object progress) async {
  final server = SiloTestServer({
    capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
    startPath: SiloTestServer.file('decision_remux.json', status: 201),
    _progressPath: progress,
  });
  final client = siloTestClient(server);
  final plugin = SiloPlugin(client);
  final stream = await plugin.createStreamResolver().resolve(
    siloTestItem('silo/watch_movie.json'),
    deviceProfile: _profile,
  );
  return (
    server: server,
    client: client,
    stream: stream,
    service: plugin.createPlaySessionService(),
  );
}

const _item = {'Id': 'movie-imdb-tt0295701'};

void main() {
  test('a sample: the media position, the pause, the next sequence', () async {
    final s = await _started(_receipt('applied', 1));
    await s.service.onPlaybackStart(_item, s.stream);
    await s.service.onPlaybackProgress(
      _item,
      s.stream,
      const Duration(minutes: 11, milliseconds: 250),
    );
    await s.service.onPlaybackProgress(
      _item,
      s.stream,
      const Duration(minutes: 11, seconds: 5),
      isPaused: true,
    );
    final bodies = s.server.bodies(_progressPath);
    expect(bodies, [
      {
        'installation_id': 'c621caf1-c95a-4626-a74f-bee7cf6b1402',
        'sequence': 1,
        'position': 660.25,
        'is_paused': false,
      },
      {
        'installation_id': 'c621caf1-c95a-4626-a74f-bee7cf6b1402',
        'sequence': 2,
        'position': 665.0,
        'is_paused': true,
      },
    ]);
    for (final body in bodies) {
      expect(siloSchemaErrors('PlaybackProgressBody', body), isEmpty);
    }
    expect(s.server.to(_progressPath).first.headers['X-Profile-Id'], 'p1');
    // Starting sent nothing of its own.
    expect(s.server.requests.map((r) => r.uri.path), [
      capabilitiesPath,
      startPath,
      _progressPath,
      _progressPath,
    ]);
  });

  test('a stale or replayed sample is fine', () async {
    final s = await _started([
      _receipt('stale_sample', 5),
      _receipt('replayed', 5),
    ]);
    await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
    await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
    expect(s.server.to(_progressPath), hasLength(2));
  });

  test(
    'a conflict sends the sample once more under the next sequence',
    () async {
      final s = await _started([
        SiloTestServer.problemRoute(409, 'progress_conflict', 'Conflict'),
        _receipt('applied', 2),
      ]);
      await s.service.onPlaybackProgress(
        _item,
        s.stream,
        const Duration(minutes: 1),
      );
      expect(s.server.bodies(_progressPath).map((b) => b['sequence']), [1, 2]);
      await s.service.onPlaybackProgress(
        _item,
        s.stream,
        const Duration(minutes: 2),
      );
      expect(s.server.bodies(_progressPath).last['sequence'], 3);
    },
  );

  for (final (status, code) in [
    (404, 'playback_session_not_found'),
    (410, 'playback_session_ended'),
    (409, 'installation_changed'),
  ]) {
    test('a session that is over ($status $code): no more samples', () async {
      final s = await _started(SiloTestServer.problemRoute(status, code, code));
      await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
      await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
      expect(s.server.to(_progressPath), hasLength(1));
      expect(SiloPlaybackSessions.of(s.client)[_session]!.ended, isTrue);
    });
  }

  test('another failure reaches the caller and the session goes on', () async {
    final s = await _started([
      SiloTestServer.problemRoute(503, 'unavailable', 'Busy'),
      _receipt('applied', 2),
    ]);
    await expectLater(
      s.service.onPlaybackProgress(_item, s.stream, Duration.zero),
      throwsA(anything),
    );
    await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
    expect(s.server.bodies(_progressPath).map((b) => b['sequence']), [1, 2]);
  });

  test('a stream a replan replaced reports nothing', () async {
    final s = await _started(_receipt('applied', 1));
    SiloPlaybackSessions.of(
      s.client,
    )[_session]!.resolution = const StreamResolutionResult(
      streamUrl: 'https://silo.example/api/v2/stream/new',
      mediaSourceId: '4598',
      playSessionId: _session,
      playMethod: StreamPlayMethod.directStream,
    );
    await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
    expect(s.server.to(_progressPath), isEmpty);
  });
}
