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
/// false (an older server).
SiloRoute _capabilities({bool fixed = true}) {
  final caps = fixtureJson('silo/playback_capabilities.json');
  if (!fixed) (caps['features'] as List).remove('fixed_media_file_v1');
  return SiloTestServer.json(caps);
}

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
