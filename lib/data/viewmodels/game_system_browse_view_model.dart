import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../util/game_browse_filter.dart';
import '../../util/game_library.dart';

enum GameSystemBrowseError { unsupported, loadFailed }

/// Games-scoped state for browsing one retro-game system.
///
/// Focus nodes and responsive layout remain in the screen; API work, prepared
/// search data, debounce timers, selection, and detail caching live here so the
/// widget does not mix rendering with data orchestration.
class GameSystemBrowseViewModel extends ChangeNotifier {
  GameSystemBrowseViewModel({
    required GamesApi? gamesApi,
    required this.libraryId,
    required this.systemId,
    String? systemName,
  }) : _gamesApi = gamesApi,
       _providedSystemName = systemName?.trim();

  static const searchDebounceDuration = Duration(milliseconds: 150);
  // Descriptions should feel immediate while still ignoring a pointer merely
  // crossing a card. Full-screen backdrop work can wait until navigation has
  // clearly settled so normal browsing does not churn blurred backgrounds.
  static const detailDebounceDuration = Duration(milliseconds: 75);
  static const backdropDebounceDuration = Duration(milliseconds: 650);
  static const detailCacheCapacity = 128; // max limit for LRU cache. Semi-arbitrary and tunable if issues arise

  final GamesApi? _gamesApi;
  final String libraryId;
  final String systemId;
  final String? _providedSystemName;

  bool loading = true;
  GameSystemBrowseError? error;
  String selectedLetter = '';
  String appliedSearchQuery = '';
  String? resolvedSystemName;
  List<GameSummary> games = const [];
  List<GameSummary> visibleGames = const [];
  Map<String, String> displayTitles = const {};
  Map<String, GameBrowseTextIndex> _browseIndexes = const {};
  final Map<String, GameDetail> gameDetails = {};
  final Map<String, Future<GameDetail?>> _detailRequests = {};
  GameSummary? activeGame;
  GameSummary? hudGame;
  GameSummary? backdropGame;
  Timer? _detailDebounce;
  Timer? _backdropDebounce;
  Timer? _searchDebounce;
  bool _disposed = false;

  String get displaySystemName => _providedSystemName?.isNotEmpty == true
      ? _providedSystemName!
      : (resolvedSystemName ?? systemId);

  Future<void> load() async {
    loading = true;
    error = null;
    _notify();

    final api = _gamesApi;
    if (api == null) {
      loading = false;
      error = GameSystemBrowseError.unsupported;
      _notify();
      return;
    }

    try {
      final systemNameFuture = _providedSystemName?.isNotEmpty == true
          ? null
          : _resolveSystemName(api);
      final loadedGames = await api.getGames(libraryId, system: systemId);
      final loadedDisplayTitles = {
        for (final game in loadedGames)
          game.id: gameDisplayTitle(game.title, game.fileName),
      };
      final loadedIndexes = {
        for (final game in loadedGames)
          game.id: GameBrowseTextIndex(
            loadedDisplayTitles[game.id]!,
            alternateText: game.fileName,
          ),
      };
      loadedGames.sort(
        (a, b) => loadedIndexes[a.id]!.sortKey.compareTo(
          loadedIndexes[b.id]!.sortKey,
        ),
      );

      games = loadedGames;
      displayTitles = loadedDisplayTitles;
      _browseIndexes = loadedIndexes;
      resolvedSystemName = systemNameFuture == null
          ? null
          : await systemNameFuture;
      activeGame = null;
      hudGame = null;
      backdropGame = null;
      loading = false;
      _rebuildVisibleGames();
      _notify();
    } catch (exception) {
      debugPrint(
        '[GameSystemBrowseViewModel] Failed to load games: $exception',
      );
      loading = false;
      error = GameSystemBrowseError.loadFailed;
      _notify();
    }
  }

