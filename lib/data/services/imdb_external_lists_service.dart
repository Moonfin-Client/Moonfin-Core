import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../../preference/preference_constants.dart';
import '../../util/platform_detection.dart';

class ImdbExternalListItem {
  final String imdbId;
  final String title;
  final String? posterUrl;
  final int? year;
  final String type; // 'Movie' or 'Series'

  ImdbExternalListItem({
    required this.imdbId,
    required this.title,
    this.posterUrl,
    this.year,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'imdbId': imdbId,
        'title': title,
        'posterUrl': posterUrl,
        'year': year,
        'type': type,
      };

  factory ImdbExternalListItem.fromJson(Map<String, dynamic> json) =>
      ImdbExternalListItem(
        imdbId: json['imdbId'] as String,
        title: json['title'] as String,
        posterUrl: json['posterUrl'] as String?,
        year: json['year'] as int?,
        type: json['type'] as String,
      );
}

class ImdbExternalListsService {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static const _endpoint = 'https://caching.graphql.imdb.com/';

  static final _chartMap = {
    HomeSectionType.imdbTop250Movies: 'TOP_RATED_MOVIES',
    HomeSectionType.imdbTop250TvShows: 'TOP_RATED_TV_SHOWS',
    HomeSectionType.imdbMostPopularMovies: 'MOST_POPULAR_MOVIES',
    HomeSectionType.imdbMostPopularTvShows: 'MOST_POPULAR_TV_SHOWS',
    HomeSectionType.imdbLowestRatedMovies: 'LOWEST_RATED_MOVIES',
    HomeSectionType.imdbTopEnglishMovies: 'TOP_RATED_ENGLISH_MOVIES',
  };

  Future<List<ImdbExternalListItem>> fetchChart(HomeSectionType sectionType, {int limit = 50}) async {
    final chartType = _chartMap[sectionType];
    if (chartType == null) {
      throw ArgumentError('Unsupported IMDb chart section: $sectionType');
    }

    final query = '''
{
  chartTitles(chart: {chartType: $chartType}, first: $limit) {
    edges {
      node {
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
      }
    }
  }
}
''';

    print('[ImdbService] Making POST request to $_endpoint');
    try {
      final response = await _dio.post(
        _endpoint,
        data: {'query': query},
        options: Options(
          headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('[ImdbService] Received response status: ${response.statusCode}');
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch IMDb chart titles: ${response.statusCode}',
        );
      }

      final data = response.data;
      if (data == null || data['data'] == null || data['data']['chartTitles'] == null) {
        return [];
      }

      final edges = data['data']['chartTitles']['edges'] as List?;
      if (edges == null) {
        return [];
      }

      final items = <ImdbExternalListItem>[];
      for (final edge in edges) {
        final node = edge['node'];
        if (node == null) continue;

        final imdbId = node['id'] as String?;
        if (imdbId == null || imdbId.isEmpty) continue;

        final title = (node['titleText']?['text'] as String?) ?? 'Unknown Title';
        final posterUrl = node['primaryImage']?['url'] as String?;
        final year = node['releaseYear']?['year'] as int?;
        final typeId = node['titleType']?['id'] as String? ?? 'movie';
        final type = (typeId == 'tvSeries' || typeId == 'tvMiniSeries') ? 'Series' : 'Movie';

        items.add(ImdbExternalListItem(
          imdbId: imdbId,
          title: title,
          posterUrl: posterUrl,
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
    final chartType = _chartMap[sectionType];
    return File('${dir.path}/imdb_chart_$chartType.json');
  }

  Future<void> saveChartToCache(HomeSectionType sectionType, List<ImdbExternalListItem> items) async {
    try {
      final file = await _cacheFile(sectionType);
      final jsonList = items.map((item) => item.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList), flush: true);
    } catch (e) {
      debugPrint('[ImdbExternalListsService] Failed to save chart cache: $e');
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
      debugPrint('[ImdbExternalListsService] Failed to load chart cache: $e');
    }
    return [];
  }
}
