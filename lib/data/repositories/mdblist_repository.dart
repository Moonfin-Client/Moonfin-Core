import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

class MdbListRepository {
  static const _maxCacheEntries = 64;

  final MediaServerClient _client;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final _cache = <String, Map<String, double>>{};
  final _pending = <String, Completer<Map<String, double>?>>{};
  bool _endpointUnavailable = false;

  MdbListRepository(this._client);

  Future<Map<String, double>?> getRatings({
    required String tmdbId,
    required String mediaType,
  }) async {
    if (_endpointUnavailable) return null;

    final type = switch (mediaType) {
      'Movie' => 'movie',
      'Series' || 'Season' || 'Episode' => 'show',
      _ => 'movie',
    };

    final cacheKey = '$type:$tmdbId';

    final cached = _takeCached(cacheKey);
    if (cached != null) return cached;

    final existing = _pending[cacheKey];
    if (existing != null) return existing.future;

    final completer = Completer<Map<String, double>?>();
    _pending[cacheKey] = completer;

    try {
      final baseUrl = _client.baseUrl;
      final token = _client.accessToken;
      if (token == null) {
        completer.complete(null);
        _pending.remove(cacheKey);
        return null;
      }

      final response = await _dio.get(
        '$baseUrl/Moonfin/MdbList/Ratings',
        queryParameters: {'type': type, 'tmdbId': tmdbId},
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        completer.complete(null);
        _pending.remove(cacheKey);
        return null;
      }

      final success = data['success'] as bool? ?? false;
      if (!success || data['error'] != null) {
        completer.complete(null);
        _pending.remove(cacheKey);
        return null;
      }

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
      completer.complete(result);
      _pending.remove(cacheKey);
      return result;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 404) {
        _endpointUnavailable = true;
      }
      completer.complete(null);
      _pending.remove(cacheKey);
      return null;
    } catch (_) {
      completer.complete(null);
      _pending.remove(cacheKey);
      return null;
    }
  }

  void clearCache() {
    _cache.clear();
    _pending.clear();
    _endpointUnavailable = false;
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

  Future<List<MdbListItem>?> getListItems(String slug, {String? mediaType}) async {
    try {
      final baseUrl = _client.baseUrl;
      final token = _client.accessToken;
      if (token == null) return null;

      final queryParams = <String, dynamic>{};
      if (mediaType != null && mediaType.isNotEmpty) {
        queryParams['mediatype'] = mediaType;
      }

      final response = await _dio.get(
        '$baseUrl/Moonfin/MdbList/Lists/$slug/Items',
        queryParameters: queryParams,
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) return null;

      final success = data['success'] as bool? ?? false;
      if (!success || data['error'] != null) return null;

      final itemsList = data['items'] as List?;
      if (itemsList == null) return null;

      return itemsList
          .map((item) => MdbListItem.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('[MdbListRepository] Failed to get list items for $slug: $e');
      return null;
    }
  }
}

class MdbListItem {
  final int? id;
  final String name;
  final String type;
  final int? productionYear;
  final int? rank;
  final String? poster;
  final MdbListItemProviderIds providerIds;

  MdbListItem({
    this.id,
    required this.name,
    required this.type,
    this.productionYear,
    this.rank,
    this.poster,
    required this.providerIds,
  });

  factory MdbListItem.fromJson(Map<String, dynamic> json) {
    final rawId = json['id'] ?? json['Id'];
    final parsedId = rawId is int 
        ? rawId 
        : int.tryParse(rawId?.toString() ?? '');
    final providerIdsMap = (json['providerIds'] ?? json['ProviderIds']) as Map<String, dynamic>? ?? {};
    final pIds = MdbListItemProviderIds.fromJson(providerIdsMap);
    return MdbListItem(
      id: parsedId,
      name: (json['name'] ?? json['Name']) as String? ?? '',
      type: (json['type'] ?? json['Type']) as String? ?? '',
      productionYear: (json['productionYear'] ?? json['ProductionYear']) as int?,
      rank: (json['rank'] ?? json['Rank']) as int?,
      poster: (json['poster'] ?? json['Poster'] ?? json['posterUrl'] ?? json['poster_path']) as String?,
      providerIds: pIds,
    );
  }
}

class MdbListItemProviderIds {
  final String? imdb;
  final String? tmdb;
  final String? tvdb;

  MdbListItemProviderIds({
    this.imdb,
    this.tmdb,
    this.tvdb,
  });

  factory MdbListItemProviderIds.fromJson(Map<String, dynamic> json) {
    return MdbListItemProviderIds(
      imdb: (json['Imdb'] ?? json['imdb'] ?? json['IMDB'])?.toString(),
      tmdb: (json['Tmdb'] ?? json['tmdb'] ?? json['TMDB'])?.toString(),
      tvdb: (json['Tvdb'] ?? json['tvdb'] ?? json['TVDB'])?.toString(),
    );
  }
}

