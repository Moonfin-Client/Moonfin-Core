import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../../util/accent_folding.dart';
import '../models/aggregated_item.dart';
import '../repositories/multi_server_repository.dart';
import '../repositories/search_repository.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';

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

enum SearchState { idle, loading, ready, error }

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _searchRepository;
  final MediaServerClient _client;
  final String? _scopedParentId;
  // Only set when search should cover every signed-in server.
  final MultiServerRepository? _multiServerRepository;
  SeerrRepository? _seerrRepository;

  SearchViewModel(
    this._searchRepository,
    this._client, {
    SeerrRepository? seerrRepository,
    String? scopedParentId,
    MultiServerRepository? multiServerRepository,
  }) : _seerrRepository = seerrRepository,
       _multiServerRepository = multiServerRepository,
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

  // Counts searches, so people that answer late only fill in their own search.
  int _searchRun = 0;

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

    if (trimmed.isEmpty) {
      _results = const [];
      _seerrResults = const [];
      _gameResults = const [];
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
      final gamesFuture = _scopedParentId != null
          ? Future.value(const <GameSearchResult>[])
          : _fetchGameResults(query);

      final (groups, peopleFuture) = _scopedParentId != null
          ? (
              await Future.wait(
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
              Future.value(const <AggregatedItem>[]),
            )
          : await _buildGroupedGlobalResults(query, activeGroups);
      final seerr = await seerrFuture;
      final games = await gamesFuture;

      // With nothing else to show, the results wait for people instead of
      // coming up empty.
      final hasOtherResults =
          groups.any((g) => g.items.isNotEmpty) ||
          seerr.isNotEmpty ||
          games.isNotEmpty;
      final people = hasOtherResults
          ? await peopleFuture
                .then<List<AggregatedItem>?>((found) => found)
                .timeout(_peopleGrace, onTimeout: () => null)
          : await peopleFuture;

      if (query != _query) return;

      _results = _withPeople(groups, people ?? const []);
      _seerrResults = seerr;
      _gameResults = games;
      _state = SearchState.ready;
      if (people == null) {
        unawaited(
          peopleFuture.then((found) {
            if (found.isEmpty || run != _searchRun || query != _query) return;
            _results = _withPeople(groups, found);
            notifyListeners();
          }),
        );
      }
    } catch (e) {
      if (query != _query) return;
      _error = e;
      _state = SearchState.error;
    }
    notifyListeners();
  }

  /// Every group in order with the People group left empty, and the people
  /// search that fills it.
  Future<(List<SearchResultGroup>, Future<List<AggregatedItem>>)>
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
    final peopleFuture = _searchEachServer(
      (repository) => repository
          .searchPeople(query, limit: _resultLimit)
          .timeout(_peopleTimeout),
      label: 'people search',
    ).then(_interleave).catchError((_) => <AggregatedItem>[]);
    final channelsFuture = _channelMatches(query);
    final perServerItems = await _searchEachServer(
      (repository) => repository.search(
        query,
        parentId: _scopedParentId,
        limit: _globalFetchLimit,
      ),
      label: 'search',
    );
    final channels = await channelsFuture;

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
      final matched = _interleave([
        for (final items in perServerItems)
          items.where((item) => group.itemTypes.contains(item.type)).toList(),
      ]).take(_resultLimit).toList();
      grouped.add(group.copyWith(items: matched));
    }

    return (grouped, peopleFuture);
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
    super.dispose();
  }
}
