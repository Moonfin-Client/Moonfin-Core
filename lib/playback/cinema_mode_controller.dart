import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:moonfin/data/services/seerr/seerr_seasons.dart';
import 'package:server_core/server_core.dart';

import '../data/repositories/seerr_repository.dart';
import '../data/services/cinema_media_resolver.dart';
import '../data/services/seerr/seerr_api_models.dart';
import '../data/viewmodels/seerr_media_detail_view_model.dart';

enum CinemaAction { skip, request }

enum CinemaSeerrState {
  hidden,
  request,
  requested,
  pending,
  processing,
  partiallyAvailable,
  available,
}

/// Both Flutter and Apple TV use this callback to submit the seasons the user selected.
typedef CinemaTvSubmit = Future<SeerrTvDetails?> Function(
  Map<String, dynamic> selection,
  SeerrQuotaDetail? quota,
  bool Function() isAllowed,
);

/// Converts the status of one Seerr quality into a Cinema Mode button state.
CinemaSeerrState cinemaSeerrState({
  int? mediaStatus,
  bool acknowledged = false,
}) => switch (mediaStatus) {
  SeerrMediaStatus.blocklisted => CinemaSeerrState.hidden,
  SeerrMediaStatus.pending => CinemaSeerrState.pending,
  SeerrMediaStatus.processing => CinemaSeerrState.processing,
  SeerrMediaStatus.partiallyAvailable => CinemaSeerrState.partiallyAvailable,
  SeerrMediaStatus.available => CinemaSeerrState.available,
  _ when acknowledged => CinemaSeerrState.requested,
  null || SeerrMediaStatus.unknown || SeerrMediaStatus.deleted =>
    CinemaSeerrState.request,
  _ => CinemaSeerrState.hidden,
};

/// Validate the selected seasons and quota without expanding "All Seasons" into a list.
({bool allSeasons, List<int>? seasons})? cinemaTvRequestSelection(
  Map<String, dynamic> raw,
  Set<int> requestableSeasons,
  SeerrQuotaDetail? quota,
) {
  final allSeasons = raw['allSeasons'];
  final nativeSeasons = raw['seasons'];
  if (allSeasons is! bool ||
      nativeSeasons is! List ||
      nativeSeasons.any((value) => value is! int)) {
    return null;
  }
  final selected = nativeSeasons.cast<int>().toSet();
  if (requestableSeasons.isEmpty ||
      (allSeasons && selected.isNotEmpty) ||
      (!allSeasons && selected.isEmpty) ||
      !requestableSeasons.containsAll(selected) ||
      seerrQuotaBlocked(
        quota,
        seerrTvQuotaNeeded(
          allSeasons: allSeasons,
          requestableSeasons: requestableSeasons,
          selectedSeasons: selected,
        ),
      )) {
    return null;
  }
  return (
    allSeasons: allSeasons,
    seasons: allSeasons ? null : (selected.toList()..sort()),
  );
}

Set<int> cinemaRequestableSeasons(
  SeerrTvDetails details, {
  bool is4k = false,
}) => seerrSeasonNumbersOf(details.seasons, details.numberOfSeasons ?? 0)
      .toSet()
      .difference(seerrUnavailableOrRequestedSeasons(
        details.mediaInfo,
        is4k: is4k,
      ));

bool cinemaSeriesIsContinuing(SeerrTvDetails details) {
  final status = (details.status ?? '').toLowerCase();
  return status.isNotEmpty && status != 'ended' && status != 'canceled';
}

