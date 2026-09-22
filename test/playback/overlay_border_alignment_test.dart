import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/next_up_overlay.dart';
import 'package:moonfin/ui/widgets/playback/skip_segment_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const segment = MediaSegment(
    id: 'seg-1',
    itemId: 'item-1',
    type: MediaSegmentType.intro,
    start: Duration(seconds: 10),
    end: Duration(seconds: 130),
  );

  const nextItem = AggregatedItem(
    id: 'next-1',
    serverId: 'server-1',
    rawData: {'Name': 'Next Episode', 'SeriesId': 'series-1'},
  );

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    await GetIt.instance.reset();
  });

  Future<void> pumpNextUp(WidgetTester tester, FocusNode focusNode) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            NextUpOverlay(
              nextItem: nextItem,
              timeoutMs: 15000,
              onPlayNext: () {},
              onDismiss: () {},
              focusNode: focusNode,
            ),
          ],
        ),
      ),
    );
    await tester.pump();
  }

  Container nextUpCard(WidgetTester tester) => tester.widget<Container>(
    find
        .descendant(
          of: find.byType(NextUpOverlay),
          matching: find.byType(Container),
        )
        .first,
  );

  testWidgets('SkipSegmentOverlay aligns focus border in Moonfin theme', (
    tester,
  ) async {
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            SkipSegmentOverlay(
              segment: segment,
              onSkip: () {},
              onDismiss: () {},
            ),
          ],
        ),
      ),
    );
    await tester.pump();

    final containers = tester.widgetList<Container>(
      find.descendant(
        of: find.byType(SkipSegmentOverlay),
        matching: find.byType(Container),
      ),
    );

    final overlayContainer = containers.firstWhere(
      (c) =>
          c.decoration is BoxDecoration &&
          (c.decoration as BoxDecoration).border != null,
    );

    final boxDecoration = overlayContainer.decoration as BoxDecoration;
    expect(boxDecoration.borderRadius, BorderRadius.circular(28));
    expect(boxDecoration.border, isNotNull);
  });

  testWidgets(
    'SkipSegmentOverlay collapses border radius to 0 in 8-bit hero theme',
    (tester) async {
      ThemeRegistry.setActiveById(ThemeRegistry.eightbitHeroId);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Stack(
            children: [
              SkipSegmentOverlay(
                segment: segment,
                onSkip: () {},
                onDismiss: () {},
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      final positionedContainers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(SkipSegmentOverlay),
          matching: find.byType(Container),
        ),
      );

      final overlayContainer = positionedContainers.firstWhere(
        (c) =>
            c.decoration is BoxDecoration &&
            (c.decoration as BoxDecoration).border != null,
      );

      final boxDecoration = overlayContainer.decoration as BoxDecoration;
      expect(
        boxDecoration.borderRadius,
        BorderRadius.zero,
        reason: 'Retro pixel theme must collapse capsule radius to 0',
      );
    },
  );

  testWidgets(
    'NextUpOverlay adapts card border and button focus across themes',
    (tester) async {
      PlatformDetection.setTvMode(true);
      ThemeRegistry.setActiveById(ThemeRegistry.eightbitHeroId);

      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await pumpNextUp(tester, focusNode);

      final cardDeco = nextUpCard(tester).decoration as BoxDecoration;
      expect(cardDeco.borderRadius, BorderRadius.zero);

      focusNode.requestFocus();
      await tester.pump();

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final side = button.style?.side?.resolve({WidgetState.focused});
      expect(side?.color, ThemeRegistry.active.borders.focusBorder.color);
    },
  );

  testWidgets('NextUpOverlay clips its card to the rounded corners', (
    tester,
  ) async {
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);

    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await pumpNextUp(tester, focusNode);

    // The glass only clips on the tiers Glass and Apple resolve to, so on
    // every other theme the card is what keeps the thumbnail off the corners.
    expect(nextUpCard(tester).clipBehavior, isNot(Clip.none));
  });
}
