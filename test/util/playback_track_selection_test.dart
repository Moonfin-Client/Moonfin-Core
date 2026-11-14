import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/series_track_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/playback_track_selection.dart';

import 'media_segment_fakes.dart';

const _series = 'series-1';

/// An anime episode with the Italian dub flagged default and the original
/// Japanese next to it, and one full Italian subtitle.
final _audio = <Map<String, dynamic>>[
  {'Type': 'Audio', 'Index': 1, 'Language': 'ita', 'IsDefault': true},
  {'Type': 'Audio', 'Index': 2, 'Language': 'jpn'},
];
final _subtitles = <Map<String, dynamic>>[
  {'Type': 'Subtitle', 'Index': 3, 'Language': 'ita', 'Codec': 'subrip'},
];

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = await testPrefs();
    await prefs.set(UserPreferences.defaultAudioLanguage, 'ita');
    await prefs.set(UserPreferences.defaultSubtitleLanguage, 'ita');
    await prefs.set(UserPreferences.subtitleMode, SubtitleMode.foreign);
  });

  group('subtitles only for foreign audio', () {
    test('stay off when the episode plays in the viewer\'s language', () {
      expect(
        selectPlaybackAudioIndex(
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
        ),
        1,
      );
      expect(
        selectPlaybackSubtitleIndex(
          subtitleStreams: _subtitles,
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
        ),
        -1,
      );
    });

    test('come on when the series remembers foreign audio', () async {
      await prefs.setSeriesAudioPreference(
        _series,
        const SeriesTrackPreference(language: 'jpn'),
      );

      expect(
        selectPlaybackAudioIndex(
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
        ),
        2,
      );
      // The audio that plays is Japanese, so the Italian subtitle belongs on,
      // even though the global audio language is Italian.
      expect(
        selectPlaybackSubtitleIndex(
          subtitleStreams: _subtitles,
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
        ),
        3,
      );
    });

    test('come on when the foreign audio was picked for this item', () {
      expect(
        selectPlaybackSubtitleIndex(
          subtitleStreams: _subtitles,
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
          session: const SessionTrackChoices(explicitAudioIndex: 2),
        ),
        3,
      );
    });

    test('a pick for this item beats the series\' remembered audio', () async {
      await prefs.setSeriesAudioPreference(
        _series,
        const SeriesTrackPreference(language: 'jpn'),
      );
      expect(
        selectPlaybackSubtitleIndex(
          subtitleStreams: _subtitles,
          audioStreams: _audio,
          prefs: prefs,
          seriesId: _series,
          session: const SessionTrackChoices(explicitAudioIndex: 1),
        ),
        -1,
      );
    });
  });
}
