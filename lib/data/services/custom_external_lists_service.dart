import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../../preference/home_section_config.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'imdb_external_lists_service.dart';

class CustomExternalListsService {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ));

  final UserPreferences _prefs;
  final Map<String, String> _letterboxdCache = {};
  bool _letterboxdCacheLoaded = false;

  CustomExternalListsService(this._prefs);

  Future<void> _ensureLetterboxdCacheLoaded() async {
    if (_letterboxdCacheLoaded) return;
    try {
      final file = await _letterboxdCacheFile();
      if (file.existsSync()) {
        final content = await file.readAsString();
        final decoded = jsonDecode(content) as Map<String, dynamic>;
        _letterboxdCache.addAll(decoded.cast<String, String>());
      }
    } catch (e) {
      debugPrint('[CustomService] Failed to load Letterboxd cache: $e');
    }
    _letterboxdCacheLoaded = true;
  }

  Future<void> _saveLetterboxdCache() async {
    try {
      final file = await _letterboxdCacheFile();
      await file.writeAsString(jsonEncode(_letterboxdCache), flush: true);
    } catch (e) {
      debugPrint('[CustomService] Failed to save Letterboxd cache: $e');
    }
  }

  Future<File> _letterboxdCacheFile() async {
    final dir = PlatformDetection.isAppleTV
        ? await getApplicationCacheDirectory()
        : await getApplicationSupportDirectory();
    return File('${dir.path}/letterboxd_slug_to_tmdb.json');
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
        final name = params['name'] as String? ?? '';
        if (type == 'watchlist') {
          return 'https://letterboxd.com/$username/watchlist/';
        } else if (type == 'films') {
          return 'https://letterboxd.com/$username/films/';
        } else {
          return 'https://letterboxd.com/$username/list/$name/';
        }
      case 'mdblist':
        final username = params['username'] as String? ?? '';
        final listname = params['listname'] as String? ?? '';
        return 'https://mdblist.com/lists/$username/$listname/';
      default:
        return 'Unknown Source';
    }
  }

  Future<List<ImdbExternalListItem>> fetchCustomRow(HomeSectionConfig config) async {
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

    List<ImdbExternalListItem> items = [];

    try {
      switch (source) {
        case 'mdblist':
          items = await _fetchMdbList(type, params);
          break;
        case 'imdb':
          items = await _fetchImdb(type, params);
          break;
        case 'letterboxd':
          items = await _fetchLetterboxd(type, params);
          break;
        case 'tmdb':
          items = await _fetchTmdb(type, params);
          break;
        default:
          debugPrint('[CustomService] Unsupported custom source: $source');
      }
    } catch (e) {
      final url = constructSourceUrl(source, type, params);
      throw Exception('Failed to fetch from custom row. Constructed URL: $url. Error: $e');
    }

    if (items.isEmpty) {
      final url = constructSourceUrl(source, type, params);
      throw Exception('Fetched 0 items from custom row. Constructed URL: $url. Please check your parameters.');
    }

    await saveCustomRowToCache(config, items);

    return _applySorting(items, config);
  }

  // --- MDBList ---
  Future<List<ImdbExternalListItem>> _fetchMdbList(String type, Map<String, dynamic> params) async {
    final apiKey = _prefs.get(UserPreferences.mdblistApiKey);
    if (apiKey.isEmpty) {
      throw StateError('MDBList API Key is not configured');
    }

    final username = params['username'] as String?;
    final listname = params['listname'] as String?;
    if (username == null || username.isEmpty || listname == null || listname.isEmpty) {
      return [];
    }

    final url = 'https://api.mdblist.com/lists/$username/$listname/items';
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'apikey': apiKey,
          'limit': 250,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('MDBList API returned ${response.statusCode}');
      }

      final data = response.data;
      if (data == null) return [];

      final items = <ImdbExternalListItem>[];

      // Parse either wrapper format {movies: [], shows: []} or flat list
      List<dynamic> rawList = [];
      if (data is Map<String, dynamic>) {
        if (data['movies'] is List) rawList.addAll(data['movies'] as List);
        if (data['shows'] is List) rawList.addAll(data['shows'] as List);
      } else if (data is List) {
        rawList = data;
      }

      for (final item in rawList) {
        final ids = item['ids'] as Map<String, dynamic>?;
        final imdbId = (item['imdb_id'] as String?) ?? (ids?['imdb'] as String?);
        final tmdbId = ids?['tmdb']?.toString();
        final title = (item['title'] as String?) ?? 'Unknown';
        final posterPath = item['poster'] as String? ?? ids?['poster'] as String?;
        final year = item['release_year'] as int?;
        final mediaType = (item['mediatype'] as String?)?.toLowerCase();
        final type = (mediaType == 'show' || mediaType == 'shows' || mediaType == 'series' || mediaType == 'tv') ? 'Series' : 'Movie';
        final rating = (item['rating'] as num?)?.toDouble() ?? (item['score'] as num?)?.toDouble();
        final popularity = (item['popularity'] as num?)?.toDouble() ?? (item['rank'] as num?)?.toDouble();

        if (imdbId != null && imdbId.isNotEmpty) {
          items.add(ImdbExternalListItem(
            imdbId: imdbId,
            title: title,
            posterUrl: posterPath,
            year: year,
            type: type,
            popularity: popularity,
            rating: rating,
          ));
        } else if (tmdbId != null && tmdbId.isNotEmpty) {
          items.add(ImdbExternalListItem(
            imdbId: tmdbId,
            title: title,
            posterUrl: posterPath,
            year: year,
            type: type,
            popularity: popularity,
            rating: rating,
          ));
        }
      }

      return items;
    } catch (e) {
      debugPrint('[CustomService] MDBList fetch failed: $e');
      rethrow;
    }
  }

  // --- IMDb ---
  Future<List<ImdbExternalListItem>> _fetchImdb(String type, Map<String, dynamic> params) async {
    if (type == 'user_list') {
      final listId = params['listid'] as String?;
      if (listId == null || listId.isEmpty) return [];

      final query = '''
{
  list(id: "$listId") {
    items(first: 250) {
      edges {
        node {
          item {
            ... on Title {
              id
              titleText {
                text
              }
              primaryImage {
                url
              }
              releaseYear {
                year
              }
              titleType {
                id
              }
              ratingsSummary {
                aggregateRating
              }
            }
          }
        }
      }
    }
  }
}
''';
      try {
        final response = await _dio.post(
          'https://caching.graphql.imdb.com/',
          data: {'query': query},
          options: Options(headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Content-Type': 'application/json',
          }),
        );

        if (response.statusCode != 200) {
          throw Exception('IMDb GraphQL returned ${response.statusCode}');
        }

        final data = response.data;
        if (data == null || data['data'] == null || data['data']['list'] == null) {
          return [];
        }

        final edges = data['data']['list']['items']['edges'] as List?;
        if (edges == null) return [];

        final items = <ImdbExternalListItem>[];
        for (final edge in edges) {
          final itemNode = edge['node']?['item'];
          if (itemNode == null) continue;

          final imdbId = itemNode['id'] as String?;
          if (imdbId == null || imdbId.isEmpty) continue;

          final title = (itemNode['titleText']?['text'] as String?) ?? 'Unknown';
          final posterUrl = itemNode['primaryImage']?['url'] as String?;
          final year = itemNode['releaseYear']?['year'] as int?;
          final typeId = itemNode['titleType']?['id'] as String? ?? 'movie';
          final type = (typeId == 'tvSeries' || typeId == 'tvMiniSeries') ? 'Series' : 'Movie';
          final rating = (itemNode['ratingsSummary']?['aggregateRating'] as num?)?.toDouble();

          items.add(ImdbExternalListItem(
            imdbId: imdbId,
            title: title,
            posterUrl: posterUrl,
            year: year,
            type: type,
            rating: rating,
          ));
        }
        return items;
      } catch (e) {
        debugPrint('[CustomService] IMDb User List fetch failed: $e');
        rethrow;
      }
    } else if (type == 'awards_events') {
      final eventId = params['eventid'] as String?;
      final yearStr = params['year'] as String?;
      final subcategory = params['subcategory'] as String?;
      if (eventId == null || eventId.isEmpty || yearStr == null || yearStr.isEmpty) return [];

      final year = int.tryParse(yearStr);
      if (year == null) return [];

      final startYear = year - 2;

      // Phase 1: Search for candidates
      final candidateSearchQuery = '''
{
  advancedTitleSearch(
    first: 250,
    constraints: {
      awardConstraint: {
        anyEventNominations: [{ eventId: "$eventId" }]
      },
      releaseDateConstraint: {
        releaseDateRange: {
          start: "$startYear-01-01",
          end: "$year-12-31"
        }
      }
    }
  ) {
    edges {
      node {
        title {
          id
        }
      }
    }
  }
}
''';
      try {
        final searchResponse = await _dio.post(
          'https://caching.graphql.imdb.com/',
          data: {'query': candidateSearchQuery},
          options: Options(headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Content-Type': 'application/json',
          }),
        );

        if (searchResponse.statusCode != 200) {
          throw Exception('IMDb search returned ${searchResponse.statusCode}');
        }

        final searchData = searchResponse.data;
        if (searchData == null || searchData['data'] == null || searchData['data']['advancedTitleSearch'] == null) {
          return [];
        }

        final edges = searchData['data']['advancedTitleSearch']['edges'] as List?;
        if (edges == null || edges.isEmpty) return [];

        final candidateIds = <String>[];
        for (final edge in edges) {
          final id = edge['node']?['title']?['id'] as String?;
          if (id != null && id.isNotEmpty) {
            candidateIds.add(id);
          }
        }

        // Phase 2: Verify candidates and load details in batches of 50
        final verifiedItems = <ImdbExternalListItem>[];
        final idsBatchParam = candidateIds.map((id) => '"$id"').join(',');

        final verifyQuery = '''
{
  titles(ids: [$idsBatchParam]) {
    id
    titleText {
      text
    }
    primaryImage {
      url
    }
    releaseYear {
      year
    }
    titleType {
      id
    }
    ratingsSummary {
      aggregateRating
    }
    awardNominations(first: 50, filter: { events: ["$eventId"] }) {
      edges {
        node {
          award {
            year
            category {
              text
            }
          }
        }
      }
    }
  }
}
''';

        final verifyResponse = await _dio.post(
          'https://caching.graphql.imdb.com/',
          data: {'query': verifyQuery},
          options: Options(headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Content-Type': 'application/json',
          }),
        );

        if (verifyResponse.statusCode != 200) {
          throw Exception('IMDb verify returned ${verifyResponse.statusCode}');
        }

        final verifyData = verifyResponse.data;
        if (verifyData == null || verifyData['data'] == null || verifyData['data']['titles'] == null) {
          return [];
        }

        final titles = verifyData['data']['titles'] as List?;
        if (titles == null) return [];

        for (final titleNode in titles) {
          if (titleNode == null) continue;
          final titleId = titleNode['id'] as String?;
          if (titleId == null || titleId.isEmpty) continue;

          final title = (titleNode['titleText']?['text'] as String?) ?? 'Unknown';
          final posterUrl = titleNode['primaryImage']?['url'] as String?;
          final rYear = titleNode['releaseYear']?['year'] as int?;
          final typeId = titleNode['titleType']?['id'] as String? ?? 'movie';
          final type = (typeId == 'tvSeries' || typeId == 'tvMiniSeries') ? 'Series' : 'Movie';
          final rating = (titleNode['ratingsSummary']?['aggregateRating'] as num?)?.toDouble();

          final nominations = titleNode['awardNominations']?['edges'] as List?;
          if (nominations == null) continue;

          bool matches = false;
          for (final nom in nominations) {
            final award = nom['node']?['award'];
            if (award == null) continue;
            final awardYear = award['year'] as int?;
            if (awardYear != year) continue;

            if (subcategory != null && subcategory.isNotEmpty) {
              final catText = award['category']?['text'] as String?;
              if (catText != null && _categoryMatchesFragment(catText, subcategory)) {
                matches = true;
                break;
              }
            } else {
              matches = true;
              break;
            }
          }

          if (matches) {
            verifiedItems.add(ImdbExternalListItem(
              imdbId: titleId,
              title: title,
              posterUrl: posterUrl,
              year: rYear,
              type: type,
              rating: rating,
            ));
          }
        }

        return verifiedItems;
      } catch (e) {
        debugPrint('[CustomService] IMDb Awards fetch failed: $e');
        rethrow;
      }
    }
    return [];
  }

  bool _categoryMatchesFragment(String string, String fragment) {
    final slug = string.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_+|_+$'), '');
    final normalizedFragment = fragment.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_+|_+$'), '');
    return slug == normalizedFragment || normalizedFragment.endsWith('_$slug');
  }

  // --- Letterboxd ---
  Future<List<ImdbExternalListItem>> _fetchLetterboxd(String type, Map<String, dynamic> params) async {
    final username = params['user'] as String?;
    final name = params['name'] as String?;
    if (username == null || username.isEmpty) return [];

    final String url;
    if (type == 'watchlist') {
      url = 'https://letterboxd.com/$username/watchlist/';
    } else if (type == 'films') {
      url = 'https://letterboxd.com/$username/films/';
    } else {
      if (name == null || name.isEmpty) return [];
      url = 'https://letterboxd.com/$username/list/$name/';
    }

    try {
      await _ensureLetterboxdCacheLoaded();

      // Step 1: Scrape list page for film slugs and user ratings
      final response = await _dio.get(
        url,
        options: Options(headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Letterboxd returned ${response.statusCode}');
      }

      final html = response.data as String? ?? '';
      
      final List<Map<String, String>> filmData = [];
      final matches = RegExp(r'data-target-link="/film/([\w-]+)/"').allMatches(html).toList();
      
      for (int i = 0; i < matches.length; i++) {
        final match = matches[i];
        final slug = match.group(1)!;
        
        final startIdx = match.end;
        final endIdx = (i + 1 < matches.length) ? matches[i + 1].start : html.length;
        final searchArea = html.substring(startIdx, startIdx + 1000 > endIdx ? endIdx : startIdx + 1000);
        
        final ratingMatch = RegExp(r'class="rating\b[^"]*">([^<]+)<').firstMatch(searchArea);
        final userRating = ratingMatch?.group(1)?.trim() ?? '';
        
        filmData.add({
          'slug': slug,
          'rating': userRating,
        });
      }

      final uniqueFilmData = <String, Map<String, String>>{};
      for (final fd in filmData) {
        final slug = fd['slug']!;
        if (!uniqueFilmData.containsKey(slug)) {
          uniqueFilmData[slug] = fd;
        }
      }
      final slugs = uniqueFilmData.keys.toList();

      if (slugs.isEmpty) return [];

      final items = <ImdbExternalListItem>[];

      // Step 2: Resolve TMDB IDs for each slug
      final List<String> unresolvedSlugs = [];
      final List<String> resolvedTmdbIds = [];
      final tmdbIdToRating = <String, String>{};

      for (final slug in slugs) {
        final rating = uniqueFilmData[slug]?['rating'] ?? '';
        final cached = _letterboxdCache[slug];
        if (cached != null) {
          resolvedTmdbIds.add(cached);
          if (rating.isNotEmpty) {
            tmdbIdToRating[cached] = rating;
          }
        } else {
          unresolvedSlugs.add(slug);
        }
      }

      // Concurrently resolve unresolved slugs (up to 3 at a time to avoid throttling)
      if (unresolvedSlugs.isNotEmpty) {
        const batchSize = 3;
        for (int i = 0; i < unresolvedSlugs.length; i += batchSize) {
          final batch = unresolvedSlugs.sublist(i, i + batchSize > unresolvedSlugs.length ? unresolvedSlugs.length : i + batchSize);
          await Future.wait(batch.map((slug) async {
            try {
              // Throttle delay
              await Future.delayed(const Duration(milliseconds: 300));
              final filmUrl = 'https://letterboxd.com/film/$slug/';
              final filmResponse = await _dio.get(
                filmUrl,
                options: Options(headers: {
                  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                  'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
                }),
              );
              if (filmResponse.statusCode == 200) {
                final filmHtml = filmResponse.data as String? ?? '';
                final tmdbIdMatch = RegExp(r'data-tmdb-id="(\d+)"').firstMatch(filmHtml);
                if (tmdbIdMatch != null) {
                  final tmdbId = tmdbIdMatch.group(1)!;
                  _letterboxdCache[slug] = tmdbId;
                  resolvedTmdbIds.add(tmdbId);
                  final rating = uniqueFilmData[slug]?['rating'] ?? '';
                  if (rating.isNotEmpty) {
                    tmdbIdToRating[tmdbId] = rating;
                  }
                }
              }
            } catch (e) {
              debugPrint('[CustomService] Failed to resolve Letterboxd slug $slug: $e');
            }
          }));
          await _saveLetterboxdCache();
        }
      }

      // Step 3: Fetch movie metadata from TMDB API in parallel
      final tmdbApiKey = _prefs.get(UserPreferences.tmdbApiKey);
      if (tmdbApiKey.isEmpty) {
        throw StateError('TMDB API Key is not configured (required for Letterboxd lists)');
      }

      final resolvedItems = <String, ImdbExternalListItem>{};

      await Future.wait(resolvedTmdbIds.map((tmdbId) async {
        try {
          final movieResponse = await _dio.get(
            'https://api.themoviedb.org/3/movie/$tmdbId',
            queryParameters: {
              'api_key': tmdbApiKey,
            },
          );
          if (movieResponse.statusCode == 200) {
            final movieData = movieResponse.data as Map<String, dynamic>?;
            if (movieData != null) {
              final title = movieData['title'] as String? ?? 'Unknown';
              final posterPath = movieData['poster_path'] as String?;
              final dateStr = movieData['release_date'] as String?;
              int? year;
              if (dateStr != null && dateStr.length >= 4) {
                year = int.tryParse(dateStr.substring(0, 4));
              }
              final popularity = (movieData['popularity'] as num?)?.toDouble();
              final rating = (movieData['vote_average'] as num?)?.toDouble();
              final userRating = tmdbIdToRating[tmdbId];
              resolvedItems[tmdbId] = ImdbExternalListItem(
                imdbId: tmdbId, // TMDB ID is stored in imdbId for row navigation
                title: title,
                posterUrl: posterPath,
                year: year,
                type: 'Movie',
                popularity: popularity,
                rating: rating,
                userRating: userRating != null && userRating.isNotEmpty ? userRating : null,
              );
            }
          }
        } catch (e) {
          debugPrint('[CustomService] Failed to fetch TMDB details for $tmdbId: $e');
        }
      }));

      for (final tmdbId in resolvedTmdbIds) {
        final item = resolvedItems[tmdbId];
        if (item != null) {
          items.add(item);
        }
      }

      return items;
    } catch (e) {
      debugPrint('[CustomService] Letterboxd fetch failed: $e');
      rethrow;
    }
  }

  // --- TMDB ---
  Future<List<ImdbExternalListItem>> _fetchTmdb(String type, Map<String, dynamic> params) async {
    final apiKey = _prefs.get(UserPreferences.tmdbApiKey);
    if (apiKey.isEmpty) {
      throw StateError('TMDB API Key is not configured');
    }

    final id = params['id'] as String?;
    if (id == null || id.isEmpty) return [];

    final String url;
    if (type == 'movie_collection') {
      url = 'https://api.themoviedb.org/3/collection/$id';
    } else {
      url = 'https://api.themoviedb.org/3/list/$id';
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('TMDB API returned ${response.statusCode}');
      }

      final data = response.data;
      if (data == null) return [];

      final items = <ImdbExternalListItem>[];

      if (type == 'movie_collection') {
        final parts = data['parts'] as List?;
        if (parts != null) {
          for (final part in parts) {
            final partId = part['id']?.toString();
            final title = (part['title'] as String?) ?? 'Unknown';
            final posterPath = part['poster_path'] as String?;
            final dateStr = part['release_date'] as String?;
            final popularity = (part['popularity'] as num?)?.toDouble();
            final rating = (part['vote_average'] as num?)?.toDouble();
            int? year;
            if (dateStr != null && dateStr.length >= 4) {
              year = int.tryParse(dateStr.substring(0, 4));
            }
            if (partId != null && partId.isNotEmpty) {
              items.add(ImdbExternalListItem(
                imdbId: partId,
                title: title,
                posterUrl: posterPath,
                year: year,
                type: 'Movie',
                popularity: popularity,
                rating: rating,
              ));
            }
          }
        }
      } else {
        final results = data['items'] as List?;
        if (results != null) {
          for (final res in results) {
            final itemId = res['id']?.toString();
            final title = (res['title'] as String?) ?? (res['name'] as String?) ?? 'Unknown';
            final posterPath = res['poster_path'] as String?;
            final dateStr = (res['release_date'] as String?) ?? (res['first_air_date'] as String?);
            final popularity = (res['popularity'] as num?)?.toDouble();
            final rating = (res['vote_average'] as num?)?.toDouble();
            int? year;
            if (dateStr != null && dateStr.length >= 4) {
              year = int.tryParse(dateStr.substring(0, 4));
            }
            final mediaTypeRaw = res['media_type'] as String?;
            final type = mediaTypeRaw == 'tv' ? 'Series' : 'Movie';

            if (itemId != null && itemId.isNotEmpty) {
              items.add(ImdbExternalListItem(
                imdbId: itemId,
                title: title,
                posterUrl: posterPath,
                year: year,
                type: type,
                popularity: popularity,
                rating: rating,
              ));
            }
          }
        }
      }

      return items;
    } catch (e) {
      debugPrint('[CustomService] TMDB fetch failed: $e');
      rethrow;
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
