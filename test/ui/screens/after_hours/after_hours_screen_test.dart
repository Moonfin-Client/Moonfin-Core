import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_game.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_play.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_scores.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_screen.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_trigger.dart';
import 'package:moonfin/ui/screens/after_hours/games/case_stack.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

/// A launcher, so the arcade is a route that Back can pop.
Widget _launcher(AfterHoursScores scores, {required bool phone}) => _app(
  Builder(
    builder: (context) => TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => AfterHoursScreen(scores: scores, phone: phone),
        ),
      ),
      child: const Text('open'),
    ),
  ),
);

/// Frames for the Tickers, since the demos never settle.
Future<void> _frames(WidgetTester tester, [int n = 6]) async {
  for (var i = 0; i < n; i++) {
    await tester.pump(const Duration(milliseconds: 16));
  }
}

void main() {
  late PreferenceStore store;
  late AfterHoursScores scores;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    scores = AfterHoursScores(store, null, viewerName: 'jamie');
  });

  tearDown(() async {
    AfterHoursTrigger.reset();
    scores.dispose();
    await GetIt.instance.reset();
  });

  testWidgets('seven taps on Version count down and open the arcade', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (context) => TextButton(
            onPressed: () => AfterHoursTrigger.press(context),
            child: const Text('Version'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Version'));
    await tester.tap(find.text('Version'));
    await tester.pump();
    expect(find.textContaining('more tap'), findsNothing);
    await tester.tap(find.text('Version'));
    await tester.pump();
    expect(find.text('4 more taps'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    expect(AfterHoursTrigger.count, 0);
    expect(find.text('4 more taps'), findsNothing);

    for (var i = 0; i < 6; i++) {
      await tester.tap(find.text('Version'));
    }
    await tester.pump();
    expect(find.text('1 more tap'), findsOneWidget);
    await tester.tap(find.text('Version'));
    await tester.pump();
    expect(find.text('After Hours unlocked'), findsOneWidget);
    // An eighth press during the unlock beat mustn't cancel the opening.
    await tester.tap(find.text('Version'));
    await tester.pump(const Duration(milliseconds: 700));
    await _frames(tester, 20);
    expect(find.byType(AfterHoursScreen), findsOneWidget);
    expect(find.text('After Hours unlocked'), findsNothing);
  });

  testWidgets('TV row moves with the remote, plays, pauses and comes back', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(_launcher(scores, phone: false));
    await tester.tap(find.text('open'));
    await _frames(tester, 30);

    expect(find.text('A sprint down three lobby aisles.'), findsNothing);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await _frames(tester);
    expect(find.text('A sprint down three lobby aisles.'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.byType(ArcadePlayView), findsOneWidget);
    // The first run of a game opens on its How to play card.
    expect(find.text('HOW TO PLAY'), findsOneWidget);
    expect(find.text('Velvet Rope'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('HOW TO PLAY'), findsNothing);
    expect(find.text('Up and Down change lanes. OK jumps.'), findsOneWidget);

    expect(InlineBackInterceptor.handleBack(), isTrue);
    await _frames(tester);
    expect(find.text('Paused'), findsOneWidget);
    InlineBackInterceptor.handleBack();
    await _frames(tester);
    expect(find.text('Paused'), findsNothing);

    InlineBackInterceptor.handleBack();
    await _frames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('Back to the game'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('Paused'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.byType(ArcadePlayView), findsNothing);
    expect(find.text('A sprint down three lobby aisles.'), findsOneWidget);

    // Seen now, so Play goes straight in, and Down still opens the card.
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('HOW TO PLAY'), findsNothing);
    InlineBackInterceptor.handleBack();
    await _frames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await _frames(tester);
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Back to the arcade'), findsOneWidget);
    InlineBackInterceptor.handleBack();
    await _frames(tester);

    for (var i = 0; i < 5; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    }
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('Scores on this device'), findsOneWidget);

    InlineBackInterceptor.handleBack();
    await _frames(tester);
    InlineBackInterceptor.handleBack();
    await _frames(tester, 30);
    expect(find.byType(AfterHoursScreen), findsNothing);
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('game over shows the place on the board and plays again', (
    tester,
  ) async {
    await store.set(
      const Preference<List<String>>(
        key: 'after_hours_how_to_seen',
        defaultValue: [],
      ),
      ['case-stack'],
    );
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    var exited = false;
    await tester.pumpWidget(
      _app(
        ArcadePlayView(
          id: ArcadeGameId.caseStack,
          make: () {
            final g = CaseStack(
              math.Random(1),
              const [],
              perfectLabel: 'PERFECT',
              boxSetLabel: 'BOX SET',
            )..reset();
            g.stack.last.x = 300;
            g.cur!
              ..x = 12
              ..v = 0;
            return g;
          },
          scores: scores,
          phone: false,
          onExit: () => exited = true,
        ),
      ),
    );
    await _frames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);

    expect(find.text('Game over'), findsOneWidget);
    expect(find.text('New #1 on the board'), findsOneWidget);
    expect(find.text('NEW'), findsOneWidget);
    expect(find.text('YOU'), findsOneWidget);
    expect(find.text('Scores on this device'), findsOneWidget);
    // The finished run's canvas stops ticking under the card.
    expect(tester.binding.hasScheduledFrame, isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _frames(tester);
    expect(find.text('Game over'), findsNothing);
    expect(exited, isFalse);
  });

  testWidgets('phone grid opens a game page, plays, and pauses by touch', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(_launcher(scores, phone: true));
    await tester.tap(find.text('open'));
    await _frames(tester, 30);

    await tester.tap(find.text('Cable Crawl'));
    await _frames(tester);
    expect(find.text('Swipe to turn.'), findsOneWidget);
    expect(find.text('Turns to landscape while you play'), findsOneWidget);

    await tester.tap(find.text('Play'));
    await _frames(tester);
    expect(find.byType(ArcadePlayView), findsOneWidget);
    expect(find.text('Interference Bug'), findsOneWidget);
    await tester.tap(find.text('Start'));
    await _frames(tester);
    await tester.tap(find.byTooltip('Pause'));
    await _frames(tester);
    expect(find.text('Paused'), findsOneWidget);
    await tester.tap(find.text('Exit game'));
    await _frames(tester);
    expect(find.text('Swipe to turn.'), findsOneWidget);

    await tester.tap(find.text('How to play'));
    await _frames(tester);
    expect(find.text('Power Brick'), findsOneWidget);
    await tester.tap(find.text('Arcade'));
    await _frames(tester);
    expect(find.text('Swipe to turn.'), findsOneWidget);
  });
}
