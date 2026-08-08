import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_cache.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_data_source.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_transport.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/games/game_detail_screen.dart';
import 'package:moonfin/ui/widgets/game/retro_artwork_image.dart';
import 'package:moonfin/util/game_cores.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockGamesApi extends Mock implements GamesApi {}

/// Fully controllable [RetroArtworkDataSource] fake. [notifyChanged] lets a
/// test simulate an async artwork update completing while the widget tree is
/// otherwise idle, without a real network round trip.
class _FakeArtworkDataSource implements RetroArtworkDataSource {
  final Map<String, RetroArtworkImageReference> _images =
      <String, RetroArtworkImageReference>{};
  final Set<RetroArtworkSnapshotListener> _listeners =
      <RetroArtworkSnapshotListener>{};
  RetroArtworkSystemSnapshot? _snapshot;

  void seedImage(String gameId, RetroArtworkSource source) {
    _images[gameId] = RetroArtworkImageReference.manifest(source);
  }

  void notifyChanged() {
    for (final listener
        in List<RetroArtworkSnapshotListener>.of(_listeners)) {
      listener();
    }
  }

  @override
  RetroArtworkProtocol get protocol => RetroArtworkProtocol.manifest;

  @override
  RetroArtworkSystemSnapshot? get snapshot => _snapshot;

  @override
  void addSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.add(listener);

  @override
  void removeSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.remove(listener);

  @override
  Future<RetroArtworkSystemSnapshot> refreshSystem({
    required String libraryId,
    required String systemId,
  }) async {
    return _snapshot ??= RetroArtworkSystemSnapshot(
      libraryId: libraryId,
      systemId: systemId,
      generation: 'gen-1',
    );
  }

  @override
  RetroArtworkImageReference? imageFor(
    String gameId, {
    String role = 'boxart',
  }) => _images[gameId];

  @override
  Future<void> submitActiveBandPriority(
    Iterable<String> orderedGameIds, {
    Iterable<String> roles = const <String>['boxart'],
    int? planGeneration,
  }) async {}

  @override
  void reportImageFailure(
    String gameId, {
    String role = 'boxart',
    int? statusCode,
  }) {}

  @override
  void reportImageLoaded(String gameId, {String role = 'boxart'}) {}

  @override
  void onRouteCovered() {}

  @override
  void onRouteReentered() {}

  @override
  void onAppResumed() {}

  @override
  void dispose() {}
}

/// A transport whose HTTP layer is entirely in-memory, so this widget test
/// never touches the network.
class _FakeArtworkHttpClient implements RetroArtworkHttpClient {
  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) async => Uint8List(0);

  @override
  void close() {}
}

/// Registers a [PreferenceStore] with [installedCores] recorded as
/// downloaded, so [nativeCoreReachable] reports true for any core mapped to
/// one of them.
Future<void> _registerInstalledCores(List<String> installedCores) async {
  SharedPreferences.setMockInitialValues(const {});
  final store = PreferenceStore();
  await store.init();
  await store.setStringList(installedCoresPreferenceKey, installedCores);
  GetIt.instance.registerSingleton<PreferenceStore>(store);
  GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
}

/// Builds a [GameDetail] fixture for these tests. Named defaults mirror
/// [GameDetail]'s own constructor defaults (null/const[]/false) for every
/// optional field EXCEPT the always-required identity fields, which default
/// to this file's common "BurgerTime" fixture purely for brevity.
///
/// Deliberately does NOT default `recommendedCore`/`availableCores` to
/// non-null values: several tests below rely on the server *omitting* those
/// fields (e.g. the "predates backend overrides" regression guard), and a
/// convenience default here would silently paper over exactly the kind of
/// default-value gap this builder replaced 7+ near-identical literals to
/// stop hiding (see Task B1).
GameDetail _gameDetail({
  String id = 'game',
  String title = 'BurgerTime',
  String system = 'MAME',
  String core = 'arcade',
  String fileName = 'btime2.zip',
  int sizeBytes = 1,
  List<GameBios> bios = const [],
  String? recommendedCore,
  List<String> availableCores = const [],
  bool? supportsCoreOverrides,
  bool supportsBackendOverrides = false,
  String? userCoreOverride,
  String? userBackendOverride,
  String? coreCompatibilityReason,
}) => GameDetail(
  id: id,
  title: title,
  system: system,
  core: core,
  fileName: fileName,
  sizeBytes: sizeBytes,
  bios: bios,
  recommendedCore: recommendedCore,
  availableCores: availableCores,
  supportsCoreOverrides: supportsCoreOverrides,
  supportsBackendOverrides: supportsBackendOverrides,
  userCoreOverride: userCoreOverride,
  userBackendOverride: userBackendOverride,
  coreCompatibilityReason: coreCompatibilityReason,
);

