import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/anime_marker_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/media_badge.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

class _MockAnimeMarkerRepository extends Mock
    implements AnimeMarkerRepository {}

void main() {
  Widget testCard({
    required bool isFavorite,
    String? animeMarkerItemId,
    bool overlayOccupiesTopLeft = false,
  }) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: MediaCard(
        title: 'Test Movie',
        width: 150,
        aspectRatio: 2 / 3,
        itemType: 'Movie',
        isFavorite: isFavorite,
        animeMarkerItemId: animeMarkerItemId,
        overlayOccupiesTopLeft: overlayOccupiesTopLeft,
        onTap: () {},
      ),
    ),
  );

  testWidgets(
    'favorite badge sits at top 6 when animeMarkerItemId is present but has no audio badge',
    (tester) async {
      await tester.pumpWidget(
        testCard(
          isFavorite: true,
          animeMarkerItemId: 'item-123',
        ),
      );

      final cardFinder = find.byType(MediaCard);
      final badgeFinder = find.byType(MediaFavoriteBadge);

      expect(badgeFinder, findsOneWidget);

      final cardTopLeft = tester.getTopLeft(cardFinder);
      final badgeTopLeft = tester.getTopLeft(badgeFinder);

      // Relative offset from card top-left: 6px from top, 6px from left
      expect(badgeTopLeft.dx - cardTopLeft.dx, closeTo(6.0, 0.1));
      expect(badgeTopLeft.dy - cardTopLeft.dy, closeTo(6.0, 0.1));
    },
  );

  testWidgets(
    'favorite badge sits at top 6 when animeMarkerItemId is null',
    (tester) async {
      await tester.pumpWidget(
        testCard(
          isFavorite: true,
          animeMarkerItemId: null,
        ),
      );

      final cardFinder = find.byType(MediaCard);
      final badgeFinder = find.byType(MediaFavoriteBadge);

      expect(badgeFinder, findsOneWidget);

      final cardTopLeft = tester.getTopLeft(cardFinder);
      final badgeTopLeft = tester.getTopLeft(badgeFinder);

      expect(badgeTopLeft.dx - cardTopLeft.dx, closeTo(6.0, 0.1));
      expect(badgeTopLeft.dy - cardTopLeft.dy, closeTo(6.0, 0.1));
    },
  );

  testWidgets(
    'favorite badge sits at top 32 when overlayOccupiesTopLeft is explicitly true',
    (tester) async {
      await tester.pumpWidget(
        testCard(
          isFavorite: true,
          overlayOccupiesTopLeft: true,
        ),
      );

      final cardFinder = find.byType(MediaCard);
      final badgeFinder = find.byType(MediaFavoriteBadge);

      expect(badgeFinder, findsOneWidget);

      final cardTopLeft = tester.getTopLeft(cardFinder);
      final badgeTopLeft = tester.getTopLeft(badgeFinder);

      expect(badgeTopLeft.dx - cardTopLeft.dx, closeTo(6.0, 0.1));
      expect(badgeTopLeft.dy - cardTopLeft.dy, closeTo(32.0, 0.1));
    },
  );

  testWidgets(
    'favorite badge sits below anime audio badge when audio is resolved',
    (tester) async {
      final repository = _MockAnimeMarkerRepository();
      when(() => repository.isItemResolved('anime-1')).thenReturn(true);
      when(() => repository.peekItem('anime-1')).thenReturn(AnimeAudioKind.subbed);
      GetIt.instance.registerSingleton<AnimeMarkerRepository>(repository);
      addTearDown(() => GetIt.instance.reset());

      await tester.pumpWidget(
        testCard(
          isFavorite: true,
          animeMarkerItemId: 'anime-1',
        ),
      );

      final cardFinder = find.byType(MediaCard);
      final badgeFinder = find.byType(MediaFavoriteBadge);

      expect(badgeFinder, findsOneWidget);

      final cardTopLeft = tester.getTopLeft(cardFinder);
      final badgeTopLeft = tester.getTopLeft(badgeFinder);

      expect(badgeTopLeft.dx - cardTopLeft.dx, closeTo(6.0, 0.1));
      // Sits below the anime pill (which is ~18px + 4px padding + top: 6)
      expect(badgeTopLeft.dy - cardTopLeft.dy, greaterThan(22.0));
    },
  );
}
