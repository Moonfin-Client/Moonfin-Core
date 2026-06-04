import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/models/aggregated_library.dart';
import '../../data/repositories/user_views_repository.dart';

const String _kShuffleOverlayItemFields =
    'Name,Type,UserData,RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,'
    'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
    'ParentThumbImageTag,Overview,CommunityRating,OfficialRating,CriticRating,'
    'ProviderIds,Genres';
const String _kShuffleCandidateItemFields = 'Type';
const _kShuffleUserViewsTimeout = Duration(seconds: 6);
const _kShuffleHydrationTimeout = Duration(seconds: 3);

const List<String> _kShuffleExcludeItemTypes = <String>[
  'BoxSet',
  'CollectionFolder',
];

final Set<String> _shuffleIdsHydrationUnsupportedServers = <String>{};

void _shuffleLogInfo(String message) {}

void _shuffleLogError(String message, Object error, StackTrace stackTrace) {}

bool _shouldDisableIdsHydrationForError(DioException error) {
  final statusCode = error.response?.statusCode;
  return statusCode == 400 ||
      statusCode == 404 ||
      statusCode == 405 ||
      statusCode == 422 ||
      statusCode == 501;
}

String _normalizeShuffleContentType(String contentType) {
  final normalized = contentType.trim().toLowerCase();
  return switch (normalized) {
    'movies' || 'movie' => 'movies',
    'shows' || 'show' || 'tvshows' || 'tvshow' || 'series' => 'shows',
    _ => 'both',
  };
}

List<String> _shuffleIncludeItemTypes(String contentType) {
  return switch (_normalizeShuffleContentType(contentType)) {
    'movies' => const ['Movie'],
    'shows' => const ['Series'],
    _ => const ['Movie', 'Series'],
  };
}

int _shuffleRequestLimit(String contentType, int limit) {
  return switch (_normalizeShuffleContentType(contentType)) {
    'movies' => math.max(limit * 2, 8),
    'shows' => math.max(limit * 3, 12),
    _ => math.max(limit * 2, 10),
  };
}

Future<List<AggregatedItem>> _collectRandomItems({
  required MediaServerClient client,
  required String serverId,
  required String contentType,
  required int limit,
  required int requestLimit,
  required int maxAttempts,
  required String fields,
  String? parentId,
  String? genreName,
}) async {
  final collected = <AggregatedItem>[];
  final seenIds = <String>{};

  for (
    var attempt = 0;
    attempt < maxAttempts && collected.length < limit;
    attempt++
  ) {
    final response = await client.itemsApi.getItems(
      includeItemTypes: _shuffleIncludeItemTypes(contentType),
      excludeItemTypes: _kShuffleExcludeItemTypes,
      collapseBoxSetItems: true,
      sortBy: 'Random',
      limit: requestLimit,
      recursive: true,
      parentId: parentId,
      genres: genreName != null ? <String>[genreName] : null,
      fields: fields,
      enableTotalRecordCount: false,
    );

    final items = (response['Items'] as List?) ?? const <dynamic>[];
    if (items.isEmpty) {
      break;
    }

    for (final raw in items.whereType<Map>()) {
      final cast = raw.cast<String, dynamic>();
      final id = cast['Id'] as String?;
      if (id == null || id.isEmpty || seenIds.contains(id)) {
        continue;
      }

      if (_isExcludedShuffleItemType(cast['Type'] as String?)) {
        continue;
      }

      seenIds.add(id);
      collected.add(AggregatedItem(id: id, serverId: serverId, rawData: cast));

      if (collected.length >= limit) {
        break;
      }
    }
  }

  return collected;
}

Future<List<AggregatedItem>> _hydrateShuffleItemsByIds({
  required MediaServerClient client,
  required String serverId,
  required String contentType,
  required List<String> ids,
  required String fields,
}) async {
  if (ids.isEmpty) {
    return const <AggregatedItem>[];
  }

  final response = await client.itemsApi.getItems(
    ids: ids,
    includeItemTypes: _shuffleIncludeItemTypes(contentType),
    excludeItemTypes: _kShuffleExcludeItemTypes,
    fields: fields,
    enableTotalRecordCount: false,
  );

  final items = (response['Items'] as List?) ?? const <dynamic>[];
  final byId = <String, AggregatedItem>{};
  for (final raw in items.whereType<Map>()) {
    final cast = raw.cast<String, dynamic>();
    final id = cast['Id'] as String?;
    if (id == null || id.isEmpty) {
      continue;
    }
    if (_isExcludedShuffleItemType(cast['Type'] as String?)) {
      continue;
    }
    byId[id] = AggregatedItem(id: id, serverId: serverId, rawData: cast);
  }

  final hydrated = <AggregatedItem>[];
  for (final id in ids) {
    final item = byId[id];
    if (item != null) {
      hydrated.add(item);
    }
  }
  return hydrated;
}

