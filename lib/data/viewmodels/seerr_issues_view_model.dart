import 'package:flutter/foundation.dart';

import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_models.dart';

enum SeerrIssueFilter { open, resolved, all }

extension SeerrIssueFilterApi on SeerrIssueFilter {
  String? get apiValue => this == SeerrIssueFilter.all ? null : name;
}

const _pageSize = 20;

class SeerrIssuesState {
  final bool isLoading;
  final bool isRefreshing;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final List<SeerrIssue> issues;
  final SeerrUser? currentUser;
  final int? actioningIssueId;
  final SeerrIssueFilter filter;
  final SeerrIssueCounts? counts;
  final Map<String, SeerrMediaSummary> summaries;

  const SeerrIssuesState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.isLoadingMore = false,
    this.hasMore = false,
    this.error,
    this.issues = const [],
    this.currentUser,
    this.actioningIssueId,
    this.filter = SeerrIssueFilter.open,
    this.counts,
    this.summaries = const {},
  });

  bool get canManageIssues => currentUser?.canManageIssues ?? false;

  SeerrMediaSummary? summaryFor(SeerrIssue issue) {
    final media = issue.media;
    if (media?.tmdbId == null) return null;
    return summaries['${media!.mediaType ?? 'movie'}:${media.tmdbId}'];
  }

  SeerrIssuesState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    List<SeerrIssue>? issues,
    SeerrUser? currentUser,
    Object? actioningIssueId = _sentinel,
    SeerrIssueFilter? filter,
    SeerrIssueCounts? counts,
    Map<String, SeerrMediaSummary>? summaries,
  }) => SeerrIssuesState(
    isLoading: isLoading ?? this.isLoading,
    isRefreshing: isRefreshing ?? this.isRefreshing,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    hasMore: hasMore ?? this.hasMore,
    error: error,
    issues: issues ?? this.issues,
    currentUser: currentUser ?? this.currentUser,
    actioningIssueId: actioningIssueId == _sentinel
        ? this.actioningIssueId
        : actioningIssueId as int?,
    filter: filter ?? this.filter,
    counts: counts ?? this.counts,
    summaries: summaries ?? this.summaries,
  );
}

const _sentinel = Object();

class SeerrIssuesViewModel extends ChangeNotifier {
  final SeerrRepository _repo;

  SeerrIssuesState _state = const SeerrIssuesState();
  SeerrIssuesState get state => _state;

  SeerrIssuesViewModel(this._repo);

  /// Fetches just the counts so the tab badge can show before the tab opens.
  Future<void> loadCounts() async {
    try {
      await _repo.ensureInitialized();
      final user = _state.currentUser ?? await _repo.getCurrentUser();
      _state = _state.copyWith(currentUser: user);
      await _loadCounts(user);
    } catch (_) {}
  }

  Future<void> load({bool isRefresh = false}) async {
    _state = _state.copyWith(
      isLoading: !isRefresh,
      isRefreshing: isRefresh,
      issues: isRefresh ? _state.issues : const [],
      error: null,
    );
    notifyListeners();

    try {
      await _repo.ensureInitialized();
      final user = _state.currentUser ?? await _repo.getCurrentUser();

      final response = await _repo.getIssues(
        filter: _state.filter.apiValue,
        createdBy: user.canViewAllIssues ? null : user.id,
        limit: _pageSize,
        offset: 0,
      );

      _state = SeerrIssuesState(
        issues: response.results,
        currentUser: user,
        filter: _state.filter,
        hasMore: _hasMorePages(response, response.results.length),
        counts: _state.counts,
        summaries: _state.summaries,
      );
      notifyListeners();

      _hydrateSummaries(_state.issues);
      await _loadCounts(user);
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        isRefreshing: false,
        error: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_state.isLoading ||
        _state.isLoadingMore ||
        !_state.hasMore ||
        _state.currentUser == null) {
      return;
    }

    _state = _state.copyWith(isLoadingMore: true);
    notifyListeners();

    try {
      final user = _state.currentUser!;
      final response = await _repo.getIssues(
        filter: _state.filter.apiValue,
        createdBy: user.canViewAllIssues ? null : user.id,
        limit: _pageSize,
        offset: _state.issues.length,
      );

      final merged = [
        ..._state.issues,
        ...response.results
            .where((i) => !_state.issues.any((e) => e.id == i.id)),
      ];
      _state = _state.copyWith(
        isLoadingMore: false,
        issues: merged,
        hasMore: response.results.isNotEmpty &&
            _hasMorePages(response, merged.length),
      );
      _hydrateSummaries(response.results);
    } catch (_) {
      _state = _state.copyWith(isLoadingMore: false, hasMore: false);
    }
    notifyListeners();
  }

