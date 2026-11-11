import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/network_errors.dart';
import '../models/aggregated_item.dart';
import '../repositories/mdblist_repository.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/user_data_sync.dart';
import '../utils/blocked_ratings.dart';
import '../utils/bounded_concurrency.dart';

enum FavoritesState { loading, ready, error }

class FavoritesViewModel extends ChangeNotifier {
  final MediaServerClient _client;
  final UserPreferences _prefs;
  final MdbListRepository _mdbListRepository;

  static const _rowLimit = 30;
  static const _prefKey = 'favorites';
  static const _browseFields =
      'Type,UserData,CommunityRating,OfficialRating,RunTimeTicks,ProductionYear,Status,ImageTags,BackdropImageTags,ParentBackdropItemId,ParentBackdropImageTags,CriticRating,MediaStreams';

  static const List<FavoriteTypeFilter> rowTypes = [
    FavoriteTypeFilter.movie,
    FavoriteTypeFilter.series,
    FavoriteTypeFilter.episode,
    FavoriteTypeFilter.collection,
    FavoriteTypeFilter.person,
    FavoriteTypeFilter.musicVideo,
    FavoriteTypeFilter.musicArtist,
    FavoriteTypeFilter.musicAlbum,
    FavoriteTypeFilter.audio,
    FavoriteTypeFilter.watchlist,
  ];

  FavoritesState _state = FavoritesState.loading;
  FavoritesState get state => _state;

  Map<FavoriteTypeFilter, List<AggregatedItem>> _rowItems = {};
  Map<FavoriteTypeFilter, List<AggregatedItem>> get rowItems => _rowItems;

  int get totalCount => _viewStyle == FavoritesViewStyle.home
      ? _rowItems.values.fold(0, (sum, list) => sum + list.length)
      : _gridTotalCount;

  late LibrarySortBy _sortBy;
  LibrarySortBy get sortBy => _sortBy;

  late SortDirection _sortDirection;
  SortDirection get sortDirection => _sortDirection;

  late ImageType _imageType;
  ImageType get imageType => _imageType;

  late PosterSize _posterSize;
  PosterSize get posterSize => _posterSize;

  Object? _error;
  Object? get error => _error;
  bool _isNetworkError = false;
  bool get isNetworkError => _isNetworkError;

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  Map<String, double> _focusedRatings = const {};
  Map<String, double> get focusedRatings => _focusedRatings;

  ImageApi get imageApi => _client.imageApi;

  late FavoritesViewStyle _viewStyle;
  FavoritesViewStyle get viewStyle => _viewStyle;

  List<AggregatedItem> _gridItems = const [];
  List<AggregatedItem> get gridItems => _gridItems;

  int _gridTotalCount = 0;
  int get gridTotalCount => _gridTotalCount;

  bool _loadingMoreGrid = false;
  bool get loadingMoreGrid => _loadingMoreGrid;

  /// Rows are paged from what the server handed over rather than from what is
  /// on screen, because a page thinned by the ratings filter would otherwise
  /// rewind the cursor and ask for rows it already has.
  int _gridFetchedCount = 0;
  final Map<FavoriteTypeFilter, int> _rowFetchedCounts = {};
  int _watchlistPages = 0;

  /// Watchlist request cards waiting for their detail, which is read once
  /// they're in the row so the screen doesn't wait on it.
  List<AggregatedItem> _requestCardsToEnrich = const [];
  int _loadGeneration = 0;
  bool _disposed = false;

  bool get hasMoreGrid => _gridFetchedCount < _gridTotalCount;

  final Map<FavoriteTypeFilter, int> _rowTotalCounts = {};
  final Set<FavoriteTypeFilter> _inFlightPagingRowTypes = {};

  /// Total number of favorites of [type] on the server, used for tab labels.
  /// Falls back to the number of items already loaded when unknown.
  int rowTotalCount(FavoriteTypeFilter type) =>
      _rowTotalCounts[type] ?? (_rowItems[type]?.length ?? 0);