/// Stubs `setGameBackendOverride` to succeed with the detail already
/// carrying the EmulatorJS backend override, matching what picking a
/// non-native row commits server-side. Several picker tests below share this
/// exact response shape.
void _stubBackendOverrideToEmulatorJs(_MockGamesApi gamesApi) {
  when(
    () => gamesApi.setGameBackendOverride(
      'library',
      'game',
      backend: 'emulatorjs',
    ),
  ).thenAnswer(
    (_) async => _gameDetail(
      system: 'Arcade',
      recommendedCore: 'arcade',
      availableCores: const ['arcade', 'mame'],
      userBackendOverride: 'emulatorjs',
    ),
  );
}

/// Stubs `setGameCoreOverride` to succeed with the detail carrying both the
/// MAME core override and the EmulatorJS backend override set by
/// [_stubBackendOverrideToEmulatorJs], matching the "picking MAME forces
/// EmulatorJS" flow used by several picker tests.
void _stubCoreOverrideToMame(_MockGamesApi gamesApi) {
  when(
    () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
  ).thenAnswer(
    (_) async => _gameDetail(
      system: 'Arcade',
      core: 'mame',
      recommendedCore: 'arcade',
      userCoreOverride: 'mame',
      userBackendOverride: 'emulatorjs',
      availableCores: const ['arcade', 'mame'],
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockGamesApi gamesApi;

  setUp(() async {
    await GetIt.instance.reset();
    client = _MockMediaServerClient();
    gamesApi = _MockGamesApi();

    when(() => client.gamesApi).thenReturn(gamesApi);
    when(() => gamesApi.getGame('library', 'game')).thenAnswer(
      (_) async => _gameDetail(
        recommendedCore: 'arcade',
        availableCores: const ['arcade', 'mame'],
      ),
    );
    when(() => gamesApi.getSave(any())).thenAnswer((_) async => null);
    when(
      () => gamesApi.getGames(any(), system: any(named: 'system')),
    ).thenAnswer((_) async => const []);
    when(
      () => gamesApi.thumbUrl(
        libraryId: any(named: 'libraryId'),
        gameId: any(named: 'gameId'),
        kind: any(named: 'kind'),
      ),
    ).thenReturn('https://example.invalid/game-art');

    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
  });

  Future<void> pumpDetailScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const GameDetailScreen(libraryId: 'library', gameId: 'game'),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  testWidgets('related art stays on the detail screen legacy adapter', (
    tester,
  ) async {
    await _registerInstalledCores(const []);
    when(() => gamesApi.getGames('library', system: 'MAME')).thenAnswer(
      (_) async => const [
        GameSummary(
          id: 'related',
          title: 'Tapper',
          system: 'MAME',
          core: 'arcade',
          fileName: 'tapper.zip',
        ),
      ],
    );

    await pumpDetailScreen(tester);
    await tester.pump();

    expect(find.text('More in MAME'), findsOneWidget);
    verify(
      () => gamesApi.thumbUrl(
        libraryId: 'library',
        gameId: 'related',
        kind: 'boxart',
      ),
    ).called(greaterThan(0));
  });

  testWidgets('Down from the app bar focuses the primary play action', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1280, 720));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await pumpDetailScreen(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    expect(find.byType(BackButton), findsOneWidget);
    expect(
      FocusManager.instance.primaryFocus!.context!
          .findAncestorWidgetOfExactType<BackButton>(),
      isNotNull,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();

    final playButton = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Play'),
    );
    expect(playButton.focusNode, isNotNull);
    expect(playButton.focusNode!.hasFocus, isTrue);
  });

  testWidgets('selecting a core stores the override and updates the detail', (
    tester,
  ) async {
    // No PreferenceStore is registered, so neither 'arcade' nor 'mame' is a
    // reachable native core here — both rows land on EmulatorJS, matching
    // the picker's "only genuinely reachable outcomes" rule.
    _stubBackendOverrideToEmulatorJs(gamesApi);
    _stubCoreOverrideToMame(gamesApi);

    await pumpDetailScreen(tester);

    await tester.tap(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.text('FBNeo'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Choose player'), findsOneWidget);
    final mameOption = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.text('MAME'),
    );
    expect(mameOption, findsOneWidget);

    await tester.tap(mameOption);
    await tester.pump();

    // Picking the MAME row must force both the backend and the core.
    verify(
      () => gamesApi.setGameBackendOverride(
        'library',
        'game',
        backend: 'emulatorjs',
      ),
    ).called(1);
    verify(
      () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
    ).called(1);
    expect(find.text('MAME'), findsAtLeastNWidgets(1));
  });

  testWidgets('keeps the detail current when core update fails after backend', (
    tester,
  ) async {
    _stubBackendOverrideToEmulatorJs(gamesApi);
    when(
      () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
    ).thenThrow(StateError('core update failed'));

    await pumpDetailScreen(tester);
    await tester.tap(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.text('FBNeo'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text('MAME'),
      ),
    );
    await tester.pump();

    expect(find.text('WebView · EmulatorJS'), findsOneWidget);
    expect(find.textContaining('Could not change player'), findsOneWidget);
  });

  testWidgets(
    'selecting a core from the details panel stores the override and updates the detail',
    (tester) async {
      _stubBackendOverrideToEmulatorJs(gamesApi);
      _stubCoreOverrideToMame(gamesApi);

      await pumpDetailScreen(tester);

      // Scroll down to see the details panel
      // Find _CoreDetailRow by its unique chevron_right icon (private class can't be referenced)
      final coreDetailRowFinder = find.byIcon(Icons.chevron_right);
      await tester.ensureVisible(coreDetailRowFinder);
      await tester.pumpAndSettle();

      // Tap the core row in the details panel
      expect(coreDetailRowFinder, findsOneWidget);
      await tester.tap(coreDetailRowFinder);
      await tester.pumpAndSettle();

      expect(find.text('Choose player'), findsOneWidget);
      final mameOption = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text('MAME'),
      );
      expect(mameOption, findsOneWidget);

      await tester.tap(mameOption);
      await tester.pump();

      verify(
        () => gamesApi.setGameBackendOverride(
          'library',
          'game',
          backend: 'emulatorjs',
        ),
      ).called(1);
      verify(
        () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
      ).called(1);
      expect(find.text('MAME'), findsAtLeastNWidgets(1));
    },
  );

  testWidgets('core picker shows the server coreCompatibilityReason when present', (
    tester,
  ) async {
    when(() => gamesApi.getGame('library', 'game')).thenAnswer(
      (_) async => _gameDetail(
        recommendedCore: 'arcade',
        availableCores: const ['arcade', 'mame'],
        coreCompatibilityReason:
            'Validated against both installed FBNeo and MAME DATs; FBNeo is preferred.',
      ),
    );

    await pumpDetailScreen(tester);

    await tester.tap(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.text('FBNeo'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Choose player'), findsOneWidget);
    expect(
      find.text(
        'Validated against both installed FBNeo and MAME DATs; FBNeo is preferred.',
      ),
      findsOneWidget,
    );
  });

  group('generic (player, core) row generation', () {
    testWidgets('1943 (arcade): native FBNeo installed produces three distinct, '
        'unambiguous rows', (tester) async {
      await _registerInstalledCores(['fbneo']);

      when(() => gamesApi.getGame('library', 'game')).thenAnswer(
        (_) async => _gameDetail(
          title: '1943',
          fileName: '1943.zip',
          recommendedCore: 'mame',
          availableCores: const ['mame'],
        ),
      );
      when(
        () => gamesApi.setGameBackendOverride(
          'library',
          'game',
          backend: 'emulatorjs',
        ),
      ).thenAnswer(
        (_) async => _gameDetail(
          title: '1943',
          core: 'mame',
          recommendedCore: 'mame',
          userCoreOverride: 'mame',
          userBackendOverride: 'emulatorjs',
          availableCores: const ['mame'],
          fileName: '1943.zip',
        ),
      );
      when(
        () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
      ).thenAnswer(
        (_) async => _gameDetail(
          title: '1943',
          core: 'mame',
          recommendedCore: 'mame',
          userCoreOverride: 'mame',
          userBackendOverride: 'emulatorjs',
          availableCores: const ['mame'],
          fileName: '1943.zip',
        ),
      );

      await pumpDetailScreen(tester);

      await tester.tap(
        find.descendant(
          of: find.byType(FilledButton),
          matching: find.text('FBNeo'),
        ),
      );
      await tester.pumpAndSettle();

      final dialog = find.byType(AlertDialog);
      expect(dialog, findsOneWidget);

      // Exactly three rows: Native/FBNeo, EmulatorJS/MAME, EmulatorJS/FBNeo.
      expect(
        find.descendant(of: dialog, matching: find.text('Native core')),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: dialog,
          matching: find.text('EmulatorJS (WebView)'),
        ),
        findsNWidgets(2),
      );

      // Not validated against FBNeo (only MAME is in availableCores).
      expect(
        find.descendant(
          of: dialog,
          matching: find.text(
            'This archive is not validated for FBNeo and may not launch correctly.',
          ),
        ),
        findsNWidgets(2),
      );

      // MAME has no native mapping, so its recommendation lands on
      // EmulatorJS only.
      expect(
        find.descendant(of: dialog, matching: find.text('MAME (Recommended)')),
        findsOneWidget,
      );

      // Native FBNeo is the current effective outcome.
      expect(
        find.descendant(
          of: dialog,
          matching: find.byIcon(Icons.radio_button_checked),
        ),
        findsOneWidget,
      );

      // Selecting the MAME row must set backend to EmulatorJS explicitly.
      await tester.tap(
        find.descendant(of: dialog, matching: find.text('MAME (Recommended)')),
      );
      await tester.pump();

      verify(
        () => gamesApi.setGameBackendOverride(
          'library',
          'game',
          backend: 'emulatorjs',
        ),
      ).called(1);
      verify(
        () => gamesApi.setGameCoreOverride('library', 'game', core: 'mame'),
      ).called(1);
    });

    testWidgets(
      'Joust (MAME-only arcade game): FBNeo installed but not validated '
      'still produces a native FBNeo row and shows the picker',
      (tester) async {
        // MAME is the only core the server validated for this game.
        await _registerInstalledCores(['fbneo']);

        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async => _gameDetail(
            title: 'Joust',
            core: 'mame',
            fileName: 'joustr.zip',
            recommendedCore: 'mame',
            availableCores: const ['mame'],
          ),
        );

        await pumpDetailScreen(tester);

        expect(find.text('Choose player'), findsNothing);
        await tester.tap(
          find.descendant(
            of: find.byType(FilledButton),
            matching: find.text('MAME'),
          ),
        );
        await tester.pumpAndSettle();

        final dialog = find.byType(AlertDialog);
        expect(dialog, findsOneWidget);

        // Three rows: Native/FBNeo, EmulatorJS/MAME, EmulatorJS/FBNeo.
        expect(
          find.descendant(of: dialog, matching: find.text('Native core')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('EmulatorJS (WebView)'),
          ),
          findsNWidgets(2),
        );

        // Only MAME was validated, so both FBNeo rows carry the warning and
        // neither is tagged Recommended.
        expect(
          find.descendant(
            of: dialog,
            matching: find.text(
              'This archive is not validated for FBNeo and may not launch correctly.',
            ),
          ),
          findsNWidgets(2),
        );
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('FBNeo (Recommended)'),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('MAME (Recommended)'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Atari 2600: backend support produces native and EmulatorJS rows '
      'without writing an arcade core override',
      (tester) async {
        await _registerInstalledCores(['stella']);

        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async => _gameDetail(
            title: 'Adventure',
            system: 'Atari 2600',
            core: 'atari2600',
            fileName: 'adventure.a26',
            supportsBackendOverrides: true,
          ),
        );
        when(
          () => gamesApi.setGameBackendOverride(
            'library',
            'game',
            backend: 'emulatorjs',
          ),
        ).thenAnswer(
          (_) async => _gameDetail(
            title: 'Adventure',
            system: 'Atari 2600',
            core: 'atari2600',
            fileName: 'adventure.a26',
            userBackendOverride: 'emulatorjs',
            supportsBackendOverrides: true,
          ),
        );

        await pumpDetailScreen(tester);

        // The main screen's core button shows the raw core id here since
        // _coreLabel only special-cases the arcade family.
        await tester.tap(
          find.descendant(
            of: find.byType(FilledButton),
            matching: find.text('atari2600'),
          ),
        );
        await tester.pumpAndSettle();

        final dialog = find.byType(AlertDialog);
        expect(dialog, findsOneWidget);

        // Exactly two rows: one native, one EmulatorJS.
        expect(
          find.descendant(of: dialog, matching: find.text('Native core')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('EmulatorJS (WebView)'),
          ),
          findsOneWidget,
        );

        // availableCores is empty, so neither row carries a warning.
        expect(find.textContaining('not validated'), findsNothing);

        // Stella is mapped and installed, so native is Recommended. No
        // friendly display name for 'atari2600', so the subtitle is the raw
        // core id.
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('atari2600 (Recommended)'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(of: dialog, matching: find.text('atari2600')),
          findsOneWidget,
        );

        // Exactly one row is selected overall.
        expect(
          find.descendant(
            of: dialog,
            matching: find.byIcon(Icons.radio_button_checked),
          ),
          findsOneWidget,
        );

        await tester.tap(
          find.descendant(
            of: dialog,
            matching: find.text('EmulatorJS (WebView)'),
          ),
        );
        await tester.pump();

        verify(
          () => gamesApi.setGameBackendOverride(
            'library',
            'game',
            backend: 'emulatorjs',
          ),
        ).called(1);
        verifyNever(
          () => gamesApi.setGameCoreOverride(
            any(),
            any(),
            core: any(named: 'core'),
          ),
        );
      },
    );

    testWidgets(
      'EmulatorJS row is offered when the server predates backend overrides '
      '(non-arcade, availableCores only)',
      (tester) async {
        // Regression guard: supportsBackendOverrides defaults to false with
        // no fallback (unlike supportsCoreOverrides, which falls back to
        // availableCores.isNotEmpty). A legacy server that has not rolled
        // out backendOverrideSupported must still surface the EmulatorJS
        // row wherever the core-override channel is usable.
        await _registerInstalledCores(['stella']);

        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async => _gameDetail(
            title: 'Adventure',
            system: 'Atari 2600',
            core: 'atari2600',
            fileName: 'adventure.a26',
            availableCores: const ['atari2600'],
            // supportsBackendOverrides intentionally omitted (defaults to
            // false, same as GameDetail's own constructor default) to
            // simulate a server that predates backendOverrideSupported.
          ),
        );

        await pumpDetailScreen(tester);

        await tester.tap(
          find.descendant(
            of: find.byType(FilledButton),
            matching: find.text('atari2600'),
          ),
        );
        await tester.pumpAndSettle();

        final dialog = find.byType(AlertDialog);
        expect(dialog, findsOneWidget);

        expect(
          find.descendant(
            of: dialog,
            matching: find.text('EmulatorJS (WebView)'),
          ),
          findsOneWidget,
          reason: 'a legacy server must not hide the browser backend',
        );
      },
    );

    testWidgets(
      'legacy game details do not expose unsupported core override actions',
      (tester) async {
        await _registerInstalledCores(['fbneo']);
        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async =>
              _gameDetail(title: 'Legacy arcade game', fileName: 'legacy.zip'),
        );

        await pumpDetailScreen(tester);

        expect(find.widgetWithText(FilledButton, 'FBNeo'), findsNothing);
        expect(find.text('Choose player'), findsNothing);
        verifyNever(
          () => gamesApi.setGameBackendOverride(
            any(),
            any(),
            backend: any(named: 'backend'),
          ),
        );
        verifyNever(
          () => gamesApi.setGameCoreOverride(
            any(),
            any(),
            core: any(named: 'core'),
          ),
        );
      },
    );

    testWidgets(
      'without EmulatorJS (tvOS/Linux-like), a single reachable option keeps '
      'the picker hidden',
      (tester) async {
        // Reset before the test body returns rather than via tearDown():
        // TestWidgetsFlutterBinding asserts debug variables are back to
        // default before any tearDown callback runs.
        debugDefaultTargetPlatformOverride = TargetPlatform.linux;
        await _registerInstalledCores(['fbneo']);

        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async => _gameDetail(
            title: '1943',
            fileName: '1943.zip',
            recommendedCore: 'mame',
            availableCores: const ['mame'],
          ),
        );

        await pumpDetailScreen(tester);

        // Only FBNeo is natively reachable, so the picker button is hidden.
        expect(find.widgetWithText(FilledButton, 'FBNeo'), findsNothing);
        expect(find.text('Choose player'), findsNothing);

        debugDefaultTargetPlatformOverride = null;
      },
    );

    testWidgets(
      'without EmulatorJS (tvOS/Linux-like), the picker still appears with '
      'multiple reachable native options and renders only native rows',
      (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.linux;
        // Synthetic: two unrelated cores both installed, to exercise the
        // "more than one native row" path with no WebView backend.
        await _registerInstalledCores(['fceumm', 'snes9x']);

        when(() => gamesApi.getGame('library', 'game')).thenAnswer(
          (_) async => _gameDetail(
            title: 'Test Game',
            system: 'NES',
            core: 'nes',
            fileName: 'test.nes',
            recommendedCore: 'snes',
            availableCores: const ['nes', 'snes'],
          ),
        );

        await pumpDetailScreen(tester);

        await tester.tap(
          find.descendant(
            of: find.byType(FilledButton),
            matching: find.text('nes'),
          ),
        );
        await tester.pumpAndSettle();

        final dialog = find.byType(AlertDialog);
        expect(dialog, findsOneWidget, reason: 'more than one reachable row');

        // Both reachable rows are native; no EmulatorJS row at all since
        // emulatorJsAvailable is false on this platform.
        expect(
          find.descendant(of: dialog, matching: find.text('Native core')),
          findsNWidgets(2),
        );
        expect(
          find.descendant(
            of: dialog,
            matching: find.text('EmulatorJS (WebView)'),
          ),
          findsNothing,
        );

        debugDefaultTargetPlatformOverride = null;
      },
    );
  });

  testWidgets('artwork completing while idle still repaints the poster', (
    tester,
  ) async {
    final fakeDataSource = _FakeArtworkDataSource();
    final fakeTransport = RetroArtworkTransport(
      httpClient: _FakeArtworkHttpClient(),
      cache: RetroArtworkByteLruCache(),
      activityGate: RetroArtworkActivityGate(),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: GameDetailScreen(
          libraryId: 'library',
          gameId: 'game',
          debugArtworkDataSource: fakeDataSource,
          debugArtworkTransport: fakeTransport,
          debugArtworkActivityGate: RetroArtworkActivityGate(),
        ),
      ),
    );
    await tester
        .pumpAndSettle(); // settle: no frames pending, poster on fallback

    expect(
      find.byType(RetroArtworkImage),
      findsNothing,
      reason: 'no artwork is seeded yet, so the fallback is shown',
    );

    // Seed the image the fake now has available, then fire the snapshot
    // listener exactly as an async artwork completion would while the app
    // is otherwise idle (no animation, nothing else pending).
    fakeDataSource.seedImage(
      'game',
      RetroArtworkSource(
        serverIdentity: 'srv',
        libraryId: 'library',
        gameId: 'game',
        role: 'boxart',
        revision: 'r1',
        state: RetroArtworkReadyState.thumbnailReady,
        uri: Uri.parse('https://example.test/art/game.png'),
      ),
    );
    fakeDataSource.notifyChanged();
    await tester.pumpAndSettle();

    expect(
      find.byType(RetroArtworkImage),
      findsWidgets,
      reason:
          'scheduleFrame() must wake the idle binding so the queued '
          'postFrameCallback actually runs and repaints the poster',
    );
  });
}
