import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_cache.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_transport.dart';
import 'package:server_core/server_core.dart';

void main() {
  group('RetroArtworkByteLruCache', () {
    test('evicts least-recently-used bytes to stay within budget', () {
      final cache = RetroArtworkByteLruCache(maxBytes: 5);
      final a = _key('a');
      final b = _key('b');
      final c = _key('c');

      cache.put(a, Uint8List.fromList(<int>[1, 1]));
      cache.put(b, Uint8List.fromList(<int>[2, 2]));
      expect(cache.get(a), isNotNull);
      cache.put(c, Uint8List.fromList(<int>[3, 3]));

      expect(cache.containsKey(a), isTrue);
      expect(cache.containsKey(b), isFalse);
      expect(cache.containsKey(c), isTrue);
      expect(cache.currentBytes, 4);
    });

    test('does not retain an entry larger than the entire budget', () {
      final cache = RetroArtworkByteLruCache(maxBytes: 2);

      expect(
        cache.put(_key('large'), Uint8List.fromList(<int>[1, 2, 3])),
        isFalse,
      );
      expect(cache.currentBytes, 0);
      expect(cache.length, 0);
    });
  });

  group('RetroArtworkCacheKey', () {
    test('is independent of descriptor URL and authentication token', () {
      const first = RetroArtworkCacheKey(
        serverIdentity: 'server-record-1',
        libraryId: 'library',
        gameId: 'game',
        role: 'boxart',
        revision: 'revision-2',
      );
      const second = RetroArtworkCacheKey(
        serverIdentity: 'server-record-1',
        libraryId: 'library',
        gameId: 'game',
        role: 'boxart',
        revision: 'revision-2',
      );

      expect(first, second);
      expect(first.storageKey, second.storageKey);
      expect(first.storageKey, isNot(contains('token')));
    });

    test('normalizes a base URL without credentials or query state', () {
      expect(
        normalizeRetroArtworkServerIdentity(
          'HTTPS://user:secret@Example.COM:443/jellyfin/?ApiKey=secret#part',
        ),
        'https://example.com/jellyfin',
      );
    });

    test('ignores authentication query changes in source identity', () {
      final withoutToken = _source('game', uri: Uri.parse('/art/game/rev'));
      final withRotatedToken = _source(
        'game',
        uri: Uri.parse('/art/game/rev?ApiKey=rotated-secret'),
      );

      expect(withoutToken, withRotatedToken);
      expect(withoutToken.cacheKey, withRotatedToken.cacheKey);
    });

    test('maps only ready versioned protocol-2 descriptors', () {
      final ready = RetroArtworkSource.fromDescriptor(
        serverIdentity: 'server-record-1',
        libraryId: 'library',
        gameId: 'game',
        role: 'boxart',
        descriptor: const GameArtworkDescriptor(
          state: 'thumbnailReady',
          url: '/art/game/boxart/revision-2',
          revision: 'revision-2',
        ),
      );
      final missing = RetroArtworkSource.fromDescriptor(
        serverIdentity: 'server-record-1',
        libraryId: 'library',
        gameId: 'game',
        role: 'boxart',
        descriptor: const GameArtworkDescriptor(state: 'missing'),
      );

      expect(ready?.state, RetroArtworkReadyState.thumbnailReady);
      expect(missing, isNull);
    });
  });

  group('RetroArtworkActivityGate', () {
    test('cancels every activity kind and suppresses new permits', () {
      final gate = RetroArtworkActivityGate();
      final permits = RetroArtworkActivityKind.values
          .map(gate.tryAcquire)
          .whereType<RetroArtworkActivityPermit>()
          .toList(growable: false);

      gate.setRouteCovered(true);

      expect(permits.every((permit) => permit.signal.isCancelled), isTrue);
      expect(gate.tryAcquire(RetroArtworkActivityKind.decode), isNull);
      gate.setRouteCovered(false);
      expect(gate.tryAcquire(RetroArtworkActivityKind.decode), isNotNull);
    });

    test('overlapping gameplay owners release the blocker independently', () {
      final gate = RetroArtworkActivityGate();

      gate.setGameplayActive(true);
      gate.setGameplayActive(true);
      gate.setGameplayActive(false);

      expect(gate.isGameplayActive, isTrue);
      expect(gate.isOpen, isFalse);

      gate.setGameplayActive(false);

      expect(gate.isGameplayActive, isFalse);
      expect(gate.isOpen, isTrue);
    });
  });

  group('RetroArtworkTransport', () {
    test('coalesces duplicate demand for one source', () async {
      final http = _ControlledHttpClient();
      final transport = _buildTransport(http: http);
      final source = _source('game');

      transport.adoptSource(source);
      final first = transport.load(source);
      final second = transport.load(source);
      await Future<void>.delayed(Duration.zero);
      expect(http.active, 1);
      http.complete(source.uri, <int>[1]);

      expect((await first).outcome, RetroArtworkLoadOutcome.downloaded);
      expect((await second).outcome, RetroArtworkLoadOutcome.downloaded);
      transport.dispose();
    });

    test('defaults to four transfers and drains its queue', () async {
      final http = _ControlledHttpClient();
      final transport = _buildTransport(http: http);
      final sources = List<RetroArtworkSource>.generate(
        RetroArtworkTransport.defaultMaxConcurrentTransfers + 1,
        (index) => _source('game-$index'),
      );

      for (final source in sources) {
        transport.adoptSource(source);
      }
      final futures = sources.map(transport.load).toList(growable: false);
      await Future<void>.delayed(Duration.zero);
      expect(http.active, RetroArtworkTransport.defaultMaxConcurrentTransfers);
      expect(
        http.maxActive,
        RetroArtworkTransport.defaultMaxConcurrentTransfers,
      );
      expect(transport.queuedTransfers, 1);

      http.complete(sources.first.uri, <int>[1]);
      await Future<void>.delayed(Duration.zero);
      expect(http.active, RetroArtworkTransport.defaultMaxConcurrentTransfers);
      expect(http.requested, contains(sources.last.uri));

      for (final source in sources.skip(1)) {
        http.complete(source.uri, <int>[1]);
      }
      final results = await Future.wait(futures);

      expect(
        results.every(
          (result) => result.outcome == RetroArtworkLoadOutcome.downloaded,
        ),
        isTrue,
      );
      expect(
        http.maxActive,
        RetroArtworkTransport.defaultMaxConcurrentTransfers,
      );
      transport.dispose();
    });

    test(
      'gameplay cancels queued and active work and suppresses new work',
      () async {
        final gate = RetroArtworkActivityGate();
        final http = _ControlledHttpClient();
        final cache = RetroArtworkByteLruCache(maxBytes: 100);
        final transport = _buildTransport(
          http: http,
          cache: cache,
          gate: gate,
          maxConcurrentTransfers: 3,
        );
        final sources = List<RetroArtworkSource>.generate(
          4,
          (index) => _source('game-$index'),
        );
        for (final source in sources) {
          transport.adoptSource(source);
        }
        final futures = sources.map(transport.load).toList(growable: false);

        await Future<void>.delayed(Duration.zero);
        expect(http.active, 3);
        expect(transport.queuedTransfers, 1);
        gate.setGameplayActive(true);
        final cancelled = await Future.wait(futures);

        expect(
          cancelled.every(
            (result) => result.outcome == RetroArtworkLoadOutcome.cancelled,
          ),
          isTrue,
        );
        expect(cache.length, 0);
        final suppressedSource = _source('suppressed');
        transport.adoptSource(suppressedSource);
        expect(
          (await transport.load(suppressedSource)).outcome,
          RetroArtworkLoadOutcome.suppressed,
        );
        transport.dispose();
      },
    );

    test(
      'source promotion evicts and replaces the previous ready source',
      () async {
        final gate = RetroArtworkActivityGate();
        final http = _ControlledHttpClient();
        final cache = RetroArtworkByteLruCache(maxBytes: 100);
        final transport = _buildTransport(http: http, cache: cache, gate: gate);
        final original = _source(
          'game',
          state: RetroArtworkReadyState.originalReady,
          uri: Uri.parse('/art/game/original'),
        );
        transport.adoptSource(original);
        final originalFuture = transport.load(original);
        await Future<void>.delayed(Duration.zero);
        http.complete(original.uri, <int>[1, 2]);
        expect(
          (await originalFuture).outcome,
          RetroArtworkLoadOutcome.downloaded,
        );
        expect(cache.containsKey(original.cacheKey), isTrue);

        final thumbnail = _source(
          'game',
          state: RetroArtworkReadyState.thumbnailReady,
          uri: Uri.parse('/art/game/thumbnail'),
        );
        transport.adoptSource(thumbnail);
        expect(cache.containsKey(original.cacheKey), isFalse);

        final thumbnailFuture = transport.load(thumbnail);
        await Future<void>.delayed(Duration.zero);
        http.complete(thumbnail.uri, <int>[3]);
        expect(
          (await thumbnailFuture).outcome,
          RetroArtworkLoadOutcome.downloaded,
        );
        expect(cache.get(thumbnail.cacheKey), <int>[3]);
        expect(
          (await transport.load(original)).outcome,
          RetroArtworkLoadOutcome.staleSource,
        );
        transport.dispose();
      },
    );
  });

  test('authenticated artwork requests never follow redirects', () {
    expect(DioRetroArtworkHttpClient.followsRedirects, isFalse);
  });
}

