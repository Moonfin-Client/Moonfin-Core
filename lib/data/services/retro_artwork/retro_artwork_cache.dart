import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

const retroArtworkCacheBudgetBytes = 150 * 1024 * 1024;

String normalizeRetroArtworkServerIdentity(String baseUrl) {
  final uri = Uri.parse(baseUrl);
  final normalizedPath = uri.path.replaceFirst(RegExp(r'/+$'), '');
  final defaultPort =
      (uri.scheme.toLowerCase() == 'http' && uri.port == 80) ||
      (uri.scheme.toLowerCase() == 'https' && uri.port == 443);
  return Uri(
    scheme: uri.scheme.toLowerCase(),
    host: uri.host.toLowerCase(),
    port: defaultPort
        ? null
        : uri.hasPort
        ? uri.port
        : null,
    path: normalizedPath,
  ).toString();
}

/// Credential-free identity for one immutable protocol-2 artwork revision.
///
/// [serverIdentity] is an authenticated server-record ID when available. A
/// normalized base URL without query/user-info is an acceptable fallback.
class RetroArtworkCacheKey {
  const RetroArtworkCacheKey({
    required this.serverIdentity,
    required this.libraryId,
    required this.gameId,
    required this.role,
    required this.revision,
  });

  final String serverIdentity;
  final String libraryId;
  final String gameId;
  final String role;
  final String revision;

  /// Safe for a future disk backend: neither credentials nor raw identifiers
  /// appear in the persisted filename.
  String get storageKey {
    final components = <String>[
      serverIdentity,
      libraryId,
      gameId,
      role,
      revision,
    ];
    final canonical = components
        .map((component) => '${utf8.encode(component).length}:$component')
        .join('|');
    return sha256.convert(utf8.encode(canonical)).toString();
  }

  @override
  bool operator ==(Object other) =>
      other is RetroArtworkCacheKey &&
      other.serverIdentity == serverIdentity &&
      other.libraryId == libraryId &&
      other.gameId == gameId &&
      other.role == role &&
      other.revision == revision;

  @override
  int get hashCode =>
      Object.hash(serverIdentity, libraryId, gameId, role, revision);
}

abstract interface class RetroArtworkByteCache {
  int get maxBytes;
  int get currentBytes;
  int get length;

  FutureOr<Uint8List?> get(RetroArtworkCacheKey key);
  FutureOr<bool> put(RetroArtworkCacheKey key, Uint8List bytes);
  FutureOr<Uint8List?> remove(RetroArtworkCacheKey key);
  FutureOr<void> clear();

  /// Releases the cache. The disk implementation debounces its index writes, so
  /// this is what flushes any pending bookkeeping; in-memory implementations
  /// have nothing to do.
  FutureOr<void> dispose();
}

/// In-process compressed-byte LRU used by tests and as an optional disk-cache
/// front layer. Production persistence is provided by the disk implementation.
class RetroArtworkByteLruCache implements RetroArtworkByteCache {
  RetroArtworkByteLruCache({this.maxBytes = retroArtworkCacheBudgetBytes}) {
    if (maxBytes <= 0) {
      throw ArgumentError.value(maxBytes, 'maxBytes', 'Must be positive');
    }
  }

  // Bounded by bytes alone, deliberately. An entry here is a *compressed* image
  // -- ~42 KB for a server-derived thumbnail -- so the 16 MB front budget already
  // caps this at a few hundred entries and a handful of megabytes. The memory
  // that actually matters is the decoded copy in Flutter's imageCache, which is
  // roughly 18x larger per image and is budgeted separately in main.dart. A
  // count cap here would shrink the cheap cache while leaving the expensive one
  // untouched.
  @override
  final int maxBytes;
  final LinkedHashMap<RetroArtworkCacheKey, Uint8List> _entries =
      LinkedHashMap<RetroArtworkCacheKey, Uint8List>();
  int _currentBytes = 0;

  @override
  int get currentBytes => _currentBytes;
  @override
  int get length => _entries.length;
  Iterable<RetroArtworkCacheKey> get keys =>
      List<RetroArtworkCacheKey>.unmodifiable(_entries.keys);

  @override
  Uint8List? get(RetroArtworkCacheKey key) {
    final bytes = _entries.remove(key);
    if (bytes == null) return null;
    _entries[key] = bytes;
    return bytes;
  }

  bool containsKey(RetroArtworkCacheKey key) => _entries.containsKey(key);

  @override
  bool put(RetroArtworkCacheKey key, Uint8List bytes) {
    remove(key);
    if (bytes.lengthInBytes > maxBytes) return false;

    _entries[key] = bytes;
    _currentBytes += bytes.lengthInBytes;
    while (_currentBytes > maxBytes && _entries.isNotEmpty) {
      remove(_entries.keys.first);
    }
    return true;
  }

  @override
  Uint8List? remove(RetroArtworkCacheKey key) {
    final removed = _entries.remove(key);
    if (removed != null) {
      _currentBytes -= removed.lengthInBytes;
    }
    return removed;
  }

  @override
  void clear() {
    _entries.clear();
    _currentBytes = 0;
  }

  @override
  void dispose() {
    // Nothing persists here, so releasing the entries is all there is to do.
    clear();
  }
}
