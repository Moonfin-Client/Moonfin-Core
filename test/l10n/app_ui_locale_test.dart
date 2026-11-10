import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_zh.dart';
import 'package:moonfin/l10n/current_app_localizations.dart';

const _hans = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
const _hant = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');

void main() {
  group('resolveAppUiLocale', () {
    test('gives Simplified Chinese its script', () {
      expect(resolveAppUiLocale(const Locale('zh', 'CN')), _hans);
      expect(resolveAppUiLocale(const Locale('zh', 'SG')), _hans);
      expect(resolveAppUiLocale(const Locale('zh')), _hans);
      expect(
        resolveAppUiLocale(
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        ),
        _hans,
      );
    });

    test('treats Taiwan, Hong Kong and Macau as Traditional', () {
      expect(resolveAppUiLocale(const Locale('zh', 'TW')), _hant);
      expect(resolveAppUiLocale(const Locale('zh', 'HK')), _hant);
      expect(resolveAppUiLocale(const Locale('zh', 'MO')), _hant);
      expect(
        resolveAppUiLocale(
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
        ),
        _hant,
      );
    });

    test('leaves other languages as they were', () {
      expect(resolveAppUiLocale(const Locale('en', 'US')), const Locale('en'));
      expect(resolveAppUiLocale(const Locale('ja', 'JP')), const Locale('ja'));
      expect(resolveAppUiLocale(const Locale('yue', 'HK')), const Locale('yue', 'HK'));
      expect(resolveAppUiLocale(const Locale('pt', 'BR')), const Locale('pt', 'BR'));
      expect(resolveAppUiLocale(const Locale('is')), const Locale('en'));
      expect(resolveAppUiLocale(null), const Locale('en'));
    });

    test('keeps server language tags for Simplified Chinese unchanged', () {
      expect(currentAppLocale(const Locale('zh', 'CN')).toLanguageTag(), 'zh');
    });
  });

  for (final (name, picked, system) in [
    ('the language picker', const Locale('zh'), const Locale('en', 'US')),
    ('a zh-CN system', null, const Locale('zh', 'CN')),
  ]) {
    testWidgets('text gets zh-Hans for font fallback from $name', (tester) async {
      tester.platformDispatcher.localesTestValue = [system];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: picked,
          localeResolutionCallback: (locale, _) => resolveAppUiLocale(locale),
          home: const Scaffold(body: Text('空门迷影')),
        ),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.text('空门迷影'));
      expect(Localizations.localeOf(context), _hans);
      expect(AppLocalizations.of(context).runtimeType, AppLocalizationsZh);
      final paragraph = tester.renderObject<RenderParagraph>(find.text('空门迷影'));
      expect(paragraph.locale, _hans);
    });
  }
}