RetroArtworkTransport _buildTransport({
  required RetroArtworkHttpClient http,
  RetroArtworkByteLruCache? cache,
  RetroArtworkActivityGate? gate,
  int maxConcurrentTransfers =
      RetroArtworkTransport.defaultMaxConcurrentTransfers,
}) {
  return RetroArtworkTransport(
    httpClient: http,
    cache: cache ?? RetroArtworkByteLruCache(maxBytes: 100),
    activityGate: gate ?? RetroArtworkActivityGate(),
    maxConcurrentTransfers: maxConcurrentTransfers,
  );
}

RetroArtworkCacheKey _key(String revision) => RetroArtworkCacheKey(
  serverIdentity: 'server-record-1',
  libraryId: 'library',
  gameId: 'game',
  role: 'boxart',
  revision: revision,
);

RetroArtworkSource _source(
  String gameId, {
  RetroArtworkReadyState state = RetroArtworkReadyState.originalReady,
  Uri? uri,
}) {
  return RetroArtworkSource(
    serverIdentity: 'server-record-1',
    libraryId: 'library',
    gameId: gameId,
    role: 'boxart',
    revision: 'revision-1',
    state: state,
    uri: uri ?? Uri.parse('/art/$gameId/revision-1'),
  );
}

class _ControlledHttpClient implements RetroArtworkHttpClient {
  final Map<Uri, Completer<Uint8List>> _requests =
      <Uri, Completer<Uint8List>>{};
  final Set<Uri> requested = <Uri>{};
  int active = 0;
  int maxActive = 0;

  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) {
    final completer = Completer<Uint8List>();
    _requests[uri] = completer;
    requested.add(uri);
    active++;
    if (active > maxActive) maxActive = active;

    void cancel() {
      if (!completer.isCompleted) {
        completer.completeError(
          RetroArtworkCancelledException(cancellation.reason),
        );
      }
    }

    cancellation.addListener(cancel);
    return completer.future.whenComplete(() {
      cancellation.removeListener(cancel);
      active--;
      _requests.remove(uri);
    });
  }

  void complete(Uri uri, List<int> bytes) {
    _requests[uri]?.complete(Uint8List.fromList(bytes));
  }

  @override
  void close() {}
}
