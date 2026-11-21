import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart' hide ImageType;
import 'package:server_silo/server_silo.dart' show SiloMediaServerClient;

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/accent_folding.dart';
import '../../util/network_errors.dart';
import '../../util/parental_rating_severity.dart';
import '../models/aggregated_item.dart';
import '../utils/blocked_ratings.dart';
import '../repositories/mdblist_repository.dart';
import '../repositories/multi_server_repository.dart';
import '../services/plugin_sync_service.dart';
import '../services/user_data_sync.dart';
import '../services/user_ratings_api.dart';
import '../utils/alphabet_bucket.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/genre_browse_utils.dart';
import '../utils/merged_copies.dart';
import '../utils/playlist_utils.dart';

enum LibraryBrowseState { loading, ready, error }

/// The filters that hold several values at once, each of which the Sort &
/// Filter panel can clear on its own.
enum LibraryFilterGroup {
  features,
  quality,
  source,
  genres,
  ratings,
  tags,
  years,
  audioLanguages,
  subtitleLanguages,
}

class LibraryBrowseViewModel extends ChangeNotifier {
  final MediaServerClient _client;
  final UserPreferences _prefs;
  final MdbListRepository _mdbListRepository;
  final String libraryId;
  final String? genreId;
  final String? studioName;
  final String? overrideName;
  final List<String>? includeItemTypes;

  /// Pins the browse to favorites for routes that only ever show those. The
  /// filter stays out of the saved preference so it cannot follow the user back
  /// to the ordinary browse of the same library.
  final bool favoritesOnly;

  /// Reads the server libraries a merged library spans. Set only for one.
  final Future<MergedLibrary> Function()? loadMergedLibrary;

  bool get isMergedBrowse => loadMergedLibrary != null;

  List<MergedLibrarySource> _mergedSources = const [];
  bool _mergedLookupComplete = false;
  List<_MergedReader> _mergedReaders = const [];

  /// The card shown for each title match key, which later copies fold into.
  final Map<String, AggregatedItem> _copyHolders = {};

  /// Holds other servers' copies back for the first server's own card. Null
  /// while a filter is on, since that server's copy could be filtered out.
  PreferredCopies? _preferredCopies;

  /// Behind the preferred copies and the copy index, kept across loads.
  _LightRead? _lightRead;

  /// Null until the background read is in.
  Map<String, List<AggregatedItem>>? _copyIndex;

  static const _pageSize = 48;
  static const _firstPageSize = 75;
  // Name and CollectionType come back as default fields, so the library lookup
  // needs none. Asking for the full set makes the server recursively count the
  // whole library before the first item can render.
  static const _libraryMetaFields = '';

  // Genres and Studios stay, since grouping reads them off every item. Ratings
  // are only wanted for the focused one, and resolveTmdbId fetches that id on
  // its own behind a cache, so the grid doesn't carry ProviderIds.
  static const _browseFields =
      'PrimaryImageAspectRatio,SortName,Type,IsFolder,UserData,CommunityRating,OfficialRating,RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,Album,AlbumId,AlbumArtist,Artists,Genres,Studios';
  // A merged browse folds copies on the provider ids, orders the servers' pages
  // by the dates the sort reads and searches the original titles.
  static const _mergedBrowseFields =
      '$_browseFields,ProviderIds,DateCreated,DateLastMediaAdded,OriginalTitle';
  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb,Banner';
  static const _imageTypeLimit = 1;

  LibraryBrowseState _state = LibraryBrowseState.loading;
  LibraryBrowseState get state => _state;

  List<AggregatedItem> _items = const [];

  // The grid reads this from its item builders, so a search would otherwise
  // rescan and reallocate the whole library several times a frame.
  List<AggregatedItem>? _searchResults;
  List<AggregatedItem>? _searchResultsSource;
  String _searchResultsQuery = '';

  // Folding costs a pass over every title, so the names are prepared once for
  // a given set of items rather than again on each keystroke.
  List<AggregatedItem>? _searchNamesSource;
  List<String> _searchNames = const [];

  List<String> get _foldedNames {
    if (!identical(_searchNamesSource, _items)) {
      _searchNames = [
        for (final item in _items) foldForSearch(_searchTextOf(item)),
      ];
      _searchNamesSource = _items;
    }
    return _searchNames;
  }

  // A merged card also answers to each copy's title, which another server can
  // hold in another language, and to the original title they share.
  String _searchTextOf(AggregatedItem item) => isMergedBrowse
      ? [
          item.sortName ?? item.name,
          for (final copy in copiesOf(item)) ...[
            copy.name,
            ?copy.rawData['OriginalTitle'] as String?,
          ],
        ].join('\n')
      : item.sortName ?? item.name;

  List<AggregatedItem> get items {
    // The server folds accents for the searches it answers, so matching here
    // has to as well or the same query finds different things depending on
    // which search box it was typed into.
    final query = foldForSearch(_searchQuery.trim());
    if (query.isEmpty) return _items;
    if (_searchResults != null &&
        _searchResultsQuery == query &&
        identical(_searchResultsSource, _items)) {
      return _searchResults!;
    }
    final names = _foldedNames;
    final matches = [
      for (var i = 0; i < _items.length; i++)
        if (names[i].contains(query)) _items[i],
    ];
    _searchResults = matches;
    _searchResultsSource = _items;
    _searchResultsQuery = query;
    return matches;
  }

  int _totalCount = 0;
  int get totalCount => _totalCount;

  int _filteredOutCount = 0;
  int _directoryCount = 0;

  /// Rows the server has handed back so far, which is where the next page
  /// starts. The rendered count drifts below this whenever a row is dropped,
  /// and paging from the rendered count would ask for a window already read.
  int _fetchedCount = 0;

  /// Server and item ids already on screen. A random sort reshuffles server
  /// side on every request, so consecutive pages are windows into different
  /// orderings and the same item comes back on several of them.
  final Set<String> _renderedItemIds = <String>{};

  bool _totalCountKnown = true;
  bool _hasMoreFromPageSize = false;

  bool get hasMore =>
      _totalCountKnown ? _items.length < _totalCount : _hasMoreFromPageSize;

  String _libraryName = '';
  String get libraryName => _libraryName;

  String? _collectionType;
  bool _initialLibraryFilterSet = false;
  bool _imageTypeSynced = false;
  bool _libraryMetaResolved = false;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;

  late LibrarySortBy _sortBy;
  LibrarySortBy get sortBy => _sortBy;

  late SortDirection _sortDirection;
  SortDirection get sortDirection => _sortDirection;

  late PlayedStatusFilter _playedFilter;
  PlayedStatusFilter get playedFilter => _playedFilter;

  late LikedStatusFilter _likedFilter;
  LikedStatusFilter get likedFilter => _likedFilter;

  /// Whether the My Rating sort can actually be served, which needs the
  /// Moonfin plugin on the server, or Silo, which keeps ratings itself.
  bool get supportsMyRatingSort =>
      !isMergedBrowse &&
      (_client is SiloMediaServerClient ||
          GetIt.instance.isRegistered<PluginSyncService>() &&
              GetIt.instance<PluginSyncService>().pluginAvailable);

  late SeriesStatusFilter _seriesFilter;
  SeriesStatusFilter get seriesFilter => _seriesFilter;

  late bool _favoriteFilter;
  bool get favoriteFilter => _favoriteFilter;

  late Set<LibraryFeatureFilter> _featureFilters;
  Set<LibraryFeatureFilter> get featureFilters => _featureFilters;

  late Set<LibraryVideoQualityFilter> _videoQualityFilters;
  Set<LibraryVideoQualityFilter> get videoQualityFilters =>
      _videoQualityFilters;

  late Set<LibraryVideoSourceFilter> _videoSourceFilters;
  Set<LibraryVideoSourceFilter> get videoSourceFilters => _videoSourceFilters;

  late Set<String> _genreFilters;
  Set<String> get genreFilters => _genreFilters;

  late Set<String> _officialRatingFilters;
  Set<String> get officialRatingFilters => _officialRatingFilters;

  late Set<String> _tagFilters;
  Set<String> get tagFilters => _tagFilters;

  late Set<String> _yearFilters;
  Set<String> get yearFilters => _yearFilters;

  late Set<String> _audioLanguageFilters;
  Set<String> get audioLanguageFilters => _audioLanguageFilters;

  late Set<String> _subtitleLanguageFilters;
  Set<String> get subtitleLanguageFilters => _subtitleLanguageFilters;

  QueryFilterValues _facetValues = QueryFilterValues.empty;

  /// What the library actually holds for the facet filters. Empty until the
  /// first read finishes, and empty for good on a server that does not answer.
  QueryFilterValues get facetValues => _facetValues;

  bool _facetsRequested = false;

  late String _letterFilter;
  String get letterFilter => _letterFilter;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Timer? _searchDebounceTimer;

  /// Whether a search is still reading the rest of the library, so finding
  /// nothing yet isn't the answer.
  bool get searchFilling => _searchFilling;
  bool _searchFilling = false;
  int _searchRun = 0;
  static const _searchLoadDelay = Duration(milliseconds: 300);

