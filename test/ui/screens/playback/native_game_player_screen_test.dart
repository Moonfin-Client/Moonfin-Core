import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gamepads/gamepads.dart';
import 'package:playback_core/playback_core.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/native_game_player.dart';
import 'package:moonfin/ui/screens/playback/native_controller_mapping_screen.dart';
import 'package:moonfin/ui/screens/playback/native_game_player_screen.dart';
import 'package:moonfin/util/core_input_descriptors.dart';
import 'package:moonfin/util/game_cores.dart';
import 'package:moonfin/util/native_controller_mapping.dart';
import 'package:moonfin/util/platform_detection.dart';
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
  Future<String?> getApplicationSupportPath() async => '${_root.path}/support';

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

  /// Server-side saves, so a test can seed what a previous session stored and
  /// then read back what this session wrote.
  final Map<String, List<int>> saves = <String, List<int>>{};

  @override
  Future<List<int>?> getSave(String gameId, {String kind = 'state'}) async =>
      saves[gameId];

  @override
  Future<void> putSave(
    String gameId,
    List<int> data, {
    String kind = 'state',
  }) async {
    saves[gameId] = data;
  }
}

/// Fake native player: lets the test drive _prepare() to a live texture and
/// then simulate a mid-game core crash by pushing an 'error' event, without a
/// native runner behind a method/event channel.
class _FakeNativeGamePlayer implements NativeGamePlayer {
  final _eventsController = StreamController<Map<String, dynamic>>.broadcast();
  int stopCount = 0;
  int pauseCount = 0;
  int resumeCount = 0;

  @override
  Stream<Map<String, dynamic>> get events => _eventsController.stream;

  void emitError(String message) {
    _eventsController.add({'event': 'error', 'message': message});
  }

  void emitMenuPressed() {
    _eventsController.add({'event': 'menuPressed'});
  }

  void emitControllersChanged(int count, {bool navigationOnly = false}) {
    _eventsController.add({
      'event': 'controllersChanged',
      'count': count,
      'navigationOnly': navigationOnly,
    });
  }

  void emitCoreMessage(String message) {
    _eventsController.add({'event': 'coreMessage', 'message': message});
  }

  void emitButton(int index, bool pressed) {
    _eventsController.add({
      'event': 'button',
      'index': index,
      'pressed': pressed,
    });
  }

  void dispose() => _eventsController.close();

  /// The settings the screen resolved for this game and handed to the core.
  Map<String, String>? loadOptions;

  @override
  Future<GameLoadInfo> load({
    required String core,
    String? corePath,
    required String romPath,
    required String systemDir,
    required String saveDir,
    required String gameId,
    Map<String, String>? options,
  }) async {
    loadOptions = options;
    return const GameLoadInfo(
      textureId: 7,
      width: 256,
      height: 224,
      aspect: 4 / 3,
      fps: 60,
      sampleRate: 44100,
    );
  }

  @override
  Future<void> start() async {}
  @override
  Future<void> pause() async {
    pauseCount++;
  }

  @override
  Future<void> resume() async {
    resumeCount++;
  }

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

  /// What the loaded game currently has set. Cores publish per-game options
  /// (FBNeo's dipswitches are per driver), so this is deliberately NOT every
  /// option stored for the core.
  Map<String, String> currentOptions = const {};

