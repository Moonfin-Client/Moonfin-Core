import 'dart:async';

import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';

import '../../auth/models/server.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/store/authentication_store.dart';
import '../../auth/store/credential_store.dart';
import '../models/aggregated_item.dart';
import '../models/aggregated_library.dart';
import '../models/home_row.dart';
import '../services/media_server_client_factory.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/genre_browse_utils.dart';
import '../utils/latest_media_row_normalizer.dart';
import '../utils/playlist_utils.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';

class ServerUserSession {
  final Server server;
  final String userId;
  final MediaServerClient client;

  const ServerUserSession({
    required this.server,
    required this.userId,
    required this.client,
  });
}

class MultiServerRepository {
  final AuthenticationStore _authStore;
  final CredentialStore _credentialStore;
  final MediaServerClientFactory _clientFactory;
  final SessionRepository _sessionRepo;
  final _logger = Logger();

  static const _sessionCacheDuration = Duration(seconds: 5);
  static const _serverTimeout = Duration(seconds: 8);
  static const _fields =
      'Type,UserData,Overview,Genres,CommunityRating,CriticRating,'
      'OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,Status,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag';
  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb';
  static const _imageTypeLimit = 1;
  static const _defaultLimit = 15;
  static const _defaultSortBy = 'SortName';
  static const _defaultSortOrder = 'Ascending';
  static const _genreArtworkConcurrency = 6;

  List<ServerUserSession>? _cachedSessions;
  DateTime _cacheExpiry = DateTime(0);

  MultiServerRepository(
    this._authStore,
    this._credentialStore,
    this._clientFactory,
    this._sessionRepo,
  );

  AppLocalizations get _l10n => currentAppLocalizations();

  ImageApi getImageApiForServer(String serverId) {
    final client = _clientFactory.getClientIfExists(serverId);
    return client?.imageApi ?? _clientFactory.getActiveClient().imageApi;
  }

  Future<List<ServerUserSession>> getLoggedInServers() async {
    if (_cachedSessions != null && DateTime.now().isBefore(_cacheExpiry)) {
      return _cachedSessions!;
    }

    final servers = _authStore.getServers();
    final activeServerId = _sessionRepo.activeServerId;

    final sessions = <ServerUserSession>[];

    for (final server in servers) {
      try {
        final users = _authStore.getUsers(server.id);
        if (users.isEmpty) continue;

        String? userId;
        String? accessToken;

        if (server.id == activeServerId && _sessionRepo.activeUserId != null) {
          final activeUser =
              users.where((u) => u.id == _sessionRepo.activeUserId).firstOrNull;
          if (activeUser != null && activeUser.accessToken.isNotEmpty) {
            userId = activeUser.id;
            accessToken = activeUser.accessToken;
          }
        }

        if (userId == null) {
          final token = await _credentialStore.getToken(server.id);
          for (final user in users) {
            final userToken = token ?? user.accessToken;
            if (userToken.isNotEmpty) {
              userId = user.id;
              accessToken = userToken;
              break;
            }
          }
        }

        if (userId == null || accessToken == null || accessToken.isEmpty) {
          continue;
        }

        final client = _clientFactory.getClient(
          serverId: server.id,
          serverType: server.serverType,
          baseUrl: server.address,
        );
        client.accessToken = accessToken;
        client.userId = userId;

        sessions.add(
          ServerUserSession(server: server, userId: userId, client: client),
        );
      } catch (e) {
        _logger.w('MultiServer: Error checking server ${server.name}: $e');
      }
    }

    _cachedSessions = sessions;
    _cacheExpiry = DateTime.now().add(_sessionCacheDuration);
    return sessions;
  }

