import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart'
    show plexItemToJellyfin, plexPersonToJellyfin;

import '../../l10n/current_app_localizations.dart';
import '../../util/accent_folding.dart';
import '../models/aggregated_item.dart';
import '../repositories/multi_server_repository.dart';
import '../repositories/search_repository.dart';
import '../repositories/seerr_repository.dart';
import '../services/plugin_sync_service.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/unified_catalog_query.dart';
import '../services/unified_catalog_service.dart';
import '../services/unified_search_fold.dart';
import '../utils/blocked_ratings.dart';

class SearchResultGroup {
  final String title;
  final List<String> itemTypes;
  final List<AggregatedItem> items;

  const SearchResultGroup({
    required this.title,
    required this.itemTypes,
    this.items = const [],
  });

  SearchResultGroup copyWith({List<AggregatedItem>? items}) =>
      SearchResultGroup(title: title, itemTypes: itemTypes, items: items ?? this.items);
}

/// A single retro game that matched the query. Games live behind the Moonbase
/// plugin rather than the normal /Items search, so they carry their owning
/// [libraryId] (which [GameSummary] itself does not expose) for navigation.
class GameSearchResult {
  final String libraryId;
  final GameSummary game;

  const GameSearchResult({required this.libraryId, required this.game});
}

/// What Moonbase's natural-language search found: library items as item
/// cards, and titles the library lacks in Seerr's own search result shape.
class SmartSearchResults {
  final List<AggregatedItem> items;
  final List<SeerrDiscoverItem> seerr;

  const SmartSearchResults({this.items = const [], this.seerr = const []});

  static const empty = SmartSearchResults();

  bool get isEmpty => items.isEmpty && seerr.isEmpty;

  /// A server still building its first index answers with Ready false. On
  /// [plex] the items are Plex metadata and people are Role tags, so they go
  /// through the Plex client's own mappers and act like any other Plex item.
  factory SmartSearchResults.fromJson(
    Map<String, dynamic> json, {
    required String serverId,
    bool plex = false,
    bool includeSeerr = true,
  }) {
    if (json['Ready'] != true) return empty;
    final items = [
      for (final raw in (json['Items'] as List? ?? const []).whereType<Map>())
        if (!plex)
          raw.cast<String, dynamic>()
        else if (raw['type'] == 'person')
          plexPersonToJellyfin(raw)
        else
          plexItemToJellyfin(raw.cast<String, dynamic>()),
    ];
    return SmartSearchResults(
      items: withoutBlockedItems([
        for (final data in items)
          AggregatedItem(
            id: data['Id']?.toString() ?? '',
            serverId: serverId,
            rawData: data,
          ),
      ]),
      seerr: includeSeerr
          ? [
              for (final raw
                  in (json['Seerr'] as List? ?? const []).whereType<Map>())
                SeerrDiscoverItem.fromJson(raw.cast<String, dynamic>()),
            ].where((item) => !item.isBlacklisted).toList()
          : const [],
    );
  }
}

