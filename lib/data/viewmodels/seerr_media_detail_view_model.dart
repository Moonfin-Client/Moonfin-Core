import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../preference/seerr_preferences.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_download_progress.dart';
import '../services/seerr/seerr_error.dart';

/// Reads one flag out of Seerr's public settings.
///
/// A server too old to know about a flag leaves it out of the payload rather
/// than sending false, so absence means no opinion and [fallback] stands. That
/// matters for the 4K flags: reading silence as switched off hid the 4K
/// request control from everyone on those builds.
@visibleForTesting
bool seerrPublicFlag(
  Map<String, dynamic> settings,
  String key, {
  required bool fallback,
}) => settings.containsKey(key) ? settings[key] == true : fallback;

/// One quality track (HD or 4K) of a title: its media status, the requests
/// for that track, and the flags the UI reads. Seerr stores the two
/// qualities independently, as status vs status4k and SeerrRequest.is4k, so
/// each track carries its own request slot.
class SeerrQualityStatus {
  final bool is4k;
  final int status;
  final List<SeerrRequest> requests;
  final List<SeerrRequest> activeRequests;
  final SeerrDownloadSummary? download;
  final bool canManageRequests;
  final int? currentUserId;

  /// What Seerr reports per season, when it reports anything. Older servers and
  /// movie payloads leave this empty, which is why [seasonStatus] can fall back
  /// to the request list.
  final List<SeerrSeasonAvailability> seasonAvailability;

  const SeerrQualityStatus({
    required this.is4k,
    required this.status,
    required this.requests,
    required this.activeRequests,
    required this.download,
    required this.canManageRequests,
    required this.currentUserId,
    this.seasonAvailability = const [],
  });

  factory SeerrQualityStatus.of({
    required bool is4k,
    required SeerrMediaInfo? mediaInfo,
    required bool canManageRequests,
    required int? currentUserId,
  }) {
    final status = (is4k ? mediaInfo?.status4k : mediaInfo?.status) ?? 0;
    final requests = (mediaInfo?.requests ?? const <SeerrRequest>[])
        .where((r) => r.is4k == is4k)
        .toList();
    return SeerrQualityStatus(
      is4k: is4k,
      status: status,
      requests: requests,
      activeRequests: requests
          .where((r) =>
              r.status == SeerrRequest.statusPending ||
              r.status == SeerrRequest.statusApproved)
          .toList(),
      download: SeerrDownloadSummary.forMedia(
        status: status,
        items: is4k ? mediaInfo?.downloadStatus4k : mediaInfo?.downloadStatus,
      ),
      canManageRequests: canManageRequests,
      currentUserId: currentUserId,
      seasonAvailability:
          mediaInfo?.seasons ?? const <SeerrSeasonAvailability>[],
    );
  }

  bool get isFullyAvailable => status == 5;
  bool get isPartiallyAvailable => status == 4;
  bool get isAvailable => isFullyAvailable || isPartiallyAvailable;
  bool get isProcessing => status == 3;
  bool get isPending => status == 2;
  bool get isBlacklisted => status == 6;
  bool get isDeleted => status == 7;

  /// Whether Seerr reports anything at all for this track. A server with no
  /// 4K backend leaves status4k at unknown (1), so this stays false there.
  bool get hasAnyState => status > 1 || requests.isNotEmpty;

  bool get hasExistingRequest => activeRequests.isNotEmpty;

  /// Seerr's delete rule: a request manager may remove any open request, and
  /// everyone else only their own while it is still pending. Offering more
  /// than that gets a 401 back from the server instead of a cancel.
  List<SeerrRequest> get cancelableRequests {
    if (canManageRequests) return activeRequests;
    final userId = currentUserId;
    // Without a known user every request would match on a null owner id.
    if (userId == null) return const [];
    return activeRequests
        .where((r) =>
            r.status == SeerrRequest.statusPending &&
            r.requestedBy?.id == userId)
        .toList();
  }

