import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gamepads/gamepads.dart';
// Transitive through gamepads; used to inject real plugin-stream events.
// ignore: depend_on_referenced_packages
import 'package:gamepads_platform_interface/gamepads_platform_interface.dart';
import 'package:playback_core/playback_core.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/core_download_service.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/native_game_player.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/playback/native_controller_mapping_screen.dart';
import 'package:moonfin/ui/screens/playback/game_emulator_screen.dart';
import 'package:moonfin/ui/screens/playback/native_game_player_screen.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart' show DialogBackSuppressor;
import 'package:moonfin/util/core_input_descriptors.dart';
import 'package:moonfin/util/game_cores.dart';
import 'package:moonfin/util/focus/gamepad/gamepad_navigation_scope.dart';
import 'package:moonfin/util/focus/gamepad/gamepad_suppressor.dart';
import 'package:moonfin/util/native_controller_mapping.dart';
import 'package:moonfin/util/platform_detection.dart';
// Transitive via path_provider; not worth promoting to a direct pubspec.yaml
// dependency just for this test-only fake.
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

/// Mirrors the app-level observer that consumes Android's duplicate popRoute.
class _DialogBackObserver with WidgetsBindingObserver {
  int suppressedPops = 0;

  @override
  Future<bool> didPopRoute() async {
    if (!DialogBackSuppressor.consume()) return false;
    suppressedPops++;
    return true;
  }
}

class _RecordingScreensaver extends Mock implements ScreensaverController {
  bool playbackActive = false;

  @override
  void setPlaybackActive(bool value) => playbackActive = value;
}

class _FakeCoreDownloads extends CoreDownloadService {
  _FakeCoreDownloads() : super(GetIt.instance<PreferenceStore>());

  int downloads = 0;
  bool fail = false;
  bool available = true;
  Completer<void>? gate;
  CancelToken? token;

  @override
  bool isAvailable(String coreId) => available && super.isAvailable(coreId);

  @override
  Future<void> download(
    String coreId, {
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    downloads++;
    token = cancelToken;
    onProgress?.call(0.5);
    if (gate case final gate?) await gate.future;
    if (cancelToken?.cancelError case final error?) throw error;
    if (fail) throw StateError('Download unavailable');
    final dir = await coresDirectory();
    await dir.create(recursive: true);
    await File('${dir.path}/${coreFileName(coreId)}').writeAsBytes([1]);
    onProgress?.call(1);
  }
}

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
  int backendOverrideWrites = 0;
  @override
  Future<List<GameLibrary>> getLibraries() async => const [];

  @override
  Future<List<GameSystem>> getSystems(String libraryId) async => const [];

  @override
  Future<List<GameSummary>> getGames(
    String libraryId, {
    String? system,
  }) async => const [];

  /// What getGame answers and downloadRom writes, so a test can swap in
  /// another system's game.
  GameDetail detail = const GameDetail(
    id: 'game1',
    title: 'Test Game',
    system: 'snes',
    core: 'snes',
    fileName: 'game.sfc',
    sizeBytes: 3,
    bios: [],
  );
  List<int> romBytes = const [1, 2, 3];

