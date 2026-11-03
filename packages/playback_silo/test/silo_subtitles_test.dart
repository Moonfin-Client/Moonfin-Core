import 'dart:convert';
import 'dart:io';

import 'package:playback_core/playback_core.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';
import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';
const _replanPath = '/api/v2/playback/$_session/replan';
const _base = 'https://silo.example';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// xXx with two embedded tracks (English SubRip at stream 2, PGS at 3)
/// before its sidecar (stream 4), as Silo lists a version.
Map<String, dynamic> _mixedItem() {
  final watch = fixtureJson('silo/watch_movie.json');
  watch.remove('playback_variants');
  final version = (watch['versions'] as List).first as Map;
  version['subtitle_tracks'] = [
    {'index': 2, 'language': 'en', 'codec': 'subrip', 'external': false},
    {
      'index': 3,
      'language': 'en',
      'codec': 'hdmv_pgs_subtitle',
      'external': false,
    },
    {'index': 4, 'language': 'en', 'codec': 'srt', 'external': true},
  ];
  return siloItemToBaseItemDtoForTest(watch);
}

Map<String, dynamic> _source(Map<String, dynamic> item) =>
    ((item['MediaSources'] as List).first as Map).cast<String, dynamic>();

/// A plan for the mixed file whose inventory has, in Silo's combined
/// order: the sidecar, the two embedded tracks, and a downloaded Spanish
/// track, with [subtitle] as its `subtitle` decision on top.
Map<String, dynamic> _plan(Map<String, dynamic> subtitle) {
  final plan = (fixtureJson('decision_remux.json')['playback_plan'] as Map)
      .cast<String, dynamic>();
  String url(int i, String ext) =>
      '/api/v2/stream/$_session/subtitles/$i.$ext?file_id=4598';
  plan['subtitle'] = {
    ...subtitle,
    'inventory': [
      {
        'track_id': 'file:4598:subtitle:0',
        'combined_index': 0,
        'source': 'external',
        'codec': 'srt',
        'language': 'en',
        'label': 'English',
        'forced': false,
        'default': false,
        'hearing_impaired': false,
        'delivery': 'sidecar',
        'url': url(0, 'vtt'),
      },
      {
        'track_id': 'file:4598:subtitle:1',
        'combined_index': 1,
        'source': 'embedded',
        'codec': 'subrip',
        'language': 'en',
        'label': 'English',
        'forced': false,
        'default': true,
        'hearing_impaired': false,
        'delivery': 'sidecar',
        'url': '${url(1, 'vtt')}&embedded_stream_index=2',
      },
      {
        'track_id': 'file:4598:subtitle:2',
        'combined_index': 2,
        'source': 'embedded',
        'codec': 'hdmv_pgs_subtitle',
        'language': 'en',
        'forced': false,
        'default': false,
        'hearing_impaired': false,
        'delivery': 'sidecar',
        'url': '${url(2, 'sup')}&embedded_stream_index=3',
      },
      {
        'track_id': 'file:4598:subtitle:3',
        'combined_index': 3,
        'source': 'downloaded',
        'codec': 'srt',
        'language': 'es',
        'label': 'Spanish (downloaded)',
        'forced': false,
        'default': false,
        'hearing_impaired': true,
        'delivery': 'sidecar',
        'url': url(3, 'vtt'),
      },
    ],
  };
  return plan;
}

