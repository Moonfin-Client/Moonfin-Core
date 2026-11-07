import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MDBList Watching Now row height and card alignment', () {
    test('Watching Now reserves dedicated metadata allowance for row separation', () {
      const watchingNowRow = HomeRow(
        id: 'mdblist_watching_now',
        title: 'Watching on MDBList',
        rowType: HomeRowType.pluginDynamic,
      );
      const standardClassicRow = HomeRow(
        id: 'movies',
        title: 'Movies',
        rowType: HomeRowType.libraryTiles,
      );

      // Watching Now preserves a dedicated 24.0 metadata allowance to prevent overlap
      expect(HomeScreen.classicCardMetadataFor(watchingNowRow), 24.0);
      // Standard classic row preserves full 50.0 metadata room
      expect(HomeScreen.classicCardMetadataFor(standardClassicRow), 50.0);
    });

    testWidgets('MediaCard with cardFocusExpansion anchors AnimatedScale to bottomCenter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(
            body: MediaCard(
              title: 'Resident Evil',
              width: 200,
              aspectRatio: 16 / 9,
              showLabel: false,
              cardFocusExpansion: true,
            ),
          ),
        ),
      );

      final animatedScale = tester.widget<AnimatedScale>(find.byType(AnimatedScale));
      expect(
        animatedScale.alignment,
        Alignment.bottomCenter,
        reason: 'Focus expansion must anchor at bottomCenter so growth extends upward into headroom rather than downward into adjacent rows',
      );
    });
  });
}

