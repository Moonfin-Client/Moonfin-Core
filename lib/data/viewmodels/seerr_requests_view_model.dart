import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../preference/seerr_preferences.dart';
import '../repositories/seerr_repository.dart';
import '../services/plugin_sync_service.dart';
import '../services/seerr/arr_queue.dart';
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
  final Object? error;
  final List<SeerrRequest> requests;
  final SeerrUser? currentUser;
  final int? actioningRequestId;
  final SeerrRequestFilter filter;
  final String sort;
  final SeerrRequestCounts? counts;
  final Map<String, SeerrMediaSummary> summaries;

  /// The arr's own queue per title, keyed like [summaries], for the titles
  /// Moonbase could read. A title missing here shows what Seerr reports.
  final Map<String, ArrQueue> arrQueues;

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
    this.arrQueues = const {},
  });

  bool get canManageRequests =>
      currentUser?.hasPermission(SeerrPermission.manageRequests) ?? false;

  SeerrMediaSummary? summaryFor(SeerrRequest request) {
    final tmdbId = request.media?.tmdbId;
    if (tmdbId == null) return null;
    return summaries['${request.type}:$tmdbId'];
  }

  /// The arr's queue for what [request] asked for: only its seasons of a
  /// series, and nothing for a 4K request, which Moonbase doesn't read.
  ArrQueue? arrQueueFor(SeerrRequest request) {
    if (request.is4k) return null;
    final tmdbId = request.media?.tmdbId;
    if (tmdbId == null) return null;
    final queue = arrQueues['${request.type}:$tmdbId'];
    return queue?.forSeasons(
      (request.seasons ?? const <SeerrSeasonRequest>[])
          .map((s) => s.seasonNumber),
    );
  }

  /// The download bar for a request card, from the arr's queue when there is
  /// one and from Seerr's download status otherwise.
  SeerrDownloadSummary? downloadFor(SeerrRequest request) =>
      SeerrDownloadSummary.forRequest(
        request,
        arrQueue: arrQueueFor(request),
      );

  /// An approved request whose released movie the arr hasn't found a release
  /// for yet.
  bool isNotFoundYet(SeerrRequest request) =>
      request.status == SeerrRequest.statusApproved &&
      request.media?.status == SeerrMediaStatus.processing &&
      (arrQueueFor(request)?.isNotFoundYet ?? false);

  SeerrRequestsState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    bool? isLoadingMore,
    bool? hasMore,
    Object? error,
    List<SeerrRequest>? requests,
    SeerrUser? currentUser,
    Object? actioningRequestId = _sentinel,
    SeerrRequestFilter? filter,
    String? sort,
    SeerrRequestCounts? counts,
    Map<String, SeerrMediaSummary>? summaries,
    Map<String, ArrQueue>? arrQueues,
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
    arrQueues: arrQueues ?? this.arrQueues,
  );
}

const _sentinel = Object();

class SeerrRequestsViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final SeerrPreferences? _prefs;

  SeerrRequestsState _state = const SeerrRequestsState();
  SeerrRequestsState get state => _state;

  Timer? _downloadPollTimer;
  bool _isDisposed = false;

  /// How many queue reads each title has started, keyed like the queues.
  final Map<String, int> _arrQueueFetches = {};

  SeerrRequestsViewModel(this._repo, [this._prefs]);

  @override
  void notifyListeners() {
    // The arr queue fetches can land after the screen has closed.
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _downloadPollTimer?.cancel();
    super.dispose();
  }

  /// A card showing a bar, or one waiting for the arr to find a release,
  /// which the next queue read may turn into a bar.
  bool _isWatched(SeerrRequest r) =>
      _state.downloadFor(r) != null || _state.isNotFoundYet(r);

  bool get _hasActiveDownloads => _state.requests.any(_isWatched);

  /// Keep a refresh timer running only while something is downloading, so the
  /// progress bars advance without the user pulling to refresh.
  void _syncDownloadPolling() {
    // A fetch that lands after the screen closed must not start a new timer.
    if (_isDisposed) return;
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
      // Only the cards showing a bar or Not found yet. Every other title is
      // fetched on load and refresh, which keeps a long list from costing a
      // plugin call per title on every tick.
      await _loadArrQueues(_state.requests.where(_isWatched).toList());
    } catch (_) {
      // Leave the list as-is and let the next tick retry.
    }
    _syncDownloadPolling();
  }

  /// Reads the arr's queue through Moonbase for each title in [requests] with
  /// an approved HD request on its way, once per title however many requests
  /// share it. A title Moonbase can't read drops out of the map, which puts
  /// its card back on what Seerr reports.
  Future<void> _loadArrQueues(List<SeerrRequest> requests) async {
    if (!GetIt.instance.isRegistered<PluginSyncService>() ||
        !GetIt.instance<PluginSyncService>().arrQueueAvailable) {
      // Moonbase stopped offering the queue while the screen was open, so
      // the cards go back to what Seerr reports.
      if (_state.arrQueues.isNotEmpty) {
        _arrQueueFetches.clear();
        _state = _state.copyWith(arrQueues: const {});
        notifyListeners();
      }
      return;
    }
    final wanted = <String, ({int? tmdbId, int? tvdbId})>{};
    for (final r in requests) {
      final media = r.media;
      final tmdbId = media?.tmdbId;
      if (r.is4k || tmdbId == null) continue;
      if (r.status != SeerrRequest.statusApproved) continue;
      if (media!.status != SeerrMediaStatus.processing &&
          media.status != SeerrMediaStatus.partiallyAvailable) {
        continue;
      }
      if (r.type == 'tv') {
        if (media.tvdbId == null) continue;
        wanted['tv:$tmdbId'] = (tmdbId: null, tvdbId: media.tvdbId);
      } else {
        wanted['movie:$tmdbId'] = (tmdbId: tmdbId, tvdbId: null);
      }
    }
    if (wanted.isEmpty) return;

    // Load, load more and the poll can each ask for the same title at once.
    // Only the latest ask for a title may land, so an older, slower reply
    // can't put back a queue a newer one already replaced.
    final fetches = {
      for (final key in wanted.keys)
        key: _arrQueueFetches[key] = (_arrQueueFetches[key] ?? 0) + 1,
    };
    final results = await Future.wait(
      wanted.entries.map((entry) async {
        try {
          final queue = await _repo.getArrQueue(
            tmdbId: entry.value.tmdbId,
            tvdbId: entry.value.tvdbId,
          );
          return MapEntry(entry.key, queue);
        } catch (e) {
          debugPrint('[SeerrRequests] Arr queue for ${entry.key} failed: $e');
          return MapEntry<String, ArrQueue?>(entry.key, null);
        }
      }),
    );
    if (_isDisposed) return;
    final updated = Map<String, ArrQueue>.from(_state.arrQueues);
    var changed = false;
    for (final entry in results) {
      if (_arrQueueFetches[entry.key] != fetches[entry.key]) continue;
      changed = true;
      final queue = entry.value;
      if (queue == null) {
        updated.remove(entry.key);
      } else {
        updated[entry.key] = queue;
      }
    }
    if (!changed) return;
    _state = _state.copyWith(arrQueues: updated);
    notifyListeners();
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
        arrQueues: _state.arrQueues,
      );
      notifyListeners();
      _syncDownloadPolling();

      _hydrateSummaries(_state.requests);
      // Not awaited, so a slow arr doesn't hold up the counts. The poll
      // decides again once it lands, since a stuck download Seerr can't see
      // still needs its bar kept current.
      unawaited(
        _loadArrQueues(_state.requests).whenComplete(_syncDownloadPolling),
      );

      await _loadCounts(user);
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        isRefreshing: false,
        error: e,
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
      unawaited(
        _loadArrQueues(response.results).whenComplete(_syncDownloadPolling),
      );
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
      await _loadArrQueues([updated]);
      _syncDownloadPolling();
    } catch (_) {
      await load(isRefresh: true);
    }
  }
}