  FavoritesViewModel({
    required MediaServerClient client,
    required UserPreferences prefs,
    required MdbListRepository mdbListRepository,
  }) : _client = client,
       _prefs = prefs,
       _mdbListRepository = mdbListRepository {
    _sortBy = _prefs.get(UserPreferences.librarySortBy(_prefKey));
    _sortDirection = _prefs.get(UserPreferences.librarySortDirection(_prefKey));
    _imageType = _prefs.get(UserPreferences.libraryImageType(_prefKey));
    _posterSize = _prefs.resolveScreenPosterSize(
      UserPreferences.favoritesPosterSize,
    );
    _viewStyle = _prefs.get(UserPreferences.favoritesViewStyle);
    userDataSync.addListener(_onUserDataChanged);
  }

  /// Repaints the watched ticks in place when something here is played or
  /// unfavourited, on this device or another one.
  void _onUserDataChanged() {
    var changed = false;

    Map<FavoriteTypeFilter, List<AggregatedItem>>? rows;
    _rowItems.forEach((type, items) {
      final patched = userDataSync.applyAll(items);
      if (identical(patched, items)) return;
      rows ??= Map.of(_rowItems);
      rows![type] = patched;
    });
    if (rows != null) {
      _rowItems = rows!;
      changed = true;
    }

    final grid = userDataSync.applyAll(_gridItems);
    if (!identical(grid, _gridItems)) {
      _gridItems = grid;
      changed = true;
    }

    if (changed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    userDataSync.removeListener(_onUserDataChanged);
    super.dispose();
  }

  void setFocusedItem(AggregatedItem? item) {
    _focusedItem = item;
    _focusedRatings = const {};
    notifyListeners();
    if (item != null) _loadFocusedRatings(item);
  }

  Future<void> setViewStyle(FavoritesViewStyle value) async {
    if (_viewStyle == value) return;
    _viewStyle = value;
    await _prefs.set(UserPreferences.favoritesViewStyle, value);
    await load();
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

  Future<void> load() async {
    _state = FavoritesState.loading;
    _rowItems = {};
    _rowTotalCounts.clear();
    _rowFetchedCounts.clear();
    _watchlistPages = 0;
    _requestCardsToEnrich = const [];
    _loadGeneration++;
    _gridItems = const [];
    _gridTotalCount = 0;
    _gridFetchedCount = 0;
    notifyListeners();

    try {
      if (_viewStyle == FavoritesViewStyle.home) {
        final results = await Future.wait(
          rowTypes.map((type) => _fetchRowItems(type, startIndex: 0)),
        );
        final map = <FavoriteTypeFilter, List<AggregatedItem>>{};
        for (var i = 0; i < rowTypes.length; i++) {
          if (results[i].$1.isNotEmpty) {
            map[rowTypes[i]] = results[i].$1;
            _rowTotalCounts[rowTypes[i]] = results[i].$2;
          }
        }
        _rowItems = map;
        _enrichRequestCards();
      } else {
        await _fetchGridPage(0);
      }
      _state = FavoritesState.ready;
    } catch (e) {
      _error = e;
      _isNetworkError = isNetworkException(e);
      _state = FavoritesState.error;
    }
    notifyListeners();
  }

  Future<(List<AggregatedItem>, int)> _fetchRowItems(
    FavoriteTypeFilter type, {
    int startIndex = 0,
  }) async {
    if (type == FavoriteTypeFilter.watchlist) return _fetchWatchlist();
    try {
      final sortValue = _sortBy.apiValue;
      final sortOrder = _sortDirection == SortDirection.ascending
          ? 'Ascending'
          : 'Descending';
      Map<String, dynamic> response;
      try {
        response = await _client.itemsApi.getItems(
          sortBy: sortValue,
          sortOrder: sortOrder,
          startIndex: startIndex,
          limit: _rowLimit,
          recursive: true,
          isFavorite: true,
          includeItemTypes: type.itemTypes,
          fields: _browseFields,
        );
      } on DioException catch (e) {
        final statusCode = e.response?.statusCode ?? 0;
        if (statusCode < 500) rethrow;
        final fallbackSort = sortValue.toLowerCase().contains('isfolder')
            ? 'SortName'
            : sortValue;
        response = await _client.itemsApi.getItems(
          sortBy: fallbackSort,
          sortOrder: sortOrder,
          startIndex: startIndex,
          limit: _rowLimit,
          recursive: true,
          isFavorite: true,
          includeItemTypes: type.itemTypes,
          fields: _browseFields,
          enableTotalRecordCount: false,
        );
      }
      final rawItems = (response['Items'] as List?) ?? [];
      final items = rawItems
          .cast<Map<String, dynamic>>()
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: _client.baseUrl,
              rawData: raw,
            ),
          )
          .toList();
      _rowFetchedCounts[type] = startIndex + rawItems.length;
      final totalCount = response['TotalRecordCount'] as int? ?? items.length;
      return (withoutBlockedItems(items), totalCount);
    } catch (_) {
      return (const <AggregatedItem>[], 0);
    }
  }