  void updateSearch(String query) {
    _searchDebounce?.cancel();
    if (query.isEmpty) {
      appliedSearchQuery = '';
      _rebuildVisibleGames();
      _notify();
      return;
    }
    if (appliedSearchQuery.isEmpty && selectedLetter.isNotEmpty) {
      selectedLetter = '';
      _rebuildVisibleGames();
      _notify();
    }
    _searchDebounce = Timer(searchDebounceDuration, () {
      appliedSearchQuery = query;
      _rebuildVisibleGames();
      _notify();
    });
  }

  void selectLetter(String letter) {
    selectedLetter = letter;
    _rebuildVisibleGames();
    _notify();
  }

  void activateGame(
    GameSummary game, {
    required bool showBackdrop,
    required bool loadDetails,
  }) {
    if (activeGame?.id != game.id) {
      activeGame = game;
      _notify();
    }
    _detailDebounce?.cancel();
    _backdropDebounce?.cancel();
    if (loadDetails) {
      _detailDebounce = Timer(detailDebounceDuration, () {
        unawaited(_showHudAfterDetails(game));
      });
    }
    if (showBackdrop) {
      _backdropDebounce = Timer(backdropDebounceDuration, () {
        if (activeGame?.id != game.id) return;
        backdropGame = game;
        _notify();
      });
    }
  }

  void deactivateGame(GameSummary game) {
    if (activeGame?.id != game.id) return;
    clearActiveGame();
  }

  void clearActiveGame() {
    _detailDebounce?.cancel();
    _backdropDebounce?.cancel();
    if (activeGame == null && hudGame == null && backdropGame == null) return;
    activeGame = null;
    hudGame = null;
    backdropGame = null;
    _notify();
  }

  void _rebuildVisibleGames() {
    final queryWords = gameBrowseQueryWords(appliedSearchQuery);
    visibleGames = games
        .where(
          (game) =>
              _browseIndexes[game.id]?.matches(
                queryWords: queryWords,
                letter: selectedLetter,
              ) ??
              true,
        )
        .toList(growable: false);
    final activeId = activeGame?.id;
    if (activeId != null && !visibleGames.any((game) => game.id == activeId)) {
      _detailDebounce?.cancel();
      _backdropDebounce?.cancel();
      activeGame = null;
      hudGame = null;
      backdropGame = null;
    }
  }

  Future<String?> _resolveSystemName(GamesApi api) async {
    try {
      final systems = await api.getSystems(libraryId);
      for (final system in systems) {
        if (system.id.toLowerCase() == systemId.toLowerCase()) {
          return system.name;
        }
      }
    } catch (exception) {
      debugPrint(
        '[GameSystemBrowseViewModel] Failed to resolve system name: '
        '$exception',
      );
    }
    return null;
  }

  Future<void> _showHudAfterDetails(GameSummary game) async {
    await _loadGameDetails(game);
    if (activeGame?.id != game.id) return;
    hudGame = game;
    _notify();
  }

  Future<GameDetail?> _loadGameDetails(GameSummary game) {
    final cached = gameDetails.remove(game.id);
    if (cached != null) {
      // Map preserves insertion order, so reinsert cache hits to maintain LRU.
      gameDetails[game.id] = cached;
      return Future.value(cached);
    }

    final pending = _detailRequests[game.id];
    if (pending != null) return pending;

    final api = _gamesApi;
    if (api == null) return Future.value();

    late final Future<GameDetail?> request;
    request = _fetchGameDetails(api, game).whenComplete(() {
      if (identical(_detailRequests[game.id], request)) {
        _detailRequests.remove(game.id);
      }
    });
    _detailRequests[game.id] = request;
    return request;
  }

  Future<GameDetail?> _fetchGameDetails(GamesApi api, GameSummary game) async {
    try {
      final detail = await api.getGame(libraryId, game.id);
      if (detail == null) return null;
      gameDetails.remove(game.id);
      gameDetails[game.id] = detail;
      if (gameDetails.length > detailCacheCapacity) {
        gameDetails.remove(gameDetails.keys.first);
      }
      return detail;
    } catch (exception) {
      debugPrint(
        '[GameSystemBrowseViewModel] Failed to load game details: $exception',
      );
      return null;
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _detailDebounce?.cancel();
    _backdropDebounce?.cancel();
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }
}
