import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import '../services/row_data_source.dart';

/// Which formats the library tab is currently showing. Only meaningful for
/// mixed libraries; single-format libraries always behave like [all].
enum BookScope { all, books, audiobooks, comics }

class BookBrowseViewModel extends ChangeNotifier {
  final RowDataSource _dataSource;
  final MediaServerClient _client;
  final String libraryId;

  static const _seriesSourceLimit = 200;

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _libraryName = '';
  String get libraryName => _libraryName;

  String? _collectionType;
  String? get collectionType => _collectionType;

  bool get isAudiobookLibrary => _collectionType == 'audiobooks';

  BookScope _scope = BookScope.all;
  BookScope get scope => _scope;

  int _bookCount = 0;
  int get bookCount => _bookCount;
  int _audiobookCount = 0;
  int get audiobookCount => _audiobookCount;
  int _comicCount = 0;
  int get comicCount => _comicCount;

  /// True when the library holds 2 or more formats (books, audiobooks, comics),
  /// which enables the scope filter and the per-format rows.
  bool get isMixedLibrary {
    if (isAudiobookLibrary) return false;
    var count = 0;
    if (_bookCount > 0) count++;
    if (_audiobookCount > 0) count++;
    if (_comicCount > 0) count++;
    return count >= 2;
  }

  /// The active formats available in this library.
  List<BookScope> get availableScopes => [
    BookScope.all,
    if (_bookCount > 0) BookScope.books,
    if (_audiobookCount > 0) BookScope.audiobooks,
    if (_comicCount > 0) BookScope.comics,
  ];

  AggregatedItem? _featured;
  AggregatedItem? get featuredItem => _featured;

  int _titleCount = 0;
  int get titleCount => _titleCount;
  int _genreCount = 0;
  int get genreCount => _genreCount;
  int _seriesCount = 0;
  int get seriesCount => _seriesCount;
  int _authorCount = 0;
  int get authorCount {
    final scoped = _scopedAuthorsRow();
    if (scoped != null) {
      return scoped.totalCount > 0 ? scoped.totalCount : scoped.items.length;
    }
    return _authorCount;
  }

  // Source rows kept unfiltered so scope switches recompose without refetch.
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
  Set<String> _bookAuthorNames = const {};
  Set<String> _bookAuthorIds = const {};
  Set<String> _audioAuthorNames = const {};
  Set<String> _audioAuthorIds = const {};
  List<AggregatedItem> _seriesSource = const [];

  String get _serverId => _client.baseUrl;
  ImageApi get imageApi => _dataSource.imageApi;

