import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;

import 'artwork_timing.dart';

/// The artwork cache's index of what is on disk, kept in memory.
///
/// The cache manager asks its repository for a row on every image it shows,
/// and writes one back to touch the timestamp. The stock repositories make
/// each of those a database round trip: on Android, iOS and macOS a sqflite
/// call over the platform channel, serialised on one thread, so a grid of
/// forty posters queues eighty of them before the first image decodes, and on
/// the other platforms a linear scan of a JSON file. Here a lookup is a map
/// read and a write marks the index dirty, and the file is rewritten at most
/// once per [flushInterval].
///
/// Deleting a row also unlinks its file. The cache manager this app ships
/// resolves the file name against the working directory when it evicts, so
/// "Clear image cache" and the object cap only ever dropped rows and left
/// every file behind for the size sweep to find by age.
class ImageCacheIndex extends CacheInfoRepository {
  ImageCacheIndex({
    required this.directory,
    this.flushInterval = const Duration(seconds: 30),
    this.openBudget = defaultOpenBudget,
    Future<CacheInfoRepository?> Function()? legacy,
    this.fileName = indexFileName,
  }) : _legacy = legacy; // ignore: prefer_initializing_formals

  /// Finds the repository this one replaced. Called once, only when no index
  /// file exists, and inside the open budget, since finding it can mean a
  /// platform channel round trip.
  final Future<CacheInfoRepository?> Function()? _legacy;

  /// How long the first image waits for the index.
  ///
  /// The cache manager holds every lookup until open completes, so an open
  /// that never returns is a blank app rather than a slow one. Two seconds
  /// is the deadline the launch already gives a platform channel, and a cold
  /// read of an eight thousand row index takes well under a tenth of that.
  /// Past it the index starts empty: a cold cache, re-downloaded on demand,
  /// while the size sweep reclaims the files by age.
  static const defaultOpenBudget = Duration(seconds: 2);
  final Duration openBudget;

  /// Bumped by every open that does the work, by the last close, and by
  /// deleteDataFile. A read that finishes late compares the generation it
  /// started under with this one and drops its result on a mismatch, so a
  /// stalled open can never write into a live index.
  int _generation = 0;

  /// A dot-file inside the cache directory, beside the files it describes,
  /// so it goes wherever they go: when iOS purges the temporary directory
  /// the index disappears with the files instead of describing ghosts.
  static const indexFileName = '.moonfin-image-index.json';

  /// Files the size sweep must leave alone.
  static bool isIndexFileName(String name) => name.startsWith('.moonfin-');

  static const formatVersion = 1;

  /// The cache directory: `<temp>/libCachedImageData`. Null when the
  /// platform never said where that is, in which case the index lives in
  /// memory for this run and persists nothing.
  final Directory? directory;
  final String fileName;

  /// How long dirty rows wait before they are written.
  ///
  /// Every disk hit touches a row, so writing through would rewrite the whole
  /// index for every image shown. Losing this much on a crash costs a
  /// slightly stale recently-used order and, for a download whose row was
  /// lost, one orphaned file the size sweep reclaims and one re-download.
  final Duration flushInterval;

  // The same open-count contract the package's own repositories keep: the
  // first opener does the work, later ones wait on it, and the last closer
  // flushes.
  int _openConnections = 0;
  Completer<bool>? _opening;

  final Map<String, CacheObject> _byKey = <String, CacheObject>{};
  final Map<int, CacheObject> _byId = <int, CacheObject>{};
  int _nextId = 1;
  bool _dirty = false;
  Timer? _flushTimer;
  Future<void> _writeChain = Future<void>.value();

  /// Where the rows came from on this open, for the diagnostic log.
  String? migratedFrom;
  int migratedCount = 0;

  int get length => _byKey.length;

  File? get _file {
    final dir = directory;
    return dir == null ? null : File(p.join(dir.path, fileName));
  }

  File? get _tempFile {
    final file = _file;
    return file == null ? null : File('${file.path}.tmp');
  }

