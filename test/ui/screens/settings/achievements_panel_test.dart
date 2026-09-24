import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:moonfin/data/services/achievements_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/settings/achievements_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

import '../../../support/achievement_plugin_fake.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AchievementPluginAdapter adapter;

  /// Belongs in setUp rather than a test body. A widget test body runs against
  /// fake time, where the request timers these calls arm never fire.
  Future<void> arrange({
    bool leaderboardEnabled = true,
    bool forcePrivacyMode = false,
    int equippedCount = 1,
  }) async {
    adapter = AchievementPluginAdapter()
      ..leaderboardEnabled = leaderboardEnabled
      ..forcePrivacyMode = forcePrivacyMode
      ..equippedCount = equippedCount;
    final dio = Dio()..httpClientAdapter = adapter;
    final service = AchievementsService(dio: dio);
    final client = buildAchievementClient();

    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<AchievementsService>(service);
    await service.refreshAvailability(client);
  }

  Future<void> pumpPanel(WidgetTester tester, {double textScale = 1.0}) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(textScale)),
            child: const AchievementsScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// The row sits below the fold at test window size.
  Future<void> openAppearance(WidgetTester tester) async {
    await tester.ensureVisible(find.text('Appearance'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
  }

  tearDown(() async {
    await GetIt.instance.reset();
  });

  group('with every section on', () {
    setUp(arrange);

    testWidgets('shows the rank, score and what the sections hold', (
      tester,
    ) async {
      await pumpPanel(tester);

      expect(find.text('Viewer'), findsOneWidget);
      expect(find.text('430 points'), findsOneWidget);
      // 430 of 700 towards Regular.
      expect(find.text('270 points to Regular'), findsOneWidget);
      expect(find.text('12 of 200 badges'), findsWidgets);
      expect(find.text('Badges'), findsOneWidget);
      expect(find.text('Leaderboard'), findsOneWidget);
      expect(find.text('Recap'), findsOneWidget);
      expect(find.text('2 libraries'), findsOneWidget);
    });

    testWidgets('a masked secret badge isn\'t spoiled in the list', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Badges'));
      await tester.pumpAndSettle();

      // Categories start closed, so the badge isn't on screen yet.
      expect(find.text('Hidden achievement'), findsNothing);

      await tester.tap(find.text('Hidden'));
      await tester.pumpAndSettle();

      // The plugin masks the title as "???" and the panel names it instead.
      expect(find.text('???'), findsNothing);
      expect(find.text('Hidden achievement'), findsOneWidget);
    });

    testWidgets('a badge opens what to watch for it', (tester) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Badges'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Binge'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Binge Titan'));
      await tester.pumpAndSettle();

      expect(find.text('Suggested items to watch'), findsOneWidget);
      expect(find.text('Trolls Band Together'), findsOneWidget);
      expect(find.text('Movie \u00b7 2023 \u00b7 91 min'), findsOneWidget);
      expect(find.text('Episode \u00b7 2026 \u00b7 24 min'), findsOneWidget);
    });

    testWidgets('the filter tabs narrow the list', (tester) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Badges'));
      await tester.pumpAndSettle();

      expect(find.text('Getting Started'), findsOneWidget);
      expect(find.text('Hidden'), findsOneWidget);

      await tester.tap(find.text('Locked'));
      await tester.pumpAndSettle();

      // The only unlocked badge takes its category off the list with it.
      expect(find.text('Getting Started'), findsNothing);
      expect(find.text('Hidden'), findsOneWidget);
    });

    testWidgets('rerolling swaps the daily set once confirmed', (tester) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Quests'));
      await tester.pumpAndSettle();

      expect(find.text('Watch something'), findsOneWidget);

      await tester.tap(find.text('Reroll daily quests'));
      await tester.pumpAndSettle();

      // A reroll is spent for the day, so it asks first.
      expect(find.text('Reroll these quests?'), findsOneWidget);
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(find.text('A fresh day'), findsOneWidget);
      expect(find.text('Watch something'), findsNothing);
      expect(
        find.text('Used today, comes back at midnight UTC'),
        findsOneWidget,
      );
    });

    testWidgets('backing out of the confirm leaves the set alone', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Quests'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Reroll daily quests'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Watch something'), findsOneWidget);
      expect(find.text('Swap this set for a different one'), findsOneWidget);
    });

    testWidgets('a reroll the server already spent reads as used', (
      tester,
    ) async {
      adapter.dailyRerollsLeft = 0;

      await pumpPanel(tester);
      await tester.tap(find.text('Quests'));
      await tester.pumpAndSettle();

      expect(
        find.text('Used today, comes back at midnight UTC'),
        findsOneWidget,
      );
      expect(find.text('Swap this set for a different one'), findsNothing);

      // A spent row still has to say when it comes back, so its title cannot
      // be faded to the disabled alpha.
      final title = DefaultTextStyle.of(
        tester.element(find.text('Reroll daily quests')),
      ).style.color;
      expect(title?.a, 1.0);
    });

    testWidgets('the loadout spends a power-up once confirmed', (tester) async {
      await pumpPanel(tester);
      // The row sits below the fold at test window size.
      await tester.ensureVisible(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loadout'));
      await tester.pumpAndSettle();

      expect(find.text('1240 points'), findsOneWidget);
      expect(find.text('2 held'), findsOneWidget);
      // The empty slot proves the disabled state.
      expect(find.text('None held'), findsOneWidget);

      await tester.tap(find.text('XP Boost'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(
        find.text('1 held \u00b7 Running now'),
        findsOneWidget,
      );
    });

    testWidgets('a power-up you cannot use is still drawn readably', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loadout'));
      await tester.pumpAndSettle();

      Color? titleColour(String name) => DefaultTextStyle.of(
        tester.element(find.text(name)),
      ).style.color;

      // The row still takes focus, so a greyed title would be unreadable once
      // the tile inverts onto its light ground.
      expect(titleColour('Double Credit'), titleColour('XP Boost'));
    });

    testWidgets('an empty slot cannot be spent', (tester) async {
      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loadout'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Double Credit'));
      await tester.pumpAndSettle();

      // Disabled, so nothing was asked and nothing was spent.
      expect(find.text('Use this power-up?'), findsNothing);
      expect(find.text('None held'), findsOneWidget);
    });

    testWidgets('stats group the counters and show the server', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Stats'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Stats'));
      await tester.pumpAndSettle();

      expect(find.text('Best watch streak'), findsOneWidget);
      expect(find.text('21'), findsOneWidget);
      expect(find.text('201 min'), findsOneWidget);

      // The server figures sit at the foot of a long list.
      await tester.dragUntilVisible(
        find.text('This server'),
        find.byType(ListView).last,
        const Offset(0, -240),
      );
      await tester.pumpAndSettle();
      expect(find.text('First Contact'), findsOneWidget);
    });

    testWidgets('the activity feed says who unlocked what and when', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Activity'));
      await tester.pumpAndSettle();

      expect(find.text('Ada unlocked First Contact'), findsOneWidget);
      expect(find.text('2h ago'), findsOneWidget);
      expect(find.text('Grace unlocked Binge Titan'), findsOneWidget);
      expect(find.text('3d ago'), findsOneWidget);
    });

    testWidgets('the shop sells a pack and spends the bank', (tester) async {
      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loadout'));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Shop'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Shop'));
      await tester.pumpAndSettle();

      // A pack says how many it grants, a single just names the boost.
      expect(find.text('XP Boost \u00d73'), findsOneWidget);
      expect(find.text('130 points'), findsOneWidget);
      expect(find.text('1240 points'), findsOneWidget);

      await tester.tap(find.text('XP Boost \u00d73'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(find.text('1110 points'), findsOneWidget);
    });

    testWidgets('an item the bank cannot cover is not sold', (tester) async {
      adapter.scoreBank = 10;

      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Loadout'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Shop'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Shop'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('XP Boost \u00d73'));
      await tester.pumpAndSettle();

      // Nothing was asked, so nothing was spent.
      expect(find.text('Buy this?'), findsNothing);
      expect(find.text('10 points'), findsOneWidget);
    });

    testWidgets('a worn title stands in for the rank name', (tester) async {
      adapter.ownedCosmetics.add('title-cinephile');
      adapter.equippedTitleId = 'title-cinephile';

      await pumpPanel(tester);

      expect(find.text('Cinephile'), findsOneWidget);
      expect(find.text('Viewer'), findsNothing);
    });

    testWidgets('appearance offers only what can be drawn here', (
      tester,
    ) async {
      await pumpPanel(tester);
      await openAppearance(tester);

      expect(find.text('Medal'), findsOneWidget);
      expect(find.text('Night Owl'), findsOneWidget);
      expect(find.text('Diamond'), findsOneWidget);
      // A profile theme is a stylesheet rule, so it is never offered.
      expect(find.text('Sunset'), findsNothing);
    });

    testWidgets('wearing one the profile owns puts it on', (tester) async {
      await pumpPanel(tester);
      await openAppearance(tester);

      expect(find.text('Owned'), findsOneWidget);

      await tester.tap(find.text('Medal'));
      await tester.pumpAndSettle();

      expect(find.text('Equipped'), findsOneWidget);
      expect(adapter.equippedAvatarId, 'avatar-medal');
    });

    testWidgets('taking one off leaves the slot empty', (tester) async {
      adapter.equippedAvatarId = 'avatar-medal';

      await pumpPanel(tester);
      await openAppearance(tester);

      await tester.tap(find.text('Medal'));
      await tester.pumpAndSettle();

      expect(find.text('Owned'), findsOneWidget);
      expect(adapter.equippedAvatarId, isEmpty);
    });

    testWidgets('one that has to be earned shows what it takes', (
      tester,
    ) async {
      await pumpPanel(tester);
      await openAppearance(tester);
      await tester.tap(find.text('Titles'));
      await tester.pumpAndSettle();

      expect(find.text('Earned at 1000 lifetime score'), findsOneWidget);

      await tester.tap(find.text('Cinephile'));
      await tester.pumpAndSettle();

      // It isn't for sale at any bank, so nothing was ever offered.
      expect(find.text('Buy this?'), findsNothing);
    });

    testWidgets('buying one the bank covers adds it to the wardrobe', (
      tester,
    ) async {
      await pumpPanel(tester);
      await openAppearance(tester);

      await tester.tap(find.text('Night Owl'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(find.text('990 points'), findsOneWidget);
      expect(adapter.ownedCosmetics, contains('avatar-owl'));
    });

    testWidgets('an avatar the bank cannot cover is not sold', (tester) async {
      await pumpPanel(tester);
      await openAppearance(tester);

      await tester.tap(find.text('Diamond'));
      await tester.pumpAndSettle();

      expect(find.text('Buy this?'), findsNothing);
      expect(adapter.ownedCosmetics, isNot(contains('avatar-diamond')));
    });

    testWidgets('an icon the catalogue reuses is swapped for a closer one', (
      tester,
    ) async {
      await pumpPanel(tester);
      await openAppearance(tester);

      // The catalogue hands a clapperboard the same film strip it gives
      // popcorn, so the panel draws the clapperboard Material has instead.
      expect(find.byIcon(Icons.movie_creation), findsOneWidget);
      expect(find.byIcon(Icons.local_movies), findsNothing);

      // An owl only exists in Material Symbols, so this one resolves
      // through a different font to the rest.
      expect(find.byIcon(Symbols.owl), findsOneWidget);
      expect(find.byIcon(Icons.nights_stay), findsNothing);
    });

    testWidgets('a plugin that stops answering offers a retry', (tester) async {
      adapter.pluginMissing = true;

      await pumpPanel(tester);

      expect(find.text('Could not load your achievements.'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });

  group('on a television', () {
    setUp(() async {
      await arrange();
      PlatformDetection.setTvMode(true);
    });

    tearDown(() => PlatformDetection.setTvMode(false));

    testWidgets('select opens the focused row', (tester) async {
      await pumpPanel(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();

      // The badge list is open, so the first row took focus and activated.
      expect(find.text('Getting Started'), findsOneWidget);
    });

    testWidgets('a focused row darkens its text for the light ground', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Badges'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Binge'));
      await tester.pumpAndSettle();

      Color? countColor() =>
          tester.widget<Text>(find.text('4 / 10')).style?.color;

      final resting = countColor();
      expect(resting, isNotNull);

      for (var i = 0; i < 10; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();
        final focused = countColor();
        if (focused != null && focused != resting) {
          expect(
            focused.computeLuminance(),
            lessThan(resting!.computeLuminance()),
          );
          return;
        }
      }
      fail('the badge row never adapted its text to the focus highlight');
    });

    testWidgets('badge rows take focus so the remote can scroll', (
      tester,
    ) async {
      await pumpPanel(tester);
      await tester.tap(find.text('Badges'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Hidden'));
      await tester.pumpAndSettle();

      for (var i = 0; i < 10; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();
        if (FocusManager.instance.primaryFocus?.debugLabel ==
            'AchievementsRow') {
          return;
        }
      }
      fail("no badge row ever took focus, so a remote can't reach the list");
    });
  });

  group('with privacy mode on', () {
    setUp(() => arrange(forcePrivacyMode: true));

    testWidgets('privacy mode drops the server figures', (tester) async {
      await pumpPanel(tester);
      await tester.ensureVisible(find.text('Stats'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Stats'));
      await tester.pumpAndSettle();

      expect(find.text('Best watch streak'), findsOneWidget);

      // Scrolled to the end, so an absent heading means it was never built.
      await tester.drag(find.byType(ListView).last, const Offset(0, -2000));
      await tester.pumpAndSettle();
      expect(find.text('This server'), findsNothing);
      expect(find.text('Languages watched'), findsOneWidget);
    });

  });

  group('with the leaderboard switched off', () {
    setUp(() => arrange(leaderboardEnabled: false));

    testWidgets('a section the admin switched off isn\'t offered', (
      tester,
    ) async {
      await pumpPanel(tester);

      expect(find.text('Leaderboard'), findsNothing);
      expect(find.text('Badges'), findsOneWidget);
    });
  });

  group('the pinned badge showcase', () {
    /// The titles of a full showcase, in the order the plugin returns them.
    final pinnedTitles = [
      for (var i = 0; i < 4; i++) 'Pinned badge $i',
      'First Contact',
    ];

    Future<void> pumpAt(
      WidgetTester tester,
      double width, {
      double textScale = 1.0,
    }) async {
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize = Size(width, 900);
      addTearDown(tester.view.reset);
      await pumpPanel(tester, textScale: textScale);
    }

    /// Where each pinned badge's title landed, in screen coordinates.
    List<Rect> titleRects(WidgetTester tester) => [
      for (final title in pinnedTitles) tester.getRect(find.text(title)),
    ];

    group('with five pinned', () {
      setUp(() => arrange(equippedCount: 5));

      testWidgets('puts all five on screen at once', (tester) async {
        // Five tiles at the designed width want 500 points, so a narrower
        // screen has to size them down to show the lot.
        await pumpAt(tester, 480);

        final rects = titleRects(tester);
        expect(rects, hasLength(5));
        for (var i = 0; i < rects.length; i++) {
          expect(rects[i].left, greaterThanOrEqualTo(0));
          expect(
            rects[i].right,
            lessThanOrEqualTo(480),
            reason: '${pinnedTitles[i]} ran off the side',
          );
        }
      });

      testWidgets('lays them out in order and never overlapping', (
        tester,
      ) async {
        await pumpAt(tester, 480);

        final rects = titleRects(tester);
        for (var i = 1; i < rects.length; i++) {
          expect(rects[i].left, greaterThanOrEqualTo(rects[i - 1].right));
        }
      });

      testWidgets('keeps them on screen at every text scale', (tester) async {
        // The strip takes its height from the tallest title rather than a
        // number worked out in advance, so a larger scale lengthens it.
        for (final scale in [1.0, 1.15, 1.3]) {
          await pumpAt(tester, 480, textScale: scale);
          expect(
            titleRects(tester),
            hasLength(5),
            reason: 'at text scale $scale',
          );
          expect(tester.takeException(), isNull, reason: 'at scale $scale');
        }
      });

      testWidgets('scrolls rather than shrinking past readable', (
        tester,
      ) async {
        // The tile has a floor, under which two lines of a title have
        // nowhere to go. Past it the strip scrolls, so the badges are still
        // reachable rather than unreadable.
        await pumpAt(tester, 300);

        expect(
          find.descendant(
            of: find.byType(SingleChildScrollView),
            matching: find.text('First Contact'),
          ),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      });
    });

    group('with one pinned', () {
      setUp(() => arrange());

      testWidgets('leaves a short showcase at its designed size', (
        tester,
      ) async {
        // Room to spare isn't a reason to blow one badge up to fill it.
        await pumpAt(tester, 1324);

        final tile = tester.getRect(
          find
              .ancestor(
                of: find.text('First Contact'),
                matching: find.byType(SizedBox),
              )
              .first,
        );
        expect(tile.width, 84);
      });
    });
  });
}
