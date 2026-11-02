import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/detail_reviews.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';

// No avatar, so the card loads nothing over the network.
final TmdbReview _review = (
  author: 'Brett Pascoe',
  rating: 8.5,
  content: 'In my **top 5** of all time.\n\n${'A long middle. ' * 200}The end.',
  createdAt: DateTime.utc(2021, 6, 23),
  avatarUrl: null,
  url: 'https://www.themoviedb.org/review/a',
);

Future<void> _pumpCard(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Center(child: ReviewCard(review: _review)),
      ),
    ),
  );
}

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));
  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  testWidgets('a card shows who wrote it, their score and the start', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await _pumpCard(tester);

    expect(find.text('Brett Pascoe'), findsOneWidget);
    expect(find.textContaining('8.5 / 10'), findsOneWidget);
    expect(find.textContaining('In my top 5 of all time.'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('opening a card shows the whole review and the TMDB link', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await _pumpCard(tester);

    await tester.tap(find.byType(ReviewCard));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(Dialog),
        matching: find.textContaining('The end.', findRichText: true),
      ),
      findsOneWidget,
    );
    expect(find.text('Read on TMDB'), findsOneWidget);
  });

  testWidgets('a TV pages through a long review and has no TMDB link', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await _pumpCard(tester);

    await tester.tap(find.byType(ReviewCard));
    await tester.pumpAndSettle();
    expect(find.text('Read on TMDB'), findsNothing);

    final scroll = tester.widget<SingleChildScrollView>(
      find.descendant(
        of: find.byType(Dialog),
        matching: find.byType(SingleChildScrollView),
      ),
    );
    final before = scroll.controller!.offset;
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(scroll.controller!.offset, greaterThan(before));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();
    expect(scroll.controller!.offset, before);
  });
}