  BookBrowseViewModel({
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
  String get _lastPlayedRowId => 'lastPlayed_$libraryId';
  String get _favoritesRowId => 'favorites_$libraryId';
  String get _allRowId => 'allTitles_$libraryId';

  List<String> get _audiobookTypes =>
      isAudiobookLibrary ? const ['AudioBook', 'Audio'] : const ['AudioBook'];

  /// Types for whole-library queries. Books libraries include AudioBook so
  /// audiobooks shelved in a books library are visible. Note: Jellyfin treats
  /// comics as Book types, so Comic is partitioned client-side.
  List<String> get combinedTypes =>
      isAudiobookLibrary
          ? const ['AudioBook', 'Audio']
          : const ['Book', 'AudioBook'];

  /// Types matching the active scope, for See-all navigation and genre routes.
  List<String> get scopedTypes {
    if (isAudiobookLibrary) return _audiobookTypes;
    return switch (_scope) {
      BookScope.books => const ['Book'],
      BookScope.audiobooks => _audiobookTypes,
      BookScope.comics => const ['Book'],
      BookScope.all => combinedTypes,
    };
  }

  /// Whether [item] is an audiobook (vs a regular book or comic). Explicit
  /// server types win; the heuristic only breaks ties for bare audio items.
  bool isAudiobookItem(AggregatedItem item) {
    if (item.isComic) return false;
    final type = item.type;
    if (type == 'AudioBook' || type == 'Audio') return true;
    if (type == 'Book') return false;
    return item.isAudiobook;
  }

  bool isComicItem(AggregatedItem item) => item.isComic;

  bool isBookItem(AggregatedItem item) => !isAudiobookItem(item) && !item.isComic;

  /// Item types the See-all grid should show for [row]. Lives here so the
  /// mapping sits next to where the row ids are minted.
  List<String> seeAllTypesFor(HomeRow row) {
    if (row.id == _latestBooksRowId || row.id.startsWith('allBooks_')) return const ['Book'];
    if (row.id == _latestAudiobooksRowId ||
        row.id == _lastPlayedRowId ||
        row.id.startsWith('allAudiobooks_')) {
      return _audiobookTypes;
    }
    if (row.id == _latestComicsRowId) return const ['Comic', 'Book'];
    return scopedTypes;
  }

  /// Whether [row] can hold both formats at once, which is when cards show
  /// the format badge.
  bool rowCanMixFormats(HomeRow row) {
    if (!isMixedLibrary || _scope != BookScope.all) return false;
    return row.rowType == HomeRowType.resume ||
        row.id == _favoritesRowId ||
        row.id == _allRowId;
  }

  bool _matchesScope(AggregatedItem item) => switch (_scope) {
    BookScope.all => true,
    BookScope.books => isBookItem(item),
    BookScope.audiobooks => isAudiobookItem(item),
    BookScope.comics => isComicItem(item),
  };

  /// Time left in an audiobook (or book with server progress); null without
  /// runtime or progress.
  Duration? remainingFor(AggregatedItem item) {
    final runtime = item.runtime;
    if (runtime == null) return null;
    final pct = item.playedPercentage;
    if (pct == null || pct <= 0) return runtime;
    if (pct >= 100) return Duration.zero;
    return Duration(
      microseconds: (runtime.inMicroseconds * (1.0 - pct / 100.0)).round(),
    );
  }

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
        includeItemTypes: _audiobookTypes,
        sortBy: 'DateCreated',
        sortOrder: 'Descending',
      );
      final latestComicsF = isAudiobookLibrary
          ? null
          : _dataSource.loadLibraryItemsByType(
              libraryId,
              _serverId,
              title: l10n.latestComics,
              includeItemTypes: const ['Book'],
              sortBy: 'DateCreated',
              sortOrder: 'Descending',
            );
      final lastPlayedF = isAudiobookLibrary
          ? _dataSource.loadLibraryLastPlayed(
              libraryId,
              _serverId,
              includeItemTypes: _audiobookTypes,
            )
          : null;
      final authorsF = _dataSource.loadBookAuthors(libraryId, _serverId);
      final favoritesF = _dataSource.loadLibraryFavorites(
        libraryId,
        _serverId,
        includeItemTypes: combinedTypes,
      );
      final genresF = _dataSource.loadGenres(
        _serverId,
        includeItemTypes: combinedTypes,
        parentId: libraryId,
      );
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
        includeItemTypes: _audiobookTypes,
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
      final bookCountF = isAudiobookLibrary
          ? Future.value(0)
          : _countOf(const ['Book']);
      final audiobookCountF = _countOf(_audiobookTypes);

      await Future.wait([
        resumeF,
        ?latestBooksF,
        latestAudiobooksF,
        ?latestComicsF,
        ?lastPlayedF,
        authorsF,
        favoritesF,
        genresF,
        collectionsF,
        ?allBooksF,
        allAudiobooksF,
        allF,
        seriesSourceF,
        bookCountF,
        audiobookCountF,
      ]);

      _resumeRow = await resumeF;
      _allRow = (await allF).copyWith(id: _allRowId);
      final allItems = _allRow?.items ?? const <AggregatedItem>[];

      var latestBooks = await latestBooksF;
      var allBooks = await allBooksF;
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

      final combinedAllItems = [
        ...booksFromAll,
        ...audioFromAll,
      ]..sort((a, b) => (a.sortName ?? a.name).toLowerCase().compareTo((b.sortName ?? b.name).toLowerCase()));
      if (combinedAllItems.isNotEmpty) {
        _allRow = _allRow!.copyWith(
          items: combinedAllItems,
          totalCount: combinedAllItems.length,
        );
      }

      if (!isAudiobookLibrary && comicsFromAll.isNotEmpty) {
        var latestComics = await latestComicsF;
        final filteredComics = (latestComics?.items ?? const <AggregatedItem>[])
            .where(isComicItem)
            .toList();
        final finalComics =
            filteredComics.isNotEmpty ? filteredComics : comicsFromAll;
        if (finalComics.isNotEmpty) {
          _latestComicsRow = HomeRow(
            id: _latestComicsRowId,
            title: l10n.latestComics,
            items: finalComics,
            rowType: HomeRowType.latestMedia,
            totalCount: finalComics.length,
          );
        } else {
          _latestComicsRow = null;
        }
      } else {
        _latestComicsRow = null;
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

      _bookCount = math.max(await bookCountF, booksFromAll.length);
      _audiobookCount = math.max(await audiobookCountF, audioFromAll.length);
      _comicCount = comicsFromAll.length;

      final resume = _resumeRow!;
      _featured = resume.items.isNotEmpty
          ? resume.items.first
          : (_latestBooksRow?.items.firstOrNull ??
                _latestAudiobooksRow?.items.firstOrNull ??
                _latestComicsRow?.items.firstOrNull);
      final all = _allRow!;
      _titleCount = all.totalCount > 0 ? all.totalCount : all.items.length;
      _genreCount = _genresRow?.items.length ?? 0;
      _authorCount = (_authorsRow?.totalCount ?? 0) > 0
          ? _authorsRow!.totalCount
          : (_authorsRow?.items.length ?? 0);
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
        if (_comicCount == 0) return null;
        return _latestComicsRow?.copyWith(title: l10n.comics);
      case BookScope.all:
        return isMixedLibrary
            ? _allRow?.copyWith(title: l10n.allTitles)
            : _allRow;
    }
  }