  /// Matching happens against the items already loaded, so a query that reaches
  /// past the first page needs the rest pulled in. Typing a word would abandon
  /// and restart that walk on every letter, so it waits for a pause first.
  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _searchDebounceTimer?.cancel();
    final run = ++_searchRun;
    _searchFilling = _searchQuery.trim().isNotEmpty && hasMore;
    notifyListeners();
    if (!_searchFilling) return;
    _searchDebounceTimer = Timer(_searchLoadDelay, () async {
      if (_disposed) return;
      try {
        await ensureAllItemsLoaded();
      } finally {
        if (!_disposed && run == _searchRun) {
          _searchFilling = false;
          notifyListeners();
        }
      }
    });
  }

  String? _libraryFilter;
  String? get libraryFilter => _libraryFilter;

  List<Map<String, dynamic>> _libraries = const [];
  List<Map<String, dynamic>> get libraries => _libraries;

  bool get isGenreBrowse => genreId != null;
  bool get isStudioBrowse => studioName != null;
  bool get isFilterBrowse => isGenreBrowse || isStudioBrowse;

  late ImageType _imageType;
  ImageType get imageType => _imageType;

  late PosterSize _posterSize;
  PosterSize get posterSize => _posterSize;

  late LibraryScrollDirection _scrollDirection;
  LibraryScrollDirection get scrollDirection => _scrollDirection;

  late LibraryGroupBy _groupBy;
  LibraryGroupBy get groupBy => _groupBy;

  String? _selectedCategoryTab;
  String? get selectedCategoryTab => _selectedCategoryTab;

  int _pageWalkGeneration = 0;

  /// Bumped by every [load], so a page still in flight for the list it drops
  /// (a scroll page, or the first page of a filter changed again before it
  /// came back) leaves the new list alone.
  int _listGeneration = 0;
  bool _disposed = false;

  // Grouping walks every item and sorts the keys, and the grid asks for it
  // more than once per build.
  Map<String, List<AggregatedItem>>? _groupedCategoriesCache;
  List<AggregatedItem>? _groupedCategoriesSource;
  LibraryGroupBy? _groupedCategoriesGroupBy;

  static const _catchAllCategories = {'Other', 'Unknown', 'Unrated'};

  Object? _error;
  Object? get error => _error;
  bool _isNetworkError = false;
  bool get isNetworkError => _isNetworkError;

  bool? _lastGroupCollectionsValue;

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  Map<String, double> _focusedRatings = const {};
  Map<String, double> get focusedRatings => _focusedRatings;

  /// A merged browse shows each item from its own server.
  ImageApi imageApiFor(AggregatedItem item) => _clientFor(item).imageApi;

  MediaServerClient _clientFor(AggregatedItem item) =>
      _mergedSources
          .where((source) => source.session.server.id == item.serverId)
          .firstOrNull
          ?.session
          .client ??
      _client;

  late bool _groupByType;
  bool get groupByType => _groupByType;

  final Set<String> _playlistTypeFilters = {
    'Video',
    'MusicVideo',
    'Audio',
    'AudioBook',
    'Book',
    'Photo',
    'Mixed',
  };
  Set<String> get playlistTypeFilters => _playlistTypeFilters;

  static const _playlistCategoryConcurrency = 6;

  final Map<String, String> _playlistCategoryMap = {};

  String categoryForPlaylist(AggregatedItem item) {
    return _playlistCategoryMap[item.id] ?? 'Mixed';
  }

  /// The loaded playlists the type checkboxes let through. Filtering here rather
  /// than while paging keeps ticking a box a repaint instead of a fresh load.
  List<AggregatedItem> get visiblePlaylists {
    if (!isPlaylistBrowse) return items;
    return items
        .where(
          (item) =>
              item.type != 'Playlist' ||
              _playlistTypeFilters.contains(categoryForPlaylist(item)),
        )
        .toList();
  }

  Map<String, List<AggregatedItem>> get groupedPlaylists {
    final Map<String, List<AggregatedItem>> groups = {
      'Video': [],
      'MusicVideo': [],
      'Audio': [],
      'AudioBook': [],
      'Book': [],
      'Photo': [],
      'Mixed': [],
    };
    for (final item in visiblePlaylists) {
      groups.putIfAbsent(categoryForPlaylist(item), () => []).add(item);
    }
    groups.removeWhere((key, value) => value.isEmpty);
    return groups;
  }

  Future<void> setGroupByType(bool value) async {
    if (_groupByType == value) return;
    _groupByType = value;
    await _prefs.set(UserPreferences.playlistsGroupByType, value);
    notifyListeners();
  }

  void togglePlaylistTypeFilter(String type) {
    if (_playlistTypeFilters.contains(type)) {
      // Clearing the last one would leave the page blank with no way back.
      if (_playlistTypeFilters.length == 1) return;
      _playlistTypeFilters.remove(type);
    } else {
      _playlistTypeFilters.add(type);
    }
    notifyListeners();
  }

  Future<List<AggregatedItem>> _filterLibraryItems(
    List<AggregatedItem> items, {
    required int generation,
  }) async {
    items = withoutBlockedItems(items);
    if (!isPlaylistBrowse) return items;

    // A playlist the summary can't settle costs a request of its own, so keep a
    // lid on how many are in flight at once.
    final categories = await mapBounded<AggregatedItem, String>(
      items,
      _playlistCategoryConcurrency,
      (item) => item.type != 'Playlist'
          ? Future.value(null)
          : resolvePlaylistCategory(
              _client,
              item,
              assumeNonEmptyWhenUnknown: !isMusicBrowse,
            ),
    );
    // A reload cleared the categories while these were resolving.
    if (generation != _listGeneration) return const [];

    final kept = <AggregatedItem>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final category = categories[i];
      if (category != null) {
        _playlistCategoryMap[item.id] = category;
        // A music library's playlist tab only ever listed audio.
        if (isMusicBrowse && category != 'Audio' && category != 'AudioBook') {
          continue;
        }
      }
      kept.add(item);
    }
    return kept;
  }

  void setFocusedItem(AggregatedItem? item) {
    _focusedItem = item;
    _focusedRatings = const {};
    notifyListeners();
    if (item != null) _loadFocusedRatings(item);
  }

  Future<void> _loadFocusedRatings(AggregatedItem item) async {
    if (!_prefs.get(UserPreferences.enableAdditionalRatings)) return;
    final ratings = await _mdbListRepository.getRatingsForItem(
      item,
      episodeRatingsEnabled: _prefs.canFetchEpisodeRatings,
    );
    if (ratings != null && ratings.isNotEmpty && _focusedItem?.id == item.id) {
      _focusedRatings = ratings;
      notifyListeners();
    }
  }

  LibraryBrowseViewModel({
    required this.libraryId,
    required MediaServerClient client,
    required UserPreferences prefs,
    required MdbListRepository mdbListRepository,
    this.genreId,
    this.studioName,
    this.overrideName,
    this.includeItemTypes,
    this.favoritesOnly = false,
    this.loadMergedLibrary,
  }) : _client = client,
       _prefs = prefs,
       _mdbListRepository = mdbListRepository {
    _sortBy = _prefs.get(UserPreferences.librarySortBy(_prefKey));
    _sortDirection = _prefs.get(UserPreferences.librarySortDirection(_prefKey));
    _playedFilter = _prefs.get(UserPreferences.libraryPlayedFilter(_prefKey));
    _likedFilter = _prefs.get(UserPreferences.libraryLikedFilter(_prefKey));
    _seriesFilter = _prefs.get(UserPreferences.librarySeriesFilter(_prefKey));
    _favoriteFilter =
        favoritesOnly ||
        _prefs.get(UserPreferences.libraryFavoriteFilter(_prefKey));
    _featureFilters = _readEnumSet(
      UserPreferences.libraryFeatureFilters(_prefKey),
      LibraryFeatureFilter.values,
    );
    _videoQualityFilters = _readEnumSet(
      UserPreferences.libraryVideoQualityFilters(_prefKey),
      LibraryVideoQualityFilter.values,
    );
    _videoSourceFilters = _readEnumSet(
      UserPreferences.libraryVideoSourceFilters(_prefKey),
      LibraryVideoSourceFilter.values,
    );
    _genreFilters = _prefs
        .get(UserPreferences.libraryGenreFilters(_prefKey))
        .toSet();
    _officialRatingFilters = _prefs
        .get(UserPreferences.libraryOfficialRatingFilters(_prefKey))
        .toSet();
    _tagFilters = _prefs
        .get(UserPreferences.libraryTagFilters(_prefKey))
        .toSet();
    _yearFilters = _prefs
        .get(UserPreferences.libraryYearFilters(_prefKey))
        .toSet();
    _audioLanguageFilters = _prefs
        .get(UserPreferences.libraryAudioLanguageFilters(_prefKey))
        .toSet();
    _subtitleLanguageFilters = _prefs
        .get(UserPreferences.librarySubtitleLanguageFilters(_prefKey))
        .toSet();
    _letterFilter = '';
    _groupByType = _prefs.get(UserPreferences.playlistsGroupByType);
    _imageType = _prefs.get(UserPreferences.libraryImageType(_imagePrefKey));
    _posterSize = _readScopedPosterSize();
    _lastGroupCollectionsValue = _prefs.get(UserPreferences.groupItemsIntoCollections);
    _scrollDirection = _prefs.get(
      UserPreferences.libraryScrollDirection(_imagePrefKey),
    );
    _groupBy = _prefs.get(
      UserPreferences.libraryGroupBy(_imagePrefKey),
    );
    final folderViewPref = UserPreferences.libraryFolderView(_prefKey);
    _folderViewChoice = _prefs.containsPreference(folderViewPref)
        ? _prefs.get(folderViewPref)
        : null;
    _prefs.addListener(_onPrefsChanged);
    userDataSync.addListener(_onUserDataChanged);
  }

  /// Whether anything the grid shows has been watched, favourited or rated
  /// since the items were fetched. The socket names the changed item and its
  /// season, never the series holding the unwatched count, so the grid has to
  /// ask the server about its own rows the next time it is looked at.
  bool _userDataStale = false;
  bool _syncingUserData = false;

  void _onUserDataChanged() {
    if (_disposed) return;
    final patched = userDataSync.applyAll(_items);
    if (!identical(patched, _items)) {
      _items = patched;
      notifyListeners();
    }
    if (!_syncingUserData) _userDataStale = true;
  }

  /// Does nothing until a change has actually been recorded, so coming back to
  /// the grid normally costs no request.
  Future<void> syncUserDataIfStale() async {
    if (_disposed || _syncingUserData || !_userDataStale || _items.isEmpty) {
      return;
    }
    _syncingUserData = true;
    try {
      final idsByClient = <MediaServerClient, List<String>>{};
      for (final item in _items) {
        idsByClient.putIfAbsent(_clientFor(item), () => []).add(item.id);
      }
      await Future.wait([
        for (final MapEntry(key: client, value: ids) in idsByClient.entries)
          userDataSync.refreshFromServer(client, ids),
      ]);
    } finally {
      _syncingUserData = false;
      _userDataStale = false;
    }
  }

  void _onPrefsChanged() {
    final newValue = _prefs.get(UserPreferences.groupItemsIntoCollections);
    if (_lastGroupCollectionsValue != newValue) {
      _lastGroupCollectionsValue = newValue;
      load();
    }
  }

  String get _prefKey {
    final baseKey = genreId ?? studioName ?? libraryId;
    if (includeItemTypes != null && includeItemTypes!.isNotEmpty) {
      return '${baseKey}_${includeItemTypes!.join("_")}';
    }
    return baseKey;
  }

  String get _imagePrefKey {
    if (genreId != null && libraryId.isNotEmpty) {
      return libraryId;
    }
    return _prefKey;
  }

  PosterSize _readScopedPosterSize() => isPlaylistBrowse
      ? _prefs.resolvePlaylistPosterSize()
      : _prefs.resolveLibraryPosterSize();

  void _refreshPosterSizeFromScope() {
    _posterSize = _readScopedPosterSize();
  }

  /// Loads again without the servers' titles read before, as after an item
  /// was changed or deleted, which a sort change doesn't call for.
  Future<void> refresh() {
    _lightRead = null;
    return load();
  }

  Future<void> load() async {
    // Any page walk still running belongs to the list we are about to drop.
    _pageWalkGeneration++;
    final generation = ++_listGeneration;
    // A scroll page still on its way belongs to the old list, so it shouldn't
    // hold up paging of the new one.
    _loadingMore = false;
    _state = LibraryBrowseState.loading;
    _items = const [];
    _totalCount = 0;
    _filteredOutCount = 0;
    _fetchedCount = 0;
    _renderedItemIds.clear();
    _copyHolders.clear();
    _preferredCopies = null;
    _copyIndex = null;
    _playlistCategoryMap.clear();
    _totalCountKnown = true;
    _hasMoreFromPageSize = false;
    notifyListeners();

    try {
      // Independent of the library lookup, so let it run alongside instead of
      // adding a third round trip before the first item can render.
      final imageTypeSync = _imageTypeSynced
          ? Future<void>.value()
          : _syncImageTypeFromServer().then((_) => _imageTypeSynced = true);

      if (isMergedBrowse && !_mergedLookupComplete) {
        final merged = await loadMergedLibrary!();
        if (merged.sources.isEmpty) {
          throw StateError('No server answered for $libraryId');
        }
        _libraryName = merged.name;
        _mergedSources = merged.sources;
        _collectionType = mergedLibraryType(libraryId);
        _libraryMetaResolved = true;
        // A server that didn't answer is asked again on the next load.
        _mergedLookupComplete = merged.complete;
        // Facets already read came from the servers that answered last time.
        if (_facetsRequested) {
          _facetsRequested = false;
          unawaited(ensureFacetValuesLoaded());
        }
      }

      if (isFilterBrowse) {
        _libraryName = overrideName ?? '';
        if (!_initialLibraryFilterSet) {
          _libraryFilter = libraryId.isEmpty ? null : libraryId;
          _initialLibraryFilterSet = true;
        }
        if (_libraries.isEmpty) _loadLibraries();
        if (libraryId.isNotEmpty) {
          try {
            final parentData = await _client.itemsApi
                .getItem(libraryId, fields: _libraryMetaFields);
            _collectionType = (parentData['CollectionType'] as String?)
                ?.toLowerCase();
          } catch (_) {}
        }
      }
      if (!isFilterBrowse && !_libraryMetaResolved && libraryId.isNotEmpty) {
        try {
          final parentData = await _client.itemsApi
              .getItem(libraryId, fields: _libraryMetaFields);
          _libraryName = parentData['Name'] as String? ?? '';
          _collectionType = (parentData['CollectionType'] as String?)
              ?.toLowerCase();
          _libraryMetaResolved = true;
        } catch (_) {}
      }

      if (_collectionType == null || _collectionType!.isEmpty) {
        if (includeItemTypes != null && includeItemTypes!.isNotEmpty) {
          if (includeItemTypes!.contains('Series')) {
            _collectionType = 'tvshows';
          } else if (includeItemTypes!.contains('Movie')) {
            _collectionType = 'movies';
          } else if (includeItemTypes!.contains('MusicVideo')) {
            _collectionType = 'musicvideos';
          } else if (includeItemTypes!.contains('Book')) {
            _collectionType = 'books';
          }
        }
      }

      // Folders come first until something else is picked, and a saved sort
      // these libraries don't offer goes back to that too.
      if (folderView &&
          (!_prefs.containsPreference(UserPreferences.librarySortBy(_prefKey)) ||
              !sortOptions.contains(_sortBy))) {
        _sortBy = LibrarySortBy.foldersFirst;
      } else if (!sortOptions.contains(_sortBy)) {
        _sortBy = LibrarySortBy.name;
      }

      _refreshPosterSizeFromScope();

      await imageTypeSync;
      await _fetchPage(0, generation: generation);
      if (generation != _listGeneration) return;
      _state = LibraryBrowseState.ready;
    } catch (e) {
      if (generation != _listGeneration) return;
      _error = e;
      _isNetworkError = isNetworkException(e);
      _state = LibraryBrowseState.error;
    }
    notifyListeners();
    if (isGrouping || _prefs.get(UserPreferences.showAlphabeticalFilters)) {
      unawaited(ensureAllItemsLoaded());
    }
  }

  Future<void> ensureAllItemsLoaded() async {
    final generation = ++_pageWalkGeneration;
    bool stillWanted() =>
        !_disposed && _pageWalkGeneration == generation;

    if (!stillWanted()) return;
    while (hasMore) {
      final fetchedBefore = _fetchedCount;
      await loadMore(pageSizeOverride: 300);
      if (!stillWanted()) return;
      if (_fetchedCount == fetchedBefore) break;
    }
  }

  /// Pages until an item starting with [letter] is loaded, and reports whether
  /// one ever turned up.
  Future<bool> ensureItemsLoadedForPrefix(String letter) async {
    if (letter.isEmpty || letter == 'ALL') return true;
    bool hasPrefix() =>
        _items.any((item) => matchesAlphabetBucket(item, letter));

    if (hasPrefix()) return true;

    // Take over the page walk so a background ensureAllItemsLoaded stops
    // competing for loadMore while the jump is filling in.
    final generation = ++_pageWalkGeneration;
    bool stillWanted() => !_disposed && _pageWalkGeneration == generation;

    try {
      // A server with a letter index says where the letter starts, so
      // everything up to it loads in one request instead of a walk of
      // pages (Silo). The walk below still finishes the job.
      final position = await _letterPosition(letter);
      if (!stillWanted()) return false;
      if (position != null && position >= _fetchedCount && hasMore) {
        while (_loadingMore) {
          await Future.delayed(const Duration(milliseconds: 30));
          if (!stillWanted()) return false;
        }
        await loadMore(
          pageSizeOverride: position - _fetchedCount + _pageSize,
          notify: false,
        );
      }
      while (!hasPrefix() && hasMore) {
        if (!stillWanted()) return false;
        // A scroll triggered page may be in flight, and calling loadMore now
        // would return without loading and end the walk early.
        while (_loadingMore) {
          await Future.delayed(const Duration(milliseconds: 30));
          if (!stillWanted()) return false;
        }
        final fetchedBefore = _fetchedCount;
        await loadMore(pageSizeOverride: 300, notify: false);
        if (_fetchedCount == fetchedBefore) break;
      }
    } finally {
      // The walk suppressed per page notifications, so send the one that
      // shows everything it loaded.
      if (!_disposed) notifyListeners();
    }
    return hasPrefix();
  }

  /// Where [letter]'s titles start in this list, from a server that keeps
  /// a letter index ([LetterPositionApi]), or null for any other server or
  /// when it can't say.
  Future<int?> _letterPosition(String letter) async {
    final api = _client.itemsApi;
    final parentId = _effectiveParentId;
    if (api is! LetterPositionApi || parentId == null || isMergedBrowse) {
      return null;
    }
    try {
      return await (api as LetterPositionApi).letterPosition(
        letter,
        parentId: parentId,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> loadMore({int? pageSizeOverride, bool notify = true}) async {
    if (_loadingMore || !hasMore) return;
    _loadingMore = true;
    if (notify) notifyListeners();

    final previouslyFetched = _fetchedCount;
    final generation = _listGeneration;
    try {
      await _fetchPage(
        _fetchedCount,
        generation: generation,
        pageSizeOverride: pageSizeOverride,
      );
      // Stop on a page the server had nothing left for, not on one that only
      // repeated what is already shown, which a random sort does by chance.
      // A reload in the meantime reset the count, so it says nothing here.
      if (generation == _listGeneration &&
          _fetchedCount <= previouslyFetched) {
        _totalCount = _items.length;
        _hasMoreFromPageSize = false;
      }
    } catch (_) {}

    // After a reload the flag belongs to the new list, which may already
    // have a page of its own in flight.
    if (generation != _listGeneration) return;
    _loadingMore = false;
    if (notify) notifyListeners();
  }

  /// [generation] is the list the caller started for: [load] reaches this
  /// only after awaits of its own, by when a newer load may have begun.
  Future<void> _fetchPage(
    int startIndex, {
    required int generation,
    int? pageSizeOverride,
  }) async {
    final pageSize = pageSizeOverride ?? (startIndex == 0 ? _firstPageSize : _pageSize);
    final filters = <String>[];
    if (_playedFilter == PlayedStatusFilter.watched) {
      filters.add('IsPlayed');
    } else if (_playedFilter == PlayedStatusFilter.unwatched) {
      filters.add('IsUnplayed');
    } else if (_playedFilter == PlayedStatusFilter.inProgress) {
      filters.add('IsResumable');
    }
    if (_likedFilter == LikedStatusFilter.liked) {
      filters.add('Likes');
    } else if (_likedFilter == LikedStatusFilter.disliked) {
      filters.add('Dislikes');
    }

    final seriesStatus = <String>[];
    if (_seriesFilter == SeriesStatusFilter.continuing) {
      seriesStatus.add('Continuing');
    } else if (_seriesFilter == SeriesStatusFilter.ended) {
      seriesStatus.add('Ended');
    } else if (_seriesFilter == SeriesStatusFilter.unreleased) {
      seriesStatus.add('Unreleased');
    }

    List<String>? includeTypes;
    List<String>? excludeTypes;
    bool? collapseBoxSets;
    bool recursive = true;
    String sortBy = _sortBy.apiValue;
    final isAlbumArtistBrowse =
        includeItemTypes != null &&
        includeItemTypes!.length == 1 &&
        includeItemTypes!.first == 'AlbumArtist';
    final isArtistBrowse =
        includeItemTypes != null &&
        includeItemTypes!.length == 1 &&
        includeItemTypes!.first == 'MusicArtist';
    final groupCollections = _prefs.get(UserPreferences.groupItemsIntoCollections);
    if (includeItemTypes != null) {
      includeTypes = List<String>.from(includeItemTypes!);
      if (groupCollections &&
          (includeTypes.contains('Movie') ||
              includeTypes.contains('Series'))) {
        collapseBoxSets = true;
        if (!includeTypes.contains('BoxSet')) {
          includeTypes.add('BoxSet');
        }
      }
    } else if (folderView) {
      collapseBoxSets = false;
    } else {
      switch (_collectionType) {
        case 'movies':
          if (groupCollections) {
            includeTypes = ['Movie', 'BoxSet'];
            excludeTypes = null;
            collapseBoxSets = true;
          } else {
            includeTypes = ['Movie'];
            excludeTypes = ['BoxSet'];
            collapseBoxSets = false;
          }
          break;
        case 'tvshows':
          if (groupCollections) {
            includeTypes = ['Series', 'BoxSet'];
            collapseBoxSets = true;
          } else {
            includeTypes = ['Series'];
            collapseBoxSets = false;
          }
          break;
        case 'playlists':
          includeTypes = ['Playlist'];
          break;
        case 'boxsets':
          includeTypes = ['BoxSet'];
          recursive = true;
          break;
        default:
          collapseBoxSets = false;
          break;
      }
    }

    if (isBookLibrary) {
      recursive = true;
      includeTypes = ['Book', 'Audio', 'AudioBook'];
      sortBy = 'SortName';
    } else if (folderView) {
      recursive = false;
    } else if (isHomeVideosLibrary || isMixedContentLibrary) {
      // A flat list leaves out the folders the files sit in.
      excludeTypes = {...?excludeTypes, ...kDirectoryItemTypes}.toList();
    }

    // A genre tag sits on anything the tree holds, so an unscoped browse comes
    // back with the seasons, episodes, playlists and folder rows that the genre
    // tile never counted. Libraries whose genres aren't browsable this way keep
    // whatever their own branch above chose.
    if (isGenreBrowse && includeItemTypes == null) {
      final genreTypes = switch (_collectionType) {
        'music' => const ['MusicAlbum'],
        'movies' => const ['Movie'],
        'tvshows' => const ['Series'],
        null || '' => const ['Movie', 'Series'],
        _ => null,
      };

      if (genreTypes != null) {
        final collapses = groupCollections && _collectionType != 'music';
        includeTypes = collapses ? [...genreTypes, 'BoxSet'] : [...genreTypes];
        collapseBoxSets = collapses;
        excludeTypes = kNonRootBrowseItemTypes;
      }
    }

    if (isStudioBrowse && includeItemTypes == null) {
      if (groupCollections) {
        includeTypes = ['Movie', 'Series', 'BoxSet'];
        collapseBoxSets = true;
      } else {
        includeTypes = ['Movie', 'Series'];
        collapseBoxSets = false;
      }
      excludeTypes = kNonRootBrowseItemTypes;
    }

    if (isFilterBrowse && includeItemTypes == null) {
      final currentExclude = excludeTypes ?? const <String>[];
      if (!currentExclude.contains('Episode')) {
        excludeTypes = [...currentExclude, 'Episode'];
      }
    }

    if (isAlbumArtistBrowse || isArtistBrowse) {
      includeTypes = null;
      excludeTypes = null;
      collapseBoxSets = null;
      recursive = true;
      sortBy = 'SortName';
    }

    // Plain directories come in full with the first page and everything else
    // follows by name.
    final directoriesFirst =
        folderView && _sortBy == LibrarySortBy.foldersFirst;
    if (directoriesFirst) {
      sortBy = 'SortName';
      excludeTypes = {...?excludeTypes, ...kDirectoryItemTypes}.toList();
    }
    final fetchDirectories =
        directoriesFirst && startIndex == 0 && includeTypes == null;

    // Everything the user rated loads as one page, since the plugin serves
    // ids and scores rather than a paged, sorted stream. With the endpoint
    // unreachable this stays null and the browse falls back to the normal
    // name sort instead of presenting an empty library.
    Map<String, dynamic>? myRatingResponse;
    if (_sortBy == LibrarySortBy.myRating &&
        !isAlbumArtistBrowse &&
        !isArtistBrowse) {
      myRatingResponse = startIndex == 0
          ? await _fetchAllByMyRating(
              includeItemTypes: includeTypes,
              excludeItemTypes: excludeTypes,
              filters: filters,
              fields: _browseFields,
            )
          : <String, dynamic>{
              'Items': const <dynamic>[],
              'TotalRecordCount': _items.length,
            };
    }

    final Map<String, dynamic> response;
    List<dynamic> directories = const [];
    if (myRatingResponse != null) {
      response = myRatingResponse;
    } else if (isAlbumArtistBrowse) {
      response = await _client.itemsApi.getAlbumArtists(
        parentId: _effectiveParentId,
        userId: _client.userId,
        sortBy: sortBy,
        sortOrder: _sortDirection == SortDirection.ascending
            ? 'Ascending'
            : 'Descending',
        startIndex: startIndex,
        limit: pageSize,
        recursive: recursive,
        fields: 'PrimaryImageAspectRatio,SortName',
        isFavorite: _favoriteFilter ? true : null,
      );
    } else if (isArtistBrowse) {
      response = await _client.itemsApi.getArtists(
        parentId: _effectiveParentId,
        userId: _client.userId,
        sortBy: sortBy,
        sortOrder: _sortDirection == SortDirection.ascending
            ? 'Ascending'
            : 'Descending',
        startIndex: startIndex,
        limit: pageSize,
        recursive: recursive,
        fields: 'PrimaryImageAspectRatio,SortName',
        isFavorite: _favoriteFilter ? true : null,
      );
    } else {
      final sortOrder = _sortDirection == SortDirection.ascending
          ? 'Ascending'
          : 'Descending';
      Future<Map<String, dynamic>> fetchItems(
        MediaServerClient client,
        String? parentId,
        int start,
        int limit,
        String fields,
      ) => _fetchItemsWithFallback(
        client: client,
        parentId: parentId,
        genreIds: genreId != null ? [genreId!] : null,
        studios: studioName != null ? [studioName!] : null,
        includeItemTypes: includeTypes,
        excludeItemTypes: excludeTypes,
        collapseBoxSetItems: collapseBoxSets,
        sortBy: sortBy,
        sortOrder: sortOrder,
        startIndex: start,
        limit: limit,
        recursive: recursive,
        fields: fields,
        filters: filters.isEmpty ? null : filters,
        seriesStatus: seriesStatus.isEmpty ? null : seriesStatus,
        isFavorite: _favoriteFilter ? true : null,
      );
      final lightRead = isMergedBrowse && startIndex == 0
          ? _lightReadFor(
              genreIds: genreId != null ? [genreId!] : null,
              studios: studioName != null ? [studioName!] : null,
              includeTypes: includeTypes,
              excludeTypes: excludeTypes,
              collapseBoxSets: collapseBoxSets,
              recursive: recursive,
              filters: filters.isEmpty ? null : filters,
              seriesStatus: seriesStatus.isEmpty ? null : seriesStatus,
              isFavorite: _favoriteFilter ? true : null,
            )
          : null;
      // The first server's titles alone, so a slower server's whole library
      // never holds up the first page.
      final preferred = lightRead != null && !hasActiveFilters
          ? _readPreferredCopies(lightRead)
          : null;
      final results = await Future.wait([
        if (isMergedBrowse)
          _fetchMergedPage(
            startIndex,
            pageSize,
            mergedSortComparator(sortBy, descending: sortOrder == 'Descending'),
            (source, start, limit) => fetchItems(
              source.session.client,
              source.libraryId,
              start,
              limit,
              _mergedBrowseFields,
            ),
          )
        else
          fetchItems(
            _client,
            _effectiveParentId,
            startIndex,
            pageSize,
            _browseFields,
          ),
        if (fetchDirectories)
          _getFilteredItems(
            parentId: _effectiveParentId,
            genreIds: genreId != null ? [genreId!] : null,
            studios: studioName != null ? [studioName!] : null,
            includeItemTypes: kDirectoryItemTypes,
            sortBy: 'SortName',
            sortOrder: sortOrder,
            recursive: recursive,
            fields: _browseFields,
            enableImageTypes: _imageTypes,
            imageTypeLimit: _imageTypeLimit,
            filters: filters.isEmpty ? null : filters,
            isFavorite: _favoriteFilter ? true : null,
            enableTotalRecordCount: false,
          ),
      ]);
      if (preferred != null) {
        final copies = await preferred;
        if (generation == _listGeneration) _preferredCopies = copies;
      }
      // After the first page, and not for a load already replaced, so going
      // through filters doesn't read every server's whole library each time.
      if (lightRead != null && generation == _listGeneration) {
        _joinCopyIndexWhenRead(lightRead, generation);
      }
      response = results.first;
      if (fetchDirectories) {
        directories = (results.last['Items'] as List?) ?? const [];
      }
    }

    final rawItems = (response['Items'] as List?) ?? [];
    var mapped = [...directories, ...rawItems]
        .whereType<Map>()
        .map((raw) => raw.cast<String, dynamic>())
        .map((raw) {
          final id = raw['Id']?.toString();
          if (id == null || id.isEmpty) return null;
          return AggregatedItem(
            id: id,
            serverId: raw[_mergedServerIdKey] as String? ?? _client.baseUrl,
            rawData: raw,
          );
        })
        .whereType<AggregatedItem>()
        .toList();

    var filtered = await _filterLibraryItems(mapped, generation: generation);

    // A reload while this page was on its way owns the list now. Taking the
    // page would mark its ids rendered, hiding them from the new list, and
    // move the paging offset off it.
    if (generation != _listGeneration) return;
    if (startIndex == 0) _directoryCount = directories.length;

    // Counted for every browse, not just playlists. A dropped item is gone for
    // good, so the total has to shrink with it or the grid keeps asking for
    // pages that will never arrive.
    _filteredOutCount += mapped.length - filtered.length;

    // A playlist is free to list the same item more than once, so only the
    // library browses drop repeats. A repeat means the server reshuffled
    // rather than the library holding fewer items, so the total stays as
    // reported and the dropped rows turn up on a later window.
    if (!isPlaylistBrowse) {
      filtered = filtered
          .where((item) => _renderedItemIds.add('${item.serverId}|${item.id}'))
          .toList();
    }

    // A copy joins the card already shown for its title, so the total shrinks
    // with it like any other dropped row.
    if (isMergedBrowse) {
      final folded = foldCopies(filtered, _copyHolders, _preferredCopies);
      _filteredOutCount += filtered.length - folded.length;
      // A copy waiting for a card that never came, such as one hidden from
      // this user, gets its own card once the list runs out.
      if (_preferredCopies case final preferred?
          when _mergedReaders.every((r) => r.done && r.buffer.isEmpty)) {
        final unclaimed = foldCopies(preferred.takeAllWaiting(), _copyHolders);
        _filteredOutCount -= unclaimed.length;
        folded.addAll(unclaimed);
      }
      if (_copyIndex case final index?) {
        for (final card in folded) {
          joinIndexedCopies(card, index, _copyHolders, _skipIndexedCopy);
        }
      }
      filtered = folded;
    }

    _fetchedCount = startIndex + rawItems.length;

    final totalFromServer = response['TotalRecordCount'] as int?;
    _totalCountKnown = totalFromServer != null;
    if (_totalCountKnown) {
      _totalCount = totalFromServer! + _directoryCount - _filteredOutCount;
      _hasMoreFromPageSize = _items.length + filtered.length < _totalCount;
    } else {
      _hasMoreFromPageSize = rawItems.length == pageSize;
      final loadedCount = _items.length + filtered.length;
      _totalCount = loadedCount + (_hasMoreFromPageSize ? 1 : 0);
    }

    if (startIndex == 0) {
      _items = filtered;
    } else {
      _items = [..._items, ...filtered];
    }
  }

  /// Loads every item the user rated, ordered by their score, through the
  /// plugin's ratings endpoint plus id lookups. The id fetches keep the
  /// parent, type and filter constraints so the result stays scoped to the
  /// library being browsed. Null when the endpoint is unreachable, which the
  /// caller treats as the sort being unavailable.
  Future<Map<String, dynamic>?> _fetchAllByMyRating({
    required String fields,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    List<String>? filters,
  }) async {
    final ratings = await fetchMyUserRatings(_client);
    if (ratings == null) return null;
    if (ratings.isEmpty) {
      return {'Items': const <dynamic>[], 'TotalRecordCount': 0};
    }

    final ascending = _sortDirection == SortDirection.ascending;
    final entries = ratings.entries.toList()
      ..sort((a, b) {
        final byRating = ascending
            ? a.value.compareTo(b.value)
            : b.value.compareTo(a.value);
        // Ties settle on the id so the order survives a reload.
        return byRating != 0 ? byRating : a.key.compareTo(b.key);
      });

    final byId = <String, Map<String, dynamic>>{};
    const chunkSize = 100;
    for (var i = 0; i < entries.length; i += chunkSize) {
      final chunk = [
        for (final entry in entries.skip(i).take(chunkSize)) entry.key,
      ];
      final response = await _getFilteredItems(
        ids: chunk,
        parentId: _effectiveParentId,
        genreIds: genreId != null ? [genreId!] : null,
        studios: studioName != null ? [studioName!] : null,
        recursive: true,
        includeItemTypes: includeItemTypes,
        excludeItemTypes: excludeItemTypes,
        filters: (filters?.isEmpty ?? true) ? null : filters,
        isFavorite: _favoriteFilter ? true : null,
        fields: fields,
      );
      for (final raw in (response['Items'] as List?) ?? const []) {
        if (raw is! Map) continue;
        final id = raw['Id']?.toString();
        if (id != null && id.isNotEmpty) {
          byId[id] = raw.cast<String, dynamic>();
        }
      }
    }

    final ordered = [
      for (final entry in entries)
        if (byId.containsKey(entry.key)) byId[entry.key]!,
    ];
    return {'Items': ordered, 'TotalRecordCount': ordered.length};
  }

  Future<Map<String, dynamic>> _fetchItemsWithFallback({
    MediaServerClient? client,
    String? parentId,
    List<String>? genreIds,
    List<String>? studios,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    bool? collapseBoxSetItems,
    required String sortBy,
    required String sortOrder,
    required int startIndex,
    required int limit,
    required bool recursive,
    required String fields,
    List<String>? filters,
    List<String>? seriesStatus,
    bool? isFavorite,
  }) async {
    try {
      return await _getFilteredItems(
        client: client,
        parentId: parentId,
        genreIds: genreIds,
        studios: studios,
        includeItemTypes: includeItemTypes,
        excludeItemTypes: excludeItemTypes,
        collapseBoxSetItems: collapseBoxSetItems,
        sortBy: sortBy,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: limit,
        recursive: recursive,
        fields: fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        filters: filters,
        seriesStatus: seriesStatus,
        isFavorite: isFavorite,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final isServerError = statusCode >= 500;
      if (!isServerError) {
        rethrow;
      }

      final fallbackSort = sortBy.toLowerCase().contains('isfolder')
          ? 'SortName'
          : sortBy;

      return _getFilteredItems(
        client: client,
        parentId: parentId,
        genreIds: genreIds,
        studios: studios,
        includeItemTypes: includeItemTypes,
        excludeItemTypes: excludeItemTypes,
        collapseBoxSetItems: collapseBoxSetItems,
        sortBy: fallbackSort,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: limit,
        recursive: recursive,
        fields: fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        filters: filters,
        seriesStatus: seriesStatus,
        isFavorite: isFavorite,
        enableTotalRecordCount: false,
      );
    }
  }

  /// The rating is checked here rather than when the index is read, so the
  /// index can be kept when the viewer changes what they block.
  bool _skipIndexedCopy(AggregatedItem copy) =>
      _renderedItemIds.contains('${copy.serverId}|${copy.id}') ||
      withoutBlockedItems([copy]).isEmpty;

  void _joinCopyIndexWhenRead(_LightRead read, int generation) {
    unawaited(
      read
          .index()
          .then((index) {
            // Another load took over while the index was read.
            if (_disposed || generation != _listGeneration) return;
            _copyIndex = index;
            if (!_joinIndexIntoShownCards(index)) return;
            // The copy lists grew in place, which the search cache can't see.
            _searchNamesSource = null;
            _searchResultsSource = null;
            notifyListeners();
          })
          .catchError((Object error, StackTrace stack) {
            // Without the index, copies come up as paging reaches them.
            debugPrint('Merged copy index failed: $error\n$stack');
          }),
    );
  }

  /// A card on screen can be a refreshed copy of the fold's own card, so the
  /// copies go to the fold's card, whose copy list the refreshed one shares.
  bool _joinIndexIntoShownCards(Map<String, List<AggregatedItem>> index) {
    var grown = false;
    for (final card in _items) {
      final holder =
          titleMatchKeys(
            card,
          ).map((key) => _copyHolders[key]).nonNulls.firstOrNull ??
          card;
      if (joinIndexedCopies(holder, index, _copyHolders, _skipIndexedCopy)) {
        grown = true;
      }
    }
    return grown;
  }

  /// Read with the pages' own query and filters, so a title they leave out
  /// isn't counted. Reused while the query is the same and no server failed,
  /// but not under a played or favorite filter, whose answer changes as the
  /// viewer marks items without the query changing.
  _LightRead _lightReadFor({
    required List<String>? genreIds,
    required List<String>? studios,
    required List<String>? includeTypes,
    required List<String>? excludeTypes,
    required bool? collapseBoxSets,
    required bool recursive,
    required List<String>? filters,
    required List<String>? seriesStatus,
    required bool? isFavorite,
  }) {
    final sources = _mergedSources;
    // As JSON, so lists whose values hold a comma can't read as other lists.
    final query = jsonEncode([
      for (final source in sources)
        '${source.session.server.id}:${source.libraryId}',
      genreIds,
      studios,
      includeTypes,
      excludeTypes,
      collapseBoxSets,
      recursive,
      filters,
      seriesStatus,
      isFavorite,
      // What _getFilteredItems adds to every query on its own.
      _genreNamesFilter,
      _officialRatingsFilter,
      _tagsFilter,
      _yearsFilter,
      _videoTypesFilter,
      _audioLanguagesFilter,
      _subtitleLanguagesFilter,
      _hasSubtitlesFilter,
      _hasTrailerFilter,
      _hasSpecialFeatureFilter,
      _hasThemeSongFilter,
      _hasThemeVideoFilter,
      _isHdFilter,
      _is4KFilter,
      _is3DFilter,
    ]);
    final reusable = filters == null && isFavorite != true;
    if (_lightRead case final read?
        when reusable && read.query == query && !read.failed) {
      return read;
    }

    // In pages, since a server can answer a request without a limit with only
    // its default page, as Silo does with 50.
    Future<List<AggregatedItem>> readSource(MergedLibrarySource source) async {
      final serverId = source.session.server.id;
      final items = <AggregatedItem>[];
      var start = 0;
      while (true) {
        final response = await _getFilteredItems(
          client: source.session.client,
          parentId: source.libraryId,
          genreIds: genreIds,
          studios: studios,
          includeItemTypes: includeTypes,
          excludeItemTypes: excludeTypes,
          collapseBoxSetItems: collapseBoxSets,
          startIndex: start,
          limit: _lightPageSize,
          recursive: recursive,
          fields: 'ProviderIds,OriginalTitle',
          imageTypeLimit: 0,
          filters: filters,
          seriesStatus: seriesStatus,
          isFavorite: isFavorite,
          enableTotalRecordCount: false,
          enableUserData: false,
        );
        final page = response['Items'] as List? ?? const [];
        for (final raw in page) {
          if (raw is! Map || (raw['Id']?.toString() ?? '').isEmpty) continue;
          items.add(
            AggregatedItem(
              id: raw['Id'].toString(),
              serverId: serverId,
              // Trimmed, so a large library doesn't sit in memory whole.
              rawData: {
                for (final field in _lightFields)
                  if (raw[field] != null) field: raw[field],
              },
            ),
          );
        }
        start += page.length;
        // A short page ends the list unless the server counts more after it,
        // as one that drops items from a page after reading it can.
        final total = response['TotalRecordCount'] as int? ?? 0;
        if (page.isEmpty || (page.length < _lightPageSize && total <= start)) {
          return items;
        }
      }
    }

    return _lightRead = _LightRead(query, sources, readSource);
  }

  static const _lightPageSize = 1000;

  static const _lightFields = [
    'Id',
    'Name',
    'Type',
    'ProviderIds',
    'OriginalTitle',
    'OfficialRating',
  ];

  /// Every title the first server of a merged browse holds, which is the
  /// signed-in one whenever it has this library.
  Future<PreferredCopies?> _readPreferredCopies(_LightRead read) async {
    final sources = _mergedSources;
    final serverId = sources.first.session.server.id;
    final own = [
      for (var i = 0; i < sources.length; i++)
        if (sources[i].session.server.id == serverId) i,
    ];
    if (own.length == sources.length) return null;
    final titles = await read.titlesOf(own);
    // Without the whole list, the first copy shown keeps the card.
    return titles == null ? null : PreferredCopies(serverId, titles);
  }

  /// The next [limit] items of a merged browse in [compare]'s order, taking
  /// whichever server's next item comes first. Every server reads ahead at
  /// least a page, so an item only goes out once each server's next one is
  /// known. A random order has nothing to compare and takes turns instead.
  Future<Map<String, dynamic>> _fetchMergedPage(
    int startIndex,
    int limit,
    int Function(AggregatedItem, AggregatedItem)? compare,
    Future<Map<String, dynamic>> Function(
      MergedLibrarySource source,
      int start,
      int limit,
    )
    fetch,
  ) async {
    if (startIndex == 0) {
      _mergedReaders = [
        for (final source in _mergedSources) _MergedReader(source),
      ];
    }
    // Held here, since a reload swaps in new readers while this one waits.
    final readers = _mergedReaders;
    Object? failure;
    await Future.wait([
      for (final reader in readers)
        if (!reader.done && reader.buffer.length < limit)
          reader.read(fetch, limit - reader.buffer.length).catchError((
            Object error,
          ) {
            failure = error;
          }),
    ]);
    if (failure != null && readers.every((reader) => reader.failed)) {
      throw failure!;
    }

    final page = <AggregatedItem>[];
    var turn = 0;
    while (page.length < limit) {
      if (readers.any((reader) => reader.buffer.isEmpty && !reader.done)) {
        break;
      }
      final ready = [
        for (final reader in readers)
          if (reader.buffer.isNotEmpty) reader,
      ];
      if (ready.isEmpty) break;
      final next = compare == null
          ? ready[turn++ % ready.length]
          : ready.reduce(
              (a, b) => compare(a.buffer.first, b.buffer.first) <= 0 ? a : b,
            );
      page.add(next.buffer.removeAt(0));
    }

    final totals = [for (final reader in readers) reader.total];
    return {
      'Items': [for (final item in page) item.rawData],
      if (!totals.contains(null))
        'TotalRecordCount': totals.fold<int>(0, (sum, total) => sum + total!),
    };
  }

  static QueryFilterValues _mergeFacetValues(List<QueryFilterValues> values) {
    List<T> union<T extends Comparable<Object>>(
      Iterable<T> Function(QueryFilterValues value) pick,
    ) => ({for (final value in values) ...pick(value)}.toList()..sort());
    List<NamedFilterValue> unionNamed(
      List<NamedFilterValue> Function(QueryFilterValues value) pick,
    ) => [
      ...{
        for (final value in values)
          for (final named in pick(value)) named.value: named,
      }.values,
    ]..sort((a, b) => a.name.compareTo(b.name));
    return QueryFilterValues(
      genres: union((value) => value.genres),
      officialRatings: union((value) => value.officialRatings),
      tags: union((value) => value.tags),
      years: union((value) => value.years),
      audioLanguages: unionNamed((value) => value.audioLanguages),
      subtitleLanguages: unionNamed((value) => value.subtitleLanguages),
    );
  }

  String? get _effectiveParentId {
    if (isFilterBrowse) return _libraryFilter;
    return libraryId.isEmpty ? null : libraryId;
  }

  Future<void> _loadLibraries() async {
    try {
      final response = await _client.userViewsApi.getUserViews();
      final items = (response['Items'] as List?) ?? [];
      _libraries = items.cast<Map<String, dynamic>>().where((lib) {
        final type = lib['CollectionType'] as String?;
        return type == 'movies' || type == 'tvshows' || type == null;
      }).toList();
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setLibraryFilter(String? value) async {
    if (_libraryFilter == value) return;
    _libraryFilter = value;
    _collectionType = null;
    if (value != null) {
      try {
        final parentData = await _client.itemsApi
            .getItem(value, fields: _libraryMetaFields);
        _collectionType = (parentData['CollectionType'] as String?)
            ?.toLowerCase();
      } catch (_) {}
    }
    await load();
  }

  Future<void> setSortBy(LibrarySortBy value) async {
    if (_sortBy == value) return;
    _sortBy = value;
    await _prefs.set(UserPreferences.librarySortBy(_prefKey), value);
    await load();
  }

  Future<void> setSortDirection(SortDirection value) async {
    if (_sortDirection == value) return;
    _sortDirection = value;
    await _prefs.set(UserPreferences.librarySortDirection(_prefKey), value);
    await load();
  }

  Future<void> toggleSortDirection() => setSortDirection(
    _sortDirection == SortDirection.ascending
        ? SortDirection.descending
        : SortDirection.ascending,
  );

  Future<void> setPlayedFilter(PlayedStatusFilter value) async {
    if (_playedFilter == value) return;
    _playedFilter = value;
    await _prefs.set(UserPreferences.libraryPlayedFilter(_prefKey), value);
    await load();
  }

  Future<void> setLikedFilter(LikedStatusFilter value) async {
    if (_likedFilter == value) return;
    _likedFilter = value;
    await _prefs.set(UserPreferences.libraryLikedFilter(_prefKey), value);
    await load();
  }

  Future<void> setSeriesFilter(SeriesStatusFilter value) async {
    if (_seriesFilter == value) return;
    _seriesFilter = value;
    await _prefs.set(UserPreferences.librarySeriesFilter(_prefKey), value);
    await load();
  }

  Future<void> setFavoriteFilter(bool value) async {
    if (favoritesOnly || _favoriteFilter == value) return;
    _favoriteFilter = value;
    await _prefs.set(UserPreferences.libraryFavoriteFilter(_prefKey), value);
    await load();
  }

  void setLetterFilter(String value) {
    if (_letterFilter == value) return;
    _letterFilter = value;
    notifyListeners();
  }

  Set<T> _readEnumSet<T extends Enum>(
    Preference<List<String>> preference,
    List<T> values,
  ) {
    final stored = _prefs.get(preference).toSet();
    return values.where((v) => stored.contains(v.name)).toSet();
  }

  Future<void> _toggleEnumFilter<T extends Enum>(
    Set<T> current,
    T value,
    Preference<List<String>> preference,
  ) async {
    if (!current.remove(value)) current.add(value);
    await _prefs.set(preference, current.map((e) => e.name).toList());
    await load();
  }

  Future<void> _toggleValueFilter(
    Set<String> current,
    String value,
    Preference<List<String>> preference,
  ) async {
    if (!current.remove(value)) current.add(value);
    await _prefs.set(preference, current.toList());
    await load();
  }

  Future<void> toggleFeatureFilter(LibraryFeatureFilter value) =>
      _toggleEnumFilter(
        _featureFilters,
        value,
        UserPreferences.libraryFeatureFilters(_prefKey),
      );

  Future<void> toggleVideoQualityFilter(LibraryVideoQualityFilter value) =>
      _toggleEnumFilter(
        _videoQualityFilters,
        value,
        UserPreferences.libraryVideoQualityFilters(_prefKey),
      );

  Future<void> toggleVideoSourceFilter(LibraryVideoSourceFilter value) =>
      _toggleEnumFilter(
        _videoSourceFilters,
        value,
        UserPreferences.libraryVideoSourceFilters(_prefKey),
      );

  Future<void> toggleGenreFilter(String value) => _toggleValueFilter(
    _genreFilters,
    value,
    UserPreferences.libraryGenreFilters(_prefKey),
  );

  Future<void> toggleOfficialRatingFilter(String value) => _toggleValueFilter(
    _officialRatingFilters,
    value,
    UserPreferences.libraryOfficialRatingFilters(_prefKey),
  );

  Future<void> toggleTagFilter(String value) => _toggleValueFilter(
    _tagFilters,
    value,
    UserPreferences.libraryTagFilters(_prefKey),
  );

  Future<void> toggleYearFilter(String value) => _toggleValueFilter(
    _yearFilters,
    value,
    UserPreferences.libraryYearFilters(_prefKey),
  );

  Future<void> toggleAudioLanguageFilter(String value) => _toggleValueFilter(
    _audioLanguageFilters,
    value,
    UserPreferences.libraryAudioLanguageFilters(_prefKey),
  );

  Future<void> toggleSubtitleLanguageFilter(String value) => _toggleValueFilter(
    _subtitleLanguageFilters,
    value,
    UserPreferences.librarySubtitleLanguageFilters(_prefKey),
  );

  /// The selections a group holds and where they are saved.
  (Set<Object>, Preference<List<String>>) _filterGroup(
    LibraryFilterGroup group,
  ) => switch (group) {
    LibraryFilterGroup.features => (
      _featureFilters,
      UserPreferences.libraryFeatureFilters(_prefKey),
    ),
    LibraryFilterGroup.quality => (
      _videoQualityFilters,
      UserPreferences.libraryVideoQualityFilters(_prefKey),
    ),
    LibraryFilterGroup.source => (
      _videoSourceFilters,
      UserPreferences.libraryVideoSourceFilters(_prefKey),
    ),
    LibraryFilterGroup.genres => (
      _genreFilters,
      UserPreferences.libraryGenreFilters(_prefKey),
    ),
    LibraryFilterGroup.ratings => (
      _officialRatingFilters,
      UserPreferences.libraryOfficialRatingFilters(_prefKey),
    ),
    LibraryFilterGroup.tags => (
      _tagFilters,
      UserPreferences.libraryTagFilters(_prefKey),
    ),
    LibraryFilterGroup.years => (
      _yearFilters,
      UserPreferences.libraryYearFilters(_prefKey),
    ),
    LibraryFilterGroup.audioLanguages => (
      _audioLanguageFilters,
      UserPreferences.libraryAudioLanguageFilters(_prefKey),
    ),
    LibraryFilterGroup.subtitleLanguages => (
      _subtitleLanguageFilters,
      UserPreferences.librarySubtitleLanguageFilters(_prefKey),
    ),
  };

  Future<void> _resetFilterGroup(LibraryFilterGroup group) {
    final (values, preference) = _filterGroup(group);
    values.clear();
    return _prefs.set(preference, const <String>[]);
  }

  /// Clears one group and leaves the rest as they are.
  Future<void> clearFilterGroup(LibraryFilterGroup group) async {
    if (_filterGroup(group).$1.isEmpty) return;
    await _resetFilterGroup(group);
    await load();
  }

  /// Clears every filter at once, which is the only way out of a combination
  /// that matches nothing.
  Future<void> clearFilters() async {
    _playedFilter = PlayedStatusFilter.all;
    _likedFilter = LikedStatusFilter.all;
    _seriesFilter = SeriesStatusFilter.all;
    if (!favoritesOnly) _favoriteFilter = false;

    await Future.wait([
      _prefs.set(
        UserPreferences.libraryPlayedFilter(_prefKey),
        PlayedStatusFilter.all,
      ),
      _prefs.set(
        UserPreferences.libraryLikedFilter(_prefKey),
        LikedStatusFilter.all,
      ),
      _prefs.set(
        UserPreferences.librarySeriesFilter(_prefKey),
        SeriesStatusFilter.all,
      ),
      if (!favoritesOnly)
        _prefs.set(UserPreferences.libraryFavoriteFilter(_prefKey), false),
      for (final group in LibraryFilterGroup.values) _resetFilterGroup(group),
    ]);
    await load();
  }

  bool get hasActiveFilters =>
      _playedFilter != PlayedStatusFilter.all ||
      _likedFilter != LikedStatusFilter.all ||
      _seriesFilter != SeriesStatusFilter.all ||
      (_favoriteFilter && !favoritesOnly) ||
      _featureFilters.isNotEmpty ||
      _videoQualityFilters.isNotEmpty ||
      _videoSourceFilters.isNotEmpty ||
      _genreFilters.isNotEmpty ||
      _officialRatingFilters.isNotEmpty ||
      _tagFilters.isNotEmpty ||
      _yearFilters.isNotEmpty ||
      _audioLanguageFilters.isNotEmpty ||
      _subtitleLanguageFilters.isNotEmpty;

  /// Reads the values the library holds once per browse, so opening the filter
  /// picker does not wait on the network every time.
  Future<void> ensureFacetValuesLoaded() async {
    // A merged browse only knows its servers once the first load finishes.
    if (_facetsRequested || (isMergedBrowse && _mergedSources.isEmpty)) return;
    _facetsRequested = true;
    try {
      final values = isMergedBrowse
          ? _mergeFacetValues(
              await Future.wait([
                for (final source in _mergedSources)
                  source.session.client.itemsApi
                      .getQueryFilters(
                        parentId: source.libraryId,
                        includeItemTypes: includeItemTypes,
                      )
                      .catchError((_) => QueryFilterValues.empty),
              ]),
            )
          : await _client.itemsApi.getQueryFilters(
              parentId: _effectiveParentId,
              includeItemTypes: includeItemTypes,
            );
      if (_disposed) return;
      _facetValues = values;
      notifyListeners();
    } catch (_) {
      // A server without the endpoint just leaves the facet sections hidden.
    }
  }

  /// Every items query this browse makes goes through here, so the filter
  /// arguments are stated once instead of at each call.
  Future<Map<String, dynamic>> _getFilteredItems({
    MediaServerClient? client,
    List<String>? ids,
    String? parentId,
    List<String>? genreIds,
    List<String>? studios,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    bool? collapseBoxSetItems,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? fields,
    String? enableImageTypes,
    int? imageTypeLimit,
    List<String>? filters,
    List<String>? seriesStatus,
    bool? isFavorite,
    bool? enableTotalRecordCount,
    bool? enableUserData,
  }) => (client ?? _client).itemsApi.getItems(
    ids: ids,
    parentId: parentId,
    genreIds: genreIds,
    studios: studios,
    includeItemTypes: includeItemTypes,
    excludeItemTypes: excludeItemTypes,
    collapseBoxSetItems: collapseBoxSetItems,
    sortBy: sortBy,
    sortOrder: sortOrder,
    startIndex: startIndex,
    limit: limit,
    recursive: recursive,
    fields: fields,
    enableImageTypes: enableImageTypes,
    imageTypeLimit: imageTypeLimit,
    filters: filters,
    seriesStatus: seriesStatus,
    isFavorite: isFavorite,
    enableTotalRecordCount: enableTotalRecordCount,
    enableUserData: enableUserData,
    genres: _genreNamesFilter,
    officialRatings: _officialRatingsFilter,
    tags: _tagsFilter,
    years: _yearsFilter,
    videoTypes: _videoTypesFilter,
    audioLanguages: _audioLanguagesFilter,
    subtitleLanguages: _subtitleLanguagesFilter,
    hasSubtitles: _hasSubtitlesFilter,
    hasTrailer: _hasTrailerFilter,
    hasSpecialFeature: _hasSpecialFeatureFilter,
    hasThemeSong: _hasThemeSongFilter,
    hasThemeVideo: _hasThemeVideoFilter,
    isHd: _isHdFilter,
    is4K: _is4KFilter,
    is3D: _is3DFilter,
  );

  bool? _feature(LibraryFeatureFilter value) =>
      _featureFilters.contains(value) ? true : null;

  bool? get _hasSubtitlesFilter => _feature(LibraryFeatureFilter.subtitles);
  bool? get _hasTrailerFilter => _feature(LibraryFeatureFilter.trailer);
  bool? get _hasSpecialFeatureFilter => _feature(LibraryFeatureFilter.extras);
  bool? get _hasThemeSongFilter => _feature(LibraryFeatureFilter.themeSong);
  bool? get _hasThemeVideoFilter => _feature(LibraryFeatureFilter.themeVideo);

  /// One flag serves both standard and high definition, so asking for both is
  /// the same as asking for neither.
  bool? get _isHdFilter {
    final wantsHd = _videoQualityFilters.contains(LibraryVideoQualityFilter.hd);
    final wantsSd = _videoQualityFilters.contains(LibraryVideoQualityFilter.sd);
    if (wantsHd == wantsSd) return null;
    return wantsHd;
  }

  bool? get _is4KFilter =>
      _videoQualityFilters.contains(LibraryVideoQualityFilter.uhd)
      ? true
      : null;

  bool? get _is3DFilter =>
      _videoQualityFilters.contains(LibraryVideoQualityFilter.threeD)
      ? true
      : null;

  List<String>? get _videoTypesFilter => _videoSourceFilters.isEmpty
      ? null
      : _videoSourceFilters.map((e) => e.apiValue).toList();

  List<int>? get _yearsFilter => _yearFilters.isEmpty
      ? null
      : _yearFilters.map(int.tryParse).whereType<int>().toList();

  List<String>? get _officialRatingsFilter =>
      _officialRatingFilters.isEmpty ? null : _officialRatingFilters.toList();

  List<String>? get _tagsFilter =>
      _tagFilters.isEmpty ? null : _tagFilters.toList();

  List<String>? get _genreNamesFilter =>
      _genreFilters.isEmpty ? null : _genreFilters.toList();

  List<String>? get _audioLanguagesFilter =>
      _audioLanguageFilters.isEmpty ? null : _audioLanguageFilters.toList();

  List<String>? get _subtitleLanguagesFilter => _subtitleLanguageFilters.isEmpty
      ? null
      : _subtitleLanguageFilters.toList();

  Future<void> setImageType(ImageType value) async {
    if (_imageType == value) return;
    _imageType = value;
    await _prefs.set(UserPreferences.libraryImageType(_imagePrefKey), value);
    notifyListeners();
    _syncImageTypeToServer(value);
  }

  Future<void> _syncImageTypeFromServer() async {
    if (_imagePrefKey.isEmpty) return;
    try {
      final dp = await _client.displayPreferencesApi.getDisplayPreferences(
        _imagePrefKey,
        client: 'moonfin',
      );
      final serverType = dp.customPrefs['imageType'];
      if (serverType != null) {
        final match = ImageType.values.where(
          (t) => t.name.toLowerCase() == serverType.toLowerCase(),
        );
        if (match.isNotEmpty && match.first != _imageType) {
          _imageType = match.first;
          await _prefs.set(
            UserPreferences.libraryImageType(_imagePrefKey),
            _imageType,
          );
        }
      }
    } catch (_) {}
  }

  Future<void> _syncImageTypeToServer(ImageType value) async {
    if (_imagePrefKey.isEmpty) return;
    try {
      final dp = await _client.displayPreferencesApi.getDisplayPreferences(
        _imagePrefKey,
        client: 'moonfin',
      );
      final updated = DisplayPreferences(
        id: dp.id,
        sortBy: dp.sortBy,
        sortOrder: dp.sortOrder,
        viewType: dp.viewType,
        customPrefs: {...dp.customPrefs, 'imageType': value.name},
      );
      await _client.displayPreferencesApi.saveDisplayPreferences(
        _imagePrefKey,
        updated,
        client: 'moonfin',
      );
    } catch (_) {}
  }

  Future<void> setPosterSize(PosterSize value) async {
    if (_posterSize == value) return;
    _posterSize = value;
    if (isPlaylistBrowse) {
      await _prefs.set(UserPreferences.playlistPosterSize, value);
    } else {
      await _prefs.set(UserPreferences.libraryPosterSize, value);
    }
    notifyListeners();
  }

  Future<void> setScrollDirection(LibraryScrollDirection value) async {
    if (_scrollDirection == value) return;
    _scrollDirection = value;
    await _prefs.set(
      UserPreferences.libraryScrollDirection(_imagePrefKey),
      value,
    );
    notifyListeners();
  }

  Future<void> setGroupBy(LibraryGroupBy value) async {
    if (_groupBy == value) return;
    _groupBy = value;
    _selectedCategoryTab = null;
    await _prefs.set(
      UserPreferences.libraryGroupBy(_imagePrefKey),
      value,
    );
    notifyListeners();
    if (isGrouping) unawaited(ensureAllItemsLoaded());
  }

  void setSelectedCategoryTab(String category) {
    if (_selectedCategoryTab == category) return;
    _selectedCategoryTab = category;
    notifyListeners();
  }

  bool get isMovieOrSeriesLibrary =>
      _collectionType == 'movies' ||
      _collectionType == 'tvshows' ||
      (includeItemTypes != null &&
          includeItemTypes!.any((t) => t == 'Movie' || t == 'Series'));

  /// Only movies and series carry the metadata the groupings read, and folders
  /// carry none of it.
  bool get canGroup => isMovieOrSeriesLibrary && !folderView;

  bool get isGrouping => _groupBy != LibraryGroupBy.none && canGroup;

  bool get isSongsBrowse =>
      includeItemTypes != null && includeItemTypes!.contains('Audio');

  bool get canFolderView =>
      !isFilterBrowse && !isMergedBrowse && includeItemTypes == null;

  bool? _folderViewChoice;

  /// One level of the library's own folders at a time. Home videos and untyped
  /// libraries start in it, everything else starts flat.
  bool get folderView =>
      canFolderView &&
      (_folderViewChoice ?? (isHomeVideosLibrary || isMixedContentLibrary));

  Future<void> setFolderView(bool value) async {
    if (value == folderView) return;
    _folderViewChoice = value;
    await _prefs.set(UserPreferences.libraryFolderView(_prefKey), value);
    _sortBy = _prefs.get(UserPreferences.librarySortBy(_prefKey));
    await load();
  }

  /// Only video holds a picture quality or a disc source worth filtering on.
  bool get supportsVideoFilters =>
      !isMusicBrowse && !isBookLibrary && !isPlaylistBrowse;

  /// Options the server can't filter on stay out of the picker rather than
  /// sitting there doing nothing.
  bool get supportsUhdFilter =>
      _everyClient((features) => features.supportsUhdFilter);

  bool get supportsExtraFilters =>
      _everyClient((features) => features.supportsExtraLibraryFilters);

  bool get supportsUnreleasedSeriesFilter =>
      _everyClient((features) => features.supportsUnreleasedSeriesFilter);

  // A merged browse only offers a filter every server can apply, since one
  // that ignored it would fill the list with what it was meant to leave out.
  bool _everyClient(bool Function(FeatureDetector features) supports) =>
      isMergedBrowse
      ? _mergedSources.every(
          (source) => supports(source.session.client.features),
        )
      : supports(_client.features);

  List<LibrarySortBy> get sortOptions => LibrarySortBy.optionsFor(
    isSongsBrowse: isSongsBrowse,
    isMusicBrowse: isMusicBrowse,
    isSeriesLibrary: isSeriesLibrary,
    isBookLibrary: isBookLibrary,
    isFolderyLibrary: folderView,
    isMovieOrSeriesLibrary: isMovieOrSeriesLibrary,
    supportsMyRating: supportsMyRatingSort,
  );

  Map<String, List<AggregatedItem>> get groupedCategories {
    if (!isGrouping) return const {};

    // Group what the search left, so it narrows the categories the same way it
    // narrows a plain grid.
    final source = items;

    // Neither the fetched list nor the search results are edited in place, so
    // identity is enough to tell a fresh list from the one the cache was built
    // against.
    final cached = _groupedCategoriesCache;
    if (cached != null &&
        _groupedCategoriesGroupBy == _groupBy &&
        identical(_groupedCategoriesSource, source)) {
      return cached;
    }

    final map = <String, List<AggregatedItem>>{};
    for (final item in source) {
      switch (_groupBy) {
        case LibraryGroupBy.genres:
          // An item lands in every genre it carries, so the counts add up to
          // more than the library holds.
          final genres = item.genres;
          if (genres.isEmpty) {
            (map['Other'] ??= []).add(item);
          } else {
            for (final genre in genres) {
              (map[genre] ??= []).add(item);
            }
          }
        case LibraryGroupBy.parentalRatings:
          final rating = item.officialRating?.trim() ?? '';
          (map[rating.isEmpty ? 'Unrated' : rating] ??= []).add(item);
        case LibraryGroupBy.decade:
          final year = item.productionYear;
          final decade = year != null ? '${(year ~/ 10) * 10}s' : 'Unknown';
          (map[decade] ??= []).add(item);
        case LibraryGroupBy.studio:
          final studios = item.studios;
          if (studios.isEmpty) {
            (map['Unknown'] ??= []).add(item);
          } else {
            for (final studio in studios) {
              final name = studio['Name'] as String?;
              if (name != null && name.isNotEmpty) {
                (map[name] ??= []).add(item);
              }
            }
          }
        case LibraryGroupBy.none:
          break;
      }
    }

    final severities = _groupBy == LibraryGroupBy.parentalRatings
        ? {for (final key in map.keys) key: parentalRatingSeverity(key)}
        : const <String, int>{};

    final sortedKeys = map.keys.toList();
    sortedKeys.sort((a, b) {
      final aIsCatchAll = _catchAllCategories.contains(a);
      final bIsCatchAll = _catchAllCategories.contains(b);
      if (aIsCatchAll != bIsCatchAll) return aIsCatchAll ? 1 : -1;
      return switch (_groupBy) {
        // Newest decade first.
        LibraryGroupBy.decade => b.compareTo(a),
        LibraryGroupBy.parentalRatings when severities[a] != severities[b] =>
          severities[a]!.compareTo(severities[b]!),
        _ => a.compareTo(b),
      };
    });

    final sortedMap = <String, List<AggregatedItem>>{};
    for (final key in sortedKeys) {
      sortedMap[key] = map[key]!;
    }

    _groupedCategoriesCache = sortedMap;
    _groupedCategoriesSource = source;
    _groupedCategoriesGroupBy = _groupBy;
    return sortedMap;
  }

  List<AggregatedItem> get currentCategoryItems {
    if (!isGrouping) return items;
    final categories = groupedCategories;
    if (categories.isEmpty) return items;
    // A filter can retire the selected category. Falling back to every item
    // would mix in the other categories, so fall back to the first instead.
    final selected = _selectedCategoryTab ?? categories.keys.first;
    return categories[selected] ?? categories.values.first;
  }

  bool get isSeriesLibrary =>
      _collectionType == 'tvshows' ||
      (includeItemTypes != null && includeItemTypes!.contains('Series'));

  bool get isMusicBrowse =>
      _collectionType == 'music' ||
      (includeItemTypes != null &&
          includeItemTypes!.any(
            (t) =>
                t == 'MusicAlbum' ||
                t == 'MusicArtist' ||
                t == 'AlbumArtist' ||
                t == 'Audio',
          ));

  bool get isPlaylistBrowse =>
      _collectionType == 'playlists' ||
      (includeItemTypes != null && includeItemTypes!.contains('Playlist'));

  bool get isBookLibrary =>
      _collectionType == 'books' ||
      (includeItemTypes != null && includeItemTypes!.contains('Book'));

  bool get isHomeVideosLibrary =>
      !isFilterBrowse &&
      includeItemTypes == null &&
      _collectionType == 'homevideos';

  bool get isMixedContentLibrary =>
      !isFilterBrowse &&
      includeItemTypes == null &&
      (_collectionType == null ||
          _collectionType!.isEmpty ||
          _collectionType == 'mixed');

  bool isNavigableFolder(AggregatedItem item) {
    final type = item.type;
    if (type == 'Series' ||
        type == 'BoxSet' ||
        type == 'Playlist' ||
        type == 'MusicArtist' ||
        type == 'MusicAlbum' ||
        type == 'AlbumArtist') {
      return false;
    }

    final isFolder = item.rawData['IsFolder'] as bool? ?? false;
    if (isFolder) return true;

    return switch (type) {
      'Folder' || 'CollectionFolder' || 'UserView' => true,
      _ => false,
    };
  }

  String get statusText {
    final parts = <String>[];
    if (_favoriteFilter) parts.add('Favorites');
    if (_playedFilter == PlayedStatusFilter.watched) {
      parts.add(isBookLibrary ? 'Read' : 'Watched');
    }
    if (_playedFilter == PlayedStatusFilter.unwatched) {
      parts.add(isBookLibrary ? 'Unread' : 'Unwatched');
    }
    if (_playedFilter == PlayedStatusFilter.inProgress) {
      parts.add('In Progress');
    }
    if (_likedFilter == LikedStatusFilter.liked) parts.add('Liked');
    if (_likedFilter == LikedStatusFilter.disliked) parts.add('Disliked');
    if (_seriesFilter == SeriesStatusFilter.continuing) parts.add('Continuing');
    if (_seriesFilter == SeriesStatusFilter.ended) parts.add('Ended');
    if (_seriesFilter == SeriesStatusFilter.unreleased) parts.add('Unreleased');
    for (final feature in _featureFilters) {
      parts.add(switch (feature) {
        LibraryFeatureFilter.subtitles => 'With Subtitles',
        LibraryFeatureFilter.trailer => 'With Trailer',
        LibraryFeatureFilter.extras => 'With Extras',
        LibraryFeatureFilter.themeSong => 'With Theme Song',
        LibraryFeatureFilter.themeVideo => 'With Theme Video',
      });
    }
    for (final quality in _videoQualityFilters) {
      parts.add(switch (quality) {
        LibraryVideoQualityFilter.sd => 'SD',
        LibraryVideoQualityFilter.hd => 'HD',
        LibraryVideoQualityFilter.uhd => '4K',
        LibraryVideoQualityFilter.threeD => '3D',
      });
    }
    for (final source in _videoSourceFilters) {
      parts.add(source.displayName);
    }
    parts.addAll(_genreFilters);
    parts.addAll(_officialRatingFilters);
    parts.addAll(_tagFilters);
    parts.addAll(_yearFilters);
    if (_letterFilter.isNotEmpty) parts.add('Starting with $_letterFilter');
    final filterDesc = parts.isEmpty ? 'All items' : parts.join(' ');
    return "Showing $filterDesc from '$_libraryName' sorted by ${_sortBy.displayName}";
  }

  String get counterText => '${_items.length} | $_totalCount';

  // Fetches keep landing after the screen is popped, and notifying then throws.
  // Dropping it here saves every async path from carrying its own guard.
  @override
  void notifyListeners() {
    if (_disposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    // Also stops an in-flight page walk from fetching what nobody will see.
    _disposed = true;
    _searchDebounceTimer?.cancel();
    _pageWalkGeneration++;
    _prefs.removeListener(_onPrefsChanged);
    userDataSync.removeListener(_onUserDataChanged);
    super.dispose();
  }
}

/// Where a merged browse notes which server an item came from, since one
/// list holds several servers' items.
const _mergedServerIdKey = 'MergedServerId';

/// Each server is read only when asked for, so the first server's titles
/// don't wait on the others.
class _LightRead {
  _LightRead(this.query, this._sources, this._readSource);

  final String query;
  final List<MergedLibrarySource> _sources;
  final Future<List<AggregatedItem>> Function(MergedLibrarySource) _readSource;

  final _reads = <int, Future<List<AggregatedItem>?>>{};
  Set<String>? _titles;
  Future<Map<String, List<AggregatedItem>>>? _index;

  /// A server didn't answer, so the next load reads again.
  bool failed = false;

  Future<List<AggregatedItem>?> _read(int source) =>
      _reads[source] ??= _readSource(_sources[source])
          .then<List<AggregatedItem>?>(
            (items) => items,
            onError: (Object _) {
              failed = true;
              return null;
            },
          );

  /// Null when one of the first server's [sources] didn't answer.
  Future<Set<String>?> titlesOf(List<int> sources) async {
    if (_titles case final titles?) return titles;
    final read = await Future.wait(sources.map(_read));
    if (read.contains(null)) return null;
    return _titles = {
      for (final items in read) ...items!.expand(titleMatchKeys),
    };
  }

  Future<Map<String, List<AggregatedItem>>> index() => _index ??=
      Future.wait([for (var i = 0; i < _sources.length; i++) _read(i)])
          .then((read) {
            // Built, so the lists themselves can go.
            _reads.clear();
            return indexCopies(read.nonNulls.expand((items) => items));
          });
}

/// Reads one server library of a merged browse, holding what it has read
/// until the merge takes it.
class _MergedReader {
  _MergedReader(this.source);

  final MergedLibrarySource source;
  final buffer = <AggregatedItem>[];
  int _offset = 0;
  int? total;
  bool done = false;
  bool failed = false;

  Future<void> read(
    Future<Map<String, dynamic>> Function(
      MergedLibrarySource source,
      int start,
      int limit,
    )
    fetch,
    int limit,
  ) async {
    try {
      final response = await fetch(source, _offset, limit);
      final serverId = source.session.server.id;
      final raws = [
        for (final raw in response['Items'] as List? ?? const [])
          if (raw is Map) raw.cast<String, dynamic>(),
      ];
      for (final raw in raws) {
        final id = raw['Id']?.toString();
        if (id == null || id.isEmpty) continue;
        raw[_mergedServerIdKey] = serverId;
        buffer.add(AggregatedItem(id: id, serverId: serverId, rawData: raw));
      }
      _offset += raws.length;
      total = response['TotalRecordCount'] as int?;
      done = raws.length < limit || (total != null && _offset >= total!);
    } catch (_) {
      // The other servers carry on, and this one counts only what it gave.
      done = true;
      failed = true;
      total = _offset;
      rethrow;
    }
  }
}
