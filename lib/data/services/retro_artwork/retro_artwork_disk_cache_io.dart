import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'retro_artwork_cache.dart';

const _cacheDirectoryName = 'retro_game_art_cache';

/// Where [openDefaultRetroArtworkDiskCache] stores protocol-2 artwork.
///
/// Lives under the OS temporary/cache directory like every other image cache
/// in the app (movie/TV/music artwork, the legacy per-system game artwork
/// cache), just in its own dedicated subdirectory with its own budget. This
/// keeps it reachable by the platform's own "Clear Cache" action, not just
/// [clearImageDiskCache]'s explicit sweep.
Future<Directory> defaultRetroArtworkDiskCacheDirectory() async {
  final temp = await getTemporaryDirectory();
  return Directory(p.join(temp.path, _cacheDirectoryName));
}

const _indexFileName = 'index.json';
const _indexVersion = 1;
const _frontCacheBudgetBytes = 16 * 1024 * 1024;

/// How long a `lastAccess` bump waits, coalesced with any other bumps, before
/// it is written to disk. Long enough to absorb a burst of cache hits from
/// fast scrolling (dozens per second) into a single write; short enough that
/// the on-disk index does not drift far from reality between explicit
/// flushes (put/remove/clear/eviction/dispose, which are never debounced).
const _indexFlushDebounce = Duration(milliseconds: 400);

Future<RetroArtworkByteCache> openDefaultRetroArtworkDiskCache({
  int maxBytes = retroArtworkCacheBudgetBytes,
}) async {
  final directory = await defaultRetroArtworkDiskCacheDirectory();
  return openRetroArtworkDiskCacheAt(directory.path, maxBytes: maxBytes);
}

Future<RetroArtworkByteCache> openRetroArtworkDiskCacheAt(
  String directoryPath, {
  int maxBytes = retroArtworkCacheBudgetBytes,
}) async {
  return RetroArtworkDiskLruCache.open(
    Directory(directoryPath),
    maxBytes: maxBytes,
  );
}

class RetroArtworkDiskLruCache implements RetroArtworkByteCache {
  RetroArtworkDiskLruCache._(this._directory, {required this.maxBytes})
    : _front = RetroArtworkByteLruCache(
        maxBytes: maxBytes < _frontCacheBudgetBytes
            ? maxBytes
            : _frontCacheBudgetBytes,
      );

  static Future<RetroArtworkDiskLruCache> open(
    Directory directory, {
    int maxBytes = retroArtworkCacheBudgetBytes,
  }) async {
    if (maxBytes <= 0) {
      throw ArgumentError.value(maxBytes, 'maxBytes', 'Must be positive');
    }
    final cache = RetroArtworkDiskLruCache._(directory, maxBytes: maxBytes);
    await cache._initialize();
    return cache;
  }

  final Directory _directory;
  final RetroArtworkByteLruCache _front;
  final Map<String, _DiskEntry> _entries = <String, _DiskEntry>{};
  Future<void> _operationTail = Future<void>.value();
  int _currentBytes = 0;
  int _lastAccess = 0;

  // Debounced `lastAccess` bookkeeping (Task B5). A read hit (front-cache or
  // disk) only ever bumps `lastAccess` in memory; it never changes what
  // survives eviction or restart. Losing a queued bump on crash only
  // perturbs LRU ordering on the next run -- it can never corrupt
  // `_currentBytes`/`_entries`, and `_recoverEntryFiles` recomputes sizes
  // from the real files regardless. Every operation that *does* affect
  // correctness (put, remove, clear, eviction, corrupt-entry cleanup,
  // dispose) still flushes synchronously through [_persistIndexNow].
  bool _indexDirty = false;
  Timer? _indexFlushTimer;

  /// Number of times the index has actually been written to disk. Exists
  /// only so tests can assert the debounce is doing its job; production
  /// code never reads it. Testing-only -- do not use for control flow.
  int debugIndexWriteCount = 0;

  Directory get _entriesDirectory =>
      Directory(p.join(_directory.path, 'entries'));
  File get _indexFile => File(p.join(_directory.path, _indexFileName));

  @override
  final int maxBytes;

  @override
  int get currentBytes => _currentBytes;

  @override
  int get length => _entries.length;

