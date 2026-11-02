import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book_discovery_models.dart';

/// Makes the client Discover fetches with. Tests swap it for one that answers
/// without the network.
@visibleForTesting
Dio Function() bookDiscoverDio = () => Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 7),
    receiveTimeout: const Duration(seconds: 12),
  ),
);

/// Free titles for Discover: Open Library's trending titles per subject for a
/// book library, LibriVox's popular audiobooks per genre for an audiobook
/// library, the subjects the viewer picked, and a title search. Rows and
/// results hold [DiscoverBook]s or [LibrivoxBook]s.
class BookDiscoverFeed extends ChangeNotifier {
  BookDiscoverFeed({required this.isAudiobook});

  final bool isAudiobook;
  final Dio _dio = bookDiscoverDio();

  late List<String> subjects = isAudiobook
      ? const ['Fantasy Fiction', 'Mystery & Detective Stories', 'Science Fiction']
      : const ['fantasy', 'romance', 'science_fiction'];
  final rows = <String, List<Object>>{};
  final loading = <String>{};
  final failed = <String>{};

  /// LibriVox covers by book id, resolved after each list arrives.
  final covers = <String, String?>{};

  String query = '';

  /// What the search found, null while it runs.
  List<Object>? results;

  Timer? _debounce;
  int _searchRequest = 0;
  bool _disposed = false;

  String get _prefKey => isAudiobook
      ? bookDiscoverAudiobookGenresPrefKey
      : bookDiscoverSubjectsPrefKey;

  List<String> get pool =>
      isAudiobook ? librivoxGenrePool : bookDiscoverGenrePool;

  String labelOf(String subject) =>
      isAudiobook ? subject : displayBookGenre(subject);

  List<String> _sorted(Iterable<String> picked) =>
      picked.toSet().toList()..sort((a, b) => labelOf(a).compareTo(labelOf(b)));

  ({String title, String author, String? cover, int? year}) describe(
    Object item,
  ) => switch (item) {
    LibrivoxBook book => (
      title: book.title,
      author: book.authorName,
      cover: covers[book.id],
      year: book.copyrightYear,
    ),
    DiscoverBook book => (
      title: book.title,
      author: book.author,
      cover: book.coverUrl,
      year: book.firstPublishYear,
    ),
    _ => throw ArgumentError.value(item),
  };

  /// Every LibriVox title on screen, for the detail and author screens.
  List<LibrivoxBook> get audiobooks => {
    for (final book in [...rows.values.expand((row) => row), ...?results])
      if (book is LibrivoxBook) book.id: book,
  }.values.toList();

  void _changed() {
    if (!_disposed) notifyListeners();
  }

