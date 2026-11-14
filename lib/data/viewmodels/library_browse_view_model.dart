import 'dart:async';
import 'dart:math';
import 'package:collection/collection.dart';
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
import '../services/plugin_sync_service.dart';
import '../services/unified_catalog_query.dart';
import '../services/unified_catalog_service.dart';
import '../services/user_data_sync.dart';
import '../services/user_ratings_api.dart';
import '../utils/alphabet_bucket.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/genre_browse_utils.dart';
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

  /// Set for the movie and series libraries merged across servers.
  final UnifiedLibraryKind? unifiedKind;

  /// Set for a genre merged across servers, which can list both kinds.
  final String? unifiedGenre;
  final List<UnifiedLibraryKind> _unifiedKinds;
  final UnifiedCatalogService? _unifiedCatalog;
  final ImageApi Function(String serverId)? _imageApiForServer;

  bool get isUnifiedBrowse =>
      _unifiedKinds.isNotEmpty && _unifiedCatalog != null;

  /// Held for one whole load, so every page is cut from the same titles.
  UnifiedCatalogSnapshot? _catalogSnapshot;
  String? _catalogSnapshotSignature;

  /// Picked once per load, so every page shares one random order.
  int _catalogRandomSeed = 0;

  /// An in-place rebuild is waiting for the catalog; no page may be cut yet.
  bool _catalogRebuilding = false;

  /// Generation of the server check this screen is waiting on.
  int _catalogCheckGeneration = 0;

  int _catalogPatchedRevision = -1;

  /// Whether this visit has already asked for the opening server check.
  bool _openingCheckRequested = false;

  /// The catalog session this screen last loaded for. A different one means
  /// the accounts changed.
  int _catalogSessionSeen = 0;

  /// True from the moment the opening server check is requested until it
  /// completes.
  bool _openingCheckRunning = false;

  /// While the opening check runs, changed titles rebuild the list at once
  /// instead of waiting to be let in; see [_onCatalogChanged].
  bool _rebuildOnCatalogChange = false;
  bool _pendingCatalogUpdate = false;
  Future<void>? _catalogRefresh;

  /// With no items yet, the grid counts as loading rather than empty.
  bool get isCatalogSyncing =>
      isUnifiedBrowse &&
      (_unifiedCatalog!.isSyncing ||
          _catalogRefresh != null ||
          (_openingCheckRunning && _items.isEmpty));

  int get catalogServersUpToDate =>
      isUnifiedBrowse ? _unifiedCatalog!.serverCounts.upToDate : 0;

  int get catalogServersTotal =>
      isUnifiedBrowse ? _unifiedCatalog!.serverCounts.total : 0;

  /// Servers whose last read failed; unread or in-progress ones don't count.
  int get catalogUnreachableServerCount =>
      isUnifiedBrowse ? _unifiedCatalog!.unreachableServerCount : 0;

  /// Ignores filters and search, to tell an empty catalog from an empty result.
  bool get catalogHasTitles =>
      isUnifiedBrowse && _unifiedKinds.any(_unifiedCatalog!.hasTitles);

  /// Titles changed since the list was built; held back so cards don't move.
  bool get hasPendingCatalogUpdate =>
      isUnifiedBrowse && _pendingCatalogUpdate && _catalogRefresh == null;

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
        for (final item in _items)
          isUnifiedBrowse
              ? unifiedSearchText(item.rawData)
              // The name on the card and the one it is sorted under, which
              // can put an article last.
              : foldForSearch(
                  item.sortName == null
                      ? item.name
                      : '${item.name}\n${item.sortName}',
                ),
      ];
      _searchNamesSource = _items;
    }
    return _searchNames;
  }

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

  late LikedStatusFilter _likedFilter;
  LikedStatusFilter get likedFilter => _likedFilter;

  /// Whether the My Rating sort can actually be served, which needs the
  /// Moonfin plugin on the server, or Silo, which keeps ratings itself.
  bool get supportsMyRatingSort =>
      // The ratings belong to one server's plugin, not to the merged list.
      !isUnifiedBrowse &&
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

  int _facetsTitlesRevision = -1;

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

  bool get isGenreBrowse => genreId != null || unifiedGenre != null;
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

  ImageApi get imageApi => _client.imageApi;

  ImageApi imageApiFor(AggregatedItem item) =>
      (isUnifiedBrowse ? _imageApiForServer?.call(item.serverId) : null) ??
      _client.imageApi;

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
    if (isUnifiedBrowse && activeParentalFilter.isActive) {
      items = [
        for (final item in items)
          if (!isAnyCopyBlocked(item.rawData)) item,
      ];
    }
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
    required this._client,
    required UserPreferences prefs,
    required MdbListRepository mdbListRepository,
    this.genreId,
    this.studioName,
    this.overrideName,
    this.includeItemTypes,
    this.favoritesOnly = false,
    this.unifiedKind,
    this.unifiedGenre,
    List<UnifiedLibraryKind>? unifiedGenreKinds,
    this._unifiedCatalog,
    this._imageApiForServer,
  }) : _unifiedKinds = unifiedGenre != null
           ? unifiedGenreKinds ?? UnifiedLibraryKind.values
           : [?unifiedKind],
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
    if (isUnifiedBrowse) {
      final catalog = _unifiedCatalog!;
      _catalogSessionSeen = catalog.session;
      catalog.addListener(_onCatalogChanged);
    }
  }

  /// While the opening check runs the list is rebuilt as each server lands;
  /// after it, cards are patched in place and changed titles wait to be let in.
  void _onCatalogChanged() {
    if (_disposed) return;
    final catalog = _unifiedCatalog!;
    if (catalog.session != _catalogSessionSeen) {
      // Accounts changed: nothing else reloads and re-checks an open screen.
      _catalogSessionSeen = catalog.session;
      _openingCheckRequested = false;
      _catalogCheckGeneration++;
      _openingCheckRunning = false;
      _rebuildOnCatalogChange = false;
      // The cards on screen belong to the accounts that just left, and the
      // new ones may not be allowed to see them: nothing of them stays while
      // the new catalog loads.
      _focusedItem = null;
      _focusedRatings = const {};
      _searchResults = null;
      _searchResultsSource = null;
      _searchNamesSource = null;
      _searchNames = const [];
      _groupedCategoriesCache = null;
      _groupedCategoriesSource = null;
      _facetValues = QueryFilterValues.empty;
      _facetsTitlesRevision = -1;
      unawaited(_load());
      return;
    }
    // Without a snapshot no page has been read yet, so the first page read
    // picks up the newest catalog state by itself.
    final snapshot = _catalogSnapshot;
    if (snapshot != null && catalog.titlesRevision != snapshot.titlesRevision) {
      if (_rebuildOnCatalogChange || _items.isEmpty) {
        unawaited(_load(keepShown: true));
      } else {
        _pendingCatalogUpdate = true;
      }
    }
    _patchFromCatalog();
    _refreshCatalogFacets();
    notifyListeners();
  }

  void _onCatalogChecked(int check) {
    if (_disposed || check != _catalogCheckGeneration) return;
    _openingCheckRunning = false;
    _rebuildOnCatalogChange = false;
    notifyListeners();
  }

  /// Patches in place; an item the catalog dropped stays until the next load.
  /// A card whose new data is blocked is taken out instead.
  void _patchFromCatalog({int? since}) {
    final catalog = _unifiedCatalog!;
    final fromRevision = since ?? _catalogPatchedRevision;
    _catalogPatchedRevision = catalog.revision;
    if (catalog.revision == fromRevision || _items.isEmpty) return;

    // Null when more than watched state changed: every card is compared.
    final changedCopies = catalog.userDataChangedSince(fromRevision);
    Set<String>? staleCopyKeys;
    if (changedCopies != null) {
      staleCopyKeys = {
        for (final changedCopy in changedCopies)
          for (final copy in unifiedCopiesOf(
            _catalogItem(changedCopy.serverId, changedCopy.itemId) ??
                const {},
          ))
            copy.key,
      };
      if (staleCopyKeys.isEmpty) return;
      // A long grid is not walked for the one card that was watched.
      final index = _renderedIndex;
      if (index != null && _patchCards(staleCopyKeys, index)) return;
    }

    final renderedKeys = <String>{};
    var changed = false;
    var blocked = 0;
    final patched = <AggregatedItem>[];
    for (final item in _items) {
      final current =
          staleCopyKeys == null || staleCopyKeys.contains(_renderedKey(item))
          ? _currentCard(item)
          : item;
      if (_blockedNow(item, current)) {
        blocked++;
        _unfocusCard(item);
        continue;
      }
      // Two cards whose titles were since folded into one both resolve to
      // it, and the second keeps what it showed until the list is rebuilt.
      if (!renderedKeys.add(_renderedKey(current))) {
        renderedKeys.add(_renderedKey(item));
        patched.add(item);
        continue;
      }
      changed = changed || !identical(current, item);
      patched.add(current);
    }
    if (!changed && blocked == 0) return;
    _items = patched;
    _renderedItemIds
      ..clear()
      ..addAll(renderedKeys);
    _countBlockedCards(blocked);
  }

  /// The page a card came from was filtered when it was read. A rating or a
  /// copy that arrived since can block it, so changed cards are checked again.
  bool _blockedNow(AggregatedItem item, AggregatedItem current) =>
      !identical(current, item) && isAnyCopyBlocked(current.rawData);

  /// Counted like a card filtered out of its page, so the total and the pages
  /// still to come stay in step with the list.
  void _countBlockedCards(int count) {
    if (count == 0) return;
    _filteredOutCount += count;
    _totalCount = max(0, _totalCount - count);
  }

  /// The focused card feeds the header, which must not keep showing a title
  /// that has just been taken out.
  void _unfocusCard(AggregatedItem item) {
    final focused = _focusedItem;
    if (focused == null || _renderedKey(focused) != _renderedKey(item)) return;
    _focusedItem = null;
    _focusedRatings = const {};
  }

  /// [item] as the catalog holds it now, or [item] itself when nothing differs.
  AggregatedItem _currentCard(AggregatedItem item) {
    final raw = _catalogItem(item.serverId, item.id);
    if (raw == null ||
        identical(raw, item.rawData) ||
        const DeepCollectionEquality().equals(raw, item.rawData)) {
      return item;
    }
    return AggregatedItem(
      id: raw['Id'].toString(),
      serverId: raw[unifiedServerIdKey].toString(),
      rawData: raw,
    );
  }

  List<AggregatedItem>? _renderedIndexSource;
  Map<String, int>? _renderedIndexByKey;

  /// Where each rendered copy sits in the list, built once per list. Null when
  /// two cards share a key, which only the walk over every card can settle.
  Map<String, int>? get _renderedIndex {
    if (!identical(_renderedIndexSource, _items)) {
      _renderedIndexSource = _items;
      final index = <String, int>{
        for (var i = 0; i < _items.length; i++) _renderedKey(_items[i]): i,
      };
      _renderedIndexByKey =
          index.length == _items.length &&
              _renderedItemIds.length == _items.length
          ? index
          : null;
    }
    return _renderedIndexByKey;
  }

  /// Patches only the cards behind [staleCopyKeys], taking out the ones that
  /// are now blocked. False, with nothing changed, when a card now resolves to
  /// another copy: that can collide with a card already shown, so it is left
  /// to the walk over every card.
  bool _patchCards(Set<String> staleCopyKeys, Map<String, int> index) {
    Map<int, AggregatedItem>? replacements;
    Set<int>? blocked;
    for (final key in staleCopyKeys) {
      final position = index[key];
      if (position == null) continue;
      final item = _items[position];
      final current = _currentCard(item);
      if (identical(current, item)) continue;
      if (_renderedKey(current) != key) return false;
      if (isAnyCopyBlocked(current.rawData)) {
        (blocked ??= {}).add(position);
        continue;
      }
      (replacements ??= {})[position] = current;
    }
    if (blocked != null) {
      // Positions move, so the index is left to be built again from the list.
      final kept = <AggregatedItem>[];
      for (var i = 0; i < _items.length; i++) {
        if (blocked.contains(i)) {
          _renderedItemIds.remove(_renderedKey(_items[i]));
          _unfocusCard(_items[i]);
        } else {
          kept.add(replacements?[i] ?? _items[i]);
        }
      }
      _items = kept;
      _countBlockedCards(blocked.length);
      return true;
    }
    if (replacements == null) return true;
    final patched = List.of(_items);
    replacements.forEach((position, card) => patched[position] = card);
    _items = patched;
    // No key moved, so the index holds for the new list too.
    _renderedIndexSource = patched;
    return true;
  }

  Map<String, dynamic>? _catalogItem(String serverId, String itemId) {
    for (final kind in _unifiedKinds) {
      final item = _unifiedCatalog!.currentItem(kind, serverId, itemId);
      if (item != null) return item;
    }
    return null;
  }

  Future<void> applyCatalogUpdate() async {
    if (_disposed || !hasPendingCatalogUpdate) return;
    await _load(keepShown: true);
  }

  /// Re-reads every server regardless of age; concurrent calls join.
  Future<void> refreshCatalog() {
    if (_disposed || !isUnifiedBrowse) return Future.value();
    final running = _catalogRefresh;
    if (running != null) return running;
    final refresh = _catalogRefresh = _refreshCatalog();
    notifyListeners();
    return refresh;
  }

  Future<void> _refreshCatalog() async {
    try {
      await _unifiedCatalog!.forceFullRead();
    } finally {
      _catalogRefresh = null;
    }
    if (_disposed) return;
    await load();
  }

  /// Whether anything the grid shows has been watched, favourited or rated
  /// since the items were fetched. The socket names the changed item and its
  /// season, never the series holding the unwatched count, so the grid has to
  /// ask the server about its own rows the next time it is looked at.
  bool _userDataStale = false;
  bool _syncingUserData = false;
  int _userDataRevisionSeen = userDataSync.revision;

  void _onUserDataChanged() {
    if (_disposed) return;
    // Changes are published by item id alone, which two servers can share. The
    // catalog resolves the server and reports through its own listener.
    if (!isUnifiedBrowse) {
      final patched = userDataSync.applyAll(_items);
      if (!identical(patched, _items)) {
        _items = patched;
        notifyListeners();
      }
    }
    if (!_syncingUserData) _userDataStale = true;
  }

  /// Does nothing until a change has actually been recorded, so coming back to
  /// the grid normally costs no request.
  Future<void> syncUserDataIfStale() async {
    // The grid was off screen, so pending titles can land without moving cards.
    if (hasPendingCatalogUpdate) await applyCatalogUpdate();
    if (_disposed || _syncingUserData || !_userDataStale || _items.isEmpty) {
      return;
    }
    _syncingUserData = true;
    final startRevision = userDataSync.revision;
    // What this refresh publishes itself, which is no reason to go again.
    var refreshedIds = const <String>{};
    var settled = false;
    try {
      if (isUnifiedBrowse) {
        // The catalog already asks each server about its own changed copy;
        // only the series of a changed episode is left to find.
        var complete = true;
        if (_unifiedKinds.contains(UnifiedLibraryKind.series)) {
          complete = await _unifiedCatalog!.refreshSeriesOf(
            userDataSync.changedSince(_userDataRevisionSeen),
          );
          if (_disposed) return;
        }
        if (complete) _userDataRevisionSeen = startRevision;
        _patchFromCatalog();
        notifyListeners();
        settled = complete;
      } else {
        refreshedIds = {for (final item in _items) item.id};
        settled = await userDataSync.refreshFromServer(_client, refreshedIds);
      }
    } finally {
      _syncingUserData = false;
      // A failed refresh, or a change that arrived meanwhile, possibly to
      // another series' episode, is left for the next one.
      _userDataStale =
          !settled ||
          userDataSync
              .changedSince(startRevision)
              .any((id) => !refreshedIds.contains(id));
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
    if (isUnifiedBrowse) {
      final kindNames = _unifiedKinds.map((kind) => kind.name).join('_');
      return unifiedGenre == null
          ? 'unified_$kindNames'
          : 'unified_genre_${genreNameKey(unifiedGenre!)}_$kindNames';
    }
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

  Future<void> load() => _load();

  /// [keepShown] rebuilds a merged library in place: the old list stays until
  /// its replacement, holding as many titles, is ready.
  Future<void> _load({bool keepShown = false}) async {
    // Any page walk still running belongs to the list we are about to drop.
    _pageWalkGeneration++;
    final generation = ++_listGeneration;
    // A scroll page still on its way belongs to the old list, so it shouldn't
    // hold up paging of the new one.
    _loadingMore = false;
    _catalogSnapshot = null;
    _pendingCatalogUpdate = false;
    // 0x7fffffff, not 1 << 32, which is zero on the web build.
    if (isUnifiedBrowse && !keepShown) {
      _catalogRandomSeed = Random().nextInt(0x7fffffff);
    }
    final shownCount = _items.length;
    if (keepShown) {
      // The only wait that can outlast a frame. The rest is answered from
      // memory, so the lists swap with nothing drawn in between.
      _catalogRebuilding = true;
      try {
        await _unifiedCatalog!.ensureLoaded();
      } catch (_) {
        // The load below asks again and reports it.
      }
      if (generation != _listGeneration) return;
      _catalogRebuilding = false;
      // Drop whatever was cut while the catalog was loading.
      _catalogSnapshot = null;
    } else {
      _catalogRebuilding = false;
      _state = LibraryBrowseState.loading;
    }
    _items = const [];
    _totalCount = 0;
    _filteredOutCount = 0;
    _fetchedCount = 0;
    _renderedItemIds.clear();
    _playlistCategoryMap.clear();
    _totalCountKnown = true;
    _hasMoreFromPageSize = false;
    if (!keepShown) notifyListeners();

    try {
      // Independent of the library lookup, so let it run alongside instead of
      // adding a third round trip before the first item can render.
      final imageTypeSync = _imageTypeSynced
          ? Future<void>.value()
          : _syncImageTypeFromServer().then((_) => _imageTypeSynced = true);

      if (isUnifiedBrowse) {
        _libraryName = overrideName ?? '';
        // The disk copy is enough to draw from; the servers are checked behind.
        final catalog = _unifiedCatalog!;
        await catalog.ensureLoaded();
        // Once per visit: a sort or filter change shouldn't re-ask the servers.
        if (!_openingCheckRequested) {
          _openingCheckRequested = true;
          _rebuildOnCatalogChange = true;
          _openingCheckRunning = true;
          final check = ++_catalogCheckGeneration;
          unawaited(
            catalog.syncNow().whenComplete(() => _onCatalogChecked(check)),
          );
        }
      }

      if (isFilterBrowse) {
        _libraryName = overrideName ?? '';
        if (!_initialLibraryFilterSet) {
          _libraryFilter = libraryId.isEmpty ? null : libraryId;
          _initialLibraryFilterSet = true;
        }
        // A merged genre has no one server's libraries to narrow to.
        if (_libraries.isEmpty && !isUnifiedBrowse) _loadLibraries();
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
      await _fetchPage(
        0,
        generation: generation,
        pageSizeOverride: keepShown && shownCount > _firstPageSize
            ? shownCount
            : null,
      );
      if (generation != _listGeneration) return;
      _state = LibraryBrowseState.ready;
    } catch (e) {
      if (generation != _listGeneration) return;
      _error = e;
      _isNetworkError = isNetworkException(e);
      _state = LibraryBrowseState.error;
    }
    notifyListeners();
    // A search only matches loaded items, and this load dropped the walk that
    // was pulling in the rest for it.
    if (isGrouping ||
        _searchQuery.trim().isNotEmpty ||
        _prefs.get(UserPreferences.showAlphabeticalFilters)) {
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
      await loadMore(pageSizeOverride: 300);
      if (!stillWanted()) return;
      if (_items.length == beforeCount) break;
      if (isUnifiedBrowse) {
        await _yieldToEventLoop();
        if (!stillWanted()) return;
      }
    }
  }

  /// A merged library answers from memory and would otherwise yield no frame.
  Future<void> _yieldToEventLoop() => Future<void>.delayed(Duration.zero);

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
        final beforeCount = _items.length;
        await loadMore(pageSizeOverride: 300, notify: false);
        if (_items.length == beforeCount) break;
        if (isUnifiedBrowse) await _yieldToEventLoop();
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
    if (api is! LetterPositionApi || parentId == null) return null;
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
    if (_loadingMore || _catalogRebuilding || !hasMore) return;
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
      final results = await Future.wait([
        _fetchItemsWithFallback(
          parentId: _effectiveParentId,
          genreIds: genreId != null ? [genreId!] : null,
          studios: studioName != null ? [studioName!] : null,
          includeItemTypes: includeTypes,
          excludeItemTypes: excludeTypes,
          collapseBoxSetItems: collapseBoxSets,
          sortBy: sortBy,
          sortOrder: sortOrder,
          startIndex: startIndex,
          limit: pageSize,
          recursive: recursive,
          fields: _browseFields,
          filters: filters.isEmpty ? null : filters,
          seriesStatus: seriesStatus.isEmpty ? null : seriesStatus,
          isFavorite: _favoriteFilter ? true : null,
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
            serverId:
                raw[unifiedServerIdKey]?.toString() ?? _client.baseUrl,
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
          .where((item) => !_renderedItemIds.contains(_renderedKey(item)))
          .toList();
      _renderedItemIds.addAll(filtered.map(_renderedKey));
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
    if (isUnifiedBrowse) {
      // The new page is only as current as the snapshot, so patch from there.
      _patchFromCatalog(since: _catalogSnapshot?.revision ?? -1);
    }
  }

  /// Two servers can hand out the same id for different titles.
  String _renderedKey(AggregatedItem item) =>
      isUnifiedBrowse ? unifiedCopyKey(item.serverId, item.id) : item.id;

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
    if (isUnifiedBrowse) {
      _facetsRequested = true;
      if (_refreshCatalogFacets()) notifyListeners();
      return;
    }
    if (_facetsRequested) return;
    _facetsRequested = true;
    try {
      final values = await _client.itemsApi.getQueryFilters(
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

  bool _refreshCatalogFacets() {
    final catalog = _unifiedCatalog!;
    if (!_facetsRequested || catalog.titlesRevision == _facetsTitlesRevision) {
      return false;
    }
    _facetsTitlesRevision = catalog.titlesRevision;
    final genre = unifiedGenre;
    if (genre == null) {
      _facetValues = catalog.facetsOf(
        _unifiedKinds,
        where: (item) => !isAnyCopyBlocked(item),
      );
      return true;
    }
    final key = genreNameKey(genre);
    final facets = catalog.facetsOf(
      _unifiedKinds,
      where: (item) =>
          !isAnyCopyBlocked(item) &&
          unifiedGenresOf(item).any((g) => genreNameKey(g) == key),
    );
    // The genre is the page's subject, so it isn't offered as a filter.
    _facetValues = QueryFilterValues(
      officialRatings: facets.officialRatings,
      years: facets.years,
    );
    return true;
  }

  /// Every items query this browse makes goes through here, so the filter
  /// arguments are stated once instead of at each call.
  Future<Map<String, dynamic>> _getFilteredItems({
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
  }) {
    if (isUnifiedBrowse) {
      return Future.value(
        _catalogPage(
          ids: ids,
          sortBy: sortBy,
          sortOrder: sortOrder,
          startIndex: startIndex,
          limit: limit,
          filters: filters,
          seriesStatus: seriesStatus,
          isFavorite: isFavorite,
        ),
      );
    }
    return _client.itemsApi.getItems(
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
  }

  /// A page of the merged library. The catalog honours only the sort, the
  /// favourites, genre, rating, year and status filters, and [ids].
  Map<String, dynamic> _catalogPage({
    List<String>? ids,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    List<String>? filters,
    List<String>? seriesStatus,
    bool? isFavorite,
  }) {
    final query = UnifiedCatalogQuery(
      itemTypes: _unifiedKinds.map((kind) => kind.itemType).join(','),
      sortBy: sortBy ?? 'SortName',
      descending: sortOrder == 'Descending',
      filters: filters ?? const [],
      seriesStatus: seriesStatus ?? const [],
      favoritesOnly: isFavorite == true,
      genres: _genreNamesFilter ?? const [],
      genre: unifiedGenre,
      officialRatings: _officialRatingsFilter ?? const [],
      years: _yearsFilter ?? const [],
      ids: ids,
    );
    var snapshot = _catalogSnapshot;
    if (snapshot == null || query.signature != _catalogSnapshotSignature) {
      snapshot = _unifiedCatalog!.snapshotOf(
        _unifiedKinds,
        query,
        random: Random(_catalogRandomSeed),
      );
      _catalogSnapshot = snapshot;
      _catalogSnapshotSignature = query.signature;
    }
    return snapshot.page(startIndex: startIndex ?? 0, limit: limit);
  }

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
    // A merged library belongs to no one server to keep the choice on.
    if (_imagePrefKey.isEmpty || isUnifiedBrowse) return;
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
    if (_imagePrefKey.isEmpty || isUnifiedBrowse) return;
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
      isUnifiedBrowse ||
      (includeItemTypes != null &&
          includeItemTypes!.any((t) => t == 'Movie' || t == 'Series'));

  /// Only movies and series carry the metadata the groupings read, and folders
  /// carry none of it.
  bool get canGroup => isMovieOrSeriesLibrary && !folderView;

  bool get isGrouping => _groupBy != LibraryGroupBy.none && canGroup;

  bool get isSongsBrowse =>
      includeItemTypes != null && includeItemTypes!.contains('Audio');

  bool get canFolderView => !isFilterBrowse && includeItemTypes == null;

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
      // The catalog keeps what the grid shows, not each file's streams.
      !isUnifiedBrowse && !isMusicBrowse && !isBookLibrary && !isPlaylistBrowse;

  /// Options the server can't filter on stay out of the picker rather than
  /// sitting there doing nothing.
  bool get supportsUhdFilter =>
      !isUnifiedBrowse && _client.features.supportsUhdFilter;

  bool get supportsExtraFilters =>
      !isUnifiedBrowse && _client.features.supportsExtraLibraryFilters;

  bool get supportsUnreleasedSeriesFilter =>
      !isUnifiedBrowse && _client.features.supportsUnreleasedSeriesFilter;

  List<LibrarySortBy> get sortOptions {
    final options = LibrarySortBy.optionsFor(
      isSongsBrowse: isSongsBrowse,
      isMusicBrowse: isMusicBrowse,
      isSeriesLibrary: isSeriesLibrary,
      isBookLibrary: isBookLibrary,
      isFolderyLibrary: folderView,
      isMovieOrSeriesLibrary: isMovieOrSeriesLibrary,
      supportsMyRating: supportsMyRatingSort,
    );
    if (!isUnifiedBrowse) return options;
    // The catalog doesn't keep when a series last gained an episode.
    return [
      for (final option in options)
        if (option != LibrarySortBy.dateEpisodeAdded) option,
    ];
  }

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
    if (isUnifiedBrowse) _unifiedCatalog!.removeListener(_onCatalogChanged);
    super.dispose();
  }
}
