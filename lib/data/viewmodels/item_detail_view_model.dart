import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:dio/dio.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/lyrics.dart';
import '../services/row_data_source.dart';
import '../repositories/item_mutation_repository.dart';
import '../repositories/mdblist_repository.dart';
import '../repositories/tmdb_repository.dart';
import '../repositories/seerr_repository.dart';
import '../utils/playlist_utils.dart';
import '../../util/episode_playability.dart';
import '../services/plugin_sync_service.dart';

enum CollectionSortOption {
  alphabetical,
  releaseAscending,
  releaseDescending,
  custom,
}

/// Lightweight metadata entry used to build and re-sort the flat playlist index
/// without holding full [AggregatedItem] objects in memory.
class _PlaylistItemIndexEntry {
  final String id;
  final String name;
  final DateTime? premiereDate;
  final int? productionYear;

  const _PlaylistItemIndexEntry({
    required this.id,
    required this.name,
    this.premiereDate,
    this.productionYear,
  });

  static int compareReleaseAscending(
    _PlaylistItemIndexEntry a,
    _PlaylistItemIndexEntry b,
  ) {
    final aDate =
        a.premiereDate ??
        (a.productionYear != null ? DateTime(a.productionYear!) : null);
    final bDate =
        b.premiereDate ??
        (b.productionYear != null ? DateTime(b.productionYear!) : null);
    if (aDate == null && bDate == null) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    }
    if (aDate == null) return 1;
    if (bDate == null) return -1;
    final byDate = aDate.compareTo(bDate);
    if (byDate != 0) return byDate;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  }
}

enum ItemDetailState { loading, ready, error }

/// Why a delete request failed.
///
/// [detail] is a short status line safe to show the user. The raw response
/// body never travels here because it can leak server paths.
class DeleteItemFailure {
  final int? statusCode;
  final String? detail;

  const DeleteItemFailure({this.statusCode, this.detail});
}

class ParentCollection {
  final String id;
  final String name;
  final List<AggregatedItem> items;

  ParentCollection({required this.id, required this.name, required this.items});
}

class ItemDetailViewModel extends ChangeNotifier {
  static const _episodeOverviewFields = 'Overview,RunTimeTicks,UserData';

  final MediaServerClient _client;
  final ItemMutationRepository _mutations;
  final MdbListRepository _mdbListRepository;
  final TmdbRepository _tmdbRepository;

  final String itemId;

  ItemDetailState _state = ItemDetailState.loading;
  ItemDetailState get state => _state;

  AggregatedItem? _item;
  AggregatedItem? get item => _item;

  String? _localPersonId;
  String? get localPersonId => _localPersonId;

  int? _selectedAudioIndex;
  int? get selectedAudioIndex => _selectedAudioIndex;
  set selectedAudioIndex(int? value) {
    if (_selectedAudioIndex != value) {
      _selectedAudioIndex = value;
      GetIt.instance<UserPreferences>().setItemAudioStreamIndex(itemId, value);
      notifyListeners();
    }
  }

  int? _selectedSubtitleIndex;
  int? get selectedSubtitleIndex => _selectedSubtitleIndex;
  set selectedSubtitleIndex(int? value) {
    if (_selectedSubtitleIndex != value) {
      _selectedSubtitleIndex = value;
      GetIt.instance<UserPreferences>().setItemSubtitleStreamIndex(itemId, value);
      notifyListeners();
    }
  }

  List<AggregatedItem> _similar = const [];
  List<AggregatedItem> get similar => _similar;

  List<AggregatedItem> _filmography = const [];
  List<AggregatedItem> get filmography => _filmography;

  List<AggregatedItem> _seasons = const [];
  List<AggregatedItem> get seasons => _seasons;

  List<AggregatedItem> _episodes = const [];
  List<AggregatedItem> get episodes => _episodes;

  List<AggregatedItem> _seriesEpisodes = const [];
  bool _seriesEpisodesRequested = false;

  /// All episodes of a Series across every season, in the server's
  /// season/episode order. Empty until [loadAllSeriesEpisodes] completes.
  List<AggregatedItem> get seriesEpisodes => _seriesEpisodes;

  AggregatedItem? _nextUp;
  AggregatedItem? get nextUp => _nextUp;

  Map<String, double> _ratings = const {};
  Map<String, double> get ratings => _ratings;

  List<AggregatedItem> _albums = const [];
  List<AggregatedItem> get albums => _albums;

  List<AggregatedItem> _tracks = const [];
  List<AggregatedItem> get tracks => _tracks;

  List<AggregatedItem> _collectionItems = const [];
  List<AggregatedItem> get collectionItems => _collectionItems;

  // --- Collection grid pagination state ---
  static const _collectionPageSize = 50;

  /// Items fetched so far for the grid (startIndex).
  int _collectionFetchedCount = 0;
  int _collectionTotalCount = 0;
  bool _collectionHasMore = false;
  bool _collectionLoadingMore = false;

  // --- Playlist flat-ID index (Phase 1) ---
  //
  // Phase 1 fetches all BoxSet top-level items + episode IDs with minimal
  // fields to build a lightweight ordered list of IDs.  Full item data is
  // fetched lazily in Phase 3.

  /// True while the flat ID index is being built.  The Playlist area shows a
  /// spinner during this phase.
  bool _playlistIndexBuilding = false;
  bool get playlistIndexBuilding => _playlistIndexBuilding;

  /// Lightweight metadata entries used for re-sorting index without fetching full items.
  List<_PlaylistItemIndexEntry>? _playlistIndexEntries;

  /// Flat ordered list of movie/episode IDs for the play queue.
  /// Null until Phase 1 completes.  After that, Phase 3 pages through it.
  /// When a plugin-saved custom order exists (Strategy B), this is
  /// initialised directly from that order.  Otherwise built by sorting all
  /// movies + episodes by release date (Strategy A).
  List<String>? _flattenedIds;

