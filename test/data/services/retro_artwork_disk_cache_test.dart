import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_cache.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_disk_cache.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_disk_cache_io.dart'
    show RetroArtworkDiskLruCache;

void main() {
  late Directory temporaryDirectory;

  setUp(() async {
    temporaryDirectory = await Directory.systemTemp.createTemp(
      'moonfin-retro-artwork-cache-',
    );
  });

  tearDown(() async {
    if (await temporaryDirectory.exists()) {
      await temporaryDirectory.delete(recursive: true);
    }
  });

  test(
    'retains compressed artwork and exact accounting across restart',
    () async {
      final first = await openRetroArtworkDiskCacheAt(
        temporaryDirectory.path,
        maxBytes: 10,
      );
      final key = _key('revision-1');
      await first.put(key, Uint8List.fromList(<int>[1, 2, 3]));

      final reopened = await openRetroArtworkDiskCacheAt(
        temporaryDirectory.path,
        maxBytes: 10,
      );

      expect(await reopened.get(key), <int>[1, 2, 3]);
      expect(reopened.currentBytes, 3);
      expect(reopened.length, 1);
    },
  );

  test('persists least-recently-used eviction decisions', () async {
    final cache = await openRetroArtworkDiskCacheAt(
      temporaryDirectory.path,
      maxBytes: 4,
    );
    final first = _key('revision-1');
    final second = _key('revision-2');
    final third = _key('revision-3');
    await cache.put(first, Uint8List.fromList(<int>[1, 1]));
    await cache.put(second, Uint8List.fromList(<int>[2, 2]));
    await cache.get(first);
    await cache.put(third, Uint8List.fromList(<int>[3, 3]));

    final reopened = await openRetroArtworkDiskCacheAt(
      temporaryDirectory.path,
      maxBytes: 4,
    );

    expect(await reopened.get(first), isNotNull);
    expect(await reopened.get(second), isNull);
    expect(await reopened.get(third), isNotNull);
    expect(reopened.currentBytes, 4);
  });

  test('recovers entry files when the metadata index is corrupt', () async {
    final cache = await openRetroArtworkDiskCacheAt(
      temporaryDirectory.path,
      maxBytes: 10,
    );
    final key = _key('revision-1');
    await cache.put(key, Uint8List.fromList(<int>[4, 5, 6]));
    await _indexFile(
      temporaryDirectory,
    ).writeAsString('{not-json', flush: true);

    final recovered = await openRetroArtworkDiskCacheAt(
      temporaryDirectory.path,
      maxBytes: 10,
    );

    expect(await recovered.get(key), <int>[4, 5, 6]);
    expect(recovered.currentBytes, 3);
    expect(recovered.length, 1);
  });

  test('repeated cache hits do not rewrite the index each time', () async {
    final cache =
        await openRetroArtworkDiskCacheAt(
              temporaryDirectory.path,
              maxBytes: 1024,
            )
            as RetroArtworkDiskLruCache;
    final key = _key('revision-1');
    await cache.put(key, Uint8List.fromList(<int>[1, 2, 3]));
    final writesAfterPut = cache.debugIndexWriteCount;

    // These are front-cache hits (the steady state while scrolling a
    // system grid): the entry was just written, so it is still resident
    // in the in-memory front cache. Only `lastAccess` bookkeeping
    // changes -- the debounce must coalesce all twenty into at most one
    // background write, not one write per hit.
    for (var i = 0; i < 20; i++) {
      await cache.get(key);
    }

    expect(
      cache.debugIndexWriteCount - writesAfterPut,
      lessThanOrEqualTo(1),
      reason: 'LRU bookkeeping must not fsync per read',
    );
  });

  test(
    'recovers the atomic metadata backup after an interrupted replace',
    () async {
      final cache = await openRetroArtworkDiskCacheAt(
        temporaryDirectory.path,
        maxBytes: 10,
      );
      final key = _key('revision-1');
      await cache.put(key, Uint8List.fromList(<int>[7, 8]));
      final index = _indexFile(temporaryDirectory);
      await index.rename('${index.path}.bak');
      await File('${index.path}.tmp').writeAsString('partial', flush: true);

      final recovered = await openRetroArtworkDiskCacheAt(
        temporaryDirectory.path,
        maxBytes: 10,
      );

      expect(await recovered.get(key), <int>[7, 8]);
      expect(await File('${index.path}.tmp').exists(), isFalse);
      expect(await File('${index.path}.bak').exists(), isFalse);
    },
  );
}

File _indexFile(Directory directory) =>
    File('${directory.path}${Platform.pathSeparator}index.json');

RetroArtworkCacheKey _key(String revision) => RetroArtworkCacheKey(
  serverIdentity: 'server-record-1',
  libraryId: 'library',
  gameId: 'game',
  role: 'boxart',
  revision: revision,
);
