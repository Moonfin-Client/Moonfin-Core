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
const _kShuffleUnscopedPerLibraryTimeout = Duration(seconds: 8);
const _kShuffleUnscopedOverallTimeout = Duration(seconds: 20);
const _kShuffleUserViewsTimeout = Duration(seconds: 6);
const _kShuffleHydrationTimeout = Duration(seconds: 3);

final _shuffleRandom = math.Random();

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
  if (fields == _kShuffleCandidateItemFields) {
    Future<Map<String, dynamic>> candidateQuery({
      required int queryLimit,
      int? startIndex,
      required bool withCount,
    }) {
      return client.itemsApi.getItems(
        includeItemTypes: _shuffleIncludeItemTypes(contentType),
        excludeItemTypes: _kShuffleExcludeItemTypes,
        collapseBoxSetItems: false,
        recursive: true,
        parentId: parentId,
        genres: genreName != null ? <String>[genreName] : null,
        fields: fields,
        startIndex: startIndex,
        limit: queryLimit,
        enableTotalRecordCount: withCount,
      );
    }

    List<AggregatedItem> parseCandidates(Map<String, dynamic> response) {
      final rawItems = (response['Items'] as List?) ?? const <dynamic>[];
      return rawItems
          .whereType<Map>()
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: serverId,
              rawData: raw.cast<String, dynamic>(),
            ),
          )
          .where((item) => !_isExcludedShuffleItemType(item.type))
          .toList();
    }

    try {
      // Sorting randomly on the server makes SQLite scan the whole library and
      // pulling every row back to shuffle here costs just as much, so read one
      // random window instead.
      final firstPage = await candidateQuery(
        queryLimit: requestLimit,
        withCount: true,
      );
      final total = firstPage['TotalRecordCount'] as int? ?? 0;
      if (total > 0) {
        // A small library fits in that first page, so only go back to the
        // server when there is more of it to reach.
        final items = total <= requestLimit
            ? parseCandidates(firstPage)
            : parseCandidates(
                await candidateQuery(
                  queryLimit: requestLimit,
                  startIndex: _shuffleRandom.nextInt(total - requestLimit + 1),
                  withCount: false,
                ),
              );
        items.shuffle();
        return items.take(limit).toList();
      }
    } catch (e, stack) {
      _shuffleLogError(
        '_collectRandomItems windowed random failed parentId=$parentId',
        e,
        stack,
      );
    }
  }

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
      collapseBoxSetItems: false,
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
      final id = cast['Id']?.toString();
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
    final id = cast['Id']?.toString();
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
    if (libs.isNotEmpty) {
      final unscopedItems = await _collectUnscopedShuffleItems(
        libraries: libs,
        client: client,
        contentType: contentType,
        limit: limit,
        fields: fields,
      );
      if (unscopedItems.isNotEmpty) {
        _shuffleLogInfo(
          'fetchRandomItems unscoped success contentType=$contentType count=${unscopedItems.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
        );
        return unscopedItems;
      }

      final fallbackLibraries = List<AggregatedLibrary>.from(libs)..shuffle();
      if (fallbackLibraries.isNotEmpty) {
        final fallbackLibrary = fallbackLibraries.first;
        try {
          final fallbackItems = await _fetchRandomItemsScoped(
            client: client,
            contentType: contentType,
            parentId: fallbackLibrary.id,
            genreName: null,
            limit: limit,
            fields: fields,
          ).timeout(_kShuffleUnscopedPerLibraryTimeout);
          _shuffleLogInfo(
            'fetchRandomItems fallback-library success contentType=$contentType libraryId=${fallbackLibrary.id} count=${fallbackItems.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
          );
          return fallbackItems;
        } catch (error, stackTrace) {
          _shuffleLogError(
            'fetchRandomItems fallback-library failed contentType=$contentType libraryId=${fallbackLibrary.id} elapsedMs=${stopwatch.elapsedMilliseconds}',
            error,
            stackTrace,
          );
        }
      }
    } else {
      _shuffleLogInfo(
        'fetchRandomItems no eligible libraries contentType=$contentType elapsedMs=${stopwatch.elapsedMilliseconds}',
      );
    }

    _shuffleLogInfo(
      'fetchRandomItems global random produced no items, skipping unscoped server-side random query contentType=$contentType elapsedMs=${stopwatch.elapsedMilliseconds}',
    );
    return const <AggregatedItem>[];
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

Future<List<AggregatedItem>> _collectUnscopedShuffleItems({
  required List<AggregatedLibrary> libraries,
  required MediaServerClient client,
  required String contentType,
  required int limit,
  required String fields,
}) async {
  if (libraries.isEmpty || limit <= 0) {
    return const <AggregatedItem>[];
  }

  final stopwatch = Stopwatch()..start();
  final pool = List<AggregatedLibrary>.from(libraries)..shuffle();

  final allCandidates = <AggregatedItem>[];
  final seenIds = <String>{};
  final deadline = DateTime.now().add(_kShuffleUnscopedOverallTimeout);

  for (final library in pool) {
    // Walking libraries one at a time can outlast the user's patience on a slow
    // server, so stop once the budget is gone and use whatever came back.
    final remaining = deadline.difference(DateTime.now());
    if (remaining <= Duration.zero) {
      break;
    }
    final requestTimeout = remaining < _kShuffleUnscopedPerLibraryTimeout
        ? remaining
        : _kShuffleUnscopedPerLibraryTimeout;

    try {
      final candidates = await _collectRandomItems(
        client: client,
        serverId: client.baseUrl,
        contentType: contentType,
        limit: limit,
        requestLimit: _shuffleRequestLimit(contentType, limit),
        maxAttempts: 1,
        fields: _kShuffleCandidateItemFields,
        parentId: library.id,
      ).timeout(requestTimeout);
      for (final candidate in candidates) {
        if (seenIds.add(candidate.id)) {
          allCandidates.add(candidate);
        }
      }
    } catch (error, stackTrace) {
      _shuffleLogError(
        '_collectUnscopedShuffleItems candidates collection failure contentType=$contentType libraryId=${library.id} requestTimeoutMs=${requestTimeout.inMilliseconds}',
        error,
        stackTrace,
      );
    }
  }

  if (allCandidates.isEmpty) {
    _shuffleLogInfo(
      '_collectUnscopedShuffleItems completed with no candidates elapsedMs=${stopwatch.elapsedMilliseconds}',
    );
    return const <AggregatedItem>[];
  }

  allCandidates.shuffle();
  final selectedCandidates = allCandidates.take(limit).toList();

  try {
    final hydrated = await _hydrateShuffleItemsByIds(
      client: client,
      serverId: client.baseUrl,
      contentType: contentType,
      ids: selectedCandidates.map((c) => c.id).toList(),
      fields: fields,
    ).timeout(_kShuffleHydrationTimeout);

    _shuffleLogInfo(
      '_collectUnscopedShuffleItems complete contentType=$contentType libraries=${libraries.length} requested=$limit result=${hydrated.length} elapsedMs=${stopwatch.elapsedMilliseconds}',
    );
    return hydrated;
  } catch (error, stackTrace) {
    _shuffleLogError(
      '_collectUnscopedShuffleItems hydration failure',
      error,
      stackTrace,
    );
    // The candidates only carry Type, so handing them back would draw blank
    // cards. Returning nothing lets the caller fall back to a scoped fetch that
    // asks for the full fields.
    return const <AggregatedItem>[];
  }
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
