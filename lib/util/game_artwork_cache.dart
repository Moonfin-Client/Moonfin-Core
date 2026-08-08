import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Prefix for per-system game-artwork caches. Sharing the global media cache
/// would let game browsing evict movie, TV, and music artwork.
const gameArtworkCacheKey = 'moonfin-game-artwork';

/// Game artwork deliberately has a dedicated global disk ceiling. It must not
/// consume the user-configured media image cache budget, which is reserved for
/// Movies, TV, and Music artwork.
const gameArtworkCacheBudgetBytes = 150 * 1024 * 1024;
const gameArtworkCacheMaxObjectsPerSystem = 900;

/// A compact, path-safe cache key for one `libraryId/systemId` scope.
///
/// Base64-url encoding avoids leaking directory separators into the cache
/// directory name while retaining a deterministic, collision-free mapping.
String gameArtworkCacheKeyForScope(String scope) {
  final encoded = base64Url.encode(utf8.encode(scope)).replaceAll('=', '');
  return '$gameArtworkCacheKey-$encoded';
}

String gameArtworkScope(String libraryId, String systemId) =>
    '$libraryId/$systemId';

bool isGameArtworkCacheDirectoryName(String name) =>
    name == gameArtworkCacheKey || name.startsWith('$gameArtworkCacheKey-');

final Map<String, BaseCacheManager> _gameArtworkCacheManagers =
    <String, BaseCacheManager>{};

/// Returns the cache dedicated to one game system. A system's art remains
/// available while the user filters or scrolls within it; inactive systems are
/// evicted as whole units only when the shared game-art budget needs room.
BaseCacheManager gameArtworkCacheManagerForScope(String scope) {
  final cacheKey = gameArtworkCacheKeyForScope(scope);
  return _gameArtworkCacheManagers.putIfAbsent(
    cacheKey,
    () => CacheManager(
      Config(
        cacheKey,
        stalePeriod: const Duration(days: 14),
        maxNrOfCacheObjects: gameArtworkCacheMaxObjectsPerSystem,
      ),
    ),
  );
}

/// Clears a cache managed in this process without invalidating the manager's
/// own metadata database. Returns false for a cache created by an older app
/// session, where deleting its directory is safe.
Future<bool> clearLiveGameArtworkCache(String cacheKey) async {
  final manager = _gameArtworkCacheManagers[cacheKey];
  if (manager == null) return false;
  await manager.emptyCache();
  return true;
}

/// Backward-compatible fallback for callers that do not know a system. New
/// game screens should use [gameArtworkCacheManagerForScope] instead.
final BaseCacheManager gameArtworkCacheManager =
    gameArtworkCacheManagerForScope('_unscoped');

/// Systems-list tiles use a handful of preview thumbnails per system (up to
/// four) drawn from every system the user has ever browsed. Kept in its own
/// cache manager, with its own tiny budget, so the per-system sweep below
/// never touches it: revisiting the systems list must never re-download tile
/// art, even right after switching away from a system purges its own cache.
const gameSystemArtworkCacheKey = 'moonfin-game-systems';

/// Tens of systems times up to four preview thumbnails each is a small,
/// roughly fixed working set, so this budget is deliberately small.
const gameSystemArtworkCacheBudgetBytes = 24 * 1024 * 1024;

final BaseCacheManager gameSystemArtworkCacheManager = CacheManager(
  Config(
    gameSystemArtworkCacheKey,
    stalePeriod: const Duration(days: 14),
    maxNrOfCacheObjects: 300,
  ),
);
