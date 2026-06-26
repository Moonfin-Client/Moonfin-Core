import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../services/row_data_source.dart';

class BookBrowseViewModel extends ChangeNotifier {
  final RowDataSource _dataSource;
  final MediaServerClient _client;
  final String libraryId;

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _libraryName = '';
  String get libraryName => _libraryName;

  String? _collectionType;
  String? get collectionType => _collectionType;

  bool get isAudiobookLibrary => _collectionType == 'audiobooks';

  AggregatedItem? _featured;
  AggregatedItem? get featuredItem => _featured;

  int _titleCount = 0;
  int get titleCount => _titleCount;
  int _genreCount = 0;
  int get genreCount => _genreCount;
  int _seriesCount = 0;
  int get seriesCount => _seriesCount;
  int _authorCount = 0;
  int get authorCount => _authorCount;

  String get _serverId => _client.baseUrl;
  ImageApi get imageApi => _dataSource.imageApi;

  BookBrowseViewModel({
    required this.libraryId,
    required RowDataSource dataSource,
    required MediaServerClient client,
    String? collectionType,
  }) : _dataSource = dataSource,
       _client = client,
       _collectionType = collectionType;

  List<String> get _itemTypes =>
      isAudiobookLibrary ? const ['AudioBook', 'Audio'] : const ['Book'];

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();
    final l10n = currentAppLocalizations();

    try {
      final itemData = await _client.itemsApi.getItem(libraryId);
      _libraryName = itemData['Name'] as String? ?? l10n.books;
      final fetchedType = (itemData['CollectionType'] as String?)?.toLowerCase();
      if (fetchedType != null && fetchedType.isNotEmpty) {
        _collectionType = fetchedType;
      }
    } catch (_) {}

    try {
      final allTitle = isAudiobookLibrary ? l10n.audiobooks : l10n.books;
      final resumeF = _dataSource.loadLibraryResume(libraryId, _serverId);
      final latestF = _dataSource.loadLatestMedia(
        libraryId,
        _libraryName,
        _serverId,
        _collectionType,
      );
      final lastPlayedF = isAudiobookLibrary
          ? _dataSource.loadLibraryLastPlayed(
              libraryId,
              _serverId,
              includeItemTypes: _itemTypes,
            )
          : null;
      final favoritesF = _dataSource.loadLibraryFavorites(
        libraryId,
        _serverId,
        includeItemTypes: _itemTypes,
      );
      final genresF = _dataSource.loadGenres(
        _serverId,
        includeItemTypes: _itemTypes,
        parentId: libraryId,
      );
      final collectionsF = _loadBookCollections();
      final allF = _dataSource.loadLibraryItemsByType(
        libraryId,
        _serverId,
        title: allTitle,
        includeItemTypes: _itemTypes,
        sortBy: 'SortName',
      );

      await Future.wait([
        resumeF,
        latestF,
        ?lastPlayedF,
        favoritesF,
        genresF,
        collectionsF,
        allF,
      ]);

      final resume = await resumeF;
      final latest = await latestF;
      final lastPlayed = lastPlayedF == null ? null : await lastPlayedF;
      final favorites = await favoritesF;
      final genres = await genresF;
      final collections = await collectionsF;
      final all = await allF;

      _rows = [
        resume,
        latest,
        ?lastPlayed,
        favorites,
        genres,
        collections,
        all,
      ].where((r) => r.items.isNotEmpty).toList();

      _featured = resume.items.isNotEmpty
          ? resume.items.first
          : (latest.items.isNotEmpty ? latest.items.first : null);
      _titleCount = all.totalCount > 0 ? all.totalCount : all.items.length;
      _genreCount = genres.items.length;
      _seriesCount = 0;
      _authorCount = 0;
    } catch (_) {}

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _rows = [];
    notifyListeners();
    await load();
  }

  Future<HomeRow> _loadBookCollections() async {
    final raw = await _dataSource.loadLibraryCollections(libraryId, _serverId);
    if (raw.items.isEmpty) return raw;
    final types = _itemTypes;
    final containsBooks = await Future.wait(
      raw.items.map((box) async {
        try {
          final resp = await _client.itemsApi.getItems(
            parentId: box.id,
            includeItemTypes: types,
            recursive: true,
            limit: 8,
          );
          final items = (resp['Items'] as List?) ?? const [];
          return items.any((it) {
            final type = (it is Map ? it['Type'] : null) as String?;
            return type != null && types.contains(type);
          });
        } catch (_) {
          return false;
        }
      }),
    );
    final kept = <AggregatedItem>[
      for (var i = 0; i < raw.items.length; i++)
        if (containsBooks[i]) raw.items[i],
    ];
    return raw.copyWith(items: kept);
  }

  String bookSubtitle(AggregatedItem item) {
    switch (item.type) {
      case 'BoxSet':
        final count = item.childCount;
        return count != null && count > 0 ? '$count items' : '';
      default:
        final author =
            (item.rawData['AlbumArtist'] as String?) ??
            item.seriesName ??
            (item.rawData['Artists'] as List?)?.cast<String>().firstOrNull ??
            '';
        return author;
    }
  }

  String? bookImageUrl(AggregatedItem item) {
    if (item.primaryImageTag != null) {
      return imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 400,
        tag: item.primaryImageTag,
      );
    }
    final albumTag = item.albumPrimaryImageTag;
    final albumId = item.albumId;
    if (albumTag != null && albumId != null) {
      return imageApi.getPrimaryImageUrl(
        albumId,
        maxHeight: 400,
        tag: albumTag,
      );
    }
    final parentTag =
        (item.rawData['SeriesPrimaryImageTag'] as String?) ??
        (item.rawData['ParentPrimaryImageTag'] as String?);
    final parentId =
        item.rawData['SeriesId']?.toString() ??
        item.rawData['ParentPrimaryImageItemId']?.toString() ??
        item.parentId;
    if (parentTag != null && parentId != null) {
      return imageApi.getPrimaryImageUrl(parentId, maxHeight: 400, tag: parentTag);
    }
    return null;
  }
}
