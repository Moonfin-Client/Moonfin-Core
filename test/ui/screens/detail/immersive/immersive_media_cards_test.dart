import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/detail/immersive/shared/immersive_landscape_media_card.dart';
import 'package:moonfin/ui/screens/detail/immersive/shared/immersive_media_rail_card.dart';
import 'package:moonfin/ui/screens/detail/immersive/shared/immersive_poster_card.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('poster supports tap, long press, subtitle, overlay and status', (
    tester,
  ) async {
    var taps = 0;
    var longPresses = 0;
    await tester.pumpWidget(
      _TestApp(
        child: ImmersivePosterCard(
          imageUrl: null,
          title: 'Film',
          subtitle: '2026',
          width: 180,
          height: 260,
          isFocused: false,
          isFavorite: true,
          isPlayed: true,
          topRightOverlay: const Text('Overlay'),
          onTap: () => taps++,
          onLongPress: () => longPresses++,
        ),
      ),
    );
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(tester.getCenter(find.byType(ImmersivePosterCard)));
    await tester.pumpAndSettle();
    expect(find.text('Film'), findsOneWidget);
    expect(find.text('2026'), findsOneWidget);
    expect(find.text('Overlay'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    await tester.tap(find.byType(ImmersivePosterCard));
    await tester.longPress(find.byType(ImmersivePosterCard));
    expect(taps, 1);
    expect(longPresses, 1);
  });

  testWidgets(
    'poster null artwork falls back and only finite partial progress shows',
    (tester) async {
      for (final progress in [0.0, 1.0, double.nan, double.infinity, 0.5]) {
        await tester.pumpWidget(
          _TestApp(
            child: ImmersivePosterCard(
              imageUrl: null,
              title: 'Fallback',
              width: 160,
              height: 230,
              isFocused: false,
              progress: progress,
              placeholderIcon: Icons.movie,
              onTap: () {},
            ),
          ),
        );
        expect(find.byIcon(Icons.movie), findsOneWidget);
        expect(
          find.byType(LinearProgressIndicator),
          progress == 0.5 ? findsOneWidget : findsNothing,
        );
      }
    },
  );

  testWidgets(
    'rail card exposes fallback, subtitle, status and bounded progress',
    (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: ImmersiveMediaRailCard(
            imageUrl: null,
            title: 'Rail title',
            subtitle: 'Subtitle',
            placeholderLabel: 'No art',
            width: 220,
            artworkHeight: 124,
            isFocused: false,
            isFavorite: true,
            isPlayed: false,
            progress: 0.25,
            onTap: () {},
          ),
        ),
      );
      expect(find.text('NO ART'), findsOneWidget);
      expect(find.text('Rail title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    },
  );

  testWidgets('landscape card handles artwork actions and null artwork', (
    tester,
  ) async {
    var selected = 0;
    var contextual = 0;
    final item = const AggregatedItem(
      id: 'item',
      serverId: 'server',
      rawData: {
        'Name': 'Episode',
        'Type': 'Episode',
        'IndexNumber': 2,
        'ParentIndexNumber': 1,
        'UserData': {'IsFavorite': true, 'Played': true},
      },
    );
    await tester.pumpWidget(
      _TestApp(
        child: ImmersiveLandscapeMediaCard(
          item: item,
          imageUrl: null,
          width: 240,
          imageHeight: 135,
          isFocused: false,
          isNextUp: false,
          suppressArtworkFocus: false,
          compactLayout: true,
          onArtworkSelect: () => selected++,
          onContextAction: () => contextual++,
        ),
      ),
    );
    expect(find.byIcon(Icons.movie_outlined), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    await tester.tap(find.byType(ImmersiveLandscapeMediaCard));
    await tester.longPress(find.byType(ImmersiveLandscapeMediaCard));
    expect(selected, 1);
    expect(contextual, 1);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: Center(child: child)),
    );
  }
}
