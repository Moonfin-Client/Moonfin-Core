import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart';
import '../../preference/home_section_config.dart';
import '../../util/platform_detection.dart';

class ImdbExternalListItem {
  final String imdbId;
  final String tmdbId;
  final String title;
  final String? posterUrl;
  final String? backdropUrl;
  final int? year;
  final String type; // 'Movie' or 'Series'
  final double? popularity;
  final double? rating;
  final String? userRating;

  ImdbExternalListItem({
    required this.imdbId,
    this.tmdbId = '',
    required this.title,
    this.posterUrl,
    this.backdropUrl,
    this.year,
    required this.type,
    this.popularity,
    this.rating,
    this.userRating,
  });

  Map<String, dynamic> toJson() => {
        'imdbId': imdbId,
        'tmdbId': tmdbId,
        'title': title,
        'posterUrl': posterUrl,
        'backdropUrl': backdropUrl,
        'year': year,
        'type': type,
        'popularity': popularity,
        'rating': rating,
        'userRating': userRating,
      };

  factory ImdbExternalListItem.fromJson(Map<String, dynamic> json) =>
      ImdbExternalListItem(
        imdbId: json['imdbId'] as String,
        tmdbId: json['tmdbId'] as String? ?? '',
        title: json['title'] as String,
        posterUrl: json['posterUrl'] as String?,
        backdropUrl: json['backdropUrl'] as String?,
        year: json['year'] as int?,
        type: json['type'] as String,
        popularity: (json['popularity'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)?.toDouble(),
        userRating: json['userRating'] as String?,
      );
}

class CustomExternalListsService {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ));

  CustomExternalListsService();

  String constructSourceUrl(String source, String type, Map<String, dynamic> params) {
    switch (source) {
      case 'imdb':
        if (type == 'user_list') {
          final listId = params['listid'] as String? ?? '';
          return 'https://www.imdb.com/list/$listId/';
        } else {
          final eventId = params['eventid'] as String? ?? '';
          final year = params['year'] as String? ?? '';
          return 'https://www.imdb.com/event/$eventId/$year/';
        }
      case 'tmdb':
        final id = params['id'] as String? ?? '';
        if (type == 'movie_collection') {
          return 'https://www.themoviedb.org/collection/$id';
        } else {
          return 'https://www.themoviedb.org/list/$id';
        }
      case 'letterboxd':
        final username = params['user'] as String? ?? '';
        return 'https://letterboxd.com/$username/';
      case 'mdblist':
        final username = params['username'] as String? ?? '';
        final listname = params['listname'] as String? ?? '';
        return 'https://mdblist.com/lists/$username/$listname/';
      default:
        return 'Unknown Source';
    }
  }

  Future<List<ImdbExternalListItem>> fetchCustomRow(HomeSectionConfig config, {bool forceRefresh = false}) async {
    final sectionId = config.pluginSection;
    if (sectionId == null || sectionId.isEmpty) return [];

    final additionalData = config.pluginAdditionalData;
    if (additionalData == null || additionalData.isEmpty) return [];

    final Map<String, dynamic> rowConfig;
    try {
      rowConfig = jsonDecode(additionalData) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('[CustomService] Failed to parse additionalData: $e');
      return [];
    }

    final source = rowConfig['source'] as String?;
    final type = rowConfig['type'] as String?;
    final params = rowConfig['params'] as Map<String, dynamic>? ?? {};
    final modifiableParams = Map<String, dynamic>.from(params);
    if (forceRefresh) {
      // The plugin keys its cache on source:type:sha256(params), so changing params
      // is what actually forces a fresh fetch. This is an authed Dio call with no HTTP
      // cache in between, so cache-control headers and query flags would do nothing.
      modifiableParams['_nocache'] = DateTime.now().millisecondsSinceEpoch.toString();
    }

    if (source == null || type == null) return [];

    if (source == 'imdb') {
      debugPrint('[CustomService] IMDb custom row source is deprecated and unsupported.');
      return [];
    }

    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client == null) {
      return loadCustomRowFromCache(config);
    }

    final baseUrl = client.baseUrl;
    final token = client.accessToken;
    if (token == null) {
      return loadCustomRowFromCache(config);
    }

    final paramsJson = jsonEncode(modifiableParams);
    final url = '$baseUrl/Moonfin/CustomRows/Items';

    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'source': source,
          'type': type,
          'params': paramsJson,
        },
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Custom rows controller returned status ${response.statusCode}');
      }

      final data = response.data;
      if (data == null || data['success'] != true) {
        throw Exception(data?['error'] ?? 'Unknown backend error');
      }

      final rawItems = data['items'] as List?;
      if (rawItems == null) return [];

      final List<ImdbExternalListItem> items = [];
      for (final rawItem in rawItems) {
        final providerIds = (rawItem['providerIds'] ?? rawItem['ProviderIds']) as Map<String, dynamic>? ?? {};
        final imdbId = (providerIds['Imdb'] ?? providerIds['imdb'] ?? providerIds['IMDB'])?.toString() ?? '';
        final tmdbId = (providerIds['Tmdb'] ?? providerIds['tmdb'] ?? providerIds['TMDB'])?.toString() ?? '';
        final title = (rawItem['name'] ?? rawItem['Name']) as String? ?? 'Unknown';
        final posterUrl = (rawItem['posterUrl'] ?? rawItem['PosterUrl'] ?? rawItem['poster_path']) as String?;
        final backdropUrl = (rawItem['backdropUrl'] ?? rawItem['BackdropUrl'] ?? rawItem['backdrop_path']) as String?;
        final year = (rawItem['productionYear'] ?? rawItem['ProductionYear'] ?? rawItem['year'] ?? rawItem['Year']) as int?;
        final itemType = (rawItem['type'] ?? rawItem['Type']) as String? ?? 'Movie';
        final userRating = (rawItem['userRating'] ?? rawItem['UserRating']) as String?;

        if (imdbId.isNotEmpty || tmdbId.isNotEmpty) {
          items.add(ImdbExternalListItem(
            imdbId: imdbId,
            tmdbId: tmdbId,
            title: title,
            posterUrl: posterUrl,
            backdropUrl: backdropUrl,
            year: year,
            type: itemType,
            userRating: userRating,
          ));
        }
      }

      if (items.isNotEmpty) {
        await saveCustomRowToCache(config, items);
      }

      return _applySorting(items, config);
    } catch (e) {
      debugPrint('[CustomService] Fetch failed from server. Falling back to local cache: $e');
      return loadCustomRowFromCache(config);
    }
  }

  // --- Caching ---
  Future<File> cacheFile(HomeSectionConfig config) async {
    final dir = PlatformDetection.isAppleTV
        ? await getApplicationCacheDirectory()
        : await getApplicationSupportDirectory();
    final sanitizedSection = config.pluginSection!.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '_');
    return File('${dir.path}/custom_chart_$sanitizedSection.json');
  }

  Future<void> saveCustomRowToCache(HomeSectionConfig config, List<ImdbExternalListItem> items) async {
    try {
      final file = await cacheFile(config);
      final jsonList = items.map((item) => item.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList), flush: true);
    } catch (e) {
      debugPrint('[CustomService] Failed to save custom row cache: $e');
    }
  }

  Future<List<ImdbExternalListItem>> loadCustomRowFromCache(HomeSectionConfig config) async {
    try {
      final file = await cacheFile(config);
      if (file.existsSync()) {
        final content = await file.readAsString();
        final decoded = jsonDecode(content) as List;
        final items = decoded
            .map((item) => ImdbExternalListItem.fromJson(item as Map<String, dynamic>))
            .toList();
        final hasOldCache = decoded.any((item) => item is Map && !item.containsKey('backdropUrl'));
        final hasBuggyCache = items.any((item) => item.imdbId.isEmpty && item.tmdbId.isEmpty);
        if (hasOldCache || hasBuggyCache) {
          debugPrint('[CustomService] Invalid or buggy custom row cache detected, invalidating...');
          try {
            await file.delete();
          } catch (_) {}
          return [];
        }
        return _applySorting(items, config);
      }
    } catch (e) {
      debugPrint('[CustomService] Failed to load custom row cache: $e');
    }
    return [];
  }

  List<ImdbExternalListItem> _applySorting(List<ImdbExternalListItem> items, HomeSectionConfig config) {
    if (items.isEmpty) return items;

    Map<String, dynamic> rowConfig = {};
    try {
      rowConfig = jsonDecode(config.pluginAdditionalData ?? '{}') as Map<String, dynamic>;
    } catch (_) {}

    final sortBy = rowConfig['sort_by'] as String? ?? 'none';
    final sortOrder = rowConfig['sort_order'] as String? ?? 'desc';

    if (sortBy == 'none') return items;

    final sortedItems = List<ImdbExternalListItem>.from(items);

    if (sortBy == 'shuffle') {
      sortedItems.shuffle();
    } else {
      sortedItems.sort((a, b) {
        int cmp = 0;
        switch (sortBy) {
          case 'title':
            cmp = a.title.toLowerCase().compareTo(b.title.toLowerCase());
            break;
          case 'year':
            final ay = a.year ?? 0;
            final by = b.year ?? 0;
            cmp = ay.compareTo(by);
            break;
          case 'popularity':
            final ap = a.popularity ?? 0.0;
            final bp = b.popularity ?? 0.0;
            cmp = ap.compareTo(bp);
            break;
          case 'rating':
            final ar = a.rating ?? 0.0;
            final br = b.rating ?? 0.0;
            cmp = ar.compareTo(br);
            break;
        }
        return sortOrder == 'asc' ? cmp : -cmp;
      });
    }
    return sortedItems;
  }
}
