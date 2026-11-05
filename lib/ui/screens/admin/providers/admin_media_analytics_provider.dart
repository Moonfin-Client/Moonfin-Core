import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../navigation/destinations.dart';
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

/// The dashboard's count cards. All of them are ItemCounts fields, so the
/// dashboard needs no extra /Items counts.
const adminDashboardMetricKeys = <String>[
  'movies',
  'series',
  'episodes',
  'albums',
  'songs',
  'musicVideos',
  'books',
  'collections',
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

  /// Counted but still reading its items, so [insights] is empty for now.
  final bool insightsPending;

  const AdminLibraryMediaAnalytics({
    required this.name,
    required this.itemId,
    required this.collectionType,
    required this.counts,
    this.insights = const AdminLibraryInsights(),
    this.insightsPending = false,
  });

  int countFor(String key) => counts[key] ?? 0;

  int get totalTrackedItems => counts.values.fold(0, (sum, count) => sum + count);

  AdminLibraryMediaAnalytics withInsights(AdminLibraryInsights insights) =>
      AdminLibraryMediaAnalytics(
        name: name,
        itemId: itemId,
        collectionType: collectionType,
        counts: counts,
        insights: insights,
      );
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
}

class AdminAnalyticsLoadingState {
  final double progress;
  final AdminMediaAnalyticsDetail? data;

  const AdminAnalyticsLoadingState({
    required this.progress,
    this.data,
  });

  /// False while [data] holds counts whose insights are still loading.
  bool get isComplete => progress >= 1;
}

class AdminMediaAnalyticsDetail {
  final List<AdminLibraryMediaAnalytics> libraries;
  final AdminTechnicalProfile technicalProfile;

  const AdminMediaAnalyticsDetail({
    required this.libraries,
    required this.technicalProfile,
  });
}

/// The codec and container counts of every library added together.
class AdminTechnicalProfile {
  final Map<String, int> containers;
  final Map<String, int> videoCodecs;
  final Map<String, int> audioCodecs;

  const AdminTechnicalProfile({
    this.containers = const {},
    this.videoCodecs = const {},
    this.audioCodecs = const {},
  });
}

final adminMediaSummaryProvider = FutureProvider<AdminMediaCountSummary>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return _loadSummary(client, adminDashboardMetricKeys);
});

final adminMediaAnalyticsProvider = StreamProvider<AdminAnalyticsLoadingState>((ref) async* {
  final client = GetIt.instance<MediaServerClient>();
  final cacheKey = _analyticsCacheKey(client);

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
  } catch (_) {}

  if (cachedData != null) {
    yield AdminAnalyticsLoadingState(
      progress: 1.0,
      data: cachedData,
    );
  } else {
    yield const AdminAnalyticsLoadingState(progress: 0.05);
  }

  try {
    final libraries = (await ref.read(adminLibrariesProvider.future))
        .where((library) => !adminAnalyticsSkipsLibrary(library.collectionType))
        .toList();

    // Counts are one cheap request each, so the page shows them while the
    // item reads behind the charts are still running.
    final libraryAnalytics = await Future.wait(
      libraries.map((library) => _loadLibraryCounts(client, library)),
    );
    final reads = [
      for (var i = 0; i < libraryAnalytics.length; i++)
        if (libraryAnalytics[i].insightsPending)
          _loadInsights(ref, libraryAnalytics[i]).then((insights) => (i, insights)),
    ];
    if (cachedData == null) {
      yield AdminAnalyticsLoadingState(
        progress: reads.isEmpty ? 1.0 : 0.2,
        data: _detailOf(libraryAnalytics),
      );
    }

    var done = 0;
    await for (final (index, insights) in Stream.fromFutures(reads)) {
      libraryAnalytics[index] = libraryAnalytics[index].withInsights(insights);
      done++;
      if (cachedData == null && done < reads.length) {
        yield AdminAnalyticsLoadingState(
          progress: 0.2 + 0.8 * done / reads.length,
          data: _detailOf(libraryAnalytics),
        );
      }
    }

    final detail = _detailOf(libraryAnalytics);

    if (prefs != null) {
      try {
        final serialized = jsonEncode(_detailToJson(detail));
        await prefs.setString(cacheKey, serialized);
      } catch (_) {}
    }

    yield AdminAnalyticsLoadingState(
      progress: 1.0,
      data: detail,
    );
  } catch (_) {
    if (cachedData == null) {
      rethrow;
    }
  }
});

