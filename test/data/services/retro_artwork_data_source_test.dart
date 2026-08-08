import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_data_source.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_transport.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_cache.dart';
import 'package:server_core/server_core.dart';

class _MockGamesApi extends Mock implements GamesApi {}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _FakeArtworkHttpClient implements RetroArtworkHttpClient {
  @override
  void close() {}

  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) async => Uint8List(0);
}

void main() {
  late _MockGamesApi gamesApi;
  late _MockMediaServerClient client;
  late RetroArtworkActivityGate activityGate;
  late RetroArtworkTransport transport;

  setUpAll(() {
    registerFallbackValue(
      const GameArtworkPriorityRequest(
        systemId: 'fallback',
        knownGeneration: 'fallback',
        items: <GameArtworkPriorityItem>[],
      ),
    );
  });

  setUp(() {
    gamesApi = _MockGamesApi();
    client = _MockMediaServerClient();
    when(() => client.gamesApi).thenReturn(gamesApi);
    when(() => client.baseUrl).thenReturn('https://server.example');
    when(() => client.userId).thenReturn('user');
    when(() => client.accessToken).thenReturn('token');
    activityGate = RetroArtworkActivityGate();
    transport = RetroArtworkTransport(
      httpClient: _FakeArtworkHttpClient(),
      cache: RetroArtworkByteLruCache(),
      activityGate: activityGate,
    );
  });

  test(
    'selects and caches manifest capability once per client session',
    () async {
      when(() => gamesApi.getArtworkCapabilities()).thenAnswer(
        (_) async => const GameArtworkCapabilities(
          protocolVersion: 2,
          manifest: true,
          versionedAssets: true,
        ),
      );

      final first = await RetroArtworkDataSourceFactory.create(
        client: client,
        activityGate: activityGate,
        transport: transport,
      );
      final second = await RetroArtworkDataSourceFactory.create(
        client: client,
        activityGate: activityGate,
        transport: transport,
      );
      addTearDown(() => first?.dispose());
      addTearDown(() => second?.dispose());

      expect(first, isA<ManifestArtworkAdapter>());
      expect(second, isA<ManifestArtworkAdapter>());
      verify(() => gamesApi.getArtworkCapabilities()).called(1);
    },
  );

  test('manifest maps only ready descriptors to image references', () async {
    _stubManifestFor(
      gamesApi,
      libraryId: 'retro',
      systemId: 'nes',
      manifest: GameArtworkManifest(
        generation: 'g1',
        entries: [
          GameArtworkManifestEntry(
            gameId: 'zelda',
            artwork: {
              'boxart': const GameArtworkDescriptor(
                state: 'thumbnailReady',
                revision: 'v1',
                url: '/Moonfin/art/v1',
              ),
              'snap': const GameArtworkDescriptor(state: 'pending'),
              'title': const GameArtworkDescriptor(state: 'missing'),
            },
          ),
        ],
      ),
    );
    final adapter = _buildAdapter(gamesApi, activityGate, transport);
    addTearDown(adapter.dispose);
    await adapter.refreshSystem(libraryId: 'retro', systemId: 'nes');

    final reference = adapter.imageFor('zelda');
    expect(reference, isNotNull);
    expect(reference?.source?.uri.toString(), '/Moonfin/art/v1');
    expect(adapter.imageFor('zelda', role: 'snap'), isNull);
    expect(adapter.imageFor('zelda', role: 'title'), isNull);
  });

  test('manifest image transfer failure is retried once, then latches until '
      'route re-entry', () async {
    _stubManifestFor(
      gamesApi,
      libraryId: 'retro',
      systemId: 'nes',
      manifest: GameArtworkManifest(
        generation: 'g1',
        entries: [
          GameArtworkManifestEntry(
            gameId: 'zelda',
            artwork: {
              'boxart': const GameArtworkDescriptor(
                state: 'thumbnailReady',
                revision: 'v1',
                url: '/Moonfin/art/v1',
              ),
            },
          ),
        ],
      ),
    );
    final adapter = _buildAdapter(
      gamesApi,
      activityGate,
      transport,
      imageRetryBackoff: const Duration(milliseconds: 10),
    );
    addTearDown(adapter.dispose);
    await adapter.refreshSystem(libraryId: 'retro', systemId: 'nes');
    expect(adapter.imageFor('zelda'), isNotNull);

    // A transient failure withholds the image immediately (forcing the
    // consumer widget to unmount and retry) and restores it once the
    // bounded backoff elapses.
    adapter.reportImageFailure('zelda', statusCode: 503);
    expect(adapter.imageFor('zelda'), isNull);
    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(adapter.imageFor('zelda'), isNotNull);

    // The bounded retry is spent: a second failure on the same descriptor
    // revision latches instead of retrying again.
    adapter.reportImageFailure('zelda', statusCode: 503);
    expect(adapter.imageFor('zelda'), isNull);
    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(adapter.imageFor('zelda'), isNull);

    // Re-entering the route clears the latch and gives it a fresh chance.
    adapter.onRouteReentered();
    expect(adapter.imageFor('zelda'), isNotNull);
  });

  test(
    'manifest debounces one ordered priority request for pending art',
    () async {
      _stubManifestAny(
        gamesApi,
        GameArtworkManifest(
          generation: 'g2',
          entries: [
            GameArtworkManifestEntry(
              gameId: 'first',
              artwork: {
                'boxart': const GameArtworkDescriptor(state: 'pending'),
              },
            ),
            GameArtworkManifestEntry(
              gameId: 'second',
              artwork: {
                'boxart': const GameArtworkDescriptor(state: 'pending'),
              },
            ),
          ],
        ),
      );
      when(
        () => gamesApi.submitArtworkPriority(
          any(),
          any(),
          cancellationOwner: any(named: 'cancellationOwner'),
        ),
      ).thenAnswer((_) async {});

      final adapter = _buildAdapter(
        gamesApi,
        activityGate,
        transport,
        priorityDebounce: Duration.zero,
      );
      addTearDown(adapter.dispose);
      await adapter.refreshSystem(libraryId: 'retro', systemId: 'nes');
      await adapter.submitActiveBandPriority(['second', 'first']);

      final request =
          verify(
                () => gamesApi.submitArtworkPriority(
                  'retro',
                  captureAny(),
                  cancellationOwner: any(named: 'cancellationOwner'),
                ),
              ).captured.single
              as GameArtworkPriorityRequest;
      expect(request.knownGeneration, 'g2');
      expect(request.items.map((item) => item.gameId), ['second', 'first']);
    },
  );

  test(
    'manifest preserves nearer priority bands in serialized order',
    () async {
      _stubManifestAny(
        gamesApi,
        const GameArtworkManifest(
          generation: 'g3',
          entries: [
            GameArtworkManifestEntry(
              gameId: 'near',
              artwork: {'boxart': GameArtworkDescriptor(state: 'pending')},
            ),
            GameArtworkManifestEntry(
              gameId: 'far',
              artwork: {'boxart': GameArtworkDescriptor(state: 'pending')},
            ),
          ],
        ),
      );
      final firstStarted = Completer<void>();
      final releaseFirst = Completer<void>();
      final submitted = <String>[];
      when(
        () => gamesApi.submitArtworkPriority(
          any(),
          any(),
          cancellationOwner: any(named: 'cancellationOwner'),
        ),
      ).thenAnswer((invocation) async {
        final request =
            invocation.positionalArguments[1] as GameArtworkPriorityRequest;
        submitted.add(request.items.single.gameId);
        if (submitted.length == 1) {
          firstStarted.complete();
          await releaseFirst.future;
        }
      });

      final adapter = _buildAdapter(
        gamesApi,
        activityGate,
        transport,
        priorityDebounce: Duration.zero,
      );
      addTearDown(adapter.dispose);
      await adapter.refreshSystem(libraryId: 'retro', systemId: 'nes');

      final near = adapter.submitActiveBandPriority([
        'near',
      ], planGeneration: 7);
      final far = adapter.submitActiveBandPriority(['far'], planGeneration: 7);
      await firstStarted.future;
      expect(submitted, ['near']);

      releaseFirst.complete();
      await Future.wait(<Future<void>>[near, far]);
      expect(submitted, ['near', 'far']);
    },
  );

  test(
    'legacy suppresses 404s for the screen and retries transient failures on re-entry',
    () async {
      when(
        () => gamesApi.thumbUrl(
          libraryId: any(named: 'libraryId'),
          gameId: any(named: 'gameId'),
          kind: any(named: 'kind'),
        ),
      ).thenReturn('https://server.example/thumb');
      final adapter = LegacyArtworkAdapter(gamesApi: gamesApi);
      await adapter.refreshSystem(libraryId: 'retro', systemId: 'nes');

      adapter.reportImageFailure('missing', statusCode: 404);
      adapter.reportImageFailure('unstable', statusCode: 503);
      expect(adapter.imageFor('missing'), isNull);
      expect(adapter.imageFor('unstable'), isNull);
      adapter.onRouteReentered();
      expect(adapter.imageFor('missing'), isNull);
      expect(adapter.imageFor('unstable'), isNotNull);
    },
  );

  test(
    'app resume retries transient failures on active factory adapters',
    () async {
      when(
        () => gamesApi.getArtworkCapabilities(),
      ).thenAnswer((_) async => null);
      when(
        () => gamesApi.thumbUrl(
          libraryId: any(named: 'libraryId'),
          gameId: any(named: 'gameId'),
          kind: any(named: 'kind'),
        ),
      ).thenReturn('https://server.example/thumb');
      final adapter = await RetroArtworkDataSourceFactory.create(
        client: client,
        activityGate: activityGate,
        transport: transport,
      );
      addTearDown(() => adapter?.dispose());
      await adapter!.refreshSystem(libraryId: 'retro', systemId: 'nes');
      adapter.reportImageFailure('unstable', statusCode: 503);
      expect(adapter.imageFor('unstable'), isNull);

      RetroArtworkDataSourceFactory.notifyAppResumed();

      expect(adapter.imageFor('unstable'), isNotNull);
    },
  );
}

