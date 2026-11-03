import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _series = 'series-imdb-tt1641384';
const _item = 'movie-imdb-tt0295701';
const _audio = '/api/v2/audio-prefs/$_series';
const _subtitle = '/api/v2/subtitle-prefs/$_series';
const _effective = '/api/v2/settings/values/effective';
const _languageSetting = '/api/v2/settings/values/playback.subtitle_language';
const _modeSetting = '/api/v2/settings/values/playback.subtitle_mode';

ResponseBody _noContent(RequestOptions _) => ResponseBody.fromString('', 204);

/// Effective subtitle settings for the series: [values] at [scope].
ResponseBody Function(RequestOptions) _settings(
  Map<String, Object?> values, {
  String scope = 'profile_series',
}) => siloJson({
  'items': [
    for (final e in values.entries)
      {
        'key': e.key,
        'value': e.value,
        'source': scope,
        'scope': scope,
        'series_id': _series,
        'definition_revision': 1,
      },
  ],
});

/// xXx's file as the resolver notes it: audio 1 (English DTS 5.1), the
/// English forced sidecar 2 and an untagged sidecar 3.
Map<String, dynamic> _source() {
  final item = siloItemToBaseItemDto(
    jsonDecode(fixture('silo/watch_movie.json')) as Map<String, dynamic>,
  )!;
  return ((item['MediaSources'] as List).first as Map).cast<String, dynamic>();
}

List<String> _writes(FixtureServer server) => [
  for (final r in server.requests)
    if (r.method != 'GET')
      '${r.method} ${r.uri.path}'
          '${r.uri.query.isEmpty ? '' : '?${r.uri.query}'} ${jsonEncode(r.data)}',
];

SeriesTrackPreferencesApi _api(FixtureServer server, {bool noted = true}) {
  final api = siloTestClient(server).itemsApi;
  if (noted) api.notePlayingFile(_item, '4598', source: _source());
  return api;
}

