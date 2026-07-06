import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/app_localizations.dart';
import 'admin_user_providers.dart';

class AdminMediaMetricDefinition {
  final String key;
  final List<String> includeItemTypes;

  const AdminMediaMetricDefinition(
    this.key,
    this.includeItemTypes,
  );
}

const adminMediaMetrics = <AdminMediaMetricDefinition>[
  AdminMediaMetricDefinition('movies', ['Movie']),
  AdminMediaMetricDefinition('series', ['Series']),
  AdminMediaMetricDefinition('episodes', ['Episode']),
  AdminMediaMetricDefinition('albums', ['MusicAlbum']),
  AdminMediaMetricDefinition('songs', ['Audio']),
  AdminMediaMetricDefinition('books', ['Book']),
  AdminMediaMetricDefinition('audiobooks', ['AudioBook']),
  AdminMediaMetricDefinition('collections', ['BoxSet']),
  AdminMediaMetricDefinition('musicVideos', ['MusicVideo']),
  AdminMediaMetricDefinition('photos', ['Photo']),
  AdminMediaMetricDefinition('videos', ['Video']),
];

String adminMediaMetricLabel(AppLocalizations l10n, String key) {
  switch (key) {
    case 'movies':
      return l10n.movies;
    case 'series':
      return l10n.series;
    case 'episodes':
      return l10n.episodes;
    case 'albums':
      return l10n.albums;
    case 'songs':
      return l10n.songs;
    case 'books':
      return l10n.books;
    case 'audiobooks':
      return l10n.audiobooks;
    case 'collections':
      return l10n.collections;
    case 'musicVideos':
      return l10n.musicVideos;
    case 'photos':
      return l10n.photos;
    case 'videos':
      return l10n.videos;
    default:
      return key;
  }
}

class AdminMediaCountSummary {
  final Map<String, int> totals;

  const AdminMediaCountSummary({
    required this.totals,
  });

  int countFor(String key) => totals[key] ?? 0;

  int get totalTrackedItems => totals.values.fold(0, (sum, count) => sum + count);
}

class AdminLibraryMediaAnalytics {
  final String name;
  final String itemId;
  final String? collectionType;
  final Map<String, int> counts;
  final AdminLibraryInsights insights;

  const AdminLibraryMediaAnalytics({
    required this.name,
    required this.itemId,
    required this.collectionType,
    required this.counts,
    this.insights = const AdminLibraryInsights(),
  });

  int countFor(String key) => counts[key] ?? 0;

  int get totalTrackedItems => counts.values.fold(0, (sum, count) => sum + count);
}

class AdminLibraryInsights {
  final Map<String, int> genres;
  final Map<String, int> contributors;
  final Map<String, int> years;
  final Map<String, int> ratings;
  final Map<String, int> runtimeBuckets;
  final Map<String, int> containers;
  final Map<String, int> videoCodecs;
  final Map<String, int> audioCodecs;

  const AdminLibraryInsights({
    this.genres = const {},
    this.contributors = const {},
    this.years = const {},
    this.ratings = const {},
    this.runtimeBuckets = const {},
    this.containers = const {},
    this.videoCodecs = const {},
    this.audioCodecs = const {},
  });

  bool get hasData =>
      genres.isNotEmpty ||
      contributors.isNotEmpty ||
      years.isNotEmpty ||
      ratings.isNotEmpty ||
      runtimeBuckets.isNotEmpty ||
      containers.isNotEmpty ||
      videoCodecs.isNotEmpty ||
      audioCodecs.isNotEmpty;
}

class AdminAnalyticsLoadingState {
  final double progress;
  final AdminMediaAnalyticsDetail? data;

  const AdminAnalyticsLoadingState({
    required this.progress,
    this.data,
  });
}

class AdminMediaAnalyticsDetail {
  final AdminMediaCountSummary summary;
  final List<AdminLibraryMediaAnalytics> libraries;
  final AdminTechnicalProfile technicalProfile;