CinemaSeerrState cinemaTvSeerrState(
  SeerrTvDetails details, {
  bool is4k = false,
  Set<int> excludedSeasons = const {},
}) {
  final quality = SeerrQualityStatus.of(
    is4k: is4k,
    mediaInfo: details.mediaInfo,
    canManageRequests: false,
    currentUserId: null,
  );
  final status = quality.status == 0 ? null : quality.status;
  if (status != null && !{1, 2, 3, 4, 5, 7}.contains(status)) {
    return CinemaSeerrState.hidden;
  }
  // A show marked available may still have a new season. Show Request only when another season
  // can be requested.
  if ((status != SeerrMediaStatus.available ||
          cinemaSeriesIsContinuing(details)) &&
      cinemaRequestableSeasons(details, is4k: is4k)
          .difference(excludedSeasons)
          .isNotEmpty) {
    return CinemaSeerrState.request;
  }
  final acknowledged = quality.activeRequests.any((r) => r.type == 'tv');
  // Seerr may still say "partially available" after accepting the selected seasons.
  if (status == SeerrMediaStatus.partiallyAvailable &&
      (acknowledged || excludedSeasons.isNotEmpty)) {
    return CinemaSeerrState.requested;
  }
  final state = cinemaSeerrState(
    mediaStatus: status,
    acknowledged: acknowledged,
  );
  if (state != CinemaSeerrState.request) return state;
  return excludedSeasons.isNotEmpty
      ? CinemaSeerrState.requested
      : CinemaSeerrState.hidden;
}

/// Submit a valid TV request once. If it times out, check those specific seasons before
/// deciding whether it succeeded.
Future<({Set<int> seasons, SeerrTvDetails? confirmed})?> submitCinemaTvRequest({
  required SeerrRepository repository,
  required SeerrTvDetails details,
  required Map<String, dynamic> selection,
  required SeerrQuotaDetail? quota,
  required bool Function() isAllowed,
  Set<int> excludedSeasons = const {},
  Set<int> excluded4kSeasons = const {},
  bool allowStandard = true,
  bool allow4k = false,
}) async {
  if (!isAllowed()) return null;
  if (selection['is4k'] != null && selection['is4k'] is! bool) return null;
  final is4k = selection['is4k'] == true;
  if (is4k ? !allow4k : !allowStandard) return null;
  final excluded = is4k ? excluded4kSeasons : excludedSeasons;
  final requestable = cinemaRequestableSeasons(details, is4k: is4k)
      .difference(excluded);
  final choice = cinemaTvRequestSelection(selection, requestable, quota);
  // Reject invalid or outdated choices, especially "All Seasons" while an earlier request may
  // still be processing.
  if (choice == null || (choice.allSeasons && excluded.isNotEmpty)) {
    return null;
  }
  final expected = choice.allSeasons ? requestable : choice.seasons!.toSet();
  try {
    await repository.createRequest(
      mediaId: details.id,
      mediaType: 'tv',
      seasons: choice.seasons,
      allSeasons: choice.allSeasons,
      is4k: is4k,
    ).timeout(const Duration(seconds: 20));
  } on TimeoutException {
    // A timeout does not mean Seerr rejected the request. Check the result instead of sending
    // it twice.
    if (!isAllowed()) return null;
    try {
      final refreshed = await repository.getTvDetails(details.id)
          .timeout(const Duration(seconds: 10));
      if (!isAllowed()) return null;
      if (refreshed.id == details.id &&
          seerrUnavailableOrRequestedSeasons(
            refreshed.mediaInfo,
            is4k: is4k,
          ).containsAll(expected)) {
        return (seasons: expected, confirmed: refreshed);
      }
    } catch (_) {
      // If the status check also fails, leave the result uncertain and do not resend the
      // request.
    }
    if (!isAllowed()) return null;
    rethrow;
  } catch (_) {
    if (!isAllowed()) return null;
    rethrow;
  }
  return (seasons: expected, confirmed: null);
}

typedef CinemaTvQualityOptions = ({
  bool standard,
  bool fourK,
  Set<int> excludedStandard,
  Set<int> excluded4k,
});

/// Submits the chosen movie quality while its picker session is still valid.
typedef CinemaMovieSubmit = Future<void> Function(
  bool is4k,
  bool Function() isAllowed,
);

/// Controls Skip and Request during trailers without letting Seerr lookups delay playback.
class CinemaModeController extends ChangeNotifier {
  CinemaModeController({
    required this._seerr,
    required this._accountKey,
    required this._onSkip,
    this.onRequestSeries,
    this.onRequestMovie,
  });

