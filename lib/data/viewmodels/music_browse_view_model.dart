import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../services/row_data_source.dart';

class MusicBrowseViewModel extends ChangeNotifier {
  final RowDataSource _dataSource;
  final MediaServerClient _client;
  final String libraryId;

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  final Map<String, int> _rowOffsets = {};
  final Set<String> _inFlightPagingRowIds = {};

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _libraryName = '';
  String get libraryName => _libraryName;

  AggregatedItem? _focusedItem;
  AggregatedItem? get focusedItem => _focusedItem;

  AggregatedItem? get featuredItem {
    for (final row in _rows) {
      if (row.id.startsWith('lastPlayed_') && row.items.isNotEmpty) {
        return row.items.first;
      }
    }
    for (final row in _rows) {
      if (row.items.isNotEmpty) return row.items.first;
    }
    return null;
  }

  String get _serverId => _client.baseUrl;
  ImageApi get imageApi => _dataSource.imageApi;

  MusicBrowseViewModel({
    required this.libraryId,
    required RowDataSource dataSource,
    required MediaServerClient client,
  }) : _dataSource = dataSource,
       _client = client;

  void setFocusedItem(AggregatedItem? item) {
    _focusedItem = item;
    notifyListeners();
  }

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();
    _rowOffsets.clear();
    final l10n = currentAppLocalizations();
    final prefs = GetIt.instance<UserPreferences>();

    try {
      final itemData = await _client.itemsApi.getItem(libraryId);
      _libraryName = itemData['Name'] as String? ?? l10n.music;
    } catch (e) {
      debugPrint('Failed to load library info: $e');
    }