  HomeRow? _scopedRow(HomeRow? row) {
    if (row == null) return null;
    final l10n = currentAppLocalizations();
    final isAllTitles = row.id.startsWith('allTitles_');
    if (_scope == BookScope.all) {
      if (isAllTitles && isMixedLibrary) {
        return row.copyWith(title: l10n.allTitles);
      }
      return row;
    }
    final scopedItems = row.items.where(_matchesScope).toList();
    final dynamicTitle = switch (_scope) {
      BookScope.audiobooks => l10n.audiobooks,
      BookScope.comics => l10n.comics,
      BookScope.books => l10n.books,
      BookScope.all => row.title,
    };
    return row.copyWith(
      title: isAllTitles ? dynamicTitle : row.title,
      items: scopedItems,
    );
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
      final fallbackResp = await _client.itemsApi.getItems(
        parentId: libraryId,
        excludeItemTypes: const ['Folder', 'CollectionFolder', 'UserView'],
        recursive: true,
        limit: 500,
      );
      final items =
          (fallbackResp['Items'] as List? ?? const []).whereType<Map>();
      final fallbackCount = items.where((it) {
        final t = it['Type']?.toString();
        return t != null && types.contains(t);
      }).length;
      return math.max(count, fallbackCount);
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
        fields: 'SeriesName,ImageTags,UserData,RunTimeTicks,DateCreated',
        enableImageTypes: 'Primary',
        imageTypeLimit: 1,
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
          fields: 'SeriesName,ImageTags,UserData,RunTimeTicks,DateCreated',
          enableImageTypes: 'Primary',
          imageTypeLimit: 1,
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

  /// Groups the sampled library items on SeriesName into one synthetic entry
  /// per series (2+ members). Synthetic ids use the `bookSeries:` prefix and
  /// carry the series name so taps can run a search.
  HomeRow? _buildSeriesRow() {
    if (_seriesSource.isEmpty) return null;
    final l10n = currentAppLocalizations();
    final groups = <String, List<AggregatedItem>>{};
    for (final item in _seriesSource) {
      if (!_matchesScope(item)) continue;
      final series = item.seriesName?.trim();
      if (series == null || series.isEmpty) continue;
      groups.putIfAbsent(series, () => []).add(item);
    }
    groups.removeWhere((_, members) => members.length < 2);
    if (groups.isEmpty) return null;

    final entries = groups.entries.map((entry) {
      final members = entry.value;
      final cover = members.firstWhere(
        (m) => m.primaryImageTag != null,
        orElse: () => members.first,
      );
      return AggregatedItem(
        id: 'bookSeries:${entry.key}',
        serverId: members.first.serverId,
        rawData: {
          'Name': entry.key,
          'Type': 'BookSeries',
          'ChildCount': members.length,
          if (cover.primaryImageTag != null) ...{
            'PrimaryImageItemId': cover.id,
            'PrimaryImageTag': cover.primaryImageTag,
          },
        },
      );
    }).toList();
    entries.sort((a, b) => a.name.compareTo(b.name));

    return HomeRow(
      id: 'bookSeries_$libraryId',
      title: l10n.series,
      items: entries,
      rowType: HomeRowType.latestMedia,
      totalCount: entries.length,
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

  String bookSubtitle(AggregatedItem item) {
    final l10n = currentAppLocalizations();
    switch (item.type) {
      case 'BoxSet':
        final count = item.childCount;
        return count != null && count > 0 ? '$count items' : '';
      case 'BookSeries':
        final count = item.childCount ?? 0;
        return count > 0 ? l10n.bookSeriesItemCount(count) : '';
      case 'MusicArtist':
        return '';
      default:
        final people = item.rawData['People'] as List?;
        final authorPerson = people?.whereType<Map>().firstWhereOrNull(
              (p) => p['Type'] == 'Author' || p['Role'] == 'Author',
            );
        final authorFromPeople = authorPerson?['Name'] as String?;

        final author =
            authorFromPeople ??
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
    final fieldTag = item.primaryImageTagField;
    final fieldItemId = item.primaryImageItemId;
    if (fieldTag != null && fieldItemId != null) {
      return imageApi.getPrimaryImageUrl(
        fieldItemId,
        maxHeight: 400,
        tag: fieldTag,
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