  /// The list endpoint's media objects only carry ids, so titles and posters
  /// come from the details endpoints, cached in the repository.
  Future<void> _hydrateSummaries(List<SeerrIssue> issues) async {
    final missing = issues.where((i) {
      final media = i.media;
      if (media?.tmdbId == null) return false;
      if ((media!.title ?? media.name) != null && media.posterPath != null) {
        return false;
      }
      final key = '${media.mediaType ?? 'movie'}:${media.tmdbId}';
      return !_state.summaries.containsKey(key);
    }).toList();
    if (missing.isEmpty) return;

    final entries = await Future.wait(
      missing.map((i) async {
        final media = i.media!;
        final mediaType = media.mediaType ?? 'movie';
        final summary = await _repo.getMediaSummary(media.tmdbId!, mediaType);
        return MapEntry('$mediaType:${media.tmdbId}', summary);
      }),
    );

    final updated = Map<String, SeerrMediaSummary>.from(_state.summaries);
    for (final entry in entries) {
      final summary = entry.value;
      if (summary != null) updated[entry.key] = summary;
    }
    if (updated.length == _state.summaries.length) return;
    _state = _state.copyWith(summaries: updated);
    notifyListeners();
  }

  Future<void> setFilter(SeerrIssueFilter filter) async {
    if (filter == _state.filter) return;
    _state = _state.copyWith(filter: filter, issues: const []);
    await load();
  }

  bool _hasMorePages(SeerrIssueListResponse response, int loaded) {
    final info = response.pageInfo;
    if (info == null) return response.results.length >= _pageSize;
    return loaded < info.results;
  }

  Future<void> _loadCounts(SeerrUser user) async {
    if (!user.canViewAllIssues) return;
    try {
      final counts = await _repo.getIssueCount();
      _state = _state.copyWith(counts: counts);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> refresh() => load(isRefresh: true);

  bool canResolve(SeerrIssue issue) {
    final user = _state.currentUser;
    if (user == null) return false;
    return user.canManageIssues || issue.createdBy?.id == user.id;
  }

  bool canDelete(SeerrIssue issue) {
    final user = _state.currentUser;
    if (user == null) return false;
    if (user.canManageIssues) return true;
    return issue.createdBy?.id == user.id && issue.comments.length <= 1;
  }

  bool canComment(SeerrIssue issue) => canResolve(issue);

  Future<void> resolveIssue(int issueId) => _runAction(
    issueId,
    () => _repo.setIssueStatus(issueId, 'resolved'),
  );

  Future<void> reopenIssue(int issueId) => _runAction(
    issueId,
    () => _repo.setIssueStatus(issueId, 'open'),
  );

  Future<void> deleteIssue(int issueId) async {
    _state = _state.copyWith(actioningIssueId: issueId);
    notifyListeners();

    try {
      await _repo.deleteIssue(issueId);
      _state = _state.copyWith(
        issues: _state.issues.where((i) => i.id != issueId).toList(),
        actioningIssueId: null,
      );
      _repo.invalidateBadgeCount();
      notifyListeners();
      final user = _state.currentUser;
      if (user != null) await _loadCounts(user);
    } catch (_) {
      _state = _state.copyWith(actioningIssueId: null);
      notifyListeners();
    }
  }

  /// The list response leaves comment authors empty, so the thread dialog
  /// refetches the single issue, which joins comments and users.
  Future<void> loadIssueDetails(int issueId) async {
    try {
      final issue = await _repo.getIssue(issueId);
      _patchIssue(issue);
    } catch (_) {}
  }

  Future<void> addComment(int issueId, String message) async {
    _state = _state.copyWith(actioningIssueId: issueId);
    notifyListeners();

    try {
      final updated = await _repo.commentOnIssue(issueId, message);
      _patchIssue(updated);
    } catch (_) {
      _state = _state.copyWith(actioningIssueId: null);
      notifyListeners();
    }
  }

  Future<void> _runAction(int issueId, Future<SeerrIssue> Function() action) async {
    _state = _state.copyWith(actioningIssueId: issueId);
    notifyListeners();

    try {
      final updated = await action();
      _patchIssue(updated);
      _repo.invalidateBadgeCount();
      final user = _state.currentUser;
      if (user != null) await _loadCounts(user);
    } catch (_) {
      _state = _state.copyWith(actioningIssueId: null);
      notifyListeners();
    }
  }

  /// Swap the acted-on issue in place so the list keeps its scroll position.
  void _patchIssue(SeerrIssue updated) {
    final issues = _state.issues
        .map((i) => i.id == updated.id ? updated : i)
        .toList();
    _state = _state.copyWith(issues: issues, actioningIssueId: null);
    notifyListeners();
  }
}
