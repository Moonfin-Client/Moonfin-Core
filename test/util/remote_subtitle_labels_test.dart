import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/util/remote_subtitle_labels.dart';

void main() {
  final l10n = AppLocalizationsEn();

  group('remoteSubtitleDetails', () {
    test('keeps the flags out of the detail line', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'eng',
        'AiTranslated': true,
        'ProviderName': 'Open Subtitles',
        'Format': 'srt',
      }, l10n);

      expect(details, 'ENG | Open Subtitles | SRT');
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

    test('keeps the flags out of the detail line', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'eng',
        'AiTranslated': true,
        'ProviderName': 'Open Subtitles',
        'Format': 'srt',
      }, l10n);

      expect(details, 'ENG | Open Subtitles | SRT');
    });

    test('falls back to the Language key when Emby sends that instead', () {
      expect(
        remoteSubtitleDetails(<String, dynamic>{'Language': 'ger'}, l10n),
        'GER',
      );
    });

    test('keeps rating and downloads', () {
      final details = remoteSubtitleDetails(<String, dynamic>{
        'CommunityRating': 8.5,
        'DownloadCount': 3421,
      }, l10n);

      expect(details, '8.5★ | 3421 downloads');
    });
  });

  group('remoteSubtitleFlags', () {
    test('returns every flag the provider set, in reading order', () {
      final flags = remoteSubtitleFlags(<String, dynamic>{
        'AiTranslated': true,
        'MachineTranslated': true,
        'HearingImpaired': true,
        'Forced': true,
        'IsHashMatch': true,
      }, l10n);

      expect(flags, <String>[
        'AI Translated',
        'Machine Translated',
        'SDH',
        'Forced',
        'Perfect match',
      ]);
    });

    test('leaves out flags that are absent or false', () {
      final flags = remoteSubtitleFlags(<String, dynamic>{
        'AiTranslated': false,
        'Forced': null,
        'HearingImpaired': true,
      }, l10n);

      expect(flags, <String>['SDH']);
    });

    test('is empty when the provider set nothing', () {
      expect(
        remoteSubtitleFlags(<String, dynamic>{'Format': 'srt'}, l10n),
        isEmpty,
      );
    });
  });

  group('remoteSubtitleSummary', () {
    test('runs the flags back in for a text-only surface', () {
      final summary = remoteSubtitleSummary(<String, dynamic>{
        'ThreeLetterISOLanguageName': 'eng',
        'AiTranslated': true,
        'Format': 'srt',
      }, l10n);

      expect(summary, 'AI Translated | ENG | SRT');
    });

    test('is just the detail line when there are no flags', () {
      expect(
        remoteSubtitleSummary(<String, dynamic>{'Format': 'srt'}, l10n),
        'SRT',
      );
    });

    test('is just the flags when there is no detail', () {
      expect(
        remoteSubtitleSummary(<String, dynamic>{'Forced': true}, l10n),
        'Forced',
      );
    });
  });
}
