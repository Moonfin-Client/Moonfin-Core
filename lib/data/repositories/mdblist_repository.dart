import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
import '../services/moonbase_endpoint.dart';
import '../services/plugin_sync_service.dart';
import 'tmdb_repository.dart';

class MdbListRepository {
  static const _maxCacheEntries = 64;

  // Failed lookups (bad key, rate limit, server hiccup) are remembered briefly so
  // focus-driven UI doesn't storm the plugin while nothing can succeed.
  static const _negativeCacheTtl = Duration(minutes: 3);

  // A 404 means the plugin route is missing (plugin absent or mid-update), so
  // retry after a window instead of latching off until restart.
  static const _unavailableRetryWindow = Duration(minutes: 5);

  final MediaServerClient _client;
  final TmdbRepository _tmdbRepository;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final _cache = <String, Map<String, double>>{};
  final _pending = <String, Completer<Map<String, double>?>>{};
  final _negativeCache = <String, DateTime>{};
  final _tmdbIdByItemId = <String, String?>{};
  DateTime? _unavailableSince;

  /// Last error string returned by the plugin proxy (missing API key, rate
  /// limit reached, and so on), kept for settings diagnostics.
  String? lastError;

  MdbListRepository(this._client, this._tmdbRepository);

  /// Resolves ratings for any library item, owning the type routing.
  ///
  /// Movies and series get MDBList ratings via the plugin proxy, resolving the
  /// TMDB id from the item or a details lookup when missing. Episodes skip
  /// MDBList (it has no episode ratings) and instead return the TMDB episode
  /// rating as `tmdb_episode` when [episodeRatingsEnabled]. Seasons and
  /// anything else return null.
  ///
  /// [resolveClient] overrides the client used for id-resolution lookups so
  /// multi-server callers can resolve against the item's own server.
  Future<Map<String, double>?> getRatingsForItem(
    AggregatedItem item, {
    MediaServerClient? resolveClient,
    bool episodeRatingsEnabled = false,
  }) async {
    switch (item.type) {
      case 'Movie':
      case 'Series':
        final tmdbId = await resolveTmdbId(
          itemId: item.id,
          serverId: item.serverId,
          knownTmdbId: item.tmdbId,
          client: resolveClient,
        );
        if (tmdbId == null || tmdbId.isEmpty) return null;
        return getRatings(tmdbId: tmdbId, mediaType: item.type!);
      case 'Episode':
        if (!episodeRatingsEnabled) return null;
        return _getEpisodeRating(item, resolveClient);
      default:
        return null;
    }
  }

  Future<Map<String, double>?> getRatings({
    required String tmdbId,
    required String mediaType,
  }) async {
    if (_unavailableSince != null) {
      if (DateTime.now().difference(_unavailableSince!) <
          _unavailableRetryWindow) {
        return null;
      }
      _unavailableSince = null;
    }

    // MDBList only has movie and show level ratings. Episodes route through
    // getRatingsForItem and everything else has nothing to fetch.
    final type = switch (mediaType) {
      'Movie' || 'movie' => 'movie',
      'Series' || 'show' => 'show',
      _ => null,
    };
    if (type == null) return null;

    final cacheKey = '$type:$tmdbId';

    final cached = _takeCached(cacheKey);
    if (cached != null) return cached;

    final negativeAt = _negativeCache[cacheKey];
    if (negativeAt != null) {
      if (DateTime.now().difference(negativeAt) < _negativeCacheTtl) {
        return null;
      }
      _negativeCache.remove(cacheKey);
    }

    final existing = _pending[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<Map<String, double>?>();
    _pending[cacheKey] = completer;

    Map<String, double>? completeWith(Map<String, double>? value) {
      completer.complete(value);
      _pending.remove(cacheKey);
      return value;
    }

    try {
      final ep = await moonbaseEndpoint(_client, _dio);
      if (ep == null) return completeWith(null);

      final response = await _dio.get(
        '${ep.base}/Moonfin/MdbList/Ratings',
        // The profile makes the plugin filter with the same profile settings sync
        // applies here, rather than the global one.
        queryParameters: {
          'type': type,
          'tmdbId': tmdbId,
          'profile': GetIt.instance<PluginSyncService>().currentDeviceProfile,
        },
        options: Options(headers: ep.headers),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        _negativeCache[cacheKey] = DateTime.now();
        return completeWith(null);
      }

      final success = data['success'] as bool? ?? false;
      if (!success || data['error'] != null) {
        // Keep the plugin's error string for diagnostics. The ratings row
        // itself stays silent.
        lastError = data['error'] as String?;
        _negativeCache[cacheKey] = DateTime.now();
        return completeWith(null);
      }

      lastError = null;
      final ratings = (data['ratings'] as List?)
          ?.cast<Map<String, dynamic>>()
          .where((r) => r['source'] != null)
          .map((r) {
            final rawSource = (r['source'] as String).toLowerCase();
            final source = rawSource == 'popcorn'
                ? 'tomatoes_audience'
                : rawSource;
            final value = switch (source) {
              'metacriticuser' =>
                (r['score'] as num?)?.toDouble() ??
                    (r['value'] as num?)?.toDouble(),
              _ =>
                (r['value'] as num?)?.toDouble() ??
                    (r['score'] as num?)?.toDouble(),
            };
            if (value == null || value <= 0) return null;
            return MapEntry(source, value);
          })
          .whereType<MapEntry<String, double>>();

      final result = Map<String, double>.fromEntries(ratings ?? []);
      _storeCacheEntry(cacheKey, result);
      return completeWith(result);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 404) {
        _unavailableSince = DateTime.now();
      } else {
        _negativeCache[cacheKey] = DateTime.now();
      }
      return completeWith(null);
    } catch (_) {
      _negativeCache[cacheKey] = DateTime.now();
      return completeWith(null);
    }
  }