  final Future<SeerrRepository> Function() _seerr;
  SeerrRepository? _requestRepository;
  final Object Function() _accountKey;
  final Future<void> Function() _onSkip;

  /// Returns refreshed TV show details if a timed-out request was confirmed.
  final Future<SeerrTvDetails?> Function(
    SeerrRepository repository,
    SeerrTvDetails details,
    SeerrUser user,
    CinemaTvQualityOptions options,
    bool Function() isCurrent,
    CinemaTvSubmit submit,
  )?
  onRequestSeries;
  final Future<void> Function(
    SeerrRepository repository,
    SeerrMovieDetails details,
    SeerrUser user,
    bool Function() isCurrent,
    CinemaMovieSubmit submit,
  )? onRequestMovie;

  SeerrTvDetails? _tvDetails;
  SeerrMovieDetails? _movieDetails;
  SeerrUser? _user;
  bool _fourKEnabled = true;
  bool _requestFailed = false;
  final Set<bool> _submittedMovieQualities = {};
  final Map<bool, Set<int>> _submittedTvSeasons = {
    false: <int>{},
    true: <int>{},
  };
  int _generation = 0;
  Object? _account;
  bool _active = false;
  bool _wanted = false;
  bool _playing = false;
  bool _skipping = false;
  bool _sending = false;
  Duration? _metadataDuration;
  Duration? _playerDuration;
  int _minimumSeconds = 15;
  int _autoHideSeconds = 15;
  Timer? _hideTimer;
  DateTime? _lastSkip;

  CinemaMedia? media;
  bool get isSeries => media?.type == CinemaMediaType.tv;
  bool get only4kRequestable => !_requestableStandard && _requestable4k;

  bool get _allowStandard =>
      _user?.hasPermission(SeerrPermission.request) == true ||
      (_user?.hasPermission(
            isSeries ? SeerrPermission.requestTv : SeerrPermission.requestMovie,
          ) ??
          false);

  bool get _allow4k =>
      _fourKEnabled &&
      (isSeries ? _user?.canRequest4kTv : _user?.canRequest4kMovies) == true;

  bool get _requestableStandard => _canRequestQuality(false);
  bool get _requestable4k => _canRequestQuality(true);

  bool get isTvRequestMore {
    final is4k = only4kRequestable;
    final quality = _quality(is4k);
    return _submittedTvSeasons[is4k]!.isNotEmpty ||
        quality.isAvailable ||
        quality.activeRequests.any((r) => r.type == 'tv');
  }
  CinemaSeerrState get seerrState {
    if (_requestFailed) return CinemaSeerrState.hidden;
    if (_requestableStandard || _requestable4k) return CinemaSeerrState.request;
    if (_submittedTvSeasons.values.any((seasons) => seasons.isNotEmpty)) {
      return CinemaSeerrState.requested;
    }
    final states = [
      if (_allowStandard) _qualityState(false),
      if (_allow4k) _qualityState(true),
    ];
    for (final status in const [
      CinemaSeerrState.available,
      CinemaSeerrState.partiallyAvailable,
      CinemaSeerrState.processing,
      CinemaSeerrState.pending,
      CinemaSeerrState.requested,
    ]) {
      if (states.contains(status)) return status;
    }
    return CinemaSeerrState.hidden;
  }
  CinemaAction focusedAction = CinemaAction.skip;
  Duration get duration =>
      _playerDuration ?? _metadataDuration ?? Duration.zero;
  bool get eligible =>
      _active &&
      (_minimumSeconds == 0 || duration >= Duration(seconds: _minimumSeconds));
  bool get visible =>
      eligible && _wanted && !_skipping && _account == _accountKey();
  bool get canRequest =>
      visible && seerrState == CinemaSeerrState.request && !_sending;
  int get generation => _generation;

