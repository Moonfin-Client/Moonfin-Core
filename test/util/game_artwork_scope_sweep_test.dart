import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/game_artwork_cache.dart';
import 'package:moonfin/util/image_cache_index.dart';
import 'package:moonfin/util/tv_image_cache_io.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Lets [clearImageDiskCache] see a controlled temporary directory.
class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.root);

  final Directory root;

  @override
  Future<String?> getTemporaryPath() async => root.path;

  @override
  Future<String?> getApplicationSupportPath() async =>
      '${root.path}/support';
}

void main() {
  late Directory root;
  final now = DateTime(2026, 1, 1, 12);

  setUp(() {
    root = Directory.systemTemp.createTempSync('game_artwork_cache_test_');
  });

  tearDown(() {
    if (root.existsSync()) root.deleteSync(recursive: true);
  });

  Directory writeScope(String scope, int bytes, DateTime lastUsed) {
    final key = gameArtworkCacheKeyForScope(scope);
    final dir = Directory('${root.path}/$key')..createSync();
    final artwork = File('${dir.path}/art.png')
      ..writeAsBytesSync(List.filled(bytes, 1));
    artwork.setLastModifiedSync(lastUsed);
    final access = File('${dir.path}/.moonfin-scope-access')
      ..writeAsStringSync('');
    access.setLastModifiedSync(lastUsed);
    return dir;
  }

  test('cache keys are deterministic and path safe', () {
    final key = gameArtworkCacheKeyForScope('library/Arcade & MAME');

    expect(key, startsWith('$gameArtworkCacheKey-'));
    expect(key, matches(RegExp(r'^[A-Za-z0-9._-]+$')));
    expect(key, gameArtworkCacheKeyForScope('library/Arcade & MAME'));
  });

  test('does nothing below the global game-art budget', () async {
    final arcade = writeScope(
      'library/Arcade',
      20,
      now.subtract(const Duration(minutes: 2)),
    );
    final sega = writeScope(
      'library/Sega',
      20,
      now.subtract(const Duration(minutes: 1)),
    );

    final evicted = await evictInactiveGameArtworkCaches(
      root,
      budgetBytes: 64,
      protectedCacheKeys: const {},
    );

    expect(evicted, isEmpty);
    expect(arcade.existsSync(), isTrue);
    expect(sega.existsSync(), isTrue);
  });

  test(
    'evicts the least-recent inactive system as a whole under pressure',
    () async {
      final arcade = writeScope(
        'library/Arcade',
        40,
        now.subtract(const Duration(minutes: 3)),
      );
      final sega = writeScope(
        'library/Sega',
        40,
        now.subtract(const Duration(minutes: 2)),
      );
      final nes = writeScope(
        'library/NES',
        40,
        now.subtract(const Duration(minutes: 1)),
      );

      final evicted = await evictInactiveGameArtworkCaches(
        root,
        budgetBytes: 100,
        protectedCacheKeys: const {},
      );

      expect(evicted, [gameArtworkCacheKeyForScope('library/Arcade')]);
      expect(arcade.existsSync(), isFalse);
      expect(sega.existsSync(), isTrue);
      expect(nes.existsSync(), isTrue);
    },
  );

  test('never evicts the active system, even when it is the oldest', () async {
    final arcade = writeScope(
      'library/Arcade',
      80,
      now.subtract(const Duration(minutes: 3)),
    );
    final sega = writeScope(
      'library/Sega',
      80,
      now.subtract(const Duration(minutes: 2)),
    );

    final evicted = await evictInactiveGameArtworkCaches(
      root,
      budgetBytes: 100,
      protectedCacheKeys: {gameArtworkCacheKeyForScope('library/Arcade')},
    );

    expect(evicted, [gameArtworkCacheKeyForScope('library/Sega')]);
    expect(arcade.existsSync(), isTrue);
    expect(sega.existsSync(), isFalse);
  });

  test(
    'clearImageDiskCache live-clears a directory with an in-process manager '
    'but deletes an orphaned one wholesale',
    () async {
      final originalPathProvider = PathProviderPlatform.instance;
      PathProviderPlatform.instance = _FakePathProvider(root);
      addTearDown(() => PathProviderPlatform.instance = originalPathProvider);

      // Live manager, as browsing a game system would create.
      gameArtworkCacheManagerForScope('library/Arcade');
      addTearDown(resetGameArtworkCacheManagers);
      final live = writeScope('library/Arcade', 10, now);
      // No manager: a cache left behind by an older session.
      final orphan = writeScope('library/Sega', 10, now);

      await clearImageDiskCache();

      expect(
        live.existsSync(),
        isTrue,
        reason: 'a live manager must be cleared in place, not deleted out '
            'from under it',
      );
      expect(
        orphan.existsSync(),
        isFalse,
        reason: 'a directory with no live manager is safe to delete wholesale',
      );
    },
  );

  test('the artwork size sweep leaves the index file alone', () async {
    final originalPathProvider = PathProviderPlatform.instance;
    PathProviderPlatform.instance = _FakePathProvider(root);
    addTearDown(() => PathProviderPlatform.instance = originalPathProvider);

    final dir = Directory('${root.path}/libCachedImageData')..createSync();
    final old = DateTime(2020);
    for (var i = 0; i < 4; i++) {
      final file = File('${dir.path}/$i.jpg')
        ..writeAsBytesSync(List.filled(1000, 1));
      file.setLastModifiedSync(old.add(Duration(days: i)));
    }
    final index = File('${dir.path}/${ImageCacheIndex.indexFileName}')
      ..writeAsStringSync('{"v":1,"next":1,"e":[]}');
    index.setLastModifiedSync(old);

    // Budget of 1500 bytes against 4000 of artwork: the oldest go first,
    // and the index, oldest of all by timestamp, isn't artwork.
    await enforceImageCacheBudget(1500);

    expect(index.existsSync(), isTrue);
    final artwork = dir.listSync().whereType<File>().where(
      (f) => f.path.endsWith('.jpg'),
    );
    expect(artwork.length, lessThan(4));
  });
}