void main() {
  final item = _mixedItem();
  final source = _source(item);

  group('the combined order', () {
    test('sidecars first, then the embedded tracks', () {
      expect(siloSubtitleOrder(source), [4, 2, 3]);
      expect(siloSubtitleCombinedIndex(source, 4), 0);
      expect(siloSubtitleCombinedIndex(source, 2), 1);
      expect(siloSubtitleCombinedIndex(source, 3), 2);
      expect(siloSubtitleCombinedIndex(source, 1), isNull, reason: 'audio');
      expect(siloSubtitleCombinedIndex(source, -1), isNull, reason: 'off');
    });

    test('xXx: its two sidecars are 0 and 1', () {
      final xxx = _source(siloTestItem('silo/watch_movie.json'));
      expect(siloSubtitleOrder(xxx), [2, 3]);
    });

    test('a downloaded track gets the next free index', () {
      expect(siloSubtitleIndexByCombined(_plan({'mode': 'off'}), source), {
        0: 4,
        1: 2,
        2: 3,
        3: 5,
      });
    });
  });

  group('the plan', () {
    test('every text sidecar, with the token, on Moonfin\'s index', () {
      final subtitles = siloPlanSubtitles(
        plan: _plan({'mode': 'off'})..['delivery'] = 'original_http',
        source: source,
        baseUrl: _base,
        accessToken: 'access-1',
      );
      final external = subtitles.externalSubtitles;
      expect(external.map((s) => s.streamIndex), [4, 2, 5]);
      expect(
        external.first.deliveryUrl,
        '$_base/api/v2/stream/$_session/subtitles/0.vtt'
        '?file_id=4598&token=access-1',
      );
      expect(external[1].deliveryUrl, contains('embedded_stream_index=2'));
      expect(external.map((s) => s.codec).toSet(), {'vtt'});
      expect(external[1].isDefault, isTrue);
      // Off.
      expect(subtitles.selectedStreamIndex, -1);
      // The downloaded track is a stream now, and the file's are as they were.
      final downloaded = subtitles.mediaStreams.last;
      expect(downloaded['Index'], 5);
      expect(downloaded['Language'], 'es');
      expect(downloaded['IsExternal'], isTrue);
      expect(downloaded['IsHearingImpaired'], isTrue);
      expect(
        subtitles.mediaStreams.take(source['MediaStreams'].length),
        source['MediaStreams'],
      );
    });

    test('a remux hands out only the selected or requested embedded track', () {
      List<int?> handedOut(
        Map<String, dynamic> subtitle, {
        int? requested,
      }) => siloPlanSubtitles(
        plan: _plan(subtitle),
        source: source,
        baseUrl: _base,
        requestedStreamIndex: requested,
      ).externalSubtitles.map((s) => s.streamIndex).toList();

      expect(handedOut({'mode': 'off'}), [4, 5]);
      expect(handedOut({'mode': 'off'}, requested: 2), [4, 2, 5]);
      expect(
        handedOut({'mode': 'render', 'track_id': 'file:4598:subtitle:1'}),
        [4, 2, 5],
      );
      expect(
        handedOut({'mode': 'render', 'track_id': 'file:4598:subtitle:0'}),
        [4, 5],
      );
    });

    test('the selected track, and one Silo burns in', () {
      final rendered = siloPlanSubtitles(
        plan: _plan({'mode': 'render', 'track_id': 'file:4598:subtitle:1'}),
        source: source,
        baseUrl: _base,
      );
      expect(rendered.selectedStreamIndex, 2);
      final burnt = siloPlanSubtitles(
        plan: _plan({'mode': 'burn_in', 'track_id': 'file:4598:subtitle:2'}),
        source: source,
        baseUrl: _base,
      );
      expect(burnt.selectedStreamIndex, 3);
      final pgs = burnt.mediaStreams.firstWhere((s) => s['Index'] == 3);
      expect(pgs['DeliveryMethod'], 'Encode');
      // The item's own streams are untouched.
      final original = (source['MediaStreams'] as List).firstWhere(
        (s) => s['Index'] == 3,
      );
      expect(original, isNot(contains('DeliveryMethod')));
    });
  });

  group('asking Silo', () {
    late SiloTestServer server;
    late SiloMediaStreamResolver resolver;

    setUp(() {
      final decision = fixtureJson('decision_remux.json')
        ..['playback_plan'] = _plan({
          'mode': 'render',
          'track_id': 'file:4598:subtitle:1',
        });
      (decision['playback_plan'] as Map)['selected_tracks'] = {
        'audio': {'id': 'file:4598:audio:0', 'index': 0},
        'subtitle': {'id': 'file:4598:subtitle:1', 'index': 1},
      };
      server = SiloTestServer({
        capabilitiesPath: SiloTestServer.file(
          'silo/playback_capabilities.json',
        ),
        startPath: SiloTestServer.json(decision, status: 201),
        _replanPath: SiloTestServer.json(decision),
      });
      resolver = SiloMediaStreamResolver(siloTestClient(server));
    });

    test('a start names the subtitle Moonfin picked, or none', () async {
      await resolver.resolve(
        item,
        deviceProfile: _profile,
        subtitleStreamIndex: 3,
      );
      await resolver.resolve(
        item,
        deviceProfile: _profile,
        subtitleStreamIndex: -1,
      );
      final bodies = server.bodies(startPath);
      expect(bodies[0]['subtitle_track_index'], 2);
      expect(bodies[1], isNot(contains('subtitle_track_index')));
      expect(siloSchemaErrors('PlaybackStartBody', bodies[0]), isEmpty);
    });

    test('a track change turns subtitles off, picks one, or keeps the '
        'plan\'s', () async {
      var stream = await resolver.resolve(item, deviceProfile: _profile);
      expect(stream.selectedSubtitleStreamIndex, 2);
      for (final index in [-1, 5, null]) {
        stream = await resolver.replan(
          item,
          stream,
          ReplanRequest(
            reason: ReplanReason.trackChange,
            position: const Duration(minutes: 5),
            subtitleStreamIndex: index,
          ),
        );
      }
      final tracks = server
          .bodies(_replanPath)
          .map((b) => (b['selected_tracks'] as Map)['subtitle'])
          .toList();
      expect(tracks, [
        null,
        {'id': 'file:4598:subtitle:3', 'index': 3},
        {'id': 'file:4598:subtitle:1', 'index': 1},
      ]);
    });
  });
}