  // --- Playlist page loading (Phase 3) ---
  static const _playlistPageSize = 50;
  int _playlistFetchedCount = 0;
  bool _playlistHasMore = false;
  bool _playlistLoadingMore = false;

  bool get playlistLoadingMore => _playlistLoadingMore;

  // Cached BoxSet cast/crew, rebuilt only when _collectionItems changes.
  List<AggregatedItem>? _boxSetPeopleSource;
  List<Map<String, dynamic>> _boxSetDirectors = const [];
  List<Map<String, dynamic>> _boxSetWriters = const [];
  List<Map<String, dynamic>> _boxSetActors = const [];

  void _ensureBoxSetPeople() {
    if (identical(_boxSetPeopleSource, _collectionItems)) return;
    _boxSetPeopleSource = _collectionItems;

    final directors = <Map<String, dynamic>>[];
    final writers = <Map<String, dynamic>>[];
    final actors = <Map<String, dynamic>>[];
    final dirNames = <String>{};
    final writNames = <String>{};
    final actorNames = <String>{};

    for (final child in _collectionItems) {
      final people = child.rawData['People'] as List?;
      if (people == null) continue;
      for (final person in people.cast<Map<String, dynamic>>()) {
        final name = person['Name'] as String?;
        if (name == null) continue;
        switch (person['Type']) {
          case 'Director':
            if (dirNames.add(name)) directors.add(person);
          case 'Writer':
            if (writNames.add(name)) writers.add(person);
        }
      }
    }
    for (final child in _collectionItems) {
      final people = child.rawData['People'] as List?;
      if (people == null) continue;
      for (final person in people.cast<Map<String, dynamic>>()) {
        final type = person['Type'] as String?;
        if (type != 'Actor' && type != 'GuestStar') continue;
        final name = person['Name'] as String?;
        if (name == null ||
            dirNames.contains(name) ||
            writNames.contains(name)) {
          continue;
        }
        if (actorNames.add(name)) actors.add(person);
      }
    }

    _boxSetDirectors = directors;
    _boxSetWriters = writers;
    _boxSetActors = actors;
  }

  List<AggregatedItem> _playlistItems = const [];
  List<AggregatedItem> get playlistItems => _playlistItems;

  CollectionSortOption _collectionSort = CollectionSortOption.releaseAscending;
  CollectionSortOption get collectionSort => _collectionSort;

  List<AggregatedItem> _customPlaylistItems = const [];

  String? _parentCollectionName;
  String? get parentCollectionName => _parentCollectionName;

  List<AggregatedItem> _parentCollectionItems = const [];
  List<AggregatedItem> get parentCollectionItems => _parentCollectionItems;

  List<ParentCollection> _parentCollections = const [];
  List<ParentCollection> get parentCollections => _parentCollections;

  List<AggregatedItem> _features = const [];
  List<AggregatedItem> get features => _features;

  LyricsData _lyrics = LyricsData.empty;
  LyricsData get lyrics => _lyrics;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ImageApi get imageApi => _client.imageApi;
  String get baseUrl => _client.baseUrl;

  bool get canManagePlaylistTracks =>
      _item?.type == 'Playlist' &&
      _tracks.isNotEmpty &&
      _tracks.every(hasPlaylistEntryId);

  final String? _serverId;
  bool _isDisposed = false;

  ItemDetailViewModel({
    required this.itemId,
    String? serverId,
    required MediaServerClient client,
    required ItemMutationRepository mutations,
    required MdbListRepository mdbListRepository,
    required TmdbRepository tmdbRepository,
  }) : _serverId = serverId,
       _client = client,
       _mutations = mutations,
       _mdbListRepository = mdbListRepository,
       _tmdbRepository = tmdbRepository;

