import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../../util/signed_in_server_features.dart';

/// One label the admin's rules put on an item's poster.
class PosterBadge {
  final String label;

  /// As the admin picked it, #RRGGBB.
  final String color;

  const PosterBadge({required this.label, required this.color});
}

/// Poster badges fetched from the Moonbase plugin, kept in memory for the session.
class PosterBadgeRepository {
  /// The plugin ignores anything past 200 ids in one request.
  static const _batchMax = 200;

  /// Failed lookups are retried after this, rather than on every rebuild.
  static const _failureTtl = Duration(minutes: 3);

  /// Set when the route is missing, meaning no Moonbase or one older than this feature,
  /// and when the admin has no rules. Nothing would resolve, so nothing asks until the
  /// window is up.
  static const _unavailableRetryWindow = Duration(minutes: 10);

  final MediaServerClient _client;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  final _badges = <String, List<PosterBadge>>{};
  final _failedAt = <String, DateTime>{};
  final _pending = <String>{};
  final _waiting = <String, Completer<void>>{};
  Timer? _batchTimer;
  DateTime? _unavailableSince;

  PosterBadgeRepository(this._client);

  /// The badges for an item already asked about, or null when it hasnt been.
  List<PosterBadge>? peek(String itemId) => _badges[itemId];

  bool get _unavailable {
    final since = _unavailableSince;
    if (since == null) return false;
    if (DateTime.now().difference(since) < _unavailableRetryWindow) return true;
    _unavailableSince = null;
    return false;
  }

  /// The badges for an item, empty when it has none.
  Future<List<PosterBadge>> getForItem(String itemId) async {
    if (itemId.isEmpty || _unavailable) return const [];

    final known = _badges[itemId];
    if (known != null) return known;

    final failedAt = _failedAt[itemId];
    if (failedAt != null && DateTime.now().difference(failedAt) < _failureTtl) {
      return const [];
    }

    final waiting = _waiting.putIfAbsent(itemId, () {
      _pending.add(itemId);
      return Completer<void>();
    });

    // Batched so a screen full of posters sends one request. The first card to ask
    // starts the window and the rest join it.
    _batchTimer ??= Timer(const Duration(milliseconds: 60), _flushBatch);

    await waiting.future;
    return _badges[itemId] ?? const [];
  }

  Future<void> _flushBatch() async {
    _batchTimer = null;

    // Capped because the plugin drops anything past the limit. The rest go next.
    final ids = _pending.take(_batchMax).toList();
    _pending.removeAll(ids);
    if (_pending.isNotEmpty) {
      _batchTimer = Timer(const Duration(milliseconds: 60), _flushBatch);
    }

    try {
      final token = _client.accessToken;
      final baseUrl = _client.baseUrl;
      if (token == null ||
          baseUrl.isEmpty ||
          !serverHasMoonfinPlugin(_client)) {
        return;
      }

      final response = await _dio.get(
        '$baseUrl/Moonfin/PosterBadges/Items',
        queryParameters: {'ids': ids.join(',')},
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is Map && data['enabled'] == false) {
        _unavailableSince = DateTime.now();
      }

      final items = data is Map ? data['items'] : null;
      for (final id in ids) {
        _badges[id] = _parseBadges(items is Map ? items[id] : null);
        _failedAt.remove(id);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) _unavailableSince = DateTime.now();
      _markFailed(ids);
    } catch (_) {
      _markFailed(ids);
    } finally {
      for (final id in ids) {
        _waiting.remove(id)?.complete();
      }
    }
  }

  void _markFailed(List<String> ids) {
    final now = DateTime.now();
    for (final id in ids) {
      _failedAt[id] = now;
    }
  }

  static List<PosterBadge> _parseBadges(Object? raw) {
    if (raw is! List) return const [];

    return [
      for (final entry in raw)
        if (entry is Map && entry['label'] is String)
          PosterBadge(
            label: entry['label'] as String,
            color: entry['color'] as String? ?? '',
          ),
    ];
  }

  void dispose() {
    _batchTimer?.cancel();

    // The timer is what would have released these, so they have to be let go by hand
    // or every card still waiting hangs on its future.
    for (final waiting in _waiting.values) {
      if (!waiting.isCompleted) waiting.complete();
    }
    _waiting.clear();
    _pending.clear();
    _badges.clear();
    _failedAt.clear();
    _dio.close(force: true);
  }
}
