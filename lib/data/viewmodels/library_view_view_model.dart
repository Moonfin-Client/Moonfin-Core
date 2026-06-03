import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../services/row_data_source.dart';

class LibraryViewViewModel extends ChangeNotifier {
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

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  String get _serverId => _client.baseUrl;
  ImageApi get imageApi => _dataSource.imageApi;

  LibraryViewViewModel({
    required this.libraryId,
    required RowDataSource dataSource,
    required MediaServerClient client,
  })  : _dataSource = dataSource,
        _client = client;

  void setFocusedItem(AggregatedItem? item) {
    _focusedItem = item;
    notifyListeners();
  }

  Future<void> load() async {
    _isLoading = true;
    _rows = [];
    notifyListeners();

    try {
      final itemData = await _client.itemsApi.getItem(libraryId);
      _libraryName = itemData['Name'] as String? ?? '';
      _collectionType = (itemData['CollectionType'] as String?)?.toLowerCase();
    } catch (_) {
    }

    final orderedRows = <int, HomeRow>{};
    final rowLoads = _rowLoadsForType();
    final tasks = <Future<void>>[];

    for (var i = 0; i < rowLoads.length; i++) {
      final index = i;
      tasks.add(() async {
        try {
          final row = await rowLoads[index];
          if (row.items.isNotEmpty) {
            orderedRows[index] = row;
            _rows = _orderedRows(orderedRows);
            notifyListeners();
          }
        } catch (_) {
        }
      }());
    }

    await Future.wait(tasks);

    _isLoading = false;
    notifyListeners();
  }

  List<HomeRow> _orderedRows(Map<int, HomeRow> rowsByIndex) {
    final sortedEntries = rowsByIndex.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return sortedEntries.map((entry) => entry.value).toList(growable: false);
  }

  List<Future<HomeRow>> _rowLoadsForType() {
    final l10n = currentAppLocalizations();
    switch (_collectionType) {
      case 'movies':
        return [
          _dataSource.loadLibraryResume(libraryId, _serverId),
          _dataSource.loadLatestMedia(
            libraryId,
            _libraryName,
            _serverId,
            _collectionType,
          ),
          _dataSource.loadLibraryFavorites(libraryId, _serverId,
              includeItemTypes: ['Movie']),
          _dataSource.loadLibraryCollections(libraryId, _serverId),
        ];
      case 'tvshows':
        return [
          _dataSource.loadLibraryResume(libraryId, _serverId),
          _dataSource.loadLibraryNextUp(libraryId, _serverId),
          _dataSource.loadLatestMedia(
            libraryId,
            _libraryName,
            _serverId,
            _collectionType,
          ),
          _dataSource.loadLibraryFavorites(libraryId, _serverId,
              includeItemTypes: ['Series']),
        ];
      case 'music':
        return [
          _dataSource.loadLatestMedia(
            libraryId,
            _libraryName,
            _serverId,
            _collectionType,
          ),
          _dataSource.loadLibraryLastPlayed(libraryId, _serverId,
              includeItemTypes: ['Audio']),
          _dataSource.loadLibraryFavorites(libraryId, _serverId,
              includeItemTypes: ['MusicAlbum']),
          _dataSource.loadPlaylists(_serverId, mediaType: 'Audio'),
          _dataSource.loadLibraryItemsByType(libraryId, _serverId,
              title: l10n.albumArtists,
              includeItemTypes: ['AlbumArtist'],
              sortBy: 'SortName'),
          _dataSource.loadLibraryItemsByType(libraryId, _serverId,
              title: l10n.artists,
              includeItemTypes: ['MusicArtist'],
              sortBy: 'SortName'),
          _dataSource.loadLibraryItemsByType(libraryId, _serverId,
              title: l10n.albums,
              includeItemTypes: ['MusicAlbum'],
              sortBy: 'DateCreated',
              sortOrder: 'Descending'),
        ];
      default:
        return [
          _dataSource.loadLatestMedia(
            libraryId,
            _libraryName,
            _serverId,
            _collectionType,
          ),
          _dataSource.loadLibraryFavorites(libraryId, _serverId),
        ];
    }
  }

  Future<void> refresh() async {
    _rows = [];
    notifyListeners();
    await load();
  }
}
