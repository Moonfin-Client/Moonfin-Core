import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
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
      'Type,ProductionYear,ImageTags,BackdropImageTags,ChildCount,ParentThumbItemId,ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag';
  // Cap image tags to one per type (server returns all by default)
  static const _imageTypes = 'Primary,Backdrop,Thumb';
  static const _imageTypeLimit = 1;

  FolderBrowseViewModel(this._client, {String? serverId})
      : _serverId = serverId;

  ImageApi get imageApi => _client.imageApi;

  FolderBrowseState _state = FolderBrowseState.loading;
  FolderBrowseState get state => _state;

  List<AggregatedItem> _items = const [];
  List<AggregatedItem> get items => _items;

  int _totalCount = 0;
  bool _totalCountKnown = true;
  bool _hasMoreFromPageSize = false;

  bool get hasMore => _totalCountKnown ? _items.length < _totalCount : _hasMoreFromPageSize;

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
    _totalCountKnown = true;
    _hasMoreFromPageSize = false;
    _notify();

    try {
      if (!_breadcrumbs.any((b) => b.id == folderId)) {
        final folderData = await _client.itemsApi.getItem(folderId);
        if (_disposed) return;
        final folderName = folderData['Name'] as String? ?? '';
        if (_breadcrumbs.isEmpty) {
          _rootCollectionType =
              (folderData['CollectionType'] as String?)?.toLowerCase();
        }
        _breadcrumbs.add(BreadcrumbEntry(id: folderId, name: folderName));
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

  Future<void> navigateTo(int breadcrumbIndex) async {
    if (breadcrumbIndex < 0 || breadcrumbIndex >= _breadcrumbs.length) return;
    final target = _breadcrumbs[breadcrumbIndex];
    _breadcrumbs.removeRange(breadcrumbIndex + 1, _breadcrumbs.length);
    await loadFolder(target.id);
  }

  Future<void> enterFolder(AggregatedItem item) async {
    await loadFolder(item.id);
  }

  Future<void> loadMore() async {
    if (_loadingMore || !hasMore) return;
    _loadingMore = true;
    _notify();

    try {
      await _fetchPage(currentFolderId, _items.length);
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
    final totalFromServer = response['TotalRecordCount'] as int?;
    _totalCountKnown = totalFromServer != null;
    if (_totalCountKnown) {
      _totalCount = totalFromServer!;
      _hasMoreFromPageSize = _items.length + rawItems.length < _totalCount;
    } else {
      _hasMoreFromPageSize = rawItems.length == _pageSize;
      final loadedCount = startIndex + rawItems.length;
      _totalCount = loadedCount + (_hasMoreFromPageSize ? 1 : 0);
    }

    final mapped =
        rawItems.cast<Map<String, dynamic>>().map((raw) {
          return AggregatedItem(
            id: raw['Id'] as String,
            serverId: (_serverId != null && _serverId.isNotEmpty)
                ? _serverId
                : _client.baseUrl,
            rawData: raw,
          );
        }).toList();

    final filtered = await _filterItemsForFolder(mapped);

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
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode < 500) {
        rethrow;
      }

      return _client.itemsApi.getItems(
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
    final type = item.type;
    if (type == 'Series' ||
        type == 'Season' ||
        type == 'BoxSet' ||
        type == 'Playlist') {
      return false;
    }

    final isFolder = item.rawData['IsFolder'] as bool? ?? false;
    if (isFolder) return true;

    return type == 'Folder' ||
        type == 'CollectionFolder' ||
        type == 'UserView' ||
        type == 'MusicAlbum' ||
        type == 'PhotoAlbum';
  }


  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
