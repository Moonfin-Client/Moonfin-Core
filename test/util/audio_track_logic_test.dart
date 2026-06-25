import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/audio_track_logic.dart';

void main() {
  group('isCommentaryAudioStream', () {
    test('returns true when IsCommentary is true', () {
      expect(
        isCommentaryAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'IsCommentary': true,
        }),
        isTrue,
      );
    });

    test('returns true when DisplayTitle/Title/Name contains commentary keyword', () {
      expect(
        isCommentaryAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Title': 'Director\'s Commentary',
        }),
        isTrue,
      );
      expect(
        isCommentaryAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'DisplayTitle': 'Commentary by Director',
        }),
        isTrue,
      );
      expect(
        isCommentaryAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Name': 'commentary',
        }),
        isTrue,
      );
    });

    test('returns false for normal stream', () {
      expect(
        isCommentaryAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Title': 'Feature Audio',
        }),
        isFalse,
      );
    });
  });

  group('computeEffectiveAudioIndex', () {
    final List<Map<String, dynamic>> testStreams = [
      {
        'Type': 'Audio',
        'Index': 0,
        'Language': 'fre',
        'IsDefault': true,
        'Channels': 2,
      },
      {
        'Type': 'Audio',
        'Index': 1,
        'Language': 'eng',
        'IsDefault': false,
        'Channels': 6,
      },
      {
        'Type': 'Audio',
        'Index': 2,
        'Language': 'spa',
        'IsDefault': false,
        'Channels': 2,
      },
      {
        'Type': 'Audio',
        'Index': 3,
        'Language': 'eng',
        'IsDefault': false,
        'Title': 'Director Commentary',
        'Channels': 2,
      },
    ];

    test('returns explicit index if valid and exists', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
        explicitAudioIndex: 2,
      );
      expect(index, 2);
    });

    test('returns null when streams are empty', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: [],
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'spa',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, isNull);
    });

    test('filters out commentary tracks if non-commentary exists', () {
      // spanish preferred, but spain commentary has 'spa'.
      final streamsWithCommentary = [
        {
          'Type': 'Audio',
          'Index': 0,
          'Language': 'spa',
          'Title': 'Spanish Commentary',
          'Channels': 2,
        },
        {
          'Type': 'Audio',
          'Index': 1,
          'Language': 'spa',
          'Title': 'Spanish Feature Audio',
          'Channels': 2,
        },
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: streamsWithCommentary,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'eng',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 1);
    });

    test('returns commentary if only commentary tracks exist', () {
      final commentaryOnly = [
        {
          'Type': 'Audio',
          'Index': 0,
          'Language': 'spa',
          'Title': 'Commentary 1',
          'Channels': 2,
        },
        {
          'Type': 'Audio',
          'Index': 1,
          'Language': 'spa',
          'Title': 'Commentary 2',
          'Channels': 2,
        },
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: commentaryOnly,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'eng',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 0);
    });

    test('matches preferred language first', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 2); // spa is Index 2
    });

    test('matches fallback language if preferred not found', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'jpn',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 0); // fre is Index 0
    });

    test('falls back to English if preferred and fallback not found', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'jpn',
        fallbackAudioLanguage: 'ger',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 1); // eng is Index 1
    });

    test('falls back to default/first track if nothing matched', () {
      final unmatchedStreams = [
        {
          'Type': 'Audio',
          'Index': 0,
          'Language': 'jpn',
          'IsDefault': false,
          'Channels': 2,
        },
        {
          'Type': 'Audio',
          'Index': 1,
          'Language': 'ger',
          'IsDefault': true,
          'Channels': 2,
        },
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: unmatchedStreams,
        preferredAudioLanguage: 'fre',
        fallbackAudioLanguage: 'spa',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 1); // default track Index 1
    });

    test('preferDefaultAudioTrack = true prioritizes IsDefault track regardless of language match', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: true,
        preferAudioDescription: false,
      );
      expect(index, 0); // fre has IsDefault == true, SPA does not.
    });

    test('preferDefaultAudioTrack = false prioritizes language match over default track', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: testStreams,
        preferredAudioLanguage: 'spa',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 2); // Spanish (Index 2) preferred over French default (Index 0)
    });

    test('breaks ties using higher channel count (surround sound)', () {
      final sameLangStreams = [
        {
          'Type': 'Audio',
          'Index': 0,
          'Language': 'eng',
          'Channels': 2,
        },
        {
          'Type': 'Audio',
          'Index': 1,
          'Language': 'eng',
          'Channels': 6,
        },
        {
          'Type': 'Audio',
          'Index': 2,
          'Language': 'eng',
          'Channels': 2,
        },
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: sameLangStreams,
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 1); // 6 channels is Index 1
    });

    test('breaks ties of channel count using original index order', () {
      final sameLangSameChannel = [
        {
          'Type': 'Audio',
          'Index': 2,
          'Language': 'eng',
          'Channels': 6,
        },
        {
          'Type': 'Audio',
          'Index': 0,
          'Language': 'eng',
          'Channels': 6,
        },
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: sameLangSameChannel,
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 0); // original index order (0 before 2)
    });
  });

  group('isAudioDescriptionAudioStream', () {
    test('returns true when IsAudioDescription is true', () {
      expect(
        isAudioDescriptionAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'IsAudioDescription': true,
        }),
        isTrue,
      );
    });

    test('returns true when DisplayTitle/Title/Name contains AD keywords', () {
      expect(
        isAudioDescriptionAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Title': 'Descriptive Audio',
        }),
        isTrue,
      );
      expect(
        isAudioDescriptionAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'DisplayTitle': 'Audio Description',
        }),
        isTrue,
      );
      expect(
        isAudioDescriptionAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Name': 'English AD',
        }),
        isTrue,
      );
    });

    test('returns false for normal stream', () {
      expect(
        isAudioDescriptionAudioStream({
          'Type': 'Audio',
          'Index': 1,
          'Title': 'Feature Audio',
        }),
        isFalse,
      );
    });
  });

  group('computeEffectiveAudioIndex with preferAudioDescription', () {
    final adStreams = [
      {
        'Type': 'Audio',
        'Index': 0,
        'Language': 'eng',
        'Title': 'English Normal',
        'Channels': 2,
      },
      {
        'Type': 'Audio',
        'Index': 1,
        'Language': 'eng',
        'Title': 'English Descriptive Audio',
        'Channels': 2,
      },
    ];

    test('preferAudioDescription = false filters out AD tracks if normal exists', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: adStreams,
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 0);
    });

    test('preferAudioDescription = false does not filter out AD tracks if only AD exists', () {
      final onlyAd = [
        {
          'Type': 'Audio',
          'Index': 1,
          'Language': 'eng',
          'Title': 'English Descriptive Audio',
          'Channels': 2,
        }
      ];
      final index = computeEffectiveAudioIndex(
        audioStreams: onlyAd,
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: false,
      );
      expect(index, 1);
    });

    test('preferAudioDescription = true ranks AD tracks higher', () {
      final index = computeEffectiveAudioIndex(
        audioStreams: adStreams,
        preferredAudioLanguage: 'eng',
        fallbackAudioLanguage: 'fre',
        preferDefaultAudioTrack: false,
        preferAudioDescription: true,
      );
      expect(index, 1);
    });
  });
}
