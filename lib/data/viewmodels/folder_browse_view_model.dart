import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
import '../repositories/user_views_repository.dart';
import '../utils/playlist_utils.dart';

class BreadcrumbEntry {
  final String id;
  final String name;

  const BreadcrumbEntry({required this.id, required this.name});
}

enum FolderBrowseState { loading, ready, error }

class FolderBrowseViewModel extends ChangeNotifier {
  final MediaServerClient _client;

  final String? _serverId;

  static const _pageSize = 100;
  static const _fields =
      'Path,FileName,Type,ProductionYear,ImageTags,BackdropImageTags,ChildCount,ParentThumbItemId,ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag';
  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb,Banner';
  static const _imageTypeLimit = 1;

  FolderBrowseViewModel(this._client, {String? serverId})
    : _serverId = serverId;

  ImageApi get imageApi => _client.imageApi;

  FolderBrowseState _state = FolderBrowseState.loading;
  FolderBrowseState get state => _state;

  List<AggregatedItem> _items = const [];
  List<AggregatedItem> get items => _items;

  int _totalCount = 0;
  int _rawItemsFetched = 0;
  bool _totalCountKnown = true;
  bool _hasMoreFromPageSize = false;

  bool get hasMore =>
      _totalCountKnown ? _rawItemsFetched < _totalCount : _hasMoreFromPageSize;

  bool _loadingMore = false;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  final List<BreadcrumbEntry> _breadcrumbs = [];
  List<BreadcrumbEntry> get breadcrumbs => List.unmodifiable(_breadcrumbs);

  String? _rootCollectionType;
  bool _disposed = false;

  String get currentFolderId =>
      _breadcrumbs.isNotEmpty ? _breadcrumbs.last.id : '';

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  Future<void> loadFolder(String folderId) async {
    _state = FolderBrowseState.loading;
    _items = const [];
    _totalCount = 0;
    _rawItemsFetched = 0;
    _totalCountKnown = true;
    _hasMoreFromPageSize = false;
    _notify();

    if (folderId == 'root' || folderId.isEmpty) {
      try {
        _breadcrumbs.clear();
        _breadcrumbs.add(const BreadcrumbEntry(id: 'root', name: 'Folders'));
        final userViews =
            await GetIt.instance<UserViewsRepository>().getUserViews();
        if (_disposed) return;
        _items = userViews.map((lib) {
          return AggregatedItem(
            id: lib.id,
            serverId: lib.serverId,
            rawData: {
              'Id': lib.id,
              'Name': lib.name,
              'Type': 'CollectionFolder',
              'CollectionType': lib.collectionType,
              'IsFolder': true,
              'ImageTags': lib.imageTags ?? {},
              'BackdropImageTags': lib.backdropImageTags ?? [],
            },
          );
        }).toList();
        _totalCount = _items.length;
        _rawItemsFetched = _items.length;
        _totalCountKnown = true;
        _hasMoreFromPageSize = false;
        _state = FolderBrowseState.ready;
      } catch (e) {
        if (_disposed) return;
        _errorMessage = e.toString();
        _state = FolderBrowseState.error;
      }
      _notify();
      return;
    }

    try {
      final chain = <BreadcrumbEntry>[];
      var currentId = folderId;
      final visited = <String>{};

      while (currentId.isNotEmpty && visited.add(currentId)) {
        try {
          final data = await _client.itemsApi.getItem(currentId);
          if (_disposed) return;
          final name = data['Name'] as String? ?? '';
          final type = (data['Type'] as String?) ?? '';
          chain.insert(0, BreadcrumbEntry(id: currentId, name: name));

          final collectionType = data['CollectionType'] as String?;
          if (collectionType != null && collectionType.isNotEmpty) {
            _rootCollectionType = collectionType.toLowerCase();
          }

          final parentId = data['ParentId'] as String?;
          if (parentId == null || parentId.isEmpty || type == 'UserView') {
            break;
          }
          currentId = parentId;
        } catch (_) {
          break;
        }
      }

      if (_disposed) return;
      if (chain.isNotEmpty) {
        _breadcrumbs.clear();
        _breadcrumbs.add(const BreadcrumbEntry(id: 'root', name: 'Folders'));
        for (final entry in chain) {
          final isRootDuplicate = entry.id == 'root' ||
              entry.name.toLowerCase() == 'root' ||
              entry.name.toLowerCase() == 'media folders';
          if (!isRootDuplicate) {
            _breadcrumbs.add(entry);
          }
        }
      } else if (!_breadcrumbs.any((b) => b.id == folderId)) {
        _breadcrumbs.add(const BreadcrumbEntry(id: 'root', name: 'Folders'));
        _breadcrumbs.add(BreadcrumbEntry(id: folderId, name: ''));
      }

      await _fetchPage(folderId, 0);
      if (_disposed) return;
      _state = FolderBrowseState.ready;
    } catch (e) {
      if (_disposed) return;
      _errorMessage = e.toString();
      _state = FolderBrowseState.error;
    }
    _notify();
  }

