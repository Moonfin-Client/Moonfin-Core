import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

void main() {
  MoonbaseGamesApi createApi() => MoonbaseGamesApi(
    Dio(),
    () => 'http://redstar.example:8101',
    () => 'test-token',
    ServerType.jellyfin,
  );

  for (final core in ['mame', 'arcade']) {
    test('$core player URL preserves the original encoded ZIP filename', () {
      final player = Uri.parse(
        createApi().playerUrl(
          libraryId: 'Retro Games',
          gameId: 'opaque-token',
          core: core,
          romFileName: 'Atari Tetris (set 1).zip',
        ),
      );

      final rom = Uri.parse(player.queryParameters['rom']!);
      expect(rom.pathSegments.last, 'Atari Tetris (set 1).zip');
      expect(
        Uri.decodeComponent(rom.path),
        endsWith('/opaque-token/Atari Tetris (set 1).zip'),
      );
      expect(rom.queryParameters['ApiKey'], 'test-token');
    });
  }

  test('PlayStation player URL ends in the file name so a .pbp loads', () {
    final player = Uri.parse(
      createApi().playerUrl(
        libraryId: 'Retro Games',
        gameId: 'opaque-token',
        core: 'psx',
        romFileName: 'Crash Bandicoot (USA).pbp',
      ),
    );

    final rom = Uri.parse(player.queryParameters['rom']!);
    expect(rom.pathSegments.last, 'Crash Bandicoot (USA).pbp');
  });

  test('non-arcade player URL retains the legacy token-only route', () {
    final player = Uri.parse(
      createApi().playerUrl(
        libraryId: 'Retro Games',
        gameId: 'opaque-token',
        core: 'snes',
        romFileName: 'Example Game.zip',
      ),
    );

    final rom = Uri.parse(player.queryParameters['rom']!);
    expect(rom.pathSegments.last, 'opaque-token');
    expect(rom.path, isNot(contains('Example Game.zip')));
  });

  test('player URL uses the supplied core-specific save namespace', () {
    final player = Uri.parse(
      createApi().playerUrl(
        libraryId: 'Retro Games',
        gameId: 'opaque-token',
        core: 'arcade',
        includeSaveUrl: true,
        saveId: 'ejs-arcade-opaque-token',
      ),
    );

    final save = Uri.parse(player.queryParameters['save']!);
    expect(save.path, endsWith('/Saves/ejs-arcade-opaque-token'));
    expect(save.queryParameters['kind'], 'state');
    expect(save.queryParameters['ApiKey'], 'test-token');
  });

  test('player URL asks for the battery save only when starting fresh', () {
    Uri sramOf({required bool includeSaveUrl}) {
      final player = Uri.parse(
        createApi().playerUrl(
          libraryId: 'Retro Games',
          gameId: 'romm-12',
          core: 'snes',
          includeSaveUrl: includeSaveUrl,
          saveId: 'ejs-snes-romm-12',
          includeSramUrl: true,
        ),
      );
      return Uri.parse(player.queryParameters['sram'] ?? '');
    }

    final fresh = sramOf(includeSaveUrl: false);
    expect(fresh.path, endsWith('/Saves/romm-12'));
    expect(fresh.queryParameters['kind'], 'sram');
    expect(fresh.queryParameters['ApiKey'], 'test-token');
    expect(sramOf(includeSaveUrl: true).toString(), isEmpty);
  });

  test('RomM account reads a pending link and treats junk as absent', () {
    final account = RommAccount.fromJson({
      'available': true,
      'linked': false,
      'username': null,
      'pending': {
        'userCode': 'ABCD1234',
        'verificationUrl': 'http://romm:8080/pair/device',
        'verificationUrlComplete': 'http://romm:8080/pair/device?code=ABCD1234',
        'expiresInSeconds': 540,
        'intervalSeconds': 5,
      },
      'error': null,
    });
    expect(account.available, isTrue);
    expect(account.linked, isFalse);
    expect(account.pending?.userCode, 'ABCD1234');
    expect(account.pending?.verificationUrlComplete, endsWith('code=ABCD1234'));
    expect(account.pending?.intervalSeconds, 5);

    final odd = RommAccount.fromJson({
      'available': 'yes',
      'pending': {'verificationUrl': 'http://romm/pair'},
      'error': 3,
    });
    expect(odd.available, isFalse);
    expect(odd.error, isNull);
    expect(odd.pending?.verificationUrlComplete, 'http://romm/pair');
    expect(odd.pending?.intervalSeconds, 5);
  });

  test('RomM account calls read a 404 as an older plugin', () async {
    final dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) => handler.reject(
            DioException(
              requestOptions: options,
              response: Response(requestOptions: options, statusCode: 404),
              type: DioExceptionType.badResponse,
            ),
          ),
        ),
      );
    final api = MoonbaseGamesApi(
      dio,
      () => 'http://redstar.example:8101',
      () => 'test-token',
      ServerType.jellyfin,
    );

    expect((await api.getRommAccount()).available, isFalse);
    expect((await api.startRommLink()).available, isFalse);
  });

  test(
    'artwork protocol models tolerate omitted and malformed optional fields',
    () {
      final system = GameSystem.fromJson({
        'id': 'nes',
        'gameCount': 'not-a-number',
        'previewArtwork': {
          'selectionGeneration': 'inventory-7',
          'panels': [
            {
              'gameId': 'zelda',
              'artwork': {
                'state': 'thumbnailReady',
                'url': 42,
                'revision': 'rev-1',
                'retryAfterSeconds': 'not-a-number',
                'refreshAfterSeconds': {},
              },
            },
            {'gameId': 'empty', 'artwork': 'not-an-object'},
          ],
        },
      });

      expect(system.previewArtwork?.selectionGeneration, 'inventory-7');
      expect(system.gameCount, 0);
      expect(system.previewArtwork?.panels, hasLength(2));
      expect(system.previewArtwork?.panels.first.artwork.isRenderable, isFalse);
      expect(
        system.previewArtwork?.panels.first.artwork.retryAfterSeconds,
        isNull,
      );
      expect(
        system.previewArtwork?.panels.first.artwork.refreshAfterSeconds,
        isNull,
      );
      expect(system.previewArtwork?.panels.last.artwork.state, isEmpty);

      final manifest = GameArtworkManifest.fromJson({
        'generation': 'artwork-7',
        'entries': [
          {
            'gameId': 'zelda',
            'artwork': {
              'boxart': {'state': 'thumbnailReady', 'url': '/art/box'},
              'snap': {'state': 'missing'},
              'title': 'malformed',
            },
          },
        ],
      });
      final capabilities = GameArtworkCapabilities.fromJson({
        'protocolVersion': 2,
        'manifest': true,
        'versionedAssets': true,
        'priorityHints': true,
        'systemPreviews': true,
      });
      final priority = GameArtworkPriorityRequest(
        systemId: 'nes',
        knownGeneration: 'artwork-7',
        items: const [
          GameArtworkPriorityItem(gameId: 'zelda', roles: ['boxart', 'snap']),
        ],
      );

      expect(manifest.entries.single.artwork.keys, ['boxart', 'snap']);
      expect(manifest.entries.single.artwork['boxart']?.isRenderable, isTrue);
      expect(capabilities.supportsManifest, isTrue);
      expect(capabilities.supportsVersionedAssets, isTrue);
      expect(capabilities.supportsPriorityHints, isTrue);
      expect(capabilities.supportsSystemPreviews, isTrue);
      expect(priority.toJson(), {
        'systemId': 'nes',
        'knownGeneration': 'artwork-7',
        'items': [
          {
            'gameId': 'zelda',
            'roles': ['boxart', 'snap'],
          },
        ],
      });
      expect(GameArtworkCapabilities.fromJson({}).supportsManifest, isFalse);
      expect(
        GameArtworkCapabilities.fromJson({
          'protocolVersion': 'two',
        }).supportsManifest,
        isFalse,
      );
    },
  );

  test('protocol 3 descriptors carry artwork dimensions', () {
    final descriptor = GameArtworkDescriptor.fromJson({
      'state': 'thumbnailReady',
      'url': '/art/box',
      'width': 512,
      'height': 374,
    });
    final protocol3 = GameArtworkCapabilities.fromJson({
      'protocolVersion': 3,
      'manifest': true,
      'dimensions': true,
    });

    expect(descriptor.aspectRatio, closeTo(1.369, 0.001));
    expect(
      GameArtworkDescriptor.fromJson({'state': 'pending'}).aspectRatio,
      isNull,
    );
    expect(
      GameArtworkDescriptor.fromJson({'state': 'x', 'width': 512, 'height': 0})
          .aspectRatio,
      isNull,
    );
    expect(protocol3.supportsDimensions, isTrue);
    expect(protocol3.supportsManifest, isTrue);
    expect(
      GameArtworkCapabilities.fromJson({
        'protocolVersion': 2,
        'dimensions': true,
      }).supportsDimensions,
      isFalse,
    );
  });

  test('versioned artwork URLs retain the authenticated server origin', () {
    final artwork = Uri.parse(
      createApi().artworkUrl('/Moonfin/Games/retro/Artwork/zelda/boxart/rev-1'),
    );

    expect(artwork.host, 'redstar.example');
    expect(artwork.path, '/Moonfin/Games/retro/Artwork/zelda/boxart/rev-1');
    expect(artwork.queryParameters['ApiKey'], 'test-token');
  });

  test(
    'cancelArtworkRequests cancels active manifest and priority calls',
    () async {
      final adapter = _BlockingArtworkAdapter();
      final dio = Dio()..httpClientAdapter = adapter;
      final api = MoonbaseGamesApi(
        dio,
        () => 'http://redstar.example:8101',
        () => 'test-token',
        ServerType.jellyfin,
      );
      final manifest = api.getArtworkManifest('library', systemId: 'nes');
      final priority = api.submitArtworkPriority(
        'library',
        const GameArtworkPriorityRequest(
          systemId: 'nes',
          knownGeneration: 'generation-1',
          items: <GameArtworkPriorityItem>[],
        ),
      );
      final manifestExpectation = expectLater(
        manifest,
        throwsA(isA<DioException>()),
      );
      final priorityExpectation = expectLater(
        priority,
        throwsA(isA<DioException>()),
      );
      await adapter.bothStarted.future;

      api.cancelArtworkRequests();

      await manifestExpectation;
      await priorityExpectation;
      await adapter.allCancelled.future;
      expect(adapter.active, 0);
    },
  );

  test('artwork cancellation is isolated to its adapter owner', () async {
    final adapter = _BlockingArtworkAdapter();
    final dio = Dio()..httpClientAdapter = adapter;
    final api = MoonbaseGamesApi(
      dio,
      () => 'http://redstar.example:8101',
      () => 'test-token',
      ServerType.jellyfin,
    );
    final manifestOwner = Object();
    final priorityOwner = Object();
    final manifest = api.getArtworkManifest(
      'library',
      systemId: 'nes',
      cancellationOwner: manifestOwner,
    );
    final priority = api.submitArtworkPriority(
      'library',
      const GameArtworkPriorityRequest(
        systemId: 'nes',
        knownGeneration: 'generation-1',
        items: <GameArtworkPriorityItem>[],
      ),
      cancellationOwner: priorityOwner,
    );
    final manifestExpectation = expectLater(
      manifest,
      throwsA(isA<DioException>()),
    );
    final priorityExpectation = expectLater(
      priority,
      throwsA(isA<DioException>()),
    );
    await adapter.bothStarted.future;

    api.cancelArtworkRequests(cancellationOwner: manifestOwner);
    await manifestExpectation;
    expect(adapter.active, 1);

    api.cancelArtworkRequests(cancellationOwner: priorityOwner);
    await priorityExpectation;
    await adapter.allCancelled.future;
    expect(adapter.active, 0);
  });
}

class _BlockingArtworkAdapter implements HttpClientAdapter {
  final Completer<void> bothStarted = Completer<void>();
  final Completer<void> allCancelled = Completer<void>();
  int active = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    active++;
    if (active == 2 && !bothStarted.isCompleted) bothStarted.complete();
    try {
      await cancelFuture;
    } finally {
      active--;
      if (active == 0 && !allCancelled.isCompleted) allCancelled.complete();
    }
    throw DioException(requestOptions: options, type: DioExceptionType.cancel);
  }

  @override
  void close({bool force = false}) {}
}
