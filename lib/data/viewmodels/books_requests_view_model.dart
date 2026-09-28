import 'package:flutter/foundation.dart';

import '../repositories/books_repository.dart';

/// Owns async state so old responses cannot overwrite a newer search/session.
class BooksRequestsViewModel extends ChangeNotifier {
  BooksRequestsViewModel(this.repository);
  final BooksRepository repository;
  int _generation = 0;
  int _searchVersion = 0;
  bool _disposed = false;
  bool _polling = false;
  String? _identity;

  BooksMediaType type = BooksMediaType.ebook;
  String query = '';
  List<BookResult> results = const [];
  List<BookDownload> downloads = const [];
  int get activeCount => downloads
      .where(
        (item) => const {
          'queued',
          'resolving',
          'locating',
          'downloading',
          'processing',
        }.contains(item.status.toLowerCase()),
      )
      .length;
  bool searching = false;
  bool loadingMore = false;
  bool hasMore = false;
  int page = 1;
  BooksApiException? searchError;
  BooksApiException? statusError;
  bool statusLoading = false;

  void bindIdentity(String identity) {
    if (_identity == identity) return;
    _identity = identity;
    _generation++;
    _searchVersion++;
    type = BooksMediaType.ebook;
    query = '';
    results = const [];
    downloads = const [];
    searching = false;
    loadingMore = false;
    hasMore = false;
    searchError = null;
    statusError = null;
  }

  void setType(BooksMediaType next) {
    if (type == next) return;
    type = next;
    results = const [];
    hasMore = false;
    _searchVersion++;
    _notify();
    if (query.trim().isNotEmpty) search(query);
  }

  Future<void> search(String next, {bool more = false}) async {
    final trimmed = next.trim();
    if (trimmed.isEmpty || (more && (loadingMore || !hasMore))) return;
    final generation = _generation;
    final version = more ? _searchVersion : ++_searchVersion;
    if (!more) {
      query = trimmed;
      results = const [];
      searching = true;
      searchError = null;
      page = 1;
    } else {
      loadingMore = true;
    }
    _notify();
    try {
      final response = await repository.search(
        trimmed,
        type,
        page: more ? page + 1 : 1,
      );
      if (!_current(generation) || version != _searchVersion) return;
      results = more ? [...results, ...response.books] : response.books;
      page = response.page;
      hasMore = response.hasMore;
      searchError = null;
    } on BooksApiException catch (error) {
      if (_current(generation) && version == _searchVersion) {
        searchError = error;
      }
    } finally {
      if (_current(generation) && version == _searchVersion) {
        searching = false;
        loadingMore = false;
        _notify();
      }
    }
  }

  Future<void> refreshStatus() async {
    if (_polling) return;
    _polling = true;
    final generation = _generation;
    statusLoading = true;
    _notify();
    try {
      final next = await repository.active();
      if (_current(generation)) {
        final fresh = {for (final item in next) item.id: item};
        final previousIds = downloads.map((item) => item.id).toSet();
        downloads = [
          for (final old in downloads)
            if (fresh.containsKey(old.id))
              fresh[old.id]!
            else
              BookDownload(
                id: old.id,
                title: old.title,
                status:
                    const {
                      'complete',
                      'completed',
                      'error',
                      'failed',
                      'cancelled',
                    }.contains(old.status.toLowerCase())
                    ? old.status
                    : 'unknown',
              ),
          for (final item in next)
            if (!previousIds.contains(item.id)) item,
        ];
        statusError = null;
      }
    } on BooksApiException catch (error) {
      if (_current(generation)) statusError = error;
    } finally {
      _polling = false;
      if (_current(generation)) {
        statusLoading = false;
        _notify();
      }
    }
  }

  bool _current(int generation) => !_disposed && generation == _generation;
  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _generation++;
    super.dispose();
  }
}
