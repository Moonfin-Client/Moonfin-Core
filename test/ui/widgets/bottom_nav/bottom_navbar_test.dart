import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_mini_player.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_nav_indicator.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_nav_metrics.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_nav_theme.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_navbar.dart';
import 'package:moonfin/ui/widgets/bottom_nav/dock_bar.dart';
import 'package:moonfin/ui/widgets/bottom_nav/split_bar.dart';
import 'package:moonfin/ui/widgets/bottom_nav/strip_bar.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'bottom_nav_fakes.dart';

void main() {
  late UserPreferences prefs;
  late FakePlaybackManager playback;

  setUp(() async {
    final setup = await setUpBottomNav();
    prefs = setup.prefs;
    playback = setup.playback;
  });

  tearDown(tearDownBottomNav);

  group('heights', () {
    test('each style reports the room it takes', () {
      double h(BottomNavbarStyle s, double inset, bool music) =>
          BottomNavMetrics.heightFor(s, bottomInset: inset, miniPlayer: music);

      expect(h(BottomNavbarStyle.dock, 34, false), 64 + 34);
      expect(h(BottomNavbarStyle.dock, 0, false), 64 + 12);
      expect(h(BottomNavbarStyle.dock, 34, true), 64 + 34 + 58 + 8);
      expect(h(BottomNavbarStyle.split, 34, true), 62 + 34 + 58 + 8);
      expect(h(BottomNavbarStyle.strip, 34, false), 60 + 34);
      expect(h(BottomNavbarStyle.strip, 0, true), 60 + 56);
    });

    testWidgets('the content under the bar is told how much it covers',
        (tester) async {
      usePhoneView(tester);
      double? seen;
      await tester.pumpWidget(
        bottomNavApp(
          child: Builder(
            builder: (context) {
              seen = BottomNavInsetScope.maybeOf(context);
              return const SizedBox.expand();
            },
          ),
        ),
      );
      await tester.pump();
      expect(seen, 64 + 12);
    });

    testWidgets('the inset follows the style', (tester) async {
      usePhoneView(tester);
      double? seen;
      await tester.pumpWidget(
        bottomNavApp(
          child: Builder(
            builder: (context) {
              seen = BottomNavInsetScope.maybeOf(context);
              return const SizedBox.expand();
            },
          ),
        ),
      );
      await prefs.set(UserPreferences.bottomNavbarStyle,
          BottomNavbarStyle.strip);
      await tester.pump();
      expect(seen, 60);
    });
  });

  group('Dock', () {
    testWidgets('shows Home, the offered pins and You with labels',
        (tester) async {
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      expect(find.byType(DockBarView), findsOneWidget);
      // Libraries waits for a library to exist, the fake server has none.
      for (final label in ['Home', 'Search', 'Favorites', 'You']) {
        expect(find.text(label), findsOneWidget, reason: label);
      }
      expect(find.text('Libraries'), findsNothing);
    });

    testWidgets('the mini player floats above the tabs', (tester) async {
      usePhoneView(tester);
      playback.queueService.setQueue([testTrack]);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      final player = find.byType(BottomMiniPlayer);
      expect(player, findsOneWidget);
      expect(find.text('A Song'), findsOneWidget);
      expect(
        tester.getBottomLeft(player).dy,
        lessThan(tester.getTopLeft(find.text('Home')).dy),
      );
    });

    testWidgets('hidden chrome drops the tabs and keeps the player',
        (tester) async {
      usePhoneView(tester);
      playback.queueService.setQueue([testTrack]);
      await tester.pumpWidget(bottomNavApp(chrome: false));
      await tester.pumpAndSettle();

      expect(find.byType(BottomMiniPlayer), findsOneWidget);
      final opacity = tester.widget<AnimatedOpacity>(
        find
            .ancestor(
              of: find.text('Home'),
              matching: find.byType(AnimatedOpacity),
            )
            .first,
      );
      expect(opacity.opacity, 0);
    });

    testWidgets('You opens the hub with settings in it', (tester) async {
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      await tester.tap(find.text('You'));
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Shuffle'), findsOneWidget);
      expect(find.text('Genres'), findsOneWidget);
    });

    testWidgets('a new screen springs the indicator over from the last tab',
        (tester) async {
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp(activeRoute: '/home'));
      await tester.pump();

      // A different screen, so a different bar, like a tab being opened.
      await tester.pumpWidget(
        KeyedSubtree(
          key: const ValueKey('search'),
          child: bottomNavApp(activeRoute: '/search'),
        ),
      );
      BottomNavSlidingMarker marker() => tester.widget<BottomNavSlidingMarker>(
            find.byType(BottomNavSlidingMarker),
          );
      expect(marker().index, 0);

      await tester.pumpAndSettle();
      expect(marker().index, 1);
    });

    testWidgets('pinned tabs replace the automatic ones', (tester) async {
      usePhoneView(tester);
      await prefs.set(UserPreferences.bottomNavbarTabs, 'genres');
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      expect(find.text('Genres'), findsOneWidget);
      expect(find.text('Search'), findsNothing);
      expect(find.text('Favorites'), findsNothing);
    });

    testWidgets('fits a narrow phone with large text', (tester) async {
      usePhoneView(tester, size: const Size(320, 640));
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(320, 640),
            textScaler: TextScaler.linear(1.3),
          ),
          child: bottomNavApp(),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });

  group('Strip', () {
    setUp(() => prefs.set(
          UserPreferences.bottomNavbarStyle,
          BottomNavbarStyle.strip,
        ));

    testWidgets('runs edge to edge down to the bottom of the screen',
        (tester) async {
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      final strip = find.byType(StripBarView);
      expect(strip, findsOneWidget);
      expect(tester.getBottomLeft(strip).dy, 844);
      expect(tester.getSize(strip).width, 390);
    });

    testWidgets('docks the player above the tabs', (tester) async {
      usePhoneView(tester);
      playback.queueService.setQueue([testTrack]);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      final player = find.byType(BottomMiniPlayer);
      expect(player, findsOneWidget);
      expect(
        tester.getBottomLeft(player).dy,
        lessThanOrEqualTo(tester.getTopLeft(find.text('Home')).dy),
      );
      expect(tester.takeException(), isNull);
    });
  });

  group('Split', () {
    setUp(() => prefs.set(
          UserPreferences.bottomNavbarStyle,
          BottomNavbarStyle.split,
        ));

    testWidgets('gives Search its own button outside the tabs',
        (tester) async {
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      expect(find.byType(SplitBarView), findsOneWidget);
      expect(find.text('Search'), findsNothing);
      expect(find.byTooltip('Search'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('You'), findsOneWidget);
    });

    testWidgets('shrinks to the active tab and the player when minimised',
        (tester) async {
      usePhoneView(tester);
      playback.queueService.setQueue([testTrack]);
      final minimized = ValueNotifier(false);
      addTearDown(minimized.dispose);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavbar(activeRoute: '/home', minimized: minimized),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Home'), findsOneWidget);

      minimized.value = true;
      await tester.pumpAndSettle();
      final view = tester.widget<SplitBarView>(find.byType(SplitBarView));
      expect(view.minimized, isTrue);
      // The inline player took over from the capsule one.
      expect(find.byType(BottomMiniPlayer), findsOneWidget);
      expect(
        tester.widget<BottomMiniPlayer>(find.byType(BottomMiniPlayer)).variant,
        BottomMiniPlayerVariant.inline,
      );
      expect(tester.takeException(), isNull);
    });
  });

  group('theme', () {
    Future<BottomNavTheme> resolve(WidgetTester tester) async {
      late BottomNavTheme theme;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              theme = BottomNavTheme.resolve(context);
              return const SizedBox();
            },
          ),
        ),
      );
      return theme;
    }

    testWidgets('Neon Pulse colours each tab from its cycle', (tester) async {
      ThemeRegistry.setActiveById(ThemeRegistry.neonPulseId);
      final theme = await resolve(tester);
      final cycle = AppColorScheme.navColorCycle;
      expect(cycle, isNotEmpty);
      expect(
        theme.inactiveColor(1),
        cycle[1 % cycle.length].withValues(alpha: 0.75),
      );
      expect(theme.indicatorColor(2), cycle[2 % cycle.length]);
      expect(theme.neonEdge, isNotNull);
    });

    testWidgets('the pixel theme draws its own border', (tester) async {
      ThemeRegistry.setActiveById(ThemeRegistry.eightbitHeroId);
      usePhoneView(tester);
      await tester.pumpWidget(bottomNavApp());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(DockBarView),
          matching: find.byType(GlassSurface),
        ),
        findsWidgets,
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('the labels stay readable on the bar', (tester) async {
      final theme = await resolve(tester);
      final l1 = theme.onBar.computeLuminance();
      final l2 = theme.surface.computeLuminance();
      final hi = l1 > l2 ? l1 : l2;
      final lo = l1 > l2 ? l2 : l1;
      expect((hi + 0.05) / (lo + 0.05), greaterThanOrEqualTo(3));
    });
  });

  testWidgets('the bar leaves while the keyboard is up', (tester) async {
    usePhoneView(tester);
    await tester.pumpWidget(bottomNavApp());
    await tester.pump();

    tester.view.viewInsets = const FakeViewPadding(bottom: 900);
    await tester.pumpAndSettle();
    final slide = tester.widget<AnimatedSlide>(
      find.ancestor(
        of: find.byType(BottomNavbar),
        matching: find.byType(AnimatedSlide),
      ),
    );
    expect(slide.offset.dy, greaterThan(0));
    tester.view.resetViewInsets();
    await tester.pumpAndSettle();
  });

  testWidgets('nothing is drawn outside the bottom layout', (tester) async {
    usePhoneView(tester);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.top);
    await tester.pumpWidget(bottomNavApp());
    await tester.pump();
    expect(find.byType(BottomNavbar), findsNothing);
  });
}
