import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart';

import '../data/services/retro_artwork/retro_artwork_disk_cache_io.dart';
import 'artwork_request_scheduler.dart';
import 'device_performance.dart';
import 'game_artwork_cache.dart';
import 'image_cache_index.dart';
import 'image_fetch_priority.dart';
import 'image_file_service.dart';
import 'platform_detection.dart';

final Set<String> _sweepingCacheKeys = <String>{};
final Map<String, DateTime> _lastSweepByCacheKey = <String, DateTime>{};

/// The index of the artwork cache, once configured. Null on web and before
/// startup reaches the cache.
ImageCacheIndex? _imageCacheIndex;

/// How many files the artwork cache keeps before it evicts by age.
///
/// Was 600, which a single library screen fills, so nothing older than a
/// couple of browses ever survived. The megabyte budget the user sets is the
/// limit that should bind, and at the sizes served (posters 40 to 70 KB,
/// backdrops a few hundred) these counts sit above every budget below one
/// gigabyte. The index costs about half a kilobyte of memory per row.
const imageCacheMaxObjects = 8000;
const reducedImageCacheMaxObjects = 4000;

int imageCacheMaxObjectsFor(DevicePerformanceTier tier) => switch (tier) {
  DevicePerformanceTier.standard => imageCacheMaxObjects,
  DevicePerformanceTier.reduced => reducedImageCacheMaxObjects,
};

// Point cached_network_image at a cache manager with a shorter stale period
// and a higher object count than the library default, indexed in memory.
// Files stay in the library's default directory so an existing cache is never
// orphaned on update, and the index the library kept before is read once and
// left in place so an older build still finds it.
Future<void> configureImageDiskCache({
  DevicePerformanceTier tier = DevicePerformanceTier.standard,
}) async {
  try {
    final key = DefaultCacheManager.key;
    const stalePeriod = Duration(days: 14);
    final fileService = buildImageFileService(tier: tier);
    final index = ImageCacheIndex(
      directory: await _imageCacheDirectory(key),
      // Resolved inside the index's own budget. Finding the old index means
      // asking path_provider, and that ask must never hold the launch.
      legacy: () => _legacyImageCacheRepository(key),
    );
    _imageCacheIndex = index;
    CachedNetworkImageProvider.defaultCacheManager = CacheManager(
      Config(
        key,
        stalePeriod: stalePeriod,
        maxNrOfCacheObjects: imageCacheMaxObjectsFor(tier),
        fileService: fileService,
        repo: index,
      ),
    );
  } catch (_) {}
}

/// Where the index lives, or null when the platform didn't say in time.
///
/// Waits as long as the launch waits on any other platform channel. Null
/// rather than a throw: a throw here would leave the image provider on the
/// library's default manager, which is sqflite on Apple platforms.
Future<Directory?> _imageCacheDirectory(String key) async {
  try {
    final temp = await getTemporaryDirectory().timeout(
      const Duration(seconds: 2),
    );
    return Directory('${temp.path}/$key');
  } catch (_) {
    return null;
  }
}

/// Where the library kept the index before this app owned it: sqflite on the
/// platforms it shipped that on, a JSON file elsewhere, and on Apple TV the
/// JSON file this app pointed it at, since sqflite isn't built for it.
Future<CacheInfoRepository?> _legacyImageCacheRepository(String key) async {
  try {
    if (PlatformDetection.isAppleTV) {
      final cacheDir = await getApplicationCacheDirectory();
      return JsonCacheInfoRepository.withFile(
        File('${cacheDir.path}/$key.json'),
      );
    }
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      return CacheObjectProvider(databaseName: key);
    }
    return JsonCacheInfoRepository(databaseName: key);
  } catch (_) {
    return null;
  }
}

/// Writes the artwork index if it has changed. Called when the app pauses,
/// since a killed process never reaches the timed flush.
Future<void> flushImageCacheIndex() async {
  try {
    await _imageCacheIndex?.flush();
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

/// The user just left but scope is still protected while their in-flight transfers
/// land. Flutter cache manager can't cancel a download, so releasing a scope
/// only stops new work; the writes already issued finish on their own.
final Map<String, DateTime> _coolingGameArtworkScopes = <String, DateTime>{};
const _gameArtworkScopeCooldown = Duration(seconds: 30);

/// Marks a system as actively browsed. Active systems are never evicted by a
/// resume/startup cache sweep, even if the global game-art budget is exceeded.
Future<void> retainGameArtworkCacheScope(String scope) async {
  _activeGameArtworkScopes.update(
    scope,
    (count) => count + 1,
    ifAbsent: () => 1,
  );
  _coolingGameArtworkScopes.remove(scope);
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
    _coolingGameArtworkScopes[scope] = DateTime.now();
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
    _coolingGameArtworkScopes.removeWhere(
      (_, releasedAt) => now.difference(releasedAt) >= _gameArtworkScopeCooldown,
    );
    final temp = await getTemporaryDirectory();
    await evictInactiveGameArtworkCaches(
      temp,
      budgetBytes: gameArtworkCacheBudgetBytes,
      protectedCacheKeys: <String>{
        ..._activeGameArtworkScopes.keys,
        ..._coolingGameArtworkScopes.keys,
      }.map(gameArtworkCacheKeyForScope).toSet(),
    );
  } catch (_) {
  } finally {
    _sweepingCacheKeys.remove(_gameArtworkBudgetSweepKey);
  }
}

/// Evicts whole inactive system caches, least-recently-used first, until the
/// game-art budget is met: dropping a scope entire avoids puncturing an
/// in-progress browse with scattered missing artwork. Public for filesystem
/// tests; callers keep a just-left scope in protectedCacheKeys for a cooldown.
Future<List<String>> evictInactiveGameArtworkCaches(
  Directory temporaryDirectory, {
  required int budgetBytes,
  required Set<String> protectedCacheKeys,
}) async {
  if (budgetBytes <= 0 || !await temporaryDirectory.exists()) return const [];
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
      caches.where((cache) => !protectedCacheKeys.contains(cache.key)).toList()
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
  });

  final Directory directory;
  final String key;
  final int bytes;
  final DateTime lastUsed;
}

