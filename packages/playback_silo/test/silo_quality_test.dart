import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';
const _replanPath = '/api/v2/playback/$_session/replan';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// The plan answered as an HLS transcode within a 4 Mbit/s ceiling.
SiloRoute _transcode() {
  final decision = fixtureJson('decision_remux.json');
  final plan = decision['playback_plan'] as Map<String, dynamic>;
  plan['delivery'] = 'server_transcode_hls';
  plan['decision_reason'] = 'quality_bandwidth_cap';
  plan['degradation_warnings'] = [
    {'code': 'bandwidth_cap_applied', 'message': 'Capped.'},
  ];
  (plan['stream'] as Map)
    ..['url'] = '/api/v2/playback/transcode/$_session/master.m3u8?st=x'
    ..['protocol'] = 'hls'
    ..['container'] = 'hls';
  plan['timeline'] = {
    'source_start_seconds': 600,
    'stream_origin_seconds': 0,
    'player_start_seconds': 600,
    'timeline_offset_seconds': 0,
    'can_seek_anywhere': true,
    'seek_restoration': 'player_position',
  };
  return SiloTestServer.json(decision);
}

void main() {
  late SiloTestServer server;
  late SiloMediaStreamResolver resolver;
  final item = siloTestItem('silo/watch_movie.json');

  setUp(() {
    server = SiloTestServer({
      capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
      startPath: SiloTestServer.file('decision_remux.json', status: 201),
      _replanPath: _transcode(),
    });
    resolver = SiloMediaStreamResolver(siloTestClient(server));
  });

  ReplanRequest quality(int? bitsPerSecond) => ReplanRequest(
    reason: ReplanReason.qualityChange,
    position: const Duration(minutes: 10),
    maxStreamingBitrate: bitsPerSecond,
    enableDirectPlay: false,
    enableDirectStream: false,
  );

  test('a ceiling is a quality change Silo fits a rung to', () async {
    final stream = await resolver.resolve(item, deviceProfile: _profile);
    final next = await resolver.replan(item, stream, quality(4000000));
    final body = server.bodies(_replanPath).single;
    expect(siloSchemaErrors('PlaybackReplanBody', body), isEmpty);
    expect(body['operation'], 'quality_change');
    expect(body['quality_preference'], 'auto');
    expect(body['bandwidth_cap_kbps'], 4000);
    expect(body, isNot(contains('failure')));
    expect(next.playMethod, StreamPlayMethod.transcode);
    expect(next.transcodingReasons, ['ContainerBitrateExceedsLimit']);
  });

  test('the ceiling stays for the session\'s later replans', () async {
    var stream = await resolver.resolve(item, deviceProfile: _profile);
    stream = await resolver.replan(item, stream, quality(4000000));
    await resolver.replan(
      item,
      stream,
      const ReplanRequest(
        reason: ReplanReason.seek,
        position: Duration(minutes: 30),
      ),
    );
    expect(server.bodies(_replanPath).last['bandwidth_cap_kbps'], 4000);
  });

  test(
    'on libmpv (Windows, Linux) the transcode goes by headers: Silo\'s '
    'playlist may name segments through a variable mpv doesn\'t expand',
    () async {
      resolver = SiloMediaStreamResolver(
        siloTestClient(server),
        environment: () => const SiloPlaybackEnvironment(
          formFactor: 'desktop',
          platform: 'windows',
          traits: SiloPlayerTraits.mpv,
        ),
      );
      final stream = await resolver.resolve(item, deviceProfile: _profile);
      final next = await resolver.replan(item, stream, quality(2000000));
      expect(
        next.streamUrl,
        'https://silo.example/api/v2/playback/transcode/$_session/master.m3u8'
        '?st=x',
      );
      expect(next.requestHeaders['Authorization'], 'Bearer access-1');
      expect(next.requestHeaders['X-Profile-Id'], 'p1');
    },
  );

  test('no ceiling lifts it', () async {
    var stream = await resolver.resolve(
      item,
      deviceProfile: _profile,
      maxStreamingBitrate: 8000000,
    );
    expect(server.bodies(startPath).single['bandwidth_cap_kbps'], 8000);
    stream = await resolver.replan(item, stream, quality(null));
    final body = server.bodies(_replanPath).single;
    expect(body['operation'], 'quality_change');
    expect(body, isNot(contains('bandwidth_cap_kbps')));
  });
}