  /// Reads the picked subjects and loads a row for each.
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_prefKey)?.where(pool.contains);
    if (stored != null && stored.isNotEmpty) subjects = _sorted(stored);
    rows.clear();
    await Future.wait(subjects.map(loadRow));
  }

  Future<void> setSubjects(Set<String> picked) async {
    final next = _sorted(picked);
    if (listEquals(next, subjects)) return;
    subjects = next;
    _changed();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefKey, next);
    await Future.wait(next.where((s) => !rows.containsKey(s)).map(loadRow));
  }

  Future<void> loadRow(String subject) async {
    if (!loading.add(subject)) return;
    failed.remove(subject);
    _changed();
    try {
      rows[subject] = isAudiobook
          ? await _librivox({
              'genre': subject,
              'sort_field': 'popularity',
              'sort_order': 'desc',
            })
          : await _openLibrary(
              'subject_key:"${Uri.decodeComponent(subject)}"',
              trending: true,
            );
    } catch (_) {
      failed.add(subject);
    } finally {
      loading.remove(subject);
      _changed();
    }
  }

  /// Searches titles once typing pauses. An empty [text] ends the search.
  void search(String text) {
    final q = text.trim();
    if (q == query) return;
    query = q;
    results = null;
    _debounce?.cancel();
    final request = ++_searchRequest;
    _changed();
    if (q.isEmpty) return;
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      List<Object> found;
      try {
        // LibriVox matches the start of a title and files titles without
        // their leading article.
        final title = q.replaceFirst(
          RegExp(r'^(the|a|an)\s+', caseSensitive: false),
          '',
        );
        found = isAudiobook
            ? await _librivox({'title': '^$title'})
            : await _openLibrary(q);
      } catch (_) {
        // LibriVox answers a search that matches nothing with a 404.
        found = const [];
      }
      if (request != _searchRequest) return;
      results = found;
      _changed();
    });
  }

  Future<List<Object>> _openLibrary(String q, {bool trending = false}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://openlibrary.org/search.json',
      queryParameters: {
        'q': q,
        if (trending) 'sort': 'trending',
        'limit': bookDiscoverPageSize,
      },
    );
    final docs = (response.data?['docs'] as List?) ?? const [];
    return docs
        .whereType<Map>()
        .map((w) => DiscoverBook.fromOpenLibraryMap(Map<String, dynamic>.from(w)))
        .where((book) => book.title.trim().isNotEmpty)
        .toList();
  }

  Future<List<Object>> _librivox(Map<String, Object> filter) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://librivox.org/api/feed/audiobooks/',
      queryParameters: {
        'format': 'json',
        ...filter,
        'limit': bookDiscoverPageSize,
      },
    );
    final books = ((response.data?['books'] as List?) ?? const [])
        .whereType<Map>()
        .map((b) => LibrivoxBook.fromMap(Map<String, dynamic>.from(b)))
        .where((book) => book.title.isNotEmpty)
        .toList();
    unawaited(_fetchCovers(books));
    return books;
  }

  Future<void> _fetchCovers(List<LibrivoxBook> books) async {
    const batchSize = 8;
    final unresolved = <LibrivoxBook>[];
    for (final book in books) {
      if (covers.containsKey(book.id)) continue;
      final known = _archiveCover(book) ?? _isbnCover(book);
      if (known != null) {
        covers[book.id] = known;
      } else {
        unresolved.add(book);
      }
    }
    _changed();

    for (var i = 0; i < unresolved.length; i += batchSize) {
      if (_disposed) return;
      final batch = unresolved.skip(i).take(batchSize).toList();
      final found = await Future.wait(batch.map(_searchCover));
      for (var j = 0; j < batch.length; j++) {
        covers[batch[j].id] = found[j];
      }
      _changed();
    }
  }

  String? _archiveCover(LibrivoxBook book) {
    final archiveUrl = book.archiveUrl;
    if ((archiveUrl ?? '').isEmpty) return null;
    final uri = Uri.tryParse(archiveUrl!);
    final segments = uri?.pathSegments.where((s) => s.isNotEmpty).toList();
    final identifier = segments?.isNotEmpty == true ? segments!.last : null;
    if (identifier == null || identifier.isEmpty) return null;
    return 'https://archive.org/services/img/$identifier';
  }

  String? _isbnCover(LibrivoxBook book) {
    final isbn = book.preferredIsbn;
    if (isbn == null || isbn.isEmpty) return null;
    return 'https://covers.openlibrary.org/b/isbn/$isbn-M.jpg?default=false';
  }

  Future<String?> _searchCover(LibrivoxBook book) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://openlibrary.org/search.json',
        queryParameters: {
          'q': '${book.title} ${book.authorName}',
          'limit': 1,
          'fields': 'cover_i',
        },
      );
      final docs = (response.data?['docs'] as List?) ?? const [];
      final coverId = docs.whereType<Map>().firstOrNull?['cover_i'] as num?;
      return coverId != null
          ? 'https://covers.openlibrary.org/b/id/${coverId.toInt()}-M.jpg'
          : null;
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _debounce?.cancel();
    _dio.close(force: true);
    super.dispose();
  }
}
