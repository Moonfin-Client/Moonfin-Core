import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../repositories/mdblist_repository.dart';

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

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  Map<String, double> _focusedRatings = const {};
  Map<String, double> get focusedRatings => _focusedRatings;

  final Map<String, String?> _tmdbIdByItemId = {};

  ImageApi get imageApi => _client.imageApi;

  late FavoritesViewStyle _viewStyle;
  FavoritesViewStyle get viewStyle => _viewStyle;

  List<AggregatedItem> _gridItems = const [];
  List<AggregatedItem> get gridItems => _gridItems;

  int _gridTotalCount = 0;
  int get gridTotalCount => _gridTotalCount;

  bool _loadingMoreGrid = false;
  bool get loadingMoreGrid => _loadingMoreGrid;

  bool get hasMoreGrid => _gridItems.length < _gridTotalCount;

  final Map<FavoriteTypeFilter, int> _rowTotalCounts = {};
  final Set<FavoriteTypeFilter> _inFlightPagingRowTypes = {};

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
    _posterSize = _prefs.resolveLibraryPosterSize();
    _viewStyle = _prefs.get(UserPreferences.favoritesViewStyle);
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
    var tmdbId = item.tmdbId;
    if (tmdbId == null) {
      if (_tmdbIdByItemId.containsKey(item.id)) {
        tmdbId = _tmdbIdByItemId[item.id];
      } else {
        try {
          final details = await _client.itemsApi.getItem(item.id);
          tmdbId = (details['ProviderIds'] as Map?)?['Tmdb'] as String?;
        } catch (_) {
          tmdbId = null;
        }
        _tmdbIdByItemId[item.id] = tmdbId;
      }
    }

    if (tmdbId == null) return;
    final mediaType = item.type;
    if (mediaType == null) return;
    final ratings = await _mdbListRepository.getRatings(
      tmdbId: tmdbId,
      mediaType: mediaType,
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
    _gridItems = const [];
    _gridTotalCount = 0;
    _tmdbIdByItemId.clear();
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
      } else {
        await _fetchGridPage(0);
      }
      _state = FavoritesState.ready;
    } catch (e) {
      _errorMessage = e.toString();
      _state = FavoritesState.error;
    }
    notifyListeners();
  }

  Future<(List<AggregatedItem>, int)> _fetchRowItems(
    FavoriteTypeFilter type, {
    int startIndex = 0,
  }) async {
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
              id: raw['Id'] as String,
              serverId: _client.baseUrl,
              rawData: raw,
            ),
          )
          .toList();
      final totalCount = response['TotalRecordCount'] as int? ?? items.length;
      return (items, totalCount);
    } catch (_) {
      return (const <AggregatedItem>[], 0);
    }
  }

  Future<void> loadMoreForType(FavoriteTypeFilter type) async {
    final items = _rowItems[type];
    if (items == null || items.isEmpty) return;
    final total = _rowTotalCounts[type] ?? 0;
    if (items.length >= total) return;
    if (_inFlightPagingRowTypes.contains(type)) return;

    _inFlightPagingRowTypes.add(type);
    try {
      final currentOffset = items.length;
      final (newItems, totalCount) = await _fetchRowItems(type, startIndex: currentOffset);
      _rowTotalCounts[type] = totalCount;

      if (newItems.isNotEmpty) {
        _rowItems[type] = [...items, ...newItems];
        notifyListeners();
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
      _gridTotalCount = startIndex + rawItems.length + (rawItems.length == pageSize ? 1 : 0);
    }

    final mapped = rawItems
        .cast<Map<String, dynamic>>()
        .map(
          (raw) => AggregatedItem(
            id: raw['Id'] as String,
            serverId: _client.baseUrl,
            rawData: raw,
          ),
        )
        .toList();

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

    final prevLength = _gridItems.length;
    try {
      await _fetchGridPage(_gridItems.length);
      if (_gridItems.length <= prevLength) {
        _gridTotalCount = _gridItems.length;
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
    await _prefs.set(UserPreferences.libraryPosterSize, value);
    notifyListeners();
  }
}
