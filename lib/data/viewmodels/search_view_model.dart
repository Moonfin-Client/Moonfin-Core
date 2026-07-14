import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
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
  SeerrRepository? _seerrRepository;

  SearchViewModel(
    this._searchRepository,
    this._client, {
    SeerrRepository? seerrRepository,
    String? scopedParentId,
  }) : _seerrRepository = seerrRepository,
       _scopedParentId =
           (scopedParentId != null && scopedParentId.isNotEmpty)
               ? scopedParentId
               : null;

  void setSeerrRepository(SeerrRepository repo) {
    _seerrRepository = repo;
  }

  ImageApi get imageApi => _client.imageApi;

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

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Timer? _debounceTimer;

  static const _debounceMs = 600;
  static const _resultLimit = 24;
  static const _globalFetchLimit = 240;

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

    try {
        final activeGroups = _scopedParentId != null
          ? _bookSearchGroups()
          : _searchGroups();
      final seerrFuture = _fetchSeerrResults(query);
      final gamesFuture = _scopedParentId != null
          ? Future.value(const <GameSearchResult>[])
          : _fetchGameResults(query);

      final groups = _scopedParentId != null
          ? await Future.wait(activeGroups.map((group) async {
              final items = await _searchRepository.search(
                query,
                includeItemTypes: group.itemTypes,
                parentId: _scopedParentId,
                limit: _resultLimit,
              );
              return group.copyWith(items: items);
            }))
          : await _buildGroupedGlobalResults(query, activeGroups);
      final seerr = await seerrFuture;
      final games = await gamesFuture;

      if (query != _query) return;

      _results = groups.where((g) => g.items.isNotEmpty).toList();
      _seerrResults = seerr;
      _gameResults = games;
      _state = SearchState.ready;
    } catch (e) {
      if (query != _query) return;
      _errorMessage = e.toString();
      _state = SearchState.error;
    }
    notifyListeners();
  }

  Future<List<SearchResultGroup>> _buildGroupedGlobalResults(
    String query,
    List<SearchResultGroup> activeGroups,
  ) async {
    final peopleFuture = _searchRepository
        .searchPeople(query, limit: _resultLimit)
        .catchError((_) => <AggregatedItem>[]);
    final channelsFuture = _channelMatches(query);
    final allItems = await _searchRepository.search(
      query,
      parentId: _scopedParentId,
      limit: _globalFetchLimit,
    );
    final people = await peopleFuture;
    final channels = await channelsFuture;

    final grouped = <SearchResultGroup>[];
    for (final group in activeGroups) {
      if (group.itemTypes.contains('Person')) {
        grouped.add(group.copyWith(items: people.take(_resultLimit).toList()));
        continue;
      }
      if (group.itemTypes.contains('LiveTvChannel')) {
        grouped.add(group.copyWith(items: channels));
        continue;
      }
      final matched = allItems
          .where((item) => group.itemTypes.contains(item.type))
          .take(_resultLimit)
          .toList();
      grouped.add(group.copyWith(items: matched));
    }

    return grouped;
  }

  // The lineup is fetched once per search session and reused across queries,
  // since /LiveTv/Channels has no search parameter of its own.
  Future<List<AggregatedItem>>? _channelsFuture;

  Future<List<AggregatedItem>> _channelMatches(String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty || q.startsWith('studio:')) return const [];
    _channelsFuture ??= _searchRepository.fetchLiveTvChannels();
    try {
      final all = await _channelsFuture!;
      return all
          .where((c) => c.name.toLowerCase().contains(q))
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
      return page.results;
    } catch (_) {
      return const [];
    }
  }

  Future<List<GameSearchResult>> _fetchGameResults(String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty || q.startsWith('studio:')) return const [];
    final gamesApi = _client.gamesApi;
    if (gamesApi == null) return const [];
    try {
      _allGamesFuture ??= _fetchAllGames(gamesApi);
      final all = await _allGamesFuture!;
      return all
          .where(
            (r) =>
                r.game.title.toLowerCase().contains(q) ||
                r.game.fileName.toLowerCase().contains(q),
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
    super.dispose();
  }
}
