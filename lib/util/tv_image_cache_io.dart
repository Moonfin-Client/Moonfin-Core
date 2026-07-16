import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'platform_detection.dart';

bool _sweeping = false;
DateTime? _lastSweep;

// Point cached_network_image at a cache manager with a shorter stale period and
// a higher object count than the library default. The object count is a soft
// cap only, the real ceiling is the byte budget enforced by
// enforceImageCacheBudget. Files stay in the library's default directory so an
// existing cache is never orphaned on update.
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
    // Deliberately a plain CacheManager: nothing asks the disk layer to resize,
    // and if anything ever does, this trips an assert rather than silently
    // storing a second re-encoded copy of every image.
    CachedNetworkImageProvider.defaultCacheManager = CacheManager(config);
  } catch (_) {}
}

// Trim the image cache directory to [budgetBytes] by deleting the least recently
// written files first. A missing file is a cache miss the manager re-downloads,
// so deleting directly is safe. Best effort only, so a failure never blocks.
Future<void> enforceImageCacheBudget(
  int budgetBytes, {
  bool throttle = false,
}) async {
  if (budgetBytes <= 0 || _sweeping) return;
  final now = DateTime.now();
  if (throttle &&
      _lastSweep != null &&
      now.difference(_lastSweep!) < const Duration(minutes: 3)) {
    return;
  }
  _sweeping = true;
  _lastSweep = now;
  try {
    final temp = await getTemporaryDirectory();
    final dir = Directory('${temp.path}/${DefaultCacheManager.key}');
    if (!await dir.exists()) return;

    final entries = <({File file, int size, DateTime modified})>[];
    var total = 0;
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
      // Never delete a file that may still be downloading.
      if (now.difference(entry.modified) < const Duration(seconds: 30)) continue;
      try {
        await entry.file.delete();
        total -= entry.size;
      } catch (_) {}
    }
  } catch (_) {
  } finally {
    _sweeping = false;
  }
}

Future<void> clearImageDiskCache() async {
  try {
    await CachedNetworkImageProvider.defaultCacheManager.emptyCache();
  } catch (_) {}
}
