import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart';
import '../../l10n/current_app_localizations.dart';
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

  /// The certification Moonbase looked up on TMDB, or null when it has none.
  final String? officialRating;

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
    this.officialRating,
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
        'officialRating': officialRating,
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
        officialRating: json['officialRating'] as String?,
      );
}

class CustomExternalListsService {
  final Dio _dio;

  /// Who the cached rows belong to. The server holds a row to the user's parental limit and
  /// leaves the cache alone when nothing passes, so a row written for one account must not be
  /// read back by the next one on a shared device: the signed-in user on the signed-in server
  /// names the file. Null when nobody is signed in, which leaves the user out of the name.
  /// Tests hand in their own.
  final String? Function() _cacheScope;

  CustomExternalListsService({String? Function()? cacheScope, Dio? dio})
      : _cacheScope = cacheScope ?? _signedInScope,
        _dio = dio ??
            Dio(BaseOptions(
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 45),
            ));

  static String? _signedInScope() {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return null;
    final client = GetIt.instance<MediaServerClient>();
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;
    return sha1.convert(utf8.encode('${client.baseUrl}|$userId')).toString().substring(0, 16);
  }

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

  Future<List<ImdbExternalListItem>> fetchCustomRow(
    HomeSectionConfig config, {
    bool forceRefresh = false,
    bool throwOnError = false,
    String? language,
  }) async {
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

    if (source == null || type == null) return [];

    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client == null) {
      return loadCustomRowFromCache(config, language: language);
    }

    final baseUrl = client.baseUrl;
    final token = client.accessToken;
    if (token == null) {
      return loadCustomRowFromCache(config, language: language);
    }

    final paramsJson = jsonEncode(params);
    final url = '$baseUrl/Moonfin/CustomRows/Items';
    final lang = language ?? currentAppLocale().toLanguageTag();

    // The account that starts the fetch owns the answer: the scope is taken
    // before anything is awaited, the answer is dropped when another account
    // is signed in by the time it arrives, and the file is named by this
    // scope and no later one. The row from before goes before the request
    // rather than after the answer, since an empty or failed answer saves
    // nothing and the old row must not outlive it.
    final scope = _cacheScope();
    await _dropLegacyCacheFor(config, scope);

    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'source': source,
          'type': type,
          'params': paramsJson,
          if (lang.isNotEmpty) 'language': lang,
          // The plugin bypasses and overwrites its canonical cache entry on
          // refresh=true, so all devices see the refreshed list.
          if (forceRefresh) 'refresh': 'true',
        },
        options: Options(
          headers: {
            'Authorization': buildServerAuthorizationHeader(
              scheme: 'MediaBrowser',
              deviceInfo: client.deviceInfo,
              accessToken: token,
            ),
          },
        ),
      );

      if (_cacheScope() != scope) {
        debugPrint('[CustomService] Another account signed in during the fetch, answer dropped');
        return await loadCustomRowFromCache(config, language: lang);
      }

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
        final officialRating = (rawItem['officialRating'] ?? rawItem['OfficialRating']) as String?;
        // The popularity and rating sort options rely on these two fields.
        final rating =
            ((rawItem['rating'] ?? rawItem['Rating']) as num?)?.toDouble();
        final popularity =
            ((rawItem['popularity'] ?? rawItem['Popularity']) as num?)
                ?.toDouble();

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
            rating: rating,
            popularity: popularity,
            officialRating: officialRating,
          ));
        }
      }

      if (items.isNotEmpty) {
        await _saveCustomRowToCacheFor(config, items, scope, lang);
      }

      return _applySorting(items, config);
    } catch (e) {
      if (throwOnError) rethrow;
      debugPrint('[CustomService] Fetch failed from server. Falling back to local cache: $e');
      return loadCustomRowFromCache(config, language: lang);
    }
  }

  // --- Caching ---

  static const cacheMaxAge = Duration(hours: 24);

  Future<Directory> _cacheDir() async => PlatformDetection.isAppleTV
      ? await getApplicationCacheDirectory()
      : await getApplicationSupportDirectory();

  static String _sectionName(HomeSectionConfig config) =>
      config.pluginSection!.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '_');

  /// The row's file for whoever is signed in, in the given or current language.
  Future<File> cacheFile(HomeSectionConfig config, [String? language]) =>
      _cacheFileFor(config, _cacheScope(), language);

  Future<File> _cacheFileFor(HomeSectionConfig config, String? scope, [String? language]) async {
    final dir = await _cacheDir();
    final suffix = scope == null ? '' : '_$scope';
    final lang = (language ?? currentAppLocale().toLanguageTag())
        .replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '_')
        .toLowerCase();
    final langSuffix = lang.isNotEmpty ? '_$lang' : '';
    return File('${dir.path}/custom_chart_${_sectionName(config)}$suffix$langSuffix.json');
  }

  /// The row's file from before the cache was scoped per user, which an upgrade must not keep
  /// handing to the next account.
  Future<File> _legacyCacheFile(HomeSectionConfig config) async {
    final dir = await _cacheDir();
    return File('${dir.path}/custom_chart_${_sectionName(config)}.json');
  }

  Future<void> saveCustomRowToCache(
    HomeSectionConfig config,
    List<ImdbExternalListItem> items, {
    String? language,
  }) =>
      _saveCustomRowToCacheFor(config, items, _cacheScope(), language);

  Future<void> _saveCustomRowToCacheFor(
    HomeSectionConfig config,
    List<ImdbExternalListItem> items,
    String? scope,
    String? language,
  ) async {
    try {
      final file = await _cacheFileFor(config, scope, language);
      final jsonList = items.map((item) => item.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList), flush: true);
      await _dropLegacyCacheFor(config, scope);
    } catch (e) {
      debugPrint('[CustomService] Failed to save custom row cache: $e');
    }
  }

  @visibleForTesting
  Future<void> dropLegacyCache(HomeSectionConfig config) => _dropLegacyCacheFor(config, _cacheScope());

  Future<void> _dropLegacyCacheFor(HomeSectionConfig config, String? scope) async {
    try {
      final file = await _cacheFileFor(config, scope);
      final legacy = await _legacyCacheFile(config);
      if (legacy.path != file.path && legacy.existsSync()) {
        await legacy.delete();
      }
    } catch (e) {
      debugPrint('[CustomService] Failed to drop the unscoped custom row cache: $e');
    }
  }

  /// [maxAge] is for callers that mean to go to the network when the row is
  /// old. The fallbacks below leave it unset, since a stale row beats an empty
  /// one when the server cant be reached.
  Future<List<ImdbExternalListItem>> loadCustomRowFromCache(
    HomeSectionConfig config, {
    Duration? maxAge,
    String? language,
  }) async {
    try {
      final file = await cacheFile(config, language);
      if (file.existsSync()) {
        try {
          final lastModified = file.lastModifiedSync();
          if (maxAge != null &&
              DateTime.now().difference(lastModified) > maxAge) {
            return [];
          }
        } catch (_) {}
        final content = await file.readAsString();
        final decoded = jsonDecode(content) as List;
        final items = decoded
            .map((item) => ImdbExternalListItem.fromJson(item as Map<String, dynamic>))
            .toList();
        final hasOldCache = decoded.any((item) =>
            item is Map && (!item.containsKey('backdropUrl') || !item.containsKey('officialRating')));
        final hasBuggyCache = items.any((item) => item.imdbId.isEmpty && item.tmdbId.isEmpty);
        // Older plugins sent IMDb chart titles with the poster standing in for the backdrop
        // and no TMDB id, so that copy is dropped to pick up both once the server has them.
        final hasPosterBackdrops = items.any((item) =>
            (item.backdropUrl ?? '').isNotEmpty && item.backdropUrl == item.posterUrl);
        if (hasOldCache || hasBuggyCache || hasPosterBackdrops) {
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
