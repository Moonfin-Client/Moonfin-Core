import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

import '../data/services/retro_artwork/retro_artwork_disk_cache_io.dart';
import 'game_artwork_cache.dart';
import 'platform_detection.dart';

final Set<String> _sweepingCacheKeys = <String>{};
final Map<String, DateTime> _lastSweepByCacheKey = <String, DateTime>{};

// Point cached_network_image at a cache manager with a shorter stale period and
// a higher object count than the library default. Files stay in the library's
// default directory so an existing cache is never orphaned on update.
Future<void> configureImageDiskCache() async {
  try {
    final key = DefaultCacheManager.key;
    const stalePeriod = Duration(days: 14);
    const maxObjects = 600;
    Config config;
    if (PlatformDetection.isAppleTV) {
      final cacheDir = await getApplicationCacheDirectory();
      config = Config(
        key,
        stalePeriod: stalePeriod,
        maxNrOfCacheObjects: maxObjects,
        repo: JsonCacheInfoRepository.withFile(
          File('${cacheDir.path}/$key.json'),
        ),
      );
    } else {
      config = Config(
        key,
        stalePeriod: stalePeriod,
        maxNrOfCacheObjects: maxObjects,
      );
    }
    CachedNetworkImageProvider.defaultCacheManager = CacheManager(config);
  } catch (_) {}
}

// Game artwork has its own fixed budget, so browsing games never displaces
// movie, TV, or music artwork from the user's media cache allocation.
Future<void> enforceImageCacheBudget(
  int budgetBytes, {
  bool throttle = false,
}) async {
  await _enforceCacheDirectoryBudget(
    DefaultCacheManager.key,
    budgetBytes,
    throttle: throttle,
  );
}

Future<void> enforceGameArtworkCacheBudget({bool throttle = false}) =>
    _enforceGameArtworkCacheBudget(throttle: throttle);

const _gameArtworkScopeAccessFileName = '.moonfin-scope-access';
const _gameArtworkBudgetSweepKey = '$gameArtworkCacheKey-budget';
final Map<String, int> _activeGameArtworkScopes = <String, int>{};

/// Marks a system as actively browsed. Active systems are never evicted by a
/// resume/startup cache sweep, even if the global game-art budget is exceeded.
Future<void> retainGameArtworkCacheScope(String scope) async {
  _activeGameArtworkScopes.update(
    scope,
    (count) => count + 1,
    ifAbsent: () => 1,
  );
  try {
    final temp = await getTemporaryDirectory();
    final dir = Directory('${temp.path}/${gameArtworkCacheKeyForScope(scope)}');
    await dir.create(recursive: true);
    await File(
      '${dir.path}/$_gameArtworkScopeAccessFileName',
    ).writeAsString('', flush: true);
  } catch (_) {}
}

void releaseGameArtworkCacheScope(String scope) {
  final count = _activeGameArtworkScopes[scope];
  if (count == null || count <= 1) {
    _activeGameArtworkScopes.remove(scope);
  } else {
    _activeGameArtworkScopes[scope] = count - 1;
  }
}

Future<void> _enforceGameArtworkCacheBudget({required bool throttle}) async {
  if (_sweepingCacheKeys.contains(_gameArtworkBudgetSweepKey)) return;
  final now = DateTime.now();
  final lastSweep = _lastSweepByCacheKey[_gameArtworkBudgetSweepKey];
  if (throttle &&
      lastSweep != null &&
      now.difference(lastSweep) < const Duration(minutes: 3)) {
    return;
  }

  _sweepingCacheKeys.add(_gameArtworkBudgetSweepKey);
  _lastSweepByCacheKey[_gameArtworkBudgetSweepKey] = now;
  try {
    final temp = await getTemporaryDirectory();
    await evictInactiveGameArtworkCaches(
      temp,
      budgetBytes: gameArtworkCacheBudgetBytes,
      protectedCacheKeys: _activeGameArtworkScopes.keys
          .map(gameArtworkCacheKeyForScope)
          .toSet(),
      now: now,
    );
  } catch (_) {
  } finally {
    _sweepingCacheKeys.remove(_gameArtworkBudgetSweepKey);
  }
}

/// Evicts complete inactive system caches least-recently-used first until the
/// game-art budget is met. Deleting a whole inactive scope avoids puncturing a
/// user's in-progress browse with scattered missing artwork.
///
/// Exposed for deterministic filesystem tests. A recently modified inactive
/// directory is left alone because a non-cancellable image transfer from the
/// just-closed system may still be writing into it.
Future<List<String>> evictInactiveGameArtworkCaches(
  Directory temporaryDirectory, {
  required int budgetBytes,
  required Set<String> protectedCacheKeys,
  DateTime? now,
}) async {
  if (budgetBytes <= 0 || !await temporaryDirectory.exists()) return const [];
  final sweepTime = now ?? DateTime.now();
  final caches = <_GameArtworkCacheDirectory>[];
  await for (final entity in temporaryDirectory.list(followLinks: false)) {
    if (entity is! Directory ||
        !isGameArtworkCacheDirectoryName(_directoryName(entity))) {
      continue;
    }
    final stats = await _inspectGameArtworkCacheDirectory(entity);
    if (stats != null) caches.add(stats);
  }

  var total = caches.fold<int>(0, (sum, cache) => sum + cache.bytes);
  if (total <= budgetBytes) return const [];

  final target = (budgetBytes * 0.9).round();
  final inactive =
      caches
          .where((cache) => !protectedCacheKeys.contains(cache.key))
          .where(
            (cache) =>
                sweepTime.difference(cache.newestModified) >=
                const Duration(seconds: 30),
          )
          .toList()
        ..sort((a, b) => a.lastUsed.compareTo(b.lastUsed));

  final evicted = <String>[];
  for (final cache in inactive) {
    if (total <= target) break;
    try {
      final clearedLiveManager = await clearLiveGameArtworkCache(cache.key);
      if (clearedLiveManager) {
        // Keep the manager's metadata database intact; only remove our access
        // marker so the empty directory no longer represents retained artwork.
        final accessFile = File(
          '${cache.directory.path}/$_gameArtworkScopeAccessFileName',
        );
        if (await accessFile.exists()) await accessFile.delete();
      } else {
        await cache.directory.delete(recursive: true);
      }
      total -= cache.bytes;
      evicted.add(cache.key);
    } catch (_) {}
  }
  return evicted;
}

