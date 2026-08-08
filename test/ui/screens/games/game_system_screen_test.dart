import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
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
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockGamesApi extends Mock implements GamesApi {}

/// Fully controllable [RetroArtworkDataSource] fake. [onSubmitPriority], when
/// set, lets a test hold the priority hint's future open to prove artwork
/// fetches do not wait on it.
class _FakeArtworkDataSource implements RetroArtworkDataSource {
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
}
