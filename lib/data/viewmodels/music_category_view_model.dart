import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
import '../utils/playlist_utils.dart';

/// One page of items and how many the server has in all.
typedef MusicPage = ({List<AggregatedItem> items, int total});

/// The ready-made mixes on the Songs screen.
enum MusicMix { everything, mostPlayed, freshArrivals, rediscover }

/// How the Albums screen orders its albums.
enum MusicAlbumSort { recentlyAdded, name, year, artist }

/// The queries behind the music category screens, each kept inside one
/// library.
class MusicLibraryQueries {
  final String libraryId;
  final MediaServerClient client;

  MusicLibraryQueries({required this.libraryId, required this.client});

  static const _fields =
      'PrimaryImageAspectRatio,SortName,ProductionYear,AlbumArtist,Artists,'
      'Genres,ChildCount,RecursiveItemCount,RunTimeTicks,UserData,Album,'
      'AlbumId,DateCreated';

  String get serverId => client.baseUrl;

  Future<MusicPage> items(
    List<String> types, {
    String sortBy = 'SortName',
    bool descending = false,
    int start = 0,
    int limit = 100,
    List<String>? genreIds,
    bool? favorite,
    List<String>? filters,
  }) async => _page(
    await client.itemsApi.getItems(
      parentId: libraryId,
      includeItemTypes: types,
      recursive: true,
      sortBy: sortBy,
      sortOrder: descending ? 'Descending' : 'Ascending',
      startIndex: start,
      limit: limit,
      genreIds: genreIds,
      isFavorite: favorite,
      filters: filters,
      fields: _fields,
      enableTotalRecordCount: true,
    ),
  );

  Future<MusicPage> albums(
    MusicAlbumSort sort, {
    String? genreId,
    int start = 0,
    int limit = 100,
  }) {
    final (sortBy, descending) = switch (sort) {
      MusicAlbumSort.recentlyAdded => ('DateCreated,SortName', true),
      MusicAlbumSort.name => ('SortName', false),
      MusicAlbumSort.year => ('ProductionYear,PremiereDate,SortName', true),
      MusicAlbumSort.artist => ('AlbumArtist,SortName', false),
    };
    return items(
      const ['MusicAlbum'],
      sortBy: sortBy,
      descending: descending,
      start: start,
      limit: limit,
      genreIds: genreId == null ? null : [genreId],
    );
  }

  /// Album artists, or every artist, by name.
  Future<MusicPage> artists({
    required bool albumArtists,
    bool descending = false,
    bool? favorite,
    int start = 0,
    int limit = 100,
  }) async {
    final api = client.itemsApi;
    final load = albumArtists ? api.getAlbumArtists : api.getArtists;
    return _page(
      await load(
        parentId: libraryId,
        userId: client.userId,
        sortBy: 'SortName',
        sortOrder: descending ? 'Descending' : 'Ascending',
        startIndex: start,
        limit: limit,
        recursive: true,
        fields: 'PrimaryImageAspectRatio,SortName',
        isFavorite: favorite,
      ),
    );
  }

  /// The audio playlists by name. Playlists don't live in the library, so
  /// these are all of the user's music playlists.
  Future<List<AggregatedItem>> playlists({bool? favorite}) async {
    final page = _page(
      await client.itemsApi.getItems(
        includeItemTypes: const ['Playlist'],
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        isFavorite: favorite,
        fields: _fields,
      ),
    );
    return filterBrowsablePlaylists(
      client,
      page.items.where((item) => item.type == 'Playlist').toList(),
      mediaType: 'Audio',
    );
  }

  /// An album's songs in album order.
  Future<List<AggregatedItem>> albumTracks(String albumId) async => _page(
    await client.itemsApi.getItems(
      parentId: albumId,
      includeItemTypes: const ['Audio'],
      sortBy: 'ParentIndexNumber,IndexNumber,SortName',
      fields: _fields,
    ),
  ).items;

  Future<List<AggregatedItem>> playlistTracks(String playlistId) async =>
      _page(await client.itemsApi.getPlaylistItems(playlistId)).items;

  /// The library's genres with how many albums each holds.
  Future<List<AggregatedItem>> genres() async => _page(
    await client.itemsApi.getGenres(
      parentId: libraryId,
      userId: client.userId,
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      recursive: true,
      fields: 'ItemCounts',
      includeItemTypes: const ['MusicAlbum'],
    ),
  ).items;

  Future<List<AggregatedItem>> shuffleGenre(String genreId) async => (await items(
    const ['Audio'],
    sortBy: 'Random',
    limit: 300,
    genreIds: [genreId],
  )).items;