  Future<void> load({String? mediaSourceId}) async {
    _state = ItemDetailState.loading;
    _collectionItems = const [];
    _parentCollectionItems = const [];
    _parentCollectionName = null;
    _parentCollections = const [];
    _flattenedIds = null;
    _playlistIndexEntries = null;
    _collectionFetchedCount = 0;
    _collectionTotalCount = 0;
    _collectionHasMore = false;
    _collectionLoadingMore = false;
    _playlistIndexBuilding = false;
    _playlistFetchedCount = 0;
    _playlistHasMore = false;
    _playlistLoadingMore = false;
    _playlistItems = const [];
    _customPlaylistItems = const [];
    notifyListeners();

    try {
      if (itemId.startsWith('tmdb:')) {
        final tmdbId = itemId.substring(5);
        final seerrRepo = await GetIt.instance.getAsync<SeerrRepository>();
        await seerrRepo.ensureInitialized();
        final tmdbIdInt = int.tryParse(tmdbId);
        if (tmdbIdInt == null) throw Exception('Invalid TMDB ID');
        final seerrPerson = await seerrRepo.getPersonDetails(tmdbIdInt);

        final rawData = {
          'Name': seerrPerson.name,
          'Overview': seerrPerson.biography,
          'ProviderIds': {'Tmdb': tmdbId},
          'Type': 'Person',
          'PrimaryImageTag': seerrPerson.profilePath,
          'ProfilePath': seerrPerson.profilePath,
          'PremiereDate': seerrPerson.birthday,
          'EndDate': seerrPerson.deathday,
        };

        _item = AggregatedItem(
          id: itemId,
          serverId: _serverId ?? _client.baseUrl,
          rawData: rawData,
        );

        try {
          final localPeople = await _client.itemsApi.getPersons(
            searchTerm: seerrPerson.name,
            limit: 20,
            fields: 'ProviderIds',
          );
          final itemsList = (localPeople['Items'] as List? ?? [])
              .map((e) => e is Map ? Map<String, dynamic>.from(e) : null)
              .whereType<Map<String, dynamic>>()
              .toList();
          for (final localItem in itemsList) {
            final localPIds = localItem['ProviderIds'] as Map?;
            if (localPIds?['Tmdb']?.toString() == tmdbId) {
              _localPersonId = localItem['Id']?.toString();
              break;
            }
          }
        } catch (_) {}

        if (_localPersonId != null) {
          try {
            final localData = await _client.itemsApi.getItem(_localPersonId!);
            final mergedData = Map<String, dynamic>.from(localData);
            if (mergedData['Overview'] == null ||
                (mergedData['Overview'] as String).isEmpty) {
              mergedData['Overview'] = seerrPerson.biography;
            }
            mergedData['ProfilePath'] = seerrPerson.profilePath;
            _item = AggregatedItem(
              id: _localPersonId!,
              serverId: _serverId ?? _client.baseUrl,
              rawData: mergedData,
            );
          } catch (_) {}
        }
      } else {
        final data = await _client.itemsApi.getItem(itemId, mediaSourceId: mediaSourceId);
        _item = AggregatedItem(
          id: itemId,
          serverId: _serverId ?? _client.baseUrl,
          rawData: data,
        );
      }
      _lyrics = LyricsData.empty;
      final prefs = GetIt.instance<UserPreferences>();
      final savedSubIndex = prefs.getItemSubtitleStreamIndex(itemId);
      _selectedSubtitleIndex = savedSubIndex == -2 ? null : savedSubIndex;
      final savedAudioIndex = prefs.getItemAudioStreamIndex(itemId);
      _selectedAudioIndex = savedAudioIndex == -2 ? null : savedAudioIndex;
      _state = ItemDetailState.ready;
      notifyListeners();

      _loadSecondary();
    } catch (e) {
      _errorMessage = e.toString();
      _state = ItemDetailState.error;
      notifyListeners();
    }
  }

  Future<void> _loadSecondary() async {
    final type = _item?.type;
    final futures = <Future>[];
    if (type == 'Person') {
      futures.add(_loadFilmography());
    } else if (type == 'Series') {
      futures.add(_loadRatings());
      futures.add(_loadSeasons());
      futures.add(_loadNextUp());
      futures.add(_loadSimilar());
      futures.add(_loadFeatures());
      futures.add(_loadParentCollection());
    } else if (type == 'Season') {
      futures.add(_loadRatings());
      futures.add(_loadEpisodes());
      futures.add(_loadFeatures());
    } else if (type == 'Episode') {
      futures.add(_loadRatings());
      futures.add(_loadEpisodes());
      futures.add(_loadSimilar());
      futures.add(_loadFeatures());
    } else if (type == 'MusicArtist') {
      futures.add(_loadAlbums());
      futures.add(_loadTracks(artistId: itemId));
      futures.add(_loadSimilar());
    } else if (type == 'MusicAlbum' || type == 'Playlist') {
      futures.add(_loadTracks());
    } else if (type == 'AudioBook') {
      futures.add(_loadRatings());
      futures.add(_loadSimilar());
    } else if (type == 'Audio') {
      futures.add(_loadLyrics());
    } else if (type == 'BoxSet') {
      futures.add(_loadCollectionItems()); // grid — Phase 2, starts immediately
      futures.add(_buildPlaylistIndex());  // playlist — Phase 1, runs concurrently
    } else if (type == 'MusicVideo' ||
        type == 'Movie' ||
        type == 'Trailer' ||
        type == 'Video') {
      futures.add(_loadRatings());
      futures.add(_loadSimilar());
      futures.add(_loadFeatures());
      if (type != 'MusicVideo') {
        futures.add(_loadParentCollection());
      }
    } else {
      futures.add(_loadRatings());
      futures.add(_loadSimilar());
    }
    await Future.wait(futures);
  }

