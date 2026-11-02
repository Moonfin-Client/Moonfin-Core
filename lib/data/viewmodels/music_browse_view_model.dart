import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../repositories/item_mutation_repository.dart';
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

  /// Whether [featuredItem] is something played recently rather than the
  /// first item of whatever row came back.
  bool get featuredIsRecent =>
      _rows.any((r) => r.id.startsWith('lastPlayed_') && r.items.isNotEmpty);

  /// The album behind [featuredItem], loaded by [loadFeaturedAlbum].
  AggregatedItem? _featuredAlbum;
  AggregatedItem? get featuredAlbum => _featuredAlbum;

  /// [featuredAlbum]'s songs in album order.
  List<AggregatedItem> _featuredTracks = const [];
  List<AggregatedItem> get featuredTracks => _featuredTracks;

  List<AggregatedItem> _genres = const [];
  List<AggregatedItem> get genres => _genres;

  String get _serverId => _client.baseUrl;
  ImageApi get imageApi => _dataSource.imageApi;

  MusicBrowseViewModel({
    required this.libraryId,
    required RowDataSource dataSource,
    required MediaServerClient client,
  }) : _dataSource = dataSource,
       _client = client;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  // The screen can close while a load is still running.
  @override
  void notifyListeners() {
    if (!_disposed) super.notifyListeners();
  }

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

  /// Loads the album behind [featuredItem] with its songs: the item itself
  /// when it's an album, a song's album otherwise.
  Future<void> loadFeaturedAlbum() async {
    final featured = featuredItem;
    final albumId = featured?.type == 'MusicAlbum'
        ? featured!.id
        : featured?.albumId;
    if (albumId == null || albumId.isEmpty) {
      _featuredAlbum = null;
      _featuredTracks = const [];
      notifyListeners();
      return;
    }
    try {
      final (album, tracks) = await (
        _client.itemsApi.getItem(albumId),
        _client.itemsApi.getItems(
          parentId: albumId,
          includeItemTypes: const ['Audio'],
          sortBy: 'ParentIndexNumber,IndexNumber,SortName',
          fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
        ),
      ).wait;
      _featuredAlbum = AggregatedItem(
        id: albumId,
        serverId: _serverId,
        rawData: album,
      );
      _featuredTracks = _itemsOf(tracks);
    } catch (e) {
      debugPrint('Failed to load the featured album: $e');
    }
    notifyListeners();
  }

  Future<void> loadGenres() async {
    try {
      _genres = _itemsOf(
        await _client.itemsApi.getGenres(
          parentId: libraryId,
          userId: _client.userId,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          limit: 8,
        ),
      );
    } catch (e) {
      debugPrint('Failed to load music genres: $e');
    }
    notifyListeners();
  }

  Future<void> setFeaturedAlbumFavorite(bool isFavorite) async {
    final album = _featuredAlbum;
    if (album == null) return;
    try {
      await GetIt.instance<ItemMutationRepository>().setFavorite(
        album.id,
        isFavorite: isFavorite,
      );
    } catch (e) {
      debugPrint('Failed to update the featured album favorite: $e');
      return;
    }
    final userData = (album.rawData['UserData'] as Map?)
        ?.cast<String, dynamic>();
    _featuredAlbum = AggregatedItem(
      id: album.id,
      serverId: album.serverId,
      rawData: {
        ...album.rawData,
        'UserData': {...?userData, 'IsFavorite': isFavorite},
      },
    );
    notifyListeners();
  }

  List<AggregatedItem> _itemsOf(Map<String, dynamic> response) =>
      ((response['Items'] as List?) ?? const [])
          .whereType<Map>()
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: _serverId,
              rawData: raw.cast<String, dynamic>(),
            ),
          )
          .where((item) => item.id.isNotEmpty)
          .toList();

  String getMusicSubtitle(AggregatedItem item) {
    switch (item.type) {
      case 'Audio':
      case 'MusicAlbum':
        return musicArtistNames(item);
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

  String? getMusicImageUrl(AggregatedItem item, {int maxHeight = 300}) =>
      musicItemImageUrl(imageApi, item, maxHeight: maxHeight);

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

/// Who made a song or album: its artists, or else its album artists.
String musicArtistNames(AggregatedItem item) {
  if (item.artists.isNotEmpty) return item.artists.join(', ');
  final names = item.albumArtists
      .map((artist) => artist['Name'] as String? ?? '')
      .where((name) => name.isNotEmpty);
  if (names.isNotEmpty) return names.join(', ');
  return item.albumArtist ?? '';
}

/// A song's artist and album.
String musicSongLine(AggregatedItem item) {
  final artist = musicArtistNames(item);
  final album = item.album;
  if (album == null || album.isEmpty) return artist;
  return artist.isEmpty ? album : '$artist · $album';
}

/// An item's art: a song's album art, the item's own, or else its parent's.
String? musicItemImageUrl(
  ImageApi imageApi,
  AggregatedItem item, {
  int maxHeight = 300,
}) {
  final albumPrimaryTag = item.rawData['AlbumPrimaryImageTag'] as String?;
  final albumId = item.rawData['AlbumId']?.toString();
  if (item.type == 'Audio' && albumPrimaryTag != null && albumId != null) {
    return imageApi.getPrimaryImageUrl(
      albumId,
      maxHeight: maxHeight,
      tag: albumPrimaryTag,
    );
  }
  if (item.primaryImageTag != null) {
    return imageApi.getPrimaryImageUrl(
      item.id,
      maxHeight: maxHeight,
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
      maxHeight: maxHeight,
      tag: parentPrimaryTag,
    );
  }
  return null;
}
