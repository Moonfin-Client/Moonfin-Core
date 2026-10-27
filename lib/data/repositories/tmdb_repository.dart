import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

/// A studio for the details screen: its name and, when the plugin has a cached
/// logo, an authenticated URL to that logo image.
typedef StudioCompany = ({String name, String? imageUrl});

/// A person's IMDb id, official site and social accounts as TMDB lists them.
/// Each account is the handle or id, null when TMDB has none.
typedef TmdbPersonAccounts = ({
  String? imdbId,
  String? homepage,
  String? instagram,
  String? twitter,
  String? facebook,
  String? tiktok,
  String? youtube,
});

/// A TMDB user review. The plugin has already turned its text into markdown.
typedef TmdbReview = ({
  String author,
  double? rating,
  String content,
  DateTime? createdAt,
  String? avatarUrl,
  String? url,
});

/// The reviews in a plugin answer, leaving out any without text.
@visibleForTesting
List<TmdbReview> parseTmdbReviews(Map<String, dynamic> response) => [
  for (final r in (response['reviews'] as List?) ?? const [])
    if (r is Map && r['content'] is String && (r['content'] as String).isNotEmpty)
      (
        author: r['author'] is String ? r['author'] as String : '',
        rating: r['rating'] is num ? (r['rating'] as num).toDouble() : null,
        content: r['content'] as String,
        createdAt: r['createdAt'] is String
            ? DateTime.tryParse(r['createdAt'] as String)
            : null,
        avatarUrl: r['avatarUrl'] is String ? r['avatarUrl'] as String : null,
        url: r['url'] is String ? r['url'] as String : null,
      ),
];

class TmdbRepository {
  static const _maxEpisodeCacheEntries = 256;
  static const _maxSeasonCacheEntries = 64;
  static const _maxCompaniesCacheEntries = 128;
  static const _maxReviewsCacheEntries = 64;

  final MediaServerClient _client;

  final _dio = Dio();

  final _episodeCache = <String, double>{};
  final _seasonCache = <String, Map<int, double>>{};
  final _companiesCache = <String, List<StudioCompany>>{};
  final _reviewsCache = <String, List<TmdbReview>>{};
  final _pendingEpisodes = <String, Completer<double?>>{};
  final _pendingSeasons = <String, Completer<Map<int, double>?>>{};
  final _pendingCompanies = <String, Completer<List<StudioCompany>?>>{};

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

  String? _studioImageUrl(int companyId) {
    final token = _client.accessToken;
    if (token == null) return null;
    return '${_client.baseUrl}/Moonfin/Tmdb/StudioImage/$companyId?${_client.serverType.tokenQueryParam}=$token';
  }

  /// The plugin's titled wide image for a movie or show the server doesn't
  /// have. [type] is movie or tv, and [imdbId] only counts when there is no
  /// [tmdbId].
  String? thumbUrl({required String type, String? tmdbId, String? imdbId}) {
    final token = _client.accessToken;
    if (token == null) return null;
    final MapEntry<String, String> id;
    if (tmdbId != null && tmdbId.isNotEmpty) {
      id = MapEntry('tmdbId', tmdbId);
    } else if (imdbId != null && imdbId.isNotEmpty) {
      id = MapEntry('imdbId', imdbId);
    } else {
      return null;
    }
    return Uri.parse('${_client.baseUrl}/Moonfin/Tmdb/Thumb').replace(
      queryParameters: {
        'type': type,
        id.key: id.value,
        _client.serverType.tokenQueryParam: token,
      },
    ).toString();
  }

  /// What Moonbase finds on TMDB for a movie or show the server doesn't have:
  /// overview, rating, genres, runTimeTicks, backdropPath, logoPath and
  /// trailerUrl, with image paths relative to TMDB's image host. Null when
  /// TMDB doesn't know the title or the call fails.
  Future<Map<String, dynamic>?> titleDetails({
    required String type,
    String? tmdbId,
    String? imdbId,
  }) async {
    final token = _client.accessToken;
    if (token == null) return null;
    final hasTmdb = tmdbId != null && tmdbId.isNotEmpty;
    if (!hasTmdb && (imdbId == null || imdbId.isEmpty)) return null;
    try {
      final response = await _dio.get(
        '${_client.baseUrl}/Moonfin/Tmdb/Details',
        queryParameters: {
          'type': type,
          if (hasTmdb) 'tmdbId': tmdbId else 'imdbId': imdbId,
        },
        options: Options(headers: {
          'Authorization': 'MediaBrowser Token="$token"',
        }),
      );
      final data = response.data;
      return data is Map<String, dynamic> ? data : null;
    } catch (_) {
      return null;
    }
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

  /// Fetches a person's accounts from the Moonfin plugin, which asks TMDB and
  /// caches the answer. Returns null when the plugin call fails.
  Future<TmdbPersonAccounts?> getPersonAccounts(String tmdbId) async {
    try {
      final response = await _get('/Moonfin/Tmdb/PersonLinks', {
        'tmdbId': tmdbId,
      });
      if (response == null) return null;

      String? text(String key) {
        final value = response[key];
        if (value is! String) return null;
        final trimmed = value.trim();
        return trimmed.isEmpty ? null : trimmed;
      }

      return (
        imdbId: text('imdbId'),
        homepage: text('homepage'),
        instagram: text('instagram'),
        twitter: text('twitter'),
        facebook: text('facebook'),
        tiktok: text('tiktok'),
        youtube: text('youtube'),
      );
    } catch (e) {
      debugPrint('[Moonfin] TMDB person links fetch failed: $e');
      return null;
    }
  }

  /// TMDB's user reviews for a movie or show, in [language] when it has any
  /// in it. Null when the plugin call fails, so a later visit asks again.
  Future<List<TmdbReview>?> getReviews({
    required String tmdbId,
    required String type,
    String? language,
  }) async {
    final cacheKey = '$type:$tmdbId:$language';
    final cached = _reviewsCache[cacheKey];
    if (cached != null) return cached;
    try {
      final response = await _get('/Moonfin/Tmdb/Reviews', {
        'tmdbId': tmdbId,
        'type': type,
        'language': ?language,
      });
      if (response == null) return null;
      final reviews = parseTmdbReviews(response);
      if (_reviewsCache.length >= _maxReviewsCacheEntries) {
        _reviewsCache.remove(_reviewsCache.keys.first);
      }
      _reviewsCache[cacheKey] = reviews;
      return reviews;
    } catch (e) {
      debugPrint('[Moonfin] TMDB reviews fetch failed: $e');
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
    _reviewsCache.clear();
    _pendingEpisodes.clear();
    _pendingSeasons.clear();
    _pendingCompanies.clear();
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
