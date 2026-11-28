import 'dart:convert';
import 'dart:io';

import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// The capabilities fixture, without `fixed_media_file_v1` when [fixed] is
/// false (an older server), and with `codec_channel_ceilings_v1` when
/// [ceilings] is true.
SiloRoute _capabilities({bool fixed = true, bool ceilings = false}) {
  final caps = fixtureJson('silo/playback_capabilities.json');
  if (!fixed) (caps['features'] as List).remove('fixed_media_file_v1');
  if (ceilings) (caps['features'] as List).add('codec_channel_ceilings_v1');
  return SiloTestServer.json(caps);
}

/// The mpv profile capped at stereo for the codecs it decodes, with the
/// passthrough codecs left out of the cap.
final _stereoPassthroughProfile = {
  ..._profile,
  'CodecProfiles': [
    ...(_profile['CodecProfiles'] as List),
    {
      'Type': 'VideoAudio',
      'Codec': 'aac,flac',
      'Conditions': [
        {
          'Condition': 'LessThanEqual',
          'Property': 'AudioChannels',
          'Value': '2',
        },
      ],
    },
  ],
};

void main() {
  // The Salt Path: 2160p (4603, the default) and 1080p (4602).
  final item = siloTestItem('silo/watch_movie_multi.json');

  Future<Map<String, dynamic>> started({
    String? version,
    bool fixed = true,
  }) async {
    final server = SiloTestServer({
      capabilitiesPath: _capabilities(fixed: fixed),
      startPath: SiloTestServer.file('decision_remux.json', status: 201),
    });
    await SiloMediaStreamResolver(
      siloTestClient(server),
    ).resolve(item, deviceProfile: _profile, mediaSourceId: version);
    return server.bodies(startPath).single;
  }

  test('the versions as Moonfin lists them', () {
    expect((item['MediaSources'] as List).map((s) => (s as Map)['Id']), [
      '4603',
      '4602',
    ]);
  });

  test('a version the viewer picked plays as that version', () async {
    final body = await started(version: '4602');
    expect(body['file_id'], '4602');
    expect(body['allow_alternate_versions'], isFalse);
    expect(siloSchemaErrors('PlaybackStartBody', body), isEmpty);
  });

  test('the default version leaves Silo free to fall back', () async {
    for (final version in [null, '4603']) {
      final body = await started(version: version);
      expect(body['file_id'], '4603', reason: '$version');
      expect(body, isNot(contains('allow_alternate_versions')));
    }
  });

  test('a server that can\'t keep one file isn\'t asked to', () async {
    final body = await started(version: '4602', fixed: false);
    expect(body['file_id'], '4602');
    expect(body, isNot(contains('allow_alternate_versions')));
  });

  group('a stereo cap that spares passthrough codecs', () {
    Future<Map<String, dynamic>> deliveries({required bool ceilings}) async {
      final server = SiloTestServer({
        capabilitiesPath: _capabilities(ceilings: ceilings),
        startPath: SiloTestServer.file('decision_remux.json', status: 201),
      });
      await SiloMediaStreamResolver(
        siloTestClient(server),
      ).resolve(item, deviceProfile: _stereoPassthroughProfile);
      final body = server.bodies(startPath).single;
      return (body['client_playback_context'] as Map)['deliveries']
          as Map<String, dynamic>;
    }

    test('caps only those codecs on a server with per-codec ceilings', () async {
      for (final d in (await deliveries(ceilings: true)).values) {
        expect(d, isNot(contains('max_channels')));
        expect(d['max_channels_by_codec'], {'aac': 2, 'flac': 2});
      }
    });

    test('caps every codec on an older server', () async {
      for (final d in (await deliveries(ceilings: false)).values) {
        expect(d['max_channels'], 2);
        expect(d, isNot(contains('max_channels_by_codec')));
      }
    });
  });

  test('a retry under a new installation asks only for what it reads',
      () async {
    final replaced = fixtureJson('silo/playback_capabilities.json')
      ..['installation_id'] = '0b7e2a51-3d84-4f1c-9a6e-58c2d1f0e7b4';
    (replaced['features'] as List).remove('fixed_media_file_v1');
    final server = SiloTestServer({
      capabilitiesPath: [
        _capabilities(ceilings: true),
        SiloTestServer.json(replaced),
      ],
      startPath: [
        SiloTestServer.problemRoute(
          409,
          'installation_changed',
          'The server installation changed.',
        ),
        SiloTestServer.file('decision_remux.json', status: 201),
      ],
    });
    await SiloMediaStreamResolver(siloTestClient(server)).resolve(
          item,
          deviceProfile: _stereoPassthroughProfile,
          mediaSourceId: '4602',
        );

    final bodies = server.bodies(startPath);
    Iterable<Map> deliveries(Map body) =>
        ((body['client_playback_context'] as Map)['deliveries'] as Map)
            .values
            .cast<Map>();
    expect(bodies[0]['allow_alternate_versions'], isFalse);
    expect(deliveries(bodies[0]).first['max_channels_by_codec'], isNotNull);
    expect(bodies[1]['installation_id'], replaced['installation_id']);
    expect(bodies[1], isNot(contains('allow_alternate_versions')));
    for (final d in deliveries(bodies[1])) {
      expect(d['max_channels'], 2);
      expect(d, isNot(contains('max_channels_by_codec')));
    }
  });

  test('a single version is never pinned', () async {
    final server = SiloTestServer({
      capabilitiesPath: _capabilities(),
      startPath: SiloTestServer.file('decision_remux.json', status: 201),
    });
    await SiloMediaStreamResolver(siloTestClient(server)).resolve(
      siloTestItem('silo/watch_movie.json'),
      deviceProfile: _profile,
      mediaSourceId: '4598',
    );
    expect(
      server.bodies(startPath).single,
      isNot(contains('allow_alternate_versions')),
    );
  });
}