  /// The songs of [mix], or its first [limit] when given.
  Future<List<AggregatedItem>> mix(
    MusicMix mix, {
    int? limit,
    Random? random,
  }) async {
    const audio = ['Audio'];
    final page = await switch (mix) {
      MusicMix.everything => items(audio, sortBy: 'Random', limit: limit ?? 300),
      MusicMix.mostPlayed => items(
        audio,
        sortBy: 'PlayCount,SortName',
        descending: true,
        filters: const ['IsPlayed'],
        limit: limit ?? 100,
      ),
      MusicMix.freshArrivals => items(
        audio,
        sortBy: 'DateCreated,SortName',
        descending: true,
        limit: limit ?? 100,
      ),
      MusicMix.rediscover => items(
        audio,
        sortBy: 'DatePlayed,SortName',
        favorite: true,
        limit: limit ?? 100,
      ),
    };
    if (mix != MusicMix.rediscover) return page.items;
    return List.of(page.items)..shuffle(random);
  }

  /// How many songs the library holds.
  Future<int> songCount() async =>
      (await items(const ['Audio'], limit: 0)).total;

  MusicPage _page(Map<String, dynamic> response) {
    final items = ((response['Items'] as List?) ?? const [])
        .whereType<Map>()
        .map(
          (raw) => AggregatedItem(
            id: raw['Id']?.toString() ?? '',
            serverId: serverId,
            rawData: raw.cast<String, dynamic>(),
          ),
        )
        .where((item) => item.id.isNotEmpty)
        .toList();
    final total = (response['TotalRecordCount'] as num?)?.toInt();
    return (items: items, total: max(total ?? 0, items.length));
  }
}

/// How many albums a genre from [MusicLibraryQueries.genres] holds, or null
/// when the server didn't count them.
int? musicGenreAlbumCount(AggregatedItem genre) {
  final count =
      (genre.rawData['AlbumCount'] as num?) ??
      (genre.rawData['ChildCount'] as num?);
  return count?.toInt();
}

/// [genres] with the most albums first and ties by name.
List<AggregatedItem> sortGenresByAlbums(List<AggregatedItem> genres) =>
    List.of(genres)..sort((a, b) {
      final byCount = (musicGenreAlbumCount(b) ?? 0).compareTo(
        musicGenreAlbumCount(a) ?? 0,
      );
      return byCount != 0
          ? byCount
          : a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

/// A list the server hands out a page at a time.
class MusicPagedItems extends ChangeNotifier {
  final Future<MusicPage> Function(int start, int limit) _fetch;
  final int pageSize;

  MusicPagedItems(this._fetch, {this.pageSize = 100});

  List<AggregatedItem> _items = const [];
  List<AggregatedItem> get items => _items;

  int _total = 0;
  int get total => _total;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool get hasMore => _items.length < _total;

  Future<void>? _more;
  int _generation = 0;
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) super.notifyListeners();
  }

  /// Starts over from the first page.
  Future<void> load() async {
    final generation = ++_generation;
    _isLoading = true;
    notifyListeners();
    try {
      final page = await _fetch(0, pageSize);
      if (generation != _generation) return;
      _items = page.items;
      _total = page.total;
    } catch (e) {
      debugPrint('Failed to load music items: $e');
      if (generation != _generation) return;
      _items = const [];
      _total = 0;
    }
    _isLoading = false;
    notifyListeners();
  }

  /// Loads the next page, or waits on the one already loading.
  Future<void> loadMore() {
    if (_isLoading || !hasMore) return Future.value();
    return _more ??= _loadMore().whenComplete(() => _more = null);
  }

  Future<void> _loadMore() async {
    final generation = _generation;
    try {
      final page = await _fetch(_items.length, pageSize);
      if (generation != _generation) return;
      _items = [..._items, ...page.items];
      // An empty page means the count was off, so stop asking.
      _total = page.items.isEmpty ? _items.length : page.total;
    } catch (e) {
      debugPrint('Failed to load more music items: $e');
      return;
    }
    notifyListeners();
  }

  /// Pages until an item passing [test] is loaded and returns its index, or
  /// -1 once everything is loaded without one.
  Future<int> loadUntil(bool Function(AggregatedItem item) test) async {
    while (true) {
      final index = _items.indexWhere(test);
      if (index >= 0 || !hasMore || _isLoading) return index;
      final before = _items.length;
      await loadMore();
      if (_items.length == before) return -1;
    }
  }
}
