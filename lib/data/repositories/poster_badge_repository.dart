import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../util/platform_detection.dart';
import '../services/moonbase_endpoint.dart';

enum PosterBadgeCorner { topLeft, topRight, bottomLeft, bottomRight }

/// One label the admin's rules put on an item's poster. The server fills in every
/// default, so what arrives is what gets drawn.
class PosterBadge {
  final String label;

  /// As the admin picked it, #RRGGBB.
  final String color;

  /// #RRGGBB, or empty to pick it from the style.
  final String textColor;

  /// solid, glass, outline, dark or light.
  final String style;

  /// From 10 to 100. Fades the fill, never the text.
  final int opacity;

  /// small, medium, large or xlarge.
  final String size;

  final PosterBadgeCorner corner;

  /// rounded, pill or square.
  final String shape;

  /// A Material icon name drawn before the text, empty for none. With no text the
  /// label is the icon alone.
  final String icon;

  const PosterBadge({
    required this.label,
    required this.color,
    this.textColor = '',
    this.style = 'solid',
    this.opacity = 100,
    this.size = 'medium',
    this.corner = PosterBadgeCorner.topLeft,
    this.shape = 'rounded',
    this.icon = '',
  });
}

/// Poster badges fetched from Moonbase, kept in memory for the session.
class PosterBadgeRepository {
  /// The plugin ignores anything past 200 ids in one request.
  static const _batchMax = 200;

  /// Failed lookups are retried after this, rather than on every rebuild.
  static const _failureTtl = Duration(minutes: 3);

  /// Set when the route is missing, meaning no Moonbase or one older than this feature,
  /// and when the admin has no rules. Nothing would resolve, so nothing asks until the
  /// window is up. Short enough that a first rule reaches people without a restart.
  static const _unavailableRetryWindow = Duration(minutes: 5);

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

  /// How many labels a corner holds, as the admin set it.
  int maxPerCorner = 2;

  /// Whether this person gets any label on this device, null until known.
  /// Settings hide what would do nothing while it isn't true.
  final available = ValueNotifier<bool?>(null);

  bool _checking = false;
  bool _disposed = false;

  /// The server's fingerprint of the admin's rules, null until the first answer.
  String? _version;

  /// Goes up when the admin changes the rules, so posters on screen ask again.
  final rulesChanged = ValueNotifier<int>(0);

  /// A request can still be on its way when the user signs out.
  void _setAvailable(bool value) {
    if (!_disposed) available.value = value;
  }

  PosterBadgeRepository(this._client);

  /// Asks the server once whether this person gets any label here. Rows of posters
  /// answer it too, so this only costs a request when settings open first.
  Future<void> checkAvailable() async {
    if (available.value != null || _checking) return;
    _checking = true;
    try {
      final ep = await moonbaseEndpoint(_client, _dio);
      if (ep == null) {
        _setAvailable(false);
        return;
      }

      final response = await _dio.get(
        '${ep.base}/Moonfin/PosterBadges/Items',
        queryParameters: {'profile': _profile},
        options: Options(headers: ep.headers),
      );
      final data = response.data;
      _setAvailable(data is Map && data['enabled'] == true);
    } on DioException catch (e) {
      // An older Moonbase has no such route.
      if (e.response?.statusCode == 404) _setAvailable(false);
    } catch (_) {
      // Stays unknown, so the next visit asks again.
    } finally {
      _checking = false;
    }
  }

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
      final ep = await moonbaseEndpoint(_client, _dio);
      if (ep == null) {
        _unavailableSince = DateTime.now();
        _setAvailable(false);
        return;
      }

      final response = await _dio.get(
        '${ep.base}/Moonfin/PosterBadges/Items',
        // The server shows each label only on the devices the admin picked.
        queryParameters: {'ids': ids.join(','), 'profile': _profile},
        options: Options(headers: ep.headers),
      );

      final data = response.data;
      final version = data is Map ? data['version'] : null;
      if (version is String) {
        if (_version != null && _version != version) _forgetLabels();
        _version = version;
      }
      if (data is Map && data['enabled'] == false) {
        _unavailableSince = DateTime.now();
      }
      if (data is Map) _setAvailable(data['enabled'] == true);
      final max = data is Map ? data['maxPerCorner'] : null;
      if (max is int && max > 0) maxPerCorner = max;

      final items = data is Map ? data['items'] : null;
      for (final id in ids) {
        _badges[id] = _parseBadges(items is Map ? items[id] : null);
        _failedAt.remove(id);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _unavailableSince = DateTime.now();
        _setAvailable(false);
      }
      _markFailed(ids);
    } catch (_) {
      _markFailed(ids);
    } finally {
      for (final id in ids) {
        _waiting.remove(id)?.complete();
      }
    }
  }

  /// The labels kept so far were worked out from the old rules. Posters keep showing
  /// them until the new ones arrive, so nothing blinks.
  void _forgetLabels() {
    _badges.clear();
    _failedAt.clear();
    if (!_disposed) rulesChanged.value++;
  }

  void _markFailed(List<String> ids) {
    final now = DateTime.now();
    for (final id in ids) {
      _failedAt[id] = now;
    }
  }

  static String get _profile {
    if (PlatformDetection.isTV) return 'tv';
    if (PlatformDetection.useMobileUi) return 'mobile';
    return 'desktop';
  }

  static List<PosterBadge> _parseBadges(Object? raw) {
    if (raw is! List) return const [];

    return [
      for (final entry in raw)
        if (entry is Map && entry['label'] is String)
          PosterBadge(
            label: entry['label'] as String,
            color: entry['color'] as String? ?? '',
            textColor: entry['textColor'] as String? ?? '',
            style: entry['style'] as String? ?? 'solid',
            opacity: (entry['opacity'] as num?)?.toInt() ?? 100,
            size: entry['size'] as String? ?? 'medium',
            corner: PosterBadgeCorner.values.firstWhere(
              (corner) => corner.name == entry['corner'],
              orElse: () => PosterBadgeCorner.topLeft,
            ),
            shape: entry['shape'] as String? ?? 'rounded',
            icon: entry['icon'] as String? ?? '',
          ),
    ];
  }

  void dispose() {
    _disposed = true;
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
    available.dispose();
    rulesChanged.dispose();
  }
}
