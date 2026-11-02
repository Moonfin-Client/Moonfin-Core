import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';
const _replanPath = '/api/v2/playback/$_session/replan';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// The remux decision reanchored at 30:00 (keyframe at 29:57.5), under a
/// new plan id.
SiloRoute _reanchored() {
  final decision = fixtureJson('decision_remux.json');
  final plan = decision['playback_plan'] as Map<String, dynamic>;
  plan['plan_id'] = 'plan:00000000000000000000000000000002';
  plan['plan_attempt_key'] = 'v3:0000000000000002';
  (plan['stream'] as Map)['url'] =
      '/api/v2/stream/$_session?seek=1797.5&st=bmV3';
  plan['timeline'] = {
    'source_start_seconds': 1800,
    'stream_origin_seconds': 1797.5,
    'player_start_seconds': 2.5,
    'timeline_offset_seconds': 1797.5,
    'can_seek_anywhere': false,
    'seek_window_start_seconds': 1797.5,
    'seek_restoration': 'source_position',
  };
  return SiloTestServer.json(decision);
}

Future<
  ({
    SiloTestServer server,
    SiloMediaServerClient client,
    SiloMediaStreamResolver resolver,
    StreamResolutionResult stream,
  })
>
_started(Object replan) async {
  final server = SiloTestServer({
    capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
    startPath: SiloTestServer.file('decision_remux.json', status: 201),
    _replanPath: replan,
  });
  final client = siloTestClient(server);
  final resolver = SiloMediaStreamResolver(client, sleep: (_) async {});
  final stream = await resolver.resolve(
    siloTestItem('silo/watch_movie.json'),
    deviceProfile: _profile,
    startTimeTicks: 6000000000,
  );
  return (server: server, client: client, resolver: resolver, stream: stream);
}

const _item = {'Id': 'movie-imdb-tt0295701'};

ReplanRequest _at(Duration position, ReplanReason reason) =>
    ReplanRequest(reason: reason, position: position);

