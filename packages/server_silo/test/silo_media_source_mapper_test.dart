import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

List<Map<String, dynamic>> _sources(Object? item) =>
    ((item as Map)['MediaSources'] as List).cast<Map<String, dynamic>>();

List<Map<String, dynamic>> _streams(Map<String, dynamic> source) =>
    (source['MediaStreams'] as List).cast<Map<String, dynamic>>();

List<Map<String, dynamic>> _ofType(Map<String, dynamic> source, String type) =>
    _streams(source).where((s) => s['Type'] == type).toList();

/// The fields both servers send for the same stream with the same meaning.
const _videoFields = [
  'Codec',
  'Profile',
  'Level',
  'Width',
  'Height',
  'AspectRatio',
  'IsInterlaced',
  'BitDepth',
  'PixelFormat',
  'ColorTransfer',
  'ColorPrimaries',
  'ColorSpace',
  'IsDefault',
  'IsExternal',
  'DisplayTitle',
];
const _audioFields = [
  'Codec',
  'Channels',
  'SampleRate',
  'BitRate',
  'IsDefault',
  'IsExternal',
  'Title',
];
const _subtitleFields = [
  'Index',
  'IsForced',
  'IsDefault',
  'IsExternal',
  'IsTextSubtitleStream',
  'SupportsExternalStream',
  'Title',
];

void _sameStreams(
  Map<String, dynamic> silo,
  Map<String, dynamic> emby,
  String type,
  List<String> fields,
) {
  final s = _ofType(silo, type);
  final e = _ofType(emby, type);
  expect(s.length, e.length, reason: '$type count');
  for (var i = 0; i < s.length; i++) {
    for (final f in fields) {
      expect(s[i][f], e[i][f], reason: '$type $i $f');
    }
  }
}