  Future<void> _loadSeasons() async {
    try {
      final data = await _client.itemsApi.getSeasons(itemId);
      final items = (data['Items'] as List?) ?? [];
      _seasons = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadEpisodes() async {
    final item = _item;
    if (item == null) return;
    final seriesId = item.seriesId ?? itemId;
    try {
      final data = await _client.itemsApi.getEpisodes(
        seriesId,
        seasonId: item.type == 'Season' ? itemId : item.seasonId,
        fields: _episodeOverviewFields,
      );
      final items = (data['Items'] as List?) ?? [];
      _episodes = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  /// Loads every episode of the current Series (all seasons) on demand. Used by
  /// the Modern detail layout's Episodes tab and accurate season counts. No-op
  /// for non-Series items or once already loaded.
  Future<void> loadAllSeriesEpisodes() async {
    final item = _item;
    if (item == null || item.type != 'Series') return;
    if (_seriesEpisodesRequested) return;
    _seriesEpisodesRequested = true;
    try {
      final data = await _client.itemsApi.getEpisodes(
        itemId,
        fields: _episodeOverviewFields,
      );
      final items = (data['Items'] as List?) ?? [];
      _seriesEpisodes = _mapItems(items);
      notifyListeners();
    } catch (_) {
      _seriesEpisodesRequested = false;
    }
  }

  Future<void> _loadNextUp() async {
    final previousId = _nextUp?.id;
    AggregatedItem? nextUp;
    try {
      final data = await _client.itemsApi.getNextUp(
        seriesId: itemId,
        limit: 1,
        fields: _episodeOverviewFields,
      );
      final items = (data['Items'] as List?) ?? [];
      if (items.isNotEmpty) {
        final raw = items.first as Map<String, dynamic>;
        final candidate = AggregatedItem(
          id: raw['Id']?.toString() ?? '',
          serverId: _serverId ?? _client.baseUrl,
          rawData: raw,
        );
        if (isEligibleNextEpisodeCandidate(candidate)) {
          nextUp = candidate;
        }
      }
    } catch (_) {}

    _nextUp = nextUp;
    if (previousId != _nextUp?.id) {
      notifyListeners();
    }
  }

  List<AggregatedItem> _mapItems(List items) {
    return items
        .cast<Map<String, dynamic>>()
        .map(
          (raw) => AggregatedItem(
            id: raw['Id']?.toString() ?? '',
            serverId: _serverId ?? _client.baseUrl,
            rawData: raw,
          ),
        )
        .toList();
  }

  Future<void> _loadAlbums() async {
    try {
      final data = await _client.itemsApi.getItems(
        artistIds: [itemId],
        includeItemTypes: ['MusicAlbum'],
        sortBy: 'ProductionYear,SortName',
        sortOrder: 'Descending',
        recursive: true,
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
      );
      final items = (data['Items'] as List?) ?? [];
      _albums = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadTracks({String? artistId}) async {
    try {
      final data = _item?.type == 'Playlist'
          ? await _client.itemsApi.getPlaylistItems(itemId)
          : artistId != null
          ? await _client.itemsApi.getItems(
              artistIds: [artistId],
              includeItemTypes: ['Audio'],
              sortBy: 'Album,ParentIndexNumber,IndexNumber,SortName',
              recursive: true,
              fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
            )
          : await _client.itemsApi.getItems(
              parentId: itemId,
              includeItemTypes: ['Audio'],
              sortBy: 'ParentIndexNumber,IndexNumber,SortName',
              fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
            );
      final items = (data['Items'] as List?) ?? [];
      _tracks = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadLyrics() async {
    try {
      final data = await _client.itemsApi.getLyrics(itemId);
      _lyrics = LyricsData.fromJson(data);
      notifyListeners();
    } catch (_) {
      _lyrics = LyricsData.empty;
      notifyListeners();
    }
  }

  String? _playlistEntryId(AggregatedItem track) =>
      track.rawData['PlaylistItemId']?.toString();

  Future<void> removeTrackFromPlaylist(AggregatedItem track) async {
    if (_item?.type != 'Playlist') return;
    final entryId = _playlistEntryId(track);
    if (entryId == null) return;

    final previousTracks = List<AggregatedItem>.from(_tracks);
    _tracks = _tracks.where((t) {
      final sameId = t.id == track.id;
      final sameEntry = _playlistEntryId(t) == entryId;
      return !(sameId && sameEntry);
    }).toList();
    notifyListeners();

    try {
      await _client.itemsApi.removeFromPlaylist(itemId, [entryId]);
      await _loadTracks();
      await _reload();
    } catch (_) {
      _tracks = previousTracks;
      notifyListeners();
    }
  }

  Future<void> reorderPlaylistTrack(int oldIndex, int newIndex) async {
    if (_item?.type != 'Playlist') return;
    if (oldIndex < 0 || oldIndex >= _tracks.length) {
      return;
    }
    final targetIndex = newIndex;
    if (targetIndex < 0 || targetIndex >= _tracks.length) {
      return;
    }

    final moved = _tracks[oldIndex];
    final entryId = _playlistEntryId(moved);
    if (entryId == null) return;

    final previousTracks = List<AggregatedItem>.from(_tracks);
    final reordered = List<AggregatedItem>.from(_tracks);
    final item = reordered.removeAt(oldIndex);
    reordered.insert(targetIndex, item);
    _tracks = reordered;
    notifyListeners();

    try {
      await _client.itemsApi.movePlaylistItem(itemId, entryId, targetIndex);
      await _loadTracks();
    } catch (_) {
      _tracks = previousTracks;
      notifyListeners();
    }
  }

  Future<void> renamePlaylist(String name) async {
    final item = _item;
    if (item == null || item.type != 'Playlist') return;
    final trimmed = name.trim();
    if (trimmed.isEmpty || trimmed == item.name) return;

    final previous = item.name;
    final patched = Map<String, dynamic>.from(item.rawData)..['Name'] = trimmed;
    _item = AggregatedItem(
      id: item.id,
      serverId: item.serverId,
      rawData: patched,
    );
    notifyListeners();

    try {
      await _client.itemsApi.renamePlaylist(itemId, trimmed);
      await _reload();
    } catch (_) {
      final reverted = Map<String, dynamic>.from(item.rawData)
        ..['Name'] = previous;
      _item = AggregatedItem(
        id: item.id,
        serverId: item.serverId,
        rawData: reverted,
      );
      notifyListeners();
    }
  }

  /// Returns `null` when the item was deleted, otherwise why it failed.
  Future<DeleteItemFailure?> deleteItem() async {
    try {
      await _client.itemsApi.deleteItem(itemId);
      return null;
    } catch (e) {
      if (e is DioException) {
        // The body can be an HTML error page or JSON holding server paths, so
        // it gets logged instead of shown.
        debugPrint('[ItemDetailViewModel] Delete failed: ${e.response?.data}');
        return DeleteItemFailure(
          statusCode: e.response?.statusCode,
          detail: e.response?.statusMessage ?? e.message,
        );
      }
      debugPrint('[ItemDetailViewModel] Delete failed: $e');
      return const DeleteItemFailure();
    }
  }

  void setCollectionSort(CollectionSortOption option) {
    _collectionSort = option;
    _sortPlaylistIndex();
    _applyCollectionSort();
  }

  void _sortPlaylistIndex() {
    final entries = _playlistIndexEntries;
    if (entries == null || entries.isEmpty) return;
    switch (_collectionSort) {
      case CollectionSortOption.alphabetical:
        entries.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        _flattenedIds = entries.map((e) => e.id).toList();
        break;
      case CollectionSortOption.releaseAscending:
        entries.sort(_PlaylistItemIndexEntry.compareReleaseAscending);
        _flattenedIds = entries.map((e) => e.id).toList();
        break;
      case CollectionSortOption.releaseDescending:
        entries.sort(
          (a, b) => _PlaylistItemIndexEntry.compareReleaseAscending(b, a),
        );
        _flattenedIds = entries.map((e) => e.id).toList();
        break;
      case CollectionSortOption.custom:
        break;
    }
  }

  void _applyCollectionSort() {
    switch (_collectionSort) {
      case CollectionSortOption.alphabetical:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
      case CollectionSortOption.releaseAscending:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort(_releaseSortAscending);
        break;
      case CollectionSortOption.releaseDescending:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort((a, b) => _releaseSortAscending(b, a));
        break;
      case CollectionSortOption.custom:
        _playlistItems = List<AggregatedItem>.from(_customPlaylistItems);
        break;
    }
    notifyListeners();
  }

  Future<void> reorderCollectionPlaylistItem(int oldIndex, int newIndex) async {
    if (oldIndex < 0 || oldIndex >= _playlistItems.length) return;
    if (newIndex < 0 || newIndex >= _playlistItems.length) return;

    final reordered = List<AggregatedItem>.from(_playlistItems);
    final item = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, item);
    _playlistItems = reordered;
    _customPlaylistItems = reordered;
    _collectionSort = CollectionSortOption.custom;

    // Keep the flat ID index in sync so that any subsequent lazy-load pages
    // respect the new order.  If not all items are loaded yet, unloaded IDs
    // remain at the end in their previous order.
    if (_flattenedIds != null) {
      final reorderedIds = reordered.map((i) => i.id).toList();
      final unloaded = _flattenedIds!.length > reorderedIds.length
          ? _flattenedIds!.sublist(reorderedIds.length)
          : const <String>[];
      _flattenedIds = [...reorderedIds, ...unloaded];
    }

    notifyListeners();

    try {
      final syncService = GetIt.instance<PluginSyncService>();
      if (syncService.pluginAvailable && _flattenedIds != null) {
        // Send the complete _flattenedIds list so server custom order is NOT truncated!
        await syncService.saveCustomCollectionOrder(_client, itemId, _flattenedIds!);
      }
    } catch (_) {}
  }

  /// Fetches the first page of grid items.
  Future<void> _loadCollectionItems() async {
    try {
      await _fetchCollectionPage();
    } catch (_) {}
  }

  /// Fetches the next page of BoxSet top-level items for the **grid**.
  ///
  /// Grid and playlist are now independent.  This method only updates
  /// [_collectionItems]; playlist content is managed by [_buildPlaylistIndex]
  /// and [_fetchPlaylistPage].
  Future<void> _fetchCollectionPage() async {
    final data = await _client.itemsApi.getItems(
      parentId: itemId,
      startIndex: _collectionFetchedCount,
      limit: _collectionPageSize,
      fields: 'PrimaryImageAspectRatio,BasicSyncInfo,People',
    );
    final newItems = _mapItems((data['Items'] as List?) ?? []);
    final total = data['TotalRecordCount'] as int?;
    if (total != null) _collectionTotalCount = total;
    _collectionFetchedCount += newItems.length;
    _collectionHasMore = _collectionFetchedCount < _collectionTotalCount;
    _collectionItems = [..._collectionItems, ...newItems];
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Phase 1 — flat ID index build
  // ---------------------------------------------------------------------------

  /// Builds [_flattenedIds]: a lightweight ordered list of every playable item
  /// ID in the BoxSet (movies + individual episodes in release-date order, or
  /// the plugin's saved custom order when Strategy B is active).
  ///
  /// Only IDs are retained after this phase; the full [AggregatedItem] objects
  /// used for sorting are discarded immediately, keeping memory usage minimal
  /// even for collections with thousands of episodes.
  Future<void> _buildPlaylistIndex() async {
    _playlistIndexBuilding = true;
    notifyListeners();

    try {
      // Strategy B: plugin has a saved custom order — use it directly as the
      // flat ID list (it already stores movie + episode IDs in story order).
      final syncService = GetIt.instance<PluginSyncService>();
      if (syncService.pluginAvailable) {
        try {
          final customOrder = await syncService.fetchCustomCollectionOrder(
            _client,
            itemId,
          );
          if (customOrder != null && customOrder.isNotEmpty) {
            _flattenedIds = customOrder;
            _collectionSort = CollectionSortOption.custom;
          }
        } catch (_) {}
      }

      // Strategy A: no custom order — build by release date.
      if (_flattenedIds == null) {
        // Fetch ALL top-level BoxSet items with minimal fields (just IDs +
        // dates needed for sorting).  No limit; we only keep IDs.
        final allData = await _client.itemsApi.getItems(
          parentId: itemId,
          fields: 'BasicSyncInfo',
        );
        final allTopLevel = _mapItems((allData['Items'] as List?) ?? []);

        final seriesItems =
            allTopLevel.where((i) => i.type == 'Series').toList();
        final nonSeriesItems = allTopLevel
            .where(
              (i) =>
                  i.type == 'Movie' ||
                  i.type == 'Audio' ||
                  i.type == 'Video' ||
                  i.type == 'MusicVideo',
            )
            .toList();

        // Expand every series to its individual episodes.  Run in parallel.
        final episodeLists = await Future.wait(
          seriesItems.map((series) async {
            try {
              final epData = await _client.itemsApi.getEpisodes(series.id);
              return _mapItems((epData['Items'] as List?) ?? []);
            } catch (_) {
              return const <AggregatedItem>[];
            }
          }),
        );

        final flat = <AggregatedItem>[...nonSeriesItems];
        for (final episodes in episodeLists) {
          flat.addAll(episodes);
        }
        // Build lightweight index entries for memory-efficient re-sorting.
        final entries = flat
            .map(
              (i) => _PlaylistItemIndexEntry(
                id: i.id,
                name: i.name,
                premiereDate: i.premiereDate,
                productionYear: i.productionYear,
              ),
            )
            .toList();

        // Sort movies + episodes together by release date (ascending).
        entries.sort(_PlaylistItemIndexEntry.compareReleaseAscending);

        _playlistIndexEntries = entries;
        _flattenedIds = entries.map((e) => e.id).toList();
        _collectionSort = CollectionSortOption.releaseAscending;
      }

      _playlistHasMore = (_flattenedIds?.isNotEmpty) ?? false;
    } catch (_) {}

    _playlistIndexBuilding = false;
    notifyListeners();

    // Kick off the first playlist page now that the index is ready.
    if ((_flattenedIds?.isNotEmpty) ?? false) {
      await _fetchPlaylistPage();
    }
  }

  // ---------------------------------------------------------------------------
  // Phase 3 — playlist page loading
  // ---------------------------------------------------------------------------

  /// Fetches the next batch of full item data from [_flattenedIds] and appends
  /// it to [_playlistItems].  Re-sorts each batch to match the index order
  /// (the server returns items by-ID in arbitrary order).
  Future<void> _fetchPlaylistPage() async {
    final ids = _flattenedIds;
    if (ids == null || _playlistFetchedCount >= ids.length) return;

    final end = (_playlistFetchedCount + _playlistPageSize).clamp(
      0,
      ids.length,
    );
    final batch = ids.sublist(_playlistFetchedCount, end);

    final data = await _client.itemsApi.getItems(
      ids: batch,
      fields: 'PrimaryImageAspectRatio,BasicSyncInfo,People',
    );
    final items = _mapItems((data['Items'] as List?) ?? []);

    // Re-sort to match the flattenedIds order.
    final orderMap = {
      for (var i = 0; i < batch.length; i++) batch[i]: i,
    };
    items.sort(
      (a, b) => (orderMap[a.id] ?? 0).compareTo(orderMap[b.id] ?? 0),
    );

    _playlistFetchedCount += batch.length;
    _playlistHasMore = _playlistFetchedCount < ids.length;

    final combined = [..._playlistItems, ...items];
    _playlistItems = combined;
    _customPlaylistItems = List<AggregatedItem>.from(combined);

    _resolveNextUp();
    notifyListeners();
  }

  /// Resolves the Next Up item from the current [_playlistItems].
  void _resolveNextUp() {
    if (_playlistItems.isEmpty) {
      _nextUp = null;
      return;
    }
    final playedAll = _playlistItems.every(
      (item) => item.rawData['UserData']?['Played'] == true,
    );
    if (playedAll) {
      _nextUp = _playlistItems.first;
    } else {
      _nextUp = _playlistItems.firstWhere(
        (item) => item.rawData['UserData']?['Played'] != true,
        orElse: () => _playlistItems.first,
      );
    }
  }

  /// Release-ascending sort comparator used for Strategy A playlist ordering.
  static int _releaseSortAscending(AggregatedItem a, AggregatedItem b) {
    final aDate =
        a.premiereDate ??
        (a.productionYear != null ? DateTime(a.productionYear!) : null);
    final bDate =
        b.premiereDate ??
        (b.productionYear != null ? DateTime(b.productionYear!) : null);
    if (aDate == null && bDate == null) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    }
    if (aDate == null) return 1;
    if (bDate == null) return -1;
    final byDate = aDate.compareTo(bDate);
    if (byDate != 0) return byDate;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  }

  /// Called by the UI scroll listener to load the next grid page.
  Future<void> loadMoreCollectionItems() async {
    if (_collectionLoadingMore || !_collectionHasMore) return;
    _collectionLoadingMore = true;
    notifyListeners();
    try {
      await _fetchCollectionPage();
    } catch (_) {}
    _collectionLoadingMore = false;
    notifyListeners();
  }

  /// Called by the UI scroll listener to load the next playlist page.
  Future<void> loadMorePlaylistItems() async {
    if (_playlistLoadingMore || !_playlistHasMore || _playlistIndexBuilding) {
      return;
    }
    _playlistLoadingMore = true;
    notifyListeners();
    try {
      await _fetchPlaylistPage();
    } catch (_) {}
    _playlistLoadingMore = false;
    notifyListeners();
  }

  Future<void> _loadParentCollection() async {
    final item = _item;
    if (item == null) {
      _parentCollectionItems = const [];
      _parentCollectionName = null;
      _parentCollections = const [];
      notifyListeners();
      return;
    }

    try {
      final Map<String, String> boxSetIds = {};
      final ancestors = await _client.itemsApi.getAncestors(item.id);
      for (final ancestor in ancestors) {
        if (ancestor['Type'] == 'BoxSet') {
          final boxSetId = ancestor['Id']?.toString();
          final name = ancestor['Name']?.toString();
          if (boxSetId != null && boxSetId.isNotEmpty && name != null) {
            final isMember = await _boxSetContainsItem(boxSetId, item.id);
            if (isMember && !boxSetIds.containsKey(boxSetId)) {
              boxSetIds[boxSetId] = name;
            }
          }
        }
      }

      final scannedCollections = await _findParentCollectionsByScanningBoxSets(item.id);
      boxSetIds.addAll(scannedCollections);

      if (boxSetIds.isEmpty) {
        _parentCollections = const [];
        _parentCollectionItems = const [];
        _parentCollectionName = null;
        notifyListeners();
        return;
      }

      // Keep collections in a stable order so the rows and the legacy
      // single-collection fields don't shuffle around between opens.
      final entries = boxSetIds.entries.toList();
      final ordered = List<ParentCollection?>.filled(entries.length, null);
      final fetchFutures = <Future<void>>[];

      for (var i = 0; i < entries.length; i++) {
        final index = i;
        final boxSetId = entries[i].key;
        final name = entries[i].value;

        fetchFutures.add(() async {
          final data = await _client.itemsApi.getItems(
            parentId: boxSetId,
            sortBy: 'PremiereDate,SortName',
            sortOrder: 'Ascending',
            fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
          );

          final items = (data['Items'] as List?) ?? [];
          ordered[index] = ParentCollection(
            id: boxSetId,
            name: name,
            items: _sortCollectionByReleaseOrder(_mapItems(items)),
          );
        }());
      }
      await Future.wait(fetchFutures);

      final collections = ordered.whereType<ParentCollection>().toList();
      _parentCollections = collections;
      if (collections.isNotEmpty) {
        _parentCollectionName = collections.first.name;
        _parentCollectionItems = collections.first.items;
      } else {
        _parentCollectionName = null;
        _parentCollectionItems = const [];
      }

      notifyListeners();
    } catch (_) {}
  }

  Future<bool> _boxSetContainsItem(String boxSetId, String itemId) async {
    try {
      final membership = await _client.itemsApi.getItems(
        parentId: boxSetId,
        fields: 'BasicSyncInfo',
      );
      final members = (membership['Items'] as List?) ?? const [];
      return members.whereType<Map>().any((entry) {
        final map = entry.cast<String, dynamic>();
        return map['Id'] == itemId;
      });
    } catch (_) {
      return false;
    }
  }

  Future<Map<String, String>> _findParentCollectionsByScanningBoxSets(String itemId) async {
    final Map<String, String> result = {};
    try {
      const pageSize = 200;
      var startIndex = 0;

      while (true) {
        final data = await _client.itemsApi.getItems(
          includeItemTypes: ['BoxSet'],
          recursive: true,
          sortBy: 'SortName',
          fields: 'BasicSyncInfo',
          startIndex: startIndex,
          limit: pageSize,
          enableTotalRecordCount: true,
        );
        final boxSets = (data['Items'] as List?) ?? const [];
        if (boxSets.isEmpty) {
          break;
        }

        final candidates = <MapEntry<String, String>>[];
        for (final raw in boxSets.whereType<Map>()) {
          final boxSet = raw.cast<String, dynamic>();
          final boxSetId = boxSet['Id']?.toString();
          final boxSetName = boxSet['Name']?.toString();
          if (boxSetId == null || boxSetId.isEmpty || boxSetName == null) {
            continue;
          }
          candidates.add(MapEntry(boxSetId, boxSetName));
        }

        // Cap how many membership lookups run at once so a large library
        // doesn't fire a whole page of requests in one burst.
        const maxConcurrent = 12;
        for (var i = 0; i < candidates.length; i += maxConcurrent) {
          final batch = candidates.skip(i).take(maxConcurrent);
          await Future.wait(batch.map((candidate) async {
            final membership = await _client.itemsApi.getItems(
              parentId: candidate.key,
              fields: 'BasicSyncInfo',
            );
            final members = (membership['Items'] as List?) ?? const [];
            final hasItem = members.whereType<Map>().any((entry) {
              final map = entry.cast<String, dynamic>();
              return map['Id'] == itemId;
            });
            if (hasItem) {
              result[candidate.key] = candidate.value;
            }
          }));
        }

        if (boxSets.length < pageSize) {
          break;
        }
        startIndex += boxSets.length;
      }
    } catch (_) {}

    return result;
  }

  List<AggregatedItem> _sortCollectionByReleaseOrder(
    List<AggregatedItem> items,
  ) {
    final sorted = List<AggregatedItem>.from(items);
    sorted.sort((a, b) {
      final aDate = a.premiereDate;
      final bDate = b.premiereDate;
      if (aDate != null && bDate != null) {
        final byDate = aDate.compareTo(bDate);
        if (byDate != 0) {
          return byDate;
        }
      } else if (aDate != null) {
        return -1;
      } else if (bDate != null) {
        return 1;
      }

      final aYear = a.productionYear;
      final bYear = b.productionYear;
      if (aYear != null && bYear != null) {
        final byYear = aYear.compareTo(bYear);
        if (byYear != 0) {
          return byYear;
        }
      } else if (aYear != null) {
        return -1;
      } else if (bYear != null) {
        return 1;
      }

      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return sorted;
  }

  Future<void> _loadFeatures() async {
    try {
      final items = await _client.itemsApi.getSpecialFeatures(itemId);
      _features = _mapItems(
        items,
      ).where((item) => item.id != itemId).toList(growable: false);
      notifyListeners();
    } catch (_) {
      _features = const [];
      notifyListeners();
    }
  }

  Future<void> _loadFilmography() async {
    try {
      final localId = _localPersonId ?? (itemId.startsWith('tmdb:') ? null : itemId);
      if (localId == null) {
        _filmography = const [];
        notifyListeners();
        return;
      }
      final data = await _client.itemsApi.getItems(
        personIds: [localId],
        includeItemTypes: ['Movie', 'Series', 'MusicVideo', 'Episode'],
        sortBy: 'PremiereDate',
        sortOrder: 'Descending',
        recursive: true,
        limit: 100,
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
      );
      final items = (data['Items'] as List?) ?? [];
      _filmography = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadSimilar() async {
    final item = _item;
    if (item != null && (item.type == 'Movie' || item.type == 'Series')) {
      try {
        final prefs = GetIt.instance<UserPreferences>();
        final sourceSetting = prefs.get(UserPreferences.recommendationSystemSource);
        final isLocal = sourceSetting == RecommendationSystemSource.local;
        final serverId = _serverId ?? _client.baseUrl;
        final dataSource = GetIt.instance<RowDataSource>();

        final recommended = await dataSource.getRecommendations(
          serverId: serverId,
          baseItem: item,
          isLocal: isLocal,
          limit: 15,
          includeWatched: true,
        );
        // Only short-circuit when we actually have results. An empty list (e.g.
        // the online source without Seerr configured, or no local matches)
        // falls through to Jellyfin's similar-items below.
        if (recommended.isNotEmpty) {
          _similar = recommended;
          notifyListeners();
          return;
        }
      } catch (e) {
        debugPrint('[ItemDetailViewModel] Custom recommendation system failed: $e');
      }
    }

    try {
      final data = await _client.itemsApi.getSimilarItems(itemId, limit: 15);
      final items = (data['Items'] as List?) ?? [];
      _similar = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadRatings() async {
    final item = _item;
    if (item == null) return;

    if (item.type == 'Episode') {
      if (!GetIt.instance<UserPreferences>().canFetchEpisodeRatings) return;

      final seriesId = item.seriesId;
      final season = item.parentIndexNumber;
      final episode = item.indexNumber;

      if (seriesId != null && season != null && episode != null) {
        try {
          final seriesData = await _client.itemsApi.getItem(seriesId);
          final seriesTmdbId = (seriesData['ProviderIds'] as Map?)?['Tmdb']?.toString();
          if (seriesTmdbId != null && seriesTmdbId.isNotEmpty) {
            final rating = await _tmdbRepository.getEpisodeRating(
              tmdbId: seriesTmdbId,
              season: season,
              episode: episode,
            );
            if (rating != null && rating > 0) {
              _ratings = {'tmdb_episode': rating};
              notifyListeners();
            }
          }
        } catch (_) {}
      }
      return;
    }

    if (!GetIt.instance<UserPreferences>()
        .get(UserPreferences.enableAdditionalRatings)) {
      return;
    }

    final tmdbId = item.tmdbId;
    if (tmdbId == null) return;
    final mediaType = item.type ?? 'Movie';

    try {
      final result = await _mdbListRepository.getRatings(
        tmdbId: tmdbId,
        mediaType: mediaType,
      );
      if (result != null && result.isNotEmpty) {
        _ratings = result;
        notifyListeners();
      }
    } catch (_) {}
  }

  Future<void> toggleFavorite() async {
    final item = _item;
    if (item == null) return;
    final newState = !item.isFavorite;
    _applyOptimisticUpdate({'IsFavorite': newState});
    try {
      await _mutations.setFavorite(itemId, isFavorite: newState);
      await _reload();
    } catch (_) {
      _applyOptimisticUpdate({'IsFavorite': !newState});
    }
  }

  Future<void> togglePlayed() async {
    final item = _item;
    if (item == null) return;
    final newState = !item.isPlayed;
    _applyOptimisticUpdate({'Played': newState});
    try {
      await _mutations.setPlayed(itemId, isPlayed: newState);
      await _reload();
    } catch (_) {
      _applyOptimisticUpdate({'Played': !newState});
    }
  }

  void _applyOptimisticUpdate(Map<String, dynamic> userDataPatch) {
    final item = _item;
    if (item == null) return;
    final updatedRaw = Map<String, dynamic>.from(item.rawData);
    final userData = Map<String, dynamic>.from(
      (updatedRaw['UserData'] as Map?) ?? {},
    );
    userData.addAll(userDataPatch);
    updatedRaw['UserData'] = userData;
    _item = AggregatedItem(
      id: item.id,
      serverId: item.serverId,
      rawData: updatedRaw,
    );
    notifyListeners();
  }

  Future<void> _reload() async {
    try {
      final data = await _client.itemsApi.getItem(itemId);
      _item = AggregatedItem(
        id: itemId,
        serverId: _serverId ?? _client.baseUrl,
        rawData: data,
      );
      notifyListeners();
    } catch (_) {}
  }

  List<Map<String, dynamic>> get directors {
    if (_item?.type == 'BoxSet') {
      _ensureBoxSetPeople();
      return _boxSetDirectors;
    }
    return _item?.people.where((p) => p['Type'] == 'Director').toList() ?? const [];
  }

  List<Map<String, dynamic>> get writers {
    if (_item?.type == 'BoxSet') {
      _ensureBoxSetPeople();
      return _boxSetWriters;
    }
    return _item?.people.where((p) => p['Type'] == 'Writer').toList() ?? const [];
  }

  List<Map<String, dynamic>> get actors {
    if (_item?.type == 'BoxSet') {
      _ensureBoxSetPeople();
      return _boxSetActors;
    }
    final list = _item?.people ?? const [];
    final dirNames = directors.map((d) => d['Name'] as String?).toSet();
    final writNames = writers.map((w) => w['Name'] as String?).toSet();
    return list.where((p) {
      final type = p['Type'] as String?;
      if (type != 'Actor' && type != 'GuestStar') return false;
      final name = p['Name'] as String?;
      if (dirNames.contains(name) || writNames.contains(name)) return false;
      return true;
    }).toList();
  }

  List<AggregatedItem> get filmographyMovies =>
      _filmography.where((i) => i.type == 'Movie').toList();

  List<AggregatedItem> get filmographySeries =>
      _filmography.where((i) => i.type == 'Series').toList();

  List<AggregatedItem> get filmographyMusicVideos =>
      _filmography.where((i) => i.type == 'MusicVideo').toList();

  List<AggregatedItem> get filmographyEpisodes =>
      _filmography.where((i) => i.type == 'Episode').toList();

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