void main() {
  test(
    'a remux seeks through Silo and is reopened after a long pause',
    () async {
      final s = await _started(_reanchored());
      expect(s.stream.seeksThroughServer, isTrue);
      expect(s.stream.reopenAfterPause, const Duration(minutes: 1));
      final original = await SiloMediaStreamResolver(
        siloTestClient(
          SiloTestServer({
            capabilitiesPath: SiloTestServer.file(
              'silo/playback_capabilities.json',
            ),
            startPath: SiloTestServer.file(
              'decision_original.json',
              status: 201,
            ),
          }),
        ),
      ).resolve(siloTestItem('silo/watch_movie.json'), deviceProfile: _profile);
      expect(original.seeksThroughServer, isFalse);
      expect(original.reopenAfterPause, isNull);
    },
  );

  test('only the live session\'s current stream can be replanned', () async {
    final s = await _started(_reanchored());
    expect(s.resolver.canReplan(s.stream), isTrue);
    const other = StreamResolutionResult(
      streamUrl: 'x',
      mediaSourceId: '4598',
      playSessionId: _session,
      playMethod: StreamPlayMethod.directStream,
    );
    expect(s.resolver.canReplan(other), isFalse);
    SiloPlaybackSessions.of(s.client)[_session]!.ended = true;
    expect(s.resolver.canReplan(s.stream), isFalse);
  });

  test('a seek reanchors the session at the position', () async {
    final s = await _started(_reanchored());
    final start = s.server.bodies(startPath).single;
    final next = await s.resolver.replan(
      _item,
      s.stream,
      _at(const Duration(minutes: 30), ReplanReason.seek),
    );
    final body = s.server.bodies(_replanPath).single;
    expect(siloSchemaErrors('PlaybackReplanBody', body), isEmpty);
    expect(body['operation'], 'seek_reanchor');
    expect(body['playback_attempt_id'], start['playback_attempt_id']);
    expect(body['failed_plan_id'], 'plan:3f9a1c2e4b5d6e7f8091a2b3c4d5e6f7');
    expect(body['plan_attempt_key'], 'v3:7c1d2e3f4a5b6c7d');
    expect(body['position_seconds'], 1800);
    expect(body['attempt_count'], 1);
    expect(body['attempted_plan_keys'], isEmpty);
    expect(body['installation_id'], start['installation_id']);
    expect(body['client_capabilities'], start['client_capabilities']);
    // The plan's tracks, exactly.
    expect(body['selected_tracks'], {
      'audio': {'id': 'file:4598:audio:0', 'index': 0},
    });
    expect(body, isNot(contains('failure')));

    expect(next.playSessionId, _session);
    expect(
      next.timelineOffset,
      const Duration(seconds: 1797, milliseconds: 500),
    );
    expect(next.streamUrl, contains('seek=1797.5&st=bmV3&token=access-1'));
    final session = SiloPlaybackSessions.of(s.client)[_session]!;
    expect(session.resolution, same(next));
    expect(session.plan['plan_id'], 'plan:00000000000000000000000000000002');
    expect(s.resolver.canReplan(next), isTrue);
    expect(s.resolver.canReplan(s.stream), isFalse);
  });

  test('a failure excludes the failed plan and counts the attempt', () async {
    final s = await _started(_reanchored());
    final first = await s.resolver.replan(
      _item,
      s.stream,
      _at(const Duration(minutes: 10), ReplanReason.failure),
    );
    await s.resolver.replan(
      _item,
      first,
      _at(const Duration(minutes: 10), ReplanReason.failure),
    );
    final bodies = s.server.bodies(_replanPath);
    expect(bodies.map((b) => b['operation']), [
      'failure_recovery',
      'failure_recovery',
    ]);
    expect(bodies[0]['failure'], {'classification': 'playback_error'});
    expect(bodies[0]['attempted_plan_keys'], ['v3:7c1d2e3f4a5b6c7d']);
    expect(bodies[1]['attempted_plan_keys'], [
      'v3:7c1d2e3f4a5b6c7d',
      'v3:0000000000000002',
    ]);
    expect(bodies.map((b) => b['attempt_count']), [1, 2]);
    expect(bodies[1]['plan_attempt_id'], isNot(bodies[0]['plan_attempt_id']));
    for (final body in bodies) {
      expect(siloSchemaErrors('PlaybackReplanBody', body), isEmpty);
    }
  });

  test('an interrupted replan is resent with the same request id', () async {
    final s = await _started([
      SiloTestServer.dropped(),
      SiloTestServer.problemRoute(409, 'replan_in_progress', 'Busy'),
      SiloTestServer.problemRoute(503, 'replan_capacity_exhausted', 'Full'),
      _reanchored(),
    ]);
    await s.resolver.replan(
      _item,
      s.stream,
      _at(const Duration(minutes: 30), ReplanReason.seek),
    );
    final bodies = s.server.bodies(_replanPath);
    expect(bodies, hasLength(4));
    expect(bodies.map((b) => b['replan_request_id']).toSet(), hasLength(1));
  });

  test('a session an administrator ended is not started again', () async {
    final s = await _started(
      SiloTestServer.problemRoute(410, 'playback_session_ended', 'Ended'),
    );
    await expectLater(
      s.resolver.replan(
        _item,
        s.stream,
        _at(const Duration(minutes: 30), ReplanReason.seek),
      ),
      throwsA(
        isA<PlaybackRefusedException>().having(
          (e) => e.message,
          'message',
          siloEndedOnServerMessage,
        ),
      ),
    );
    expect(SiloPlaybackSessions.of(s.client)[_session]!.ended, isTrue);
  });

  test('a session that expired throws, for a new start', () async {
    final s = await _started(
      SiloTestServer.problemRoute(404, 'playback_session_not_found', 'Gone'),
    );
    await expectLater(
      s.resolver.replan(
        _item,
        s.stream,
        _at(const Duration(minutes: 30), ReplanReason.seek),
      ),
      throwsA(isNot(isA<PlaybackRefusedException>())),
    );
    expect(SiloPlaybackSessions.of(s.client)[_session]!.ended, isTrue);
    expect(s.server.to(_replanPath), hasLength(1));
  });

  test('a terminal answer is a refusal', () async {
    final s = await _started(SiloTestServer.file('decision_terminal.json'));
    await expectLater(
      s.resolver.replan(
        _item,
        s.stream,
        _at(const Duration(minutes: 30), ReplanReason.seek),
      ),
      throwsA(isA<PlaybackRefusedException>()),
    );
  });
}
