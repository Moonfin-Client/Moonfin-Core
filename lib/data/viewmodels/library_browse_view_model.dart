import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/parental_rating_severity.dart';
import '../models/aggregated_item.dart';
import '../repositories/mdblist_repository.dart';
import '../utils/alphabet_bucket.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/playlist_utils.dart';

enum LibraryBrowseState { loading, ready, error }

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

  static const _pageSize = 48;
  static const _firstPageSize = 75;
  // Name and CollectionType come back as default fields, so the library lookup
  // needs none. Asking for the full set makes the server recursively count the
  // whole library before the first item can render.
  static const _libraryMetaFields = '';

  static const _browseFields =
      'PrimaryImageAspectRatio,SortName,Type,IsFolder,UserData,CommunityRating,OfficialRating,RunTimeTicks,ProductionYear,ProviderIds,ImageTags,BackdropImageTags,ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,Album,AlbumId,AlbumArtist,Artists,Genres,Studios';
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

  List<AggregatedItem> get items {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return _items;
    if (_searchResults != null &&
        _searchResultsQuery == query &&
        identical(_searchResultsSource, _items)) {
      return _searchResults!;
    }
    final matches = [
      for (final item in _items)
        if ((item.sortName ?? item.name).toLowerCase().contains(query)) item,
    ];
    _searchResults = matches;
    _searchResultsSource = _items;
    _searchResultsQuery = query;
    return matches;
  }

  int _totalCount = 0;
  int get totalCount => _totalCount;

  int _filteredOutCount = 0;

  /// Rows the server has handed back so far, which is where the next page
  /// starts. The rendered count drifts below this whenever a row is dropped,
  /// and paging from the rendered count would ask for a window already read.
  int _fetchedCount = 0;

  /// Ids already on screen. A random sort reshuffles server side on every
  /// request, so consecutive pages are windows into different orderings and
  /// the same item comes back on several of them.
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

  late SeriesStatusFilter _seriesFilter;
  SeriesStatusFilter get seriesFilter => _seriesFilter;

  late bool _favoriteFilter;
  bool get favoriteFilter => _favoriteFilter;

  late String _letterFilter;
  String get letterFilter => _letterFilter;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Timer? _searchDebounceTimer;
  static const _searchLoadDelay = Duration(milliseconds: 300);

  /// Matching happens against the items already loaded, so a query that reaches
  /// past the first page needs the rest pulled in. Typing a word would abandon
  /// and restart that walk on every letter, so it waits for a pause first.
  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    notifyListeners();
    _searchDebounceTimer?.cancel();
    if (_searchQuery.trim().isEmpty || !hasMore) return;
    _searchDebounceTimer = Timer(_searchLoadDelay, () {
      if (_disposed) return;
      unawaited(ensureAllItemsLoaded());
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
  bool _disposed = false;

  // Grouping walks every item and sorts the keys, and the grid asks for it
  // more than once per build.
  Map<String, List<AggregatedItem>>? _groupedCategoriesCache;
  List<AggregatedItem>? _groupedCategoriesSource;
  LibraryGroupBy? _groupedCategoriesGroupBy;

  static const _catchAllCategories = {'Other', 'Unknown', 'Unrated'};

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool? _lastGroupCollectionsValue;

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  Map<String, double> _focusedRatings = const {};
  Map<String, double> get focusedRatings => _focusedRatings;

  ImageApi get imageApi => _client.imageApi;

  late bool _groupByType;
  bool get groupByType => _groupByType;

  final Set<String> _playlistTypeFilters = {
    'Video',
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
    List<AggregatedItem> items,
  ) async {
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
  }) : _client = client,
       _prefs = prefs,
       _mdbListRepository = mdbListRepository {
    _sortBy = _prefs.get(UserPreferences.librarySortBy(_prefKey));
    _sortDirection = _prefs.get(UserPreferences.librarySortDirection(_prefKey));
    _playedFilter = _prefs.get(UserPreferences.libraryPlayedFilter(_prefKey));
    _seriesFilter = _prefs.get(UserPreferences.librarySeriesFilter(_prefKey));
    _favoriteFilter =
        favoritesOnly ||
        _prefs.get(UserPreferences.libraryFavoriteFilter(_prefKey));
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
    _prefs.addListener(_onPrefsChanged);
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

  Future<void> load() async {
    // Any page walk still running belongs to the list we are about to drop.
    _pageWalkGeneration++;
    _state = LibraryBrowseState.loading;
    _items = const [];
    _totalCount = 0;
    _filteredOutCount = 0;
    _fetchedCount = 0;
    _renderedItemIds.clear();
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

      if (isHomeVideosLibrary || isMixedContentLibrary) {
        if (_sortBy != LibrarySortBy.name &&
            _sortBy != LibrarySortBy.dateAdded &&
            _sortBy != LibrarySortBy.random) {
          _sortBy = LibrarySortBy.name;
          await _prefs.set(
            UserPreferences.librarySortBy(_prefKey),
            LibrarySortBy.name,
          );
        }
      }

      _refreshPosterSizeFromScope();

      await imageTypeSync;
      await _fetchPage(0);
      _state = LibraryBrowseState.ready;
    } catch (e) {
      _errorMessage = e.toString();
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
      final beforeCount = _items.length;
      await loadMore();
      if (!stillWanted()) return;
      if (_items.length == beforeCount) break;
    }
  }

  /// Pages until an item starting with [letter] is loaded, and reports whether
  /// one ever turned up.
  Future<bool> ensureItemsLoadedForPrefix(String letter) async {
    if (letter.isEmpty || letter == 'ALL') return true;
    bool hasPrefix() =>
        _items.any((item) => matchesAlphabetBucket(item, letter));

    while (!hasPrefix() && hasMore) {
      final beforeCount = _items.length;
      await loadMore();
      if (_items.length == beforeCount) break;
    }
    return hasPrefix();
  }

  Future<void> loadMore() async {
    if (_loadingMore || !hasMore) return;
    _loadingMore = true;
    notifyListeners();

    final previouslyFetched = _fetchedCount;
    try {
      await _fetchPage(_fetchedCount);
      // Stop on a page the server had nothing left for, not on one that only
      // repeated what is already shown, which a random sort does by chance.
      if (_fetchedCount <= previouslyFetched) {
        _totalCount = _items.length;
        _hasMoreFromPageSize = false;
      }
    } catch (_) {}

    _loadingMore = false;
    notifyListeners();
  }

  Future<void> _fetchPage(int startIndex) async {
    final pageSize = startIndex == 0 ? _firstPageSize : _pageSize;
    final filters = <String>[];
    if (_playedFilter == PlayedStatusFilter.watched) {
      filters.add('IsPlayed');
    } else if (_playedFilter == PlayedStatusFilter.unwatched) {
      filters.add('IsUnplayed');
    }

    final seriesStatus = <String>[];
    if (_seriesFilter == SeriesStatusFilter.continuing) {
      seriesStatus.add('Continuing');
    } else if (_seriesFilter == SeriesStatusFilter.ended) {
      seriesStatus.add('Ended');
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
    } else if (isHomeVideosLibrary || isMixedContentLibrary) {
      recursive = false;
      sortBy = 'IsFolder,$sortBy';
    }

    if (genreId != null &&
        _collectionType == 'music' &&
        includeItemTypes == null) {
      includeTypes = ['MusicAlbum'];
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

    final Map<String, dynamic> response;
    if (isAlbumArtistBrowse) {
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
      response = await _fetchItemsWithFallback(
        parentId: _effectiveParentId,
        genreIds: genreId != null ? [genreId!] : null,
        studios: studioName != null ? [studioName!] : null,
        includeItemTypes: includeTypes,
        excludeItemTypes: excludeTypes,
        collapseBoxSetItems: collapseBoxSets,
        sortBy: sortBy,
        sortOrder: _sortDirection == SortDirection.ascending
            ? 'Ascending'
            : 'Descending',
        startIndex: startIndex,
        limit: pageSize,
        recursive: recursive,
        fields: _browseFields,
        filters: filters.isEmpty ? null : filters,
        seriesStatus: seriesStatus.isEmpty ? null : seriesStatus,
        isFavorite: _favoriteFilter ? true : null,
      );
    }

    final rawItems = (response['Items'] as List?) ?? [];
    var mapped = rawItems
        .whereType<Map>()
        .map((raw) => raw.cast<String, dynamic>())
        .map((raw) {
          final id = raw['Id']?.toString();
          if (id == null || id.isEmpty) return null;
          return AggregatedItem(
            id: id,
            serverId: _client.baseUrl,
            rawData: raw,
          );
        })
        .whereType<AggregatedItem>()
        .toList();

    var filtered = await _filterLibraryItems(mapped);

    if (isPlaylistBrowse) {
      final filteredOutInBatch = mapped.length - filtered.length;
      _filteredOutCount += filteredOutInBatch;
    }

    // A playlist is free to list the same item more than once, so only the
    // library browses drop repeats. A repeat means the server reshuffled
    // rather than the library holding fewer items, so the total stays as
    // reported and the dropped rows turn up on a later window.
    if (!isPlaylistBrowse) {
      filtered = filtered
          .where((item) => !_renderedItemIds.contains(item.id))
          .toList();
      _renderedItemIds.addAll(filtered.map((item) => item.id));
    }

    _fetchedCount = startIndex + rawItems.length;

    final totalFromServer = response['TotalRecordCount'] as int?;
    _totalCountKnown = totalFromServer != null;
    if (_totalCountKnown) {
      _totalCount = totalFromServer! - _filteredOutCount;
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

  Future<Map<String, dynamic>> _fetchItemsWithFallback({
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
      return await _client.itemsApi.getItems(
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

      return _client.itemsApi.getItems(
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

  /// Only movies and series carry the metadata the groupings read.
  bool get isGrouping =>
      _groupBy != LibraryGroupBy.none && isMovieOrSeriesLibrary;

  Map<String, List<AggregatedItem>> get groupedCategories {
    if (!isGrouping) return const {};

    // _items is replaced wholesale on every fetch, so identity is enough to
    // tell a fresh list from the one the cache was built against.
    final cached = _groupedCategoriesCache;
    if (cached != null &&
        _groupedCategoriesGroupBy == _groupBy &&
        identical(_groupedCategoriesSource, _items)) {
      return cached;
    }

    final map = <String, List<AggregatedItem>>{};
    for (final item in _items) {
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
    _groupedCategoriesSource = _items;
    _groupedCategoriesGroupBy = _groupBy;
    return sortedMap;
  }

  List<AggregatedItem> get currentCategoryItems {
    if (!isGrouping) return _items;
    final categories = groupedCategories;
    if (categories.isEmpty) return _items;
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
    if (_seriesFilter == SeriesStatusFilter.continuing) parts.add('Continuing');
    if (_seriesFilter == SeriesStatusFilter.ended) parts.add('Ended');
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
    super.dispose();
  }
}