  @override
  Future<GameDetail?> getGame(String libraryId, String gameId) async => detail;

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
  }) async {
    backendOverrideWrites++;
    return null;
  }

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
    bool includeSramUrl = false,
  }) => '';

  @override
  Future<void> downloadRom(
    String libraryId,
    String gameId,
    String destPath, {
    void Function(int received, int total)? onProgress,
  }) async {
    await File(destPath).writeAsBytes(romBytes);
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
  Completer<void>? stopGate;
  int loadCount = 0;
  int pauseCount = 0;
  int resumeCount = 0;
  final inputMasks = <int>[];

  @override
  Stream<Map<String, dynamic>> get events => _eventsController.stream;

  @override
  Future<void> setPadState(
    int port,
    int lx,
    int ly,
    int rx,
    int ry, {
    int l2 = 0,
    int r2 = 0,
  }) async {}

  @override
  Future<int> analogStickPorts() async => 0;

  @override
  Future<void> setPointer(int port, bool pressed, int x, int y) async {}

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
  bool? hardwareRenderingEnabled;
  String? romPath;
  List<GameCoreOption> options = const [];

  @override
  Future<GameLoadInfo> load({
    required String core,
    String? corePath,
    required String romPath,
    required String systemDir,
    required String saveDir,
    required String gameId,
    Map<String, String>? options,
    bool hardwareRenderingEnabled = true,
  }) async {
    loadCount++;
    loadOptions = options;
    this.hardwareRenderingEnabled = hardwareRenderingEnabled;
    this.romPath = romPath;
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
    await stopGate?.future;
  }

  /// Null captures nothing; a completer lets a test hold the save in flight.
  Completer<Uint8List?>? pendingSaveState;
  int saveStateCount = 0;

  @override
  Future<Uint8List?> saveState() {
    saveStateCount++;
    return pendingSaveState?.future ?? Future.value(null);
  }
  @override
  Future<bool> loadState(Uint8List data) async => false;
  @override
  Future<void> setFastForward(int factor) async {}
  @override
  Future<void> pulseButton(int index, {int durationMs = 150}) async {}
  @override
  Future<void> setInput(int port, int mask) async => inputMasks.add(mask);
  @override
  Future<List<GameCoreOption>> getOptions() async => options;
  @override
  Future<List<GameCoreOption>> probeOptions(
    String corePath,
    String systemDir,
  ) async => const [];
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

String? _highlightedOverlayRowLabel(WidgetTester tester) {
  for (final container in tester.widgetList<Container>(
    find.byType(Container),
  )) {
    final decoration = container.decoration;
    if (decoration is BoxDecoration && decoration.color == Colors.white) {
      final labels = find.descendant(
        of: find.byWidget(container),
        matching: find.byType(Text),
      );
      if (labels.evaluate().isNotEmpty) {
        return (labels.first.evaluate().single.widget as Text).data;
      }
    }
  }
  return null;
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
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
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
    DialogBackSuppressor.newBackPress();
    await GetIt.instance.reset();
    player.dispose();
    await tempRoot.delete(recursive: true);
    // A couple of tests flip this to reach the TV-only notice gate; reset
    // unconditionally so it never leaks into a later test in this file.
    PlatformDetection.setTvMode(false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
  });

  Future<void> advanceStartup(WidgetTester tester, bool Function() done) async {
    for (var i = 0; i < 100 && !done(); i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 10)),
      );
      await tester.pump(const Duration(milliseconds: 10));
    }
    expect(done(), isTrue);
  }

  Future<void> pumpInstallingPlayer(
    WidgetTester tester,
    _FakeCoreDownloads downloads, {
    String core = 'n64',
  }) => tester.pumpWidget(
    MaterialApp(
      home: NativeGamePlayerScreen(
        libraryId: 'lib1',
        gameId: 'game1',
        core: core,
        startFresh: true,
        player: player,
        coreDownloads: downloads,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );

  Future<void> acceptCoreDownload(
    WidgetTester tester, {
    bool dontShowAgain = false,
  }) async {
    await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
    if (dontShowAgain) {
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pump();
    }
    await tester.tap(find.widgetWithText(FilledButton, 'Download'));
    await tester.pump();
  }

  GoRouter sessionRouter(
    _FakeCoreDownloads downloads, {
    bool realFallback = false,
  }) => GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (_, _) => const Scaffold(body: Text('game details')),
      ),
      GoRoute(
        path: Destinations.gamePlayer,
        builder: (_, state) {
          if (state.uri.queryParameters['backend'] == 'emulatorjs' ||
              !usesNativeGameBackendFor(state.uri.queryParameters['core']!)) {
            if (realFallback) {
              return GameEmulatorScreen(
                libraryId: state.pathParameters['libraryId']!,
                gameId: state.pathParameters['gameId']!,
                core: state.uri.queryParameters['core']!,
              );
            }
            return const Scaffold(body: Text('fallback session'));
          }
          return NativeGamePlayerScreen(
            libraryId: state.pathParameters['libraryId']!,
            gameId: state.pathParameters['gameId']!,
            core: state.uri.queryParameters['core']!,
            gameName: state.uri.queryParameters['name'],
            romFileName: state.uri.queryParameters['romFile'],
            biosId: state.uri.queryParameters['bios'],
            startFresh: state.uri.queryParameters['fresh'] == '1',
            player: player,
            coreDownloads: downloads,
          );
        },
      ),
    ],
  );

  const fallbackLabel = 'Use EmulatorJS';

  for (final key in [LogicalKeyboardKey.goBack, LogicalKeyboardKey.escape]) {
    testWidgets('Android consent dismissal handles the follow-up pop only for $key', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      final downloads = _FakeCoreDownloads();
      final router = sessionRouter(downloads);
      final observer = _DialogBackObserver();
      tester.binding.addObserver(observer);
      try {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ));
        // Keep a page under the details page so a duplicate pop would be visible
        // as a lost stack entry, even though this test uses the same route twice.
        unawaited(router.push<void>('/home'));
        await tester.pumpAndSettle();
        unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game1', core: 'n64')));
        await tester.pump();
        await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
        await tester.pump(const Duration(milliseconds: 500));
        // Flutter's simulator has no Android goBack scancode; use Escape's
        // physical key while preserving the logical Back event under test.
        await tester.sendKeyDownEvent(key, physicalKey: PhysicalKeyboardKey.escape);
        await tester.pumpAndSettle();
        await tester.sendKeyUpEvent(key, physicalKey: PhysicalKeyboardKey.escape);
        expect(find.byType(AlertDialog), findsNothing);
        expect(find.byType(NativeGamePlayerScreen), findsNothing);
        expect(find.text('game details'), findsOneWidget);
        expect(router.canPop(), isTrue);
        expect(downloads.downloads, 0);
        expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);

        if (key == LogicalKeyboardKey.goBack) {
          // Android <= 12 can send this after the unhandled key-up, after the
          // dialog and player have both already left the stack.
          await tester.binding.handlePopRoute();
          await tester.pumpAndSettle();
          expect(observer.suppressedPops, 1);
          expect(find.text('game details'), findsOneWidget);
          expect(router.canPop(), isTrue);
        }
        expect(DialogBackSuppressor.consume(), isFalse);
        // A subsequent genuine Back must still pop the details page normally.
        await tester.binding.handlePopRoute();
        await tester.pumpAndSettle();
        expect(router.canPop(), isFalse);
      } finally {
        tester.binding.removeObserver(observer);
        await tester.pumpWidget(const SizedBox());
        router.dispose();
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  testWidgets('TV Select starts Download without navigating or checking the opt-out', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    final downloads = _FakeCoreDownloads()..fail = true;
    try {
      await pumpInstallingPlayer(tester, downloads);
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      await tester.pump(const Duration(milliseconds: 500));
      expect(FocusManager.instance.primaryFocus?.debugLabel, 'Download native core');
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isFalse);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await advanceStartup(tester, () => find.text('Retry').evaluate().isNotEmpty);
      expect(downloads.downloads, 1);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox());
      debugDefaultTargetPlatformOverride = null;
    }
  });

  Future<void> pressPad(WidgetTester tester, String key) async {
    for (final value in [1.0, 0.0]) {
      GamepadsPlatformInterface.instance.emitGamepadEvent(GamepadEvent(
        gamepadId: 'pad-1', timestamp: 0,
        type: KeyType.button, key: key, value: value,
      ));
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  for (final platform in [TargetPlatform.windows, TargetPlatform.linux]) {
    testWidgets('gamepad navigates consent and returns to gameplay on $platform', (tester) async {
      debugDefaultTargetPlatformOverride = platform;
      final prefs = UserPreferences(GetIt.instance<PreferenceStore>());
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      await prefs.set(UserPreferences.gamepadNavigationEnabled, true);
      final previousNormalizer = Gamepads.normalizer;
      // Use named Windows button events on both host-independent test paths.
      Gamepads.normalizer = GamepadNormalizer.forPlatform(GamepadPlatform.windows);
      final downloads = _FakeCoreDownloads();
      final suppressionDepth = GamepadSuppressor.depth.value;
      try {
        await tester.pumpWidget(MaterialApp(
          builder: (context, child) => GamepadNavigationScope(child: child!),
          home: NativeGamePlayerScreen(
            libraryId: 'lib1', gameId: 'game1', core: 'n64',
            player: player, coreDownloads: downloads,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ));
        await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
        await tester.pump(const Duration(milliseconds: 500));
        expect(GamepadSuppressor.depth.value, suppressionDepth);
        final downloadFocus = FocusManager.instance.primaryFocus;
        await pressPad(tester, 'dpadUp');
        expect(FocusManager.instance.primaryFocus, isNot(same(downloadFocus)));
        await pressPad(tester, 'a');
        expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isTrue);
        expect(player.inputMasks, isEmpty,
          reason: 'Dialog navigation must not also reach gameplay input');
        expect(downloads.downloads, 0);

        await pressPad(tester, 'dpadDown');
        if (platform == TargetPlatform.windows) {
          // With two actions, Down reaches Use EmulatorJS; Right reaches Download.
          expect(FocusManager.instance.primaryFocus, isNot(same(downloadFocus)));
          await pressPad(tester, 'dpadRight');
        }
        expect(FocusManager.instance.primaryFocus, same(downloadFocus));
        await pressPad(tester, 'a');
        await advanceStartup(tester, () => find.byType(Texture).evaluate().isNotEmpty);
        expect(downloads.downloads, 1);
        expect(GamepadSuppressor.depth.value, suppressionDepth + 1);
        player.inputMasks.clear();
        await pressPad(tester, 'x');
        expect(player.inputMasks, contains(1 << 1),
          reason: 'Gamepad input must resume after the dialog closes');
      } finally {
        await tester.pumpWidget(const SizedBox());
        Gamepads.normalizer = previousNormalizer;
        debugDefaultTargetPlatformOverride = null;
      }
      expect(GamepadSuppressor.depth.value, suppressionDepth);
    });
  }

  for (final (platform, action) in [
    (TargetPlatform.windows, 'Use EmulatorJS'),
    (TargetPlatform.windows, 'Back'),
    (TargetPlatform.linux, 'Back'),
  ]) {
    testWidgets('gamepad can choose $action in consent on $platform', (tester) async {
      debugDefaultTargetPlatformOverride = platform;
      final prefs = UserPreferences(GetIt.instance<PreferenceStore>());
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      await prefs.set(UserPreferences.gamepadNavigationEnabled, true);
      final previousNormalizer = Gamepads.normalizer;
      Gamepads.normalizer = GamepadNormalizer.forPlatform(GamepadPlatform.windows);
      final downloads = _FakeCoreDownloads();
      final router = sessionRouter(downloads);
      final suppressionDepth = GamepadSuppressor.depth.value;
      try {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
          builder: (context, child) => GamepadNavigationScope(child: child!),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ));
        unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game1', core: 'n64')));
        await tester.pump();
        await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
        await tester.pump(const Duration(milliseconds: 500));
        if (action == 'Use EmulatorJS') {
          await pressPad(tester, 'dpadLeft');
          await pressPad(tester, 'a');
        } else {
          await pressPad(tester, 'b');
        }
        await tester.pumpAndSettle();
        expect(find.byType(AlertDialog), findsNothing);
        expect(find.text(action == 'Back' ? 'game details' : 'fallback session'), findsOneWidget);
        expect(downloads.downloads, 0);
        expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
        expect(player.inputMasks, isEmpty);
        expect(GamepadSuppressor.depth.value, suppressionDepth);
      } finally {
        await tester.pumpWidget(const SizedBox());
        router.dispose();
        Gamepads.normalizer = previousNormalizer;
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  testWidgets('disposing with consent open preserves another suppression owner', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    final suppressionDepth = GamepadSuppressor.depth.value;
    try {
      await pumpInstallingPlayer(tester, _FakeCoreDownloads());
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(GamepadSuppressor.depth.value, suppressionDepth);
      // Another screen can take ownership while this player's dialog is open.
      GamepadSuppressor.push();
      try {
        await tester.pumpWidget(const SizedBox());
        await tester.pump();
        expect(GamepadSuppressor.depth.value, suppressionDepth + 1);
      } finally {
        GamepadSuppressor.pop();
      }
    } finally {
      await tester.pumpWidget(const SizedBox());
      debugDefaultTargetPlatformOverride = null;
    }
    expect(GamepadSuppressor.depth.value, suppressionDepth);
  });

  for (final platform in [TargetPlatform.macOS, TargetPlatform.iOS]) {
    testWidgets('bundled platforms never offer downloads on $platform', (tester) async {
      debugDefaultTargetPlatformOverride = platform;
      final downloads = _FakeCoreDownloads();
      try {
        expect(supportsCoreDownloads, isFalse);
        await pumpInstallingPlayer(tester, downloads, core: 'nes');
        await advanceStartup(tester, () => find.byType(Texture).evaluate().isNotEmpty);
        expect(find.byType(AlertDialog), findsNothing);
        expect(downloads.downloads, 0);
        expect(downloads.downloadPromptChoice('fceumm'), isNull);
      } finally {
        await tester.pumpWidget(const SizedBox());
        // Drain the delayed analog-capability probe scheduled during startup.
        await tester.pump(const Duration(seconds: 1));
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  testWidgets('unavailable core never offers a download', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads()..available = false;
    try {
      await pumpInstallingPlayer(tester, downloads);
      await advanceStartup(tester, () => find.text('This system is not supported on this device.').evaluate().isNotEmpty);
      expect(find.byType(AlertDialog), findsNothing);
      expect(downloads.downloads, 0);
      expect(player.loadCount, 0);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox());
      debugDefaultTargetPlatformOverride = null;
    }
  });

  for (final action in ['Back', 'Use EmulatorJS', 'Download']) {
    testWidgets('unchecked $action allows the prompt on a later launch', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setTvMode(true);
      final downloads = _FakeCoreDownloads()..fail = true;
      final router = sessionRouter(downloads);
      try {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ));
        final launch = Destinations.gamePlayerOf('lib1', 'game1', core: 'n64');
        unawaited(router.push<void>(launch));
        await tester.pump();
        await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
        expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isFalse);
        if (action == 'Use EmulatorJS') {
          // Unchecking again must undo the opt-out before the action is taken.
          await tester.tap(find.byType(CheckboxListTile));
          await tester.pump();
          await tester.tap(find.byType(CheckboxListTile));
          await tester.pump();
        }
        if (action == 'Download') {
          await acceptCoreDownload(tester);
          await advanceStartup(tester, () => find.text('Retry').evaluate().isNotEmpty);
          expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
        } else if (action == 'Back') {
          await tester.binding.handlePopRoute();
          await tester.pumpAndSettle();
        } else {
          await tester.tap(find.text(action));
          await tester.pumpAndSettle();
        }
        expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
        expect(usesNativeGameBackendFor('n64'), isTrue);
        if (action != 'Back') {
          router.pop();
          await tester.pumpAndSettle();
        }
        expect(find.text('game details'), findsOneWidget);
        unawaited(router.push<void>(launch));
        await tester.pump();
        await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
        expect(downloads.downloads, action == 'Download' ? 1 : 0);
        expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isFalse);
      } finally {
        await tester.pumpWidget(const SizedBox());
        router.dispose();
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  testWidgets('refusal is remembered per core until manual installation', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    final downloads = _FakeCoreDownloads();
    final router = sessionRouter(downloads);
    final store = GetIt.instance<PreferenceStore>();
    try {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
      final launch = Destinations.gamePlayerOf('lib1', 'game1', core: 'n64');
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(find.text('Download native core for Nintendo 64?'), findsOneWidget);
      expect(find.text('Don’t show this again for this missing core'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
      expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
      expect(downloads.downloads, 0);
      expect(player.loadCount, 0);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isFalse);

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pump();
      await tester.tap(find.widgetWithText(OutlinedButton, fallbackLabel));
      await tester.pumpAndSettle();
      expect(find.text('fallback session'), findsOneWidget);
      expect(downloads.downloads, 0);
      expect(CoreDownloadService(store).downloadPromptChoice('mupen64plus_next'),
          CoreDownloadPromptChoice.emulatorJs);
      expect(gameStateKey('game1', 'n64'), 'ejs-n64-game1');
      expect(gamesApi.backendOverrideWrites, 0);

      router.pop();
      await tester.pumpAndSettle();
      // Another game on the same console shares the remembered choice.
      unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game2', core: 'n64')));
      await tester.pumpAndSettle();
      expect(find.text('fallback session'), findsOneWidget);
      expect(find.byType(AlertDialog), findsNothing);
      expect(downloads.downloads, 0);
      router.pop();
      await tester.pumpAndSettle();

      unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game3', core: 'snes')));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(find.text('Download native core for Super Nintendo?'), findsOneWidget);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('game details'), findsOneWidget);

      // Simulate a manual install, including the downloader's installed record.
      await tester.runAsync(() async {
        final directory = await coresDirectory();
        await directory.create(recursive: true);
        await File('${directory.path}/${coreFileName('mupen64plus_next')}').writeAsBytes([1]);
        await store.setStringList(installedCoresPreferenceKey, ['mupen64plus_next']);
      });
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(Texture).evaluate().isNotEmpty);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(NativeGamePlayerScreen), findsOneWidget);
      expect(downloads.downloads, 0);
      expect(gameStateKey('game1', 'n64'), 'lr-n64-game1');
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('Back discards a checked opt-out and offers the prompt next time', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads();
    final router = sessionRouter(downloads);
    try {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
      final launch = Destinations.gamePlayerOf('lib1', 'game1', core: 'n64');
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pump();
      expect(find.text('Cancel'), findsNothing);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('game details'), findsOneWidget);
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, isFalse);
      expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
      expect(downloads.downloads, 0);
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('native-only platforms offer download without EmulatorJS', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    final downloads = _FakeCoreDownloads();
    final router = sessionRouter(downloads);
    try {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
      unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game1', core: 'n64')));
      await tester.pump();
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(find.widgetWithText(FilledButton, 'Download'), findsOneWidget);
      expect(find.text(fallbackLabel), findsNothing);
      expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
      expect(downloads.downloads, 0);
      expect(find.text('Cancel'), findsNothing);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('game details'), findsOneWidget);
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('native-only missing core shows guidance after hiding the download offer', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    final downloads = _FakeCoreDownloads();
    await downloads.recordDownloadPromptChoice('mupen64plus_next', CoreDownloadPromptChoice.download);
    final router = sessionRouter(downloads);
    try {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
      unawaited(router.push<void>(Destinations.gamePlayerOf('lib1', 'game1', core: 'n64')));
      await tester.pump();
      await advanceStartup(tester, () => find.textContaining('Settings > Playback > Emulator Cores').evaluate().isNotEmpty);
      expect(find.byType(NativeGamePlayerScreen), findsOneWidget);
      expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text(fallbackLabel), findsNothing);
      expect(find.text('Retry'), findsNothing);
      expect(downloads.downloads, 0);
      expect(player.loadCount, 0);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('game details'), findsOneWidget);
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('checked acceptance hides prompts after core removal', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    final downloads = _FakeCoreDownloads();
    final router = sessionRouter(downloads);
    try {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ));
      final launch = Destinations.gamePlayerOf('lib1', 'game1', core: 'n64');
      unawaited(router.push<void>(launch));
      await tester.pump();
      await acceptCoreDownload(tester, dontShowAgain: true);
      await advanceStartup(tester, () => find.byType(Texture).evaluate().isNotEmpty);
      expect(downloads.downloads, 1);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), CoreDownloadPromptChoice.download);
      router.pop();
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        final directory = await coresDirectory();
        await File('${directory.path}/${coreFileName('mupen64plus_next')}').delete();
      });
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(tester, () => find.text('fallback session').evaluate().isNotEmpty);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text('The native core for this system is not installed.'), findsNothing);
      expect(downloads.downloads, 1);
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  for (final platform in [TargetPlatform.android, TargetPlatform.iOS]) {
    testWidgets('real fallback retains playback protection on $platform', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = platform;
      PlatformDetection.setTvMode(platform == TargetPlatform.android);
      final screensaver = _RecordingScreensaver();
      GetIt.instance.registerSingleton<ScreensaverController>(screensaver);
      final orientations = <List<dynamic>>[];
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
        if (call.method == 'SystemChrome.setPreferredOrientations') {
          orientations.add(List<dynamic>.from(call.arguments as List));
        }
        return null;
      });
      const gamepadChannel = MethodChannel('org.moonfin.androidtv/gamepad');
      messenger.setMockMethodCallHandler(gamepadChannel, (_) async => null);
      final router = sessionRouter(_FakeCoreDownloads(), realFallback: true);
      try {
        await tester.pumpWidget(
          MaterialApp.router(
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        );
        unawaited(router.push<void>(
          Destinations.gamePlayerOf('lib1', 'game1', core: 'mame'),
        ));
        await tester.pumpAndSettle();
        expect(screensaver.playbackActive, isTrue);

        // Exercise the real destination's lifecycle without creating a native
        // WebView in the widget harness. Playback protection is acquired before
        // this server-capability check.
        when(() => client.gamesApi).thenReturn(null);
        await tester.tap(find.text(fallbackLabel));
        await tester.pumpAndSettle();
        expect(find.byType(GameEmulatorScreen), findsOneWidget);
        expect(find.byType(NativeGamePlayerScreen), findsNothing);
        expect(screensaver.playbackActive, isTrue);
        if (platform == TargetPlatform.iOS) {
          expect(orientations.last, [
            'DeviceOrientation.landscapeLeft',
            'DeviceOrientation.landscapeRight',
          ]);
        }

        router.pop();
        await tester.pumpAndSettle();
        expect(screensaver.playbackActive, isFalse);
        if (platform == TargetPlatform.iOS) {
          expect(orientations.last, DeviceOrientation.values
              .map((orientation) => orientation.toString()).toList());
        }
      } finally {
        await tester.pumpWidget(const SizedBox());
        router.dispose();
        messenger.setMockMethodCallHandler(gamepadChannel, null);
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  testWidgets('hidden prompt uses fallback on later launches after download failure', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads()..fail = true;
    final router = sessionRouter(downloads);
    try {
      final store = GetIt.instance<PreferenceStore>();
      final preferences = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(preferences);
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
      final launch = Destinations.gamePlayerOf(
        'lib1',
        'game1',
        core: 'n64',
        name: 'Test Game',
        romFileName: 'original.sfc',
        biosId: 'bios-token',
        startFresh: true,
      );
      unawaited(router.push<void>(launch));
      await tester.pump();
      await acceptCoreDownload(tester, dontShowAgain: true);
      await advanceStartup(
        tester,
        () => find.text('Retry').evaluate().isNotEmpty,
      );
      expect(find.textContaining('Settings > Playback > Emulator Cores'), findsOneWidget);
      expect(find.text('fallback session'), findsNothing);
      await tester.tap(find.text(fallbackLabel));
      await tester.pumpAndSettle();

      expect(find.text('fallback session'), findsOneWidget);
      expect(player.stopCount, 1);
      final uri = GoRouterState.of(
        tester.element(find.text('fallback session')),
      ).uri;
      expect(uri.path, '/game-player/lib1/game1');
      expect(uri.queryParameters, containsPair('backend', 'emulatorjs'));
      expect(uri.queryParameters, containsPair('romFile', 'game.sfc'));
      expect(uri.queryParameters, containsPair('bios', 'bios-token'));
      expect(uri.queryParameters, containsPair('name', 'Test Game'));
      expect(uri.queryParameters, containsPair('core', 'n64'));
      expect(uri.queryParameters, containsPair('fresh', '1'));
      expect(preferences.get(UserPreferences.useNativeEmulator), isTrue);
      expect(gamesApi.backendOverrideWrites, 0);
      expect(gamesApi.saves, isEmpty);

      router.pop();
      await tester.pumpAndSettle();
      expect(find.text('game details'), findsOneWidget);
      unawaited(router.push<void>(launch));
      await tester.pump();
      await advanceStartup(
        tester,
        () => find.text('fallback session').evaluate().isNotEmpty,
      );
      expect(find.byType(NativeGamePlayerScreen), findsNothing);
      expect(downloads.downloads, 1);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text('The native core for this system is not installed.'), findsNothing);
    } finally {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('fallback after a fatal error waits for native teardown', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    final router = sessionRouter(_FakeCoreDownloads());
    try {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
      unawaited(
        router.push<void>(
          Destinations.gamePlayerOf(
            'lib1',
            'game1',
            core: 'snes',
            startFresh: true,
          ),
        ),
      );
      await tester.pump();
      await advanceStartup(
        tester,
        () => find.byType(Texture).evaluate().isNotEmpty,
      );
      player.stopGate = Completer<void>();
      player.emitError('Core stopped working');
      await tester.pump();
      await tester.tap(find.text(fallbackLabel));
      await tester.pump();
      expect(find.text('fallback session'), findsNothing);
      expect(
        tester
            .widget<OutlinedButton>(
              find.widgetWithText(OutlinedButton, fallbackLabel),
            )
            .onPressed,
        isNull,
      );
      expect(player.stopCount, 1);

      player.stopGate!.complete();
      await advanceStartup(
        tester,
        () => find.text('fallback session').evaluate().isNotEmpty,
      );
      expect(player.stopCount, 1);
      expect(gamesApi.backendOverrideWrites, 0);
    } finally {
      if (player.stopGate case final gate? when !gate.isCompleted) {
        gate.complete();
      }
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('fallback is hidden on platforms without EmulatorJS', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      await pumpInstallingPlayer(tester, _FakeCoreDownloads(), core: 'mame');
      await tester.pump();
      expect(find.text('This system is not supported yet.'), findsOneWidget);
      expect(find.text(fallbackLabel), findsNothing);
    } finally {
      await tester.pumpWidget(const SizedBox());
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets(
    'unsupported systems show an error without installing or starting',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final downloads = _FakeCoreDownloads();
      try {
        await pumpInstallingPlayer(tester, downloads, core: 'mame');
        await tester.pump();
        expect(find.text('This system is not supported yet.'), findsOneWidget);
        expect(downloads.downloads, 0);
        expect(player.loadCount, 0);
      } finally {
        await tester.pumpWidget(const SizedBox());
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

  testWidgets('installs a missing native core with progress before starting', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads()..gate = Completer<void>();
    try {
      await pumpInstallingPlayer(tester, downloads, core: 'n64');
      await advanceStartup(tester, () => find.byType(AlertDialog).evaluate().isNotEmpty);
      expect(downloads.downloads, 0);
      await acceptCoreDownload(tester);
      await advanceStartup(tester, () => downloads.downloads == 1);
      expect(find.text('Installing emulator…'), findsOneWidget);
      expect(
        tester
            .widget<LinearProgressIndicator>(
              find.byType(LinearProgressIndicator),
            )
            .value,
        0.5,
      );
      expect(player.loadCount, 0);

      downloads.gate!.complete();
      await advanceStartup(
        tester,
        () => find.byType(Texture).evaluate().isNotEmpty,
      );
      expect(downloads.downloads, 1);
      expect(player.loadCount, 1);
      expect(downloads.downloadPromptChoice('mupen64plus_next'), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox());
      // Upstream schedules a one-second touch-controller capability refresh.
      await tester.pump(const Duration(seconds: 1));
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('reuses an installed native core without downloading', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads();
    try {
      await tester.runAsync(() async {
        final dir = await coresDirectory();
        await dir.create(recursive: true);
        await File('${dir.path}/${coreFileName('mupen64plus_next')}').writeAsBytes([1]);
      });
      await pumpInstallingPlayer(tester, downloads);
      await advanceStartup(
        tester,
        () => find.byType(Texture).evaluate().isNotEmpty,
      );
      expect(downloads.downloads, 0);
      expect(player.loadCount, 1);
      expect(find.byType(AlertDialog), findsNothing);
    } finally {
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 1));
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('a failed core install offers Retry and stays on native', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final downloads = _FakeCoreDownloads()..fail = true;
    try {
      await pumpInstallingPlayer(tester, downloads);
      await acceptCoreDownload(tester);
      await advanceStartup(
        tester,
        () => find.text('Retry').evaluate().isNotEmpty,
      );
      expect(player.loadCount, 0);
      expect(find.byType(Texture), findsNothing);
      expect(find.textContaining('WebView'), findsNothing);

      downloads.fail = false;
      await tester.tap(find.text('Retry'));
      await advanceStartup(
        tester,
        () => find.byType(Texture).evaluate().isNotEmpty,
      );
      expect(downloads.downloads, 2);
      expect(player.loadCount, 1);
    } finally {
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 1));
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets(
    'leaving during core installation cancels it without starting playback',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final downloads = _FakeCoreDownloads()..gate = Completer<void>();
      try {
        await pumpInstallingPlayer(tester, downloads);
        await acceptCoreDownload(tester);
        await advanceStartup(tester, () => downloads.downloads == 1);
        await tester.pumpWidget(const SizedBox());
        expect(downloads.token!.isCancelled, isTrue);
        downloads.gate!.complete();
        await tester.runAsync(() async => await downloads.token!.whenCancel);
        await tester.pump();
        expect(player.loadCount, 0);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

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
      final sent = jsonDecode(
        controllerMappingsPayload({pad: mapping}, gameId),
      ) as Map<String, dynamic>;

      expect(sent[pad], {'190': RetroPadButton.a.retroPadIndex});
    });

    test('sends the default for a game that has not diverged', () {
      final sent = jsonDecode(
        controllerMappingsPayload({pad: mapping}, 'burgertime'),
      ) as Map<String, dynamic>;

      expect(sent[pad], {'96': RetroPadButton.a.retroPadIndex});
    });

    test('sends a table for every connected profile', () {
      final sent = jsonDecode(
        controllerMappingsPayload({
          pad: mapping,
          'android-p2': NativeControllerMapping.empty.withBindingForGame(
            gameId,
            191,
            RetroPadButton.b,
          ),
        }, gameId),
      ) as Map<String, dynamic>;

      expect(sent.keys, containsAll(<String>[pad, 'android-p2']));
      expect(sent['android-p2'], {'191': RetroPadButton.b.retroPadIndex});
    });

    test('emits keycodes only, no metadata the parser would skip', () {
      final sent = jsonDecode(
        controllerMappingsPayload({pad: mapping}, gameId),
      ) as Map<String, dynamic>;

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

  test('a rebound face button still resolves, and one binding does not move another', () {
    final mapping = NativeControllerMapping(const {1000: RetroPadButton.y});

    expect(
      desktopBoundBit(mapping, GamepadButton.a),
      1 << RetroPadButton.y.retroPadIndex,
    );
    expect(desktopBoundBit(mapping, GamepadButton.b), isNull);
    expect(desktopBoundBit(mapping, GamepadButton.leftTrigger), isNull);
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
                hardwareRenderingEnabled: false,
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
        expect(player.hardwareRenderingEnabled, isFalse);

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

  group('PlayStation discs', () {
    // Opens a zipped PlayStation game through the real _prepare() flow and
    // waits until it either starts or shows an error.
    Future<void> openZippedDisc(
      WidgetTester tester,
      Map<String, List<int>> files,
    ) async {
      final zip = Archive();
      files.forEach((name, bytes) => zip.add(ArchiveFile.bytes(name, bytes)));
      gamesApi.romBytes = ZipEncoder().encodeBytes(zip);
      gamesApi.detail = const GameDetail(
        id: 'game1',
        title: 'Crash Bandicoot (USA)',
        system: 'PlayStation',
        core: 'psx',
        fileName: 'Crash Bandicoot (USA).zip',
        sizeBytes: 0,
        bios: [],
      );
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: NativeGamePlayerScreen(
            libraryId: 'lib1',
            gameId: 'game1',
            core: 'psx',
            startFresh: true,
            hardwareRenderingEnabled: false,
            player: player,
          ),
        ),
      );
      for (
        var i = 0;
        i < 60 &&
            find.byType(Texture).evaluate().isEmpty &&
            find.textContaining('PlayStation disc image').evaluate().isEmpty;
        i++
      ) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump(const Duration(milliseconds: 20));
      }
    }

    testWidgets('a cue/bin zip unpacks every track and loads the .cue', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      try {
        await openZippedDisc(tester, {
          'Crash Bandicoot (USA).cue': utf8.encode(
            'FILE "Crash Bandicoot (USA).bin" BINARY\n',
          ),
          'Crash Bandicoot (USA).bin': List<int>.filled(4096, 7),
        });

        expect(find.byType(Texture), findsOneWidget);
        expect(player.romPath, endsWith('Crash Bandicoot (USA).cue'));
        final bin = File(
          '${File(player.romPath!).parent.path}/Crash Bandicoot (USA).bin',
        );
        expect(await tester.runAsync(bin.length), 4096);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });

    testWidgets('a zip with no disc image says so instead of starting', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      try {
        await openZippedDisc(tester, {
          'GZnkJzlCwmDBOkwvDBGq.pkg': List<int>.filled(4096, 7),
        });

        expect(find.textContaining('PlayStation disc image'), findsOneWidget);
        expect(player.romPath, isNull);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });
  });

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

  testWidgets('Save & exit shows a saving indicator and saves the state once', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    try {
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
      for (var i = 0; i < 60 && find.byType(Texture).evaluate().isEmpty; i++) {
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

      final pending = Completer<Uint8List?>();
      player.pendingSaveState = pending;
      await tester.tap(find.text('Save & exit'));
      await tester.pump();

      expect(find.text('Saving…'), findsOneWidget);
      expect(find.byType(NativeGamePlayerScreen), findsOneWidget);

      pending.complete(Uint8List.fromList([1, 2, 3]));
      // The indicator's spinner never settles, so pump in steps.
      for (var i = 0; i < 20 && find.text('home').evaluate().isEmpty; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(find.text('home'), findsOneWidget);
      expect(player.saveStateCount, 1);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets(
    'returning from an emulator option keeps and centers its cursor',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      try {
        player.options = [
          for (var i = 0; i < 8; i++)
            GameCoreOption(
              id: 'option-$i',
              label: 'Option $i',
              current: 'Default',
              choices: const ['Default', 'Alternate'],
            ),
        ];
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
          find.text('Emulator settings'),
          200,
          scrollable: find.byType(Scrollable).last,
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Emulator settings'));
        await tester.pumpAndSettle();

        for (var i = 0; i < 6; i++) {
          player.emitButton(5, true);
          await tester.pump();
        }
        expect(_highlightedOverlayRowLabel(tester), startsWith('Option 6:'));

        player.emitButton(0, true);
        await tester.pumpAndSettle();
        expect(find.text('Alternate'), findsOneWidget);

        player.emitButton(8, true);
        await tester.pumpAndSettle();

        expect(_highlightedOverlayRowLabel(tester), startsWith('Option 6:'));
        final position = tester
            .state<ScrollableState>(find.byType(Scrollable).last)
            .position;
        final expected = (6 * 58 - (position.viewportDimension - 58) / 2)
            .clamp(position.minScrollExtent, position.maxScrollExtent)
            .toDouble();
        expect(position.pixels, closeTo(expected, 1));
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );

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
      for (var i = 0; i < 7; i++) {
        player.emitButton(5, true);
        await tester.pump();
      }
      player.emitButton(0, true);
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
      await tester.pumpAndSettle();

      expect(
        find.text('Leave with Player 1 vacant'),
        findsNothing,
        reason: 'confirming must resolve the dialog, not leave it stranded',
      );
      expect(
        tester.widget<Text>(find.text('Controller mapping')).style?.color,
        Colors.black,
      );
      final position = tester
          .state<ScrollableState>(find.byType(Scrollable).last)
          .position;
      final expected = (7 * 58 - (position.viewportDimension - 58) / 2)
          .clamp(position.minScrollExtent, position.maxScrollExtent)
          .toDouble();
      expect(position.pixels, closeTo(expected, 1));
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
