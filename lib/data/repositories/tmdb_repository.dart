import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../utils/tmdb_image.dart';

/// A studio for the details screen: its name and, when the plugin has a cached
/// logo, an authenticated URL to that logo image.
typedef StudioCompany = ({String name, String? imageUrl});

class TmdbRepository {
  static const _maxEpisodeCacheEntries = 256;
  static const _maxSeasonCacheEntries = 64;
  static const _maxCompaniesCacheEntries = 128;
  static const _maxTitleLogoCacheEntries = 256;

  final MediaServerClient _client;

  final _dio = Dio();

  final _episodeCache = <String, double>{};
  final _seasonCache = <String, Map<int, double>>{};
  final _companiesCache = <String, List<StudioCompany>>{};
  final _titleLogoCache = <String, String?>{};
  final _pendingEpisodes = <String, Completer<double?>>{};
  final _pendingSeasons = <String, Completer<Map<int, double>?>>{};
  final _pendingCompanies = <String, Completer<List<StudioCompany>?>>{};
  final _pendingTitleLogos = <String, Completer<String?>>{};

  TmdbRepository(this._client);

  /// Fetches the item's studios (TMDB production companies) from the Moonfin
  /// plugin, which caches the logos server-side. Returns null when the plugin
  /// call fails; the details screen then shows name-only placeholders.
  Future<List<StudioCompany>?> getProductionCompanies({
    required String tmdbId,
    required String type,
  }) async {
    final cacheKey = '$type:$tmdbId';

    final cached = _takeCompaniesCache(cacheKey);
    if (cached != null) return cached;

    final existing = _pendingCompanies[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<List<StudioCompany>?>();
    _pendingCompanies[cacheKey] = completer;

    try {
      final response = await _get('/Moonfin/Tmdb/ProductionCompanies', {
        'tmdbId': tmdbId,
        'type': type,
      });
      if (response == null) {
        completer.complete(null);
        _pendingCompanies.remove(cacheKey);
        return null;
      }

      final list = response['companies'] as List? ?? const [];
      final companies = <StudioCompany>[];
      for (final entry in list) {
        if (entry is! Map) continue;
        final id = (entry['id'] as num?)?.toInt();
        final name = entry['name']?.toString() ?? '';
        if (id == null || name.isEmpty) continue;
        final imageUrl = entry['hasLogo'] == true ? _studioImageUrl(id) : null;
        companies.add((name: name, imageUrl: imageUrl));
      }

      _storeCompaniesCache(cacheKey, companies);
      completer.complete(companies);
      _pendingCompanies.remove(cacheKey);
      return companies;
    } catch (e) {
      debugPrint('[Moonfin] TMDB production companies fetch failed: $e');
      completer.complete(null);
      _pendingCompanies.remove(cacheKey);
      return null;
    }
  }

  /// Fetches the title-treatment logo for a TMDB movie or series from the Moonfin
  /// plugin, returning an image URL or null when there is none. Fills the media bar
  /// logo slot for external items, which have no Jellyfin logo of their own. Type is
  /// "movie" or "tv". Misses are cached too so a title without a logo is not
  /// re-fetched every load.
  Future<String?> getTitleLogo({
    required String tmdbId,
    required String type,
  }) async {
    final cacheKey = '$type:$tmdbId';

    if (_titleLogoCache.containsKey(cacheKey)) {
      final cached = _titleLogoCache.remove(cacheKey);
      _titleLogoCache[cacheKey] = cached;
      return cached;
    }

    final existing = _pendingTitleLogos[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<String?>();
    _pendingTitleLogos[cacheKey] = completer;

    try {
      final response = await _get('/Moonfin/Tmdb/TitleLogo', {
        'tmdbId': tmdbId,
        'type': type,
      });
      final url = tmdbImageUrl(response?['logoPath']?.toString(), 500);
      _storeTitleLogoCache(cacheKey, url);
      completer.complete(url);
      _pendingTitleLogos.remove(cacheKey);
      return url;
    } catch (e) {
      debugPrint('[Moonfin] TMDB title logo fetch failed: $e');
      completer.complete(null);
      _pendingTitleLogos.remove(cacheKey);
      return null;
    }
  }

  String? _studioImageUrl(int companyId) {
    final token = _client.accessToken;
    if (token == null) return null;
    return '${_client.baseUrl}/Moonfin/Tmdb/StudioImage/$companyId?api_key=$token';
  }

  Future<double?> getEpisodeRating({
    required String tmdbId,
    required int season,
    required int episode,
  }) async {
    final cacheKey = '$tmdbId:$season:$episode';

    final cached = _takeEpisodeCache(cacheKey);
    if (cached != null) return cached;

    final existing = _pendingEpisodes[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<double?>();
    _pendingEpisodes[cacheKey] = completer;

    try {
      final response = await _get('/Moonfin/Tmdb/EpisodeRating', {
        'tmdbId': tmdbId,
        'season': season,
        'episode': episode,
      });

      if (response == null) {
        completer.complete(null);
        _pendingEpisodes.remove(cacheKey);
        return null;
      }

      final rating = (response['voteAverage'] as num?)?.toDouble();
      if (rating != null && rating > 0) {
        _storeEpisodeCache(cacheKey, rating);
        completer.complete(rating);
      } else {
        completer.complete(null);
      }
      _pendingEpisodes.remove(cacheKey);
      return rating != null && rating > 0 ? rating : null;
    } catch (e) {
      debugPrint('[Moonfin] TMDB episode rating fetch failed: $e');
      completer.complete(null);
      _pendingEpisodes.remove(cacheKey);
      return null;
    }
  }

  Future<Map<int, double>?> getSeasonRatings({
    required String tmdbId,
    required int season,
  }) async {
    final cacheKey = '$tmdbId:$season';

    final cached = _takeSeasonCache(cacheKey);
    if (cached != null) return cached;

    final existing = _pendingSeasons[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<Map<int, double>?>();
    _pendingSeasons[cacheKey] = completer;

    try {
      final response = await _get('/Moonfin/Tmdb/SeasonRatings', {
        'tmdbId': tmdbId,
        'season': season,
      });

      if (response == null) {
        completer.complete(null);
        _pendingSeasons.remove(cacheKey);
        return null;
      }

      final episodes = response['episodes'] as List?;
      if (episodes == null) {
        completer.complete(null);
        _pendingSeasons.remove(cacheKey);
        return null;
      }

      final result = <int, double>{};
      for (final ep in episodes.cast<Map<String, dynamic>>()) {
        final epNum = ep['episodeNumber'] as int?;
        final rating = (ep['voteAverage'] as num?)?.toDouble();
        if (epNum != null && rating != null && rating > 0) {
          result[epNum] = rating;
          _storeEpisodeCache('$tmdbId:$season:$epNum', rating);
        }
      }

      _storeSeasonCache(cacheKey, result);
      completer.complete(result);
      _pendingSeasons.remove(cacheKey);
      return result;
    } catch (e) {
      debugPrint('[Moonfin] TMDB season ratings fetch failed: $e');
      completer.complete(null);
      _pendingSeasons.remove(cacheKey);
      return null;
    }
  }

  Future<Map<String, dynamic>?> _get(
    String path,
    Map<String, dynamic> query,
  ) async {
    final token = _client.accessToken;
    if (token == null) return null;

    final response = await _dio.get(
      '${_client.baseUrl}$path',
      queryParameters: query,
      options: Options(headers: {
        'Authorization': 'MediaBrowser Token="$token"',
      }),
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) return null;

    final success = data['success'] as bool? ?? false;
    if (!success || data['error'] != null) return null;

    return data;
  }

  void clearCache() {
    _episodeCache.clear();
    _seasonCache.clear();
    _companiesCache.clear();
    _titleLogoCache.clear();
    _pendingEpisodes.clear();
    _pendingSeasons.clear();
    _pendingCompanies.clear();
    _pendingTitleLogos.clear();
  }

  void dispose() {
    clearCache();
    _dio.close(force: true);
  }

  double? _takeEpisodeCache(String cacheKey) {
    final cached = _episodeCache.remove(cacheKey);
    if (cached != null) {
      _episodeCache[cacheKey] = cached;
    }
    return cached;
  }

  Map<int, double>? _takeSeasonCache(String cacheKey) {
    final cached = _seasonCache.remove(cacheKey);
    if (cached != null) {
      _seasonCache[cacheKey] = cached;
    }
    return cached;
  }

  List<StudioCompany>? _takeCompaniesCache(String cacheKey) {
    final cached = _companiesCache.remove(cacheKey);
    if (cached != null) {
      _companiesCache[cacheKey] = cached;
    }
    return cached;
  }

  void _storeCompaniesCache(String cacheKey, List<StudioCompany> companies) {
    _companiesCache.remove(cacheKey);
    _companiesCache[cacheKey] = companies;
    while (_companiesCache.length > _maxCompaniesCacheEntries) {
      _companiesCache.remove(_companiesCache.keys.first);
    }
  }

  void _storeTitleLogoCache(String cacheKey, String? url) {
    _titleLogoCache.remove(cacheKey);
    _titleLogoCache[cacheKey] = url;
    while (_titleLogoCache.length > _maxTitleLogoCacheEntries) {
      _titleLogoCache.remove(_titleLogoCache.keys.first);
    }
  }

  void _storeEpisodeCache(String cacheKey, double rating) {
    _episodeCache.remove(cacheKey);
    _episodeCache[cacheKey] = rating;
    while (_episodeCache.length > _maxEpisodeCacheEntries) {
      _episodeCache.remove(_episodeCache.keys.first);
    }
  }

  void _storeSeasonCache(String cacheKey, Map<int, double> result) {
    _seasonCache.remove(cacheKey);
    _seasonCache[cacheKey] = result;
    while (_seasonCache.length > _maxSeasonCacheEntries) {
      _seasonCache.remove(_seasonCache.keys.first);
    }
  }
}