bool supportsShuffleLibraryForContentType(
  AggregatedLibrary library,
  String contentType,
) {
  final normalizedContentType = _normalizeShuffleContentType(contentType);
  final collectionType = library.collectionType.trim().toLowerCase();
  final normalizedName = library.name.trim().toLowerCase();

  if ({'books', 'playlists', 'livetv', 'boxsets'}.contains(collectionType)) {
    return false;
  }

  if (normalizedName == 'folders' || normalizedName == 'recordings') {
    return false;
  }

  final isMovieLibrary = collectionType == 'movies';
  final isSeriesLibrary = collectionType == 'tvshows';

  return switch (normalizedContentType) {
    'movies' => isMovieLibrary,
    'shows' => isSeriesLibrary,
    _ => isMovieLibrary || isSeriesLibrary,
  };
}

bool genreMatchesShuffleContent(Map<String, dynamic> item, String contentType) {
  final normalizedContentType = _normalizeShuffleContentType(contentType);
  final movieCount = item['MovieCount'] as int? ?? 0;
  final seriesCount = item['SeriesCount'] as int? ?? 0;
  if (movieCount == 0 && seriesCount == 0) return true;

  return switch (normalizedContentType) {
    'movies' => movieCount > 0,
    'shows' => seriesCount > 0,
    _ => movieCount > 0 || seriesCount > 0,
  };
}

bool _isExcludedShuffleItemType(String? type) {
  final normalized = (type ?? '').trim().toLowerCase();
  return normalized == 'boxset' ||
      normalized == 'collectionfolder' ||
      normalized == 'collection';
}

Future<List<AggregatedLibrary>> fetchShuffleLibraries({
  required String contentType,
}) async {
  final stopwatch = Stopwatch()..start();
  try {
    final viewsRepo = GetIt.instance<UserViewsRepository>();
    final libs = await viewsRepo.getUserViews().timeout(
      _kShuffleUserViewsTimeout,
      onTimeout: () {
        _shuffleLogInfo(
          'fetchShuffleLibraries timeout contentType=$contentType elapsedMs=${stopwatch.elapsedMilliseconds}',
        );
        return const <AggregatedLibrary>[];
      },
    );
    final filtered =
        libs
            .where(
              (library) =>
                  supportsShuffleLibraryForContentType(library, contentType),
            )
            .toList()
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
    _shuffleLogInfo(
      'fetchShuffleLibraries success contentType=$contentType raw=${libs.length} filtered=${filtered.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
    );
    return filtered;
  } catch (error, stackTrace) {
    _shuffleLogError(
      'fetchShuffleLibraries failed contentType=$contentType elapsedMs=${stopwatch.elapsedMilliseconds}',
      error,
      stackTrace,
    );
    return const <AggregatedLibrary>[];
  }
}

Future<List<String>> fetchShuffleGenres({required String contentType}) async {
  final stopwatch = Stopwatch()..start();
  try {
    final client = GetIt.instance<MediaServerClient>();
    final result = await client.itemsApi.getGenres(
      userId: client.userId,
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      recursive: true,
      fields: 'ItemCounts',
      includeItemTypes: _shuffleIncludeItemTypes(contentType),
    );
    final items = (result['Items'] as List?) ?? const <dynamic>[];
    return items
        .whereType<Map>()
        .map((item) => item.cast<String, dynamic>())
        .where((item) => genreMatchesShuffleContent(item, contentType))
        .map((item) => item['Name'] as String? ?? '')
        .where((name) => name.isNotEmpty)
        .toList();
  } catch (error, stackTrace) {
    _shuffleLogError(
      'fetchShuffleGenres failed contentType=$contentType elapsedMs=${stopwatch.elapsedMilliseconds}',
      error,
      stackTrace,
    );
    return const <String>[];
  }
}