class _GameArtworkCacheDirectory {
  const _GameArtworkCacheDirectory({
    required this.directory,
    required this.key,
    required this.bytes,
    required this.lastUsed,
    required this.newestModified,
  });

  final Directory directory;
  final String key;
  final int bytes;
  final DateTime lastUsed;
  final DateTime newestModified;
}

Future<_GameArtworkCacheDirectory?> _inspectGameArtworkCacheDirectory(
  Directory directory,
) async {
  try {
    var bytes = 0;
    DateTime? newestModified;
    DateTime? lastUsed;
    final accessFile = File(
      '${directory.path}/$_gameArtworkScopeAccessFileName',
    );
    if (await accessFile.exists()) {
      lastUsed = (await accessFile.stat()).modified;
    }
    await for (final entity in directory.list(
      recursive: true,
      followLinks: false,
    )) {
      if (entity is! File) continue;
      final stat = await entity.stat();
      newestModified =
          newestModified == null || stat.modified.isAfter(newestModified)
          ? stat.modified
          : newestModified;
      if (!entity.path.endsWith(_gameArtworkScopeAccessFileName)) {
        bytes += stat.size;
      }
    }
    final directoryStat = await directory.stat();
    return _GameArtworkCacheDirectory(
      directory: directory,
      key: _directoryName(directory),
      bytes: bytes,
      lastUsed: lastUsed ?? directoryStat.modified,
      newestModified: newestModified ?? directoryStat.modified,
    );
  } catch (_) {
    return null;
  }
}

String _directoryName(Directory directory) {
  final path = directory.path;
  final separatorIndex = path.lastIndexOf(Platform.pathSeparator);
  return separatorIndex == -1 ? path : path.substring(separatorIndex + 1);
}

// A missing file is a cache miss the manager re-downloads, so deleting it
// directly is safe. Best effort only, so a failure never blocks the UI.
Future<void> _enforceCacheDirectoryBudget(
  String cacheKey,
  int budgetBytes, {
  required bool throttle,
}) async {
  if (budgetBytes <= 0 || _sweepingCacheKeys.contains(cacheKey)) return;
  final now = DateTime.now();
  final lastSweep = _lastSweepByCacheKey[cacheKey];
  if (throttle &&
      lastSweep != null &&
      now.difference(lastSweep) < const Duration(minutes: 3)) {
    return;
  }
  _sweepingCacheKeys.add(cacheKey);
  _lastSweepByCacheKey[cacheKey] = now;
  try {
    final temp = await getTemporaryDirectory();
    final entries = <({File file, int size, DateTime modified})>[];
    var total = 0;
    final dir = Directory('${temp.path}/$cacheKey');
    if (!await dir.exists()) return;
    await for (final entity in dir.list(followLinks: false)) {
      if (entity is! File) continue;
      try {
        final stat = await entity.stat();
        total += stat.size;
        entries.add((file: entity, size: stat.size, modified: stat.modified));
      } catch (_) {}
    }
    if (total <= budgetBytes) return;

    entries.sort((a, b) => a.modified.compareTo(b.modified));
    final target = (budgetBytes * 0.9).round();
    for (final entry in entries) {
      if (total <= target) break;
      if (now.difference(entry.modified) < const Duration(seconds: 30)) {
        continue;
      }
      try {
        await entry.file.delete();
        total -= entry.size;
      } catch (_) {}
    }
  } catch (_) {
  } finally {
    _sweepingCacheKeys.remove(cacheKey);
  }
}

Future<void> clearImageDiskCache() async {
  try {
    await CachedNetworkImageProvider.defaultCacheManager.emptyCache();
    final temp = await getTemporaryDirectory();
    await for (final entity in temp.list(followLinks: false)) {
      if (entity is Directory &&
          isGameArtworkCacheDirectoryName(_directoryName(entity))) {
        await entity.delete(recursive: true);
      }
    }
    final gameSystemCacheDir = Directory(
      '${temp.path}/$gameSystemArtworkCacheKey',
    );
    if (await gameSystemCacheDir.exists()) {
      await gameSystemCacheDir.delete(recursive: true);
    }
    // Protocol-2 artwork lives under the temporary directory too, but in its
    // own dedicated subdirectory rather than one the sweep above matches, so
    // it needs its own explicit delete. It is by far the largest of these
    // caches: a 150 MB budget against a few tens of MB for everything else
    // here.
    final retroArtworkCacheDir = await defaultRetroArtworkDiskCacheDirectory();
    if (await retroArtworkCacheDir.exists()) {
      await retroArtworkCacheDir.delete(recursive: true);
    }
  } catch (_) {}
}
