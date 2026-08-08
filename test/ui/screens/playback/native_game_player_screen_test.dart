import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/native_game_player.dart';
import 'package:moonfin/ui/screens/playback/native_game_player_screen.dart';
// Transitive via path_provider; not worth promoting to a direct pubspec.yaml
// dependency just for this test-only fake.
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:server_core/server_core.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

/// Real wakelock plugins talk to a native platform channel that has no
/// handler in the widget-test harness. See the identical stub in
/// game_emulator_screen_test.dart for why this is needed rather than a
/// channel mock.
class _FakeWakelockPlatform extends WakelockPlusPlatformInterface {
  @override
  Future<void> toggle({required bool enable}) async {}

  @override
  Future<bool> get enabled async => false;
}

/// GameStorage resolves its directories through path_provider, which has no
/// real platform implementation in a widget test. Routes everything into a
/// throwaway temp directory instead of throwing MissingPluginException.
class _FakePathProviderPlatform extends PathProviderPlatform {
  _FakePathProviderPlatform(this._root);

  final Directory _root;

  @override
  Future<String?> getApplicationSupportPath() async =>
      '${_root.path}/support';

  @override
  Future<String?> getApplicationCachePath() async => '${_root.path}/cache';
}

/// Minimal GamesApi: only the calls _prepare() makes on the way to a live
/// texture are implemented meaningfully. downloadRom actually writes the ROM
/// bytes to disk so the "already downloaded" check that follows it succeeds.
class _FakeGamesApi extends GamesApi {
  @override
  Future<List<GameLibrary>> getLibraries() async => const [];

  @override
  Future<List<GameSystem>> getSystems(String libraryId) async => const [];

  @override
  Future<List<GameSummary>> getGames(
    String libraryId, {
    String? system,
  }) async => const [];

  @override
  Future<GameDetail?> getGame(String libraryId, String gameId) async =>
      const GameDetail(
        id: 'game1',
        title: 'Test Game',
        system: 'snes',
        core: 'snes',
        fileName: 'game.sfc',
        sizeBytes: 3,
        bios: [],
      );

  @override
  Future<GameDetail?> setGameCoreOverride(
    String libraryId,
    String gameId, {
    String? core,
  }) async => null;

  @override
  Future<GameDetail?> setGameBackendOverride(
    String libraryId,
    String gameId, {
    String? backend,
  }) async => null;

  @override
  String thumbUrl({
    required String libraryId,
    required String gameId,
    String kind = 'boxart',
  }) => '';

  @override
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? romFileName,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
    String? saveId,
  }) => '';

  @override
  Future<void> downloadRom(
    String libraryId,
    String gameId,
    String destPath, {
    void Function(int received, int total)? onProgress,
  }) async {
    await File(destPath).writeAsBytes([1, 2, 3]);
  }

  @override
  Future<void> downloadBios(
    String libraryId,
    String biosId,
    String destPath,
  ) async {}

  @override
  Future<List<int>?> getSave(String gameId, {String kind = 'state'}) async =>
      null;

  @override
  Future<void> putSave(
    String gameId,
    List<int> data, {
    String kind = 'state',
  }) async {}
}

/// Fake native player: lets the test drive _prepare() to a live texture and
/// then simulate a mid-game core crash by pushing an 'error' event, without a
/// native runner behind a method/event channel.
class _FakeNativeGamePlayer implements NativeGamePlayer {
  final _eventsController = StreamController<Map<String, dynamic>>.broadcast();
  int stopCount = 0;

  @override
  Stream<Map<String, dynamic>> get events => _eventsController.stream;

  void emitError(String message) {
    _eventsController.add({'event': 'error', 'message': message});
  }

  void dispose() => _eventsController.close();

  @override
  Future<GameLoadInfo> load({
    required String core,
    String? corePath,
    required String romPath,
    required String systemDir,
    required String saveDir,
    required String gameId,
    Map<String, String>? options,
  }) async => const GameLoadInfo(
    textureId: 7,
    width: 256,
    height: 224,
    aspect: 4 / 3,
    fps: 60,
    sampleRate: 44100,
  );

  @override
  Future<void> start() async {}
  @override
  Future<void> pause() async {}
  @override
  Future<void> resume() async {}
  @override
  Future<void> restart() async {}
  @override
  Future<void> stop() async {
    stopCount++;
  }

