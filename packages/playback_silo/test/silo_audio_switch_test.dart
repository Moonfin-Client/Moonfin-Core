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

/// xXx with a second audio track (a commentary), as Moonfin maps it: video
/// 0, the DTS track 1, subtitles 2 and 3 (their container indices), the
/// commentary 4.
Map<String, dynamic> _twoAudioTracks() {
  final watch = fixtureJson('silo/watch_movie.json');
  final version = (watch['versions'] as List).first as Map;
  (version['audio_tracks'] as List).add({
    'title': 'Commentary',
    'language': 'en',
    'codec': 'aac',
    'layout': 'stereo',
    'channels': 2,
    'default': false,
  });
  watch.remove('playback_variants');
  return siloItemToBaseItemDtoForTest(watch);
}

/// The remux decision, now playing Silo's audio track [ordinal].
SiloRoute _playingAudio(int ordinal) {
  final decision = fixtureJson('decision_remux.json');
  final plan = decision['playback_plan'] as Map<String, dynamic>;
  plan['plan_id'] = 'plan:00000000000000000000000000000003';
  plan['selected_tracks'] = {
    'audio': {'id': 'file:4598:audio:$ordinal', 'index': ordinal},
  };
  return SiloTestServer.json(decision);
}

void main() {
  late SiloTestServer server;
  late SiloMediaStreamResolver resolver;
  late StreamResolutionResult stream;
  final item = _twoAudioTracks();

  setUp(() async {
    server = SiloTestServer({
      capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
      startPath: SiloTestServer.file('decision_remux.json', status: 201),
      _replanPath: _playingAudio(1),
    });
    resolver = SiloMediaStreamResolver(siloTestClient(server));
    stream = await resolver.resolve(item, deviceProfile: _profile);
  });

  test('the item maps the commentary to Moonfin stream 4', () {
    final audio = (stream.mediaStreams)
        .where((s) => s['Type'] == 'Audio')
        .map((s) => s['Index']);
    expect(audio, [1, 4]);
    expect(stream.selectedAudioStreamIndex, 1);
  });

  test('picking the commentary asks Silo for its audio track 1', () async {
    final next = await resolver.replan(
      item,
      stream,
      const ReplanRequest(
        reason: ReplanReason.trackChange,
        position: Duration(minutes: 12),
        audioStreamIndex: 4,
      ),
    );
    final body = server.bodies(_replanPath).single;
    expect(body['operation'], 'track_change');
    expect(body['selected_tracks'], {
      'audio': {'id': 'file:4598:audio:1', 'index': 1},
    });
    expect(body, isNot(contains('failure')));
    expect(siloSchemaErrors('PlaybackReplanBody', body), isEmpty);
    // Silo's answer names its track 1, which is Moonfin's stream 4.
    expect(next.selectedAudioStreamIndex, 4);
  });

  test('an index that is no audio track keeps the plan\'s', () async {
    await resolver.replan(
      item,
      stream,
      const ReplanRequest(
        reason: ReplanReason.trackChange,
        position: Duration(minutes: 12),
        audioStreamIndex: 2,
      ),
    );
    expect(server.bodies(_replanPath).single['selected_tracks'], {
      'audio': {'id': 'file:4598:audio:0', 'index': 0},
    });
  });

  test('only a track change changes the tracks', () async {
    await resolver.replan(
      item,
      stream,
      const ReplanRequest(
        reason: ReplanReason.seek,
        position: Duration(minutes: 40),
        audioStreamIndex: 4,
      ),
    );
    expect(
      (server.bodies(_replanPath).single['selected_tracks'] as Map)['audio'],
      {'id': 'file:4598:audio:0', 'index': 0},
    );
  });

  test('the start asks for the track Moonfin carries in', () async {
    await resolver.resolve(item, deviceProfile: _profile, audioStreamIndex: 4);
    expect(server.bodies(startPath).last['audio_track_index'], 1);
  });
}
