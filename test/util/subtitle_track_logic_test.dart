import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/subtitle_track_logic.dart';
import 'fixture_loader.dart';

void main() {
  final streams = loadFixture('subtitle_streams.json');
  group('isExternalSubtitleStream', () {
    test('returns true when IsExternal flag is true', () {
      final stream = streams.firstWhere((s) => s['Index'] == 6);
      expect(isExternalSubtitleStream(stream), isTrue);
    });

    test('returns true when DeliveryMethod is external', () {
      final stream = streams.firstWhere((s) => s['Index'] == 7);
      expect(isExternalSubtitleStream(stream), isTrue);
    });

    test('returns false when neither flag is set', () {
      final stream = streams.firstWhere((s) => s['Index'] == 3);
      expect(isExternalSubtitleStream(stream), isFalse);
    });
  });
  group('isSdhSubtitleStream', () {
    test('returns true when IsHearingImpaired flag is true', () {
      final stream = streams.firstWhere((s) => s['Index'] == 4);
      expect(isSdhSubtitleStream(stream), isTrue);
    });

    test('returns true when title contains SDH keyword', () {
      final stream = streams.firstWhere((s) => s['Index'] == 5);
      expect(isSdhSubtitleStream(stream), isTrue);
    });

    test('returns false for a normal track', () {
      final stream = streams.firstWhere((s) => s['Index'] == 3);
      expect(isSdhSubtitleStream(stream), isFalse);
    });
  });
  group('sortedSubtitleStream', () {
    test('places internal streams before external streams', () {
      final sorted = sortedSubtitleStreams(streams);
      final firstExternal = sorted.indexWhere((s) => isExternalSubtitleStream(s));
      final lastInternal = sorted.lastIndexWhere((s) => !isExternalSubtitleStream(s));
      expect(lastInternal < firstExternal, isTrue);
    });
    test('preserves order within each group', () {
      final internals = streams.where((s) => !isExternalSubtitleStream(s)).toList();
      final sorted = sortedSubtitleStreams(streams);
      final sortedInternals = sorted.where((s) => !isExternalSubtitleStream(s)).toList();
      expect(sortedInternals.map((s) => s['Index']), internals.map((s) => s['Index']));
    });
  });
  group('computeEffectiveSubtitleIndex', () {
    test('returns selectedSubtitleIndex when set', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: 99,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        99,
      );
    });
    test('returns activePlaybackSubtitleIndex when no selection', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: 5,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        5,
      );
    });
    test('returns -1 for SubtitleMode.none', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.none,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        -1,
      );
    });
    // exclude forced track — Index 2 is forced
    final nonForced = streams.where((s) => s['IsForced'] != true).toList();
    test('selects preferred language track', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: nonForced,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        3,
      );
    });
    test('prefers fancy (PGS) SDH track over normal (SRT) SDH track when pgsDirectPlay is true', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: true,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        5, // Index 5 is PGS SDH, Index 4 is SRT SDH
      );
    });
    test('prefers normal (SRT) SDH track when pgsDirectPlay is false', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: true,
          pgsDirectPlay: false,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        4, // Index 4 is SRT SDH
      );
    });
    test('prefers external SDH track over internal non-SDH track when preferSdh is true', () {
      final customStreams = [
        {
          "Codec": "subrip",
          "Language": "eng",
          "DisplayTitle": "English - External SDH",
          "IsDefault": false,
          "IsForced": false,
          "IsHearingImpaired": true,
          "IsExternal": true,
          "Index": 1
        },
        {
          "Codec": "subrip",
          "Language": "eng",
          "DisplayTitle": "English - Internal Normal",
          "IsDefault": false,
          "IsForced": false,
          "IsHearingImpaired": false,
          "IsExternal": false,
          "Index": 2
        },
      ];
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: customStreams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: true,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        1,
      );
    });
    test('falls back to English when both preferred and fallback languages are not found', () {
      final customStreams = [
        {
          "Codec": "subrip",
          "Language": "jpn",
          "DisplayTitle": "Japanese",
          "IsDefault": true,
          "IsForced": false,
          "IsHearingImpaired": false,
          "IsExternal": false,
          "Index": 1
        },
        {
          "Codec": "subrip",
          "Language": "eng",
          "DisplayTitle": "English",
          "IsDefault": false,
          "IsForced": false,
          "IsHearingImpaired": false,
          "IsExternal": false,
          "Index": 2
        },
      ];
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: customStreams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'tha',
          fallbackLanguage: 'kor',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        2, // English track (Index 2) preferred over default Japanese track due to English fallback rule
      );
    });
    test('falls back to non-default English track in flagged mode when preferred and fallback are unavailable', () {
      final customStreams = [
        {
          "Codec": "subrip",
          "Language": "jpn",
          "DisplayTitle": "Japanese",
          "IsDefault": true,
          "IsForced": false,
          "IsHearingImpaired": false,
          "IsExternal": false,
          "Index": 1
        },
        {
          "Codec": "subrip",
          "Language": "eng",
          "DisplayTitle": "English",
          "IsDefault": false,
          "IsForced": false,
          "IsHearingImpaired": false,
          "IsExternal": false,
          "Index": 2
        },
      ];
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: customStreams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.flagged,
          preferredLanguage: 'tha',
          fallbackLanguage: 'kor',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        2, // English track (Index 2) preferred over default Japanese track in flagged mode
      );
    });
    test('falls back to fallbackSubtitleLanguage when preferred language is not found', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'tha',
          fallbackLanguage: 'ces',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        9, // Index 9 is ces (Czech)
      );
    });
    test('SubtitleMode.forced only selects forced tracks', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.forced,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        2, // Index 2 is forced
      );
    });
    test('SubtitleMode.flagged only selects default or forced tracks', () {
      final cesTracks = streams.where((s) => s['Language'] == 'ces').toList();
      // None of the ces tracks are default or forced, so should return -1
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: cesTracks,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.flagged,
          preferredLanguage: 'ces',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        -1,
      );
    });
    test('SubtitleMode.foreign keeps subtitles off when active audio language matches preferred audio language', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.foreign,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: 'eng',
          activeAudioLanguage: 'eng',
        ),
        -1,
      );
    });
    test('SubtitleMode.foreign selects subtitles when active audio language is foreign', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.foreign,
          preferredLanguage: 'eng',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: 'eng',
          activeAudioLanguage: 'jpn',
        ),
        3, // Index 3 is preferred english track
      );
    });
    test('cs matches ces correctly and prefers it over non-matching languages', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'cs',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        9, // Index 9 is ces (Czech) which matches 'cs'
      );
    });
    test('ces matches ces directly and prefers it over non-matching languages', () {
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          subtitleMode: SubtitleMode.always,
          preferredLanguage: 'ces',
          fallbackLanguage: '',
          preferSdh: false,
          pgsDirectPlay: true,
          assDirectPlay: true,
          preferredAudioLanguage: '',
          activeAudioLanguage: null,
        ),
        9, // Index 9 is ces (Czech)
      );
    });
  });
  group('mapSubtitleResultToStreamIndex', () {
    test('returns -1 when result is 0 (None selected)', () {
      expect(mapSubtitleResultToStreamIndex(0, streams), -1);
    });
    test('returns correct stream index for valid result', () {
      expect(mapSubtitleResultToStreamIndex(1, streams), streams.first['Index']);
    });
    test('returns null when result is out of range', () {
      expect(mapSubtitleResultToStreamIndex(999, streams), null);
    });
    test('returns null when result is negative', () {
      expect(mapSubtitleResultToStreamIndex(-5, streams), null);
    });
  });
}