/// Stubs [GamesApi.getArtworkManifest] for a specific library/system pair.
void _stubManifestFor(
  _MockGamesApi gamesApi, {
  required String libraryId,
  required String systemId,
  required GameArtworkManifest manifest,
}) {
  when(
    () => gamesApi.getArtworkManifest(
      libraryId,
      systemId: systemId,
      knownGeneration: any(named: 'knownGeneration'),
      cancellationOwner: any(named: 'cancellationOwner'),
    ),
  ).thenAnswer((_) async => manifest);
}

/// Stubs [GamesApi.getArtworkManifest] for any library/system pair, for
/// tests that only care about the response and not the request routing.
void _stubManifestAny(_MockGamesApi gamesApi, GameArtworkManifest manifest) {
  when(
    () => gamesApi.getArtworkManifest(
      any(),
      systemId: any(named: 'systemId'),
      knownGeneration: any(named: 'knownGeneration'),
      cancellationOwner: any(named: 'cancellationOwner'),
    ),
  ).thenAnswer((_) async => manifest);
}

/// Builds a [ManifestArtworkAdapter] wired to [gamesApi]/[activityGate]/
/// [transport], overriding only the timing knobs a given test needs.
/// Backoff/debounce defaults mirror ManifestArtworkAdapter's own defaults.
ManifestArtworkAdapter _buildAdapter(
  _MockGamesApi gamesApi,
  RetroArtworkActivityGate activityGate,
  RetroArtworkTransport transport, {
  Duration imageRetryBackoff = const Duration(milliseconds: 750),
  Duration priorityDebounce = const Duration(milliseconds: 180),
}) {
  return ManifestArtworkAdapter(
    gamesApi: gamesApi,
    serverIdentity: 'https://server.example',
    activityGate: activityGate,
    transport: transport,
    supportsPriorityHints: true,
    imageRetryBackoff: imageRetryBackoff,
    priorityDebounce: priorityDebounce,
  );
}
