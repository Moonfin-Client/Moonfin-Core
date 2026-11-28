import 'package:dio/dio.dart';

/// The signed in user's listening and reading progress, which list routes
/// leave out. It comes with the user from `/api/me` and is read again after a
/// few seconds, or as soon as this app has changed it.
class AbsProgressCache {
  AbsProgressCache(this._dio, {Duration maxAge = const Duration(seconds: 15)})
    : _maxAge = maxAge;

  final Dio _dio;
  final Duration _maxAge;

  Map<String, Map<String, dynamic>> _byKey = const {};
  Map<String, dynamic>? _user;
  DateTime? _readAt;
  Future<void>? _pending;

  static String key(String itemId, [String? episodeId]) =>
      episodeId == null ? itemId : '$itemId/$episodeId';

  /// The user as `/api/me` last answered.
  Future<Map<String, dynamic>> user() async {
    await _fresh();
    return _user ?? const {};
  }

  Future<Map<String, dynamic>?> of(String itemId, [String? episodeId]) async {
    await _fresh();
    return _byKey[key(itemId, episodeId)];
  }

  /// Every progress entry, newest first.
  Future<List<Map<String, dynamic>>> all() async {
    await _fresh();
    return _byKey.values.toList()..sort(
      (a, b) =>
          ((b['lastUpdate'] as num?) ?? 0).compareTo((a['lastUpdate'] as num?) ?? 0),
    );
  }

  /// Keeps a newer entry, from this app or the socket, so a read before the
  /// next refresh sees it.
  void put(Map<String, dynamic> progress) {
    final itemId = progress['libraryItemId'] as String?;
    if (itemId == null) return;
    _byKey = {
      ..._byKey,
      key(itemId, progress['episodeId'] as String?): progress,
    };
  }

  void invalidate() => _readAt = null;

  /// Takes the user a socket event carried in place of a read, and answers
  /// the keys whose progress it changed.
  Set<String> replaceFrom(Map<String, dynamic> user) {
    final before = _byKey;
    _take(user);
    return {
      for (final key in {...before.keys, ..._byKey.keys})
        if (_signature(before[key]) != _signature(_byKey[key])) key,
    };
  }

  static String? _signature(Map<String, dynamic>? entry) => entry == null
      ? null
      : [
          for (final field in const [
            'currentTime',
            'isFinished',
            'hideFromContinueListening',
            'ebookLocation',
            'ebookProgress',
            'lastUpdate',
          ])
            entry[field],
        ].join('|');

  Future<void> _fresh() {
    final readAt = _readAt;
    if (readAt != null && DateTime.now().difference(readAt) < _maxAge) {
      return Future.value();
    }
    return _pending ??= _read().whenComplete(() => _pending = null);
  }

  Future<void> _read() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/me');
    _take(response.data ?? const {});
  }

  void _take(Map<String, dynamic> user) {
    _user = user;
    _byKey = {
      for (final entry in user['mediaProgress'] as List? ?? const [])
        if (entry is Map && entry['libraryItemId'] is String)
          key(entry['libraryItemId'] as String, entry['episodeId'] as String?):
              entry.cast<String, dynamic>(),
    };
    _readAt = DateTime.now();
  }
}