  @override
  Future<Map<String, String>> getCurrentOptions() async => currentOptions;
  @override
  Future<int> controllerCount() async => 1;
  @override
  Future<List<CoreControllerType>> getControllerTypes() async => const [
    // Keep this non-empty: real cores expose capability lists, and the player
    // must preserve their nested generic type when publishing its snapshot.
    CoreControllerType(port: 0, id: 5, label: 'Classic'),
  ];
  @override
  Future<void> setControllerType(int port, int deviceType) async {}
  @override
  Future<CoreInputDescriptors> getInputDescriptors() async =>
      CoreInputDescriptors.empty;
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
  late _FakeGamesApi gamesApi;

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
    gamesApi = _FakeGamesApi();
    when(() => client.gamesApi).thenReturn(gamesApi);
    // Emulator settings are keyed per device, so the screen reads this.
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'device-1',
        name: 'Test Device',
        appName: 'Moonfin',
        appVersion: '0.0.0',
      ),
    );
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
    // A couple of tests flip this to reach the TV-only notice gate; reset
    // unconditionally so it never leaks into a later test in this file.
    PlatformDetection.setTvMode(false);
  });

  // The warning exists to point at a BETTER option going unused, not at an
  // empty slot: a remote really does feed port 0, so with no gamepad connected
  // there is nothing to suggest and nothing worth interrupting for.
  group('Player 1 exit warning', () {
    const remote = NativeControllerDevice(
      id: 'remote',
      name: 'Remote',
      supported: false,
      assignable: false,
      deviceClass: NativeControllerDeviceClass.remote,
    );
    const keyboardOnPlayerOne = NativeControllerDevice(
      id: 'keyboard',
      name: 'Keyboard',
      port: 0,
      deviceClass: NativeControllerDeviceClass.keyboard,
    );
    const playerOneGamepad = NativeControllerDevice(
      id: 'pad',
      name: 'Gamepad',
      port: 0,
    );
    const playerTwoGamepad = NativeControllerDevice(
      id: 'pad2',
      name: 'Gamepad 2',
      port: 1,
    );

    test('a gamepad on Player 1 is silent', () {
      expect(playerOneWarningFor([playerOneGamepad]), isNull);
      expect(playerOneWarningFor([playerOneGamepad, remote]), isNull);
    });

    test('a keyboard deliberately pinned to Player 1 is silent', () {
      expect(playerOneWarningFor([keyboardOnPlayerOne]), isNull);
      expect(
        playerOneWarningFor([keyboardOnPlayerOne, playerTwoGamepad]),
        isNull,
      );
    });

    test('a remote with no gamepad to suggest is silent', () {
      expect(playerOneWarningFor([remote]), isNull);
      expect(playerOneWarningFor(const []), isNull);
    });

    test(
      'gamepads pinned past Player 1 warn, even with a remote connected',
      () {
        // The reported bug: pinning pads to Players 2-4 left port 0 without a
        // gamepad, and the connected remote silently satisfied the old check.
        expect(
          playerOneWarningFor([playerTwoGamepad, remote]),
          PlayerOneWarning.gamepadNotAssigned,
        );
        expect(
          playerOneWarningFor([playerTwoGamepad]),
          PlayerOneWarning.gamepadNotAssigned,
        );
      },
    );

    test("Player 1's pinned pad missing while another is connected warns", () {
      expect(
        playerOneWarningFor([
          playerTwoGamepad,
          remote,
        ], pinnedPlayerOneProfileId: 'gone'),
        PlayerOneWarning.assignedControllerMissing,
      );
    });

    test("Player 1's pinned pad missing with nothing to suggest is silent", () {
      expect(
        playerOneWarningFor([remote], pinnedPlayerOneProfileId: 'gone'),
        isNull,
      );
    });
  });

  // Windows and Linux read gamepads in Dart, and their triggers arrive as AXES
  // while the mapping stores them as BUTTONS (codes 1006/1007). These cover the
  // resolution both paths share, which is what stopped an analog trigger on
  // desktop from ever honouring its binding.
  test(
    'an unbound trigger resolves to no binding, so the caller keeps L2/R2',
    () {
      const empty = NativeControllerMapping.empty;
      expect(desktopBoundBit(empty, GamepadButton.leftTrigger), isNull);
      expect(desktopBoundBit(empty, GamepadButton.rightTrigger), isNull);
      expect(desktopBoundBit(null, GamepadButton.leftTrigger), isNull);
    },
  );

  group('the table handed to the native side', () {
    // This payload IS what the core plays with. The mapping menu resolves the
    // same way, so a regression here is invisible in the UI -- the menu would
    // still show the right buttons while the game used the wrong ones.
    const pad = 'android-p1';
    const gameId = 'hydro-thunder';
    final mapping = NativeControllerMapping.empty
        .withBinding(96, RetroPadButton.a)
        .withBindingForGame(gameId, 190, RetroPadButton.a)
        .withControllerType('fbneo', 5)
        .withSnap(gameId, StickSnapMode.fourWay);

    test('sends the current game own table, not the default', () {
      final sent =
          jsonDecode(controllerMappingsPayload({pad: mapping}, gameId))
              as Map<String, dynamic>;

      expect(sent[pad], {'190': RetroPadButton.a.retroPadIndex});
    });

    test('sends the default for a game that has not diverged', () {
      final sent =
          jsonDecode(controllerMappingsPayload({pad: mapping}, 'burgertime'))
              as Map<String, dynamic>;

      expect(sent[pad], {'96': RetroPadButton.a.retroPadIndex});
    });

    test('sends a table for every connected profile', () {
      final sent =
          jsonDecode(
                controllerMappingsPayload({
                  pad: mapping,
                  'android-p2': NativeControllerMapping.empty
                      .withBindingForGame(gameId, 191, RetroPadButton.b),
                }, gameId),
              )
              as Map<String, dynamic>;

      expect(sent.keys, containsAll(<String>[pad, 'android-p2']));
      expect(sent['android-p2'], {'191': RetroPadButton.b.retroPadIndex});
    });

    test('emits keycodes only, no metadata the parser would skip', () {
      final sent =
          jsonDecode(controllerMappingsPayload({pad: mapping}, gameId))
              as Map<String, dynamic>;

      final keys = (sent[pad] as Map<String, dynamic>).keys;
      expect(keys.every((key) => int.tryParse(key) != null), isTrue);
      expect(keys, isNot(contains('controllerTypes')));
      expect(keys, isNot(contains('snapByGame')));
    });
  });

  test('a rebound trigger resolves to the button it was bound to', () {
    final mapping = NativeControllerMapping(const {
      1006: RetroPadButton.a,
      1007: RetroPadButton.b,
    });

    expect(
      desktopBoundBit(mapping, GamepadButton.leftTrigger),
      1 << RetroPadButton.a.retroPadIndex,
    );
    expect(
      desktopBoundBit(mapping, GamepadButton.rightTrigger),
      1 << RetroPadButton.b.retroPadIndex,
    );
    // Not the hardwired L2/R2 bits the axis path used to send regardless.
    expect(desktopBoundBit(mapping, GamepadButton.leftTrigger), isNot(1 << 12));
    expect(
      desktopBoundBit(mapping, GamepadButton.rightTrigger),
      isNot(1 << 13),
    );
  });

  test('a default stops firing once another key is bound to its button', () {
    // Bindings are 1:1: binding the left trigger to RetroPad A must stop the
    // physical A from firing A as well.
    final mapping = NativeControllerMapping(const {1006: RetroPadButton.a});
    const aBit = 1 << 0;
    expect(
      desktopBitForButton(mapping, GamepadButton.leftTrigger, 1 << 12),
      aBit,
    );
    expect(desktopBitForButton(mapping, GamepadButton.a, aBit), isNull);
    // An unrelated button keeps its default.
    expect(desktopBitForButton(mapping, GamepadButton.b, 1 << 8), 1 << 8);
  });

  test('with no bindings every default is left alone', () {
    expect(desktopBitForButton(null, GamepadButton.a, 1 << 0), 1 << 0);
    expect(
      desktopBitForButton(
        NativeControllerMapping.empty,
        GamepadButton.a,
        1 << 0,
      ),
      1 << 0,
    );
  });

  test(
    'a rebound face button still resolves, and one binding does not move another',
    () {
      final mapping = NativeControllerMapping(const {1000: RetroPadButton.y});

      expect(
        desktopBoundBit(mapping, GamepadButton.a),
        1 << RetroPadButton.y.retroPadIndex,
      );
      expect(desktopBoundBit(mapping, GamepadButton.b), isNull);
      expect(desktopBoundBit(mapping, GamepadButton.leftTrigger), isNull);
    },
  );

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
        for (
          var i = 0;
          i < 60 && find.byType(Texture).evaluate().isEmpty;
          i++
        ) {
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

  testWidgets('Save & exit keeps the game running when the save fails', (
    tester,
  ) async {
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

      // Open the in-game overlay the way the Menu button does.
      player.emitMenuPressed();
      await tester.pumpAndSettle();

      // Exit sits below the fold in the action list at the test window size.
      await tester.scrollUntilVisible(
        find.text('Exit'),
        200,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
      expect(find.text('Exit'), findsOneWidget);

      await tester.tap(find.text('Exit'));
      await tester.pumpAndSettle();
      expect(find.text('Keep playing'), findsOneWidget);
      expect(find.text('Save & exit'), findsOneWidget);

      // The fake player's saveState() returns null, i.e. nothing was
      // captured, so the save cannot have landed.
      await tester.tap(find.text('Save & exit'));
      await tester.pumpAndSettle();

      expect(
        observer.pops,
        0,
        reason:
            'a failed save must not exit and discard the progress the '
            'warning is about',
      );
      expect(find.byType(NativeGamePlayerScreen), findsOneWidget);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets(
    'exiting one game keeps another game\'s options for the same core',
    (tester) async {
      // Reproduces a confirmed on-device report: BurgerTime's lives reverted
      // after merely loading and exiting Spy Hunter, having changed nothing
      // there. Settings used to live under one save id per core, so a write
      // built from the loaded game's options deleted every other game's.
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      try {
        final coreId = libretroCoreId('snes')!;
        final legacyId = 'moonfin-native-$coreId';
        final gameId = 'moonfin-native-$coreId-game1-device-1';
        gamesApi.saves[legacyId] = 'other-game-lives=5'.codeUnits;
        // This session's game knows nothing about the other game's option.
        player.currentOptions = const {'this-game-difficulty': 'Hard'};

        final router = GoRouter(
          initialLocation: '/home',
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
        for (
          var i = 0;
          i < 60 && find.byType(Texture).evaluate().isEmpty;
          i++
        ) {
          await tester.runAsync(
            () => Future<void>.delayed(const Duration(milliseconds: 20)),
          );
          await tester.pump(const Duration(milliseconds: 20));
        }
        expect(find.byType(Texture), findsOneWidget);

        player.emitMenuPressed();
        await tester.pumpAndSettle();
        await tester.scrollUntilVisible(
          find.text('Exit'),
          200,
          scrollable: find.byType(Scrollable).last,
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Exit'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Exit game'));
        await tester.pumpAndSettle();

        expect(
          String.fromCharCodes(gamesApi.saves[legacyId]!),
          'other-game-lives=5',
          reason: 'exiting this game must not touch another game\'s options',
        );
        expect(
          String.fromCharCodes(gamesApi.saves[gameId]!),
          'this-game-difficulty=Hard',
          reason: 'this game\'s settings belong under its own id',
        );
        // A game with no document of its own still starts from what the
        // core-wide document held, so upgrading does not reset anyone.
        expect(player.loadOptions, {'other-game-lives': '5'});
        // The pre-per-device document must not be written to either.
        expect(
          gamesApi.saves.containsKey('moonfin-native-$coreId-game1'),
          isFalse,
          reason: 'writes belong under the per-device id only',
        );
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

  testWidgets('a game\'s own settings win over the core-wide ones', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    try {
      final coreId = libretroCoreId('snes')!;
      gamesApi.saves['moonfin-native-$coreId'] = 'lives=3'.codeUnits;
      gamesApi.saves['moonfin-native-$coreId-game1-device-1'] =
          'lives=5'.codeUnits;

      final router = GoRouter(
        initialLocation: '/game',
        routes: [
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
      for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump(const Duration(milliseconds: 20));
      }

      // The core-wide document is a fallback, not a merge: once this game has
      // its own settings, that is what it plays with.
      expect(player.loadOptions, {'lives': '5'});
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('backgrounding the app stops emulating, returning resumes it', (
    tester,
  ) async {
    // The system Home button used to leave the emulation thread running: the
    // native pause hook is wired to SurfaceProducer.Callback, whose
    // setCallback is a no-op for this producer type, so nothing fired.
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    try {
      final router = GoRouter(
        initialLocation: '/game',
        routes: [
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
      for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump(const Duration(milliseconds: 20));
      }
      expect(find.byType(Texture), findsOneWidget);

      final pausesBefore = player.pauseCount;
      final resumesBefore = player.resumeCount;

      // Transient: a system dialog or the volume panel must not pause.
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      await tester.pump();
      expect(player.pauseCount, pausesBefore, reason: 'inactive is transient');

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      expect(player.pauseCount, pausesBefore + 1);

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      expect(player.resumeCount, resumesBefore + 1);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('backgrounding never saves state', (tester) async {
    // A save is destructive, so it stays a deliberate choice; a Home button
    // press is not one.
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    try {
      final router = GoRouter(
        initialLocation: '/game',
        routes: [
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
      for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump(const Duration(milliseconds: 20));
      }

      final savesBefore = gamesApi.saves.length;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();
      expect(gamesApi.saves.length, savesBefore);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets(
    'a navigationOnly controllersChanged event shows the remote notice once',
    (tester) async {
      // The notice is gated on !usesKeyboardInput && !usesOnScreenControls,
      // which only both read false on Android TV/tvOS. setTvMode(true) under
      // an Android platform override reaches that combination without a live
      // texture: the notice's render condition
      // (`_inputNotice != null && _error == null`) never consults
      // _textureId, and _prepare()'s real disk I/O never advances without
      // tester.runAsync(), so _error stays null for the whole test regardless
      // of platform.
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setTvMode(true);
      expect(usesKeyboardInput, isFalse);
      expect(usesOnScreenControls, isFalse);
      try {
        final router = GoRouter(
          initialLocation: '/game',
          routes: [
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
        await tester.pump();

        player.emitControllersChanged(0, navigationOnly: true);
        await tester.pump();

        expect(find.textContaining('playing with the remote'), findsOneWidget);

        // Still up at two seconds, gone after its own three-second timer.
        await tester.pump(const Duration(seconds: 2));
        expect(find.textContaining('playing with the remote'), findsOneWidget);
        await tester.pump(const Duration(seconds: 2));
        expect(find.textContaining('playing with the remote'), findsNothing);

        // A second navigationOnly event (e.g. the remote's Bluetooth link
        // napping and waking) must not re-show the notice for this session.
        player.emitControllersChanged(1, navigationOnly: false);
        await tester.pump();
        player.emitControllersChanged(0, navigationOnly: true);
        await tester.pump();

        expect(find.textContaining('playing with the remote'), findsNothing);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

  testWidgets(
    'the remote notice and a core message can be visible at the same time',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setTvMode(true);
      try {
        final router = GoRouter(
          initialLocation: '/game',
          routes: [
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
        await tester.pump();

        player.emitControllersChanged(0, navigationOnly: true);
        player.emitCoreMessage('SET_ROTATION rot=1');
        await tester.pump();

        expect(find.textContaining('playing with the remote'), findsOneWidget);
        expect(find.text('SET_ROTATION rot=1'), findsOneWidget);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

  testWidgets(
    'a navigationOnly event shows no remote notice on a platform with '
    'on-screen controls',
    (tester) async {
      // Regression guard: Android phones ship the same native code as
      // Android TV and can report navigationOnly too, but usesOnScreenControls
      // already explains how to play there, so the notice must stay gated
      // off. setTvMode(false) is the default, but set it explicitly since
      // this is the case the gate exists for.
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setTvMode(false);
      expect(usesOnScreenControls, isTrue);
      try {
        final router = GoRouter(
          initialLocation: '/game',
          routes: [
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
        await tester.pump();

        player.emitControllersChanged(0, navigationOnly: true);
        await tester.pump();

        expect(find.textContaining('playing with the remote'), findsNothing);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

  testWidgets('a press while confirming the controller-mapping exit drives the '
      'confirmation instead of vanishing into the unmounted mapping screen', (
    tester,
  ) async {
    // The Player 1-vacant confirmation only exists on Android:
    // _requestControllerMappingClose gates it behind PlatformDetection
    // .isAndroid and reads live device state through AndroidGamepadChannel.
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    const gamepadChannel = MethodChannel('org.moonfin.androidtv/gamepad');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(gamepadChannel, (call) async {
          if (call.method == 'getNativeGamepadDevices') {
            // One connected pad, but not on port 0: nothing satisfies
            // hasConnectedPlayerOneInput, so closing the mapping screen must
            // ask for confirmation instead of leaving silently.
            return [
              {'id': 'pad-1', 'name': 'Pad', 'supported': false},
            ];
          }
          return null;
        });
    try {
      final coreId = libretroCoreId('snes')!;
      final coresDir = await coresDirectory();
      final coreFile = File('${coresDir.path}/${coreFileName(coreId)}');
      // Real filesystem work has to leave the fake-async zone: its
      // completion is delivered by the real event loop, which the zone
      // never runs, so awaiting it here directly hangs for ever.
      await tester.runAsync(() async {
        await coreFile.parent.create(recursive: true);
        await coreFile.writeAsBytes([0]);
      });

      final router = GoRouter(
        initialLocation: '/game',
        routes: [
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
      for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump(const Duration(milliseconds: 20));
      }
      expect(find.byType(Texture), findsOneWidget);

      player.emitMenuPressed();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.scrollUntilVisible(
        find.text('Controller mapping'),
        200,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.tap(find.text('Controller mapping'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // RetroPad index 8 (B / cancel) at the mapping list's top level asks
      // to close, which kicks off the async Player 1 check.
      player.emitButton(8, true);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Keep editing'), findsOneWidget);
      expect(find.text('Leave with Player 1 vacant'), findsOneWidget);

      // The regression under test: the mapping screen is unmounted while
      // confirming (see _buildOverlayBody), so routing these presses to it
      // would reach a null currentState and do nothing. They must instead
      // fall through to _nav and drive the confirmation's own rows.
      player.emitButton(5, true); // down: Keep editing -> Leave with...
      await tester.pump();
      player.emitButton(0, true); // confirm the highlighted row
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(
        find.text('Leave with Player 1 vacant'),
        findsNothing,
        reason: 'confirming must resolve the dialog, not leave it stranded',
      );
      expect(find.text('Resume'), findsOneWidget);
      expect(
        find.byType(Texture),
        findsOneWidget,
        reason: 'leaving the mapping screen must not end the session',
      );
    } finally {
      debugDefaultTargetPlatformOverride = null;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(gamepadChannel, null);
    }
  });
}
