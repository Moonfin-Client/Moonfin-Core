import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:dio/dio.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/lyrics.dart';
import '../models/tmdb_item_ref.dart';
import '../services/row_data_source.dart';
import '../repositories/item_mutation_repository.dart';
import '../repositories/mdblist_repository.dart';
import '../repositories/tmdb_repository.dart';
import '../repositories/seerr_repository.dart';
import '../utils/playlist_utils.dart';
import '../../preference/seerr_preferences.dart';
import '../../util/episode_playability.dart';
import '../services/plugin_sync_service.dart';
import 'seerr_media_detail_view_model.dart';

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

  // --- Playlist index ---

  /// How much of a collection the index scan will walk. Past this the playlist
  /// tab covers the head rather than the whole thing.
  static const _indexScanLimit = 2000;

  /// How many series are asked for their episodes at once during the scan.
  static const _indexScanBatchSize = 8;

  /// True while the index is being built. The playlist area shows a spinner.
  bool _playlistIndexBuilding = false;
  bool get playlistIndexBuilding => _playlistIndexBuilding;

  /// The id and sort keys of every playable item, kept so the order can change
  /// without fetching anything again. Null until the collection is scanned.
  List<_PlaylistItemIndexEntry>? _playlistIndexEntries;

  /// Ids in the order the playlist currently shows, which pages are read from.
  List<String>? _flattenedIds;

  /// Ids in the order the user arranged them, either dragged here or saved on
  /// the server. Kept apart from [_flattenedIds] so switching to another sort
  /// and back doesn't lose it.
  List<String>? _customOrderIds;

  // --- Playlist page loading ---
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

  /// The Seerr side of this title, when there is one. Null until the lookup
  /// lands, and null forever when Seerr is off or doesn't know the title.
  SeerrMediaDetailViewModel? _seerr;
  SeerrMediaDetailViewModel? get seerr => _seerr;

  /// Whether this screen stands in for a title that is not in the library, in
  /// which case there is nothing to play, mark watched or download.
  bool _isSeerrOnly = false;
  bool get isSeerrOnly => _isSeerrOnly;

  /// Only used to resolve an IMDb-keyed id by searching for it.
  String? _seerrOnlyTitle;
  set seerrOnlyTitle(String? value) => _seerrOnlyTitle = value;

  /// Resolves the Seerr side of a library item, if there is one to resolve.
  /// A miss leaves the screen exactly as it was, so nothing here ever surfaces
  /// an error.
  Future<void> _loadSeerrOverlay() async {
    final item = _item;
    if (item == null) return;
    if (item.type != 'Movie' && item.type != 'Series') return;
    if (!GetIt.instance<PluginSyncService>().seerrAvailable) return;

    // TMDB is the id Seerr speaks. IMDb goes through its search fallback.
    final tmdbId = item.tmdbId;
    final lookupId = (tmdbId != null && tmdbId.isNotEmpty)
        ? tmdbId
        : item.imdbId;
    if (lookupId == null || lookupId.isEmpty) return;

    try {
      final vm = await _ensureSeerr();
      await vm.load(
        lookupId,
        item.type == 'Series' ? 'tv' : 'movie',
        title: item.name,
      );
    } catch (_) {}
  }

  /// One child view model for the life of this one. [load] is re-entered when
  /// the viewer switches media source, and a second child would leak both a
  /// view model and its download poll timer.
  Future<SeerrMediaDetailViewModel> _ensureSeerr() async {
    final existing = _seerr;
    if (existing != null) return existing;
    final repo = await GetIt.instance.getAsync<SeerrRepository>();
    final created = SeerrMediaDetailViewModel(
      repo,
      GetIt.instance<SeerrPreferences>(),
    );
    // Disposal races the await above, so hand back a child nobody listens to
    // rather than wiring one into a dead view model.
    if (_isDisposed) return created;
    created.addListener(notifyListeners);
    _seerr = created;
    return created;
  }

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

  /// Builds the screen for a title that is not in the library at all, out of
  /// what Seerr knows about it. The shape is the same, so the layouts, the
  /// button row and the Seerr tab all work unchanged.
  Future<void> _loadSeerrOnly(TmdbItemRef ref) async {
    _isSeerrOnly = true;
    final vm = await _ensureSeerr();
    await vm.load(ref.id, ref.seerrMediaType, title: _seerrOnlyTitle);

    final state = vm.state;
    if (state.error != null || state.tmdbId == 0) {
      _errorMessage = state.error ?? 'Media not found on Seerr';
      _state = ItemDetailState.error;
      notifyListeners();
      return;
    }

    _item = AggregatedItem(
      id: itemId,
      // The convention the Seerr rows already use, which the detail screens
      // read to decide where a tap should land.
      serverId: 'seerr',
      rawData: _seerrRawData(state),
    );
    // Seerr owns the seasons here, so nothing goes looking for them on a server
    // that has never heard of this title.
    _seasons = _seerrSeasons(state);
    _state = ItemDetailState.ready;
    notifyListeners();

    // Everything else in _loadSecondary needs a library id, but ratings are
    // keyed by TMDB id, which this does have.
    unawaited(_loadRatings());
  }

  Map<String, dynamic> _seerrRawData(SeerrMediaDetailState s) {
    final date = s.releaseDate ?? s.firstAirDate;
    final year = date != null && date.length >= 4
        ? int.tryParse(date.substring(0, 4))
        : null;
    final runtimeMinutes = s.runtime;
    return {
      'Name': s.displayTitle,
      'Overview': s.overview,
      'Type': s.isTv ? 'Series' : 'Movie',
      'ProviderIds': {
        'Tmdb': '${s.tmdbId}',
        if (s.externalIds?.imdbId != null) 'Imdb': s.externalIds!.imdbId,
      },
      'PosterPath': s.posterPath,
      'BackdropPath': s.backdropPath,
      if (year != null) 'ProductionYear': year,
      'PremiereDate': s.releaseDate ?? s.firstAirDate,
      'CommunityRating': s.voteAverage,
      'Genres': [for (final g in s.genres) g.name],
      'Studios': [for (final n in s.networks) {'Name': n.name}],
      'Taglines': [?s.tagline],
      'People': [
        for (final c in s.credits?.cast ?? const [])
          {
            'Id': '${c.id}',
            'Name': c.name,
            'Role': c.character,
            'Type': 'Actor',
            'ProfilePath': c.profilePath,
          },
      ],
      if (runtimeMinutes != null && runtimeMinutes > 0)
        'RunTimeTicks': runtimeMinutes * 600000000,
      'Status': s.tvStatus,
      'ChildCount': s.numberOfSeasons,
      'SeerrMediaType': s.isTv ? 'tv' : 'movie',
      'SeerrStatus': s.mediaInfo?.status,
      'UserData': const {'Played': false, 'IsFavorite': false},
      'MediaSources': const [],
      'MediaStreams': const [],
      'CanDelete': false,
    };
  }

  List<AggregatedItem> _seerrSeasons(SeerrMediaDetailState s) => [
        for (final season in s.tv?.seasons ?? const [])
          if (season.seasonNumber > 0)
            AggregatedItem(
              id: '${itemId}:s${season.seasonNumber}',
              serverId: 'seerr',
              rawData: {
                'Name': season.name ?? '',
                'Type': 'Season',
                'IndexNumber': season.seasonNumber,
                'ChildCount': season.episodeCount,
              },
            ),
      ];

  Future<void> load({String? mediaSourceId}) async {
    _state = ItemDetailState.loading;
    _collectionItems = const [];
    _parentCollectionItems = const [];
    _parentCollectionName = null;
    _parentCollections = const [];
    _flattenedIds = null;
    _customOrderIds = null;
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
    notifyListeners();

    try {
      final tmdbRef = TmdbItemRef.tryParse(itemId);
      if (tmdbRef != null && tmdbRef.kind != TmdbItemKind.person) {
        await _loadSeerrOnly(tmdbRef);
        return;
      }
      if (tmdbRef != null) {
        final tmdbId = tmdbRef.id;
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
    // Deliberately outside the Future.wait below, so a slow Seerr server never
    // holds up library content that is already here.
    unawaited(_loadSeerrOverlay());
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

  /// Reorders the whole index and starts the list again from the top.
  ///
  /// Only a slice of the collection is loaded, so re-sorting what is on screen
  /// would leave it holding one ordering while later pages arrive in another.
  Future<void> setCollectionSort(CollectionSortOption option) async {
    if (_collectionSort == option) return;
    _collectionSort = option;
    // A saved order arrives ready to use, so the scan is only worth paying for
    // when the sort actually needs the keys.
    if (option != CollectionSortOption.custom) {
      await _ensurePlaylistIndexEntries();
    }
    _rebuildFlattenedIds();
    _resetPlaylistPaging();
    notifyListeners();
    await loadMorePlaylistItems();
  }

  /// Points [_flattenedIds] at the active sort. Every option lands here, so the
  /// index and the pages fetched from it can never describe different orders.
  void _rebuildFlattenedIds() {
    if (_collectionSort == CollectionSortOption.custom) {
      final custom = _customOrderIds;
      // Copied, so a later drag can't edit the saved order underneath itself.
      if (custom != null) _flattenedIds = List<String>.from(custom);
      return;
    }
    final entries = _playlistIndexEntries;
    if (entries == null || entries.isEmpty) return;
    switch (_collectionSort) {
      case CollectionSortOption.alphabetical:
        entries.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
      case CollectionSortOption.releaseAscending:
        entries.sort(_PlaylistItemIndexEntry.compareReleaseAscending);
      case CollectionSortOption.releaseDescending:
        entries.sort(
          (a, b) => _PlaylistItemIndexEntry.compareReleaseAscending(b, a),
        );
      case CollectionSortOption.custom:
        return;
    }
    _flattenedIds = entries.map((e) => e.id).toList();
  }

  /// Drops the loaded pages so the next fetch starts at the head of the index.
  void _resetPlaylistPaging() {
    _playlistItems = const [];
    _playlistFetchedCount = 0;
    _playlistHasMore = _flattenedIds?.isNotEmpty ?? false;
  }

  Future<void> reorderCollectionPlaylistItem(int oldIndex, int newIndex) async {
    if (oldIndex < 0 || oldIndex >= _playlistItems.length) return;
    if (newIndex < 0 || newIndex >= _playlistItems.length) return;

    final reordered = List<AggregatedItem>.from(_playlistItems);
    final item = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, item);
    _playlistItems = reordered;
    _collectionSort = CollectionSortOption.custom;

    // The loaded items take the head of the index in their new order and the
    // rest keep theirs. Matching on id rather than position holds up even when
    // a page came back short because the server had dropped one of them.
    final ids = _flattenedIds;
    if (ids != null) {
      final loadedIds = reordered.map((i) => i.id).toList();
      final loaded = loadedIds.toSet();
      final merged = [...loadedIds, ...ids.where((id) => !loaded.contains(id))];
      _flattenedIds = merged;
      _customOrderIds = List<String>.from(merged);
    }

    notifyListeners();

    try {
      final syncService = GetIt.instance<PluginSyncService>();
      final order = _customOrderIds;
      if (syncService.pluginAvailable && order != null) {
        // The whole order goes up, otherwise the server forgets where the items
        // that haven't been paged in yet belong.
        await syncService.saveCustomCollectionOrder(_client, itemId, order);
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
    // A server that leaves the total out would otherwise strand the grid on its
    // first page, so a full page is taken to mean there is more behind it.
    _collectionHasMore = total != null
        ? _collectionFetchedCount < _collectionTotalCount
        : newItems.length == _collectionPageSize;
    _collectionItems = [..._collectionItems, ...newItems];
    notifyListeners();
  }

  /// Puts [_flattenedIds] in place, either from a saved order or by scanning
  /// the collection, then starts the first page.
  Future<void> _buildPlaylistIndex() async {
    _playlistIndexBuilding = true;
    notifyListeners();

    try {
      // A saved order already lists movie and episode ids in story order, so it
      // can stand in for the index and skip enumerating the collection. The
      // entries only get built if the user later picks a different sort.
      final syncService = GetIt.instance<PluginSyncService>();
      if (syncService.pluginAvailable) {
        try {
          final customOrder = await syncService.fetchCustomCollectionOrder(
            _client,
            itemId,
          );
          if (customOrder != null && customOrder.isNotEmpty) {
            _customOrderIds = customOrder;
            _flattenedIds = List<String>.from(customOrder);
            _collectionSort = CollectionSortOption.custom;
          }
        } catch (_) {}
      }

      if (_flattenedIds == null) {
        await _ensurePlaylistIndexEntries();
        _collectionSort = CollectionSortOption.releaseAscending;
        _rebuildFlattenedIds();
      }

      _resetPlaylistPaging();
    } catch (_) {}

    _playlistIndexBuilding = false;
    notifyListeners();

    await loadMorePlaylistItems();
  }

  /// Walks the collection once to build [_playlistIndexEntries], the id and
  /// sort key of every playable item in it. Does nothing if they already exist.
  ///
  /// Only the keys are kept. The items themselves are read a page at a time by
  /// [_fetchPlaylistPage], so a collection of any size settles at a few KB.
  Future<void> _ensurePlaylistIndexEntries() async {
    if (_playlistIndexEntries != null) return;
    try {
      final allData = await _client.itemsApi.getItems(
        parentId: itemId,
        limit: _indexScanLimit,
        fields: 'BasicSyncInfo',
      );
      final allTopLevel = _mapItems((allData['Items'] as List?) ?? []);

      final seriesItems = allTopLevel.where((i) => i.type == 'Series').toList();
      final flat = allTopLevel
          .where(
            (i) =>
                i.type == 'Movie' ||
                i.type == 'Audio' ||
                i.type == 'Video' ||
                i.type == 'MusicVideo',
          )
          .toList();

      // A batch at a time. One request per series all at once would open as
      // many sockets as the collection has shows.
      for (var i = 0; i < seriesItems.length; i += _indexScanBatchSize) {
        final end = i + _indexScanBatchSize;
        final batch = seriesItems.sublist(
          i,
          end < seriesItems.length ? end : seriesItems.length,
        );
        final episodeLists = await Future.wait(
          batch.map((series) async {
            try {
              final epData = await _client.itemsApi.getEpisodes(series.id);
              return _mapItems((epData['Items'] as List?) ?? []);
            } catch (_) {
              return const <AggregatedItem>[];
            }
          }),
        );
        for (final episodes in episodeLists) {
          flat.addAll(episodes);
        }
      }

      _playlistIndexEntries = flat
          .map(
            (i) => _PlaylistItemIndexEntry(
              id: i.id,
              name: i.name,
              premiereDate: i.premiereDate,
              productionYear: i.productionYear,
            ),
          )
          .toList();
    } catch (_) {}
  }

  /// Reads the next run of ids into [_playlistItems].
  ///
  /// Progress is counted in index positions rather than items returned, so an
  /// id the server no longer knows about can't stall the list.
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

    // The by-id endpoint answers in whatever order it likes.
    final orderMap = {for (var i = 0; i < batch.length; i++) batch[i]: i};
    items.sort(
      (a, b) => (orderMap[a.id] ?? batch.length)
          .compareTo(orderMap[b.id] ?? batch.length),
    );

    _playlistFetchedCount += batch.length;
    _playlistHasMore = _playlistFetchedCount < ids.length;

    _playlistItems = [..._playlistItems, ...items];

    _resolveNextUp();
    notifyListeners();
  }

  /// Picks the first unwatched item, or the first item once the whole
  /// collection has been watched.
  ///
  /// Only the loaded head is visible here, so a watched head with pages still
  /// to come is left alone. Wrapping to the start then would point at item one
  /// while the next unseen one is further down.
  void _resolveNextUp() {
    if (_playlistItems.isEmpty) {
      _nextUp = null;
      return;
    }
    final unwatched = _playlistItems
        .where((item) => item.rawData['UserData']?['Played'] != true)
        .firstOrNull;
    if (unwatched != null) {
      _nextUp = unwatched;
    } else if (!_playlistHasMore) {
      _nextUp = _playlistItems.first;
    }
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
    // The child owns a download poll timer, so this is what stops it.
    _seerr?.removeListener(notifyListeners);
    _seerr?.dispose();
    _seerr = null;
    super.dispose();
  }
}
