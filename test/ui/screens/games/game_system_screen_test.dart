import 'dart:async';

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
import 'package:moonfin/ui/screens/games/game_system_screen.dart';
import 'package:moonfin/ui/widgets/game/game_poster_card.dart';
import 'package:moonfin/ui/widgets/game/retro_artwork_image.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockGamesApi extends Mock implements GamesApi {}

/// Fully controllable [RetroArtworkDataSource] fake. [onSubmitPriority], when
/// set, lets a test hold the priority hint's future open to prove artwork
/// fetches do not wait on it.
class _FakeArtworkDataSource implements RetroArtworkDataSource {
  @override
  bool reportsDimensions = false;

  final Map<String, RetroArtworkImageReference> _images =
      <String, RetroArtworkImageReference>{};
  final Set<RetroArtworkSnapshotListener> _listeners =
      <RetroArtworkSnapshotListener>{};
  RetroArtworkSystemSnapshot? _snapshot;

  /// Optional hook a test can use to hold [submitActiveBandPriority] open.
  Future<void> Function()? onSubmitPriority;
  int submitPriorityCallCount = 0;

  void seedImage(String gameId, RetroArtworkSource source) {
    _images[gameId] = RetroArtworkImageReference.manifest(source);
  }

  void seedBoxartSizes(Map<String, (int, int)> sizes) {
    _snapshot = RetroArtworkSystemSnapshot(
      libraryId: 'retro',
      systemId: 'sms',
      generation: 'gen-${sizes.length}',
      descriptors: {
        for (final MapEntry(key: gameId, value: (width, height))
            in sizes.entries)
          gameId: {
            'boxart': GameArtworkDescriptor(
              state: 'thumbnailReady',
              revision: 'r1',
              url: '/art/$gameId',
              width: width,
              height: height,
            ),
          },
      },
    );
  }

  /// Fires the registered snapshot listener exactly as an async artwork
  /// completion would, so a test can simulate that happening while the app
  /// is otherwise idle (no animation, nothing else pending).
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
  }) async {
    submitPriorityCallCount++;
    final hook = onSubmitPriority;
    if (hook != null) await hook();
  }

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

/// A transport whose HTTP layer is entirely in-memory, so widget tests never
/// touch the network, plus call counting on [load] to observe when artwork
/// fetches actually start.
class _RecordingArtworkTransport extends RetroArtworkTransport {
  _RecordingArtworkTransport()
    : super(
        httpClient: _FakeArtworkHttpClient(),
        cache: RetroArtworkByteLruCache(),
        activityGate: RetroArtworkActivityGate(),
      );

  int loadCallCount = 0;

  @override
  Future<RetroArtworkLoadResult> load(RetroArtworkSource source) {
    loadCallCount++;
    return super.load(source);
  }
}