/// Reads everything again with the progress showing, rather than putting the
/// last result up first.
Future<void> reloadAdminMediaAnalytics(WidgetRef ref) async {
  final client = GetIt.instance<MediaServerClient>();
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_analyticsCacheKey(client));
  } catch (_) {}
  ref
    ..invalidate(adminLibraryItemsProvider)
    ..invalidate(adminMediaAnalyticsProvider);
}

String _analyticsCacheKey(MediaServerClient client) =>
    'admin_media_analytics_${client.baseUrl}_${client.userId}';

/// Live TV, collections and playlists hold no media of their own.
bool adminAnalyticsSkipsLibrary(String? collectionType) {
  final normalized = (collectionType ?? '').toLowerCase();
  return normalized == 'livetv' ||
      normalized == 'live tv' ||
      normalized == 'boxsets' ||
      normalized == 'collections' ||
      normalized == 'playlists';
}

/// Libraries sorted largest first, with their codec counts added together.
AdminMediaAnalyticsDetail _detailOf(
  List<AdminLibraryMediaAnalytics> libraryAnalytics,
) {
  final containers = <String, int>{};
  final videoCodecs = <String, int>{};
  final audioCodecs = <String, int>{};
  void addAll(Map<String, int> into, Map<String, int> counts) =>
      counts.forEach((key, count) => into[key] = (into[key] ?? 0) + count);

  for (final library in libraryAnalytics) {
    addAll(containers, library.insights.containers);
    addAll(videoCodecs, library.insights.videoCodecs);
    addAll(audioCodecs, library.insights.audioCodecs);
  }

  final sorted = [...libraryAnalytics]..sort((a, b) {
    final totalCompare = b.totalTrackedItems.compareTo(a.totalTrackedItems);
    if (totalCompare != 0) {
      return totalCompare;
    }
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });

  return AdminMediaAnalyticsDetail(
    libraries: sorted,
    technicalProfile: AdminTechnicalProfile(
      containers: containers,
      videoCodecs: videoCodecs,
      audioCodecs: audioCodecs,
    ),
  );
}

/// A failed read leaves the library without insights rather than failing the
/// whole page.
Future<AdminLibraryInsights> _loadInsights(
  Ref ref,
  AdminLibraryMediaAnalytics library,
) async {
  try {
    final items = await ref.read(
      adminLibraryItemsProvider((
        itemId: library.itemId,
        collectionType: library.collectionType,
      )).future,
    );
    return _insightsOf(items);
  } catch (_) {
    return const AdminLibraryInsights();
  }
}

/// The ItemCounts field for a metric, null for the ones ItemCounts lacks
/// (audiobooks, photos, videos), which need an /Items count.
String? _countsKeyForMetricKey(String key) {
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
    case 'collections':
      return 'BoxSetCount';
    case 'musicVideos':
      return 'MusicVideoCount';
    default:
      return null;
  }
}