  Set<int> get requestedSeasons {
    final seasons = <int>{};
    for (final r in requests) {
      if (r.status == SeerrRequest.statusDeclined ||
          r.status == SeerrRequest.statusFailed) {
        continue;
      }
      if (r.seasons != null) {
        for (final s in r.seasons!) {
          seasons.add(s.seasonNumber);
        }
      }
    }
    return seasons;
  }

  /// Seasons the library already holds for this track, fully or partially.
  Set<int> get availableSeasons => {
        for (final s in seasonAvailability)
          if (((is4k ? s.status4k : s.status) ?? 0) >= 4) s.seasonNumber,
      };

  /// Seasons the request sheet may not offer: already in the library or
  /// already spoken for by an open request.
  Set<int> get unavailableOrRequestedSeasons =>
      {...requestedSeasons, ...availableSeasons};

  /// Season number to media status (2 pending, 3 processing, 4 partial,
  /// 5 available) for this quality track, so a series can show where it stands
  /// season by season rather than only as a whole.
  ///
  /// Deliberately separate from [unavailableOrRequestedSeasons], which answers
  /// the narrower "may this season still be requested" question the request
  /// sheet asks.
  Map<int, int> get seasonStatus {
    final byNumber = <int, int>{};

    // What the server says, wherever it says anything.
    for (final s in seasonAvailability) {
      final status = (is4k ? s.status4k : s.status) ?? 0;
      if (status > 1) byNumber[s.seasonNumber] = status;
    }

    // Anything the server didn't cover falls back to the request it came from.
    for (final r in requests) {
      if (r.status == SeerrRequest.statusDeclined ||
          r.status == SeerrRequest.statusFailed) {
        continue;
      }
      final derived = switch (r.status) {
        SeerrRequest.statusCompleted => 5,
        SeerrRequest.statusApproved => 3,
        _ => 2,
      };
      for (final s in r.seasons ?? const <SeerrSeasonRequest>[]) {
        byNumber.putIfAbsent(s.seasonNumber, () => derived);
      }
    }

    return byNumber;
  }
}

class SeerrMediaDetailState {
  final bool isLoading;
  final String? error;
  final SeerrMovieDetails? movie;
  final SeerrTvDetails? tv;
  final List<SeerrDiscoverItem> similar;
  final List<SeerrDiscoverItem> recommendations;
  final SeerrUser? currentUser;
  final bool isRequesting;
  final String? requestError;
  final SeerrRequestErrorKind? requestErrorKind;
  final String? requestSuccess;
  final SeerrQuota? quota;
  final bool isTogglingWatchlist;
  final bool onUserWatchlist;
  final String? watchlistError;

  const SeerrMediaDetailState({
    this.isLoading = false,
    this.error,
    this.movie,
    this.tv,
    this.similar = const [],
    this.recommendations = const [],
    this.currentUser,
    this.isRequesting = false,
    this.requestError,
    this.requestErrorKind,
    this.requestSuccess,
    this.quota,
    this.isTogglingWatchlist = false,
    this.onUserWatchlist = false,
    this.watchlistError,
  });

  bool get isMovie => movie != null;
  bool get isTv => tv != null;
  bool get isAnime {
    if (tv != null) {
      return tv!.keywords.any((keyword) => keyword.id == 210024);
    }
    return false;
  }

  String get displayTitle {
    if (movie != null) return movie!.title;
    if (tv != null) return tv!.displayTitle;
    return '';
  }

  String? get tagline => movie?.tagline ?? tv?.tagline;
  String? get overview => movie?.overview ?? tv?.overview;
  String? get posterPath => movie?.posterPath ?? tv?.posterPath;
  String? get backdropPath => movie?.backdropPath ?? tv?.backdropPath;
  double? get voteAverage => movie?.voteAverage ?? tv?.voteAverage;
  List<SeerrGenre> get genres => movie?.genres ?? tv?.genres ?? [];
  SeerrCredits? get credits => movie?.credits ?? tv?.credits;
  SeerrMediaInfo? get mediaInfo => movie?.mediaInfo ?? tv?.mediaInfo;
  SeerrExternalIds? get externalIds => movie?.externalIds ?? tv?.externalIds;
  int get tmdbId => movie?.id ?? tv?.id ?? 0;