Future<List<AggregatedItem>> fetchRandomItems({
  required String contentType,
  String? parentId,
  String? genreName,
  int limit = 1,
  String fields = _kShuffleOverlayItemFields,
}) async {
  final stopwatch = Stopwatch()..start();
  final client = GetIt.instance<MediaServerClient>();
  _shuffleLogInfo(
    'fetchRandomItems start contentType=$contentType parentId=$parentId genre=$genreName limit=$limit',
  );

  if (parentId == null && genreName == null) {
    final libs = await fetchShuffleLibraries(contentType: contentType);
    final shuffledLibraries = List<AggregatedLibrary>.from(libs)..shuffle();
    final collected = <AggregatedItem>[];
    final seenIds = <String>{};
    for (var i = 0; i < shuffledLibraries.length; i++) {
      if (collected.length >= limit) break;
      final library = shuffledLibraries[i];
      final remainingLibraries = shuffledLibraries.length - i;
      final needed = limit - collected.length;
      final targetLimit = (needed / remainingLibraries).ceil();

      try {
        final items = await _fetchRandomItemsScoped(
          client: client,
          contentType: contentType,
          parentId: library.id,
          genreName: null,
          limit: targetLimit,
          fields: fields,
        );
        for (final item in items) {
          if (seenIds.add(item.id) && collected.length < limit) {
            collected.add(item);
          }
        }
      } catch (error, stackTrace) {
        _shuffleLogError(
          'fetchRandomItems random library failed contentType=$contentType libraryId=${library.id} elapsedMs=${stopwatch.elapsedMilliseconds}',
          error,
          stackTrace,
        );
      }
    }
    if (collected.isNotEmpty) {
      collected.shuffle();
      _shuffleLogInfo(
        'fetchRandomItems random success contentType=$contentType count=${collected.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
      );
      return collected;
    }
  }

  final scopedItems = await _fetchRandomItemsScoped(
    client: client,
    contentType: contentType,
    parentId: parentId,
    genreName: genreName,
    limit: limit,
    fields: fields,
  );
  _shuffleLogInfo(
    'fetchRandomItems scoped result contentType=$contentType parentId=$parentId genre=$genreName count=${scopedItems.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
  );
  return scopedItems;
}

Future<List<AggregatedItem>> _fetchRandomItemsScoped({
  required MediaServerClient client,
  required String contentType,
  required int limit,
  required String fields,
  String? parentId,
  String? genreName,
}) async {
  final stopwatch = Stopwatch()..start();
  final serverId = client.baseUrl;

  final requestLimit = _shuffleRequestLimit(contentType, limit);
  const maxAttempts = 2;

  if (_shuffleIdsHydrationUnsupportedServers.contains(serverId)) {
    return _collectRandomItems(
      client: client,
      serverId: serverId,
      contentType: contentType,
      limit: limit,
      requestLimit: requestLimit,
      maxAttempts: maxAttempts,
      fields: fields,
      parentId: parentId,
      genreName: genreName,
    );
  }

  final candidates = await _collectRandomItems(
    client: client,
    serverId: serverId,
    contentType: contentType,
    limit: limit,
    requestLimit: requestLimit,
    maxAttempts: maxAttempts,
    fields: _kShuffleCandidateItemFields,
    parentId: parentId,
    genreName: genreName,
  );

  if (candidates.isEmpty) {
    _shuffleLogInfo(
      '_fetchRandomItemsScoped no candidates contentType=$contentType serverId=$serverId parentId=$parentId genre=$genreName elapsedMs=${stopwatch.elapsedMilliseconds}',
    );
    return const <AggregatedItem>[];
  }

  final candidateIds = candidates
      .map((item) => item.id)
      .toList(growable: false);

  try {
    final hydrated = await _hydrateShuffleItemsByIds(
      client: client,
      serverId: serverId,
      contentType: contentType,
      ids: candidateIds,
      fields: fields,
    ).timeout(_kShuffleHydrationTimeout);
    if (hydrated.isNotEmpty) {
      _shuffleLogInfo(
        '_fetchRandomItemsScoped hydrated success contentType=$contentType serverId=$serverId count=${hydrated.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
      );
      return hydrated;
    }
  } on TimeoutException catch (error, stackTrace) {
    _shuffleLogError(
      '_fetchRandomItemsScoped hydration timeout contentType=$contentType serverId=$serverId ids=${candidateIds.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
      error,
      stackTrace,
    );
  } on DioException catch (e) {
    _shuffleLogError(
      '_fetchRandomItemsScoped hydration dio failure contentType=$contentType serverId=$serverId ids=${candidateIds.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
      e,
      e.stackTrace,
    );
    if (_shouldDisableIdsHydrationForError(e)) {
      _shuffleIdsHydrationUnsupportedServers.add(serverId);
      _shuffleLogInfo(
        '_fetchRandomItemsScoped disabling hydration contentType=$contentType serverId=$serverId statusCode=${e.response?.statusCode}',
      );
    }
  } catch (error, stackTrace) {
    _shuffleLogError(
      '_fetchRandomItemsScoped hydration unknown failure contentType=$contentType serverId=$serverId ids=${candidateIds.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
      error,
      stackTrace,
    );
  }

  final fallbackItems = await _collectRandomItems(
    client: client,
    serverId: serverId,
    contentType: contentType,
    limit: limit,
    requestLimit: requestLimit,
    maxAttempts: maxAttempts,
    fields: fields,
    parentId: parentId,
    genreName: genreName,
  );
  _shuffleLogInfo(
    '_fetchRandomItemsScoped fallback collect contentType=$contentType serverId=$serverId parentId=$parentId genre=$genreName count=${fallbackItems.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
  );
  return fallbackItems;
}
