import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../preference/seerr_preferences.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_download_progress.dart';
import '../services/seerr/seerr_models.dart';

enum SeerrRequestFilter { all, pending, approved, processing, available, failed }

extension SeerrRequestFilterApi on SeerrRequestFilter {
  String? get apiValue => this == SeerrRequestFilter.all ? null : name;
}

const _pageSize = 20;

class SeerrRequestsState {
  final bool isLoading;
  final bool isRefreshing;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final List<SeerrRequest> requests;
  final SeerrUser? currentUser;
  final int? actioningRequestId;
  final SeerrRequestFilter filter;
  final String sort;
  final SeerrRequestCounts? counts;
  final Map<String, SeerrMediaSummary> summaries;

  const SeerrRequestsState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.isLoadingMore = false,
    this.hasMore = false,
    this.error,
    this.requests = const [],
    this.currentUser,
    this.actioningRequestId,
    this.filter = SeerrRequestFilter.all,
    this.sort = 'added',
    this.counts,
    this.summaries = const {},
  });

  bool get canManageRequests =>
      currentUser?.hasPermission(SeerrPermission.manageRequests) ?? false;

  SeerrMediaSummary? summaryFor(SeerrRequest request) {
    final tmdbId = request.media?.tmdbId;
    if (tmdbId == null) return null;
    return summaries['${request.type}:$tmdbId'];
  }

  SeerrRequestsState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    List<SeerrRequest>? requests,
    SeerrUser? currentUser,
    Object? actioningRequestId = _sentinel,
    SeerrRequestFilter? filter,
    String? sort,
    SeerrRequestCounts? counts,
    Map<String, SeerrMediaSummary>? summaries,
  }) => SeerrRequestsState(
    isLoading: isLoading ?? this.isLoading,
    isRefreshing: isRefreshing ?? this.isRefreshing,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    hasMore: hasMore ?? this.hasMore,
    error: error,
    requests: requests ?? this.requests,
    currentUser: currentUser ?? this.currentUser,
    actioningRequestId: actioningRequestId == _sentinel
        ? this.actioningRequestId
        : actioningRequestId as int?,
    filter: filter ?? this.filter,
    sort: sort ?? this.sort,
    counts: counts ?? this.counts,
    summaries: summaries ?? this.summaries,
  );
}

const _sentinel = Object();

class SeerrRequestsViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final SeerrPreferences? _prefs;

  SeerrRequestsState _state = const SeerrRequestsState();
  SeerrRequestsState get state => _state;

  Timer? _downloadPollTimer;

  SeerrRequestsViewModel(this._repo, [this._prefs]);

  @override
  void dispose() {
    _downloadPollTimer?.cancel();
    super.dispose();
  }

  bool get _hasActiveDownloads => _state.requests
      .any((r) => SeerrDownloadSummary.forRequest(r) != null);

  /// Keep a refresh timer running only while something is downloading, so the
  /// progress bars advance without the user pulling to refresh.
  void _syncDownloadPolling() {
    if (_hasActiveDownloads) {
      _downloadPollTimer ??= Timer.periodic(
        const Duration(seconds: 15),
        (_) => _pollDownloads(),
      );
    } else {
      _downloadPollTimer?.cancel();
      _downloadPollTimer = null;
    }
  }

  /// Quiet refresh of the first page that merges results into the current
  /// list. Poll failures are ignored so a flaky tick never surfaces error UI.
  Future<void> _pollDownloads() async {
    final user = _state.currentUser;
    if (user == null ||
        _state.isLoading ||
        _state.isRefreshing ||
        _state.isLoadingMore) {
      return;
    }
    try {
      final response = await _repo.getRequests(
        filter: _state.filter.apiValue,
        sort: _state.sort,
        requestedBy: user.canViewAllRequests ? null : user.id,
        limit: _pageSize,
        offset: 0,
      );
      final fresh = {for (final r in response.results) r.id: r};
      var changed = false;
      final requests = _state.requests.map((r) {
        final updated = fresh[r.id];
        if (updated == null) return r;
        changed = true;
        return updated;
      }).toList();
      if (changed) {
        _state = _state.copyWith(requests: requests);
        notifyListeners();
      }
    } catch (_) {
      // Leave the list as-is and let the next tick retry.
    }
    _syncDownloadPolling();
  }

  SeerrRequestFilter _restoreFilter(SeerrUser user) {
    final stored = _prefs?.requestsFilter ?? '';
    for (final f in SeerrRequestFilter.values) {
      if (f.name == stored) return f;
    }
    return user.hasPermission(SeerrPermission.manageRequests)
        ? SeerrRequestFilter.pending
        : SeerrRequestFilter.all;
  }

  Future<void> load({bool isRefresh = false}) async {
    _state = _state.copyWith(
      isLoading: !isRefresh,
      isRefreshing: isRefresh,
      requests: isRefresh ? _state.requests : const [],
      error: null,
    );
    notifyListeners();

    try {
      await _repo.ensureInitialized();
      final user = _state.currentUser ?? await _repo.getCurrentUser();
      final filter = _state.currentUser == null
          ? _restoreFilter(user)
          : _state.filter;

      final response = await _repo.getRequests(
        filter: filter.apiValue,
        sort: _state.sort,
        requestedBy: user.canViewAllRequests ? null : user.id,
        limit: _pageSize,
        offset: 0,
      );

      _state = SeerrRequestsState(
        requests: _visibleRequests(response.results, filter),
        currentUser: user,
        filter: filter,
        sort: _state.sort,
        hasMore: _hasMorePages(response, response.results.length),
        counts: _state.counts,
        summaries: _state.summaries,
      );
      notifyListeners();
      _syncDownloadPolling();

      _hydrateSummaries(_state.requests);
      await _loadCounts(user);
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        isRefreshing: false,
        error: e.toString(),
      );
      notifyListeners();
      _syncDownloadPolling();
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
      final response = await _repo.getRequests(
        filter: _state.filter.apiValue,
        sort: _state.sort,
        requestedBy: user.canViewAllRequests ? null : user.id,
        limit: _pageSize,
        offset: _state.requests.length,
      );

      final merged = [
        ..._state.requests,
        ..._visibleRequests(response.results, _state.filter)
            .where((r) => !_state.requests.any((e) => e.id == r.id)),
      ];
      _state = _state.copyWith(
        isLoadingMore: false,
        requests: merged,
        hasMore: response.results.isNotEmpty &&
            _hasMorePages(response, merged.length),
      );
      _hydrateSummaries(response.results);
    } catch (_) {
      _state = _state.copyWith(isLoadingMore: false, hasMore: false);
    }
    notifyListeners();
    _syncDownloadPolling();
  }

  /// The list endpoint's media objects only carry ids, so titles and posters
  /// come from the details endpoints, cached in the repository.
  Future<void> _hydrateSummaries(List<SeerrRequest> requests) async {
    final missing = requests.where((r) {
      final media = r.media;
      if (media?.tmdbId == null) return false;
      if ((media!.title ?? media.name) != null && media.posterPath != null) {
        return false;
      }
      return !_state.summaries.containsKey('${r.type}:${media.tmdbId}');
    }).toList();
    if (missing.isEmpty) return;

    final entries = await Future.wait(
      missing.map((r) async {
        final summary = await _repo.getMediaSummary(r.media!.tmdbId!, r.type);
        return MapEntry('${r.type}:${r.media!.tmdbId}', summary);
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

  Future<void> setFilter(SeerrRequestFilter filter) async {
    if (filter == _state.filter) return;
    _state = _state.copyWith(filter: filter, requests: const []);
    await _prefs?.setRequestsFilter(filter.name);
    await load();
  }

  Future<void> setSort(String sort) async {
    if (sort == _state.sort) return;
    _state = _state.copyWith(sort: sort, requests: const []);
    await load();
  }

  bool _hasMorePages(SeerrRequestListResponse response, int loaded) {
    final info = response.pageInfo;
    if (info == null) return response.results.length >= _pageSize;
    return loaded < info.results;
  }

  /// Declined requests older than 3 days only clutter the unfiltered list.
  /// Failed ones stay visible so managers can retry them.
  List<SeerrRequest> _visibleRequests(
    List<SeerrRequest> requests,
    SeerrRequestFilter filter,
  ) {
    if (filter != SeerrRequestFilter.all) return requests;
    final now = DateTime.now();
    return requests.where((r) {
      if (r.status == SeerrRequest.statusDeclined) {
        final updated = r.updatedAt != null
            ? DateTime.tryParse(r.updatedAt!)
            : null;
        if (updated != null && now.difference(updated).inDays > 3) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  Future<void> _loadCounts(SeerrUser user) async {
    if (!user.canViewAllRequests) return;
    try {
      final counts = await _repo.getRequestCount();
      _state = _state.copyWith(counts: counts);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> refresh() => load(isRefresh: true);

  Future<void> approveRequest(int requestId) =>
      _runAction(requestId, () => _repo.approveRequest(requestId));

  Future<void> declineRequest(int requestId) =>
      _runAction(requestId, () => _repo.declineRequest(requestId));

  Future<void> retryRequest(int requestId) =>
      _runAction(requestId, () => _repo.retryRequest(requestId));

  Future<void> _runAction(int requestId, Future<void> Function() action) async {
    _state = _state.copyWith(actioningRequestId: requestId);
    notifyListeners();

    try {
      await action();
      await _patchRequest(requestId);
      _repo.invalidateBadgeCount();
      final user = _state.currentUser;
      if (user != null) await _loadCounts(user);
    } catch (_) {
      _state = _state.copyWith(actioningRequestId: null);
      notifyListeners();
    }
  }

  /// Refetch just the acted-on request so the list keeps its scroll position.
  Future<void> _patchRequest(int requestId) async {
    try {
      final updated = await _repo.getRequest(requestId);
      final requests = _state.requests
          .map((r) => r.id == requestId ? updated : r)
          .toList();
      _state = _state.copyWith(
        requests: requests,
        actioningRequestId: null,
      );
      notifyListeners();
      _syncDownloadPolling();
    } catch (_) {
      await load(isRefresh: true);
    }
  }
}