  void enter({
    required Map<String, dynamic>? item,
    required Future<CinemaMedia?> Function() resolveMedia,
  }) {
    final ticket = ++_generation;
    _hideTimer?.cancel();
    _hideTimer = null;
    _active = item != null;
    _account = _active ? _accountKey() : null;
    _wanted = _active;
    _playing = _skipping = _sending = false;
    _metadataDuration = _playerDuration = null;
    media = item == null ? null : CinemaMediaResolver.directMedia(item);
    _tvDetails = null;
    _movieDetails = null;
    _user = null;
    _fourKEnabled = true;
    _requestFailed = false;
    _submittedMovieQualities.clear();
    for (final seasons in _submittedTvSeasons.values) {
      seasons.clear();
    }
    _requestRepository = null;
    focusedAction = CinemaAction.skip;
    final ticks = int.tryParse(item?['RunTimeTicks']?.toString() ?? '');
    if (ticks != null && ticks > 0) {
      _metadataDuration = Duration(microseconds: ticks ~/ 10);
    }
    notifyListeners();
    if (_active) unawaited(_load(ticket, resolveMedia));
  }

  bool _current(int ticket) =>
      ticket == _generation &&
      _active &&
      _account == _accountKey();

  Future<void> _load(
    int ticket,
    Future<CinemaMedia?> Function() resolveMedia,
  ) async {
    try {
      final resolved = media ?? await resolveMedia();
      if (!_current(ticket) || resolved == null || resolved.tmdbId <= 0) return;
      final id = resolved.tmdbId;
      media = resolved;
      notifyListeners();
      final repository = await _seerr().timeout(const Duration(seconds: 10));
      if (!_current(ticket)) return;
      await repository.ensureInitialized().timeout(const Duration(seconds: 10));
      if (!_current(ticket) || !repository.isAvailable) return;
      final user = await repository.getCurrentUser().timeout(
        const Duration(seconds: 10),
      );
      if (!_current(ticket)) return;
      _user = user;
      if (!_allowStandard && !_allow4k) return;
      if (isSeries && onRequestSeries == null) return;

      // Request status should not wait for optional 4K settings.
      if (_allow4k) unawaited(_load4kSettings(repository, ticket));
      if (await _refreshStatus(repository, ticket, id)) {
        _requestRepository = repository;
        notifyListeners();
      }
    } catch (_) {
      // If Seerr cannot identify the trailer or load its status, playback and Skip still work.
    }
  }

  Future<void> _load4kSettings(SeerrRepository repository, int ticket) async {
    try {
      final settings = await repository
          .getPublicSettings()
          .timeout(const Duration(seconds: 5));
      if (!_current(ticket)) return;
      _fourKEnabled = seerrPublicFlag(
        settings,
        isSeries ? 'series4kEnabled' : 'movie4kEnabled',
        fallback: true,
      );
      if (focusedAction == CinemaAction.request && !canRequest) {
        focusedAction = CinemaAction.skip;
      }
      notifyListeners();
    } catch (_) {
      // Older Seerr servers may not expose these settings.
    }
  }

  /// Refresh the request status, reusing TV details already fetched by the picker when
  /// possible.
  Future<bool> _refreshStatus(
    SeerrRepository repository,
    int ticket,
    int id, {
    SeerrTvDetails? confirmedTv,
  }) async {
    if (isSeries) {
      final tv =
          confirmedTv ??
          await repository
              .getTvDetails(id)
              .timeout(const Duration(seconds: 10));
      if (!_current(ticket) || tv.id != id) return false;
      _tvDetails = tv;
    } else {
      final movie = await repository
          .getMovieDetails(id)
          .timeout(const Duration(seconds: 10));
      if (!_current(ticket) || movie.id != id) return false;
      _movieDetails = movie;
    }
    return true;
  }

  SeerrQualityStatus _quality(bool is4k) => SeerrQualityStatus.of(
    is4k: is4k,
    mediaInfo: _tvDetails?.mediaInfo ?? _movieDetails?.mediaInfo,
    canManageRequests: false,
    currentUserId: _user?.id,
  );

