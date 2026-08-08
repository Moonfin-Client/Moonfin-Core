import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/game_artwork_cache.dart';
import 'package:moonfin/util/tv_image_cache_io.dart';

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
    expect(key, isNot(contains('/')));
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
      now: now,
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
        now: now,
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
      now: now,
    );

    expect(evicted, [gameArtworkCacheKeyForScope('library/Sega')]);
    expect(arcade.existsSync(), isTrue);
    expect(sega.existsSync(), isFalse);
  });
}
