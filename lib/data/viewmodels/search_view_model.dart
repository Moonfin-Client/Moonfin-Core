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
  SeerrRepository? _seerrRepository;

  SearchViewModel(
    this._searchRepository,
    this._client, {
    SeerrRepository? seerrRepository,
    String? scopedParentId,
    MultiServerRepository? multiServerRepository,
    PluginSyncService? pluginSync,
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

      if (query != _query) return;

      _results = _withPeople(groups, people ?? const []);
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
      return matchChannels(all, query, limit: _resultLimit);
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
    super.dispose();
  }
}

/// The channels in [lineup] that [query] finds, at most [limit] of them.
///
/// A query that is not a channel number matches names only, in lineup order.
/// One that is (`6`, `105`, `2.1`, `2-1`) also looks at numbers, and the
/// channels come in this order, each listed once at its first match: the
/// number is the query (`7` finds 7 and 007), the name contains it (in lineup
/// order), the number starts with it (`2` finds 2.1 and 20), the number
/// contains it (`2` finds 12). Numbers sort by the whole numbers between the
/// dots, so 2.2 comes before 2.10, and channels on the same number keep their
/// lineup order.
@visibleForTesting
List<AggregatedItem> matchChannels(
  List<AggregatedItem> lineup,
  String query, {
  required int limit,
}) {
  final q = foldForSearch(query.trim());
  if (q.isEmpty) return const [];
  final wanted = _queriedChannelNumber(q);
  if (wanted == null) {
    return lineup
        .where((c) => foldForSearch(c.name).contains(q))
        .take(limit)
        .toList();
  }
  final found =
      <({_ChannelMatch match, List<int>? number, AggregatedItem channel})>[];
  for (final channel in lineup) {
    final number = _channelNumberSegments(channel.channelNumber);
    final digits = number?.join('.');
    final _ChannelMatch match;
    if (number != null &&
        _compareChannelNumbers(number, wanted.segments) == 0) {
      match = _ChannelMatch.number;
    } else if (foldForSearch(channel.name).contains(q)) {
      match = _ChannelMatch.name;
    } else if (digits != null && digits.startsWith(wanted.text)) {
      match = _ChannelMatch.numberStart;
    } else if (digits != null && digits.contains(wanted.text)) {
      match = _ChannelMatch.numberPart;
    } else {
      continue;
    }
    found.add((match: match, number: number, channel: channel));
  }
  // Stable, so names keep the lineup order, and so do channels on the same
  // number, which is server by server when several are searched.
  mergeSort(
    found,
    compare: (a, b) {
      if (a.match != b.match) return a.match.index.compareTo(b.match.index);
      if (a.match == _ChannelMatch.name) return 0;
      return _compareChannelNumbers(a.number!, b.number!);
    },
  );
  return [for (final f in found.take(limit)) f.channel];
}

/// How a channel matched a channel-number search, best first.
enum _ChannelMatch { number, name, numberStart, numberPart }

// Digits with `.` or `-` between subchannel parts, and one trailing separator
// allowed so `2.` still searches while `2.1` is being typed.
final _channelNumberQuery = RegExp(r'^\d+(?:[.-]\d+)*[.-]?$');
final _digitsOnly = RegExp(r'^\d+$');

/// [query] read as a channel number: its whole numbers, and the text the
/// lineup's numbers are searched for, as typed but with `-` taken as `.`.
/// Null when it is not one, or when a part is too long for an int.
({List<int> segments, String text})? _queriedChannelNumber(String query) {
  if (!_channelNumberQuery.hasMatch(query)) return null;
  final text = query.replaceAll('-', '.');
  final segments = _channelNumberSegments(
    text.endsWith('.') ? text.substring(0, text.length - 1) : text,
  );
  return segments == null ? null : (segments: segments, text: text);
}

// The whole numbers between the dots, the way the guide reads a channel
// number (LiveTvGuideViewModel._numberSegments), except that `-` counts as
// `.` and only plain digits are taken. Null for any other shape.
List<int>? _channelNumberSegments(String? number) {
  if (number == null) return null;
  final segments = <int>[];
  for (final part in number.replaceAll('-', '.').split('.')) {
    final value = _digitsOnly.hasMatch(part) ? int.tryParse(part) : null;
    if (value == null) return null;
    segments.add(value);
  }
  return segments;
}

// Segment by segment, a missing one counting as 0, like the guide's channel
// order: 2 < 2.1 < 2.2 < 2.10 < 20.
int _compareChannelNumbers(List<int> a, List<int> b) {
  final len = max(a.length, b.length);
  for (var i = 0; i < len; i++) {
    final va = i < a.length ? a[i] : 0;
    final vb = i < b.length ? b[i] : 0;
    if (va != vb) return va.compareTo(vb);
  }
  return 0;
}
