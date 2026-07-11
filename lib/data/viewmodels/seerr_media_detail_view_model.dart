import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../preference/seerr_preferences.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_download_progress.dart';
import '../services/seerr/seerr_error.dart';

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

  int get mediaStatus => mediaInfo?.status ?? 0;
  bool get isFullyAvailable => mediaStatus == 5;
  bool get isPartiallyAvailable => mediaStatus == 4;
  bool get isProcessing => mediaStatus == 3;
  bool get isPending => mediaStatus == 2;
  bool get isBlacklisted => mediaStatus == 6;
  bool get isDeleted => mediaStatus == 7;

  SeerrDownloadSummary? get hdDownload => SeerrDownloadSummary.forMedia(
        status: mediaInfo?.status,
        items: mediaInfo?.downloadStatus,
      );
  SeerrDownloadSummary? get download4k => SeerrDownloadSummary.forMedia(
        status: mediaInfo?.status4k,
        items: mediaInfo?.downloadStatus4k,
      );

  List<SeerrRequest> get pendingRequests {
    final requests = mediaInfo?.requests;
    if (requests == null) return [];
    return requests
        .where((r) => r.status == SeerrRequest.statusPending)
        .toList();
  }

  List<SeerrRequest> get activeRequests {
    final requests = mediaInfo?.requests;
    if (requests == null) return [];
    return requests
        .where((r) =>
            r.status == SeerrRequest.statusPending ||
            r.status == SeerrRequest.statusApproved)
        .toList();
  }

  bool get hasExistingRequest {
    final requests = mediaInfo?.requests;
    if (requests == null || requests.isEmpty) return false;
    return requests.any((r) =>
        r.status == SeerrRequest.statusPending ||
        r.status == SeerrRequest.statusApproved);
  }

  Set<int> get requestedSeasons {
    final requests = mediaInfo?.requests;
    if (requests == null) return {};
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
      );
}

class SeerrMediaDetailViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final SeerrPreferences _prefs;

  SeerrMediaDetailState _state = const SeerrMediaDetailState();
  SeerrMediaDetailState get state => _state;

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
    _state = _state.copyWith(requestSuccess: null, requestError: null);
  }

  Future<void> load(String itemId, String mediaType, {String? title}) async {
    _state = const SeerrMediaDetailState(isLoading: true);
    notifyListeners();

    try {
      await _repo.ensureInitialized();

      SeerrUser? user;
      try {
        user = await _repo.getCurrentUser();
      } catch (_) {}

      int tmdbId;
      String resolvedMediaType = mediaType;

      if (itemId.startsWith('tt')) {
        SeerrDiscoverPage? searchPage;
        if (title != null && title.isNotEmpty) {
          try {
            searchPage = await _repo.search(title);
          } catch (e) {
            debugPrint('[SeerrDetail] Search by title failed: $e');
          }
        }
        if (searchPage == null || searchPage.results.isEmpty) {
          try {
            searchPage = await _repo.search(itemId);
          } catch (e) {
            debugPrint('[SeerrDetail] Search by IMDb ID failed: $e');
          }
        }
        if (searchPage == null || searchPage.results.isEmpty) {
          throw Exception('Media not found on Seerr');
        }
        final firstResult = searchPage.results.first;
        tmdbId = firstResult.id;
        resolvedMediaType = firstResult.mediaType ?? mediaType;
      } else {
        final parsed = int.tryParse(itemId);
        if (parsed == null) {
          throw Exception('Invalid media ID');
        }
        tmdbId = parsed;
      }

      if (resolvedMediaType == 'tv') {
        try {
          final details = await _repo.getTvDetails(tmdbId);
          _state = SeerrMediaDetailState(tv: details, currentUser: user);
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
          final details = await _repo.getMovieDetails(tmdbId);
          _state = SeerrMediaDetailState(movie: details, currentUser: user);
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
    } on SeerrRequestException catch (e) {
      _state = _state.copyWith(
        isRequesting: false,
        requestError: e.serverMessage ?? e.kind.name,
        requestErrorKind: e.kind,
      );
    } catch (e) {
      _state = _state.copyWith(
        isRequesting: false,
        requestError: e.toString(),
      );
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
      _state = _state.copyWith(
        isRequesting: false,
        requestError: e.toString(),
      );
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
      _state = _state.copyWith(isRequesting: false, requestError: e.toString());
    }

    notifyListeners();
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

  bool get canManageRequests {
    final user = _state.currentUser;
    if (user == null) return false;
    return user.hasPermission(SeerrPermission.manageRequests);
  }

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
    return user.canRequest4k;
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
    return _state.isFullyAvailable || _state.isPartiallyAvailable;
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