  @override
  Future<Uint8List?> get(RetroArtworkCacheKey key) {
    return _serialized(() async {
      final storageKey = key.storageKey;
      final entry = _entries[storageKey];
      if (entry == null) return null;

      final frontBytes = _front.get(key);
      if (frontBytes != null) {
        // Steady-state scroll hit: bump in memory, coalesce the write.
        entry.lastAccess = _nextAccess();
        _markIndexDirty();
        return frontBytes;
      }

      final file = _entryFile(storageKey);
      try {
        final bytes = await file.readAsBytes();
        var sizeCorrected = false;
        if (bytes.lengthInBytes != entry.size) {
          _currentBytes += bytes.lengthInBytes - entry.size;
          entry.size = bytes.lengthInBytes;
          sizeCorrected = true;
        }
        entry.lastAccess = _nextAccess();
        final evictedOthers = await _evictToBudget();
        if (!_entries.containsKey(storageKey)) {
          // This entry was itself evicted by the size correction above.
          await _persistIndexNow();
          return null;
        }
        _front.put(key, bytes);
        if (sizeCorrected || evictedOthers) {
          // Accounting changed, not just `lastAccess` -- flush now.
          await _persistIndexNow();
        } else {
          _markIndexDirty();
        }
        return bytes;
      } catch (_) {
        _front.remove(key);
        await _removeEntry(storageKey);
        await _persistIndexNow();
        return null;
      }
    });
  }

  @override
  Future<bool> put(RetroArtworkCacheKey key, Uint8List bytes) {
    return _serialized(() async {
      final storageKey = key.storageKey;
      if (bytes.lengthInBytes > maxBytes) {
        await _removeEntry(storageKey);
        _front.remove(key);
        await _persistIndexNow();
        return false;
      }

      final previous = _entries[storageKey];
      if (previous != null) {
        _currentBytes -= previous.size;
      }
      try {
        await _atomicWriteBytes(_entryFile(storageKey), bytes);
      } catch (_) {
        if (previous != null) _currentBytes += previous.size;
        rethrow;
      }
      final entry = _DiskEntry(
        size: bytes.lengthInBytes,
        lastAccess: _nextAccess(),
      );
      _entries[storageKey] = entry;
      _currentBytes += entry.size;
      _front.put(key, bytes);
      await _evictToBudget();
      await _persistIndexNow();
      return _entries.containsKey(storageKey);
    });
  }

  @override
  Future<Uint8List?> remove(RetroArtworkCacheKey key) {
    return _serialized(() async {
      final cached = _front.remove(key);
      final removed = await _removeEntry(key.storageKey);
      if (removed != null) await _persistIndexNow();
      return cached;
    });
  }

  @override
  Future<void> clear() {
    return _serialized(() async {
      _front.clear();
      for (final storageKey in _entries.keys.toList(growable: false)) {
        await _removeEntry(storageKey);
      }
      await _persistIndexNow();
    });
  }

  /// Flushes any pending debounced `lastAccess` bookkeeping and cancels the
  /// timer. Call this when the cache instance is being torn down so a
  /// queued LRU-only update is not silently lost just because no further
  /// cache activity happens to trigger the debounce.
  @override
  Future<void> dispose() {
    return _serialized(() async {
      _indexFlushTimer?.cancel();
      _indexFlushTimer = null;
      if (_indexDirty) {
        await _persistIndexNow();
      }
    });
  }

  Future<void> _initialize() async {
    await _directory.create(recursive: true);
    await _entriesDirectory.create(recursive: true);
    await _recoverAtomicFile(_indexFile);
    await _loadIndex();
    await _recoverEntryFiles();
    await _evictToBudget();
    await _persistIndexNow();
  }

  Future<void> _loadIndex() async {
    if (!await _indexFile.exists()) return;
    try {
      final decoded = jsonDecode(await _indexFile.readAsString());
      if (decoded is! Map || decoded['version'] != _indexVersion) return;
      final encodedEntries = decoded['entries'];
      if (encodedEntries is! Map) return;
      for (final item in encodedEntries.entries) {
        if (item.key is! String || item.value is! Map) continue;
        final value = item.value as Map;
        final size = value['size'];
        final lastAccess = value['lastAccess'];
        if (size is! num || lastAccess is! num || size < 0) continue;
        final entry = _DiskEntry(
          size: size.toInt(),
          lastAccess: lastAccess.toInt(),
        );
        _entries[item.key as String] = entry;
        if (entry.lastAccess > _lastAccess) _lastAccess = entry.lastAccess;
      }
    } catch (_) {
      _entries.clear();
      _lastAccess = 0;
    }
  }

  Future<void> _recoverEntryFiles() async {
    await for (final entity in _entriesDirectory.list(followLinks: false)) {
      if (entity is! File) continue;
      final name = p.basename(entity.path);
      if (name.endsWith('.tmp')) {
        await _deleteIfPresent(entity);
        continue;
      }
      if (name.endsWith('.bak')) {
        final target = File(entity.path.substring(0, entity.path.length - 4));
        if (await target.exists()) {
          await _deleteIfPresent(entity);
        } else {
          await entity.rename(target.path);
        }
      }
    }

    final files = <String, File>{};
    await for (final entity in _entriesDirectory.list(followLinks: false)) {
      if (entity is! File) continue;
      final name = p.basename(entity.path);
      final match = RegExp(r'^([0-9a-f]{64})\.bin$').firstMatch(name);
      if (match != null) files[match.group(1)!] = entity;
    }

    _currentBytes = 0;
    for (final item in _entries.entries.toList(growable: false)) {
      final file = files.remove(item.key);
      if (file == null) {
        _entries.remove(item.key);
        continue;
      }
      final stat = await file.stat();
      item.value.size = stat.size;
      _currentBytes += stat.size;
    }

    for (final item in files.entries) {
      final stat = await item.value.stat();
      final accessed = stat.modified.microsecondsSinceEpoch;
      _entries[item.key] = _DiskEntry(size: stat.size, lastAccess: accessed);
      _currentBytes += stat.size;
      if (accessed > _lastAccess) _lastAccess = accessed;
    }
  }

