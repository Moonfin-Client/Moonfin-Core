import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/util/remote_subtitle_labels.dart';

void main() {
  final l10n = AppLocalizationsEn();

  group('remoteSubtitleDetails', () {
    test('shows the AI translated flag the provider set', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'eng',
        'AiTranslated': true,
        'ProviderName': 'Open Subtitles',
        'Format': 'srt',
      }, l10n);

      expect(details, 'ENG | AI translated | Open Subtitles | SRT');
    });

    test('shows machine translated, SDH and forced flags', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'MachineTranslated': true,
        'HearingImpaired': true,
        'Forced': true,
      }, l10n);

      expect(details, 'Machine translated | SDH | Forced');
    });

    test('puts the flags before the provider bookkeeping', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'fre',
        'ProviderName': 'Open Subtitles',
        'DownloadCount': 12,
        'AiTranslated': true,
      }, l10n);

      expect(
        details.indexOf('AI translated'),
        lessThan(details.indexOf('Open Subtitles')),
      );
    });

    test('keeps a fractional framerate and trims a whole one', () {
      expect(
        remoteSubtitleDetails(<String, dynamic>{'FrameRate': 23.976}, l10n),
        '23.976 fps',
      );
      expect(
        remoteSubtitleDetails(<String, dynamic>{'FrameRate': 25.0}, l10n),
        '25 fps',
      );
    });

    test('leaves out a framerate the provider did not report', () {
      expect(
        remoteSubtitleDetails(<String, dynamic>{
          'FrameRate': 0,
          'Format': 'srt',
        }, l10n),
        'SRT',
      );
    });

    test('leaves out flags that are absent or false', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'eng',
        'AiTranslated': false,
        'Forced': null,
      }, l10n);

      expect(details, 'ENG');
    });

    test('falls back to the Language key when Emby sends that instead', () {
      expect(
        remoteSubtitleDetails(<String, dynamic>{'Language': 'ger'}, l10n),
        'GER',
      );
    });

    test('keeps rating, downloads and hash match', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'IsHashMatch': true,
        'CommunityRating': 8.5,
        'DownloadCount': 3421,
      }, l10n);

      expect(details, 'Perfect match | 8.5★ | 3421 downloads');
    });
  });
}
