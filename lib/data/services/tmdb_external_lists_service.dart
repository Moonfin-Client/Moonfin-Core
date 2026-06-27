import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'imdb_external_lists_service.dart';

class TmdbExternalListsService {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static const _endpoint = 'https://api.themoviedb.org/3/';

  static final _pathMap = {
    HomeSectionType.tmdbPopularMovies: 'movie/popular',
    HomeSectionType.tmdbTopRatedMovies: 'movie/top_rated',
    HomeSectionType.tmdbNowPlayingMovies: 'movie/now_playing',
    HomeSectionType.tmdbUpcomingMovies: 'movie/upcoming',
    HomeSectionType.tmdbPopularTv: 'tv/popular',
    HomeSectionType.tmdbTopRatedTv: 'tv/top_rated',
    HomeSectionType.tmdbAiringTodayTv: 'tv/airing_today',
    HomeSectionType.tmdbOnTheAirTv: 'tv/on_the_air',
    HomeSectionType.tmdbTrendingMovieDaily: 'trending/movie/day',
    HomeSectionType.tmdbTrendingMovieWeekly: 'trending/movie/week',
    HomeSectionType.tmdbTrendingTvDaily: 'trending/tv/day',
    HomeSectionType.tmdbTrendingTvWeekly: 'trending/tv/week',
    HomeSectionType.tmdbTrendingAllWeekly: 'trending/all/week',
  };

  final UserPreferences _prefs;

  TmdbExternalListsService(this._prefs);

  Future<List<ImdbExternalListItem>> fetchChart(HomeSectionType sectionType, {int limit = 50}) async {
    final path = _pathMap[sectionType];
    if (path == null) {
      throw ArgumentError('Unsupported TMDB chart section: $sectionType');
    }

    final apiKey = _prefs.get(UserPreferences.tmdbApiKey);
    if (apiKey.isEmpty) {
      throw StateError('TMDB API Key is not configured');
    }

    final url = '$_endpoint$path';
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
          'page': 1,
        },
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch TMDB chart: ${response.statusCode}',
        );
      }

      final data = response.data;
      if (data == null || data['results'] == null) {
        return [];
      }

      final results = data['results'] as List;
      final items = <ImdbExternalListItem>[];

      for (final res in results.take(limit)) {
        final idVal = res['id'];
        if (idVal == null) continue;
        final id = idVal.toString();

        final title = (res['title'] as String?) ?? (res['name'] as String?) ?? 'Unknown';
        final posterPath = res['poster_path'] as String?;
        final backdropPath = res['backdrop_path'] as String?;

        final dateStr = (res['release_date'] as String?) ?? (res['first_air_date'] as String?);
        int? year;
        if (dateStr != null && dateStr.length >= 4) {
          year = int.tryParse(dateStr.substring(0, 4));
        }

        // Determine media type
        final mediaTypeRaw = res['media_type'] as String?;
        final String type;
        if (mediaTypeRaw != null) {
          type = mediaTypeRaw == 'tv' ? 'Series' : 'Movie';
        } else {
          // Fallback based on path
          type = path.contains('tv') ? 'Series' : 'Movie';
        }

        items.add(ImdbExternalListItem(
          imdbId: id, // Store TMDB ID in the imdbId slot (unique string id)
          title: title,
          posterUrl: posterPath, // Store relative poster path (starts with /)
          year: year,
          type: type,
        ));
      }

      return items;
    } catch (e) {
      rethrow;
    }
  }

  Future<File> _cacheFile(HomeSectionType sectionType) async {
    final dir = PlatformDetection.isAppleTV
        ? await getApplicationCacheDirectory()
        : await getApplicationSupportDirectory();
    final path = _pathMap[sectionType]!.replaceAll('/', '_');
    return File('${dir.path}/tmdb_chart_$path.json');
  }

  Future<void> saveChartToCache(HomeSectionType sectionType, List<ImdbExternalListItem> items) async {
    try {
      final file = await _cacheFile(sectionType);
      final jsonList = items.map((item) => item.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList), flush: true);
    } catch (e) {
      debugPrint('[TmdbExternalListsService] Failed to save chart cache: $e');
    }
  }

  Future<List<ImdbExternalListItem>> loadChartFromCache(HomeSectionType sectionType) async {
    try {
      final file = await _cacheFile(sectionType);
      if (file.existsSync()) {
        final content = await file.readAsString();
        final decoded = jsonDecode(content) as List;
        return decoded
            .map((item) => ImdbExternalListItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('[TmdbExternalListsService] Failed to load chart cache: $e');
    }
    return [];
  }
}
