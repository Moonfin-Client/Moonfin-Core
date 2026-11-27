import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/appletv_track_options.dart';

void main() {
  group('appleTvTrackOptions', () {
    final subtitles = [
      {
        'Index': 3,
        'DisplayTitle': 'English - SUBRIP - External',
        'Language': 'eng',
        'Codec': 'subrip',
        'IsExternal': true,
      },
      {
        'Index': 4,
        'DisplayTitle': 'French Forced',
        'Language': 'fre',
        'Codec': 'pgssub',
        'IsForced': true,
      },
      {'Index': 5, 'Title': 'Commentary SDH', 'IsHearingImpaired': true},
    ];

    test('subtitle entries carry language, forced and SDH', () {
      final options = appleTvTrackOptions(subtitles, 4, audio: false);

      expect(options, [
        {
          'index': 3,
          'label': 'English - SUBRIP - External',
          'subtitle': 'SUBRIP · External',
          'selected': false,
          'language': 'eng',
          'forced': false,
          'hearingImpaired': false,
        },
        {
          'index': 4,
          'label': 'French Forced',
          'subtitle': 'PGSSUB · Internal',
          'selected': true,
          'language': 'fre',
          'forced': true,
          'hearingImpaired': false,
        },
        {
          'index': 5,
          'label': 'Commentary SDH',
          'subtitle': 'UNKNOWN · Internal',
          'selected': false,
          'forced': false,
          'hearingImpaired': true,
        },
      ]);
    });

    test('audio entries keep their existing shape', () {
      final options = appleTvTrackOptions(
        [
          {
            'Index': 1,
            'DisplayTitle': 'English 5.1',
            'Language': 'eng',
            'Codec': 'eac3',
            'Channels': 6,
          },
        ],
        1,
        audio: true,
      );

      expect(options, [
        {
          'index': 1,
          'label': 'English 5.1',
          'subtitle': 'eng · EAC3 · 6ch',
          'selected': true,
        },
      ]);
    });
  });
}