  CinemaSeerrState _qualityState(bool is4k) {
    final tv = _tvDetails;
    if (tv != null) {
      return cinemaTvSeerrState(
        tv,
        is4k: is4k,
        excludedSeasons: _submittedTvSeasons[is4k]!,
      );
    }
    final quality = _quality(is4k);
    return cinemaSeerrState(
      mediaStatus: quality.status == 0 ? null : quality.status,
      acknowledged: _submittedMovieQualities.contains(is4k) ||
          quality.activeRequests.any((request) => request.type == 'movie'),
    );
  }

  bool _canRequestQuality(bool is4k) {
    final info = _tvDetails?.mediaInfo ?? _movieDetails?.mediaInfo;
    return (is4k ? _allow4k : _allowStandard) &&
        (_tvDetails != null || _movieDetails != null) &&
        info?.status != SeerrMediaStatus.blocklisted &&
        info?.status4k != SeerrMediaStatus.blocklisted &&
        _qualityState(is4k) == CinemaSeerrState.request;
  }

  void configure({required int minimumSeconds, required int autoHideSeconds}) {
    final minimum = minimumSeconds.clamp(0, 60);
    if (_minimumSeconds == minimum && _autoHideSeconds == autoHideSeconds) {
      return;
    }
    _minimumSeconds = minimum;
    _autoHideSeconds = autoHideSeconds;
    _restartTimer();
    notifyListeners();
  }

  /// Call this only after confirming the playback update belongs to the current trailer.
  void updatePlayback({required Duration duration, required bool playing}) {
    final wasVisible = visible;
    final wasPlaying = _playing;
    final oldDuration = this.duration;
    if (duration > Duration.zero) _playerDuration = duration;
    _playing = playing;
    if (wasVisible != visible || wasPlaying != playing) _restartTimer();
    if (oldDuration != this.duration || wasVisible != visible) {
      notifyListeners();
    }
  }

  void reveal() {
    if (!eligible || _skipping || _account != _accountKey()) return;
    if (visible) {
      _restartTimer();
      return;
    }
    _wanted = true;
    focusedAction = CinemaAction.skip;
    _restartTimer();
    notifyListeners();
  }

  void hide() {
    _wanted = false;
    _hideTimer?.cancel();
    _hideTimer = null;
    focusedAction = CinemaAction.skip;
    notifyListeners();
  }

  void moveLeft() =>
      _moveFocus(canRequest ? CinemaAction.request : CinemaAction.skip);

  void moveRight() => _moveFocus(CinemaAction.skip);

  void _moveFocus(CinemaAction action) {
    if (!visible) return;
    focusedAction = action;
    _restartTimer();
    notifyListeners();
  }

  void activate() {
    if (!visible) {
      reveal();
      return;
    }
    if (focusedAction == CinemaAction.request && canRequest) {
      unawaited(request());
    } else {
      skip();
    }
  }

  void skip() {
    // Also used by the dedicated fast-forward key, which may skip a short intro.
    if (!_active || _skipping || _account != _accountKey()) return;
    final now = DateTime.now();
    if (_lastSkip != null &&
        now.difference(_lastSkip!) < const Duration(milliseconds: 400)) {
      return;
    }
    _lastSkip = now;
    _skipping = true;
    _hideTimer?.cancel();
    _hideTimer = null;
    final ticket = _generation;
    notifyListeners();
    unawaited(
      _onSkip().catchError((Object _) {}).whenComplete(() {
        // The player may ignore Skip while a transition is still running.
        // Only restore controls if the same trailer is still active.
        if (!_current(ticket)) return;
        _skipping = false;
        _restartTimer();
        notifyListeners();
      }),
    );
  }

  void _setSending(bool sending) {
    _sending = sending;
    if (sending) focusedAction = CinemaAction.skip;
    _restartTimer();
    notifyListeners();
  }