void main() {
  group('reading', () {
    test('the series\' audio track', () async {
      final server = FixtureServer({
        _audio: siloJson({
          'profile_id': 'p1',
          'series_id': _series,
          'audio_language': 'ja',
          'audio_track_index': 1,
          'track_signature': {'language': 'ja', 'embedded_title': 'Japanese'},
          'updated_at': '2026-10-17T12:00:00.000Z',
        }),
      });
      final choice = await _api(server).getSeriesAudioChoice(_series);
      expect(choice?.language, 'ja');
      expect(choice?.title, 'Japanese');
      expect(choice?.off, isFalse);
    });

    test('no audio choice: a 404 or no track', () async {
      expect(
        await _api(FixtureServer({})).getSeriesAudioChoice(_series),
        isNull,
      );
      final server = FixtureServer({
        _audio: siloJson({
          'profile_id': 'p1',
          'series_id': _series,
          'audio_language': '',
          'audio_track_index': -1,
          'updated_at': '2026-10-17T12:00:00.000Z',
        }),
      });
      expect(await _api(server).getSeriesAudioChoice(_series), isNull);
    });

    test('subtitles: the row, with the series settings on top', () async {
      final server = FixtureServer({
        _subtitle: siloJson({
          'profile_id': 'p1',
          'series_id': _series,
          'subtitle_language': 'en',
          'subtitle_mode': 'always',
          'subtitle_track_index': 0,
          'track_signature': {'language': 'en', 'label': 'English SDH'},
          'updated_at': '2026-10-17T12:00:00.000Z',
        }),
        _effective: _settings({'playback.subtitle_language': 'en'}),
      });
      final choice = await _api(server).getSeriesSubtitleChoice(_series);
      expect(choice?.language, 'en');
      expect(choice?.title, 'English SDH');
      final query = server.requests
          .firstWhere((r) => r.uri.path == _effective)
          .uri
          .queryParametersAll;
      expect(query['series_ids'], [_series]);
      expect(query['keys'], [
        'playback.subtitle_language',
        'playback.subtitle_mode',
      ]);
    });

    test('a newer language from the settings drops the row\'s label', () async {
      final server = FixtureServer({
        _subtitle: siloJson({
          'profile_id': 'p1',
          'series_id': _series,
          'subtitle_language': 'en',
          'subtitle_mode': 'always',
          'subtitle_track_index': 0,
          'track_signature': {'language': 'en', 'label': 'English SDH'},
          'updated_at': '2026-10-17T12:00:00.000Z',
        }),
        _effective: _settings({'playback.subtitle_language': 'fr'}),
      });
      final choice = await _api(server).getSeriesSubtitleChoice(_series);
      expect(choice?.language, 'fr');
      expect(choice?.title, '');
    });

    test('off, from the settings or the row', () async {
      var server = FixtureServer({
        _effective: _settings({'playback.subtitle_mode': 'off'}),
      });
      expect((await _api(server).getSeriesSubtitleChoice(_series))?.off, true);
      server = FixtureServer({
        _subtitle: siloJson({
          'profile_id': 'p1',
          'series_id': _series,
          'subtitle_language': '',
          'subtitle_mode': 'off',
          'subtitle_track_index': -1,
          'updated_at': '2026-10-17T12:00:00.000Z',
        }),
        _effective: _settings({}),
      });
      expect((await _api(server).getSeriesSubtitleChoice(_series))?.off, true);
    });

    test('a profile-wide setting isn\'t this series\' choice', () async {
      final server = FixtureServer({
        _effective: _settings({
          'playback.subtitle_language': 'en',
          'playback.subtitle_mode': 'always',
        }, scope: 'profile'),
      });
      expect(await _api(server).getSeriesSubtitleChoice(_series), isNull);
    });
  });

  group('writing', () {
    test('an audio track, as Silo numbers it', () async {
      final server = FixtureServer({_audio: _noContent});
      await _api(
        server,
      ).setSeriesAudioChoice(_series, itemId: _item, streamIndex: 1);
      expect(_writes(server), [
        'PUT $_audio ${jsonEncode({
          'audio_language': 'en',
          'audio_track_index': 0,
          'track_signature': {'language': 'en', 'codec': 'dts', 'channels': 6, 'layout': '5.1', 'title': 'English DTS 5.1 (Default)', 'default': true},
        })}',
      ]);
    });

    test('a subtitle: the row and the two series settings', () async {
      final server = FixtureServer({
        _subtitle: _noContent,
        _languageSetting: siloJson({}),
        _modeSetting: siloJson({}),
      });
      await _api(
        server,
      ).setSeriesSubtitleChoice(_series, itemId: _item, streamIndex: 2);
      final writes = _writes(server);
      expect(writes, hasLength(3));
      expect(
        writes,
        contains(
          'PUT $_subtitle ${jsonEncode({
            'subtitle_track_index': 0,
            'subtitle_language': 'en',
            'subtitle_mode': 'always',
            'track_signature': {'source': 'external', 'language': 'en', 'codec': 'srt', 'label': 'English (Forced SRT)', 'forced': true, 'hearing_impaired': false},
          })}',
        ),
      );
      expect(
        writes,
        contains(
          'PUT $_languageSetting?scope=profile_series&series_id=$_series '
          '{"value":"en"}',
        ),
      );
      expect(
        writes,
        contains(
          'PUT $_modeSetting?scope=profile_series&series_id=$_series '
          '{"value":"always"}',
        ),
      );
    });

    test('subtitles off', () async {
      final server = FixtureServer({
        _subtitle: _noContent,
        _languageSetting: siloJson({}),
        _modeSetting: siloJson({}),
      });
      await _api(
        server,
      ).setSeriesSubtitleChoice(_series, itemId: _item, streamIndex: -1);
      expect(
        _writes(server),
        containsAll([
          'PUT $_subtitle {"subtitle_track_index":-1,"subtitle_language":"",'
              '"subtitle_mode":"off"}',
          'PUT $_languageSetting?scope=profile_series&series_id=$_series '
              '{"value":null}',
          'PUT $_modeSetting?scope=profile_series&series_id=$_series '
              '{"value":"off"}',
        ]),
      );
    });

    test('nothing without the playing file\'s tracks, or for a track Silo '
        'doesn\'t number', () async {
      final server = FixtureServer({});
      await _api(
        server,
        noted: false,
      ).setSeriesAudioChoice(_series, itemId: _item, streamIndex: 1);
      final api = _api(server);
      await api.setSeriesAudioChoice(_series, itemId: _item, streamIndex: 2);
      await api.setSeriesSubtitleChoice(_series, itemId: _item, streamIndex: 9);
      expect(server.requests, isEmpty);
    });
  });
}