void main() {
  group('golden: xXx against Emby', () {
    late Map<String, dynamic> silo;
    late Map<String, dynamic> emby;

    setUp(() {
      silo = _sources(
        siloItemToBaseItemDto(_json('silo/catalog_item_movie.json')),
      ).single;
      emby = _sources(_json('emby/playback_info_movie.json')).single;
    });

    test('the source', () {
      expect(silo['Id'], '4598');
      expect(silo['ItemId'], 'movie-imdb-tt0295701');
      for (final key in [
        'Name',
        'Path',
        'Container',
        'Size',
        'Protocol',
        'Type',
        'IsRemote',
        'SupportsDirectPlay',
        'SupportsDirectStream',
        'SupportsTranscoding',
      ]) {
        expect(silo[key], emby[key], reason: key);
      }
      // Silo sends whole kilobits and whole seconds.
      expect(silo['Bitrate'], (emby['Bitrate'] as int) ~/ 1000 * 1000);
      expect(
        ((silo['RunTimeTicks'] as int) - (emby['RunTimeTicks'] as int)).abs(),
        lessThan(10000000),
      );
    });

    test('streams of each type match', () {
      _sameStreams(silo, emby, 'Video', [..._videoFields, 'VideoRange']);
      _sameStreams(silo, emby, 'Audio', [
        ..._audioFields,
        'Profile',
        'ChannelLayout',
        'DisplayTitle',
      ]);
      _sameStreams(silo, emby, 'Subtitle', _subtitleFields);
      expect(
        _ofType(silo, 'Subtitle').first['DisplayTitle'],
        'English (Forced SRT)',
      );
      expect(
        _ofType(silo, 'Video').single['RealFrameRate'],
        closeTo(emby['MediaStreams'][1]['RealFrameRate'] as num, 0.001),
      );
    });

    test(
      'one index space: subtitles keep 2 and 3, video and audio fill 0, 1',
      () {
        // Emby numbers in container order (audio 0, video 1). Silo sends no
        // index for video and audio, so video takes the first free one.
        expect(_streams(silo).map((s) => '${s['Type']}${s['Index']}'), [
          'Video0',
          'Audio1',
          'Subtitle2',
          'Subtitle3',
        ]);
      },
    );

    test('the default audio index points at the audio stream', () {
      final index = silo['DefaultAudioStreamIndex'];
      expect(_ofType(silo, 'Audio').single['Index'], index);
      expect(silo, isNot(contains('DefaultSubtitleStreamIndex')));
    });

    test('the track map gives Silo\'s ordinals back', () {
      expect(
        siloTrackForStreamIndex(silo, 0),
        const SiloTrackRef(kind: SiloTrackKind.video, ordinal: 0),
      );
      expect(
        siloTrackForStreamIndex(silo, 1),
        const SiloTrackRef(kind: SiloTrackKind.audio, ordinal: 0),
      );
      expect(
        siloTrackForStreamIndex(silo, 3),
        const SiloTrackRef(
          kind: SiloTrackKind.subtitle,
          ordinal: 1,
          containerIndex: 3,
        ),
      );
      expect(siloTrackForStreamIndex(silo, 9), isNull);
      expect(siloStreamIndexForTrack(silo, SiloTrackKind.subtitle, 0), 2);
      expect(siloStreamIndexForTrack(silo, SiloTrackKind.audio, 0), 1);
      expect(siloStreamIndexForTrack(silo, SiloTrackKind.audio, 1), isNull);
    });

    test('the item carries the default source\'s streams', () {
      final item = siloItemToBaseItemDto(
        _json('silo/catalog_item_movie.json'),
      )!;
      expect(item['MediaStreams'], same(_sources(item).first['MediaStreams']));
    });
  });

  group('golden: The Salt Path, two versions, against Emby', () {
    late List<Map<String, dynamic>> silo;
    late List<Map<String, dynamic>> emby;

    setUp(() {
      silo = _sources(
        siloItemToBaseItemDto(_json('silo/catalog_item_movie_multi.json')),
      );
      emby = _sources(_json('emby/playback_info_movie_multi.json'));
    });

    Map<String, dynamic> embyByPath(Object? path) =>
        emby.firstWhere((e) => e['Path'] == path);

    test('the default version (4K) comes first', () {
      expect(silo.map((s) => s['Id']), ['4603', '4602']);
      expect(silo.map((s) => s['Type']), ['Default', 'Grouping']);
    });

    test('each version matches the same file on Emby', () {
      // Emby's library has a third (WEB-DL) file Silo doesn't. The two shared
      // files are compared by path.
      for (final s in silo) {
        final e = embyByPath(s['Path']);
        expect(s['Size'], e['Size']);
        expect(s['Container'], e['Container']);
        // Emby writes "HDR 10" where Jellyfin and this mapper write HDR10.
        _sameStreams(s, e, 'Video', [
          for (final f in _videoFields)
            if (f != 'DisplayTitle') f,
        ]);
        _sameStreams(s, e, 'Audio', [..._audioFields, 'DisplayTitle']);
        _sameStreams(s, e, 'Subtitle', _subtitleFields);
        expect(
          _ofType(s, 'Subtitle').map((x) => x['DisplayTitle']),
          _ofType(e, 'Subtitle').map((x) => x['DisplayTitle']),
        );
      }
    });

    test('HDR10 on the 4K file, SDR on the 1080p one', () {
      final uhd = _ofType(silo[0], 'Video').single;
      expect(uhd['VideoRange'], 'HDR');
      expect(uhd['VideoRangeType'], 'HDR10');
      expect(uhd['DisplayTitle'], '4K HDR10 HEVC');
      final hd = _ofType(silo[1], 'Video').single;
      expect(hd['VideoRange'], 'SDR');
      expect(hd['VideoRangeType'], 'SDR');
    });

    test('a PGS subtitle is an image subtitle', () {
      final pgs = _ofType(silo[1], 'Subtitle').first;
      expect(pgs['Codec'], 'hdmv_pgs_subtitle');
      expect(pgs['IsTextSubtitleStream'], isFalse);
      expect(pgs['SupportsExternalStream'], isFalse);
    });
  });

  group('golden: Young Justice 1x01 against Emby', () {
    test('from /watch (duration_seconds): same indices and streams', () {
      final silo = _sources(
        siloItemToBaseItemDto(_json('silo/watch_episode.json')),
      ).single;
      final emby = _sources(_json('emby/item_episode.json')).single;
      expect(
        _streams(silo).map((s) => '${s['Type']}${s['Index']}'),
        _streams(emby).map((s) => '${s['Type']}${s['Index']}'),
      );
      expect(silo['Size'], emby['Size']);
      expect(silo['RunTimeTicks'], 13570000000);
      _sameStreams(silo, emby, 'Video', [
        'Codec',
        'Width',
        'Height',
        'BitDepth',
        'Profile',
        'DisplayTitle',
      ]);
      expect(
        (_ofType(silo, 'Audio').single['ChannelLayout'] as String)
            .toLowerCase(),
        _ofType(emby, 'Audio').single['ChannelLayout'],
      );
      _sameStreams(silo, emby, 'Subtitle', [
        ..._subtitleFields,
        'DisplayTitle',
      ]);
    });

    test('a season list file gives the badges what they need', () {
      final entry =
          (_json('silo/season_episodes.json')['items'] as List).first
              as Map<String, dynamic>;
      final source = _sources(
        siloItemToBaseItemDto(entry, type: 'episode'),
      ).single;
      final emby = _sources(
        (_json('emby/season_episodes.json')['Items'] as List).first,
      ).single;
      expect(source['Id'], '89618');
      expect(source['Size'], emby['Size']);
      final video = _ofType(source, 'Video').single;
      final embyVideo = _ofType(emby, 'Video').single;
      expect(video['Width'], embyVideo['Width']);
      expect(video['Height'], embyVideo['Height']);
      expect(video['Codec'], 'hevc');
      expect(video['VideoRangeType'], 'SDR');
      expect(_ofType(source, 'Audio').single['Channels'], 2);
      expect(source[siloTracksKey], isEmpty);
    });
  });

  group('index space', () {
    Map<String, dynamic> source(Map<String, dynamic> version) =>
        siloVersionToMediaSource({'file_id': 'f', ...version}, itemId: 'i')!;

    test('video and audio skip the indices subtitles hold', () {
      final s = source({
        'video_tracks': [{}],
        'audio_tracks': [{}, {}],
        'subtitle_tracks': [
          {'index': 0},
          {'index': 2},
        ],
      });
      expect(_streams(s).map((x) => '${x['Type']}${x['Index']}'), [
        'Subtitle0',
        'Video1',
        'Subtitle2',
        'Audio3',
        'Audio4',
      ]);
      expect(
        siloTrackForStreamIndex(s, 4),
        const SiloTrackRef(kind: SiloTrackKind.audio, ordinal: 1),
      );
    });

    test(
      'subtitles without an index, or with a repeated one, get free ones',
      () {
        final s = source({
          'audio_tracks': [{}],
          'subtitle_tracks': [
            {'index': 1},
            {},
            {'index': 1},
          ],
        });
        expect(_streams(s).map((x) => '${x['Type']}${x['Index']}'), [
          'Audio0',
          'Subtitle1',
          'Subtitle2',
          'Subtitle3',
        ]);
        expect(siloTrackForStreamIndex(s, 2)!.containerIndex, isNull);
        expect(siloStreamIndexForTrack(s, SiloTrackKind.subtitle, 2), 3);
      },
    );

    test('the default audio follows effective_audio_track_index', () {
      final s = source({
        'effective_audio_track_index': 1,
        'audio_tracks': [
          {'default': true, 'language': 'en'},
          {'language': 'de'},
        ],
      });
      expect(s['DefaultAudioStreamIndex'], 1);
      expect(_ofType(s, 'Audio').map((a) => a['IsDefault']), [false, true]);
    });

    test('without it, the flagged default; else the first', () {
      expect(
        source({
          'audio_tracks': [
            {},
            {'default': true},
          ],
        })['DefaultAudioStreamIndex'],
        1,
      );
      expect(
        source({
          'audio_tracks': [{}, {}],
        })['DefaultAudioStreamIndex'],
        0,
      );
    });

    test('a default subtitle sets DefaultSubtitleStreamIndex', () {
      final s = source({
        'subtitle_tracks': [
          {'index': 5},
          {'index': 6, 'default': true, 'language': 'fr', 'codec': 'ass'},
        ],
      });
      expect(s['DefaultSubtitleStreamIndex'], 6);
      expect(
        _ofType(s, 'Subtitle').last['DisplayTitle'],
        'French (Default ASS)',
      );
    });

    test('no file id, no source', () {
      expect(siloVersionToMediaSource({}, itemId: 'i'), isNull);
    });
  });

  group('video range', () {
    Map<String, dynamic> video(Map<String, dynamic> track) => _ofType(
      siloVersionToMediaSource({
        'file_id': 'f',
        'video_tracks': [
          {'width': 3840, 'height': 2160, 'codec': 'hevc', ...track},
        ],
      }, itemId: 'i')!,
      'Video',
    ).single;

    test('Silo\'s type in Jellyfin spelling', () {
      expect(video({'video_range_type': 'HDR10'})['VideoRangeType'], 'HDR10');
      expect(
        video({'video_range_type': 'hdr10_plus'})['VideoRangeType'],
        'HDR10Plus',
      );
      expect(
        video({'video_range_type': 'HDR10+'})['VideoRangeType'],
        'HDR10Plus',
      );
      expect(
        video({'video_range_type': 'DOVIWithHDR10'})['VideoRangeType'],
        'DOVIWithHDR10',
      );
      expect(video({'video_range_type': 'Weird'})['VideoRangeType'], 'Weird');
    });

    test('worked out when Silo doesn\'t say', () {
      expect(video({})['VideoRangeType'], 'SDR');
      expect(video({})['VideoRange'], 'SDR');
      expect(video({'color_transfer': 'smpte2084'})['VideoRangeType'], 'HDR10');
      expect(
        video({'color_transfer': 'arib-std-b67'})['VideoRangeType'],
        'HLG',
      );
      expect(video({'hdr10_plus': true})['VideoRangeType'], 'HDR10Plus');
      expect(video({'dv_profile': 5})['VideoRangeType'], 'DOVI');
      final dv = video({'dv_profile': 8, 'dv_bl_compat_id': 1, 'dv_level': 6});
      expect(dv['VideoRangeType'], 'DOVIWithHDR10');
      expect(dv['VideoRange'], 'HDR');
      expect(dv['DvProfile'], 8);
      expect(dv['DvLevel'], 6);
      expect(dv['DvBlSignalCompatibilityId'], 1);
      expect(dv['DisplayTitle'], '4K DOVIWithHDR10 HEVC');
      expect(
        video({'dv_profile': 8, 'dv_bl_compat_id': 4})['VideoRangeType'],
        'DOVIWithHLG',
      );
      expect(video({'dolby_vision': 'none'})['VideoRangeType'], 'SDR');
    });

    test('frame rates as fractions', () {
      expect(
        video({'frame_rate': '24000/1001'})['RealFrameRate'],
        closeTo(23.976, 0.001),
      );
      expect(video({'frame_rate': 'n/a'}), isNot(contains('RealFrameRate')));
    });
  });

  group('labels', () {
    Map<String, dynamic> audio(Map<String, dynamic> track) => _ofType(
      siloVersionToMediaSource({
        'file_id': 'f',
        'audio_tracks': [track],
      }, itemId: 'i')!,
      'Audio',
    ).single;

    test('channel layouts', () {
      expect(audio({'layout': '7.1(wide)'})['ChannelLayout'], '7.1');
      expect(audio({'layout': 'mono'})['ChannelLayout'], 'Mono');
      expect(audio({'channels': 2})['ChannelLayout'], 'Stereo');
      expect(audio({'channels': 3}), isNot(contains('ChannelLayout')));
    });

    test('an audio title names language, codec, layout', () {
      expect(
        audio({
          'language': 'ja',
          'codec': 'truehd',
          'channels': 8,
        })['DisplayTitle'],
        'Japanese TRUEHD 7.1 (Default)',
      );
      expect(
        audio({'language': 'xx', 'codec': 'aac'})['DisplayTitle'],
        'XX AAC (Default)',
      );
    });

    test('the title is the track\'s own, not ffprobe\'s codec name', () {
      final a = audio({'title': 'DCA (DTS Coherent Acoustics)'});
      expect(a, isNot(contains('Title')));
      expect(audio({'embedded_title': 'Commentary'})['Title'], 'Commentary');
    });

    test('language names', () {
      expect(siloLanguageName('en'), 'English');
      expect(siloLanguageName('ger'), 'German');
      expect(siloLanguageName('pt-BR'), 'Portuguese');
      expect(siloLanguageName('und'), isNull);
      expect(siloLanguageName(''), isNull);
      expect(siloLanguageName('tlh'), 'TLH');
    });

    test('a version without a file name is named by its quality', () {
      final s = siloVersionToMediaSource({
        'file_id': 'f',
        'edition_raw': 'Extended',
        'resolution': '2160p',
        'codec_video': 'hevc',
        'hdr': true,
        'video_tracks': [
          {'video_range_type': 'DOVI'},
        ],
      }, itemId: 'i')!;
      expect(s['Name'], 'Extended 2160p HEVC DOVI');
    });
  });

  group('items', () {
    test('a series has no media sources', () {
      final series = siloItemToBaseItemDto(
        _json('silo/catalog_item_series.json'),
      )!;
      expect(series, isNot(contains('MediaSources')));
      expect(series, isNot(contains('MediaStreams')));
    });

    test('an item without versions has none either', () {
      final movie = siloItemToBaseItemDto({
        'type': 'movie',
        'content_id': 'm',
        'versions': [],
      })!;
      expect(movie, isNot(contains('MediaSources')));
    });
  });
}
