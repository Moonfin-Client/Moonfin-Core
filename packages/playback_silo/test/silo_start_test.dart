import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _film = 'movie-imdb-tt0295701';
const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

SiloTestServer _server({
  Object? start,
  Object? capabilities,
}) => SiloTestServer({
  capabilitiesPath:
      capabilities ?? SiloTestServer.file('silo/playback_capabilities.json'),
  startPath: start ?? SiloTestServer.file('decision_remux.json', status: 201),
  '/api/v2/catalog/items/$_film': SiloTestServer.file(
    'silo/catalog_item_movie.json',
  ),
});

SiloMediaStreamResolver _resolver(SiloTestServer server) => SiloPlugin(
  siloTestClient(server),
  environment: () => const SiloPlaybackEnvironment(
    platform: 'macos',
    traits: SiloPlayerTraits.aether,
  ),
).createStreamResolver();

void main() {
  group('the start request', () {
    test('what Moonfin asks for, in Silo\'s contract', () async {
      final server = _server();
      await _resolver(server).resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
        startTimeTicks: 6000000000,
        audioStreamIndex: 1,
        maxStreamingBitrate: 20000000,
      );
      final body = server.bodies(startPath).single;
      expect(siloSchemaErrors('PlaybackStartBody', body), isEmpty);
      expect(body['protocol_version'], 3);
      expect(body['file_id'], '4598');
      expect(body['profile_id'], 'p1');
      expect(body['installation_id'], 'c621caf1-c95a-4626-a74f-bee7cf6b1402');
      expect(
        body['playback_attempt_id'],
        matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab]')),
      );
      expect(body['start_position'], 600);
      // Moonfin's audio stream 1 is Silo's first audio track.
      expect(body['audio_track_index'], 0);
      expect(body['bandwidth_cap_kbps'], 20000);
      expect(body['quality_preference'], 'auto');
      expect(body['client_features'], [
        'playback_plan_v3',
        'embedded_subtitles_v1',
      ]);
      expect(
        (body['client_capabilities'] as Map)['video_evidence'],
        'declared',
      );
      expect((body['client_playback_context'] as Map)['app_version'], '1.9.0');
      final request = server.to(startPath).single;
      expect(request.headers['X-Profile-Id'], 'p1');
      expect(request.headers['Authorization'], 'Bearer access-1');
      // The item carried its versions, so nothing else was read.
      expect(server.requests.map((r) => r.uri.path), [
        capabilitiesPath,
        startPath,
      ]);
    });

    test('nothing Moonfin has no opinion on, and the start', () async {
      final server = _server();
      await _resolver(
        server,
      ).resolve(siloTestItem('silo/watch_movie.json'), deviceProfile: _profile);
      final body = server.bodies(startPath).single;
      // From the start, said as such.
      expect(body['start_position'], 0);
      expect(body, isNot(contains('audio_track_index')));
      expect(body, isNot(contains('bandwidth_cap_kbps')));
      expect(siloSchemaErrors('PlaybackStartBody', body), isEmpty);
    });

    test('an item without its versions is read first', () async {
      final server = _server();
      await _resolver(
        server,
      ).resolve({'Id': _film, 'Type': 'Movie'}, deviceProfile: _profile);
      expect(server.requests.map((r) => r.uri.path), [
        '/api/v2/catalog/items/$_film',
        capabilitiesPath,
        startPath,
      ]);
      expect(server.bodies(startPath).single['file_id'], '4598');
    });

    test('a local extra plays the file it carries', () async {
      final server = _server();
      await _resolver(server).resolve({
        'Id': 'extra-1',
        'Type': 'Trailer',
        '_silo': {'content_id': 'extra-1', 'kind': 'trailer', 'file_id': 7},
      }, deviceProfile: _profile);
      expect(server.bodies(startPath).single['file_id'], '7');
    });
  });

  group('the plan', () {
    test('a progressive remux cut at the resume point', () async {
      final server = _server();
      final item = siloTestItem('silo/watch_movie.json');
      final result = await _resolver(
        server,
      ).resolve(item, deviceProfile: _profile, startTimeTicks: 6000000000);
      expect(
        result.streamUrl,
        'https://silo.example/api/v2/stream/$_session'
        '?seek=593.4&st=c2lnbmVk&token=access-1',
      );
      expect(result.playMethod, StreamPlayMethod.directStream);
      expect(result.mediaSourceId, '4598');
      expect(result.playSessionId, _session);
      expect(result.container, 'mp4');
      expect(
        result.timelineOffset,
        const Duration(minutes: 9, seconds: 53, milliseconds: 400),
      );
      expect(result.serverOfferedDirectPlay, isFalse);
      expect(result.sourceBitrate, 7355000);
      expect(result.videoRangeType, 'SDR');
      expect(result.transcodingReasons, ['AudioCodecNotSupported']);
      // The file's streams in Moonfin's numbering. Silo's audio track 0 is
      // Moonfin's stream 1.
      final sources = (item['MediaSources'] as List).cast<Map>();
      expect(result.mediaStreams, sources.first['MediaStreams']);
      expect(result.selectedAudioStreamIndex, 1);
    });

    test('the original file plays directly, on the file\'s timeline', () async {
      final server = _server(
        start: SiloTestServer.file('decision_original.json', status: 201),
      );
      final result = await _resolver(
        server,
      ).resolve(siloTestItem('silo/watch_movie.json'), deviceProfile: _profile);
      expect(result.playMethod, StreamPlayMethod.directPlay);
      expect(result.timelineOffset, Duration.zero);
      expect(result.serverOfferedDirectPlay, isTrue);
      expect(result.transcodingReasons, isEmpty);
    });

    test('the session is kept for reporting', () async {
      final server = _server();
      final client = siloTestClient(server);
      final result = await SiloPlugin(client).createStreamResolver().resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
      );
      final session = SiloPlaybackSessions.of(client).sessionOf(result)!;
      expect(session.sessionId, _session);
      expect(session.installationId, 'c621caf1-c95a-4626-a74f-bee7cf6b1402');
      expect(session.itemId, _film);
      expect(session.resolution, same(result));
      expect(session.plan['plan_id'], startsWith('plan:'));
    });

    test('the playing file is noted for its markers', () async {
      final server = SiloTestServer({
        capabilitiesPath: SiloTestServer.file(
          'silo/playback_capabilities.json',
        ),
        startPath: SiloTestServer.file('decision_remux.json', status: 201),
        '/api/v2/markers/files/4598': SiloTestServer.file(
          'silo/markers_movie.json',
        ),
      });
      final client = siloTestClient(server);
      await SiloPlugin(client).createStreamResolver().resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
      );
      expect(await client.itemsApi.getMediaSegments(_film), isEmpty);
      expect(server.requests.last.uri.path, '/api/v2/markers/files/4598');
    });

    test('the plan fixtures fit Silo\'s contract', () {
      for (final name in [
        'decision_remux.json',
        'decision_original.json',
        'decision_terminal.json',
      ]) {
        expect(
          siloSchemaErrors('PlaybackDecision', fixtureJson(name)),
          isEmpty,
          reason: name,
        );
      }
    });
  });

  group('failures', () {
    test('an interrupted start is resent unchanged', () async {
      final server = _server(
        start: [
          SiloTestServer.dropped(),
          SiloTestServer.problemRoute(503, 'unavailable', 'Try again'),
          SiloTestServer.file('decision_remux.json', status: 201),
        ],
      );
      final waits = <Duration>[];
      final resolver = SiloMediaStreamResolver(
        siloTestClient(server),
        sleep: (d) async => waits.add(d),
      );
      final result = await resolver.resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
      );
      expect(result.playSessionId, _session);
      final bodies = server.bodies(startPath);
      expect(bodies, hasLength(3));
      expect(bodies[1], bodies[0]);
      expect(bodies[2], bodies[0]);
      expect(waits, [const Duration(seconds: 1), const Duration(seconds: 2)]);
    });

    test('a refusal is final', () async {
      final server = _server(
        start: SiloTestServer.problemRoute(
          422,
          'validation_failed',
          'body.file_id is invalid',
        ),
      );
      await expectLater(
        _resolver(server).resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        ),
        throwsA(anything),
      );
      expect(server.to(startPath), hasLength(1));
    });

    test('a changed installation: capabilities again, a new attempt', () async {
      final server = _server(
        start: [
          SiloTestServer.problemRoute(
            409,
            'installation_changed',
            'The server installation changed.',
          ),
          SiloTestServer.file('decision_remux.json', status: 201),
        ],
      );
      await _resolver(
        server,
      ).resolve(siloTestItem('silo/watch_movie.json'), deviceProfile: _profile);
      expect(server.to(capabilitiesPath), hasLength(2));
      final bodies = server.bodies(startPath);
      expect(bodies, hasLength(2));
      expect(
        bodies[1]['playback_attempt_id'],
        isNot(bodies[0]['playback_attempt_id']),
      );
    });

    test(
      'Silo\'s refusal to play reaches the player with its words',
      () async {
        final server = _server(
          start: SiloTestServer.file('decision_terminal.json', status: 201),
        );
        await expectLater(
          _resolver(server).resolve(
            siloTestItem('silo/watch_movie.json'),
            deviceProfile: _profile,
          ),
          throwsA(
            isA<PlaybackRefusedException>()
                .having(
                  (e) => e.message,
                  'message',
                  "This file can't be read. Replace it and scan the library again.",
                )
                .having((e) => e.reason, 'reason', 'source_unreadable')
                .having((e) => e.retryable, 'retryable', isFalse),
          ),
        );
      },
    );

    test('a server without playback plays nothing', () async {
      final server = _server(
        capabilities: SiloTestServer.json({
          'installation_id': 'c621caf1-c95a-4626-a74f-bee7cf6b1402',
          'state': 'not_configured',
          'allowed': false,
          'protocol_versions': [3],
          'features': <String>[],
          'deliveries': <String>[],
        }),
      );
      await expectLater(
        _resolver(server).resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        ),
        throwsA(
          isA<PlaybackRefusedException>().having(
            (e) => e.message,
            'message',
            siloPlaybackUnavailableMessage,
          ),
        ),
      );
      expect(server.to(startPath), isEmpty);
    });

    test('a terminal without words names its reason', () {
      final refusal = siloRefusal({
        'outcome': 'adaptation_unavailable',
        'terminal': {
          'reason': 'source_metadata_incomplete',
          'message': ' ',
          'retryable': true,
        },
      });
      expect(
        refusal.message,
        "Silo can't play this item (source_metadata_incomplete).",
      );
      expect(refusal.retryable, isTrue);
    });

    test('a server that wants a newer client says so', () async {
      final server = _server(
        start: SiloTestServer.problemRoute(
          426,
          'client_upgrade_required',
          'Upgrade',
        ),
      );
      await expectLater(
        _resolver(server).resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        ),
        throwsA(
          isA<PlaybackRefusedException>().having(
            (e) => e.message,
            'message',
            siloUpgradeRequiredMessage,
          ),
        ),
      );
    });

    test('a retired API (410 client_upgrade_required) says so too', () async {
      final server = _server(
        start: SiloTestServer.problemRoute(
          410,
          'client_upgrade_required',
          'Client upgrade required',
        ),
      );
      await expectLater(
        _resolver(server).resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        ),
        throwsA(
          isA<PlaybackRefusedException>()
              .having((e) => e.message, 'message', siloUpgradeRequiredMessage)
              .having((e) => e.reason, 'reason', 'client_upgrade_required'),
        ),
      );
    });
  });

  group('resume or start over', () {
    test('the position Moonfin passes, or the start', () {
      expect(siloStartPosition(null), 0);
      expect(siloStartPosition(0), 0);
      expect(siloStartPosition(6000000000), 600);
      expect(siloStartPosition(6005000000), 600.5);
      expect(siloStartPosition(-5), 0);
      expect(siloStartPosition(400000000000000000), 31536000);
    });

    test('a resume and a start over both say where', () async {
      final server = _server();
      final resolver = _resolver(server);
      final item = siloTestItem('silo/watch_movie.json');
      await resolver.resolve(
        item,
        deviceProfile: _profile,
        startTimeTicks: 18000000000,
      );
      await resolver.resolve(item, deviceProfile: _profile);
      expect(server.bodies(startPath).map((b) => b['start_position']), [
        1800,
        0,
      ]);
    });
  });
}
