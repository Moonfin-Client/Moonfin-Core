import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../services/row_data_source.dart';
import 'book_browse_view_model.dart'
    show BookLibraryHelpers, BookScope, bookSeriesEntries;

/// The Classic book library's shelves.
class ClassicBookBrowseViewModel extends ChangeNotifier
    with BookLibraryHelpers {
  final RowDataSource _dataSource;
  final MediaServerClient _client;
  final String libraryId;

  // shortcut: series past the first 5000 titles go ungrouped, page the query
  // if a library that large shows up.
  static const _seriesSourceLimit = 5000;

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _libraryName = '';
  String get libraryName => _libraryName;

  String? _collectionType;

  @override
  bool get isAudiobookLibrary => _collectionType == 'audiobooks';

  BookScope _scope = BookScope.all;
  @override
  BookScope get scope => _scope;

  int _bookCount = 0;
  @override
  int get bookCount => _bookCount;
  int _audiobookCount = 0;
  @override
  int get audiobookCount => _audiobookCount;
  int _comicCount = 0;
  @override
  int get comicCount => _comicCount;

  AggregatedItem? _featured;
  AggregatedItem? get featuredItem => _featured;

  int _titleCount = 0;
  @override
  int get titleCount => _titleCount;
  int _genreCount = 0;
  @override
  int get genreCount => _genreCount;
  int _seriesCount = 0;
  @override
  int get seriesCount => _seriesCount;
  int _authorCount = 0;
  @override
  int get authorCount {
    final scoped = _scopedAuthorsRow();
    if (scoped != null) {
      return scoped.totalCount > 0 ? scoped.totalCount : scoped.items.length;
    }
    return _authorCount;
  }

  @override
  int get collectionCount => _collectionsRow?.items.length ?? 0;

  @override
  int get favoriteCount {
    final row = _favoritesRow;
    if (row == null) return 0;
    return row.totalCount > 0 ? row.totalCount : row.items.length;
  }

  // The rows as loaded, so a format switch recomposes them without fetching
  // again.
  HomeRow? _resumeRow;
  HomeRow? _latestBooksRow;
  HomeRow? _latestAudiobooksRow;
  HomeRow? _latestComicsRow;
  HomeRow? _lastPlayedRow;
  HomeRow? _authorsRow;
  HomeRow? _genresRow;
  HomeRow? _collectionsRow;
  HomeRow? _favoritesRow;
  HomeRow? _allRow;
  HomeRow? _allBooksRow;
  HomeRow? _allAudiobooksRow;
  HomeRow? _allComicsRow;
  Set<String> _bookAuthorNames = const {};
  Set<String> _bookAuthorIds = const {};
  Set<String> _audioAuthorNames = const {};
  Set<String> _audioAuthorIds = const {};
  List<AggregatedItem> _seriesSource = const [];
  List<AggregatedItem> _folders = const [];

  String get _serverId => _client.baseUrl;
  @override
  ImageApi get imageApi => _dataSource.imageApi;

  ClassicBookBrowseViewModel({
    required this.libraryId,
    required RowDataSource dataSource,
    required MediaServerClient client,
    String? collectionType,
  }) : _dataSource = dataSource, // ignore: prefer_initializing_formals
       _client = client, // ignore: prefer_initializing_formals
       _collectionType = collectionType; // ignore: prefer_initializing_formals

  String get _latestBooksRowId => 'latestBooks_$libraryId';
  String get _latestAudiobooksRowId => 'latestAudiobooks_$libraryId';
  String get _latestComicsRowId => 'latestComics_$libraryId';
  String get _allComicsRowId => 'allComics_$libraryId';
  String get _lastPlayedRowId => 'lastPlayed_$libraryId';
  String get _seriesRowId => 'bookSeries_$libraryId';
  String get _favoritesRowId => 'favorites_$libraryId';
  String get _allRowId => 'allTitles_$libraryId';

  /// See all on the series row opens the library's folders, where each series
  /// folder is one entry, rather than a grid of every volume.
  bool isSeriesRow(HomeRow row) => row.id == _seriesRowId;

  bool isFavoritesRow(HomeRow row) => row.id == _favoritesRowId;

  bool isCollectionsRow(HomeRow row) => row.id == _collectionsRow?.id;

  /// The format of titles the See All of [row] shows.
  BookScope seeAllScopeFor(HomeRow row) {
    if (row.id == _latestBooksRowId || row.id.startsWith('allBooks_')) {
      return BookScope.books;
    }
    if (row.id == _latestAudiobooksRowId ||
        row.id == _lastPlayedRowId ||
        row.id.startsWith('allAudiobooks_')) {
      return BookScope.audiobooks;
    }
    if (row.id == _latestComicsRowId || row.id == _allComicsRowId) {
      return BookScope.comics;
    }
    return _scope;
  }

  /// Whether [row] can hold both formats at once, which is when cards show
  /// the format badge.
  bool rowCanMixFormats(HomeRow row) {
    if (!isMixedLibrary || _scope != BookScope.all) return false;
    return row.rowType == HomeRowType.resume ||
        row.id == _favoritesRowId ||
        row.id == _allRowId;
  }

  static int _bySortName(AggregatedItem a, AggregatedItem b) =>
      (a.sortName ?? a.name).toLowerCase().compareTo(
        (b.sortName ?? b.name).toLowerCase(),
      );

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
      final resumeTitle = isAudiobookLibrary
          ? l10n.continueListening
          : l10n.continueReading;
      final resumeF = _dataSource.loadBookResume(
        libraryId,
        _serverId,
        includeItemTypes: combinedTypes,
        title: resumeTitle,
      );
      final latestBooksF = isAudiobookLibrary
          ? null
          : _dataSource.loadLibraryItemsByType(
              libraryId,
              _serverId,
              title: l10n.latestBooks,
              includeItemTypes: const ['Book'],
              sortBy: 'DateCreated',
              sortOrder: 'Descending',
            );
      final latestAudiobooksF = _dataSource.loadLibraryItemsByType(
        libraryId,
        _serverId,
        title: l10n.latestAudiobooks,
        includeItemTypes: audiobookTypes,
        sortBy: 'DateCreated',
        sortOrder: 'Descending',
      );
      final lastPlayedF = isAudiobookLibrary
          ? _dataSource.loadLibraryLastPlayed(
              libraryId,
              _serverId,
              includeItemTypes: audiobookTypes,
            )
          : null;
      final authorsF = _dataSource.loadBookAuthors(libraryId, _serverId);
      final favoritesF = _dataSource.loadLibraryFavorites(
        libraryId,
        _serverId,
        includeItemTypes: combinedTypes,
      );
      final genresF = _loadGenres(l10n.genres);
      final collectionsF = _loadBookCollections();
      final allBooksF = isAudiobookLibrary
          ? null
          : _dataSource.loadLibraryItemsByType(
              libraryId,
              _serverId,
              title: l10n.books,
              includeItemTypes: const ['Book'],
              sortBy: 'SortName',
            );
      final allAudiobooksF = _dataSource.loadLibraryItemsByType(
        libraryId,
        _serverId,
        title: l10n.audiobooks,
        includeItemTypes: audiobookTypes,
        sortBy: 'SortName',
      );
      final allF = _dataSource.loadLibraryItemsByType(
        libraryId,
        _serverId,
        title: isAudiobookLibrary ? l10n.audiobooks : l10n.books,
        includeItemTypes: combinedTypes,
        sortBy: 'SortName',
      );
      final seriesSourceF = _loadSeriesSource();
      final foldersF = _loadFolders();
      final bookCountF = isAudiobookLibrary
          ? Future.value(0)
          : _countOf(const ['Book']);
      final audiobookCountF = _countOf(audiobookTypes);

      await Future.wait([
        resumeF,
        ?latestBooksF,
        latestAudiobooksF,
        ?lastPlayedF,
        authorsF,
        favoritesF,
        genresF,
        collectionsF,
        ?allBooksF,
        allAudiobooksF,
        allF,
        seriesSourceF,
        foldersF,
        bookCountF,
        audiobookCountF,
      ]);

      _resumeRow = await resumeF;
      _allRow = (await allF).copyWith(id: _allRowId);
      final allItems = _allRow?.items ?? const <AggregatedItem>[];

      var latestBooks = await latestBooksF;
      var allBooks = await allBooksF;
      // Comics are Book typed on the server, so the book responses already
      // carry them and no separate request is needed to find them.
      final comicsByRecency = (latestBooks?.items ?? const <AggregatedItem>[])
          .where(isComicItem)
          .toList();
      if (latestBooks != null) {
        final filteredBooks = latestBooks.items.where(isBookItem).toList();
        latestBooks = latestBooks.copyWith(items: filteredBooks);
        _latestBooksRow = latestBooks.copyWith(id: _latestBooksRowId);
      } else {
        _latestBooksRow = null;
      }

      if (allBooks != null) {
        final filteredBooks = allBooks.items.where(isBookItem).toList();
        if (filteredBooks.isEmpty && (latestBooks?.items.isNotEmpty == true)) {
          allBooks = allBooks.copyWith(items: latestBooks!.items);
        } else {
          allBooks = allBooks.copyWith(items: filteredBooks);
        }
        _allBooksRow = allBooks.copyWith(id: 'allBooks_$libraryId', title: l10n.books);
      } else if (latestBooks != null && latestBooks.items.isNotEmpty) {
        _allBooksRow = latestBooks.copyWith(id: 'allBooks_$libraryId', title: l10n.books);
      } else {
        _allBooksRow = null;
      }

      var latestAudio = await latestAudiobooksF;
      var allAudio = await allAudiobooksF;
      final filteredAudio = latestAudio.items.where(isAudiobookItem).toList();
      latestAudio = latestAudio.copyWith(items: filteredAudio);
      _latestAudiobooksRow = latestAudio.copyWith(id: _latestAudiobooksRowId);

      final filteredAllAudio = allAudio.items.where(isAudiobookItem).toList();
      if (filteredAllAudio.isEmpty && latestAudio.items.isNotEmpty) {
        allAudio = allAudio.copyWith(items: latestAudio.items);
      } else {
        allAudio = allAudio.copyWith(items: filteredAllAudio);
      }
      _allAudiobooksRow = allAudio.copyWith(id: 'allAudiobooks_$libraryId', title: l10n.audiobooks);

      final booksFromAll = _allBooksRow?.items ?? const <AggregatedItem>[];
      final audioFromAll = _allAudiobooksRow?.items ?? const <AggregatedItem>[];
      final comicsFromAll = allItems.where(isComicItem).toList();

      // Comics belong here too, and totalCount stays the server's because
      // these items are one page of the library rather than all of it.
      final combinedAllItems = [
        ...booksFromAll,
        ...audioFromAll,
        ...comicsFromAll,
      ]..sort(_bySortName);
      if (combinedAllItems.isNotEmpty) {
        _allRow = _allRow!.copyWith(items: combinedAllItems);
      }

      final comicsById = <String, AggregatedItem>{
        for (final comic in [...comicsByRecency, ...comicsFromAll])
          comic.id: comic,
      };
      if (isAudiobookLibrary || comicsById.isEmpty) {
        _latestComicsRow = null;
        _allComicsRow = null;
      } else {
        _latestComicsRow = HomeRow(
          id: _latestComicsRowId,
          title: l10n.latestComics,
          items: comicsByRecency.isNotEmpty
              ? comicsByRecency
              : comicsById.values.toList(),
          rowType: HomeRowType.latestMedia,
          totalCount: comicsById.length,
        );
        final byName = comicsById.values.toList()..sort(_bySortName);
        _allComicsRow = HomeRow(
          id: _allComicsRowId,
          title: l10n.comics,
          items: byName,
          rowType: HomeRowType.latestMedia,
          totalCount: byName.length,
        );
      }

      _lastPlayedRow = lastPlayedF == null ? null : await lastPlayedF;

      final bookAuthorNames = <String>{};
      final bookAuthorIds = <String>{};
      for (final book in booksFromAll) {
        final people = book.rawData['People'] as List?;
        if (people != null) {
          for (final p in people) {
            if (p is Map && (p['Type'] == 'Author' || p['Role'] == 'Author')) {
              final name = p['Name'] as String?;
              final id = p['Id'] as String?;
              if (name != null) bookAuthorNames.add(name.toLowerCase());
              if (id != null) bookAuthorIds.add(id);
            }
          }
        }
        final artist = book.rawData['AlbumArtist'] as String?;
        if (artist != null) bookAuthorNames.add(artist.toLowerCase());
        final artists = book.rawData['Artists'] as List?;
        if (artists != null) {
          for (final a in artists) {
            if (a is String) bookAuthorNames.add(a.toLowerCase());
          }
        }
      }

      final audioAuthorNames = <String>{};
      final audioAuthorIds = <String>{};
      for (final audio in audioFromAll) {
        final artistItems = audio.rawData['ArtistItems'] as List?;
        if (artistItems != null) {
          for (final a in artistItems) {
            if (a is Map) {
              final name = a['Name'] as String?;
              final id = a['Id'] as String?;
              if (name != null) audioAuthorNames.add(name.toLowerCase());
              if (id != null) audioAuthorIds.add(id);
            }
          }
        }
        final artist = audio.rawData['AlbumArtist'] as String?;
        if (artist != null) audioAuthorNames.add(artist.toLowerCase());
        final artists = audio.rawData['Artists'] as List?;
        if (artists != null) {
          for (final a in artists) {
            if (a is String) audioAuthorNames.add(a.toLowerCase());
          }
        }
        final people = audio.rawData['People'] as List?;
        if (people != null) {
          for (final p in people) {
            if (p is Map && (p['Type'] == 'Author' || p['Role'] == 'Author')) {
              final name = p['Name'] as String?;
              final id = p['Id'] as String?;
              if (name != null) audioAuthorNames.add(name.toLowerCase());
              if (id != null) audioAuthorIds.add(id);
            }
          }
        }
      }

      _bookAuthorNames = bookAuthorNames;
      _bookAuthorIds = bookAuthorIds;
      _audioAuthorNames = audioAuthorNames;
      _audioAuthorIds = audioAuthorIds;

      var authors = await authorsF;
      final existingAuthorNames =
          authors.items.map((a) => a.name.toLowerCase()).toSet();
      final extraAuthors = <AggregatedItem>[];
      for (final item in [...booksFromAll, ...allItems]) {
        final people = item.rawData['People'] as List?;
        if (people == null) continue;
        for (final p in people) {
          if (p is Map && (p['Type'] == 'Author' || p['Role'] == 'Author')) {
            final name = p['Name'] as String?;
            final id = p['Id'] as String?;
            if (name != null &&
                name.isNotEmpty &&
                !existingAuthorNames.contains(name.toLowerCase())) {
              existingAuthorNames.add(name.toLowerCase());
              final primaryTag = p['PrimaryImageTag'] as String?;
              extraAuthors.add(AggregatedItem(
                id: id ?? name,
                serverId: _serverId,
                rawData: {
                  'Id': id ?? name,
                  'Name': name,
                  'Type': 'Person',
                  if (primaryTag != null) 'ImageTags': {'Primary': primaryTag},
                },
              ));
            }
          }
        }
      }
      if (extraAuthors.isNotEmpty) {
        final combinedAuthors = [...authors.items, ...extraAuthors]
          ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        authors = authors.copyWith(
          items: combinedAuthors,
          totalCount: combinedAuthors.length,
        );
      }
      _authorsRow = authors;
      _favoritesRow = await favoritesF;
      _genresRow = await genresF;
      _collectionsRow = await collectionsF;
      _seriesSource = await seriesSourceF;
      _folders = await foldersF;

      // The server counts comics as books, so a library holding nothing but
      // comics would otherwise offer a Books tab with nothing behind it.
      _bookCount = booksFromAll.isEmpty
          ? 0
          : math.max(await bookCountF, booksFromAll.length);
      _audiobookCount = math.max(await audiobookCountF, audioFromAll.length);
      _comicCount = comicsById.length;

      final resume = _resumeRow!;
      _featured = resume.items.isNotEmpty
          ? resume.items.first
          : (_latestBooksRow?.items.firstOrNull ??
                _latestAudiobooksRow?.items.firstOrNull ??
                _latestComicsRow?.items.firstOrNull);
      final all = _allRow!;
      _titleCount = all.totalCount > 0 ? all.totalCount : all.items.length;
      _genreCount = _genresRow?.totalCount ?? 0;
      _authorCount = (_authorsRow?.totalCount ?? 0) > 0
          ? _authorsRow!.totalCount
          : (_authorsRow?.items.length ?? 0);
      // A refresh can drop the format the user was on, and leaving the scope
      // there strands them on a tab the filter no longer offers.
      if (!availableScopes.contains(_scope)) {
        _scope = BookScope.all;
      }
      _composeRows();
    } catch (_) {}

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _rows = [];
    notifyListeners();
    await load();
  }

  void setScope(BookScope value) {
    if (_scope == value) return;
    _scope = value;
    _composeRows();
    notifyListeners();
  }

  void _composeRows() {
    final seriesRow = _buildSeriesRow();
    _seriesCount = seriesRow?.items.length ?? 0;
    final showBooks = _scope == BookScope.all || _scope == BookScope.books;
    final showAudiobooks =
        _scope == BookScope.all || _scope == BookScope.audiobooks;
    final showComics = _scope == BookScope.all || _scope == BookScope.comics;

    final composed = <HomeRow?>[
      _scopedRow(_resumeRow),
      if (showBooks && !isAudiobookLibrary) _latestBooksRow,
      if (showAudiobooks) _latestAudiobooksRow,
      if (showComics &&
          !isAudiobookLibrary &&
          (_latestComicsRow?.items.isNotEmpty == true))
        _latestComicsRow,
      if (_scope == BookScope.all && showAudiobooks) _lastPlayedRow,
      if (_scope == BookScope.all) seriesRow,
      _scopedAuthorsRow(),
      if (_scope == BookScope.all) _genresRow,
      if (_scope == BookScope.all) _collectionsRow,
      if (_scope == BookScope.all) _scopedRow(_favoritesRow),
      _scopedAllRow(),
    ];
    _rows = composed
        .whereType<HomeRow>()
        .where((r) => r.items.isNotEmpty)
        .toList();
  }

  HomeRow? _scopedAuthorsRow() {
    final base = _authorsRow;
    if (base == null || base.items.isEmpty) return null;
    if (_scope == BookScope.all) return base;

    final filtered = base.items.where((author) {
      final name = author.name.toLowerCase();
      final id = author.id;
      return switch (_scope) {
        BookScope.books =>
          _bookAuthorNames.contains(name) || _bookAuthorIds.contains(id),
        BookScope.audiobooks =>
          _audioAuthorNames.contains(name) ||
          _audioAuthorIds.contains(id) ||
          (!_bookAuthorNames.contains(name) && !_bookAuthorIds.contains(id)),
        BookScope.comics => false,
        BookScope.all => true,
      };
    }).toList();

    if (filtered.isEmpty) return null;
    return base.copyWith(
      items: filtered,
      totalCount: filtered.length,
    );
  }

  HomeRow? _scopedAllRow() {
    final l10n = currentAppLocalizations();
    switch (_scope) {
      case BookScope.books:
        return _allBooksRow?.copyWith(title: l10n.books);
      case BookScope.audiobooks:
        return _allAudiobooksRow?.copyWith(title: l10n.audiobooks);
      case BookScope.comics:
        // Its own row rather than the latest one retitled, which would put
        // the same id on two shelves and collide their keys.
        return _allComicsRow;
      case BookScope.all:
        return isMixedLibrary
            ? _allRow?.copyWith(title: l10n.allTitles)
            : _allRow;
    }
  }

  HomeRow? _scopedRow(HomeRow? row) {
    if (row == null) return null;
    if (_scope == BookScope.all) return row;
    return row.copyWith(items: row.items.where(matchesScope).toList());
  }

  Future<int> _countOf(List<String> types) async {
    try {
      final resp = await _client.itemsApi.getItems(
        parentId: libraryId,
        includeItemTypes: types,
        recursive: true,
        limit: 1,
        enableTotalRecordCount: true,
      );
      final count = resp['TotalRecordCount'] as int? ?? 0;
      // The untyped query is much bigger, so it only runs when the typed
      // count comes back 0.
      if (count > 0) return count;
      final fallbackResp = await _client.itemsApi.getItems(
        parentId: libraryId,
        excludeItemTypes: const ['Folder', 'CollectionFolder', 'UserView'],
        recursive: true,
        limit: 500,
      );
      final items =
          (fallbackResp['Items'] as List? ?? const []).whereType<Map>();
      return items.where((it) {
        final t = it['Type']?.toString();
        return t != null && types.contains(t);
      }).length;
    } catch (_) {
      return 0;
    }
  }

  Future<List<AggregatedItem>> _loadSeriesSource() async {
    try {
      var resp = await _client.itemsApi.getItems(
        parentId: libraryId,
        includeItemTypes: combinedTypes,
        recursive: true,
        limit: _seriesSourceLimit,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        fields: 'SeriesName,ParentId,Path',
        enableImageTypes: 'Primary',
        imageTypeLimit: 1,
        enableTotalRecordCount: false,
      );
      var rawItems = resp['Items'] as List? ?? const [];
      if (rawItems.isEmpty) {
        resp = await _client.itemsApi.getItems(
          parentId: libraryId,
          excludeItemTypes: const ['Folder', 'CollectionFolder', 'UserView'],
          recursive: true,
          limit: _seriesSourceLimit,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          fields: 'SeriesName,ParentId,Path',
          enableImageTypes: 'Primary',
          imageTypeLimit: 1,
          enableTotalRecordCount: false,
        );
        rawItems = resp['Items'] as List? ?? const [];
      }
      final items = rawItems
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
      return items;
    } catch (_) {
      return const [];
    }
  }

  Future<List<AggregatedItem>> _loadFolders() async {
    try {
      final resp = await _client.itemsApi.getItems(
        parentId: libraryId,
        includeItemTypes: const ['Folder'],
        recursive: true,
        fields: 'ParentId',
        enableImageTypes: 'Primary',
        imageTypeLimit: 1,
        enableTotalRecordCount: false,
      );
      return [
        for (final raw in (resp['Items'] as List? ?? const []).whereType<Map>())
          if (raw['Id'] != null)
            AggregatedItem(
              id: raw['Id'].toString(),
              serverId: _serverId,
              rawData: raw.cast<String, dynamic>(),
            ),
      ];
    } catch (_) {
      return const [];
    }
  }

  HomeRow? _buildSeriesRow() {
    final l10n = currentAppLocalizations();
    final entries = bookSeriesEntries(
      books: [
        for (final item in _seriesSource)
          if (matchesScope(item)) item,
      ],
      folders: _folders,
    );
    if (entries.isEmpty) return null;

    return HomeRow(
      id: _seriesRowId,
      title: l10n.series,
      items: entries,
      rowType: HomeRowType.latestMedia,
      totalCount: entries.length,
    );
  }

  /// The library's genres. The shared genre row leaves book types out of its
  /// query, so this asks with them itself.
  Future<HomeRow> _loadGenres(String title) async {
    var items = const <AggregatedItem>[];
    var total = 0;
    try {
      final resp = await _client.itemsApi.getGenres(
        parentId: libraryId,
        includeItemTypes: combinedTypes,
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        limit: 50,
        fields: 'ItemCounts,PrimaryImageAspectRatio',
      );
      items = [
        for (final raw in (resp['Items'] as List? ?? const []).whereType<Map>())
          if (raw['Id'] != null)
            AggregatedItem(
              id: raw['Id'].toString(),
              serverId: _serverId,
              rawData: raw.cast<String, dynamic>(),
            ),
      ];
      total = resp['TotalRecordCount'] as int? ?? items.length;
    } catch (_) {}
    return HomeRow(
      id: 'genres',
      title: title,
      items: items,
      rowType: HomeRowType.genres,
      totalCount: total,
    );
  }

  Future<HomeRow> _loadBookCollections() async {
    final raw = await _dataSource.loadLibraryCollections(libraryId, _serverId);
    if (raw.items.isEmpty) return raw;
    final types = combinedTypes;
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
}