  Future<_DiskEntry?> _removeEntry(String storageKey) async {
    final entry = _entries[storageKey];
    if (entry == null) return null;
    if (!await _deleteIfPresent(_entryFile(storageKey))) return null;
    _entries.remove(storageKey);
    _currentBytes -= entry.size;
    return entry;
  }

  /// Returns whether any entry was evicted.
  Future<bool> _evictToBudget() async {
    if (_currentBytes <= maxBytes) return false;
    var evicted = false;
    final oldest = _entries.entries.toList(growable: false)
      ..sort((a, b) => a.value.lastAccess.compareTo(b.value.lastAccess));
    for (final item in oldest) {
      if (_currentBytes <= maxBytes) break;
      if (await _removeEntry(item.key) != null) evicted = true;
    }
    if (evicted) _front.clear();
    return evicted;
  }

  /// Marks the index dirty and (re)schedules a short debounced flush. Used
  /// only for pure `lastAccess` bumps -- anything that changes what
  /// [_entries] contains must go through [_persistIndexNow] instead.
  void _markIndexDirty() {
    _indexDirty = true;
    _indexFlushTimer?.cancel();
    _indexFlushTimer = Timer(_indexFlushDebounce, () {
      _indexFlushTimer = null;
      unawaited(
        _serialized(() async {
          if (!_indexDirty) return;
          try {
            await _persistIndexNow();
          } catch (_) {
            // Best-effort background flush of LRU-only bookkeeping. A
            // failure just leaves `lastAccess` stale on disk until the
            // next put/remove/dispose flush -- never surface it as an
            // unhandled async error far from any caller.
          }
        }),
      );
    });
  }

  /// Cancels any pending debounced flush and writes the index immediately.
  /// Every operation that changes what survives eviction or restart
  /// (put/remove/clear/eviction/corrupt-entry cleanup/dispose) must go
  /// through this, not [_markIndexDirty].
  Future<void> _persistIndexNow() async {
    _indexFlushTimer?.cancel();
    _indexFlushTimer = null;
    _indexDirty = false;
    await _persistIndex();
  }

  Future<void> _persistIndex() async {
    debugIndexWriteCount++;
    final encoded = <String, Object?>{
      'version': _indexVersion,
      'entries': <String, Object?>{
        for (final item in _entries.entries) item.key: item.value.toJson(),
      },
    };
    await _atomicWriteBytes(
      _indexFile,
      Uint8List.fromList(utf8.encode(jsonEncode(encoded))),
    );
  }

  File _entryFile(String storageKey) =>
      File(p.join(_entriesDirectory.path, '$storageKey.bin'));

  int _nextAccess() {
    final now = DateTime.now().microsecondsSinceEpoch;
    _lastAccess = now > _lastAccess ? now : _lastAccess + 1;
    return _lastAccess;
  }

  Future<T> _serialized<T>(Future<T> Function() operation) {
    final result = _operationTail.then((_) => operation());
    _operationTail = result.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return result;
  }

  static Future<void> _recoverAtomicFile(File target) async {
    final temporary = File('${target.path}.tmp');
    final backup = File('${target.path}.bak');
    if (!await target.exists() && await backup.exists()) {
      await backup.rename(target.path);
    } else if (await backup.exists()) {
      await _deleteIfPresent(backup);
    }
    await _deleteIfPresent(temporary);
  }

  static Future<void> _atomicWriteBytes(File target, Uint8List bytes) async {
    final temporary = File('${target.path}.tmp');
    final backup = File('${target.path}.bak');
    await target.parent.create(recursive: true);
    await _deleteIfPresent(temporary);
    await temporary.writeAsBytes(bytes, flush: true);
    await _deleteIfPresent(backup);
    if (await target.exists()) {
      await target.rename(backup.path);
    }
    try {
      await temporary.rename(target.path);
      await _deleteIfPresent(backup);
    } catch (_) {
      if (!await target.exists() && await backup.exists()) {
        await backup.rename(target.path);
      }
      rethrow;
    }
  }

  static Future<bool> _deleteIfPresent(File file) async {
    try {
      if (await file.exists()) await file.delete();
      return true;
    } catch (_) {
      return false;
    }
  }
}

class _DiskEntry {
  _DiskEntry({required this.size, required this.lastAccess});

  int size;
  int lastAccess;

  Map<String, Object> toJson() => <String, Object>{
    'size': size,
    'lastAccess': lastAccess,
  };
}