  int? get runtime => movie?.runtime;
  int? get budget => movie?.budget;
  int? get revenue => movie?.revenue;
  String? get releaseDate => movie?.releaseDate;

  String? get firstAirDate => tv?.firstAirDate;
  int? get numberOfSeasons => tv?.numberOfSeasons;
  int? get numberOfEpisodes => tv?.numberOfEpisodes;
  String? get tvStatus => tv?.status;
  List<SeerrNetwork> get networks => tv?.networks ?? [];
  List<SeerrKeyword> get keywords =>
      movie?.keywords ?? tv?.keywords ?? [];
  List<SeerrVideo> get relatedVideos =>
      movie?.relatedVideos ?? tv?.relatedVideos ?? const [];

  SeerrVideo? get bestTrailer {
    final videos = relatedVideos;
    if (videos.isEmpty) return null;
    SeerrVideo? youtubeTrailer;
    SeerrVideo? anyTrailer;
    SeerrVideo? anyYoutube;
    for (final v in videos) {
      final isYouTube = (v.site ?? '').toLowerCase() == 'youtube';
      final isTrailer = (v.type ?? '').toLowerCase() == 'trailer';
      if (isYouTube && isTrailer) {
        youtubeTrailer ??= v;
      } else if (isTrailer) {
        anyTrailer ??= v;
      } else if (isYouTube) {
        anyYoutube ??= v;
      }
    }
    return youtubeTrailer ?? anyTrailer ?? anyYoutube ?? videos.first;
  }

  SeerrQualityStatus quality({required bool is4k}) => SeerrQualityStatus.of(
        is4k: is4k,
        mediaInfo: mediaInfo,
        canManageRequests: canManageRequests,
        currentUserId: currentUser?.id,
      );

  SeerrQualityStatus get hd => quality(is4k: false);
  SeerrQualityStatus get uhd => quality(is4k: true);

  bool get isAvailableAnyQuality => hd.isAvailable || uhd.isAvailable;

  SeerrDownloadSummary? get hdDownload => hd.download;
  SeerrDownloadSummary? get download4k => uhd.download;

  bool get canManageRequests =>
      currentUser?.hasPermission(SeerrPermission.manageRequests) ?? false;

  /// Pending or approved requests across both qualities, for the requester
  /// rows and for checking whether anything is still open on the title.
  List<SeerrRequest> get allActiveRequests {
    final requests = mediaInfo?.requests;
    if (requests == null) return [];
    return requests
        .where((r) =>
            r.status == SeerrRequest.statusPending ||
            r.status == SeerrRequest.statusApproved)
        .toList();
  }

  SeerrMediaDetailState copyWith({
    bool? isLoading,
    String? error,
    SeerrMovieDetails? movie,
    SeerrTvDetails? tv,
    List<SeerrDiscoverItem>? similar,
    List<SeerrDiscoverItem>? recommendations,
    SeerrUser? currentUser,
    bool? isRequesting,
    String? requestError,
    SeerrRequestErrorKind? requestErrorKind,
    String? requestSuccess,
    SeerrQuota? quota,
    bool? isTogglingWatchlist,
    bool? onUserWatchlist,
    String? watchlistError,
  }) =>
      SeerrMediaDetailState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        movie: movie ?? this.movie,
        tv: tv ?? this.tv,
        similar: similar ?? this.similar,
        recommendations: recommendations ?? this.recommendations,
        currentUser: currentUser ?? this.currentUser,
        isRequesting: isRequesting ?? this.isRequesting,
        requestError: requestError,
        requestErrorKind: requestErrorKind,
        requestSuccess: requestSuccess,
        quota: quota ?? this.quota,
        isTogglingWatchlist: isTogglingWatchlist ?? this.isTogglingWatchlist,
        onUserWatchlist: onUserWatchlist ?? this.onUserWatchlist,
        watchlistError: watchlistError,
      );
}

class SeerrMediaDetailViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final SeerrPreferences _prefs;

  SeerrMediaDetailState _state = const SeerrMediaDetailState();
  SeerrMediaDetailState get state => _state;

  // Whether the server has a default 4K Radarr or Sonarr. These start true so
  // that until the fetch lands, or if it fails, 4K stays gated on permission
  // alone rather than disappearing.
  bool _movie4kEnabled = true;
  bool _series4kEnabled = true;

  Timer? _downloadPollTimer;

  SeerrMediaDetailViewModel(this._repo, this._prefs);

  @override
  void dispose() {
    _downloadPollTimer?.cancel();
    super.dispose();
  }

  /// Keep a refresh timer running only while a download is active, so the
  /// progress bars advance without leaving and reopening the screen.
  void _syncDownloadPolling() {
    if (_state.hdDownload != null || _state.download4k != null) {
      _downloadPollTimer ??= Timer.periodic(
        const Duration(seconds: 15),
        (_) => _pollDownloadStatus(),
      );
    } else {
      _downloadPollTimer?.cancel();
      _downloadPollTimer = null;
    }
  }

  /// Quiet details refetch that only swaps the media payload. It never touches
  /// isRequesting or requestSuccess, so no snackbar fires, and failures are
  /// ignored so a flaky tick never surfaces error UI.
  Future<void> _pollDownloadStatus() async {
    if (_state.isLoading || _state.isRequesting || _state.tmdbId == 0) return;
    try {
      if (_state.isTv) {
        final details = await _repo.getTvDetails(_state.tmdbId);
        _state = _state.copyWith(tv: details);
      } else if (_state.isMovie) {
        final details = await _repo.getMovieDetails(_state.tmdbId);
        _state = _state.copyWith(movie: details);
      } else {
        return;
      }
      notifyListeners();
    } catch (_) {
      // Leave the details as-is and let the next tick retry.
    }
    _syncDownloadPolling();
  }

  void clearFeedback() {
    _state = _state.copyWith(
      requestSuccess: null,
      requestError: null,
      watchlistError: null,
    );
  }

  /// Seerr only offers 4K requests when the server has a default 4K backend,
  /// which it reports as movie4kEnabled and series4kEnabled.
  Future<void> _loadPublicSettings() async {
    try {
      final settings = await _repo.getPublicSettings();
      _movie4kEnabled = seerrPublicFlag(
        settings,
        'movie4kEnabled',
        fallback: _movie4kEnabled,
      );
      _series4kEnabled = seerrPublicFlag(
        settings,
        'series4kEnabled',
        fallback: _series4kEnabled,
      );
      notifyListeners();
    } catch (_) {
      // Keep the permissive defaults.
    }
  }

  /// The search hit of the kind that was asked for.
  ///
  /// Seerr ranks a search by popularity across every kind of media, so the
  /// first hit for a film can easily be a series of the same name.
  @visibleForTesting
  static SeerrDiscoverItem bestSearchMatch(
    List<SeerrDiscoverItem> results,
    String mediaType,
  ) {
    for (final result in results) {
      if (result.mediaType == mediaType) return result;
    }
    return results.first;
  }

  Future<void> load(String itemId, String mediaType, {String? title}) async {
    _state = const SeerrMediaDetailState(isLoading: true);
    notifyListeners();

    try {
      await _repo.ensureInitialized();
      unawaited(_loadPublicSettings());

      SeerrUser? user;
      try {
        user = await _repo.getCurrentUser();
      } catch (_) {}

      int tmdbId;
      String resolvedMediaType = mediaType;

      if (itemId.startsWith('tt')) {
        // The IMDb id names exactly one title, so it is asked first. A title
        // search is a guess and only stands in when the id turns up nothing.
        SeerrDiscoverPage? searchPage;
        try {
          searchPage = await _repo.search(itemId);
        } catch (e) {
          debugPrint('[SeerrDetail] Search by IMDb ID failed: $e');
        }
        if ((searchPage == null || searchPage.results.isEmpty) &&
            title != null &&
            title.isNotEmpty) {
          try {
            searchPage = await _repo.search(title);
          } catch (e) {
            debugPrint('[SeerrDetail] Search by title failed: $e');
          }
        }
        if (searchPage == null || searchPage.results.isEmpty) {
          throw Exception('Media not found on Seerr');
        }
        final match = bestSearchMatch(searchPage.results, mediaType);
        tmdbId = match.id;
        resolvedMediaType = match.mediaType ?? mediaType;
      } else {
        final parsed = int.tryParse(itemId);
        if (parsed == null) {
          throw Exception('Invalid media ID');
        }
        tmdbId = parsed;
      }

      if (resolvedMediaType == 'tv') {
        try {
          final (details, onWatchlist) = await _repo.getTvDetailsWithWatchlist(tmdbId);
          _state = SeerrMediaDetailState(
            tv: details,
            currentUser: user,
            onUserWatchlist: onWatchlist,
          );
          notifyListeners();
          _loadRelated(tmdbId, 'tv');
        } catch (e) {
          debugPrint('[SeerrDetail] getTvDetails failed: $e. Attempting fallback to search...');
          final fallbackDetails = await _trySearchFallbackTv(tmdbId, title);
          if (fallbackDetails != null) {
            _state = SeerrMediaDetailState(tv: fallbackDetails, currentUser: user);
            notifyListeners();
          } else {
            rethrow;
          }
        }
      } else {
        try {
          final (details, onWatchlist) = await _repo.getMovieDetailsWithWatchlist(tmdbId);
          _state = SeerrMediaDetailState(
            movie: details,
            currentUser: user,
            onUserWatchlist: onWatchlist,
          );
          notifyListeners();
          _loadRelated(tmdbId, 'movie');
        } catch (e) {
          debugPrint('[SeerrDetail] getMovieDetails failed: $e. Attempting fallback to search...');
          final fallbackDetails = await _trySearchFallbackMovie(tmdbId, title);
          if (fallbackDetails != null) {
            _state = SeerrMediaDetailState(movie: fallbackDetails, currentUser: user);
            notifyListeners();
          } else {
            rethrow;
          }
        }
      }
    } catch (e) {
      _state = SeerrMediaDetailState(error: e.toString());
    }
    notifyListeners();
    _syncDownloadPolling();
  }

  Future<void> _loadRelated(int tmdbId, String mediaType) async {
    try {
      final futures = await Future.wait([
        mediaType == 'movie'
            ? _repo.getSimilarMovies(tmdbId)
            : _repo.getSimilarTv(tmdbId),
        mediaType == 'movie'
            ? _repo.getMovieRecommendations(tmdbId)
            : _repo.getTvRecommendations(tmdbId),
      ]);

      _state = _state.copyWith(
        similar: futures[0].results,
        recommendations: futures[1].results,
      );
      notifyListeners();
    } catch (_) {
    }
  }

  Future<void> submitRequest({
    bool is4k = false,
    List<int>? seasons,
    bool allSeasons = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) async {
    if (_state.isRequesting) {
      return;
    }

    _state = _state.copyWith(isRequesting: true, requestError: null, requestSuccess: null);
    notifyListeners();

    try {
      final mediaType = _state.isTv ? 'tv' : 'movie';
      await _repo.createRequest(
        mediaId: _state.tmdbId,
        mediaType: mediaType,
        seasons: seasons,
        allSeasons: allSeasons,
        is4k: is4k,
        profileId: profileId,
        rootFolder: rootFolder,
        serverId: serverId,
      );

      await _reloadDetails('Request submitted');
    } catch (e) {
      _setRequestFailure(e);
    }
    notifyListeners();
  }

  Future<void> loadQuota() async {
    final user = _state.currentUser;
    if (user == null || _state.quota != null) return;
    try {
      final quota = await _repo.getUserQuota(user.id);
      _state = _state.copyWith(quota: quota);
      notifyListeners();
    } catch (_) {}
  }

  Future<bool> submitIssue({
    required int issueType,
    required String message,
    int problemSeason = 0,
    int problemEpisode = 0,
  }) async {
    final mediaId = _state.mediaInfo?.id;
    if (mediaId == null || _state.isRequesting) return false;

    _state = _state.copyWith(
      isRequesting: true,
      requestError: null,
      requestSuccess: null,
    );
    notifyListeners();

    try {
      await _repo.createIssue(
        issueType: issueType,
        message: message,
        mediaId: mediaId,
        problemSeason: problemSeason,
        problemEpisode: problemEpisode,
      );
      _state = _state.copyWith(
        isRequesting: false,
        requestSuccess: 'Issue reported',
      );
      notifyListeners();
      return true;
    } catch (e) {
      _state = _state.copyWith(
        isRequesting: false,
        requestError: e.toString(),
      );
      notifyListeners();
      return false;
    }
  }

  Future<void> cancelRequests(List<int> requestIds) async {
    if (_state.isRequesting) {
      return;
    }

    _state = _state.copyWith(isRequesting: true, requestError: null, requestSuccess: null);
    notifyListeners();

    try {
      for (final id in requestIds) {
        await _repo.deleteRequest(id);
      }
      await _reloadDetails('Request cancelled');
    } catch (e) {
      _setRequestFailure(e);
    }
    notifyListeners();
  }

  Future<void> approveRequest(int requestId) async {
    await _runRequestMutation(
      () => _repo.approveRequest(requestId),
      'Request approved',
    );
  }

  Future<void> declineRequest(int requestId) async {
    await _runRequestMutation(
      () => _repo.declineRequest(requestId),
      'Request declined',
    );
  }

  Future<void> _runRequestMutation(
    Future<void> Function() mutation,
    String successMessage,
  ) async {
    if (_state.isRequesting) {
      return;
    }

    _state = _state.copyWith(isRequesting: true, requestError: null, requestSuccess: null);
    notifyListeners();

    try {
      await mutation();
      await _reloadDetails(successMessage);
    } catch (e) {
      _setRequestFailure(e);
    }

    notifyListeners();
  }

  /// Keeps the typed kind when Seerr refused the mutation so the UI can show a
  /// translated reason instead of a raw exception.
  void _setRequestFailure(Object error) {
    _state = error is SeerrRequestException
        ? _state.copyWith(
            isRequesting: false,
            requestError: error.serverMessage ?? error.kind.name,
            requestErrorKind: error.kind,
          )
        : _state.copyWith(isRequesting: false, requestError: error.toString());
  }

  Future<void> _reloadDetails(String successMessage) async {
    try {
      if (_state.isTv) {
        final details = await _repo.getTvDetails(_state.tmdbId);
        _state = _state.copyWith(
          tv: details,
          isRequesting: false,
          requestSuccess: successMessage,
        );
      } else {
        final details = await _repo.getMovieDetails(_state.tmdbId);
        _state = _state.copyWith(
          movie: details,
          isRequesting: false,
          requestSuccess: successMessage,
        );
      }
    } catch (_) {
      _state = _state.copyWith(
        isRequesting: false,
        requestSuccess: successMessage,
      );
    }
    _syncDownloadPolling();
  }

  Future<void> toggleWatchlist() async {
    final s = _state;
    if (s.isTogglingWatchlist) return;
    final tmdbId = s.tmdbId;
    if (tmdbId == 0) return;
    final mediaType = s.isMovie ? 'movie' : 'tv';
    final wasOnWatchlist = s.onUserWatchlist;

    _state = _state.copyWith(
      isTogglingWatchlist: true,
      onUserWatchlist: !wasOnWatchlist,
    );
    notifyListeners();

    var onWatchlist = !wasOnWatchlist;
    String? error;
    try {
      if (wasOnWatchlist) {
        await _repo.removeFromWatchlist(tmdbId: tmdbId, mediaType: mediaType);
      } else {
        await _repo.addToWatchlist(tmdbId: tmdbId, mediaType: mediaType);
      }
    } catch (e) {
      onWatchlist = wasOnWatchlist;
      error = e.toString();
    }

    _state = _state.copyWith(
      isTogglingWatchlist: false,
      onUserWatchlist: onWatchlist,
      watchlistError: error,
    );
    notifyListeners();
  }

  bool get canManageRequests => _state.canManageRequests;

  bool get canRequest {
    final user = _state.currentUser;
    if (user == null) return false;
    return user.hasPermission(SeerrPermission.request) ||
        user.hasPermission(SeerrPermission.requestMovie) ||
        user.hasPermission(SeerrPermission.requestTv);
  }

  bool get canRequest4k {
    final user = _state.currentUser;
    if (user == null) return false;
    // Seerr checks the permission per media type, and only exposes 4K when a
    // default 4K backend exists for that type.
    if (_state.isTv) {
      return user.canRequest4kTv && _series4kEnabled;
    }
    return user.canRequest4kMovies && _movie4kEnabled;
  }

  bool get canRequestAdvanced {
    final user = _state.currentUser;
    if (user == null) return false;
    return user.hasAdvancedRequestPermission;
  }

  bool get canReportIssue {
    final user = _state.currentUser;
    if (user == null || !user.canCreateIssues) return false;
    // Issues need the seerr media id, so the media has to exist on the server.
    if (_state.mediaInfo?.id == null) return false;
    return _state.isAvailableAnyQuality;
  }

  String? get savedProfileId {
    if (_state.isTv) return _prefs.hdTvProfileId;
    return _prefs.hdMovieProfileId;
  }

  String? get savedRootFolderId {
    if (_state.isTv) return _prefs.hdTvRootFolderId;
    return _prefs.hdMovieRootFolderId;
  }

  String? get savedServerId {
    if (_state.isTv) return _prefs.hdTvServerId;
    return _prefs.hdMovieServerId;
  }

  String? get saved4kProfileId {
    if (_state.isTv) return _prefs.fourKTvProfileId;
    return _prefs.fourKMovieProfileId;
  }

  String? get saved4kRootFolderId {
    if (_state.isTv) return _prefs.fourKTvRootFolderId;
    return _prefs.fourKMovieRootFolderId;
  }

  String? get saved4kServerId {
    if (_state.isTv) return _prefs.fourKTvServerId;
    return _prefs.fourKMovieServerId;
  }

  Future<SeerrTvDetails?> _trySearchFallbackTv(int tmdbId, String? title) async {
    try {
      SeerrDiscoverPage? searchPage;
      if (title != null && title.isNotEmpty) {
        searchPage = await _repo.search(title);
      }
      if (searchPage == null || searchPage.results.isEmpty) {
        searchPage = await _repo.search(tmdbId.toString());
      }
      if (searchPage.results.isNotEmpty) {
        final match = searchPage.results.firstWhere(
          (item) => item.id == tmdbId,
          orElse: () => searchPage!.results.first,
        );
        return SeerrTvDetails(
          id: match.id,
          mediaType: match.mediaType ?? 'tv',
          name: match.name ?? match.title,
          title: match.title ?? match.name,
          posterPath: match.posterPath,
          backdropPath: match.backdropPath,
          overview: match.overview,
          voteAverage: match.voteAverage,
          voteCount: match.voteCount,
          mediaInfo: match.mediaInfo,
        );
      }
    } catch (e) {
      debugPrint('[SeerrDetail] TV search fallback error: $e');
    }
    return null;
  }

  Future<SeerrMovieDetails?> _trySearchFallbackMovie(int tmdbId, String? title) async {
    try {
      SeerrDiscoverPage? searchPage;
      if (title != null && title.isNotEmpty) {
        searchPage = await _repo.search(title);
      }
      if (searchPage == null || searchPage.results.isEmpty) {
        searchPage = await _repo.search(tmdbId.toString());
      }
      if (searchPage.results.isNotEmpty) {
        final match = searchPage.results.firstWhere(
          (item) => item.id == tmdbId,
          orElse: () => searchPage!.results.first,
        );
        return SeerrMovieDetails(
          id: match.id,
          mediaType: match.mediaType ?? 'movie',
          title: match.title ?? match.name ?? '',
          posterPath: match.posterPath,
          backdropPath: match.backdropPath,
          overview: match.overview,
          voteAverage: match.voteAverage,
          voteCount: match.voteCount,
          mediaInfo: match.mediaInfo,
        );
      }
    } catch (e) {
      debugPrint('[SeerrDetail] Movie search fallback error: $e');
    }
    return null;
  }
}