/// Counts [keys] from /Items/Counts, asking /Items only for a key that has no
/// ItemCounts field, or for every key when /Items/Counts fails.
Future<AdminMediaCountSummary> _loadSummary(
  MediaServerClient client,
  List<String> keys,
) async {
  final metrics = _metricsForKeys(keys);
  try {
    final counts = await client.adminSystemApi.getItemCounts();
    final totals = <String, int>{};
    for (final metric in metrics) {
      final serverKey = _countsKeyForMetricKey(metric.key);
      final count = serverKey == null ? null : counts[serverKey];
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
      metrics.map((metric) async {
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

Future<AdminLibraryMediaAnalytics> _loadLibraryCounts(
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
    );
  }

  final relevantMetrics = adminMetricsForCollectionType(library.collectionType);
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

  return AdminLibraryMediaAnalytics(
    name: library.name,
    itemId: library.itemId,
    collectionType: library.collectionType,
    counts: {
      for (final metric in adminMediaMetrics) metric.key: 0,
      for (final entry in countEntries) entry.key: entry.value,
    },
    insightsPending: _itemTypesForInsights(library.collectionType) != null,
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

/// The metrics a library of [collectionType] can have.
List<AdminMediaMetricDefinition> adminMetricsForCollectionType(
  String? collectionType,
) {
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
    // Jellyfin has no photos library type, photo libraries are homevideos.
    case 'homevideos':
      return _metricsForKeys(['videos', 'photos']);
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

typedef AdminAnalyticsLibraryRef = ({String itemId, String? collectionType});

/// Every item of a library that has insights, kept for the session so tapping
/// a category lists its items without reading the library again.
final adminLibraryItemsProvider =
    FutureProvider.family<List<AdminAnalyticsItem>, AdminAnalyticsLibraryRef>(
  (ref, library) =>
      _loadLibraryItems(GetIt.instance<MediaServerClient>(), library),
);

/// One item reduced to what the charts count.
class AdminAnalyticsItem {
  final String id;
  final String name;
  final String type;

  /// The series of an episode or the artist of a song.
  final String? parentName;
  final int? year;
  final String? rating;
  final String? runtimeBucket;
  final List<String> genres;
  final List<String> contributors;

  /// One entry per media source, so a two version movie counts twice.
  final List<String> containers;

  /// One entry per stream, so every audio track counts.
  final List<String> videoCodecs;
  final List<String> audioCodecs;
  final String? imageItemId;
  final String? imageTag;

  const AdminAnalyticsItem({
    required this.id,
    required this.name,
    required this.type,
    this.parentName,
    this.year,
    this.rating,
    this.runtimeBucket,
    this.genres = const [],
    this.contributors = const [],
    this.containers = const [],
    this.videoCodecs = const [],
    this.audioCodecs = const [],
    this.imageItemId,
    this.imageTag,
  });

  factory AdminAnalyticsItem.fromJson(
    Map<String, dynamic> item,
    String? collectionType,
  ) {
    final type = (collectionType ?? '').toLowerCase();
    final containers = <String>[];
    final videoCodecs = <String>[];
    final audioCodecs = <String>[];

    var hasContainer = false;
    final mediaSources = _mapList(item['MediaSources']);
    for (final source in mediaSources) {
      if (type == 'books') {
        final sourcePathFormat = _bookFormatFromPath(source['Path']);
        if (sourcePathFormat != null) {
          containers.add(sourcePathFormat);
          hasContainer = true;
        }
      }

      final sourceContainer = _normalizeToken(source['Container']);
      if (sourceContainer != null && !(type == 'books' && hasContainer)) {
        containers.add(sourceContainer);
        hasContainer = true;
      }

      for (final stream in _mapList(source['MediaStreams'])) {
        final streamType = _normalizeToken(stream['Type']);
        final streamCodec = _normalizeToken(stream['Codec']);
        if (streamCodec == null) {
          continue;
        }
        if (streamType == 'video') {
          videoCodecs.add(streamCodec);
        } else if (streamType == 'audio') {
          audioCodecs.add(streamCodec);
        }
      }
    }

    if (!hasContainer) {
      if (type == 'books') {
        final itemPathFormat = _bookFormatFromPath(item['Path']);
        if (itemPathFormat != null) {
          containers.add(itemPathFormat);
          hasContainer = true;
        }
      }

      final itemContainer = _normalizeToken(item['Container']);
      if (itemContainer != null && !(type == 'books' && hasContainer)) {
        containers.add(itemContainer);
      }
    }

    String? rating;
    String? runtimeBucket;
    if (type == 'movies' || type == 'tvshows') {
      final officialRating = item['OfficialRating']?.toString().trim();
      if (officialRating != null && officialRating.isNotEmpty) {
        rating = officialRating.toUpperCase();
      }

      final runTimeTicks = item['RunTimeTicks'];
      if (runTimeTicks is num && runTimeTicks > 0) {
        runtimeBucket = _runtimeBucket(
          Duration(microseconds: runTimeTicks.toInt() ~/ 10),
        );
      }
    }

    final contributors = <String>[];
    if (type == 'music') {
      contributors.addAll(_extractStringList(item['Artists']));
      for (final albumArtist in _mapList(item['AlbumArtists'])) {
        final name = albumArtist['Name'];
        if (name != null) {
          contributors.add(name.toString());
        }
      }
    } else {
      // BaseItemDto has no Authors, book writers come from People.
      for (final person in _mapList(item['People'])) {
        final role = (person['Type'] ?? '').toString().toLowerCase();
        final name = person['Name'];
        if ((role == 'writer' || role == 'author') && name != null) {
          contributors.add(name.toString());
        }
      }
    }

    final productionYear = item['ProductionYear'];
    final (imageItemId, imageTag) = _primaryImageOf(item);
    return AdminAnalyticsItem(
      id: (item['Id'] ?? '').toString(),
      name: (item['Name'] ?? '').toString(),
      type: (item['Type'] ?? '').toString(),
      parentName: (item['SeriesName'] ?? item['AlbumArtist'])?.toString(),
      year: productionYear is num && productionYear > 0
          ? productionYear.toInt()
          : null,
      rating: rating,
      runtimeBucket: runtimeBucket,
      genres: _distinct(_extractStringList(item['Genres'])),
      // A song names its artist as both artist and album artist.
      contributors: _distinct(contributors),
      containers: containers,
      videoCodecs: videoCodecs,
      audioCodecs: audioCodecs,
      imageItemId: imageItemId,
      imageTag: imageTag,
    );
  }
}

/// The item's own poster, else its series' or album's.
(String?, String?) _primaryImageOf(Map<String, dynamic> item) {
  final tags = item['ImageTags'];
  final own = tags is Map ? tags['Primary'] : null;
  if (own != null) return (item['Id']?.toString(), own.toString());
  for (final (idKey, tagKey) in const [
    ('SeriesId', 'SeriesPrimaryImageTag'),
    ('AlbumId', 'AlbumPrimaryImageTag'),
  ]) {
    final id = item[idKey];
    final tag = item[tagKey];
    if (id != null && tag != null) return (id.toString(), tag.toString());
  }
  return (null, null);
}

List<String> _distinct(List<String> values) {
  final seen = <String>{};
  return [
    for (final value in values)
      if (seen.add(value.toLowerCase())) value,
  ];
}

enum AdminAnalyticsDimension {
  type,
  genre,
  contributor,
  year,
  rating,
  runtime,
  container,
  videoCodec,
  audioCodec,
}

/// A tapped category: its library (every library when null), the kind of
/// value and the values it covers.
class AdminAnalyticsQuery {
  final String? libraryId;
  final AdminAnalyticsDimension dimension;

  /// Metric key for [AdminAnalyticsDimension.type], else the counted values.
  /// An empty [AdminAnalyticsDimension.year] query is every dated item.
  final List<String> values;
  final String title;

  const AdminAnalyticsQuery({
    this.libraryId,
    required this.dimension,
    required this.values,
    required this.title,
  });

  factory AdminAnalyticsQuery.fromUri(Uri uri) {
    final params = uri.queryParameters;
    return AdminAnalyticsQuery(
      libraryId: params['library'],
      dimension: AdminAnalyticsDimension.values.asNameMap()[params['dimension']] ??
          AdminAnalyticsDimension.type,
      values: uri.queryParametersAll['value'] ?? const [],
      title: params['title'] ?? '',
    );
  }

  String get location => Uri(
    path: Destinations.adminAnalyticsItems,
    queryParameters: {
      'library': ?libraryId,
      'dimension': dimension.name,
      'value': values,
      'title': title,
    },
  ).toString();

  bool matches(AdminAnalyticsItem item) {
    final wanted = {for (final value in values) value.toLowerCase()};
    bool any(List<String> found) =>
        found.any((value) => wanted.contains(value.toLowerCase()));
    return switch (dimension) {
      AdminAnalyticsDimension.type => adminMediaMetrics.any(
        (metric) =>
            values.contains(metric.key) &&
            metric.includeItemTypes.contains(item.type),
      ),
      AdminAnalyticsDimension.genre => any(item.genres),
      AdminAnalyticsDimension.contributor => any(item.contributors),
      AdminAnalyticsDimension.year =>
        item.year != null && (wanted.isEmpty || wanted.contains('${item.year}')),
      AdminAnalyticsDimension.rating =>
        item.rating != null && wanted.contains(item.rating!.toLowerCase()),
      AdminAnalyticsDimension.runtime => item.runtimeBucket != null &&
          wanted.contains(item.runtimeBucket!.toLowerCase()),
      AdminAnalyticsDimension.container => any(item.containers),
      AdminAnalyticsDimension.videoCodec => any(item.videoCodecs),
      AdminAnalyticsDimension.audioCodec => any(item.audioCodecs),
    };
  }

  @override
  bool operator ==(Object other) =>
      other is AdminAnalyticsQuery &&
      other.libraryId == libraryId &&
      other.dimension == dimension &&
      other.title == title &&
      listEquals(other.values, values);

  @override
  int get hashCode =>
      Object.hash(libraryId, dimension, title, Object.hashAll(values));
}

/// The items behind a tapped category, filtered from the libraries' kept
/// items. Libraries without them, like home videos, list a media type
/// straight from the server.
final adminAnalyticsItemsProvider = FutureProvider.autoDispose
    .family<List<AdminAnalyticsItem>, AdminAnalyticsQuery>((ref, query) async {
  final client = GetIt.instance<MediaServerClient>();
  final libraries = (await ref.watch(adminLibrariesProvider.future)).where(
    (library) =>
        library.itemId.isNotEmpty &&
        !adminAnalyticsSkipsLibrary(library.collectionType) &&
        (query.libraryId == null || library.itemId == query.libraryId),
  );

  final lists = await Future.wait(libraries.map((library) async {
    if (_itemTypesForInsights(library.collectionType) != null) {
      final items = await ref.watch(
        adminLibraryItemsProvider((
          itemId: library.itemId,
          collectionType: library.collectionType,
        )).future,
      );
      return items.where(query.matches).toList();
    }
    final metric = query.dimension == AdminAnalyticsDimension.type
        ? adminMetricsForCollectionType(library.collectionType)
            .where((metric) => query.values.contains(metric.key))
            .firstOrNull
        : null;
    if (metric == null) return const <AdminAnalyticsItem>[];
    final raw = await _fetchAllItems(
      client,
      parentId: library.itemId,
      includeItemTypes: metric.includeItemTypes,
    );
    return [
      for (final json in raw)
        AdminAnalyticsItem.fromJson(json, library.collectionType),
    ];
  }));

  // Episodes and songs group under their series or artist. Inside a group the
  // server's sort order stands, which keeps episodes in order.
  final byYear = query.dimension == AdminAnalyticsDimension.year;
  final all = [for (final list in lists) ...list];
  final sorted = [
    for (var i = 0; i < all.length; i++)
      (index: i, group: (all[i].parentName ?? '').toLowerCase(), item: all[i]),
  ]..sort((a, b) {
    if (byYear) {
      final years = (b.item.year ?? 0).compareTo(a.item.year ?? 0);
      if (years != 0) return years;
    }
    final groups = a.group.compareTo(b.group);
    return groups != 0 ? groups : a.index.compareTo(b.index);
  });
  return [for (final entry in sorted) entry.item];
});

/// The item types a library's insights read, null when it has none.
List<String>? _itemTypesForInsights(String? collectionType) {
  switch ((collectionType ?? '').toLowerCase()) {
    case 'movies':
      return const ['Movie'];
    case 'tvshows':
      return const ['Series', 'Episode'];
    case 'music':
      return const ['Audio', 'MusicAlbum'];
    case 'books':
      return const ['Book', 'AudioBook'];
    default:
      return null;
  }
}

Future<List<AdminAnalyticsItem>> _loadLibraryItems(
  MediaServerClient client,
  AdminAnalyticsLibraryRef library,
) async {
  final includeItemTypes = _itemTypesForInsights(library.collectionType);
  if (includeItemTypes == null) {
    return const [];
  }

  // Only ItemFields names go in Fields, and MediaSources already carry their
  // streams. Jellyfin sends ProductionYear, OfficialRating, RunTimeTicks,
  // Container, Artists and AlbumArtists unasked, Emby leaves the year and
  // rating out unless Fields names them.
  var fields = (library.collectionType ?? '').toLowerCase() == 'books'
      ? 'Genres,People,Path,MediaSources'
      : 'Genres,MediaSources';
  if (client.serverType == ServerType.emby) {
    fields += ',ProductionYear,OfficialRating';
  }

  final raw = await _fetchAllItems(
    client,
    parentId: library.itemId,
    includeItemTypes: includeItemTypes,
    fields: fields,
  );
  return [
    for (final json in raw)
      AdminAnalyticsItem.fromJson(json, library.collectionType),
  ];
}

/// Item pages read at once across every library. Jellyfin only starts its
/// answer once a whole page of MediaSources is built. With every library
/// reading big pages together, that start slipped past the client's 8s
/// connect timeout, which on web aborts the request.
final _itemPages = _Slots(4);

/// Runs tasks with at most [_free] of them in flight, the rest in order.
class _Slots {
  _Slots(this._free);

  int _free;
  final _waiting = Queue<Completer<void>>();

  Future<T> run<T>(Future<T> Function() task) async {
    if (_free > 0) {
      _free--;
    } else {
      final turn = Completer<void>();
      _waiting.add(turn);
      await turn.future;
    }
    try {
      return await task();
    } finally {
      if (_waiting.isEmpty) {
        _free++;
      } else {
        _waiting.removeFirst().complete();
      }
    }
  }
}

/// Every matching item, the first page alone to learn the total and the rest
/// queued behind the shared page limit.
Future<List<Map<String, dynamic>>> _fetchAllItems(
  MediaServerClient client, {
  required String parentId,
  required List<String> includeItemTypes,
  String? fields,
}) async {
  const pageSize = 300;

  Future<Map<String, dynamic>> page(int startIndex) => _itemPages.run(
    // GET /Items takes the user from the token, /Users/{id}/Items is obsolete.
    () => client.itemsApi.getItems(
      serverWide: true,
      parentId: parentId,
      includeItemTypes: includeItemTypes,
      recursive: true,
      fields: fields,
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      startIndex: startIndex,
      limit: pageSize,
      enableTotalRecordCount: true,
      enableImageTypes: 'Primary',
      imageTypeLimit: 1,
    ),
  );

  final first = await page(0);
  final items = _mapList(first['Items']);
  final total = first['TotalRecordCount'] is num
      ? (first['TotalRecordCount'] as num).toInt()
      : 0;
  if (items.length < pageSize || total <= items.length) {
    return items;
  }

  final starts = [
    for (var start = pageSize; start < total; start += pageSize) start,
  ];
  final pages = await Future.wait(starts.map(page));
  for (final response in pages) {
    items.addAll(_mapList(response['Items']));
  }
  return items;
}

AdminLibraryInsights _insightsOf(List<AdminAnalyticsItem> items) {
  final genres = _DisplayCounter();
  final contributors = _DisplayCounter();
  final years = _DisplayCounter();
  final ratings = _DisplayCounter();
  final runtimeBuckets = _DisplayCounter();
  final containers = _DisplayCounter();
  final videoCodecs = _DisplayCounter();
  final audioCodecs = _DisplayCounter();

  for (final item in items) {
    genres.addAll(item.genres);
    contributors.addAll(item.contributors);
    if (item.year != null) years.add('${item.year}');
    if (item.rating != null) ratings.add(item.rating!);
    if (item.runtimeBucket != null) runtimeBuckets.add(item.runtimeBucket!);
    containers.addAll(item.containers);
    videoCodecs.addAll(item.videoCodecs);
    audioCodecs.addAll(item.audioCodecs);
  }

  return AdminLibraryInsights(
    genres: genres.counts,
    contributors: contributors.counts,
    years: years.counts,
    ratings: ratings.counts,
    runtimeBuckets: runtimeBuckets.counts,
    containers: containers.counts,
    videoCodecs: videoCodecs.counts,
    audioCodecs: audioCodecs.counts,
  );
}

/// Counts values case-insensitively under the spelling seen first.
class _DisplayCounter {
  final counts = <String, int>{};
  final _keys = <String, String>{};

  void add(String value) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      return;
    }
    final key = _keys.putIfAbsent(normalized.toLowerCase(), () => normalized);
    counts[key] = (counts[key] ?? 0) + 1;
  }

  void addAll(Iterable<String> values) => values.forEach(add);
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

List<Map<String, dynamic>> _mapList(dynamic value) {
  if (value is! List) {
    return const [];
  }

  return value
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList();
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
    'libraries': detail.libraries.map(_libraryToJson).toList(),
  };
}

/// Cached libraries go through the same skip as fresh ones.
AdminMediaAnalyticsDetail _detailFromJson(Map<String, dynamic> json) {
  return _detailOf(
    (json['libraries'] as List? ?? [])
        .map((e) => _libraryFromJson(Map<String, dynamic>.from(e)))
        .where((library) => !adminAnalyticsSkipsLibrary(library.collectionType))
        .toList(),
  );
}
