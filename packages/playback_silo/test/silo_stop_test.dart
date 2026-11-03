import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';
const _sessionPath = '/api/v2/playback/$_session';
const _progressPath = '$_sessionPath/progress';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

final _stopped = SiloTestServer.json({
  'outcome': 'stopped',
  'stop_id': 'x',
  'accepted': {'sequence': 2, 'position': 600.0, 'is_paused': false},
  'history_id': '91',
});

Future<
  ({
    SiloTestServer server,
    SiloMediaServerClient client,
    StreamResolutionResult stream,
    SiloPlaySessionService service,
    List<Duration> waits,
  })
>
_started(Object stop) async {
  final server = SiloTestServer({
    capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
    startPath: SiloTestServer.file('decision_remux.json', status: 201),
    _progressPath: SiloTestServer.json({'outcome': 'applied'}),
    _sessionPath: stop,
  });
  final client = siloTestClient(server);
  final stream = await SiloPlugin(client).createStreamResolver().resolve(
    siloTestItem('silo/watch_movie.json'),
    deviceProfile: _profile,
  );
  final waits = <Duration>[];
  return (
    server: server,
    client: client,
    stream: stream,
    service: SiloPlaySessionService(client, sleep: (d) async => waits.add(d)),
    waits: waits,
  );
}

const _item = {'Id': 'movie-imdb-tt0295701'};

void main() {
  test('the stop carries the stop id and the final sample', () async {
    final s = await _started(_stopped);
    await s.service.onPlaybackProgress(
      _item,
      s.stream,
      const Duration(minutes: 9),
    );
    await s.service.onPlaybackStop(
      _item,
      s.stream,
      const Duration(minutes: 10),
    );
    final stop = s.server.to(_sessionPath).single;
    expect(stop.method, 'DELETE');
    final body = s.server.bodies(_sessionPath).single;
    expect(siloSchemaErrors('PlaybackStopBody', body), isEmpty);
    expect(body['installation_id'], 'c621caf1-c95a-4626-a74f-bee7cf6b1402');
    expect(body['stop_id'], matches(RegExp(r'^[0-9a-f-]{36}$')));
    expect(body['sequence'], 2);
    expect(body['position'], 600.0);
    expect(body['is_paused'], isFalse);
    // Forgotten: nothing more goes out for it.
    expect(SiloPlaybackSessions.of(s.client)[_session], isNull);
    await s.service.onPlaybackProgress(_item, s.stream, Duration.zero);
    await s.service.onPlaybackStop(_item, s.stream, Duration.zero);
    expect(s.server.requests, hasLength(4));
  });

  test('a stop that gets no answer is resent unchanged', () async {
    final s = await _started([
      SiloTestServer.dropped(),
      SiloTestServer.problemRoute(503, 'unavailable', 'Busy'),
      _stopped,
    ]);
    await s.service.onPlaybackStop(
      _item,
      s.stream,
      const Duration(minutes: 10),
    );
    final bodies = s.server.bodies(_sessionPath);
    expect(bodies, hasLength(3));
    expect(bodies[1], bodies[0]);
    expect(bodies[2], bodies[0]);
    expect(s.waits, [const Duration(seconds: 1), const Duration(seconds: 2)]);
  });

  test('a session already over is not stopped again', () async {
    final s = await _started(
      SiloTestServer.problemRoute(404, 'playback_session_not_found', 'Gone'),
    );
    await s.service.onPlaybackStop(
      _item,
      s.stream,
      const Duration(minutes: 10),
    );
    expect(s.server.to(_sessionPath), hasLength(1));
    expect(SiloPlaybackSessions.of(s.client)[_session], isNull);
  });

  test('the transcode end and a second stop share the first', () async {
    final s = await _started(_stopped);
    await Future.wait([
      s.service.onPlaybackStop(_item, s.stream, const Duration(minutes: 10)),
      s.service.stopTranscoding(s.stream),
      s.service.onPlaybackStop(_item, s.stream, const Duration(minutes: 10)),
    ]);
    expect(s.server.to(_sessionPath), hasLength(1));
  });

  test('a session dropped before it played keeps the resume point', () async {
    final s = await _started(_stopped);
    await s.service.onPlaybackStop(_item, s.stream, Duration.zero);
    final body = s.server.bodies(_sessionPath).single;
    expect(body.keys, unorderedEquals(['installation_id', 'stop_id']));
    expect(siloSchemaErrors('PlaybackStopBody', body), isEmpty);
  });

  test('a stream a replan replaced stops nothing', () async {
    final s = await _started(_stopped);
    SiloPlaybackSessions.of(
      s.client,
    )[_session]!.resolution = const StreamResolutionResult(
      streamUrl: 'https://silo.example/api/v2/stream/new',
      mediaSourceId: '4598',
      playSessionId: _session,
      playMethod: StreamPlayMethod.directStream,
    );
    await s.service.onPlaybackStop(
      _item,
      s.stream,
      const Duration(minutes: 10),
    );
    expect(s.server.to(_sessionPath), isEmpty);
  });

  group('the client hears the item changed', () {
    test('once Silo has the stop', () async {
      final s = await _started(_stopped);
      final heard = <String>[];
      s.client.ownUserDataChanges.listen(heard.add);
      await s.service.onPlaybackStop(
        _item,
        s.stream,
        const Duration(minutes: 10),
      );
      await Future<void>.delayed(Duration.zero);
      expect(heard, ['movie-imdb-tt0295701']);
      expect(
        s.client.itemsApi.userDataMayHaveChanged(['movie-imdb-tt0295701']),
        ['movie-imdb-tt0295701'],
      );
    });

    test('when the session had already ended', () async {
      final s = await _started(
        SiloTestServer.problemRoute(404, 'playback_session_not_found', 'Gone'),
      );
      final heard = <String>[];
      s.client.ownUserDataChanges.listen(heard.add);
      await s.service.onPlaybackStop(
        _item,
        s.stream,
        const Duration(minutes: 10),
      );
      await Future<void>.delayed(Duration.zero);
      expect(heard, ['movie-imdb-tt0295701']);
    });

    test('not when the stop was refused', () async {
      final s = await _started(
        SiloTestServer.problemRoute(422, 'validation_failed', 'No'),
      );
      final heard = <String>[];
      s.client.ownUserDataChanges.listen(heard.add);
      await expectLater(
        s.service.onPlaybackStop(_item, s.stream, const Duration(minutes: 10)),
        throwsA(anything),
      );
      await Future<void>.delayed(Duration.zero);
      expect(heard, isEmpty);
    });
  });
}