  Future<Map<String, double>?> _getEpisodeRating(
    AggregatedItem item,
    MediaServerClient? resolveClient,
  ) async {
    final seriesId = item.seriesId;
    final season = item.parentIndexNumber;
    final episode = item.indexNumber;
    if (seriesId == null || season == null || episode == null) return null;

    // Episode items carry their own TMDB id, but the TMDB episode endpoint
    // needs the series id, so resolve it from the parent item.
    final seriesTmdbId = await resolveTmdbId(
      itemId: seriesId,
      serverId: item.serverId,
      knownTmdbId: null,
      client: resolveClient,
    );
    if (seriesTmdbId == null || seriesTmdbId.isEmpty) return null;

    final rating = await _tmdbRepository.getEpisodeRating(
      tmdbId: seriesTmdbId,
      season: season,
      episode: episode,
    );
    if (rating == null || rating <= 0) return null;
    return {'tmdb_episode': rating};
  }

  /// Resolves an item's TMDB id, preferring [knownTmdbId], with a bounded cache
  /// of details lookups shared by all callers.
  Future<String?> resolveTmdbId({
    required String itemId,
    required String? serverId,
    required String? knownTmdbId,
    MediaServerClient? client,
  }) async {
    if (knownTmdbId != null && knownTmdbId.isNotEmpty) return knownTmdbId;

    // Seerr cards, and the outside-list cards that borrow their server id,
    // aren't on the media server, which answers a lookup for them with a 400.
    // Seerr keys its items by TMDB id. An IMDb id has no TMDB id to give.
    if (serverId == 'seerr') {
      return int.tryParse(itemId) != null ? itemId : null;
    }

    final cacheKey = '${serverId ?? ''}:$itemId';
    if (_tmdbIdByItemId.containsKey(cacheKey)) {
      return _tmdbIdByItemId[cacheKey];
    }

    String? tmdbId;
    try {
      final details = await (client ?? _client)
          .itemsApi
          .getItem(itemId, fields: 'ProviderIds');
      tmdbId = (details['ProviderIds'] as Map?)?['Tmdb'] as String?;
    } catch (_) {
      tmdbId = null;
    }

    _tmdbIdByItemId[cacheKey] = tmdbId;
    while (_tmdbIdByItemId.length > 512) {
      _tmdbIdByItemId.remove(_tmdbIdByItemId.keys.first);
    }
    return tmdbId;
  }

  void clearCache() {
    _cache.clear();
    _pending.clear();
    _negativeCache.clear();
    _tmdbIdByItemId.clear();
    _unavailableSince = null;
  }

  void dispose() {
    clearCache();
    _dio.close(force: true);
  }

  Map<String, double>? _takeCached(String cacheKey) {
    final cached = _cache.remove(cacheKey);
    if (cached != null) {
      _cache[cacheKey] = cached;
    }
    return cached;
  }

  void _storeCacheEntry(String cacheKey, Map<String, double> result) {
    _cache.remove(cacheKey);
    _cache[cacheKey] = result;
    while (_cache.length > _maxCacheEntries) {
      _cache.remove(_cache.keys.first);
    }
  }
}