  @override
  Future<Uint8List?> saveState() async => null;
  @override
  Future<bool> loadState(Uint8List data) async => false;
  @override
  Future<void> setFastForward(int factor) async {}
  @override
  Future<void> pulseButton(int index, {int durationMs = 150}) async {}
  @override
  Future<void> setInput(int port, int mask) async {}
  @override
  Future<List<GameCoreOption>> getOptions() async => const [];
  @override
  Future<void> setOption(String id, String value) async {}
  @override
  Future<Map<String, String>> getCurrentOptions() async => const {};
  @override
  Future<int> controllerCount() async => 1;
}

/// Counts actual Navigator pops, distinct from pop *attempts* -- the bug
/// under test is a stranded route, not merely a call that never reaches it.
class _PopCountingObserver extends NavigatorObserver {
  int pops = 0;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pops++;
    super.didPop(route, previousRoute);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempRoot;
  late _MockMediaServerClient client;
  late _FakeNativeGamePlayer player;

  setUp(() async {
    tempRoot = await Directory.systemTemp.createTemp('native_game_player_test');
    PathProviderPlatform.instance = _FakePathProviderPlatform(tempRoot);
    WakelockPlusPlatformInterface.instance = _FakeWakelockPlatform();
    // _backOut() awaits _restoreSystemUi()'s SystemChrome calls before
    // popping; without a handler these unmocked platform-channel calls would
    // throw and block the pop this test checks for.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          SystemChannels.platform,
          (call) async => null,
        );

    await GetIt.instance.reset();
    client = _MockMediaServerClient();
    when(() => client.gamesApi).thenReturn(_FakeGamesApi());
    // Both game screens mix in GameAudioOwner, which resolves this.
    GetIt.instance.registerSingleton<PlaybackArbiter>(PlaybackArbiter());
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<RetroArtworkActivityGate>(
      RetroArtworkActivityGate(),
    );
    player = _FakeNativeGamePlayer();
  });

  tearDown(() async {
    await GetIt.instance.reset();
    player.dispose();
    await tempRoot.delete(recursive: true);
  });

  testWidgets(
    'back button escapes the error screen after a mid-game fatal error',
    (tester) async {
      // macOS bundles its cores, so _prepare() skips the download-manager/ABI
      // path entirely and goes straight from a resolved GamesApi through to
      // _player.load() -- the shortest real route to a live texture. Reset in
      // a finally block rather than addTearDown/tearDown: the binding's
      // "foundation debug var" invariant check runs directly after this test
      // body returns, before any package:test tearDown hook fires.
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      try {
        final observer = _PopCountingObserver();
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
              builder: (context, state) => NativeGamePlayerScreen(
                libraryId: 'lib1',
                gameId: 'game1',
                core: 'snes',
                startFresh: true,
                player: player,
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
        await tester.pump();
        // Not pumpAndSettle(): the loading screen's CircularProgressIndicator
        // animates indefinitely, so it never "settles" on its own. _prepare()
        // also does real (temp-dir-backed) file IO, which completes on the
        // real event loop rather than flutter_test's fake clock -- runAsync()
        // lets it actually progress between pumps that pick up the resulting
        // setState calls, and the explicit duration on pump() lets the
        // Cupertino-style route transition (macOS) finish too.
        for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
          await tester.runAsync(
            () => Future<void>.delayed(const Duration(milliseconds: 20)),
          );
          await tester.pump(const Duration(milliseconds: 20));
        }
        expect(find.byType(NativeGamePlayerScreen), findsOneWidget);

        // Reached a live-texture state through the real _prepare() flow
        // (backed by the fake GamesApi/player above). Now fail the session
        // the way a core crash does.
        expect(find.byType(Texture), findsOneWidget);

        player.emitError('core crashed');
        await tester.pump();

        expect(find.text('core crashed'), findsOneWidget);
        expect(find.byType(Texture), findsNothing);

        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        expect(
          observer.pops,
          1,
          reason: 'a fatal error must not strand the user on the error screen',
        );
        expect(find.byType(NativeGamePlayerScreen), findsNothing);
        expect(find.text('home'), findsOneWidget);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );
}