  Future<void> loadMore() async {
    if (_loadingMore || !hasMore) return;
    _loadingMore = true;
    _notify();

    final prevRawFetched = _rawItemsFetched;
    try {
      await _fetchPage(currentFolderId, _rawItemsFetched);
      if (!_disposed && _rawItemsFetched <= prevRawFetched) {
        _totalCount = _items.length;
        _hasMoreFromPageSize = false;
      }
    } catch (_) {}

    if (_disposed) return;
    _loadingMore = false;
    _notify();
  }

  Future<List<AggregatedItem>> _filterItemsForFolder(
    List<AggregatedItem> items,
  ) async {
    final isPlaylistRoot = _rootCollectionType == 'playlists';
    if (!isPlaylistRoot) return items;

    return filterBrowsablePlaylists(
      _client,
      items,
      assumeNonEmptyWhenUnknown: true,
    );
  }

  Future<void> _fetchPage(String parentId, int startIndex) async {
    final response = await _fetchItemsWithFallback(
      parentId: parentId,
      startIndex: startIndex,
    );

    final rawItems = (response['Items'] as List?) ?? [];
    _rawItemsFetched += rawItems.length;
    final totalFromServer = response['TotalRecordCount'] as int?;
    _totalCountKnown = totalFromServer != null;
    if (_totalCountKnown) {
      _totalCount = totalFromServer!;
      _hasMoreFromPageSize = _rawItemsFetched < _totalCount;
    } else {
      _hasMoreFromPageSize = rawItems.length == _pageSize;
      final loadedCount = startIndex + rawItems.length;
      _totalCount = loadedCount + (_hasMoreFromPageSize ? 1 : 0);
    }

    final mapped = rawItems.cast<Map<String, dynamic>>().map((raw) {
      return AggregatedItem(
        id: raw['Id']?.toString() ?? '',
        serverId: (_serverId != null && _serverId.isNotEmpty)
            ? _serverId
            : _client.baseUrl,
        rawData: raw,
      );
    }).toList();

    final filtered = await _filterItemsForFolder(mapped);

    // The server orders directories first and each group by name, across the
    // whole folder rather than a page at a time, so pages only ever append.
    if (startIndex == 0) {
      _items = filtered;
    } else {
      _items = [..._items, ...filtered];
    }
  }

  Future<Map<String, dynamic>> _fetchItemsWithFallback({
    required String parentId,
    required int startIndex,
  }) async {
    try {
      return await _client.itemsApi.getItems(
        parentId: parentId,
        recursive: false,
        sortBy: 'IsFolder,SortName',
        sortOrder: 'Ascending',
        startIndex: startIndex,
        limit: _pageSize,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableTotalRecordCount: true,
      );
    } on DioException catch (e) {
      // The retry only drops the total count, which some servers fault on, so
      // a request the server rejected outright would just be rejected again.
      if ((e.response?.statusCode ?? 0) < 500) rethrow;
      return await _client.itemsApi.getItems(
        parentId: parentId,
        recursive: false,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        startIndex: startIndex,
        limit: _pageSize,
        fields: _fields,
        enableImageTypes: _imageTypes,
        imageTypeLimit: _imageTypeLimit,
        enableTotalRecordCount: false,
      );
    }
  }

  bool isNavigableFolder(AggregatedItem item) {
    final isFolder = item.rawData['IsFolder'] as bool? ?? false;
    if (isFolder) return true;

    final type = item.type;
    return type == 'Folder' ||
        type == 'CollectionFolder' ||
        type == 'UserView' ||
        type == 'PhotoAlbum' ||
        type == 'Series' ||
        type == 'Season' ||
        type == 'BoxSet' ||
        type == 'MusicArtist' ||
        type == 'MusicAlbum' ||
        type == 'AlbumArtist' ||
        type == 'BookSeries';
  }

  /// The server's name for [item], except where that name was scraped for
  /// something the folder isn't, in which case the folder on disk is closer.
  String getItemDisplayName(AggregatedItem item) {
    if (!_isMisidentifiedDirectory(item)) return item.name;

    final rawPath = item.rawData['Path'] as String?;
    if (rawPath != null && rawPath.isNotEmpty) {
      final segments = rawPath
          .replaceAll('\\', '/')
          .split('/')
          .where((s) => s.isNotEmpty);
      if (segments.isNotEmpty) return segments.last;
    }

    final fileName = item.rawData['FileName'] as String?;
    if (fileName != null && fileName.isNotEmpty) return fileName;

    return item.name;
  }

  /// A scraped show carries a year and artwork. One that matched nothing but
  /// still got typed as a show is almost always just a directory.
  bool _isMisidentifiedDirectory(AggregatedItem item) {
    const scrapedTypes = {'Series', 'Season', 'BoxSet', 'BookSeries'};
    if (!scrapedTypes.contains(item.type)) return false;
    if (item.productionYear != null) return false;
    final imageTags = item.rawData['ImageTags'];
    return imageTags is! Map || imageTags.isEmpty;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