  @override
  Future<bool> exists() => _file?.exists() ?? Future<bool>.value(false);

  @override
  Future<bool> open() async {
    _openConnections++;
    final pending = _opening;
    if (pending != null) return pending.future;
    final completer = _opening = Completer<bool>();
    final generation = ++_generation;
    final stopwatch = Stopwatch()..start();
    String? fallback;
    Object? failure;
    try {
      final loaded = await _read().timeout(openBudget);
      if (generation == _generation) _publish(loaded);
    } on TimeoutException {
      fallback = 'timeout';
    } catch (e) {
      // Whatever went wrong, an empty index is a cold cache, not a broken
      // one: every file on disk is re-downloaded on demand and the size sweep
      // reclaims the rest by age.
      fallback = 'error';
      failure = e;
    }
    if (fallback == null) {
      ArtworkTimings.indexOpened(
        entries: length,
        took: stopwatch.elapsed,
        migratedFrom: migratedFrom,
        migratedCount: migratedCount,
      );
    } else {
      ArtworkTimings.indexOpenFellBack(
        reason: fallback,
        took: stopwatch.elapsed,
        error: failure,
      );
    }
    completer.complete(true);
    return true;
  }

  /// Everything an open needs, built away from the live maps. Nothing here
  /// touches instance state, so a read that outlives its budget, or finishes
  /// after a close, has nothing to write into.
  Future<_Loaded> _read() async {
    final dir = directory;
    if (dir == null) return _Loaded.empty;
    await dir.create(recursive: true);
    return await _readIndexFile(dir) ?? await _readLegacy() ?? _Loaded.empty;
  }