  /// The next page of the watchlist. Silo's first page leads with the
  /// titles the library has; the rest come from the requests watchlist
  /// (Seerr's, or Silo's titles the library lacks) as request cards. A
  /// reload while it waits leaves the paging state to the new load.
  Future<(List<AggregatedItem>, int)> _fetchWatchlist() async {
    final type = FavoriteTypeFilter.watchlist;
    final generation = _loadGeneration;
    bool stale() => generation != _loadGeneration;
    final library = <AggregatedItem>[];
    if (_client.serverType == ServerType.silo && _watchlistPages == 0) {
      try {
        // Every library title, 200 at a time.
        const pageSize = 200;
        for (var start = 0; ; start += pageSize) {
          final response = await _client.itemsApi.getItems(
            recursive: true,
            filters: const ['IsInWatchlist'],
            includeItemTypes: const ['Movie', 'Series'],
            startIndex: start,
            limit: pageSize,
            fields: _browseFields,
          );
          final raws = (response['Items'] as List? ?? const [])
              .cast<Map<String, dynamic>>();
          library.addAll(
            withoutBlockedItems([
              for (final raw in raws)
                AggregatedItem(
                  id: raw['Id']?.toString() ?? '',
                  serverId: _client.baseUrl,
                  rawData: raw,
                ),
            ]),
          );
          if (raws.length < pageSize) break;
        }
      } catch (_) {}
      if (stale()) return (library, library.length);
      _rowFetchedCounts[type] = library.length;
    }
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      if (!repo.isAvailable) return (library, library.length);
      final page = await repo.getWatchlist(page: _watchlistPages + 1);
      if (stale()) return (library, library.length);
      _watchlistPages = page.page;
      final fetched = (_rowFetchedCounts[type] ?? 0) + page.results.length;
      _rowFetchedCounts[type] = fetched;
      final requestCards = withoutBlockedItems([
        for (final item in page.results) _requestCard(item),
      ]);
      _requestCardsToEnrich = requestCards;
      return (
        [...library, ...requestCards],
        page.page < page.totalPages ? fetched + 1 : fetched,
      );
    } catch (_) {
      return (library, library.length);
    }
  }

  /// Each lookup waits out its own request, so no more than this many hold
  /// Silo's six request slots at once and the rest stay free for the screen.
  static const _requestCardConcurrency = 3;

  /// A Watchlist card for a title the library lacks, from what the watchlist
  /// lists. Silo's includes the age rating, so the card can be filtered now;
  /// the backdrop and runtime come later from [_enrichRequestCards].
  AggregatedItem _requestCard(SeerrDiscoverItem item) {
    final date = _text(item.releaseDate) ?? _text(item.firstAirDate);
    final voteAverage = item.voteAverage;
    return AggregatedItem(
      id: item.id.toString(),
      serverId: 'seerr',
      rawData: {
        'Name': item.displayTitle,
        'Type': item.mediaType == 'tv' ? 'Series' : 'Movie',
        'Overview': item.overview ?? '',
        'PosterPath': item.posterPath ?? '',
        'BackdropPath': item.backdropPath ?? '',
        'SeerrMediaType': item.mediaType,
        'ProductionYear': ?_year(date),
        'OfficialRating': ?_text(item.contentRating),
        if (voteAverage != null && voteAverage > 0)
          'CommunityRating': voteAverage,
      },
    );
  }

  /// Reads each waiting request card's detail and swaps the filled-in cards
  /// into the Watchlist row. A reload since the cards were fetched drops the
  /// result, and a failed lookup leaves the card as it was.
  void _enrichRequestCards() {
    final cards = _requestCardsToEnrich;
    _requestCardsToEnrich = const [];
    if (cards.isEmpty) return;
    final generation = _loadGeneration;
    unawaited(() async {
      final List<AggregatedItem?> enriched;
      try {
        final repo = await GetIt.instance.getAsync<SeerrRepository>();
        enriched = await mapBounded(
          cards,
          _requestCardConcurrency,
          (card) => _withDetail(repo, card),
        );
      } catch (_) {
        return;
      }
      if (_disposed || generation != _loadGeneration) return;
      const type = FavoriteTypeFilter.watchlist;
      final row = _rowItems[type];
      if (row == null) return;
      final byKey = {
        for (final card in enriched.nonNulls) _requestCardKey(card): card,
      };
      _rowItems[type] = withoutBlockedItems([
        for (final item in row)
          item.serverId == 'seerr'
              ? byKey[_requestCardKey(item)] ?? item
              : item,
      ]);
      notifyListeners();
    }());
  }

  /// [card] with the backdrop, overview, date, age rating and (for a movie)
  /// runtime its detail adds, keeping what the watchlist already gave.
  Future<AggregatedItem?> _withDetail(
    SeerrRepository repo,
    AggregatedItem card,
  ) async {
    final tmdbId = int.tryParse(card.id) ?? 0;
    if (tmdbId <= 0) return null;
    final raw = card.rawData;
    String? backdropPath;
    String? overview;
    String? date;
    String? contentRating;
    int? runtimeMinutes;
    double? voteAverage;
    try {
      if (raw['SeerrMediaType'] == 'tv') {
        final d = await repo.getTvDetails(tmdbId);
        backdropPath = d.backdropPath;
        overview = d.overview;
        date = d.firstAirDate;
        contentRating = d.contentRating;
        voteAverage = d.voteAverage;
      } else {
        final d = await repo.getMovieDetails(tmdbId);
        backdropPath = d.backdropPath;
        overview = d.overview;
        date = d.releaseDate;
        contentRating = d.contentRating;
        voteAverage = d.voteAverage;
        runtimeMinutes = d.runtime;
      }
    } catch (_) {
      return null;
    }
    return AggregatedItem(
      id: card.id,
      serverId: card.serverId,
      rawData: {
        ...raw,
        'BackdropPath':
            _text(raw['BackdropPath'] as String?) ?? backdropPath ?? '',
        'Overview': _text(raw['Overview'] as String?) ?? overview ?? '',
        'ProductionYear': ?(raw['ProductionYear'] ?? _year(_text(date))),
        'OfficialRating':
            ?(_text(raw['OfficialRating'] as String?) ?? _text(contentRating)),
        if (runtimeMinutes != null && runtimeMinutes > 0)
          'RunTimeTicks': runtimeMinutes * 60 * 10000000,
        if (raw['CommunityRating'] == null &&
            voteAverage != null &&
            voteAverage > 0)
          'CommunityRating': voteAverage,
      },
    );
  }

  static String _requestCardKey(AggregatedItem card) =>
      '${card.rawData['SeerrMediaType'] ?? ''}:${card.id}';

  static String? _text(String? value) =>
      value == null || value.isEmpty ? null : value;

  static int? _year(String? date) => date != null && date.length >= 4
      ? int.tryParse(date.substring(0, 4))
      : null;

  Future<void> loadMoreForType(FavoriteTypeFilter type) async {
    final items = _rowItems[type];
    if (items == null || items.isEmpty) return;
    final total = _rowTotalCounts[type] ?? 0;
    final fetched = _rowFetchedCounts[type] ?? items.length;
    if (fetched >= total) return;
    if (_inFlightPagingRowTypes.contains(type)) return;

    _inFlightPagingRowTypes.add(type);
    final generation = _loadGeneration;
    try {
      final currentOffset = fetched;
      final (newItems, totalCount) = await _fetchRowItems(
        type,
        startIndex: currentOffset,
      );
      // A reload while this page loaded has its own rows and counts.
      if (generation != _loadGeneration) return;
      _rowTotalCounts[type] = totalCount;

      if (newItems.isNotEmpty) {
        // The row as it is now, since filling in request cards can change it
        // while the page loads.
        _rowItems[type] = [...(_rowItems[type] ?? items), ...newItems];
        notifyListeners();
        if (type == FavoriteTypeFilter.watchlist) _enrichRequestCards();
      } else {
        _rowTotalCounts[type] = items.length;
      }
    } catch (_) {
    } finally {
      _inFlightPagingRowTypes.remove(type);
    }
  }

  Future<void> _fetchGridPage(int startIndex) async {
    final sortValue = _sortBy.apiValue;
    final sortOrder = _sortDirection == SortDirection.ascending
        ? 'Ascending'
        : 'Descending';
    final pageSize = startIndex == 0 ? 75 : 48;

    Map<String, dynamic> response;
    try {
      response = await _client.itemsApi.getItems(
        sortBy: sortValue,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: pageSize,
        recursive: true,
        isFavorite: true,
        fields: _browseFields,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) rethrow;
      final fallbackSort = sortValue.toLowerCase().contains('isfolder')
          ? 'SortName'
          : sortValue;
      response = await _client.itemsApi.getItems(
        sortBy: fallbackSort,
        sortOrder: sortOrder,
        startIndex: startIndex,
        limit: pageSize,
        recursive: true,
        isFavorite: true,
        fields: _browseFields,
        enableTotalRecordCount: false,
      );
    }

    final rawItems = (response['Items'] as List?) ?? [];
    final totalFromServer = response['TotalRecordCount'] as int?;
    if (totalFromServer != null) {
      _gridTotalCount = totalFromServer;
    } else {
      _gridTotalCount =
          startIndex + rawItems.length + (rawItems.length == pageSize ? 1 : 0);
    }

    final mapped = withoutBlockedItems(
      rawItems
          .cast<Map<String, dynamic>>()
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: _client.baseUrl,
              rawData: raw,
            ),
          )
          .toList(),
    );

    _gridFetchedCount = startIndex + rawItems.length;

    if (startIndex == 0) {
      _gridItems = mapped;
    } else {
      _gridItems = [..._gridItems, ...mapped];
    }
  }

  Future<void> loadMoreGrid() async {
    if (_loadingMoreGrid || !hasMoreGrid) return;
    _loadingMoreGrid = true;
    notifyListeners();

    final prevFetched = _gridFetchedCount;
    try {
      await _fetchGridPage(_gridFetchedCount);
      if (_gridFetchedCount <= prevFetched) {
        _gridTotalCount = _gridFetchedCount;
      }
    } catch (_) {}

    _loadingMoreGrid = false;
    notifyListeners();
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

  Future<void> setImageType(ImageType value) async {
    if (_imageType == value) return;
    _imageType = value;
    await _prefs.set(UserPreferences.libraryImageType(_prefKey), value);
    notifyListeners();
  }

  Future<void> setPosterSize(PosterSize value) async {
    if (_posterSize == value) return;
    _posterSize = value;
    await _prefs.set(UserPreferences.favoritesPosterSize, value);
    notifyListeners();
  }
}
