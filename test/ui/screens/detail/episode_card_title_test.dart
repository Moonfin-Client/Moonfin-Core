// This card carries no number badge of its own, so whatever comes back here is
// the only place the episode number shows.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

void main() {
  late BuildContext ctx;

  Future<void> pump(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  testWidgets('a title keeps its number and loses the word', (tester) async {
    await pump(tester);

    expect(
      episodeCardTitle(ctx, 'The Winter Soldier', 1),
      'E1: The Winter Soldier',
    );
    expect(episodeCardTitle(ctx, 'Pilot', 12), 'E12: Pilot');
  });

  testWidgets('an episode with no number is just its title', (tester) async {
    await pump(tester);

    expect(episodeCardTitle(ctx, 'Special', null), 'Special');
  });

  testWidgets('a card with no title of its own still reads', (tester) async {
    await pump(tester);

    final title = episodeCardTitle(ctx, '', 5);
    expect(title, contains('5'));
    // A bare E5 says nothing on a card with nothing beside it.
    expect(title, isNot('E5'));
  });

  testWidgets('nothing at all gives an empty title', (tester) async {
    await pump(tester);

    expect(episodeCardTitle(ctx, '', null), '');
  });
}
