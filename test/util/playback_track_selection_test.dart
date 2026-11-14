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

  group('series track mode', () {
    /// Both tracks, a full and a forced Italian subtitle and a full English one.
    final subtitles = <Map<String, dynamic>>[
      {'Type': 'Subtitle', 'Index': 3, 'Language': 'ita', 'Codec': 'subrip'},
      {
        'Type': 'Subtitle',
        'Index': 4,
        'Language': 'ita',
        'Codec': 'subrip',
        'IsForced': true,
      },
      {'Type': 'Subtitle', 'Index': 5, 'Language': 'eng', 'Codec': 'subrip'},
    ];

    ({int? audio, int? subtitle}) pick({
      List<Map<String, dynamic>>? audio,
      List<Map<String, dynamic>>? subs,
      SessionTrackChoices session = const SessionTrackChoices(),
    }) => (
      audio: selectPlaybackAudioIndex(
        audioStreams: audio ?? _audio,
        prefs: prefs,
        seriesId: _series,
        session: session,
      ),
      subtitle: selectPlaybackSubtitleIndex(
        subtitleStreams: subs ?? subtitles,
        audioStreams: audio ?? _audio,
        prefs: prefs,
        seriesId: _series,
        session: session,
      ),
    );

    test('Default leaves the usual settings in charge', () {
      expect(prefs.getSeriesTrackMode(_series), SeriesTrackMode.standard);
      expect(pick(), (audio: 1, subtitle: -1));
    });

    test('Subbed plays the original audio with full subtitles', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      expect(pick(), (audio: 2, subtitle: 3));
    });

    test('Dubbed plays the viewer\'s language with forced subtitles', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.dubbed);
      expect(pick(), (audio: 1, subtitle: 4));
    });

    test('a mode outranks the tracks the series remembers', () async {
      await prefs.setSeriesAudioPreference(
        _series,
        const SeriesTrackPreference(language: 'jpn'),
      );
      await prefs.setSeriesSubtitlePreference(
        _series,
        const SeriesTrackPreference(language: 'eng'),
      );
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.dubbed);
      expect(pick(), (audio: 1, subtitle: 4));

      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      expect(pick(), (audio: 2, subtitle: 3));
    });

    test('Subbed with only the dub keeps the dub and its forced subtitles',
        () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      expect(pick(audio: [_audio.first]), (audio: 1, subtitle: 4));
    });

    test('Subbed takes an untagged track for a possible dub, not the original',
        () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      final audio = <Map<String, dynamic>>[
        _audio.first,
        {'Type': 'Audio', 'Index': 2, 'Language': 'und'},
      ];
      expect(pick(audio: audio).audio, 1);
    });

    test('Dubbed with no dub keeps the original with full subtitles', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.dubbed);
      expect(pick(audio: [_audio.last]), (audio: 2, subtitle: 3));
    });

    test('Subbed falls back to full subtitles in another language', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      // Only a forced Italian track is left, which covers signs and nothing
      // else, so the full English one is the better read.
      expect(pick(subs: subtitles.sublist(1)), (audio: 2, subtitle: 5));
    });

    test('Dubbed with no forced subtitles shows none', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.dubbed);
      expect(
        pick(subs: [subtitles.first, subtitles.last]),
        (audio: 1, subtitle: -1),
      );
    });

    test('a pick made during the session still wins', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.subbed);
      // Switched to the dub mid-episode: the next one stays on it, and its
      // subtitles follow the audio rather than the mode.
      expect(
        pick(session: const SessionTrackChoices(audioLanguage: 'ita')),
        (audio: 1, subtitle: 4),
      );
      // Subtitles turned off mid-episode stay off.
      expect(
        pick(session: const SessionTrackChoices(subtitleEnabled: false)),
        (audio: 2, subtitle: -1),
      );
    });

    test('Default clears the stored mode', () async {
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.dubbed);
      await prefs.setSeriesTrackMode(_series, SeriesTrackMode.standard);
      expect(prefs.getSeriesTrackMode(_series), SeriesTrackMode.standard);
      expect(SeriesTrackMode.fromStored('something else'),
          SeriesTrackMode.standard);
    });
  });
}