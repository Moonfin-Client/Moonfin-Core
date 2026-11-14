import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/di/modules/playback_module.dart';
import 'package:moonfin/preference/user_preferences.dart';

import '../util/media_segment_fakes.dart';

const _series = 'series-1';

/// What the server resolved for the episode being played.
const _playing = <Map<String, dynamic>>[
  {'Index': 0, 'Type': 'Video'},
  {'Index': 1, 'Type': 'Audio', 'Language': 'ita', 'Title': 'Italiano'},
  {'Index': 2, 'Type': 'Audio', 'Language': 'jpn', 'Title': 'Japanese'},
  {'Index': 3, 'Type': 'Subtitle', 'Language': 'ita', 'Title': 'Italiano'},
];

AggregatedItem _episode(Map<String, dynamic> extra) => AggregatedItem(
  id: 'episode-1',
  serverId: 'server-1',
  rawData: {
    'Id': 'episode-1',
    'Type': 'Episode',
    'SeriesId': _series,
    ...extra,
  },
);

void main() {
  late UserPreferences prefs;

  setUp(() async => prefs = await testPrefs());

  test('an episode queued without its streams still remembers the audio', () {
    // A Next Up card or the episode after asks only for a few fields.
    final queued = _episode({'Overview': '', 'RunTimeTicks': 1});

    final saved = rememberSeriesTrackChoice(
      prefs,
      queued,
      2,
      subtitle: false,
      playingStreams: _playing,
    );

    expect(saved, _series);
    expect(prefs.getSeriesAudioPreference(_series).language, 'jpn');
  });

  test('and the subtitle', () {
    rememberSeriesTrackChoice(
      prefs,
      _episode(const {}),
      3,
      subtitle: true,
      playingStreams: _playing,
    );

    expect(prefs.getSeriesSubtitlePreference(_series).language, 'ita');
  });

  test('the item\'s own streams serve when nothing has been resolved', () {
    final saved = rememberSeriesTrackChoice(
      prefs,
      _episode({'MediaStreams': _playing}),
      2,
      subtitle: false,
    );

    expect(saved, _series);
    expect(prefs.getSeriesAudioPreference(_series).language, 'jpn');
  });

  test('a track found nowhere keeps the last choice', () {
    final saved = rememberSeriesTrackChoice(
      prefs,
      _episode(const {}),
      2,
      subtitle: false,
    );

    expect(saved, isNull);
    expect(prefs.getSeriesAudioPreference(_series).isEmpty, isTrue);
  });
}
