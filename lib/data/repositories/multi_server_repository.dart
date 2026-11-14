import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';

import '../../auth/models/server.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/models/user.dart';
import '../../auth/services/silo_household.dart';
import '../../auth/services/silo_token_storage.dart';
import '../../auth/store/authentication_store.dart';
import '../../auth/store/credential_store.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/aggregated_library.dart';
import '../models/home_row.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../services/media_server_client_factory.dart';
import '../services/unified_catalog_query.dart';
import '../services/unified_catalog_service.dart';
import '../services/unified_search_fold.dart';
import '../utils/blocked_ratings.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/genre_browse_utils.dart';
import '../utils/latest_media_row_normalizer.dart';
import '../utils/next_up_cutoff.dart';
import '../utils/next_up_enrichment.dart';
import '../utils/playlist_utils.dart';
import 'search_repository.dart';
import 'user_views_repository.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';

/// One library's latest items. [row] is null when rows are merged by type.
typedef _LatestForView = ({
  String collectionType,
  List<AggregatedItem> items,
  HomeRow? row,
});

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
      'DateCreated,Type,UserData,Overview,Genres,CommunityRating,CriticRating,'
      'OfficialRating,RunTimeTicks,ProductionYear,SeriesName,'
      'ParentIndexNumber,IndexNumber,Status,ImageTags,BackdropImageTags,'
      'ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,'
      'ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,'
      'ParentLogoItemId,ParentLogoImageTag,PrimaryImageTag,PrimaryImageAspectRatio';
  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb,Banner,Logo';
  static const _imageTypeLimit = 1;
  static const _defaultLimit = 15;
  static const _maxItems = 100;
  static const _defaultSortBy = 'SortName';
  static const _defaultSortOrder = 'Ascending';
  static const _studioPageSize = 200;
  static const _genreArtworkConcurrency = 6;
  // Three servers times three libraries: at most nine item requests at a
  // time, a load a TV can handle.
  static const _latestServerConcurrency = 3;
  static const _latestLibraryConcurrency = 3;
  // ProviderIds are what a merged Latest row folds a shared title by.
  static const _latestFieldsWithProviderIds = '$_fields,ProviderIds';

  List<ServerUserSession>? _cachedSessions;
  DateTime _cacheExpiry = DateTime(0);
  final Map<String, int> _rowOffsets = {};
  final Map<String, int> _rowTotals = {};
  // Playlists a server returned on the first page that didn't make the cut
  // for the merged row. Loading more adds them back.
  final Map<String, List<AggregatedItem>> _rowHeldBack = {};
  // Bumped when the offsets are cleared, so a load more still running from
  // before a refresh can't change the refreshed rows' paging.
  int _pagingGeneration = 0;

  void clearOffsets() {
    _pagingGeneration++;
    _rowOffsets.clear();
    _rowTotals.clear();
    _rowHeldBack.clear();
  }

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
    final siloTokens = SiloTokenStorage(_authStore);

    for (final server in servers) {
      try {
        final users = _authStore.getUsers(server.id);
        if (users.isEmpty) continue;

        String? userId;
        String? accessToken;
        PrivateUser? chosenUser;

        if (server.id == activeServerId && _sessionRepo.activeUserId != null) {
          final activeUser = users
              .where((u) => u.id == _sessionRepo.activeUserId)
              .firstOrNull;
          if (activeUser != null && activeUser.accessToken.isNotEmpty) {
            userId = activeUser.id;
            accessToken = activeUser.accessToken;
            chosenUser = activeUser;
          }
        }

        if (userId == null) {
          final token = await _credentialStore.getToken(server.id);
          // Another Silo server: its most recently used profile that needs
          // no PIN now, not whichever profile was stored first.
          final candidates = server.serverType == ServerType.silo
              ? [
                  ?SiloHousehold.profileForOtherServer(users, siloTokens),
                ]
              : users;
          for (final user in candidates) {
            final userToken = token ?? user.accessToken;
            if (userToken.isNotEmpty) {
              userId = user.id;
              accessToken = userToken;
              chosenUser = user;
              break;
            }
          }
        }

        if (userId == null ||
            chosenUser == null ||
            accessToken == null ||
            accessToken.isEmpty) {
          continue;
        }

        final client = _clientFactory.getClient(
          serverId: server.id,
          serverType: server.serverType,
          baseUrl: server.address,
        );
        // A Silo profile restores its account's pair and profile. Setting the
        // stored access token would drop the active session's refresh token.
        siloTokens.putLogin(
          client: client,
          user: chosenUser,
          accessToken: accessToken,
        );
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

  // Concurrent callers share one in-flight aggregation instead of each
  // fanning out to every server.
  Future<List<AggregatedLibrary>>? _inFlightLibraries;

  Future<List<AggregatedLibrary>> getAggregatedLibraries() =>
      _inFlightLibraries ??= _getAggregatedLibrariesNow().whenComplete(
        () => _inFlightLibraries = null,
      );

  Future<List<AggregatedLibrary>> _getAggregatedLibrariesNow() async {
    final sessions = await getLoggedInServers();
    final hasMultiple = sessions.length > 1;

    // One server down or slow costs its own tiles, not everyone's.
    final answers = await Future.wait(
      sessions.map(
        (session) => _librariesOf(session, hasMultiple: hasMultiple),
      ),
    );
    if (sessions.isNotEmpty && answers.every((answer) => answer == null)) {
      throw StateError('MultiServer: all servers failed to load libraries');
    }

    final libraries = [for (final answer in answers) ...?answer];
    if (!_effectiveMergeLibrariesByType) return libraries;
    // Offline, each tile opens its own library from the downloads catalog.
    // A merged tile opens the merged catalog, which holds no downloads.
    if (shouldUseOfflineCatalog()) return libraries;
    return _mergeLibrariesByType(
      libraries,
      sessions,
      unanswered: [
        for (final (index, session) in sessions.indexed)
          if (answers[index] == null) session,
      ],
    );
  }

  Future<List<AggregatedLibrary>?> _librariesOf(
    ServerUserSession session, {
    required bool hasMultiple,
  }) async {
    try {
      final response = await _withTimeout(
        () => loadVisibleUserViews(session.client),
        label: 'libraries from ${session.server.name}',
      );
      final items = response['Items'] as List? ?? [];

      return items.map((item) {
        final data = item as Map<String, dynamic>;
        final name = data['Name'] as String? ?? '';
        return AggregatedLibrary(
          id: data['Id']?.toString() ?? '',
          name: hasMultiple
              ? _l10n.libraryNameWithServer(name, session.server.name)
              : name,
          collectionType: data['CollectionType'] as String? ?? '',
          serverId: session.server.id,
          primaryImageAspectRatio: (data['PrimaryImageAspectRatio'] as num?)
              ?.toDouble(),
          imageTags: data['ImageTags'] != null
              ? Map<String, dynamic>.from(data['ImageTags'] as Map)
              : null,
          backdropImageTags: (data['BackdropImageTags'] as List?)
              ?.map((e) => e.toString())
              .toList(),
        );
      }).toList();
    } catch (e) {
      _logger.w(
        'MultiServer: Failed to load libraries from ${session.server.name}: $e',
      );
      return null;
    }
  }

  /// Folds every server's movie libraries into one tile, and likewise series.
  /// A server in [unanswered] still counts for the types the catalog already
  /// holds of it, so its titles stay within reach while it is down.
  Future<List<AggregatedLibrary>> _mergeLibrariesByType(
    List<AggregatedLibrary> libraries,
    List<ServerUserSession> sessions, {
    required List<ServerUserSession> unanswered,
  }) async {
    final mergeableServerIds = _idsOf(sessionsIfMergeable(sessions));
    if (mergeableServerIds.isEmpty) return libraries;

    final librariesByKind = <UnifiedLibraryKind, List<AggregatedLibrary>>{
      for (final kind in UnifiedLibraryKind.values) kind: [],
    };
    for (final library in libraries) {
      if (!mergeableServerIds.contains(library.serverId)) continue;
      final kind = UnifiedLibraryKind.fromCollectionType(
        library.collectionType,
      );
      if (kind != null) librariesByKind[kind]!.add(library);
    }

    final catalog = GetIt.instance.isRegistered<UnifiedCatalogService>()
        ? GetIt.instance<UnifiedCatalogService>()
        : null;
    final unansweredMergeable = [
      for (final session in unanswered)
        if (mergeableServerIds.contains(session.server.id)) session,
    ];
    final kindsInCatalog = await _kindsHeldByCatalog(
      catalog,
      unansweredMergeable,
    );

    final mergedKinds = <UnifiedLibraryKind>{
      for (final kind in UnifiedLibraryKind.values)
        if (librariesByKind[kind]!
                    .map((library) => library.serverId)
                    .toSet()
                    .length >
                1 ||
            kindsInCatalog.contains(kind))
          kind,
    };
    if (mergedKinds.isEmpty) return libraries;

    // Cheap to repeat: the catalog skips servers it already brought up to date.
    if (catalog != null) unawaited(catalog.syncOnLaunch());

    String nameOf(UnifiedLibraryKind kind) =>
        kind == UnifiedLibraryKind.movies ? _l10n.movies : _l10n.tvShows;

    // The merged tile takes the place of the first library it replaces; the
    // other libraries of that kind are dropped.
    final placedKinds = <UnifiedLibraryKind>{};
    final result = <AggregatedLibrary>[];
    for (final library in libraries) {
      final kind = UnifiedLibraryKind.fromCollectionType(
        library.collectionType,
      );
      if (kind == null ||
          !mergedKinds.contains(kind) ||
          !mergeableServerIds.contains(library.serverId)) {
        result.add(library);
      } else if (placedKinds.add(kind)) {
        result.add(
          AggregatedLibrary.merged(
            name: nameOf(kind),
            unifiedKindName: kind.name,
            libraries: librariesByKind[kind]!,
          ),
        );
      }
    }
    // A kind only the catalog knows, because every server holding it failed
    // to answer: there is no live library to build the tile from, so it gets
    // a bare tile attributed to the first of those servers.
    for (final kind in mergedKinds.difference(placedKinds)) {
      result.add(
        AggregatedLibrary(
          id: 'unified_${kind.name}',
          name: nameOf(kind),
          collectionType: kind.collectionType,
          serverId: unansweredMergeable.first.server.id,
          unifiedKindName: kind.name,
        ),
      );
    }
    return result;
  }

  Future<Set<UnifiedLibraryKind>> _kindsHeldByCatalog(
    UnifiedCatalogService? catalog,
    List<ServerUserSession> unansweredMergeable,
  ) async {
    if (catalog == null || unansweredMergeable.isEmpty) return const {};
    try {
      final kindsPerServer = await Future.wait([
        for (final session in unansweredMergeable)
          catalog.kindsHeldBy(session.server.id),
      ]).timeout(_serverTimeout);
      return {for (final kinds in kindsPerServer) ...kinds};
    } catch (e) {
      _logger.w('MultiServer: Merged catalog not read: $e');
      return const {};
    }
  }

  Future<HomeRow> getAggregatedResume({int limit = _defaultLimit}) async {
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final results = await _gatherPerServer(
      sessions,
      (session) async {
        final response = await session.client.itemsApi.getResumeItems(
          mediaTypes: 'Video',
          limit: perServer,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
        return _parseItems(response, session.server.id);
      },
      label: 'resume',
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

    final results = await _gatherPerServer(
      sessions,
      (session) async {
        final response = await session.client.itemsApi.getResumeItems(
          mediaTypes: 'Audio',
          limit: perServer,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        );
        return _parseItems(response, session.server.id);
      },
      label: 'resume audio',
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

    final results = await _gatherPerServer(
      sessions,
      (session) async {
        final request = session.client.itemsApi.getNextUp(
          limit: perServer,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
          enableResumable: false,
          nextUpDateCutoff: nextUpDateCutoff,
        );
        final recentlyPlayed = fetchSeriesLastPlayed(session.client);
        final response = await request;
        final parsed = _parseItems(response, session.server.id);
        return await _enrichNextUpItemsWithSeriesLastPlayed(
          parsed,
          session.client,
          recentlyPlayed,
        );
      },
      label: 'next up',
    );

    final all = results.expand((e) => e).toList()..sort(_compareByLastPlayed);

    return HomeRow(
      id: 'nextUp',
      title: _l10n.nextUp,
      items: all.take(limit).toList(),
      rowType: HomeRowType.nextUp,
    );
  }

  Future<HomeRow> getAggregatedPlaylists({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    String? mediaType,
  }) async {
    final sessions = await getLoggedInServers();
    final isAudio = mediaType == 'Audio';
    final cacheKeyPrefix = isAudio ? 'audioPlaylists' : 'playlists';

    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final response = await session.client.itemsApi.getItems(
            includeItemTypes: const ['Playlist'],
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            limit: limit,
            fields: '$_fields,ChildCount,RecursiveItemCount',
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
          );
          final playlistsOnly = _parseItems(response, session.server.id)
              .where((item) => item.type == 'Playlist')
              .toList();
          final items = await filterBrowsablePlaylists(
            session.client,
            playlistsOnly,
            mediaType: mediaType,
          );
          _rowTotals['${cacheKeyPrefix}_${session.server.id}'] =
              response['TotalRecordCount'] as int? ?? items.length;
          return items;
        }, label: '$cacheKeyPrefix from ${session.server.name}'),
      ),
    );

    var all = results.expand((e) => e).toList();
    if (sortBy == 'SortName') {
      if (sortOrder == 'Ascending') {
        all.sort((a, b) => a.name.compareTo(b.name));
      } else {
        all.sort((a, b) => b.name.compareTo(a.name));
      }
    } else {
      all = _sortAggregatedItems(all, sortBy: sortBy, sortOrder: sortOrder);
    }

    final takenItems = all.take(limit).toList();
    // The merged row keeps only [limit] of all the servers' first pages, so
    // hold the rest back for loading more, which starts past those pages.
    final taken = {
      for (final item in takenItems) '${item.serverId}_${item.id}',
    };
    for (var i = 0; i < sessions.length; i++) {
      final cacheKey = '${cacheKeyPrefix}_${sessions[i].server.id}';
      final heldBack = results[i]
          .where((item) => !taken.contains('${item.serverId}_${item.id}'))
          .toList();
      _rowOffsets[cacheKey] = limit;
      if (heldBack.isEmpty) {
        _rowHeldBack.remove(cacheKey);
      } else {
        _rowHeldBack[cacheKey] = heldBack;
      }
    }
    final totalCount = sessions.fold<int>(0, (sum, session) {
      return sum + (_rowTotals['${cacheKeyPrefix}_${session.server.id}'] ?? 0);
    });

    return HomeRow(
      id: cacheKeyPrefix,
      title: isAudio ? _l10n.audioPlaylists : _l10n.playlists,
      items: takenItems,
      rowType: isAudio ? HomeRowType.audioPlaylists : HomeRowType.playlists,
      totalCount: totalCount,
      isAudio: isAudio,
    );
  }

  Future<HomeRow> getAggregatedAudioArtists({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final row = await _getAggregatedSortedItemsRow(
      id: 'audioArtists',
      title: _l10n.artists,
      rowType: HomeRowType.audioArtists,
      includeItemTypes: const ['MusicArtist'],
      limit: limit,
      logPrefix: 'audioArtists',
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    return row.copyWith(isAudio: true);
  }

  Future<HomeRow> getAggregatedAudioAlbums({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    final row = await _getAggregatedSortedItemsRow(
      id: 'audioAlbums',
      title: _l10n.albums,
      rowType: HomeRowType.audioAlbums,
      includeItemTypes: const ['MusicAlbum'],
      limit: limit,
      logPrefix: 'audioAlbums',
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    return row.copyWith(isAudio: true);
  }

  Future<HomeRow> getAggregatedAudioPlaylists({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
  }) async {
    return getAggregatedPlaylists(
      limit: limit,
      sortBy: sortBy,
      sortOrder: sortOrder,
      mediaType: 'Audio',
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

  static bool get _effectiveMergeLibrariesByType =>
      GetIt.instance.isRegistered<UserPreferences>() &&
      GetIt.instance<UserPreferences>().effectiveMergeLibrariesByType;

  /// Returns [sessions] when there are at least [minServers] of them,
  /// otherwise an empty list; every server type takes part.
  static List<ServerUserSession> sessionsIfMergeable(
    Iterable<ServerUserSession> sessions, {
    int minServers = 2,
  }) {
    final mergeableSessions = sessions.toList();
    return mergeableSessions.length < minServers
        ? const []
        : mergeableSessions;
  }

  static Set<String> _idsOf(Iterable<ServerUserSession> sessions) => {
    for (final session in sessions) session.server.id,
  };

  /// The servers whose libraries, and so genres, are merged right now; empty
  /// with the setting off, offline, or fewer than two servers.
  Future<Set<String>> mergedGenreServerIds() async {
    if (!_effectiveMergeLibrariesByType || shouldUseOfflineCatalog()) {
      return const {};
    }
    return _idsOf(sessionsIfMergeable(await getLoggedInServers()));
  }

  Future<HomeRow> getAggregatedGenres({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    List<String>? includeItemTypes,
  }) async {
    const cacheKeyPrefix = 'genres';
    const rowType = HomeRowType.genres;

    final browseItemTypes = normalizeBrowsableGenreItemTypes(includeItemTypes);
    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);
    final readCountByServer = <String, int>{};

    final results = await _gatherPerServer(sessions, (session) async {
      final response = await session.client.itemsApi.getGenres(
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: true,
        limit: perServer,
        fields: 'ItemCounts,PrimaryImageAspectRatio',
        includeItemTypes: browseItemTypes,
      );
      // No server can put more than [limit] genres into the row, and each one
      // costs a request for its artwork, so a big library would otherwise run
      // past the per-server timeout.
      final items = await _buildBrowsableGenresForSession(
        session,
        response,
        includeItemTypes: browseItemTypes,
        maxGenres: limit,
      );
      _rowTotals['${cacheKeyPrefix}_${session.server.id}'] =
          response['TotalRecordCount'] as int? ?? items.length;
      // Only [limit] genres were looked at when the server had more to offer,
      // however many of those turned out to be empty.
      readCountByServer['${cacheKeyPrefix}_${session.server.id}'] =
          _browsableGenresIn(response, browseItemTypes).length > limit
          ? limit
          : (response['Items'] as List? ?? const []).length;
      return items;
    }, label: cacheKeyPrefix);

    final mergedServerIds = await mergedGenreServerIds();
    final all = _sortAggregatedItems(
      foldGenresByName(
        results.expand((e) => e).toList(growable: false),
        mergedServerIds,
      ),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    final takenItems = all.take(limit).toList();
    final int totalCount;
    if (mergedServerIds.isEmpty) {
      totalCount = sessions.fold<int>(0, (sum, session) {
        return sum +
            (_rowTotals['${cacheKeyPrefix}_${session.server.id}'] ?? 0);
      });
    } else {
      // A folded-away tile no longer says how far its server was read.
      for (final (index, session) in sessions.indexed) {
        if (mergedServerIds.contains(session.server.id)) {
          _rowOffsets['${cacheKeyPrefix}_${session.server.id}'] =
              results[index].length;
        }
      }
      // Loading more starts past the pages read here, so the tiles that did
      // not fit the row are held back for it rather than read again.
      for (final session in sessions) {
        _rowHeldBack.remove('${cacheKeyPrefix}_${session.server.id}');
      }
      for (final item in all.skip(limit)) {
        (_rowHeldBack['${cacheKeyPrefix}_${item.serverId}'] ??= []).add(item);
      }
      // An upper bound: a genre not read yet may fold into a tile, so the
      // total comes down as pages load and is exact once every server is read.
      totalCount =
          all.length +
          _unreadCountOf(sessions, cacheKeyPrefix, readCountByServer);
    }

    return HomeRow(
      id: cacheKeyPrefix,
      title: _l10n.genres,
      items: takenItems,
      rowType: rowType,
      totalCount: totalCount,
    );
  }

  Future<HomeRow> getAggregatedStudios({
    int limit = _defaultLimit,
    String sortBy = _defaultSortBy,
    String sortOrder = _defaultSortOrder,
    String selectedIds = '',
    String? title,
  }) async {
    const cacheKeyPrefix = 'studios';
    const rowType = HomeRowType.studios;

    final sessions = await getLoggedInServers();
    final perServer = (limit * 3).clamp(1, 100);

    final selectedSet = selectedIds
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toSet();

    final results = await _gatherPerServer(sessions, (session) async {
      Future<Map<String, dynamic>> fetchPage(int startIndex, int limit) =>
          session.client.itemsApi.getStudios(
            userId: session.client.userId,
            sortBy: sortBy,
            sortOrder: sortOrder,
            recursive: true,
            startIndex: startIndex,
            limit: limit,
            fields: 'ItemCounts,PrimaryImageAspectRatio',
          );

      if (selectedSet.isEmpty) {
        final response = await fetchPage(0, perServer);
        return _parseItems(response, session.server.id);
      }
      return _collectStudios(selectedSet, session.server.id, fetchPage);
    }, label: cacheKeyPrefix);

    final all = _sortAggregatedItems(
      results.expand((e) => e).toList(growable: false),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    // The row arrives complete either way, so the count has to match what it
    // holds or it will claim a next page that no one can serve.
    final items = selectedSet.isEmpty ? all.take(limit).toList() : all;

    return HomeRow(
      id: cacheKeyPrefix,
      title: title ?? _l10n.studios,
      items: items,
      rowType: rowType,
      totalCount: items.length,
    );
  }

  /// Walks one server's studio list a page at a time until every id in
  /// [wanted] has turned up.
  ///
  /// The endpoint has no way to ask for particular studios and a library can
  /// report well over a thousand of them, so reading the lot to keep a handful
  /// is a heavy call to make on every home load, once per server. Stopping once
  /// the selection is accounted for usually means one page.
  Future<List<AggregatedItem>> _collectStudios(
    Set<String> wanted,
    String serverId,
    Future<Map<String, dynamic>> Function(int startIndex, int limit) fetchPage,
  ) async {
    final outstanding = wanted.toSet();
    final found = <AggregatedItem>[];
    var startIndex = 0;

    while (outstanding.isNotEmpty) {
      final response = await fetchPage(startIndex, _studioPageSize);
      // Paging walks the server's own count. A page that comes back short
      // because items were filtered out of it is still a full page as far as
      // the next offset is concerned.
      final rawCount = (response['Items'] as List?)?.length ?? 0;
      if (rawCount == 0) break;
      for (final studio in _parseItems(response, serverId)) {
        if (outstanding.remove(studio.id)) found.add(studio);
      }
      if (rawCount < _studioPageSize) break;
      startIndex += _studioPageSize;
    }

    return found;
  }

  Future<(List<AggregatedItem>, int)> loadMore({required HomeRow row}) async {
    if (!row.hasMore || row.items.length >= _maxItems) {
      return (row.items, row.items.length);
    }

    final generation = _pagingGeneration;
    final prefs = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>()
        : null;
    final sessions = await getLoggedInServers();

    // Group existing items by serverId to know how many items we already have for each server
    final Map<String, List<AggregatedItem>> itemsByServer = {};
    for (final item in row.items) {
      itemsByServer.putIfAbsent(item.serverId, () => []).add(item);
    }

    final nextOffsets = <String, int>{};
    // A server that can't be asked is left where it was, to be asked again by
    // the next page, rather than failing the page the others answered.
    final failedServerIds = <String>{};
    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(() async {
          final serverId = session.server.id;
          final cacheKey = '${row.id}_$serverId';
          final existingCount = itemsByServer[serverId]?.length ?? 0;

          int startIndex = existingCount;
          final trackedOffset = _rowOffsets[cacheKey];
          if (trackedOffset != null && trackedOffset > existingCount) {
            startIndex = trackedOffset;
          }
          // A tracked offset is exactly where the server's playlists go on.
          // Without one, round up to a whole page, since filtering can leave
          // fewer of them in the row than the server returned.
          final playlistStartIndex = trackedOffset != null
              ? startIndex
              : (startIndex / _defaultLimit).ceil() * _defaultLimit;

          switch (row.rowType) {
            case HomeRowType.playlists:
              nextOffsets[cacheKey] = playlistStartIndex + _defaultLimit;
              final sortBy =
                  prefs?.get(UserPreferences.playlistsRowSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.playlistsRowSortOrder).apiValue ??
                  _defaultSortOrder;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: const ['Playlist'],
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: playlistStartIndex,
                limit: _defaultLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = await filterBrowsablePlaylists(
                session.client,
                _parseItems(response, serverId),
              );
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return [...?_rowHeldBack[cacheKey], ...items];
            case HomeRowType.audioPlaylists:
              nextOffsets[cacheKey] = playlistStartIndex + _defaultLimit;
              final sortBy =
                  prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
                  _defaultSortOrder;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: const ['Playlist'],
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: playlistStartIndex,
                limit: _defaultLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = await filterBrowsablePlaylists(
                session.client,
                _parseItems(response, serverId),
                mediaType: 'Audio',
              );
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return [...?_rowHeldBack[cacheKey], ...items];
            case HomeRowType.audioArtists:
              nextOffsets[cacheKey] = startIndex + _defaultLimit;
              final sortBy =
                  prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
                  _defaultSortOrder;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: const ['MusicArtist'],
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: startIndex,
                limit: _defaultLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = _parseItems(response, serverId);
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return items;
            case HomeRowType.audioAlbums:
              nextOffsets[cacheKey] = startIndex + _defaultLimit;
              final sortBy =
                  prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
                  _defaultSortOrder;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: const ['MusicAlbum'],
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: startIndex,
                limit: _defaultLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = _parseItems(response, serverId);
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return items;
            case HomeRowType.favorites:
              final favoriteFilter = FavoriteTypeFilter.fromRowId(row.id);
              final sortBy =
                  prefs?.get(UserPreferences.favoritesRowSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.favoritesRowSortOrder).apiValue ??
                  _defaultSortOrder;
              nextOffsets[cacheKey] = startIndex + _defaultLimit;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: favoriteFilter.itemTypes,
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: startIndex,
                limit: _defaultLimit,
                isFavorite: true,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = _parseItems(response, serverId);
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return items;
            case HomeRowType.collections:
              final sortBy =
                  prefs?.get(UserPreferences.collectionsRowSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.collectionsRowSortOrder).apiValue ??
                  _defaultSortOrder;
              nextOffsets[cacheKey] = startIndex + _defaultLimit;

              final response = await session.client.itemsApi.getItems(
                includeItemTypes: const ['BoxSet'],
                sortBy: sortBy,
                sortOrder: sortOrder,
                recursive: true,
                startIndex: startIndex,
                limit: _defaultLimit,
                fields: _fields,
                enableImageTypes: _imageTypes,
                imageTypeLimit: _imageTypeLimit,
              );
              final items = _parseItems(response, serverId);
              _rowTotals[cacheKey] =
                  response['TotalRecordCount'] as int? ?? items.length;
              return items;
            case HomeRowType.genres:
              final sortBy =
                  prefs?.get(UserPreferences.genresRowSortBy).apiValue ??
                  _defaultSortBy;
              final sortOrder =
                  prefs?.get(UserPreferences.genresRowSortOrder).apiValue ??
                  _defaultSortOrder;
              final includeItemTypes = prefs
                  ?.get(UserPreferences.genresRowItemFilter)
                  .includeItemTypes;
              final browseItemTypes = normalizeBrowsableGenreItemTypes(
                includeItemTypes,
              );
              if (row.id == 'genres') {
                final pageCount = (startIndex / _defaultLimit).ceil();
                final targetStartIndex = pageCount * _defaultLimit;
                nextOffsets[cacheKey] = targetStartIndex + _defaultLimit;

                final response = await session.client.itemsApi.getGenres(
                  sortBy: sortBy,
                  sortOrder: sortOrder,
                  recursive: true,
                  startIndex: targetStartIndex,
                  limit: _defaultLimit,
                  fields: 'ItemCounts',
                  includeItemTypes: browseItemTypes,
                );
                final items = await _buildBrowsableGenresForSession(
                  session,
                  response,
                  includeItemTypes: browseItemTypes,
                );
                _rowTotals[cacheKey] =
                    response['TotalRecordCount'] as int? ?? items.length;
                return [...?_rowHeldBack[cacheKey], ...items];
              } else {
                nextOffsets[cacheKey] = startIndex + _defaultLimit;

                final response = await session.client.itemsApi.getItems(
                  genreIds: [row.id],
                  sortBy: sortBy,
                  sortOrder: sortOrder,
                  recursive: true,
                  startIndex: startIndex,
                  limit: _defaultLimit,
                  includeItemTypes: includeItemTypes,
                  excludeItemTypes: const ['Episode'],
                  fields: _fields,
                  enableImageTypes: _imageTypes,
                  imageTypeLimit: _imageTypeLimit,
                );
                final items = _parseItems(response, serverId);
                _rowTotals[cacheKey] =
                    response['TotalRecordCount'] as int? ?? items.length;
                return items;
              }
            case HomeRowType.latestMedia:
              if (row.id.startsWith('latest_')) {
                final parts = row.id.split('_');
                if (parts.length >= 3) {
                  final rowServerId = parts[1];
                  final parentId = parts[2];
                  if (serverId != rowServerId) return const <AggregatedItem>[];

                  nextOffsets[cacheKey] = startIndex + _defaultLimit;
                  final targetLimit = startIndex + _defaultLimit;
                  final hideWatched =
                      prefs?.get(UserPreferences.hideWatchedInRecentRows) ??
                      false;
                  var fetchLimit = latestMediaFetchLimitForCollection(
                    null,
                    defaultLimit: targetLimit,
                    maxLimit: _maxItems,
                    hideWatched: hideWatched,
                  );

                  var response = await session.client.itemsApi.getLatestItems(
                    parentId: parentId,
                    limit: fetchLimit,
                    fields: _fields,
                    enableImageTypes: _imageTypes,
                    imageTypeLimit: _imageTypeLimit,
                  );
                  var rawItems = _parseItems(response, serverId);
                  var items = normalizeLatestMediaItems(
                    rawItems,
                    limit: targetLimit,
                    hideWatched: hideWatched,
                  );
                  if (hideWatched &&
                      items.length < targetLimit &&
                      rawItems.length >= fetchLimit &&
                      fetchLimit < _maxItems) {
                    fetchLimit = _maxItems;
                    response = await session.client.itemsApi.getLatestItems(
                      parentId: parentId,
                      limit: fetchLimit,
                      fields: _fields,
                      enableImageTypes: _imageTypes,
                      imageTypeLimit: _imageTypeLimit,
                    );
                    rawItems = _parseItems(response, serverId);
                    items = normalizeLatestMediaItems(
                      rawItems,
                      limit: targetLimit,
                      hideWatched: true,
                    );
                  }
                  if (items.length <= existingCount) {
                    _rowTotals[cacheKey] = items.length;
                  } else {
                    _rowTotals[cacheKey] =
                        response['TotalRecordCount'] as int? ?? _maxItems;
                  }
                  return items;
                }
              }
              return const <AggregatedItem>[];
            default:
              return const <AggregatedItem>[];
          }
        }, label: 'loadMore ${row.rowType} from ${session.server.name}')
            .catchError((Object _) {
          failedServerIds.add(session.server.id);
          return const <AggregatedItem>[];
        }),
      ),
    );
    if (sessions.isNotEmpty && failedServerIds.length == sessions.length) {
      throw StateError('MultiServer: all servers failed to load more');
    }
    // How far each server has been read, the failed ones where they were.
    final readCountByServer = <String, int>{...nextOffsets};
    for (final serverId in failedServerIds) {
      final cacheKey = '${row.id}_$serverId';
      nextOffsets.remove(cacheKey);
      readCountByServer[cacheKey] =
          _rowOffsets[cacheKey] ?? itemsByServer[serverId]?.length ?? 0;
    }
    // Moving the offsets on and dropping the held-back tiles only now means a
    // server that failed tries the same page again.
    if (generation == _pagingGeneration) {
      _rowOffsets.addAll(nextOffsets);
      for (final session in sessions) {
        if (failedServerIds.contains(session.server.id)) continue;
        _rowHeldBack.remove('${row.id}_${session.server.id}');
      }
    }

    // Folded tiles are counted once, so the servers' totals overstate the row.
    final mergedServerIds =
        row.rowType == HomeRowType.genres && row.id == 'genres'
        ? await mergedGenreServerIds()
        : const <String>{};

    // A page of the merged genres can hold only genres the row already
    // shows. The caller ends a row whose page brought nothing, so read on
    // while a server has more. Every page moves the offsets on, which ends it.
    Future<(List<AggregatedItem>, int)> foldedPage(
      List<AggregatedItem> tiles,
    ) async {
      final unread = _unreadCountOf(sessions, row.id, readCountByServer);
      // A server that failed didn't move on, so reading on would not end.
      if (tiles.length <= row.items.length &&
          unread > 0 &&
          failedServerIds.isEmpty &&
          generation == _pagingGeneration) {
        return loadMore(row: row);
      }
      return (tiles, tiles.length + unread);
    }

    final newItems = results.expand((e) => e).toList();
    if (newItems.isEmpty) {
      return mergedServerIds.isEmpty
          ? (row.items, row.totalCount)
          : foldedPage(row.items);
    }

    // Merge and sort
    final combined = [...row.items, ...newItems];

    // Deduplicate unique items
    final seen = <String>{};
    var uniqueCombined = combined
        .where((item) => seen.add('${item.serverId}_${item.id}'))
        .toList();
    if (mergedServerIds.isNotEmpty) {
      uniqueCombined = foldGenresByName(uniqueCombined, mergedServerIds);
    }

    final List<AggregatedItem> sortedCombined;
    if (row.rowType == HomeRowType.playlists ||
        row.rowType == HomeRowType.audioPlaylists ||
        row.rowType == HomeRowType.latestMedia) {
      if (row.rowType == HomeRowType.playlists ||
          row.rowType == HomeRowType.audioPlaylists) {
        final sortBy = row.rowType == HomeRowType.audioPlaylists
            ? (prefs?.get(UserPreferences.audioRowsSortBy).apiValue ?? _defaultSortBy)
            : (prefs?.get(UserPreferences.playlistsRowSortBy).apiValue ?? _defaultSortBy);
        final sortOrder = row.rowType == HomeRowType.audioPlaylists
            ? (prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
                  _defaultSortOrder)
            : (prefs?.get(UserPreferences.playlistsRowSortOrder).apiValue ??
                  _defaultSortOrder);
        if (sortBy == 'SortName') {
          final ascending = sortOrder == SortDirection.ascending.apiValue;
          uniqueCombined.sort(
            (a, b) => ascending
                ? a.name.compareTo(b.name)
                : b.name.compareTo(a.name),
          );
        } else {
          uniqueCombined = _sortAggregatedItems(
            uniqueCombined,
            sortBy: sortBy,
            sortOrder: sortOrder,
          );
        }
      }
      sortedCombined = uniqueCombined;
    } else {
      final collectionsSort = prefs?.get(UserPreferences.collectionsRowSortBy);
      // For a specific pinned collection row using Playlist Order, preserve the
      // server-returned insertion order — don't re-sort on the client side.
      // The generic 'collections' all-BoxSets row (row.id == 'collections') has
      // no parentId, so playlistOrder is never active for it.
      final collectionsUsePlaylistOrder =
          row.rowType == HomeRowType.collections &&
          (collectionsSort?.usesDedicatedEndpoint ?? false) &&
          row.id != 'collections';
      if (collectionsUsePlaylistOrder) {
        sortedCombined = uniqueCombined;
      } else {
        final sortBy = switch (row.rowType) {
          HomeRowType.favorites =>
            prefs?.get(UserPreferences.favoritesRowSortBy).apiValue ??
                _defaultSortBy,
          HomeRowType.collections =>
            collectionsSort?.apiValue ?? _defaultSortBy,
          HomeRowType.genres =>
            prefs?.get(UserPreferences.genresRowSortBy).apiValue ??
                _defaultSortBy,
          HomeRowType.audioArtists ||
          HomeRowType.audioAlbums =>
            prefs?.get(UserPreferences.audioRowsSortBy).apiValue ??
                _defaultSortBy,
          _ => _defaultSortBy,
        };
        final sortOrder = switch (row.rowType) {
          HomeRowType.favorites =>
            prefs?.get(UserPreferences.favoritesRowSortOrder).apiValue ??
                _defaultSortOrder,
          HomeRowType.collections =>
            prefs?.get(UserPreferences.collectionsRowSortOrder).apiValue ??
                _defaultSortOrder,
          HomeRowType.genres =>
            prefs?.get(UserPreferences.genresRowSortOrder).apiValue ??
                _defaultSortOrder,
          HomeRowType.audioArtists ||
          HomeRowType.audioAlbums =>
            prefs?.get(UserPreferences.audioRowsSortOrder).apiValue ??
                _defaultSortOrder,
          _ => _defaultSortOrder,
        };

        sortedCombined = _sortAggregatedItems(
          uniqueCombined,
          sortBy: sortBy,
          sortOrder: sortOrder,
        );
      }
    }

    if (mergedServerIds.isNotEmpty) return foldedPage(sortedCombined);

    final totalCount = sessions.fold<int>(0, (sum, session) {
      return sum + (_rowTotals['${row.id}_${session.server.id}'] ?? 0);
    });

    return (sortedCombined, totalCount);
  }

  /// What the servers of row [rowId] still hold past where each was read to.
  int _unreadCountOf(
    List<ServerUserSession> sessions,
    String rowId,
    Map<String, int> readCountByServer,
  ) => sessions.fold(0, (sum, session) {
    final key = '${rowId}_${session.server.id}';
    final unread = (_rowTotals[key] ?? 0) - (readCountByServer[key] ?? 0);
    return unread > 0 ? sum + unread : sum;
  });

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

    final results = await _gatherPerServer(sessions, (session) async {
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
      final items = _parseItems(response, session.server.id);
      _rowTotals['${id}_${session.server.id}'] =
          response['TotalRecordCount'] as int? ?? items.length;
      return items;
    }, label: logPrefix);

    final all = _sortAggregatedItems(
      results.expand((e) => e).toList(growable: false),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    final takenItems = all.take(limit).toList();
    final totalCount = sessions.fold<int>(0, (sum, session) {
      return sum + (_rowTotals['${id}_${session.server.id}'] ?? 0);
    });

    return HomeRow(
      id: id,
      title: title,
      items: takenItems,
      rowType: rowType,
      totalCount: totalCount,
    );
  }

  Future<HomeRow> getAggregatedLibraryTiles({
    HomeRowType rowType = HomeRowType.libraryTiles,
  }) async {
    final libraries = await getAggregatedLibraries();
    final items = libraries
        .map(
          (lib) => AggregatedItem(
            id: lib.id,
            serverId: lib.serverId,
            rawData: {
              'Id': lib.id,
              'Name': lib.name,
              'CollectionType': lib.collectionType,
              'Type': 'CollectionFolder',
              if (lib.primaryImageAspectRatio != null)
                'PrimaryImageAspectRatio': lib.primaryImageAspectRatio,
              if (lib.imageTags != null) 'ImageTags': lib.imageTags,
              if (lib.backdropImageTags != null)
                'BackdropImageTags': lib.backdropImageTags,
              if (lib.unifiedKindName != null)
                unifiedKindKey: lib.unifiedKindName,
            },
          ),
        )
        .toList();

    return HomeRow(
      id: rowType == HomeRowType.libraryTilesSmall
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

    final prefs = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>()
        : null;
    final mergeByType =
        prefs?.get(UserPreferences.mergeRecentRowsByType) ?? false;
    final hideWatched =
        prefs?.get(UserPreferences.hideWatchedInRecentRows) ?? false;
    // Only servers the merged libraries read fold their shared titles.
    final foldedServerIds = mergeByType && _effectiveMergeLibrariesByType
        ? _idsOf(sessionsIfMergeable(sessions, minServers: 1))
        : const <String>{};
    final groupedItems = <String, List<AggregatedItem>>{};

    // Read in turn, each slow or down server would hold up the home screen. The
    // answers come back in server and library order whatever the timing.
    final perSession = await mapBounded<
      ServerUserSession,
      List<_LatestForView>
    >(
      sessions,
      _latestServerConcurrency,
      (session) => _latestForSession(
        session,
        hasMultiple: hasMultiple,
        mergeByType: mergeByType,
        withProviderIds: foldedServerIds.contains(session.server.id),
        hideWatched: hideWatched,
      ),
    );
    for (final latest in perSession.expand((views) => views ?? const [])) {
      // Merged rows are built once every server has answered.
      if (mergeByType) {
        groupedItems
            .putIfAbsent(latest.collectionType, () => [])
            .addAll(latest.items);
      } else if (latest.row case final row?) {
        rows.add(row);
      }
    }

    if (!mergeByType) return rows;

    // Only read for a viewer who blocks ratings: it loads the whole catalog.
    final blockedCopies =
        foldedServerIds.isNotEmpty &&
            activeParentalFilter.isActive &&
            GetIt.instance.isRegistered<UnifiedCatalogService>()
        ? GetIt.instance<UnifiedCatalogService>()
        : null;
    await blockedCopies?.tryEnsureLoaded();

    for (final entry in groupedItems.entries) {
      final collectionType = entry.key;

      // An item listed twice is kept once, from the server listed first.
      final seen = <String>{};
      final listed = [
        for (final item in entry.value)
          if (_isFirstListing(item, seen, foldedServerIds: foldedServerIds))
            item,
      ];
      final allItems = foldedServerIds.isEmpty
          ? listed
          : _foldLatestCopies(
              listed,
              sessions,
              foldedServerIds,
              blockedCopies: blockedCopies,
            );
      if (allItems.isEmpty) continue;

      allItems.sort((a, b) {
        final da = _parseDateCreated(a.rawData['DateCreated']);
        final db = _parseDateCreated(b.rawData['DateCreated']);
        if (da != null && db != null) return db.compareTo(da);
        if (da != null) return -1;
        if (db != null) return 1;
        return 0;
      });

      final items = normalizeLatestMediaItems(
        allItems,
        collectionType: collectionType,
        limit: _defaultLimit,
        hideWatched: hideWatched,
      );
      if (items.isEmpty) continue;

      final rowId = '${mergedTypeRowIdPrefix}latest_$collectionType';
      _rowTotals[rowId] = items.length;
      rows.add(
        HomeRow(
          id: rowId,
          title: _l10n.latestLibraryName(
            genericDescriptorForCollectionType(_l10n, collectionType),
          ),
          items: items,
          rowType: HomeRowType.latestMedia,
          // Everything the row will ever hold is already here.
          totalCount: items.length,
          isAudio: collectionType == 'music',
        ),
      );
    }

    return rows;
  }

  /// Whether [item] has not been listed yet, adding its key to [seen].
  /// A movie or series from [foldedServerIds] goes by its server and id, as two
  /// servers can hand out one id; anything else by its id alone.
  static bool _isFirstListing(
    AggregatedItem item,
    Set<String> seen, {
    required Set<String> foldedServerIds,
  }) {
    final type = item.type;
    final folds =
        (type == 'Movie' || type == 'Series') &&
        foldedServerIds.contains(item.serverId);
    return seen.add(folds ? unifiedCopyKey(item.serverId, item.id) : item.id);
  }

  /// Folds the copies of one title in [items] into one card that carries them
  /// all, as a merged library does, so the card gets its badge and server
  /// picker. A title with a blocked copy is left out, as in a merged library.
  List<AggregatedItem> _foldLatestCopies(
    List<AggregatedItem> items,
    List<ServerUserSession> sessions,
    Set<String> foldedServerIds, {
    UnifiedCatalogService? blockedCopies,
  }) {
    // The active server's copy is the one shown, as in search and the grid.
    final activeServerId = _sessionRepo.activeServerId;
    final servers = [
      for (final session in [
        ...sessions.where((s) => s.server.id == activeServerId),
        ...sessions.where((s) => s.server.id != activeServerId),
      ])
        if (foldedServerIds.contains(session.server.id))
          UnifiedServerInfo(id: session.server.id, name: session.server.name),
    ];
    return [
      for (final item in foldSharedTitles(items, servers))
        if (!isAnyCopyBlocked(item.rawData) &&
            !_hasBlockedCatalogCopy(item, blockedCopies, foldedServerIds))
          item,
    ];
  }

  /// Whether [catalog] holds a blocked copy of [item] on one of
  /// [foldedServerIds]. A server's latest items leave out its older copies,
  /// which a merged library still counts.
  bool _hasBlockedCatalogCopy(
    AggregatedItem item,
    UnifiedCatalogService? catalog,
    Set<String> foldedServerIds,
  ) {
    final itemType = UnifiedLibraryKind.fromItemType(item.type)?.itemType;
    if (catalog == null ||
        itemType == null ||
        !foldedServerIds.contains(item.serverId)) {
      return false;
    }
    final copies = catalog.copiesOf(
      UnifiedCatalogEntry(
        serverId: item.serverId,
        itemId: item.id,
        itemType: itemType,
        raw: item.rawData,
      ),
    );
    return copies.any((copy) {
      if (!foldedServerIds.contains(copy.serverId)) return false;
      final rating = copy.raw['OfficialRating']?.toString().trim();
      return rating != null && rating.isNotEmpty && isRatingBlocked(rating);
    });
  }

  Future<List<_LatestForView>> _latestForSession(
    ServerUserSession session, {
    required bool hasMultiple,
    required bool mergeByType,
    required bool withProviderIds,
    required bool hideWatched,
  }) async {
    try {
      final viewsFuture = _withTimeout(
        () => loadUserViews(session.client, includeHidden: true),
        label: 'views from ${session.server.name}',
      );
      // Awaited below, after the excludes that are read alongside it.
      viewsFuture.ignore();

      Set<String> latestExcludes = const {};
      try {
        final config = await session.client.usersApi
            .getUserConfiguration()
            .timeout(_serverTimeout);
        latestExcludes = config.latestItemsExcludes.toSet();
      } catch (_) {}

      final views = [
        for (final view in await viewsFuture)
          if (!const {
                'playlists',
                'boxsets',
                'livetv',
              }.contains(view.collectionType.toLowerCase()) &&
              !latestExcludes.contains(view.id))
            view,
      ];
      final results = await mapBounded<AggregatedLibrary, _LatestForView>(
        views,
        _latestLibraryConcurrency,
        (view) => _latestForView(
          session,
          view,
          hasMultiple: hasMultiple,
          mergeByType: mergeByType,
          withProviderIds: withProviderIds,
          hideWatched: hideWatched,
        ),
      );
      return results.whereType<_LatestForView>().toList();
    } catch (e) {
      _logger.w(
        'MultiServer: Failed to load views from ${session.server.name}: $e',
      );
      return const [];
    }
  }

  Future<_LatestForView?> _latestForView(
    ServerUserSession session,
    AggregatedLibrary view, {
    required bool hasMultiple,
    required bool mergeByType,
    required bool withProviderIds,
    required bool hideWatched,
  }) async {
    final id = view.id;
    final name = view.name;
    final collectionType = view.collectionType.toLowerCase();
    var fetchLimit = latestMediaFetchLimitForCollection(
      collectionType,
      defaultLimit: _defaultLimit,
      maxLimit: _maxItems,
      hideWatched: hideWatched,
    );

    try {
      var latestResponse = await _withTimeout(
        () => session.client.itemsApi.getLatestItems(
          parentId: id,
          limit: fetchLimit,
          fields: withProviderIds ? _latestFieldsWithProviderIds : _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: _imageTypeLimit,
        ),
        label: 'latest $name from ${session.server.name}',
      );

      // A folded server keeps its blocked copies for now. The fold has to see
      // them, because one blocked copy hides the title on every server.
      var listed = _parseItems(
        latestResponse,
        session.server.id,
        keepBlocked: withProviderIds,
      );
      var parsed = withoutBlockedItems(listed);
      if ((withProviderIds ? listed : parsed).isEmpty) return null;

      if (hideWatched && parsed.length >= fetchLimit && fetchLimit < _maxItems) {
        final unwatchedItems = normalizeLatestMediaItems(
          parsed,
          collectionType: collectionType,
          limit: _defaultLimit,
          hideWatched: true,
        );
        if (unwatchedItems.length < _defaultLimit) {
          fetchLimit = _maxItems;
          latestResponse = await _withTimeout(
            () => session.client.itemsApi.getLatestItems(
              parentId: id,
              limit: fetchLimit,
              fields: withProviderIds ? _latestFieldsWithProviderIds : _fields,
              enableImageTypes: _imageTypes,
              imageTypeLimit: _imageTypeLimit,
            ),
            label: 'latest $name from ${session.server.name}',
          );
          listed = _parseItems(
            latestResponse,
            session.server.id,
            keepBlocked: withProviderIds,
          );
          parsed = withoutBlockedItems(listed);
          if ((withProviderIds ? listed : parsed).isEmpty) return null;
        }
      }

      if (mergeByType) {
        return (collectionType: collectionType, items: listed, row: null);
      }

      final items = normalizeLatestMediaItems(
        parsed,
        collectionType: collectionType,
        limit: _defaultLimit,
        hideWatched: hideWatched,
      );
      if (items.isEmpty) return null;

      final displayName = hasMultiple
          ? '$name (${session.server.name})'
          : name;
      final totalCount = items.length < _defaultLimit
          ? items.length
          : _maxItems;
      _rowTotals['latest_${session.server.id}_${id}_${session.server.id}'] =
          totalCount;
      return (
        collectionType: collectionType,
        items: parsed,
        row: HomeRow(
          id: 'latest_${session.server.id}_$id',
          title: _l10n.latestLibraryName(displayName),
          items: items,
          rowType: HomeRowType.latestMedia,
          totalCount: totalCount,
          isAudio: collectionType == 'music',
        ),
      );
    } catch (e) {
      _logger.w('MultiServer: Failed to load latest for $name: $e');
      return null;
    }
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

  /// Runs [task] for every session and tolerates individual server failures,
  /// substituting an empty list for any server that timed out or errored. Throws
  /// only when every session fails, so callers can tell a real all-servers
  /// outage apart from a legitimately empty result and keep the previous row.
  Future<List<List<AggregatedItem>>> _gatherPerServer(
    List<ServerUserSession> sessions,
    Future<List<AggregatedItem>> Function(ServerUserSession session) task, {
    required String label,
  }) async {
    var failures = 0;
    final results = await Future.wait(
      sessions.map(
        (session) => _withTimeout(
          () => task(session),
          label: '$label from ${session.server.name}',
        ).catchError((_) {
          failures++;
          return <AggregatedItem>[];
        }),
      ),
    );
    if (sessions.isNotEmpty && failures == sessions.length) {
      throw StateError('MultiServer: all servers failed to load $label');
    }
    return results;
  }

  /// Runs [search] against every signed-in server through that server's own
  /// client, and tags each result with the server it came from so its artwork
  /// and details load from there.
  Future<List<List<AggregatedItem>>> searchEachServer(
    Future<List<AggregatedItem>> Function(SearchRepository repository) search, {
    required String label,
  }) async {
    final sessions = await getLoggedInServers();
    return _gatherPerServer(
      sessions,
      (session) async => [
        for (final item in await search(SearchRepository(session.client)))
          AggregatedItem(
            id: item.id,
            serverId: session.server.id,
            rawData: item.rawData,
          ),
      ],
      label: label,
    );
  }

  /// The genres of [response] that can still hold something to browse.
  Iterable<Map<String, dynamic>> _browsableGenresIn(
    Map<String, dynamic> response,
    List<String> includeItemTypes,
  ) => (response['Items'] as List? ?? const [])
      .whereType<Map>()
      .map((item) => item.cast<String, dynamic>())
      .where(
        (genre) => mayHaveBrowsableItems(
          genre,
          normalizedItemTypes: includeItemTypes,
        ),
      );

  Future<List<AggregatedItem>> _buildBrowsableGenresForSession(
    ServerUserSession session,
    Map<String, dynamic> response, {
    required List<String> includeItemTypes,
    int? maxGenres,
  }) async {
    final browsable = _browsableGenresIn(response, includeItemTypes);
    final genres = (maxGenres == null ? browsable : browsable.take(maxGenres))
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
    final genreId = genreData['Id']?.toString();
    if (genreId == null || genreId.isEmpty) {
      return null;
    }

    try {
      final response = await session.client.itemsApi.getItems(
        genreIds: [genreId],
        includeItemTypes: includeItemTypes,
        excludeItemTypes: const ['Episode'],
        sortBy: 'Random',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 10,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
      );

      final items = (response['Items'] as List?) ?? const [];
      final maps = List<Map<String, dynamic>>.from(
        items.whereType<Map>().map((item) => item.cast<String, dynamic>()),
      );
      if (maps.isEmpty) {
        return null;
      }

      maps.shuffle();
      final representative = maps[0];
      final backdropRepresentative = maps.length > 1 ? maps[1] : null;

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
        representativeItem: representative,
        itemCount: totalCount,
        backdropRepresentativeItem: backdropRepresentative,
      );
      return AggregatedItem(
        id: merged['Id']?.toString() ?? '',
        serverId: session.server.id,
        rawData: merged,
      );
    } catch (_) {
      return null;
    }
  }

  List<AggregatedItem> _parseItems(
    Map<String, dynamic> response,
    String serverId, {
    bool keepBlocked = false,
  }) {
    final rawItems = response['Items'] as List? ?? [];
    final items = rawItems.map((item) {
      final data = item as Map<String, dynamic>;
      return AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: serverId,
        rawData: data,
      );
    }).toList();
    return keepBlocked ? items : withoutBlockedItems(items);
  }

  List<AggregatedItem> _sortAggregatedItems(
    List<AggregatedItem> items, {
    required String sortBy,
    required String sortOrder,
  }) {
    final sorted = List<AggregatedItem>.of(items);
    // Rows pass the full sort value, like 'DateCreated,SortName'.
    final primarySortBy = sortBy.split(',').first;
    if (primarySortBy == 'Random') {
      sorted.shuffle();
      return sorted;
    }

    // Items without a value count as the lowest, the way the server sorts
    // them: first when the oldest or lowest come first, last when the newest
    // or highest do. Ties fall back to the name, like the server's SortName
    // tie-break.
    final descending = sortOrder.toLowerCase() == 'descending';

    int compareByName(AggregatedItem a, AggregatedItem b) {
      final byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      return descending ? -byName : byName;
    }

    int compareByKey(AggregatedItem a, AggregatedItem b) {
      switch (primarySortBy) {
        case 'DateCreated':
          return _compareNullableDate(
            _parseDateCreated(a.rawData['DateCreated']),
            _parseDateCreated(b.rawData['DateCreated']),
            descending: descending,
          );
        case 'PremiereDate':
          return _compareNullableDate(
            a.premiereDate,
            b.premiereDate,
            descending: descending,
          );
        case 'CommunityRating':
          return _compareNullableNum(
            a.communityRating,
            b.communityRating,
            descending: descending,
          );
        case 'CriticRating':
          return _compareNullableNum(
            a.criticRating?.toDouble(),
            b.criticRating?.toDouble(),
            descending: descending,
          );
        case 'Runtime':
        case 'RunTimeTicks':
          return _compareNullableNum(
            a.runTimeTicks?.toDouble(),
            b.runTimeTicks?.toDouble(),
            descending: descending,
          );
        case 'ProductionYear':
          return _compareNullableNum(
            a.productionYear?.toDouble(),
            b.productionYear?.toDouble(),
            descending: descending,
          );
        default:
          return 0;
      }
    }

    sorted.sort((a, b) {
      final byKey = compareByKey(a, b);
      return byKey != 0 ? byKey : compareByName(a, b);
    });
    return sorted;
  }

  static DateTime? _parseDateCreated(dynamic value) => parseServerDate(value);

  static int _compareNullableDate(
    DateTime? a,
    DateTime? b, {
    bool descending = false,
  }) {
    if (a == null && b == null) return 0;
    final ascending = a == null ? -1 : (b == null ? 1 : a.compareTo(b));
    return descending ? -ascending : ascending;
  }

  static int _compareNullableNum(
    double? a,
    double? b, {
    bool descending = false,
  }) {
    if (a == null && b == null) return 0;
    final ascending = a == null ? -1 : (b == null ? 1 : a.compareTo(b));
    return descending ? -ascending : ascending;
  }

  static int _compareByLastPlayed(AggregatedItem a, AggregatedItem b) {
    final aDate = a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
    final bDate = b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
    return bDate.compareTo(aDate);
  }

  Future<List<AggregatedItem>> _enrichNextUpItemsWithSeriesLastPlayed(
    List<AggregatedItem> items,
    MediaServerClient client,
    Future<Map<String, String>?> recentlyPlayed,
  ) => enrichNextUpItemsWithSeriesLastPlayed(items, client, recentlyPlayed);
}
