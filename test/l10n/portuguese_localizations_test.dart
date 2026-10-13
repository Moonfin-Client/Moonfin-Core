import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/util/media_segment_localizer.dart';
import 'package:moonfin/util/interface_locale.dart';

void main() {
  test('new author key preserves the existing message in other languages', () {
    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'pt' || locale == const Locale('en')) continue;
      final l10n = lookupAppLocalizations(locale);
      expect(l10n.noBooksFoundForAuthor, l10n.noBooksFound, reason: '$locale');
    }
  });
  for (final locale in [const Locale('pt'), const Locale('pt', 'PT')]) {
    testWidgets('$locale renders European Portuguese', (tester) async {
      await tester.pumpWidget(_probe(locale));
      await tester.pumpAndSettle();
      expect(find.text('Iniciar sessão'), findsOneWidget);
      expect(find.text('Palavra-passe'), findsOneWidget);
      expect(find.text('Saltar introdução'), findsOneWidget);
      expect(find.text('Faixa de áudio'), findsOneWidget);
    });
  }
  testWidgets('Brazil has independent sign-in and password labels', (
    tester,
  ) async {
    await tester.pumpWidget(_probe(const Locale('pt', 'BR')));
    await tester.pumpAndSettle();
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Palavra-passe'), findsNothing);
  });
  test('segment labels never change canonical server identifiers', () {
    final l10n = lookupAppLocalizations(const Locale('pt', 'PT'));
    expect(
      localizedMediaSegmentName(MediaSegmentType.intro, l10n),
      'introdução',
    );
    expect(MediaSegmentType.intro.displayName, 'Intro');
    expect(MediaSegmentType.fromServerString('Intro'), MediaSegmentType.intro);
    expect(
      l10n.settingsMediaSegmentTypeAction('introdução'),
      'Segmentos: introdução',
    );
  });
  test('Brazilian placeholders and plurals retain supplied values', () {
    final l10n = lookupAppLocalizations(const Locale('pt', 'BR'));
    expect(l10n.personalRatingOutOfTen('7'), '7 / 10');
    expect(l10n.friendsWatching('Example'), 'Assistindo a Example');
    expect(l10n.achievementsUnlockedCount(2), '2 conquistas desbloqueadas');
  });
}

Widget _probe(Locale locale) => MaterialApp(
  locale: locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  localeResolutionCallback: resolveInterfaceLocale,
  home: Builder(
    builder: (context) {
      final l10n = AppLocalizations.of(context);
      return Scaffold(
        body: Column(
          children: [
            Text(l10n.signIn),
            Text(l10n.password),
            Text(
              l10n.skipSegment(
                localizedMediaSegmentName(MediaSegmentType.intro, l10n),
              ),
            ),
            Text(l10n.settingsAudioStreamSection),
          ],
        ),
      );
    },
  ),
);
