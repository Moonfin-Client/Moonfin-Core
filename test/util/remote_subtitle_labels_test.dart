import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/remote_subtitle_labels.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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

  group('remoteSubtitleLanguage', () {
    late UserPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues(const <String, Object>{});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    });

    tearDown(() => GetIt.instance.unregister<UserPreferences>());

    test('the preference wins when it names a language', () async {
      await prefs.set(UserPreferences.defaultSubtitleLanguage, 'ger');

      expect(
        remoteSubtitleLanguage(
          [<String, dynamic>{'Language': 'fre'}],
          const [],
        ),
        'ger',
      );
    });

    test('auto and none are not languages to search for', () async {
      for (final sentinel in ['auto', 'None']) {
        await prefs.set(UserPreferences.defaultSubtitleLanguage, sentinel);

        expect(
          remoteSubtitleLanguage(
            [<String, dynamic>{'Language': 'fre'}],
            const [],
          ),
          'fre',
          reason: '$sentinel names a setting, not a language to search for',
        );
      }
    });

    test('falls back to what the item already carries', () async {
      await prefs.set(UserPreferences.defaultSubtitleLanguage, '');

      expect(
        remoteSubtitleLanguage(const [], [
          <String, dynamic>{'Language': 'jpn'},
        ]),
        'jpn',
      );
    });

    test('is English when nothing else says otherwise', () async {
      await prefs.set(UserPreferences.defaultSubtitleLanguage, '');

      expect(remoteSubtitleLanguage(const [], const []), 'eng');
    });
  });
}