  Future<void> request() async {
    final repository = _requestRepository;
    if (!canRequest || media == null || repository == null) return;
    final ticket = _generation;
    final id = media!.tmdbId;
    if (isSeries) {
      await _requestSeries(repository, ticket, id);
      return;
    }
    _setSending(true);
    try {
      bool isCurrent() => _current(ticket) && !_skipping;
      final requestable = {
        if (_requestableStandard) false,
        if (_requestable4k) true,
      };
      Future<void> submit(bool is4k, bool Function() isAllowed) async {
        if (!isAllowed() || !requestable.remove(is4k)) return;
        // The picker may stay open after its trailer ends. Only update that trailer's controls while it's still active.
        if (_current(ticket)) {
          if (!_canRequestQuality(is4k)) return;
          _submittedMovieQualities.add(is4k);
        }
        try {
          await repository
              .createRequest(mediaId: id, mediaType: 'movie', is4k: is4k)
              .timeout(const Duration(seconds: 20));
        } catch (_) {
          if (!_current(ticket)) return;
          // A failed response does not mean Seerr rejected the request.
          try {
            await _refreshStatus(repository, ticket, id);
          } catch (_) {}
          if (!_current(ticket)) return;
          final quality = _quality(is4k);
          final recovered = cinemaSeerrState(
            mediaStatus: quality.status == 0 ? null : quality.status,
            acknowledged: quality.activeRequests.any(
              (request) => request.type == 'movie',
            ),
          );
          _requestFailed = !_requestableStandard && !_requestable4k &&
              (recovered == CinemaSeerrState.request ||
                  recovered == CinemaSeerrState.hidden);
        }
      }

      if (requestable.length == 2) {
        final details = _movieDetails;
        final user = _user;
        if (details != null && user != null && onRequestMovie != null) {
          await onRequestMovie!(repository, details, user, isCurrent, submit);
        }
      } else {
        await submit(requestable.single, isCurrent);
      }
    } catch (_) {
      // Seerr or the optional picker must never interrupt playback.
    } finally {
      if (_current(ticket)) _setSending(false);
    }
  }

  Future<void> _requestSeries(
    SeerrRepository repository,
    int ticket,
    int id,
  ) async {
    final details = _tvDetails;
    final user = _user;
    if (details == null || user == null || onRequestSeries == null) return;
    var acknowledged = false;
    _setSending(true);
    try {
      final options = (
        standard: _requestableStandard,
        fourK: _requestable4k,
        excludedStandard: Set<int>.of(_submittedTvSeasons[false]!),
        excluded4k: Set<int>.of(_submittedTvSeasons[true]!),
      );
      final confirmed = await onRequestSeries!(
        repository,
        details,
        user,
        options,
        () => _current(ticket) && !_skipping,
        (selection, quota, isAllowed) async {
          // Recheck this trailer's selected quality if it is still playing.
          final is4k = selection['is4k'] == true;
          if (_current(ticket) && !_canRequestQuality(is4k)) return null;
          final result = await submitCinemaTvRequest(
            repository: repository,
            details: details,
            selection: selection,
            quota: quota,
            isAllowed: isAllowed,
            excludedSeasons: options.excludedStandard,
            excluded4kSeasons: options.excluded4k,
            allowStandard: options.standard,
            allow4k: options.fourK,
          );
          if (_current(ticket) && isAllowed() && result != null) {
            _submittedTvSeasons[is4k]!
                .addAll(result.seasons);
            acknowledged = true;
          }
          return result?.confirmed;
        },
      );
      // A cancelled picker does not change availability.
      if (!_current(ticket) || !acknowledged) return;
      try {
        await _refreshStatus(repository, ticket, id, confirmedTv: confirmed);
      } catch (_) {}
    } catch (_) {
      if (!_current(ticket)) return;
      _requestFailed = true;
    } finally {
      if (_current(ticket)) _setSending(false);
    }
  }

  void _restartTimer() {
    _hideTimer?.cancel();
    _hideTimer = null;
    if (!visible || !_playing || _sending || _autoHideSeconds <= 0) return;
    _hideTimer = Timer(Duration(seconds: _autoHideSeconds), hide);
  }

  @override
  void dispose() {
    ++_generation;
    _hideTimer?.cancel();
    super.dispose();
  }
}
