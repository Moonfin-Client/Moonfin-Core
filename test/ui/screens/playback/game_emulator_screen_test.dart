import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/playback/game_emulator_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

/// Real wakelock plugins talk to a native platform channel that has no
/// handler in the widget-test harness. `_exit()` awaits `WakelockPlus.disable()`
/// outside its own try/catch, so an unmocked plugin call here would throw and
/// prevent the pop this test is checking for -- unrelated to the bug under
/// test. Swap in a no-op platform implementation instead of a channel mock.
class _FakeWakelockPlatform extends WakelockPlusPlatformInterface {
  @override
  Future<void> toggle({required bool enable}) async {}

  @override
  Future<bool> get enabled async => false;
}

/// Counts actual Navigator pops, distinct from pop *attempts*: the bug under
/// test is a second `context.pop()` reaching the Navigator, not merely a
/// second call to `_exit()`.
class _CountingObserver extends NavigatorObserver {
  int pops = 0;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pops++;
    super.didPop(route, previousRoute);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;

  setUp(() async {
    WakelockPlusPlatformInterface.instance = _FakeWakelockPlatform();
    // _exit() awaits _restoreSystemUi()'s SystemChrome calls before popping;
    // without a handler these unmocked platform-channel calls would throw
    // and, like the wakelock stub above, block the pop this test checks for.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          SystemChannels.platform,
          (call) async => null,
        );
    await GetIt.instance.reset();
    client = _MockMediaServerClient();
    // No games API: _prepare() takes its "server does not support games"
    // error branch immediately, so the screen never builds the InAppWebView
    // (that only happens once _playerUrl is set). The menu button and the
    // pause overlay -- including Exit -- are always present regardless, which
    // is all this regression test needs to reach _exit().
    when(() => client.gamesApi).thenReturn(null);
    // Both game screens mix in GameAudioOwner, which resolves this.
    GetIt.instance.registerSingleton<PlaybackArbiter>(PlaybackArbiter());
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<RetroArtworkActivityGate>(
      RetroArtworkActivityGate(),
    );
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets(
    'a second Exit tap arriving before the first completes pops only once',
    (tester) async {
      final observer = _CountingObserver();
      final router = GoRouter(
        initialLocation: '/home',
        observers: [observer],
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const Scaffold(body: Text('home')),
          ),
          GoRoute(
            path: '/game',
            builder: (context, state) => const GameEmulatorScreen(
              libraryId: 'library',
              gameId: 'game',
              core: 'snes',
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
      await tester.pumpAndSettle();

      router.push('/game');
      await tester.pumpAndSettle();
      expect(find.byType(GameEmulatorScreen), findsOneWidget);
      expect(
        GetIt.instance<RetroArtworkActivityGate>().isGameplayActive,
        isFalse,
      );

      // Open the pause overlay via the on-screen menu button (works on every
      // platform/input device, unlike the gamepad combo).
      await tester.tap(find.byTooltip('Menu'));
      await tester.pump();
      expect(find.text('Exit'), findsOneWidget);

      // Two rapid taps on Exit, mirroring a gamepad auto-repeated confirm
      // press reaching _exit() a second time before the first invocation's
      // async persist/restore work has finished and popped the route.
      await tester.tap(find.text('Exit'));
      await tester.tap(find.text('Exit'));
      await tester.pumpAndSettle();

      expect(observer.pops, 1);
      expect(find.byType(GameEmulatorScreen), findsNothing);
      expect(find.text('home'), findsOneWidget);
      expect(
        GetIt.instance<RetroArtworkActivityGate>().isGameplayActive,
        isFalse,
      );
    },
  );
}