  Future<List<AggregatedLibrary>> getAggregatedLibraries() async {
    final sessions = await getLoggedInServers();
    final hasMultiple = sessions.length > 1;

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.userViewsApi.getUserViews();
          final items = response['Items'] as List? ?? [];
          return items.map((item) {
            final data = item as Map<String, dynamic>;
            final name = data['Name'] as String? ?? '';
            return AggregatedLibrary(
              id: data['Id'] as String,
              name: hasMultiple
                  ? _l10n.libraryNameWithServer(name, session.server.name)
                  : name,
              collectionType: data['CollectionType'] as String? ?? '',
              serverId: session.server.id,
            );
          }).toList();
        }, label: 'libraries from ${session.server.name}'),
      ),
    );

    return results.expand((e) => e).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<HomeRow> getAggregatedResume({int limit = _defaultLimit}) async {
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getResumeItems(
            includeItemTypes: ['Movie', 'Episode'],
            limit: perServer,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          );
          return _parseItems(response, session.server.id);
        }, label: 'resume from ${session.server.name}'),
      ),
    );

    final all = results.expand((e) => e).toList()..sort(_compareByLastPlayed);

    return HomeRow(
      id: 'resume',
      title: _l10n.continueWatching,
      items: all.take(limit).toList(),
      rowType: HomeRowType.resume,
    );
  }

  Future<HomeRow> getAggregatedResumeAudio({int limit = _defaultLimit}) async {
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getResumeItems(
            includeItemTypes: ['Audio'],
            limit: perServer,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          );
          return _parseItems(response, session.server.id);
        }, label: 'resume audio from ${session.server.name}'),
      ),
    );

    final all = results.expand((e) => e).toList()..sort(_compareByLastPlayed);

    return HomeRow(
      id: 'resumeAudio',
      title: _l10n.continueListening,
      items: all.take(limit).toList(),
      rowType: HomeRowType.resumeAudio,
    );
  }

  Future<HomeRow> getAggregatedNextUp({int limit = _defaultLimit}) async {
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getNextUp(
            limit: perServer,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
            enableResumable: false,
          );
          return _parseItems(response, session.server.id);
        }, label: 'next up from ${session.server.name}'),
      ),
    );

    final all = results.expand((e) => e).toList()..sort(_compareByLastPlayed);

    return HomeRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      items: all.take(limit).toList(),
      rowType: HomeRowType.nextUp,
    );
  }

  Future<HomeRow> getAggregatedPlaylists({int limit = _defaultLimit}) async {
    final sessions = await getLoggedInServers();

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getItems(
            includeItemTypes: ['Playlist'],
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: true,
            limit: limit,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          );
          return filterBrowsablePlaylists(
            session.client,
            _parseItems(response, session.server.id),
          );
        }, label: 'playlists from ${session.server.name}'),
      ),
    );

    final all = results.expand((e) => e).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return HomeRow(
      id: 'playlists',
      title: _l10n.playlists,
      items: all.take(limit).toList(),
      rowType: HomeRowType.playlists,
    );
  }

  Future<HomeRow> getAggregatedFavorites({
    required String rowId,
    required String title,
    List<String>? includeItemTypes,
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    return _getAggregatedSortedItemsRow(
      id: rowId,
      title: title,
      rowType: HomeRowType.favorites,
      includeItemTypes: includeItemTypes,
      isFavorite: true,
      limit: limit,
      logPrefix: 'favorites',
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  Future<HomeRow> getAggregatedCollections({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    return _getAggregatedSortedItemsRow(
      id: 'collections',
      title: _l10n.collections,
      rowType: HomeRowType.collections,
      includeItemTypes: const ['BoxSet'],
      limit: limit,
      logPrefix: 'collections',
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  Future<HomeRow> getAggregatedGenres({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
  }) async {
    final browseItemTypes = normalizeBrowsableGenreItemTypes(includeItemTypes);
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getGenres(
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            limit: perServer,
            fields: 'ItemCounts',
            includeItemTypes: browseItemTypes,
          );
          return _buildBrowsableGenresForSession(
            session,
            response,
            includeItemTypes: browseItemTypes,
          );
        }, label: 'genres from ${session.server.name}'),
      ),
    );

    final all = _sortAggregatedItems(
      results.expand((e) => e).toList(growable: false),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    return HomeRow(
      id: 'genres',
      title: _l10n.genres,
      items: all.take(limit).toList(),
      rowType: HomeRowType.genres,
    );
  }

  Future<HomeRow> _getAggregatedSortedItemsRow({
    required String id,
    required String title,
    required HomeRowType rowType,
    required String logPrefix,
    List<String>? includeItemTypes,
    bool? isFavorite,
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getItems(
            includeItemTypes: includeItemTypes,
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            limit: perServer,
            isFavorite: isFavorite,
            fields: _fields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          );
          return _parseItems(response, session.server.id);
        }, label: '$logPrefix from ${session.server.name}'),
      ),
    );

    final all = _sortAggregatedItems(
      results.expand((e) => e).toList(growable: false),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    return HomeRow(
      id: id,
      title: title,
      items: all.take(limit).toList(),
      rowType: rowType,
    );
  }

  Future<HomeRow> getAggregatedLibraryTiles({
    HomeRowType rowType = HomeRowType.libraryTiles,
  }) async {
    final libraries = await getAggregatedLibraries();
    final items =
        libraries
            .map(
              (lib) => AggregatedItem(
                id: lib.id,
                serverId: lib.serverId,
                rawData: {
                  'Id': lib.id,
                  'Name': lib.name,
                  'CollectionType': lib.collectionType,
                  'Type': 'CollectionFolder',
                },
              ),
            )
            .toList();

    return HomeRow(
      id:
          rowType == HomeRowType.libraryTilesSmall
              ? 'libraryTilesSmall'
              : 'libraryTiles',
      title: _l10n.myMedia,
      items: items,
      rowType: rowType,
    );
  }

  Future<List<HomeRow>> getAggregatedLatestMediaRows() async {
    final sessions = await getLoggedInServers();
    final hasMultiple = sessions.length > 1;
    final rows = <HomeRow>[];

    for (final session in sessions) {
      try {
        final viewsResponse = await _withTimeout(
          () => session.client.userViewsApi.getUserViews(),
          label: 'views from ${session.server.name}',
        );
        final views = viewsResponse['Items'] as List? ?? [];

        Set<String> latestExcludes = const {};
        try {
          final config = await session.client.usersApi.getUserConfiguration();
          latestExcludes = config.latestItemsExcludes.toSet();
        } catch (_) {}

        for (final view in views) {
          final data = view as Map<String, dynamic>;
          final id = data['Id'] as String;
          final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
          if (collectionType == 'music' ||
              collectionType == 'books' ||
              collectionType == 'playlists' ||
              collectionType == 'boxsets' ||
              collectionType == 'livetv') {
            continue;
          }
          if (latestExcludes.contains(id)) continue;

          final name = data['Name'] as String? ?? '';
          final displayName =
              hasMultiple ? '$name (${session.server.name})' : name;
          final fetchLimit = latestMediaFetchLimitForCollection(
            collectionType,
            defaultLimit: _defaultLimit,
            maxLimit: 100,
          );

          try {
            final latestResponse = await _withTimeout(
              () => session.client.itemsApi.getLatestItems(
                parentId: id,
                limit: fetchLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              ),
              label: 'latest $name from ${session.server.name}',
            );

            final items = normalizeLatestMediaItems(
              _parseItems(latestResponse, session.server.id),
              collectionType: collectionType,
              limit: _defaultLimit,
            );
            if (items.isNotEmpty) {
              rows.add(
                HomeRow(
                  id: 'latest_${session.server.id}_$id',
                  title: _l10n.latestLibraryName(displayName),
                  items: items,
                  rowType: HomeRowType.latestMedia,
                ),
              );
            }
          } catch (e) {
            _logger.w('MultiServer: Failed to load latest for $name: $e');
          }
        }
      } catch (e) {
        _logger.w(
          'MultiServer: Failed to load views from ${session.server.name}: $e',
        );
      }
    }

    return rows;
  }

  Future<T> _withTimeout<T>(
    Future<T> Function() fn, {
    required String label,
  }) async {
    try {
      return await fn().timeout(_serverTimeout);
    } on TimeoutException {
      _logger.w('MultiServer: Timeout $label');
      rethrow;
    }
  }

  Future<List<AggregatedItem>> _buildBrowsableGenresForSession(
    ServerUserSession session,
    Map<String, dynamic> response, {
    required List<String> includeItemTypes,
  }) async {
    final rawItems = response['Items'] as List? ?? const [];
    final genres = rawItems
        .whereType<Map>()
        .map((item) => item.cast<String, dynamic>())
        .where(
          (genre) =>
              browsableGenreCount(
                genre,
                normalizedItemTypes: includeItemTypes,
              ) >
              0,
        )
        .toList(growable: false);

    if (genres.isEmpty) {
      return const [];
    }

    final resolved = await mapBounded(
      genres,
      _genreArtworkConcurrency,
      (genre) => _enrichSingleGenreForBrowse(
        session,
        genre,
        includeItemTypes: includeItemTypes,
      ),
    );

    return resolved.whereType<AggregatedItem>().toList();
  }

  Future<AggregatedItem?> _enrichSingleGenreForBrowse(
    ServerUserSession session,
    Map<String, dynamic> genreData, {
    required List<String> includeItemTypes,
  }) async {
    final genreId = genreData['Id'] as String?;
    if (genreId == null || genreId.isEmpty) {
      return null;
    }

    try {
      final response = await session.client.itemsApi.getItems(
        genreIds: [genreId],
        includeItemTypes: includeItemTypes,
        excludeItemTypes: const ['Episode'],
        sortBy: _defaultSortBy,
        sortOrder: _defaultSortOrder,
        recursive: true,
        limit: 1,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );

      final items = (response['Items'] as List?) ?? const [];
      if (items.isEmpty) {
        return null;
      }

      final representative = items.first;
      if (representative is! Map) {
        return null;
      }

      final rawTotalCount = response['TotalRecordCount'];
      final totalCount = rawTotalCount is num
          ? rawTotalCount.toInt()
          : browsableGenreCount(
            genreData,
            normalizedItemTypes: includeItemTypes,
          );
      if (totalCount <= 0) {
        return null;
      }

      final merged = mergeGenreWithRepresentativeItem(
        genreData: genreData,
        representativeItem: representative.cast<String, dynamic>(),
        itemCount: totalCount,
      );
      return AggregatedItem(
        id: merged['Id'] as String,
        serverId: session.server.id,
        rawData: merged,
      );
    } catch (_) {
      return null;
    }
  }

  List<AggregatedItem> _parseItems(
    Map<String, dynamic> response,
    String serverId,
  ) {
    final rawItems = response['Items'] as List? ?? [];
    return rawItems.map((item) {
      final data = item as Map<String, dynamic>;
      return AggregatedItem(
        id: data['Id'] as String,
        serverId: serverId,
        rawData: data,
      );
    }).toList();
  }

  List<AggregatedItem> _sortAggregatedItems(
    List<AggregatedItem> items, {
    required String sortBy,
    required String sortOrder,
  }) {
    final sorted = List<AggregatedItem>.of(items);
    if (sortBy == 'Random') {
      sorted.shuffle();
      return sorted;
    }

    int compare(AggregatedItem a, AggregatedItem b) {
      switch (sortBy) {
        case 'DateCreated':
          return _compareNullableDate(
            _parseDateCreated(a.rawData['DateCreated']),
            _parseDateCreated(b.rawData['DateCreated']),
          );
        case 'PremiereDate':
          return _compareNullableDate(a.premiereDate, b.premiereDate);
        case 'CommunityRating':
          return _compareNullableNum(a.communityRating, b.communityRating);
        case 'CriticRating':
          return _compareNullableNum(
            a.criticRating?.toDouble(),
            b.criticRating?.toDouble(),
          );
        case 'Runtime':
        case 'RunTimeTicks':
          return _compareNullableNum(
            a.runTimeTicks?.toDouble(),
            b.runTimeTicks?.toDouble(),
          );
        case 'ProductionYear':
          return _compareNullableNum(
            a.productionYear?.toDouble(),
            b.productionYear?.toDouble(),
          );
        default:
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }
    }

    sorted.sort(compare);
    if (sortOrder.toLowerCase() == 'descending') {
      return sorted.reversed.toList(growable: false);
    }
    return sorted;
  }

  static DateTime? _parseDateCreated(dynamic value) {
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  static int _compareNullableDate(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.compareTo(b);
  }

  static int _compareNullableNum(double? a, double? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.compareTo(b);
  }

  static int _compareByLastPlayed(AggregatedItem a, AggregatedItem b) {
    final aDate = a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
    final bDate = b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
    return bDate.compareTo(aDate);
  }
}