    try {
      final showLatest = prefs.get(UserPreferences.displayAudioLatest);
      final showLastPlayed = prefs.get(UserPreferences.displayAudioLastPlayed);
      final showFavorites = prefs.get(UserPreferences.displayAudioFavorites);
      final showPlaylists = prefs.get(UserPreferences.displayAudioPlaylists);
      final showAlbumArtists = prefs.get(UserPreferences.displayAudioAlbumArtists);
      final showArtists = prefs.get(UserPreferences.displayAudioArtists);
      final showAlbums = prefs.get(UserPreferences.displayAudioAlbums);

      final sortOpt = prefs.get(UserPreferences.audioSortOption);

      final (albumArtistSortBy, albumArtistSortOrder) = _resolveSort(sortOpt, 'AlbumArtist');
      final (artistSortBy, artistSortOrder) = _resolveSort(sortOpt, 'MusicArtist');
      final (albumSortBy, albumSortOrder) = _resolveSort(sortOpt, 'MusicAlbum');
      final (playlistSortBy, playlistSortOrder) = _resolveSort(sortOpt, 'Playlist');
      final (favoritesSortBy, favoritesSortOrder) = _resolveSort(sortOpt, 'Favorites');

      final results = await Future.wait([
        showLatest
            ? _dataSource.loadLatestMedia(libraryId, _libraryName, _serverId)
            : Future.value(HomeRow(id: 'latest_$libraryId', title: '', items: const [], rowType: HomeRowType.latestMedia)),
        showLastPlayed
            ? _dataSource.loadLibraryLastPlayed(
                libraryId,
                _serverId,
                includeItemTypes: const ['Audio'],
              )
            : Future.value(HomeRow(id: 'lastPlayed_$libraryId', title: '', items: const [], rowType: HomeRowType.latestMedia)),
        showFavorites
            ? _dataSource.loadLibraryFavorites(
                libraryId,
                _serverId,
                includeItemTypes: const ['MusicAlbum'],
                sortBy: favoritesSortBy,
                sortOrder: favoritesSortOrder,
              )
            : Future.value(HomeRow(id: 'favorites_$libraryId', title: '', items: const [], rowType: HomeRowType.favorites)),
        showPlaylists
            ? _dataSource.loadPlaylists(_serverId, mediaType: 'Audio', sortBy: playlistSortBy, sortOrder: playlistSortOrder)
            : Future.value(HomeRow(id: 'playlists', title: '', items: const [], rowType: HomeRowType.playlists)),
        showAlbumArtists
            ? _dataSource.loadLibraryItemsByType(
                libraryId,
                _serverId,
                title: l10n.albumArtists,
                includeItemTypes: const ['AlbumArtist'],
                sortBy: albumArtistSortBy,
                sortOrder: albumArtistSortOrder,
              )
            : Future.value(HomeRow(id: 'albumartist_$libraryId', title: '', items: const [], rowType: HomeRowType.latestMedia)),
        showArtists
            ? _dataSource.loadLibraryItemsByType(
                libraryId,
                _serverId,
                title: l10n.artists,
                includeItemTypes: const ['MusicArtist'],
                sortBy: artistSortBy,
                sortOrder: artistSortOrder,
              )
            : Future.value(HomeRow(id: 'musicartist_$libraryId', title: '', items: const [], rowType: HomeRowType.latestMedia)),
        showAlbums
            ? _dataSource.loadLibraryItemsByType(
                libraryId,
                _serverId,
                title: l10n.albums,
                includeItemTypes: const ['MusicAlbum'],
                sortBy: albumSortBy,
                sortOrder: albumSortOrder,
              )
            : Future.value(HomeRow(id: 'musicalbum_$libraryId', title: '', items: const [], rowType: HomeRowType.latestMedia)),
      ]);

      _rows = results.where((r) => r.items.isNotEmpty).toList();
    } catch (e) {
      debugPrint('Failed to load music rows: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _rows = [];
    notifyListeners();
    await load();
  }

  String getMusicSubtitle(AggregatedItem item) {
    switch (item.type) {
      case 'Audio':
      case 'MusicAlbum':
        if (item.artists.isNotEmpty) return item.artists.join(', ');
        if (item.albumArtists.isNotEmpty) {
          return item.albumArtists
              .map((a) => a['Name'] as String? ?? '')
              .where((n) => n.isNotEmpty)
              .join(', ');
        }
        return item.albumArtist ?? '';
      case 'Playlist':
        final count = item.childCount;
        return count != null && count > 0 ? '$count items' : '';
      case 'MusicArtist':
        final count = item.recursiveItemCount;
        return count != null && count > 0 ? '$count albums' : '';
      default:
        return '';
    }
  }

  String? getMusicImageUrl(AggregatedItem item) {
    final albumPrimaryTag = item.rawData['AlbumPrimaryImageTag'] as String?;
    final albumId = item.rawData['AlbumId']?.toString();
    if (item.type == 'Audio' && albumPrimaryTag != null && albumId != null) {
      return imageApi.getPrimaryImageUrl(
        albumId,
        maxHeight: 300,
        tag: albumPrimaryTag,
      );
    }
    if (item.primaryImageTag != null) {
      return imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 300,
        tag: item.primaryImageTag,
      );
    }
    final parentPrimaryTag =
        (item.rawData['ParentPrimaryImageTag'] as String?) ??
        (item.rawData['ImageTags'] as Map?)?['ParentPrimary'] as String?;
    final parentPrimaryId =
        item.rawData['ParentPrimaryImageItemId']?.toString() ?? item.parentId;
    if (parentPrimaryTag != null && parentPrimaryId != null) {
      return imageApi.getPrimaryImageUrl(
        parentPrimaryId,
        maxHeight: 300,
        tag: parentPrimaryTag,
      );
    }
    return null;
  }

  Future<void> loadMoreForRow(int rowIndex) async {
    if (rowIndex < 0 || rowIndex >= _rows.length) return;
    final row = _rows[rowIndex];
    if (!row.hasMore || _inFlightPagingRowIds.contains(row.id)) return;

    _inFlightPagingRowIds.add(row.id);
    try {
      final int currentOffset = _rowOffsets[row.id] ?? row.items.length;
      final (List<AggregatedItem> items, int totalCount) result = await _dataSource.loadMore(
        row: row,
        serverId: _serverId,
        offset: currentOffset,
      );
      _rowOffsets[row.id] = currentOffset + 15;

      _rows = List.of(_rows);
      _rows[rowIndex] = row.copyWith(
        items: result.$1,
        totalCount: result.$2,
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load more for music row ${row.id}: $e');
    } finally {
      _inFlightPagingRowIds.remove(row.id);
    }
  }

  (String, String) _resolveSort(String? sortOpt, String type) {
    if (sortOpt == 'release_year' &&
        (type == 'MusicAlbum' || type == 'Favorites')) {
      return ('ProductionYear,SortName', 'Descending');
    } else if (sortOpt == 'date_added') {
      return ('DateCreated', 'Descending');
    }
    return ('SortName', 'Ascending');
  }
}