  const AdminMediaAnalyticsDetail({
    required this.summary,
    required this.libraries,
    required this.technicalProfile,
  });
}

class AdminTechnicalProfile {
  final int sampledItems;
  final int totalRecordCount;
  final Duration sampledRuntime;
  final Map<String, int> containers;
  final Map<String, int> videoCodecs;
  final Map<String, int> audioCodecs;

  const AdminTechnicalProfile({
    this.sampledItems = 0,
    this.totalRecordCount = 0,
    this.sampledRuntime = Duration.zero,
    this.containers = const {},
    this.videoCodecs = const {},
    this.audioCodecs = const {},
  });

  bool get hasData => sampledItems > 0;
}

final adminMediaSummaryProvider = FutureProvider<AdminMediaCountSummary>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return _loadSummary(client);
});

final adminMediaAnalyticsProvider = StreamProvider<AdminAnalyticsLoadingState>((ref) async* {
  final client = GetIt.instance<MediaServerClient>();
  final cacheKey = 'admin_media_analytics_${client.baseUrl}_${client.userId}';

  SharedPreferences? prefs;
  AdminMediaAnalyticsDetail? cachedData;
  try {
    prefs = await SharedPreferences.getInstance();
    final cachedJsonStr = prefs.getString(cacheKey);
    if (cachedJsonStr != null) {
      final decoded = jsonDecode(cachedJsonStr);
      if (decoded is Map<String, dynamic>) {
        cachedData = _detailFromJson(decoded);
      }
    }
  } catch (e) {
    print('Failed to read cached analytics: $e');
  }

  if (cachedData != null) {
    yield AdminAnalyticsLoadingState(
      progress: 1.0,
      data: cachedData,
    );
  } else {
    yield const AdminAnalyticsLoadingState(progress: 0.05);
  }

  try {
    final libraries = await ref.read(adminLibrariesProvider.future);
    if (cachedData == null) {
      yield const AdminAnalyticsLoadingState(progress: 0.15);
    }

    final summaryFuture = _loadSummary(client);
    final summary = await summaryFuture;
    if (cachedData == null) {
      yield const AdminAnalyticsLoadingState(progress: 0.25);
    }

    final List<AdminLibraryMediaAnalytics> libraryAnalytics = [];
    final double progressStep = 0.70 / (libraries.isEmpty ? 1 : libraries.length);

    for (int i = 0; i < libraries.length; i++) {
      final library = libraries[i];
      final analytics = await _loadLibraryAnalytics(client, library);
      libraryAnalytics.add(analytics);
      if (cachedData == null) {
        yield AdminAnalyticsLoadingState(progress: 0.25 + (i + 1) * progressStep);
      }
    }

    int totalSampled = 0;
    int totalRecord = 0;
    final aggregatedContainers = <String, int>{};
    final aggregatedVideoCodecs = <String, int>{};
    final aggregatedAudioCodecs = <String, int>{};

    for (final lib in libraryAnalytics) {
      final insights = lib.insights;
      totalRecord += lib.totalTrackedItems;
      totalSampled += insights.videoCodecs.values.fold(0, (sum, val) => sum + val);

      insights.containers.forEach((key, val) {
        aggregatedContainers[key] = (aggregatedContainers[key] ?? 0) + val;
      });
      insights.videoCodecs.forEach((key, val) {
        aggregatedVideoCodecs[key] = (aggregatedVideoCodecs[key] ?? 0) + val;
      });
      insights.audioCodecs.forEach((key, val) {
        aggregatedAudioCodecs[key] = (aggregatedAudioCodecs[key] ?? 0) + val;
      });
    }

    final technicalProfile = AdminTechnicalProfile(
      sampledItems: totalSampled,
      totalRecordCount: totalRecord,
      sampledRuntime: Duration.zero,
      containers: aggregatedContainers,
      videoCodecs: aggregatedVideoCodecs,
      audioCodecs: aggregatedAudioCodecs,
    );

    libraryAnalytics.sort((a, b) {
      final totalCompare = b.totalTrackedItems.compareTo(a.totalTrackedItems);
      if (totalCompare != 0) {
        return totalCompare;
      }
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    final detail = AdminMediaAnalyticsDetail(
      summary: summary,
      libraries: libraryAnalytics,
      technicalProfile: technicalProfile,
    );

    if (prefs != null) {
      try {
        final serialized = jsonEncode(_detailToJson(detail));
        await prefs.setString(cacheKey, serialized);
      } catch (e) {
        print('Failed to save cached analytics: $e');
      }
    }

    yield AdminAnalyticsLoadingState(
      progress: 1.0,
      data: detail,
    );
  } catch (e, stack) {
    print('Failed to fetch analytics: $e\n$stack');
    if (cachedData == null) {
      rethrow;
    }
  }
});

String _countsKeyForMetricKey(String key) {
  switch (key) {
    case 'movies':
      return 'MovieCount';
    case 'series':
      return 'SeriesCount';
    case 'episodes':
      return 'EpisodeCount';
    case 'albums':
      return 'AlbumCount';
    case 'songs':
      return 'SongCount';
    case 'books':
      return 'BookCount';
    case 'audiobooks':
      return 'AudioBookCount';
    case 'collections':
      return 'CollectionCount';
    case 'musicVideos':
      return 'MusicVideoCount';
    case 'photos':
      return 'PhotoCount';
    case 'videos':
      return 'VideoCount';
    default:
      return '';
  }
}

Future<AdminMediaCountSummary> _loadSummary(MediaServerClient client) async {
  try {
    final counts = await client.adminSystemApi.getItemCounts();
    final totals = <String, int>{};
    for (final metric in adminMediaMetrics) {
      final serverKey = _countsKeyForMetricKey(metric.key);
      final count = counts[serverKey];
      if (count is num) {
        totals[metric.key] = count.toInt();
      } else {
        totals[metric.key] = await _safeFetchCount(
          client,
          includeItemTypes: metric.includeItemTypes,
        );
      }
    }
    return AdminMediaCountSummary(totals: totals);
  } catch (_) {
    final entries = await Future.wait(
      adminMediaMetrics.map((metric) async {
        final count = await _safeFetchCount(
          client,
          includeItemTypes: metric.includeItemTypes,
        );
        return MapEntry(metric.key, count);
      }),
    );

    return AdminMediaCountSummary(
      totals: {
        for (final entry in entries) entry.key: entry.value,
      },
    );
  }
}

Future<AdminLibraryMediaAnalytics> _loadLibraryAnalytics(
  MediaServerClient client,
  VirtualFolderInfo library,
) async {
  if (library.itemId.isEmpty) {
    return AdminLibraryMediaAnalytics(
      name: library.name,
      itemId: library.itemId,
      collectionType: library.collectionType,
      counts: {
        for (final metric in adminMediaMetrics) metric.key: 0,
      },
      insights: const AdminLibraryInsights(),
    );
  }

  final relevantMetrics = _metricsForCollectionType(library.collectionType);
  final countEntries = await Future.wait(
    relevantMetrics.map((metric) async {
      final count = await _safeFetchCount(
        client,
        parentId: library.itemId,
        includeItemTypes: metric.includeItemTypes,
      );
      return MapEntry(metric.key, count);
    }),
  );

  final insights = await _loadLibraryInsights(client, library);

  return AdminLibraryMediaAnalytics(
    name: library.name,
    itemId: library.itemId,
    collectionType: library.collectionType,
    counts: {
      for (final metric in adminMediaMetrics) metric.key: 0,
      for (final entry in countEntries) entry.key: entry.value,
    },
    insights: insights,
  );
}

Future<int> _safeFetchCount(
  MediaServerClient client, {
  String? parentId,
  required List<String> includeItemTypes,
}) async {
  try {
    return await _fetchCount(
      client,
      parentId: parentId,
      includeItemTypes: includeItemTypes,
    );
  } catch (_) {
    return 0;
  }
}

Future<int> _fetchCount(
  MediaServerClient client, {
  String? parentId,
  required List<String> includeItemTypes,
}) async {
  final response = await client.itemsApi.getItems(
    serverWide: true,
    parentId: parentId,
    includeItemTypes: includeItemTypes,
    recursive: true,
    limit: 1,
    enableTotalRecordCount: true,
  );

  final totalRecordCount = response['TotalRecordCount'];
  if (totalRecordCount is num) {
    return totalRecordCount.toInt();
  }

  final items = response['Items'];
  if (items is List) {
    return items.length;
  }

  return 0;
}

List<AdminMediaMetricDefinition> _metricsForCollectionType(String? collectionType) {
  switch ((collectionType ?? '').toLowerCase()) {
    case 'movies':
      return _metricsForKeys(['movies']);
    case 'tvshows':
      return _metricsForKeys(['series', 'episodes']);
    case 'music':
      return _metricsForKeys(['albums', 'songs']);
    case 'musicvideos':
      return _metricsForKeys(['musicVideos']);
    case 'books':
      return _metricsForKeys(['books', 'audiobooks']);
    case 'photos':
      return _metricsForKeys(['photos']);
    case 'homevideos':
      return _metricsForKeys(['videos']);
    case 'boxsets':
      return const [];
    default:
      return adminMediaMetrics
          .where((metric) => metric.key != 'collections')
          .toList();
  }
}

List<AdminMediaMetricDefinition> _metricsForKeys(List<String> keys) {
  return adminMediaMetrics.where((metric) => keys.contains(metric.key)).toList();
}

Future<AdminLibraryInsights> _loadLibraryInsights(
  MediaServerClient client,
  VirtualFolderInfo library,
) async {
  final collectionType = (library.collectionType ?? '').toLowerCase();
  List<String> includeItemTypes;
  String fields;

  int pageSize = 1000;
  switch (collectionType) {
    case 'movies':
      includeItemTypes = const ['Movie'];
      fields =
          'Genres,ProductionYear,OfficialRating,RunTimeTicks,Container,MediaSources,MediaStreams';
      pageSize = 1000;
    case 'tvshows':
      includeItemTypes = const ['Series', 'Episode'];
      fields =
          'Genres,ProductionYear,OfficialRating,RunTimeTicks,Container,MediaSources,MediaStreams';
      pageSize = 1000;
    case 'music':
      includeItemTypes = const ['Audio', 'MusicAlbum'];
      fields =
          'Genres,Artists,AlbumArtists,ProductionYear,Container,MediaSources,MediaStreams';
      pageSize = 1000;
    case 'books':
      includeItemTypes = const ['Book', 'AudioBook'];
      fields =
          'Genres,People,Authors,ProductionYear,Path,Container,MediaSources,MediaStreams';
      pageSize = 1000;
    default:
      return const AdminLibraryInsights();
  }

  final List<Map<String, dynamic>> items = [];
  int startIndex = 0;

  try {
    while (true) {
      final response = await client.itemsApi.getItems(
        serverWide: false,
        parentId: library.itemId,
        includeItemTypes: includeItemTypes,
        recursive: true,
        fields: fields,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        startIndex: startIndex,
        limit: pageSize,
        enableTotalRecordCount: true,
      );

      final rawItems = response['Items'];
      final fetchedItems = rawItems is List
          ? rawItems.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList()
          : const <Map<String, dynamic>>[];

      items.addAll(fetchedItems);

      final totalCount = response['TotalRecordCount'] is num
          ? (response['TotalRecordCount'] as num).toInt()
          : 0;

      if (fetchedItems.length < pageSize || totalCount <= 0 || items.length >= totalCount) {
        break;
      }
      startIndex += pageSize;
    }

    final genres = <String, int>{};
    final contributors = <String, int>{};
    final years = <String, int>{};
    final ratings = <String, int>{};
    final runtimeBuckets = <String, int>{};
    final containers = <String, int>{};
    final videoCodecs = <String, int>{};
    final audioCodecs = <String, int>{};

    for (final item in items) {
      for (final genre in _extractStringList(item['Genres'])) {
        _incrementDisplayCount(genres, genre);
      }

      final productionYear = item['ProductionYear'];
      if (productionYear is num && productionYear > 0) {
        _incrementDisplayCount(years, productionYear.toInt().toString());
      }

      var hasContainer = false;
      final mediaSources = _mapList(item['MediaSources']);
      for (final source in mediaSources) {
        if (collectionType == 'books') {
          final sourcePathFormat = _bookFormatFromPath(source['Path']);
          if (sourcePathFormat != null) {
            _incrementCount(containers, sourcePathFormat);
            hasContainer = true;
          }
        }

        final sourceContainer = _normalizeToken(source['Container']);
        if (sourceContainer != null && !(collectionType == 'books' && hasContainer)) {
          _incrementCount(containers, sourceContainer);
          hasContainer = true;
        }

        var hasVideoStream = false;
        var hasAudioStream = false;
        final mediaStreams = _mapList(source['MediaStreams']);
        for (final stream in mediaStreams) {
          final streamType = _normalizeToken(stream['Type']);
          final streamCodec = _normalizeToken(stream['Codec']);
          if (streamCodec == null) {
            continue;
          }

          if (streamType == 'video') {
            _incrementCount(videoCodecs, streamCodec);
            hasVideoStream = true;
          } else if (streamType == 'audio') {
            _incrementCount(audioCodecs, streamCodec);
            hasAudioStream = true;
          }
        }

        if (!hasVideoStream) {
          final sourceVideoCodec = _normalizeToken(source['VideoCodec']);
          if (sourceVideoCodec != null) {
            _incrementCount(videoCodecs, sourceVideoCodec);
          }
        }

        if (!hasAudioStream) {
          final sourceAudioCodec = _normalizeToken(source['AudioCodec']);
          if (sourceAudioCodec != null) {
            _incrementCount(audioCodecs, sourceAudioCodec);
          }
        }
      }

      if (!hasContainer) {
        if (collectionType == 'books') {
          final itemPathFormat = _bookFormatFromPath(item['Path']);
          if (itemPathFormat != null) {
            _incrementCount(containers, itemPathFormat);
            hasContainer = true;
          }
        }

        final itemContainer = _normalizeToken(item['Container']);
        if (itemContainer != null && !(collectionType == 'books' && hasContainer)) {
          _incrementCount(containers, itemContainer);
        }
      }

      if (mediaSources.isEmpty) {
        final itemStreams = _mapList(item['MediaStreams']);
        for (final stream in itemStreams) {
          final streamType = _normalizeToken(stream['Type']);
          final streamCodec = _normalizeToken(stream['Codec']);
          if (streamCodec == null) {
            continue;
          }

          if (streamType == 'video') {
            _incrementCount(videoCodecs, streamCodec);
          } else if (streamType == 'audio') {
            _incrementCount(audioCodecs, streamCodec);
          }
        }
      }

      if (collectionType == 'movies' || collectionType == 'tvshows') {
        final officialRating = item['OfficialRating']?.toString().trim();
        if (officialRating != null && officialRating.isNotEmpty) {
          _incrementDisplayCount(ratings, officialRating.toUpperCase());
        }

        final runTimeTicks = item['RunTimeTicks'];
        if (runTimeTicks is num && runTimeTicks > 0) {
          final runtime = Duration(microseconds: runTimeTicks.toInt() ~/ 10);
          _incrementDisplayCount(runtimeBuckets, _runtimeBucket(runtime));
        }
      }

      if (collectionType == 'music') {
        for (final artist in _extractStringList(item['Artists'])) {
          _incrementDisplayCount(contributors, artist);
        }
        final albumArtists = _mapList(item['AlbumArtists']);
        for (final albumArtist in albumArtists) {
          final name = albumArtist['Name'];
          if (name != null) {
            _incrementDisplayCount(contributors, name.toString());
          }
        }
      } else {
        for (final author in _extractStringList(item['Authors'])) {
          _incrementDisplayCount(contributors, author);
        }
        final people = _mapList(item['People']);
        for (final person in people) {
          final role = (person['Type'] ?? '').toString().toLowerCase();
          if (role == 'writer' || role == 'author') {
            final name = person['Name'];
            if (name != null) {
              _incrementDisplayCount(contributors, name.toString());
            }
          }
        }
      }
    }

    return AdminLibraryInsights(
      genres: genres,
      contributors: contributors,
      years: years,
      ratings: ratings,
      runtimeBuckets: runtimeBuckets,
      containers: containers,
      videoCodecs: videoCodecs,
      audioCodecs: audioCodecs,
    );
  } catch (e, stack) {
    print('Error in _loadLibraryInsights: $e\n$stack');
    rethrow;
  }
}

String _runtimeBucket(Duration runtime) {
  final minutes = runtime.inMinutes;
  if (minutes < 15) {
    return '<15m';
  }
  if (minutes < 30) {
    return '15-29m';
  }
  if (minutes < 45) {
    return '30-44m';
  }
  if (minutes < 60) {
    return '45-59m';
  }
  if (minutes < 90) {
    return '60-89m';
  }
  if (minutes < 120) {
    return '90-119m';
  }
  return '120m+';
}

Future<AdminTechnicalProfile> _loadTechnicalProfile(MediaServerClient client) async {
  try {
    final response = await client.itemsApi.getItems(
      serverWide: false,
      includeItemTypes: const ['Movie', 'Episode', 'Video', 'MusicVideo', 'Audio'],
      recursive: true,
      fields: 'MediaSources,MediaStreams,RunTimeTicks,Container',
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      limit: 200,
      enableTotalRecordCount: false,
    );

    final rawItems = response['Items'];
    final items = rawItems is List
        ? rawItems.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList()
        : const <Map<String, dynamic>>[];
    final total = response['TotalRecordCount'] is num
        ? (response['TotalRecordCount'] as num).toInt()
        : items.length;

    final containers = <String, int>{};
    final videoCodecs = <String, int>{};
    final audioCodecs = <String, int>{};
    var sampledRuntimeMicros = 0;

    for (final item in items) {
      final runTimeTicks = item['RunTimeTicks'];
      if (runTimeTicks is num && runTimeTicks > 0) {
        sampledRuntimeMicros += runTimeTicks.toInt() ~/ 10;
      }

      var containerAdded = false;
      final mediaSources = _mapList(item['MediaSources']);
      for (final source in mediaSources) {
        final sourceContainer = _normalizeToken(source['Container']);
        if (sourceContainer != null) {
          _incrementCount(containers, sourceContainer);
          containerAdded = true;
        }

        final mediaStreams = _mapList(source['MediaStreams']);
        var hasVideoStream = false;
        var hasAudioStream = false;
        for (final stream in mediaStreams) {
          final type = _normalizeToken(stream['Type']);
          final codec = _normalizeToken(stream['Codec']);
          if (codec == null) {
            continue;
          }

          if (type == 'video') {
            _incrementCount(videoCodecs, codec);
            hasVideoStream = true;
          } else if (type == 'audio') {
            _incrementCount(audioCodecs, codec);
            hasAudioStream = true;
          }
        }

        if (!hasVideoStream) {
          final sourceVideoCodec = _normalizeToken(source['VideoCodec']);
          if (sourceVideoCodec != null) {
            _incrementCount(videoCodecs, sourceVideoCodec);
          }
        }

        if (!hasAudioStream) {
          final sourceAudioCodec = _normalizeToken(source['AudioCodec']);
          if (sourceAudioCodec != null) {
            _incrementCount(audioCodecs, sourceAudioCodec);
          }
        }
      }

      if (!containerAdded) {
        final itemContainer = _normalizeToken(item['Container']);
        if (itemContainer != null) {
          _incrementCount(containers, itemContainer);
        }
      }
    }

    return AdminTechnicalProfile(
      sampledItems: items.length,
      totalRecordCount: total,
      sampledRuntime: Duration(microseconds: sampledRuntimeMicros),
      containers: containers,
      videoCodecs: videoCodecs,
      audioCodecs: audioCodecs,
    );
  } catch (e, stack) {
    print('Error in _loadTechnicalProfile: $e\n$stack');
    rethrow;
  }
}

List<Map<String, dynamic>> _mapList(dynamic value) {
  if (value is! List) {
    return const [];
  }

  return value
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList();
}

void _incrementCount(Map<String, int> map, String key) {
  map[key] = (map[key] ?? 0) + 1;
}

void _incrementDisplayCount(Map<String, int> map, String value) {
  final normalized = value.trim();
  if (normalized.isEmpty) {
    return;
  }

  String? existingKey;
  for (final key in map.keys) {
    if (key.toLowerCase() == normalized.toLowerCase()) {
      existingKey = key;
      break;
    }
  }

  final targetKey = existingKey ?? normalized;
  map[targetKey] = (map[targetKey] ?? 0) + 1;
}

List<String> _extractStringList(dynamic value) {
  if (value is! List) {
    return const [];
  }

  return value
      .map((entry) => entry?.toString().trim() ?? '')
      .where((entry) => entry.isNotEmpty)
      .toList();
}

String? _normalizeToken(Object? value) {
  if (value == null) {
    return null;
  }

  final raw = value.toString().trim().toLowerCase();
  if (raw.isEmpty) {
    return null;
  }

  final parts = raw.split(RegExp(r'[,;|/ ]+')).where((part) => part.isNotEmpty);
  if (parts.isEmpty) {
    return null;
  }

  return parts.first;
}

String? _bookFormatFromPath(Object? pathValue) {
  final extension = _fileExtensionFromPath(pathValue);
  if (extension == null) {
    return null;
  }

  const knownFormats = <String>{
    'epub',
    'pdf',
    'cbr',
    'cbz',
    'cb7',
    'cbt',
    'cba',
    'mobi',
    'azw',
    'azw3',
    'fb2',
    'djvu',
    'm4b',
    'mp3',
    'aac',
    'flac',
    'opus',
    'ogg',
    'wav',
  };

  return knownFormats.contains(extension) ? extension : null;
}

String? _fileExtensionFromPath(Object? pathValue) {
  if (pathValue == null) {
    return null;
  }

  final path = pathValue.toString().trim().toLowerCase();
  if (path.isEmpty) {
    return null;
  }

  final slash = path.lastIndexOf(RegExp(r'[\\/]'));
  final filename = slash >= 0 ? path.substring(slash + 1) : path;
  final dot = filename.lastIndexOf('.');
  if (dot <= 0 || dot == filename.length - 1) {
    return null;
  }

  return filename.substring(dot + 1);
}

Map<String, dynamic> _summaryToJson(AdminMediaCountSummary summary) {
  return {'totals': summary.totals};
}

AdminMediaCountSummary _summaryFromJson(Map<String, dynamic> json) {
  final totals = Map<String, dynamic>.from(json['totals'] ?? {});
  return AdminMediaCountSummary(
    totals: totals.map((k, v) => MapEntry(k, (v as num).toInt())),
  );
}

Map<String, dynamic> _technicalToJson(AdminTechnicalProfile profile) {
  return {
    'sampledItems': profile.sampledItems,
    'totalRecordCount': profile.totalRecordCount,
    'sampledRuntime': profile.sampledRuntime.inMicroseconds,
    'containers': profile.containers,
    'videoCodecs': profile.videoCodecs,
    'audioCodecs': profile.audioCodecs,
  };
}

AdminTechnicalProfile _technicalFromJson(Map<String, dynamic> json) {
  return AdminTechnicalProfile(
    sampledItems: (json['sampledItems'] as num?)?.toInt() ?? 0,
    totalRecordCount: (json['totalRecordCount'] as num?)?.toInt() ?? 0,
    sampledRuntime: Duration(microseconds: (json['sampledRuntime'] as num?)?.toInt() ?? 0),
    containers: Map<String, dynamic>.from(json['containers'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    videoCodecs: Map<String, dynamic>.from(json['videoCodecs'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    audioCodecs: Map<String, dynamic>.from(json['audioCodecs'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
  );
}

Map<String, dynamic> _insightsToJson(AdminLibraryInsights insights) {
  return {
    'genres': insights.genres,
    'contributors': insights.contributors,
    'years': insights.years,
    'ratings': insights.ratings,
    'runtimeBuckets': insights.runtimeBuckets,
    'containers': insights.containers,
    'videoCodecs': insights.videoCodecs,
    'audioCodecs': insights.audioCodecs,
  };
}

AdminLibraryInsights _insightsFromJson(Map<String, dynamic> json) {
  return AdminLibraryInsights(
    genres: Map<String, dynamic>.from(json['genres'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    contributors: Map<String, dynamic>.from(json['contributors'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    years: Map<String, dynamic>.from(json['years'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    ratings: Map<String, dynamic>.from(json['ratings'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    runtimeBuckets: Map<String, dynamic>.from(json['runtimeBuckets'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    containers: Map<String, dynamic>.from(json['containers'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    videoCodecs: Map<String, dynamic>.from(json['videoCodecs'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    audioCodecs: Map<String, dynamic>.from(json['audioCodecs'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
  );
}

Map<String, dynamic> _libraryToJson(AdminLibraryMediaAnalytics lib) {
  return {
    'name': lib.name,
    'itemId': lib.itemId,
    'collectionType': lib.collectionType,
    'counts': lib.counts,
    'insights': _insightsToJson(lib.insights),
  };
}

AdminLibraryMediaAnalytics _libraryFromJson(Map<String, dynamic> json) {
  return AdminLibraryMediaAnalytics(
    name: (json['name'] ?? '').toString(),
    itemId: (json['itemId'] ?? '').toString(),
    collectionType: json['collectionType']?.toString(),
    counts: Map<String, dynamic>.from(json['counts'] ?? {}).map((k, v) => MapEntry(k, (v as num).toInt())),
    insights: _insightsFromJson(Map<String, dynamic>.from(json['insights'] ?? {})),
  );
}

Map<String, dynamic> _detailToJson(AdminMediaAnalyticsDetail detail) {
  return {
    'summary': _summaryToJson(detail.summary),
    'libraries': detail.libraries.map(_libraryToJson).toList(),
    'technicalProfile': _technicalToJson(detail.technicalProfile),
  };
}

AdminMediaAnalyticsDetail _detailFromJson(Map<String, dynamic> json) {
  return AdminMediaAnalyticsDetail(
    summary: _summaryFromJson(Map<String, dynamic>.from(json['summary'] ?? {})),
    libraries: (json['libraries'] as List? ?? [])
        .map((e) => _libraryFromJson(Map<String, dynamic>.from(e)))
        .toList(),
    technicalProfile: _technicalFromJson(Map<String, dynamic>.from(json['technicalProfile'] ?? {})),
  );
}