enum SearchState { idle, loading, ready, error }

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _searchRepository;
  final MediaServerClient _client;
  final String? _scopedParentId;
  // Only set when search should cover every signed-in server.
  final MultiServerRepository? _multiServerRepository;
  final PluginSyncService? _pluginSync;
  final bool _mergeSharedTitles;
  final UnifiedCatalogService? _unifiedCatalog;
  final String? Function()? _activeServerId;
  SeerrRepository? _seerrRepository;

  SearchViewModel(
    this._searchRepository,
    this._client, {
    SeerrRepository? seerrRepository,
    String? scopedParentId,
    MultiServerRepository? multiServerRepository,
    PluginSyncService? pluginSync,
    this._mergeSharedTitles = false,
    this._unifiedCatalog,
    this._activeServerId,
  }) : _seerrRepository = seerrRepository,
       _multiServerRepository = multiServerRepository,
       _pluginSync = pluginSync,
       _scopedParentId =
           (scopedParentId != null && scopedParentId.isNotEmpty)
               ? scopedParentId
               : null;

  void setSeerrRepository(SeerrRepository repo) {
    _seerrRepository = repo;
  }

  ImageApi imageApiFor(AggregatedItem item) =>
      _multiServerRepository?.getImageApiForServer(item.serverId) ??
      _client.imageApi;

  Map<String, String> _serverNames = const {};

  /// The server [item] came from, or null when only one server was searched.
  String? serverNameFor(AggregatedItem item) => _serverNames[item.serverId];

  SearchState _state = SearchState.idle;
  SearchState get state => _state;

  String _query = '';
  String get query => _query;

  List<SearchResultGroup> _results = const [];
  List<SearchResultGroup> get results => _results;

  List<SeerrDiscoverItem> _seerrResults = const [];
  List<SeerrDiscoverItem> get seerrResults => _seerrResults;

  List<GameSearchResult> _gameResults = const [];
  List<GameSearchResult> get gameResults => _gameResults;

  SmartSearchResults _smartResults = SmartSearchResults.empty;
  SmartSearchResults get smartResults => _smartResults;
  // The query [_smartResults] answered, so searching it again (on submit after
  // the debounce already ran) keeps the rows up until the new answer lands.
  String _smartQuery = '';

  // All games across every game library, fetched once per session and filtered
  // client-side since the plugin exposes no search endpoint.
  Future<List<GameSearchResult>>? _allGamesFuture;

  Object? _error;
  Object? get error => _error;

  Timer? _debounceTimer;

  static const _debounceMs = 600;
  static const _resultLimit = 24;
  static const _globalFetchLimit = 240;
  // Some servers answer a people search far slower than everything else, so
  // the rest of the results only wait a moment for it and it's dropped if it
  // takes too long.
  static const _peopleGrace = Duration(seconds: 1);
  static const _peopleTimeout = Duration(seconds: 10);
  static const _smartTimeout = Duration(seconds: 10);

  // Counts searches, so people that answer late only fill in their own search.
  int _searchRun = 0;

  bool _disposed = false;

  static List<SearchResultGroup> _bookSearchGroups() {
    final l10n = currentAppLocalizations();
    return [
      SearchResultGroup(title: l10n.books, itemTypes: const ['Book']),
      SearchResultGroup(title: l10n.audiobooks, itemTypes: const ['AudioBook']),
    ];
  }

  static List<SearchResultGroup> _searchGroups() {
    final l10n = currentAppLocalizations();
    return [
      SearchResultGroup(title: l10n.books, itemTypes: const ['Book']),
      SearchResultGroup(title: l10n.audiobooks, itemTypes: const ['AudioBook']),
      SearchResultGroup(title: l10n.movies, itemTypes: const ['Movie']),
      SearchResultGroup(title: l10n.series, itemTypes: const ['Series']),
      SearchResultGroup(title: l10n.seasons, itemTypes: const ['Season']),
      SearchResultGroup(title: l10n.episodes, itemTypes: const ['Episode']),
      SearchResultGroup(title: l10n.videos, itemTypes: const ['Video']),
      SearchResultGroup(title: l10n.musicVideos, itemTypes: const ['MusicVideo']),
      SearchResultGroup(title: l10n.trailers, itemTypes: const ['Trailer']),
      SearchResultGroup(title: l10n.programs, itemTypes: const ['Program']),
      SearchResultGroup(
        title: l10n.channels,
        itemTypes: const ['LiveTvChannel', 'TvChannel'],
      ),
      SearchResultGroup(title: l10n.playlists, itemTypes: const ['Playlist']),
      SearchResultGroup(
        title: l10n.artists,
        itemTypes: const ['MusicArtist', 'AlbumArtist'],
      ),
      SearchResultGroup(title: l10n.albums, itemTypes: const ['MusicAlbum']),
      SearchResultGroup(title: l10n.songs, itemTypes: const ['Audio']),
      SearchResultGroup(title: l10n.photoAlbums, itemTypes: const ['PhotoAlbum']),
      SearchResultGroup(title: l10n.photos, itemTypes: const ['Photo']),
      SearchResultGroup(title: l10n.collections, itemTypes: const ['BoxSet']),
      SearchResultGroup(title: l10n.people, itemTypes: const ['Person']),
      SearchResultGroup(
        title: l10n.folders,
        itemTypes: const ['Folder', 'CollectionFolder', 'UserView'],
      ),
    ];
  }

  void searchDebounced(String query) {
    final trimmed = query.trim();
    if (trimmed == _query) return;
    _query = trimmed;

    _debounceTimer?.cancel();
    unawaited(_warmCatalog());

    if (trimmed.isEmpty) {
      _results = const [];
      _seerrResults = const [];
      _gameResults = const [];
      _smartResults = SmartSearchResults.empty;
      _smartQuery = '';
      _state = SearchState.idle;
      notifyListeners();
      return;
    }

    _state = SearchState.loading;
    notifyListeners();

    _debounceTimer = Timer(
      const Duration(milliseconds: _debounceMs),
      () => _executeSearch(trimmed),
    );
  }

  void searchImmediate(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;
    _query = trimmed;
    _debounceTimer?.cancel();
    unawaited(_warmCatalog());
    _state = SearchState.loading;
    notifyListeners();
    _executeSearch(trimmed);
  }

  Future<void> _executeSearch(String query) async {
    if (query != _query) return;
    final run = ++_searchRun;

    try {
        final activeGroups = _scopedParentId != null
          ? _bookSearchGroups()
          : _searchGroups();
      final seerrFuture = _fetchSeerrResults(query);
      final smartFuture = _fetchSmartResults(query);
      final gamesFuture = _scopedParentId != null
          ? Future.value(const <GameSearchResult>[])
          : _fetchGameResults(query);

      var (
        groups: groups,
        people: peopleFuture,
        regrouped: regroupedFuture,
      ) = _scopedParentId != null
          ? (
              groups: await Future.wait(
                activeGroups.map((group) async {
                  final items = await _searchRepository.search(
                    query,
                    includeItemTypes: group.itemTypes,
                    parentId: _scopedParentId,
                    limit: _resultLimit,
                  );
                  return group.copyWith(items: items);
                }),
              ),
              people: Future.value(const <AggregatedItem>[]),
              regrouped: Future<List<SearchResultGroup>?>.value(),
            )
          : await _buildGroupedGlobalResults(query, activeGroups);
      final seerr = await seerrFuture;
      final games = await gamesFuture;

      // With nothing else to show, the results wait for smart search and
      // people instead of coming up empty.
      final hasLibraryResults =
          groups.any((g) => g.items.isNotEmpty) ||
          seerr.isNotEmpty ||
          games.isNotEmpty;
      final smart = hasLibraryResults ? null : await smartFuture;
      final hasOtherResults = hasLibraryResults || !(smart?.isEmpty ?? true);
      final people = hasOtherResults
          ? await peopleFuture
                .then<List<AggregatedItem>?>((found) => found)
                .timeout(_peopleGrace, onTimeout: () => null)
          : await peopleFuture;

      if (_disposed || query != _query) return;

      var shownPeople = people ?? const <AggregatedItem>[];
      _results = _withPeople(groups, shownPeople);
      _seerrResults = seerr;
      _gameResults = games;
      if (smart != null || _smartQuery != query) {
        _smartResults = smart ?? SmartSearchResults.empty;
        _smartQuery = query;
      }
      _state = SearchState.ready;
      if (smart == null) {
        unawaited(
          smartFuture.then((found) {
            if (found.isEmpty || run != _searchRun || query != _query) return;
            _smartResults = found;
            notifyListeners();
          }),
        );
      }
      if (people == null) {
        unawaited(
          peopleFuture.then((found) {
            if (found.isEmpty || run != _searchRun || query != _query) return;
            shownPeople = found;
            _results = _withPeople(groups, shownPeople);
            notifyListeners();
          }),
        );
      }
      unawaited(
        regroupedFuture.then((regrouped) {
          if (regrouped == null || run != _searchRun || query != _query) return;
          groups = regrouped;
          _results = _withPeople(groups, shownPeople);
          notifyListeners();
        }),
      );
    } catch (e) {
      if (_disposed || query != _query) return;
      _error = e;
      _state = SearchState.error;
    }
    notifyListeners();
  }

  // Only where a search would fold shared titles: the load decodes the whole
  // merged catalog.
  Future<void> _warmCatalog() async {
    final multiServer = _multiServerRepository;
    if (!_mergeSharedTitles || multiServer == null) return;
    try {
      final sessions = await multiServer.getLoggedInServers();
      if (_disposed || _mergeableServersOrNull(sessions) == null) return;
      await _tryLoadCatalog();
    } catch (_) {}
  }

  /// Starts loading the merged catalog and reports whether it loaded. False
  /// without a catalog or in a scoped search, which never folds.
  Future<bool> _tryLoadCatalog() async {
    final catalog = _unifiedCatalog;
    if (catalog == null || _scopedParentId != null) return false;
    return catalog.tryEnsureLoaded();
  }

  /// `groups` is every group in order with the People group left empty, and
  /// `people` the people search that fills it. `regrouped` completes with the
  /// groups again once a catalog that loaded too late has more copies to add,
  /// else with null.
  Future<
    ({
      List<SearchResultGroup> groups,
      Future<List<AggregatedItem>> people,
      Future<List<SearchResultGroup>?> regrouped,
    })
  >
  _buildGroupedGlobalResults(
    String query,
    List<SearchResultGroup> activeGroups,
  ) async {
    // Looked up once before the searches start, so each of them reuses it
    // instead of looking the servers up again.
    final sessions = await _multiServerRepository?.getLoggedInServers();
    _serverNames = sessions != null && sessions.length > 1
        ? {for (final session in sessions) session.server.id: session.server.name}
        : const {};
    final mergeableServers = _mergeableServersOrNull(sessions);
    final catalogLoad = mergeableServers == null
        ? Future.value(false)
        : _tryLoadCatalog();
    // The grace runs from the start of the search. A catalog slower than that
    // completes the cards once it is loaded.
    final loadedInTimeFuture = catalogLoad.timeout(
      UnifiedCatalogService.loadGrace,
      onTimeout: () => false,
    );
    final peopleFuture = _searchEachServer(
      (repository) => repository
          .searchPeople(query, limit: _resultLimit)
          .timeout(_peopleTimeout),
      label: 'people search',
    ).then(_interleave).catchError((_) => <AggregatedItem>[]);
    final channelsFuture = _channelMatches(query);
    final perServerItems = await _searchEachServer(
      (repository) => repository.searchGroups(
        query,
        [
          for (final group in activeGroups)
            if (!group.itemTypes.contains('Person') &&
                !group.itemTypes.contains('LiveTvChannel'))
              group.itemTypes,
        ],
        perGroup: _resultLimit,
        limit: _globalFetchLimit,
        withProviderIds: mergeableServers != null,
      ),
      label: 'search',
    );
    final channels = await channelsFuture;

    List<SearchResultGroup> groupResults({required bool withCatalog}) =>
        _groupResults(
          activeGroups,
          perServerItems: perServerItems,
          channels: channels,
          mergeableServers: mergeableServers,
          withCatalog: withCatalog,
        );

    final loadedInTime = await loadedInTimeFuture;
    final grouped = groupResults(withCatalog: loadedInTime);
    final regroupedFuture = loadedInTime
        ? Future<List<SearchResultGroup>?>.value()
        : catalogLoad.then((loaded) {
            if (!loaded) return null;
            final regrouped = groupResults(withCatalog: true);
            return _sameCards(grouped, regrouped) ? null : regrouped;
          });
    return (groups: grouped, people: peopleFuture, regrouped: regroupedFuture);
  }

  /// Sorts the servers' answers into [activeGroups], folding the titles that
  /// several of [mergeableServers] hold. [withCatalog] also adds the copies
  /// the merged catalog knows of.
  List<SearchResultGroup> _groupResults(
    List<SearchResultGroup> activeGroups, {
    required List<List<AggregatedItem>> perServerItems,
    required List<AggregatedItem> channels,
    required List<UnifiedServerInfo>? mergeableServers,
    required bool withCatalog,
  }) {
    final catalog = withCatalog ? _unifiedCatalog : null;
    var servers = mergeableServers;
    if (servers != null && catalog != null) {
      final answered = {
        for (final items in perServerItems)
          for (final item in items) item.serverId,
      };
      servers = [
        for (final server in servers)
          UnifiedServerInfo(
            id: server.id,
            name: server.name,
            reachable:
                answered.contains(server.id) || catalog.isReachable(server.id),
          ),
      ];
    }
    final grouped = <SearchResultGroup>[];
    for (final group in activeGroups) {
      if (group.itemTypes.contains('Person')) {
        grouped.add(group);
        continue;
      }
      if (group.itemTypes.contains('LiveTvChannel')) {
        grouped.add(group.copyWith(items: channels));
        continue;
      }
      final found = _interleave([
        for (final items in perServerItems)
          items.where((item) => group.itemTypes.contains(item.type)).toList(),
      ]);
      // Folded before the cut to size, so a shared title takes one place.
      final matched = servers == null
          ? found
          : foldSharedTitles(found, servers, knownCopies: catalog?.copiesOf);
      grouped.add(group.copyWith(items: matched.take(_resultLimit).toList()));
    }
    return grouped;
  }

  static bool _sameCards(List<SearchResultGroup> a, List<SearchResultGroup> b) =>
      listEquals(
        [for (final group in a) ...group.items.map(unifiedCardKey)],
        [for (final group in b) ...group.items.map(unifiedCardKey)],
      );

  /// The servers whose movies and series fold into one result, preferred first
  /// (the one being browsed, then the rest as added).
  ///
  /// Null, never an empty list, when nothing folds: the setting is off, there
  /// are no sessions, or too few servers to merge.
  List<UnifiedServerInfo>? _mergeableServersOrNull(
    List<ServerUserSession>? sessions,
  ) {
    if (!_mergeSharedTitles || sessions == null) return null;
    final active = _activeServerId?.call();
    final mergeableServers = [
      for (final session in MultiServerRepository.sessionsIfMergeable(sessions))
        session.server,
    ];
    if (mergeableServers.isEmpty) return null;
    return [
      for (final server in [
        ...mergeableServers.where((server) => server.id == active),
        ...mergeableServers.where((server) => server.id != active),
      ])
        UnifiedServerInfo(id: server.id, name: server.name),
    ];
  }

  /// The groups that have something to show, with [people] in the People
  /// group.
  static List<SearchResultGroup> _withPeople(
    List<SearchResultGroup> groups,
    List<AggregatedItem> people,
  ) => [
    for (final group in groups)
      if (group.itemTypes.contains('Person'))
        group.copyWith(items: people.take(_resultLimit).toList())
      else
        group,
  ].where((g) => g.items.isNotEmpty).toList();

  Future<List<List<AggregatedItem>>> _searchEachServer(
    Future<List<AggregatedItem>> Function(SearchRepository repository) search, {
    required String label,
  }) async {
    final multiServer = _multiServerRepository;
    if (multiServer == null) return [await search(_searchRepository)];
    return multiServer.searchEachServer(search, label: label);
  }

  /// Takes one result from each server in turn, so every server keeps its own
  /// ranking and none crowds the others out of a capped group.
  static List<AggregatedItem> _interleave(List<List<AggregatedItem>> perServer) {
    final longest = perServer.fold(0, (most, items) => max(most, items.length));
    return [
      for (var i = 0; i < longest; i++)
        for (final items in perServer)
          if (i < items.length) items[i],
    ];
  }

  // The lineup is fetched once per search session and reused across queries,
  // since /LiveTv/Channels has no search parameter of its own.
  Future<List<AggregatedItem>>? _channelsFuture;

  Future<List<AggregatedItem>> _channelMatches(String query) async {
    // Channels come back wholesale rather than through a search the server
    // answers, so the folding it would have done has to happen here.
    final q = foldForSearch(query.trim());
    if (q.isEmpty || q.startsWith('studio:')) return const [];
    _channelsFuture ??= _searchEachServer(
      (repository) => repository.fetchLiveTvChannels(),
      label: 'channel lineup',
    ).then((perServer) => perServer.expand((channels) => channels).toList());
    try {
      final all = await _channelsFuture!;
      return all
          .where((c) => foldForSearch(c.name).contains(q))
          .take(_resultLimit)
          .toList();
    } catch (_) {
      // A server without Live TV shouldn't break search. Retry next query in
      // case the failure was transient.
      _channelsFuture = null;
      return const [];
    }
  }

  Future<List<SeerrDiscoverItem>> _fetchSeerrResults(String query) async {
    if (_scopedParentId != null) return const [];
    if (query.trim().toLowerCase().startsWith('studio:')) return const [];
    final repo = _seerrRepository;
    if (repo == null) return const [];
    try {
      await repo.ensureInitialized();
      if (!repo.isAvailable) return const [];
      final page = await repo.search(query, limit: _resultLimit);
      return page.results.where((item) => !item.isBlacklisted).toList();
    } catch (_) {
      return const [];
    }
  }

  Future<SmartSearchResults> _fetchSmartResults(String query) async {
    final pluginSync = _pluginSync;
    if (pluginSync == null || !pluginSync.smartSearchEnabled) {
      return SmartSearchResults.empty;
    }
    if (_scopedParentId != null || query.toLowerCase().startsWith('studio:')) {
      return SmartSearchResults.empty;
    }
    // A single word is a title or a name, which the normal search handles.
    if (query.split(RegExp(r'\s+')).length < 2) return SmartSearchResults.empty;
    try {
      final data = await pluginSync
          .fetchSmartSearch(_client, query)
          .timeout(_smartTimeout);
      if (data == null) return SmartSearchResults.empty;
      return SmartSearchResults.fromJson(
        data,
        serverId: _client.baseUrl,
        plex: _client.serverType == ServerType.plex,
        includeSeerr: _seerrRepository?.isAvailable ?? false,
      );
    } catch (_) {
      return SmartSearchResults.empty;
    }
  }

  Future<List<GameSearchResult>> _fetchGameResults(String query) async {
    // Games have no search endpoint, so the whole set is matched here and the
    // folding is this side's to do.
    final q = foldForSearch(query.trim());
    if (q.isEmpty || q.startsWith('studio:')) return const [];
    final gamesApi = _client.gamesApi;
    if (gamesApi == null) return const [];
    try {
      _allGamesFuture ??= _fetchAllGames(gamesApi);
      final all = await _allGamesFuture!;
      return all
          .where(
            (r) =>
                foldForSearch(r.game.title).contains(q) ||
                foldForSearch(r.game.fileName).contains(q),
          )
          .take(_resultLimit)
          .toList();
    } catch (_) {
      _allGamesFuture = null;
      return const [];
    }
  }

  Future<List<GameSearchResult>> _fetchAllGames(GamesApi gamesApi) async {
    final libraries = await gamesApi.getLibraries();
    final perLibrary = await Future.wait(
      libraries.map((library) async {
        final games = await gamesApi.getGames(library.id);
        return games.map(
          (game) => GameSearchResult(libraryId: library.id, game: game),
        );
      }),
    );
    return perLibrary.expand((results) => results).toList();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    // Keeps people that answer after the screen closed from landing on it.
    _searchRun++;
    _disposed = true;
    super.dispose();
  }
}
