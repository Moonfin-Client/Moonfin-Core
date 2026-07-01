import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/lyrics.dart';
import '../repositories/item_mutation_repository.dart';
import '../repositories/mdblist_repository.dart';
import '../repositories/tmdb_repository.dart';
import '../utils/playlist_utils.dart';
import '../../util/episode_playability.dart';
import '../services/plugin_sync_service.dart';

enum CollectionSortOption {
  alphabetical,
  releaseAscending,
  releaseDescending,
  custom,
}

enum ItemDetailState { loading, ready, error }

class ItemDetailViewModel extends ChangeNotifier {
  static const _episodeOverviewFields =
      'Overview,MediaStreams,MediaSources,RunTimeTicks,Trickplay,UserData,Chapters';

  final MediaServerClient _client;
  final ItemMutationRepository _mutations;
  final MdbListRepository _mdbListRepository;
  final TmdbRepository _tmdbRepository;

  final String itemId;

  ItemDetailState _state = ItemDetailState.loading;
  ItemDetailState get state => _state;

  AggregatedItem? _item;
  AggregatedItem? get item => _item;

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
    notifyListeners();

    try {
      final data = await _client.itemsApi.getItem(itemId, mediaSourceId: mediaSourceId);
      _item = AggregatedItem(
        id: itemId,
        serverId: _serverId ?? _client.baseUrl,
        rawData: data,
      );
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
    } else if (type == 'Season') {
      futures.add(_loadRatings());
      futures.add(_loadEpisodes());
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
      futures.add(_loadCollectionItems());
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

  Future<bool> deleteItem() async {
    try {
      await _client.itemsApi.deleteItem(itemId);
      return true;
    } catch (_) {
      return false;
    }
  }

  void setCollectionSort(CollectionSortOption option) {
    _collectionSort = option;
    _applyCollectionSort();
  }

  void _applyCollectionSort() {
    int releaseSortAscending(AggregatedItem a, AggregatedItem b) {
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

    switch (_collectionSort) {
      case CollectionSortOption.alphabetical:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
      case CollectionSortOption.releaseAscending:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort(releaseSortAscending);
        break;
      case CollectionSortOption.releaseDescending:
        _playlistItems = List<AggregatedItem>.from(_playlistItems)
          ..sort((a, b) => releaseSortAscending(b, a));
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
    notifyListeners();

    try {
      final syncService = GetIt.instance<PluginSyncService>();
      if (syncService.pluginAvailable) {
        final itemIds = reordered.map((i) => i.id).toList();
        await syncService.saveCustomCollectionOrder(_client, itemId, itemIds);
      }
    } catch (_) {}
  }

  Future<void> _loadCollectionItems() async {
    try {
      // No sortBy: keep the collection's native order instead of forcing alphabetical s
      final data = await _client.itemsApi.getItems(
        parentId: itemId,
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo,People',
      );
      final items = (data['Items'] as List?) ?? [];
      _collectionItems = _mapItems(items);
      // Render the Movies/Shows/Cast tabs as soon as the top-level items are in.
      // The per-series episode fetch below only feeds the flattened Playlist tab
      // and Next Up, so it should not block the collection from showing.
      notifyListeners();

      // Fetch each series' episodes in parallel. The list is release sorted
      // below, so fetch order does not affect the result.
      final list = <AggregatedItem>[];
      final seriesChildren = <AggregatedItem>[];
      for (final item in _collectionItems) {
        if (item.type == 'Series') {
          seriesChildren.add(item);
        } else if (item.type == 'Movie' ||
            item.type == 'Audio' ||
            item.type == 'Video' ||
            item.type == 'MusicVideo') {
          list.add(item);
        }
      }
      final episodeLists = await Future.wait(
        seriesChildren.map((series) async {
          try {
            final epData = await _client.itemsApi.getEpisodes(series.id);
            return _mapItems((epData['Items'] as List?) ?? []);
          } catch (_) {
            return const <AggregatedItem>[];
          }
        }),
      );
      for (final episodes in episodeLists) {
        list.addAll(episodes);
      }
      
      // Default to release order (ascending) sorting
      int releaseSortAscending(AggregatedItem a, AggregatedItem b) {
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
      
      list.sort(releaseSortAscending);
      
      _playlistItems = list;
      _customPlaylistItems = List<AggregatedItem>.from(list);
      _collectionSort = CollectionSortOption.releaseAscending;

      try {
        final syncService = GetIt.instance<PluginSyncService>();
        if (syncService.pluginAvailable) {
          final customOrder = await syncService.fetchCustomCollectionOrder(_client, itemId);
          if (customOrder != null && customOrder.isNotEmpty) {
            final orderMap = {for (var i = 0; i < customOrder.length; i++) customOrder[i]: i};
            list.sort((a, b) {
              final aIndex = orderMap[a.id];
              final bIndex = orderMap[b.id];
              if (aIndex == null && bIndex == null) return releaseSortAscending(a, b);
              if (aIndex == null) return 1;
              if (bIndex == null) return -1;
              return aIndex.compareTo(bIndex);
            });
            _playlistItems = list;
            _customPlaylistItems = List<AggregatedItem>.from(list);
            _collectionSort = CollectionSortOption.custom;
          }
        }
      } catch (_) {}
      
      // Resolve Next Up item
      if (_playlistItems.isNotEmpty) {
        final playedAll = _playlistItems.every((item) => item.rawData['UserData']?['Played'] == true);
        if (playedAll) {
          _nextUp = _playlistItems.first;
        } else {
          _nextUp = _playlistItems.firstWhere(
            (item) => item.rawData['UserData']?['Played'] != true,
            orElse: () => _playlistItems.first,
          );
        }
      } else {
        _nextUp = null;
      }
      
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadParentCollection() async {
    final item = _item;
    if (item == null) {
      return;
    }

    try {
      final ancestors = await _client.itemsApi.getAncestors(item.id);
      var boxSet = ancestors.firstWhere(
        (ancestor) => ancestor['Type'] == 'BoxSet',
        orElse: () => const <String, dynamic>{},
      );

      if (boxSet.isEmpty) {
        final collapsed = await _client.itemsApi.getItems(
          ids: [item.id],
          includeItemTypes: ['Movie', 'Series', 'BoxSet'],
          recursive: true,
          collapseBoxSetItems: true,
          fields: 'BasicSyncInfo',
        );
        final collapsedItems = (collapsed['Items'] as List?) ?? const [];
        boxSet = collapsedItems
            .whereType<Map>()
            .map((entry) => entry.cast<String, dynamic>())
            .firstWhere(
              (entry) => entry['Type'] == 'BoxSet',
              orElse: () => const <String, dynamic>{},
            );
      }

      final boxSetId = boxSet['Id']?.toString();
      String? resolvedBoxSetId;
      if (boxSetId != null && boxSetId.isNotEmpty) {
        final isMember = await _boxSetContainsItem(boxSetId, item.id);
        if (isMember) {
          resolvedBoxSetId = boxSetId;
        }
      }
      resolvedBoxSetId ??= await _findParentCollectionByScanningBoxSets(
        item.id,
      );
      if (resolvedBoxSetId == null || resolvedBoxSetId.isEmpty) {
        return;
      }

      final data = await _client.itemsApi.getItems(
        parentId: resolvedBoxSetId,
        sortBy: 'PremiereDate,SortName',
        sortOrder: 'Ascending',
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
      );

      final items = (data['Items'] as List?) ?? [];
      final resolvedName = (boxSetId != null && boxSetId == resolvedBoxSetId)
          ? boxSet['Name'] as String?
          : null;
      _parentCollectionName =
          resolvedName ??
          (await _client.itemsApi.getItem(resolvedBoxSetId))['Name'] as String?;
      _parentCollectionItems = _sortCollectionByReleaseOrder(_mapItems(items));
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

  Future<String?> _findParentCollectionByScanningBoxSets(String itemId) async {
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

        for (final raw in boxSets.whereType<Map>()) {
          final boxSet = raw.cast<String, dynamic>();
          final boxSetId = boxSet['Id']?.toString();
          if (boxSetId == null || boxSetId.isEmpty) {
            continue;
          }

          final membership = await _client.itemsApi.getItems(
            parentId: boxSetId,
            fields: 'BasicSyncInfo',
          );
          final members = (membership['Items'] as List?) ?? const [];
          final hasItem = members.whereType<Map>().any((entry) {
            final map = entry.cast<String, dynamic>();
            return map['Id'] == itemId;
          });
          if (hasItem) {
            return boxSetId;
          }
        }

        if (boxSets.length < pageSize) {
          break;
        }
        startIndex += boxSets.length;
      }
    } catch (_) {}

    return null;
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
      final data = await _client.itemsApi.getItems(
        personIds: [itemId],
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
    try {
      final data = await _client.itemsApi.getSimilarItems(itemId, limit: 12);
      final items = (data['Items'] as List?) ?? [];
      _similar = _mapItems(items);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _loadRatings() async {
    final item = _item;
    if (item == null) return;

    if (item.type == 'Episode') {
      final enableEpisodeRatings = GetIt.instance<UserPreferences>().get(UserPreferences.enableEpisodeRatings);
      if (!enableEpisodeRatings) return;

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
              _ratings = {'stars': rating};
              notifyListeners();
            }
          }
        } catch (_) {}
      }
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