  /// Null when there is no index file. A parse failure or an unknown version
  /// returns an empty result rather than null, so a corrupt file is never
  /// followed by a legacy import that would resurrect rows for files since
  /// evicted. Decoded on this isolate, since a spawned one that stalls never
  /// completes and never throws, and a full index decodes in milliseconds.
  Future<_Loaded?> _readIndexFile(Directory dir) async {
    final file = File(p.join(dir.path, fileName));
    if (!await file.exists()) return null;
    try {
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map<String, dynamic>) return _Loaded.empty;
      if (decoded['v'] != formatVersion) return _Loaded.empty;
      final entries = decoded['e'];
      if (entries is! List) return _Loaded.empty;
      final byKey = <String, CacheObject>{};
      final byId = <int, CacheObject>{};
      for (final entry in entries) {
        if (entry is! List || entry.length < 8) continue;
        final id = entry[0];
        final url = entry[1];
        final path = entry[3];
        final validTill = entry[5];
        final touched = entry[6];
        if (id is! int ||
            url is! String ||
            path is! String ||
            validTill is! int ||
            touched is! int) {
          continue;
        }
        final object = CacheObject(
          url,
          id: id,
          key: entry[2] as String?,
          relativePath: path,
          eTag: entry[4] as String?,
          validTill: DateTime.fromMillisecondsSinceEpoch(validTill),
          touched: DateTime.fromMillisecondsSinceEpoch(touched),
          length: entry[7] as int?,
        );
        byKey[object.key] = object;
        byId[id] = object;
      }
      final next = decoded['next'];
      return _Loaded(
        byKey: byKey,
        byId: byId,
        nextId: next is int
            ? next
            : byId.keys.fold(0, (a, b) => a > b ? a : b) + 1,
      );
    } catch (_) {
      return _Loaded.empty;
    }
  }

  /// Copies the rows of the repository this replaced, so an update keeps
  /// the artwork already on disk instead of downloading it all again.
  ///
  /// The legacy file is left where it is: a build that goes back to the old
  /// repository then still finds its index. The cache manager's own
  /// migration helper would delete it.
  Future<_Loaded?> _readLegacy() async {
    final resolve = _legacy;
    if (resolve == null) return null;
    final legacy = await resolve();
    if (legacy == null || !await legacy.exists()) return null;
    await legacy.open();
    final List<CacheObject> objects;
    try {
      objects = await legacy.getAllObjects();
    } finally {
      await legacy.close();
    }
    final byKey = <String, CacheObject>{};
    final byId = <int, CacheObject>{};
    var nextId = 1;
    for (final object in objects) {
      if (byKey.containsKey(object.key)) continue;
      final row = _row(
        object,
        id: nextId,
        touched: object.touched ?? clock.now(),
      );
      byKey[row.key] = row;
      byId[nextId] = row;
      nextId++;
    }
    return _Loaded(
      byKey: byKey,
      byId: byId,
      nextId: nextId,
      migratedFrom: legacy.runtimeType.toString(),
      migratedCount: objects.length,
    );
  }

  /// The one place an open writes to the live maps. Replaces rather than
  /// merges, and the id counter only ever moves up, so a row handed out
  /// before this ran keeps an id no loaded row can collide with.
  void _publish(_Loaded loaded) {
    _byKey
      ..clear()
      ..addAll(loaded.byKey);
    _byId
      ..clear()
      ..addAll(loaded.byId);
    if (loaded.nextId > _nextId) _nextId = loaded.nextId;
    migratedFrom = loaded.migratedFrom;
    migratedCount = loaded.migratedCount;
    // Rows from the legacy repository are not on disk yet. The timer writes
    // them, and so does the pause hook, so the first image is never held
    // behind a write of the whole index.
    if (loaded.migratedCount > 0) _markDirty();
  }

  @override
  Future<CacheObject?> get(String key) {
    final object = _byKey[key];
    if (object != null) ArtworkTimings.indexHit();
    return Future<CacheObject?>.value(object);
  }

  @override
  Future<List<CacheObject>> getAllObjects() =>
      Future<List<CacheObject>>.value(_byId.values.toList(growable: false));

  @override
  Future<CacheObject> insert(
    CacheObject cacheObject, {
    bool setTouchedToNow = true,
  }) {
    if (cacheObject.id != null) {
      throw ArgumentError("Inserted objects shouldn't have an existing id.");
    }
    final stored = _put(
      cacheObject,
      id: _nextId++,
      touched: setTouchedToNow
          ? clock.now()
          : cacheObject.touched ?? clock.now(),
    );
    _markDirty();
    return Future<CacheObject>.value(stored);
  }

  @override
  Future<int> update(CacheObject cacheObject, {bool setTouchedToNow = true}) {
    final id = cacheObject.id;
    if (id == null) {
      throw ArgumentError('Updated objects should have an existing id.');
    }
    final previous = _byId[id];
    if (previous != null && previous.key != cacheObject.key) {
      _byKey.remove(previous.key);
    }
    _put(
      cacheObject,
      id: id,
      touched: setTouchedToNow
          ? clock.now()
          : cacheObject.touched ?? clock.now(),
    );
    _markDirty();
    return Future<int>.value(1);
  }

  @override
  Future<dynamic> updateOrInsert(CacheObject cacheObject) =>
      cacheObject.id == null ? insert(cacheObject) : update(cacheObject);

  @override
  Future<List<CacheObject>> getObjectsOverCapacity(int capacity) {
    if (_byId.length <= capacity) return Future.value(const <CacheObject>[]);
    final sorted = _byId.values.toList()
      ..sort((a, b) => _touchedMs(a).compareTo(_touchedMs(b)));
    return Future.value(sorted.sublist(0, sorted.length - capacity));
  }

  @override
  Future<List<CacheObject>> getOldObjects(Duration maxAge) {
    final cutoff = clock.now().subtract(maxAge).millisecondsSinceEpoch;
    return Future.value(
      _byId.values.where((o) => _touchedMs(o) < cutoff).toList(),
    );
  }

  @override
  Future<int> delete(int id) async {
    final object = _byId.remove(id);
    if (object == null) return 0;
    if (identical(_byKey[object.key], object)) _byKey.remove(object.key);
    _markDirty();
    await _unlink(object);
    return 1;
  }

  @override
  Future<int> deleteAll(Iterable<int> ids) async {
    var deleted = 0;
    for (final id in ids) {
      deleted += await delete(id);
    }
    return deleted;
  }

  @override
  Future<bool> close() async {
    _openConnections--;
    if (_openConnections > 0) return false;
    _openConnections = 0;
    _opening = null;
    _generation++;
    await flush();
    return true;
  }

  @override
  Future<void> deleteDataFile() async {
    _flushTimer?.cancel();
    _flushTimer = null;
    _dirty = false;
    // A read in flight would bring the rows back, and so would the next
    // timed write if the maps kept them.
    _generation++;
    _byKey.clear();
    _byId.clear();
    final file = _file;
    final temp = _tempFile;
    if (file == null || temp == null) return;
    for (final f in [file, temp]) {
      try {
        if (await f.exists()) await f.delete();
      } catch (_) {}
    }
  }

  /// Writes the index now if anything changed. Safe to call at any time:
  /// writes never overlap and a write in progress is waited for.
  Future<void> flush() {
    _flushTimer?.cancel();
    _flushTimer = null;
    if (!_dirty) return _writeChain;
    _writeChain = _writeChain.then((_) => _write());
    return _writeChain;
  }

  static CacheObject _row(
    CacheObject object, {
    required int id,
    required DateTime touched,
  }) => CacheObject(
    object.url,
    id: id,
    key: object.key,
    relativePath: object.relativePath,
    validTill: object.validTill,
    eTag: object.eTag,
    length: object.length,
    touched: touched,
  );

  CacheObject _put(
    CacheObject object, {
    required int id,
    required DateTime touched,
  }) {
    final stored = _row(object, id: id, touched: touched);
    _byKey[stored.key] = stored;
    _byId[id] = stored;
    if (id >= _nextId) _nextId = id + 1;
    return stored;
  }

  void _markDirty() {
    _dirty = true;
    _flushTimer ??= Timer(flushInterval, () {
      _flushTimer = null;
      unawaited(flush());
    });
  }

  Future<void> _write() async {
    if (!_dirty) return;
    final stopwatch = Stopwatch()..start();
    _dirty = false;
    final file = _file;
    final temp = _tempFile;
    if (file == null || temp == null) return;
    final rows = <List<Object?>>[
      for (final o in _byId.values)
        <Object?>[
          o.id,
          o.url,
          o.key == o.url ? null : o.key,
          o.relativePath,
          o.eTag,
          o.validTill.millisecondsSinceEpoch,
          _touchedMs(o),
          o.length,
        ],
    ];
    final text = jsonEncode(<String, Object?>{
      'v': formatVersion,
      'next': _nextId,
      'e': rows,
    });
    try {
      // Temp then rename, so a kill mid-write leaves the previous index
      // whole rather than a truncated file that parses as empty.
      await temp.writeAsString(text, flush: true);
      await temp.rename(file.path);
    } catch (_) {
      _dirty = true;
    }
    ArtworkTimings.indexFlushed(entries: rows.length, took: stopwatch.elapsed);
  }

  Future<void> _unlink(CacheObject object) async {
    final dir = directory;
    if (dir == null) return;
    try {
      final file = File(p.join(dir.path, object.relativePath));
      if (await file.exists()) await file.delete();
    } catch (_) {
      // Already gone, or the directory is being cleared underneath us.
    }
  }

  static int _touchedMs(CacheObject o) =>
      o.touched?.millisecondsSinceEpoch ?? 0;

  @visibleForTesting
  bool get isDirty => _dirty;
}

/// What an open read, held apart from the live maps until it is published.
class _Loaded {
  const _Loaded({
    required this.byKey,
    required this.byId,
    required this.nextId,
    this.migratedFrom,
    this.migratedCount = 0,
  });

  static const empty = _Loaded(byKey: {}, byId: {}, nextId: 1);

  final Map<String, CacheObject> byKey;
  final Map<int, CacheObject> byId;
  final int nextId;
  final String? migratedFrom;
  final int migratedCount;
}
