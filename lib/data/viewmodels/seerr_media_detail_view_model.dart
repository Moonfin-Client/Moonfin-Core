import 'package:flutter/foundation.dart';

import '../../preference/seerr_preferences.dart';
import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';

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
  final String? requestSuccess;
  final bool isTogglingWatchlist;
  final bool onUserWatchlist;

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
    this.requestSuccess,
    this.isTogglingWatchlist = false,
    this.onUserWatchlist = false,
  });

  bool get isMovie => movie != null;
  bool get isTv => tv != null;

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
      if (r.status == SeerrRequest.statusDeclined) continue;
      if (r.seasons != null) {
        for (final s in r.seasons!) {
          seasons.add(s.seasonNumber);
        }
      }
    }
    return seasons;
  }

  String get requestStatusText {
    if (isFullyAvailable) return 'Available';
    if (isPartiallyAvailable) return 'Partially Available';
    if (isProcessing) return 'Requested';
    if (isPending) return 'Pending';
    if (isBlacklisted) return 'Blocklisted';
    if (isDeleted) return 'Deleted';
    if (hasExistingRequest) return 'Requested';
    return 'Not Requested';
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
    String? requestSuccess,
    bool? isTogglingWatchlist,
    bool? onUserWatchlist,
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
        requestSuccess: requestSuccess,
        isTogglingWatchlist: isTogglingWatchlist ?? this.isTogglingWatchlist,
        onUserWatchlist: onUserWatchlist ?? this.onUserWatchlist,
      );
}

class SeerrMediaDetailViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final SeerrPreferences _prefs;

  SeerrMediaDetailState _state = const SeerrMediaDetailState();
  SeerrMediaDetailState get state => _state;

  SeerrMediaDetailViewModel(this._repo, this._prefs);

  void clearFeedback() {
    _state = _state.copyWith(requestSuccess: null, requestError: null);
  }

  Future<void> load(int tmdbId, String mediaType) async {
    _state = const SeerrMediaDetailState(isLoading: true);
    notifyListeners();

    try {
      await _repo.ensureInitialized();

      SeerrUser? user;
      try {
        user = await _repo.getCurrentUser();
      } catch (_) {}

      if (mediaType == 'tv') {
        final (details, onWatchlist) = await _repo.getTvDetailsWithWatchlist(tmdbId);
        _state = SeerrMediaDetailState(
          tv: details,
          currentUser: user,
          onUserWatchlist: onWatchlist,
        );
        notifyListeners();
        _loadRelated(tmdbId, 'tv');
      } else {
        final (details, onWatchlist) = await _repo.getMovieDetailsWithWatchlist(tmdbId);
        _state = SeerrMediaDetailState(
          movie: details,
          currentUser: user,
          onUserWatchlist: onWatchlist,
        );
        notifyListeners();
        _loadRelated(tmdbId, 'movie');
      }
    } catch (e) {
      _state = SeerrMediaDetailState(error: e.toString());
    }
    notifyListeners();
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
      _state = _state.copyWith(
        isRequesting: false,
        requestError: e.toString(),
      );
    }
    notifyListeners();
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

    try {
      if (wasOnWatchlist) {
        await _repo.removeFromWatchlist(tmdbId: tmdbId, mediaType: mediaType);
      } else {
        await _repo.addToWatchlist(tmdbId: tmdbId, mediaType: mediaType);
      }
    } catch (e) {
      _state = _state.copyWith(onUserWatchlist: wasOnWatchlist);
      debugPrint('[SeerrDetail] Failed to toggle watchlist: $e');
    } finally {
      _state = _state.copyWith(isTogglingWatchlist: false);
      notifyListeners();
    }
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
}