class _FakeArtworkHttpClient implements RetroArtworkHttpClient {
  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) async => Uint8List(0);

  @override
  void close() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockGamesApi gamesApi;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final client = _MockMediaServerClient();
    gamesApi = _MockGamesApi();
    when(() => client.gamesApi).thenReturn(gamesApi);
    when(
      () => gamesApi.getGames(any(), system: any(named: 'system')),
    ).thenAnswer(
      (_) async => const [
        GameSummary(
          id: 'sonic',
          title: 'Sonic',
          system: 'sms',
          core: 'genesis_plus_gx',
          fileName: 'Sonic.sms',
        ),
      ],
    );
    when(() => gamesApi.getSystems(any())).thenAnswer(
      (_) async => const [
        GameSystem(
          id: 'sms',
          name: 'Master System',
          core: 'genesis_plus_gx',
          gameCount: 1,
        ),
      ],
    );
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('loads games before constructing the selected-system grid', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const GameSystemScreen(libraryId: 'retro', systemId: 'sms'),
      ),
    );
    await tester.pump();
    await tester.pump();

    verify(() => gamesApi.getGames('retro', system: 'sms')).called(1);
    expect(find.byType(GamePosterCard), findsOneWidget);
  });

  testWidgets(
    'artwork loads start without waiting for the priority hint',
    (tester) async {
      final fakeDataSource = _FakeArtworkDataSource();
      final fakeTransport = _RecordingArtworkTransport();
      final source = RetroArtworkSource(
        serverIdentity: 'srv',
        libraryId: 'retro',
        gameId: 'sonic',
        role: 'boxart',
        revision: 'r1',
        state: RetroArtworkReadyState.thumbnailReady,
        uri: Uri.parse('https://example.test/art/sonic.png'),
      );
      fakeDataSource.seedImage('sonic', source);

      final priority = Completer<void>();
      fakeDataSource.onSubmitPriority = () => priority.future;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: GameSystemScreen(
            libraryId: 'retro',
            systemId: 'sms',
            debugArtworkDataSource: fakeDataSource,
            debugArtworkTransport: fakeTransport,
            // Production always supplies these together, and the card only
            // builds its image when both are present.
            debugArtworkActivityGate: RetroArtworkActivityGate(),
          ),
        ),
      );
      // Let the games load, the debug data source get wired in, and the grid
      // build the card that owns the transfer.
      await tester.pump();
      await tester.pump();
      await tester.pump();
      // Past RetroArtworkImage.defaultSettleDelay.
      await tester.pump(const Duration(milliseconds: 150));

      expect(
        fakeDataSource.submitPriorityCallCount,
        greaterThan(0),
        reason: 'the priority hint must still be requested',
      );
      expect(
        fakeTransport.loadCallCount,
        greaterThan(0),
        reason: 'artwork must not wait on the debounced priority round trip',
      );

      priority.complete();
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'artwork completing while idle still repaints the grid',
    (tester) async {
      final fakeDataSource = _FakeArtworkDataSource();
      final fakeTransport = _RecordingArtworkTransport();

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: GameSystemScreen(
            libraryId: 'retro',
            systemId: 'sms',
            debugArtworkDataSource: fakeDataSource,
            debugArtworkTransport: fakeTransport,
            debugArtworkActivityGate: RetroArtworkActivityGate(),
          ),
        ),
      );
      await tester.pumpAndSettle(); // settle: no frames pending, no art yet

      expect(
        find.byType(RetroArtworkImage),
        findsNothing,
        reason: 'no artwork is seeded yet',
      );

      // Seed the image the fake now has available, then fire the snapshot
      // listener exactly as an async artwork completion would while the app
      // is otherwise idle (no animation, nothing else pending).
      fakeDataSource.seedImage(
        'sonic',
        RetroArtworkSource(
          serverIdentity: 'srv',
          libraryId: 'retro',
          gameId: 'sonic',
          role: 'boxart',
          revision: 'r1',
          state: RetroArtworkReadyState.thumbnailReady,
          uri: Uri.parse('https://example.test/art/sonic.png'),
        ),
      );
      fakeDataSource.notifyChanged();
      await tester.pumpAndSettle();

      expect(
        find.byType(RetroArtworkImage),
        findsWidgets,
        reason:
            'scheduleFrame() must wake the idle binding so the queued '
            'postFrameCallback actually runs and repaints the grid',
      );
    },
  );

  Future<void> pumpShapedGrid(
    WidgetTester tester,
    _FakeArtworkDataSource dataSource,
  ) async {
    tester.view.physicalSize = const Size(1280, 720);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: GameSystemScreen(
          libraryId: 'retro',
          systemId: 'sms',
          debugArtworkDataSource: dataSource,
          debugArtworkTransport: _RecordingArtworkTransport(),
          debugArtworkActivityGate: RetroArtworkActivityGate(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  double cardAspect(WidgetTester tester, {int index = 0}) {
    final card = tester
        .widgetList<GamePosterCard>(find.byType(GamePosterCard))
        .elementAt(index);
    return card.width / card.imageHeight!;
  }

  testWidgets('adopts the median box art shape and remembers it', (
    tester,
  ) async {
    final dataSource = _FakeArtworkDataSource()
      ..reportsDimensions = true
      ..seedBoxartSizes({'sonic': (512, 357)});

    await pumpShapedGrid(tester, dataSource);

    expect(cardAspect(tester), closeTo(512 / 357, 0.01));
    expect(
      GetIt.instance<UserPreferences>().gameGridCellAspect('retro/sms'),
      closeTo(512 / 357, 0.001),
    );
  });

  testWidgets(
    'keeps the shape for the visit and saves a new one for the next',
    (tester) async {
      final dataSource = _FakeArtworkDataSource()
        ..reportsDimensions = true
        ..seedBoxartSizes({'sonic': (512, 357)});
      await pumpShapedGrid(tester, dataSource);

      dataSource
        ..seedBoxartSizes({'sonic': (355, 512)})
        ..notifyChanged();
      await tester.pumpAndSettle();

      expect(cardAspect(tester), closeTo(512 / 357, 0.01));
      expect(
        GetIt.instance<UserPreferences>().gameGridCellAspect('retro/sms'),
        closeTo(355 / 512, 0.001),
      );
    },
  );

  testWidgets('a server without dimensions keeps the portrait card', (
    tester,
  ) async {
    await GetIt.instance<UserPreferences>().setGameGridCellAspect(
      'retro/sms',
      1.43,
    );

    await pumpShapedGrid(tester, _FakeArtworkDataSource());

    expect(cardAspect(tester), closeTo(1 / 1.34, 0.01));
  });

  testWidgets('art of another shape is contained over a fill, not cropped', (
    tester,
  ) async {
    when(() => gamesApi.getGames(any(), system: any(named: 'system')))
        .thenAnswer(
          (_) async => [
            for (final id in ['mario', 'hydro', 'shogi'])
              GameSummary(
                id: id,
                title: id,
                system: 'sms',
                core: 'genesis_plus_gx',
                fileName: '$id.sms',
              ),
          ],
        );
    final dataSource = _FakeArtworkDataSource()
      ..reportsDimensions = true
      ..seedBoxartSizes({
        'mario': (512, 357),
        'hydro': (512, 374),
        'shogi': (256, 354),
      });
    for (final id in ['mario', 'hydro', 'shogi']) {
      dataSource.seedImage(
        id,
        RetroArtworkSource(
          serverIdentity: 'srv',
          libraryId: 'retro',
          gameId: id,
          role: 'boxart',
          revision: 'r1',
          state: RetroArtworkReadyState.thumbnailReady,
          uri: Uri.parse('https://example.test/art/$id.png'),
        ),
      );
    }

    await pumpShapedGrid(tester, dataSource);

    final images = {
      for (final card in tester.widgetList<GamePosterCard>(
        find.byType(GamePosterCard),
      ))
        card.seed: card.artwork! as RetroArtworkImage,
    };
    expect(images['hydro']!.fillBehind, isFalse);
    expect(images['hydro']!.fit, BoxFit.cover);
    expect(images['shogi']!.fillBehind, isTrue);
    expect(images['shogi']!.fit, BoxFit.contain);
  });

  testWidgets('rows scrolled above the grid are clipped below the header', (
    tester,
  ) async {
    await GetIt.instance<UserPreferences>().setGameGridCellAspect(
      'retro/sms',
      1.43,
    );
    when(() => gamesApi.getGames(any(), system: any(named: 'system')))
        .thenAnswer(
          (_) async => [
            for (var i = 0; i < 200; i++)
              GameSummary(
                id: 'game-$i',
                title: 'Game $i',
                system: 'sms',
                core: 'genesis_plus_gx',
                fileName: 'Game$i.sms',
              ),
          ],
        );
    await pumpShapedGrid(tester, _FakeArtworkDataSource());

    final grid = find.byType(GridView);
    tester.widget<GridView>(grid).controller!.jumpTo(1500);
    await tester.pumpAndSettle();

    final clip = find.ancestor(of: grid, matching: find.byType(ClipRect)).first;
    expect(
      tester.getRect(clip).top,
      moreOrLessEquals(tester.getRect(grid).top, epsilon: 0.5),
    );
    expect(tester.widget<ClipRect>(clip).clipper, isNotNull);
  });

  for (final cellAspect in const <double?>[null, 1.0, 1.43]) {
    testWidgets('keeps the focused row on screen deep into a large library '
        '(cell shape ${cellAspect ?? 'portrait'})', (
      tester,
    ) async {
      if (cellAspect != null) {
        await GetIt.instance<UserPreferences>().setGameGridCellAspect(
          'retro/sms',
          cellAspect,
        );
      }
      // Enough rows that a per-row error in the scroll math adds up to more
      // than a card height before the bottom of the list.
      final games = [
        for (var i = 0; i < 600; i++)
          GameSummary(
            id: 'game-$i',
            title: 'Game ${i.toString().padLeft(3, '0')}',
            system: 'sms',
            core: 'genesis_plus_gx',
            fileName: 'Game$i.sms',
          ),
      ];
      when(() => gamesApi.getGames(any(), system: any(named: 'system')))
          .thenAnswer((_) async => games);
      when(() => gamesApi.getGame(any(), any())).thenAnswer((_) async => null);
      // The d-pad layout reserves focus-zoom headroom between rows, which is
      // what the scroll math has to account for.
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      tester.view.physicalSize = const Size(1280, 720);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const GameSystemScreen(libraryId: 'retro', systemId: 'sms'),
        ),
      );
      await tester.pumpAndSettle();

      GamePosterCard focusedCard() => tester
          .widgetList<GamePosterCard>(find.byType(GamePosterCard))
          .singleWhere((card) => card.focusNode?.hasFocus ?? false);

      tester
          .widget<GamePosterCard>(find.byType(GamePosterCard).first)
          .focusNode!
          .requestFocus();
      await tester.pumpAndSettle();

      final viewport = tester.getRect(find.byType(GridView));
      double? settledTop;
      for (var press = 1; press <= 40; press++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();
        final card = tester.getRect(find.byWidget(focusedCard()));
        expect(
          card.top >= viewport.top && card.bottom <= viewport.bottom,
          isTrue,
          reason:
              'row $press: focused card $card must sit inside the grid '
              'viewport $viewport',
        );
        // Once the grid starts scrolling, every row should land in the same
        // place; a creeping offset means the scroll math and the real row
        // stride disagree.
        if (press == 5) settledTop = card.top;
        if (settledTop != null) {
          expect(card.top, moreOrLessEquals(settledTop, epsilon: 1));
        }
      }

      for (var press = 1; press <= 40; press++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pumpAndSettle();
        final card = tester.getRect(find.byWidget(focusedCard()));
        expect(
          card.top >= viewport.top && card.bottom <= viewport.bottom,
          isTrue,
          reason:
              'up $press: focused card $card must sit inside the grid '
              'viewport $viewport',
        );
      }
    });
  }

  // A 1080p Android TV is 960x540 logical, where the grid shows only about
  // one and a half rows of posters; the others fit more rows.
  for (final cellAspect in const <double?>[null, 1.43]) {
  for (final (physical, ratio) in const [
    (Size(1920, 1080), 2.0),
    (Size(1280, 720), 1.0),
    (Size(1920, 1080), 1.0),
  ]) {
    testWidgets('FF/RW page by the full rows on screen at '
        '${physical.width ~/ ratio}x${physical.height ~/ ratio} '
        '(cell shape ${cellAspect ?? 'portrait'})', (
      tester,
    ) async {
      if (cellAspect != null) {
        await GetIt.instance<UserPreferences>().setGameGridCellAspect(
          'retro/sms',
          cellAspect,
        );
      }
      final games = [
        for (var i = 0; i < 600; i++)
          GameSummary(
            id: 'game-$i',
            title: 'Game ${i.toString().padLeft(3, '0')}',
            system: 'sms',
            core: 'genesis_plus_gx',
            fileName: 'Game$i.sms',
          ),
      ];
      when(() => gamesApi.getGames(any(), system: any(named: 'system')))
          .thenAnswer((_) async => games);
      when(() => gamesApi.getGame(any(), any())).thenAnswer((_) async => null);
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      tester.view.physicalSize = physical;
      tester.view.devicePixelRatio = ratio;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const GameSystemScreen(libraryId: 'retro', systemId: 'sms'),
        ),
      );
      await tester.pumpAndSettle();

      final cards = find.byType(GamePosterCard);
      int indexOf(GamePosterCard card) => int.parse(card.seed.split('-').last);
      final columns = tester
          .widgetList<GamePosterCard>(cards)
          .where(
            (card) =>
                tester.getRect(find.byWidget(card)).top ==
                tester.getRect(cards.first).top,
          )
          .length;
      final viewport = tester.getRect(find.byType(GridView));

      // Every built row with its on-screen rect, keyed by row index.
      Map<int, Rect> rowRects() => {
        for (final card in tester.widgetList<GamePosterCard>(cards))
          if (indexOf(card) % columns == 0)
            indexOf(card) ~/ columns: tester.getRect(find.byWidget(card)),
      };
      int firstVisibleRow() => (rowRects().entries.toList()
            ..sort((a, b) => a.key.compareTo(b.key)))
          .firstWhere((e) => e.value.top >= viewport.top - 0.5)
          .key;
      int firstCutOffRow() {
        final rows = rowRects().entries.toList()
          ..sort((a, b) => a.key.compareTo(b.key));
        // When the rows on screen end exactly at the bottom edge, the next
        // row may not be built at all.
        return rows
            .firstWhere(
              (e) => e.value.bottom > viewport.bottom + 0.5,
              orElse: () => MapEntry(rows.last.key + 1, Rect.zero),
            )
            .key;
      }
      int focusedIndex() => indexOf(
        tester
            .widgetList<GamePosterCard>(cards)
            .singleWhere((card) => card.focusNode?.hasFocus ?? false),
      );

      // Start one column in, so the test also proves the column is kept.
      tester.widget<GamePosterCard>(cards.at(1)).focusNode!.requestFocus();
      await tester.pumpAndSettle();

      for (var page = 0; page < 3; page++) {
        final top = firstVisibleRow();
        final cutOff = firstCutOffRow();
        final pageRows = cutOff - top < 1 ? 1 : cutOff - top;
        final from = focusedIndex();

        await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
        await tester.pumpAndSettle();

        expect(
          firstVisibleRow(),
          cutOff,
          reason: 'FF scrolls the row cut off at the bottom to the top',
        );
        expect(focusedIndex(), from + pageRows * columns);
        final focused = tester.getRect(
          find.byWidget(
            tester
                .widgetList<GamePosterCard>(cards)
                .singleWhere((card) => card.focusNode?.hasFocus ?? false),
          ),
        );
        expect(
          focused.top >= viewport.top && focused.bottom <= viewport.bottom,
          isTrue,
          reason: 'the focused card $focused stays on screen $viewport',
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.mediaRewind);
        await tester.pumpAndSettle();
        expect(firstVisibleRow(), top, reason: 'RW pages straight back');
        expect(focusedIndex(), from);

        await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
        await tester.pumpAndSettle();
      }

      for (var press = 0; press < 150; press++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.mediaRewind);
        await tester.pumpAndSettle();
      }
      expect(focusedIndex(), 1, reason: 'RW stops at the first row');

      for (var press = 0; press < 150; press++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
        await tester.pumpAndSettle();
      }
      final lastRowStart = (games.length - 1) ~/ columns * columns;
      expect(
        focusedIndex(),
        (lastRowStart + 1).clamp(0, games.length - 1),
        reason: 'FF stops on the last row, in the same column when it exists',
      );
    });
  }
  }
}