Future<_GameArtworkCacheDirectory?> _inspectGameArtworkCacheDirectory(
  Directory directory,
) async {
  try {
    var bytes = 0;
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

String _fileName(File file) {
  final path = file.path;
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
      if (ImageCacheIndex.isIndexFileName(_fileName(entity))) continue;
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
    // Durable at once, or a kill before the timed flush brings the rows back
    // for files that are gone.
    await _imageCacheIndex?.flush();
    final temp = await getTemporaryDirectory();
    await for (final entity in temp.list(followLinks: false)) {
      if (entity is Directory &&
          isGameArtworkCacheDirectoryName(_directoryName(entity))) {
        if (!await clearLiveGameArtworkCache(_directoryName(entity))) {
          await entity.delete(recursive: true);
        }
      }
    }
    await gameSystemArtworkCacheManager.emptyCache();
    final retroArtworkCacheDir = await defaultRetroArtworkDiskCacheDirectory();
    if (await retroArtworkCacheDir.exists()) {
      await retroArtworkCacheDir.delete(recursive: true);
    }
  } catch (_) {}
}

/// The client every artwork request goes through.
///
/// A grid asks for dozens of images at once, and with no bound this opened a
/// connection per image and waited for the system to give up on each one that
/// hung. That is what fails on a link that drops connection attempts while the
/// API calls beside it, which are bounded, succeed.
@visibleForTesting
HttpClient buildImageHttpClient() => HttpClient()
  ..maxConnectionsPerHost = imageRequestSlots
  ..connectionTimeout = const Duration(seconds: 8)
  // dart:io reuses a pooled connection without checking it is still open, so
  // the longer one is held the better the odds the peer let go of it in the
  // meantime. Two minutes covered a whole browse, and a stale one there stalls
  // every image rather than one request.
  ..idleTimeout = const Duration(seconds: 15);

/// Artwork shares the link with the API calls, so it takes the smaller share.
const imageRequestSlots = 4;

/// What a device short on memory fetches at once. Halving the burst halves how
/// many encoded images are in flight while their neighbours decode. Two rather
/// than one, because a single slot puts every stalled fetch in front of the
/// whole grid and trades the crash for a wait.
const reducedImageRequestSlots = 2;

int imageRequestSlotsFor(DevicePerformanceTier tier) => switch (tier) {
  DevicePerformanceTier.standard => imageRequestSlots,
  DevicePerformanceTier.reduced => reducedImageRequestSlots,
};

/// What the cache manager's own gate is set to once the scheduler holds the
/// real one. Wide enough that it never queues a request the scheduler would
/// have sent first, and still a number so a runaway can't grow unbounded.
const _schedulerBypassFetches = 4096;

/// The service every artwork request goes through.
///
/// Images fetch through the cache manager's own client rather than Dio, so
/// this is the one place they can pick up the server User-Agent. Without it a
/// proxy that filters on the agent blocks every image while API calls still
/// succeed.
///
/// The scheduler admits no more at once than [buildImageHttpClient] will
/// connect. Letting more through leaves the rest in a queue inside dart:io
/// that nothing times out, where a request waiting in the scheduler holds no
/// connection and no timer. The cache manager's own gate is opened wide so
/// the order is the scheduler's, not first come first served.
BoundedImageFileService buildImageFileService({
  DevicePerformanceTier tier = DevicePerformanceTier.standard,
}) {
  final scheduler = ArtworkRequestScheduler(slots: imageRequestSlotsFor(tier));
  artworkRequestPromoter = scheduler.promote;
  return BoundedImageFileService(
    _ServerUserAgentHttpClient(IOClient(buildImageHttpClient())),
    concurrentFetches: _schedulerBypassFetches,
    scheduler: scheduler,
  );
}

class _ServerUserAgentHttpClient extends http.BaseClient {
  _ServerUserAgentHttpClient(this._inner);

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['User-Agent'] = serverUserAgent;
    return _inner.send(request);
  }
}
