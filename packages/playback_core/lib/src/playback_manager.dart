import 'dart:async';

import 'chapter_steps.dart';
import 'media_stream_resolver.dart';
import 'playback_arbiter.dart';
import 'player_backend.dart';
import 'player_service.dart';
import 'player_state.dart';
import 'queue_service.dart';
import 'stream_resolution_result.dart';
import 'track_ordinal_mapper.dart';

class _ProgressGeneration {
  _ProgressGeneration({
    required this.item,
    required this.resolution,
    required this.service,
  });

  final dynamic item;
  final StreamResolutionResult resolution;
  final PlayerService? service;
  bool ended = false;
  Duration stopPosition = Duration.zero;
}

/// How far a confirmed position may sit from the seek target. Streams land
/// on a keyframe, not the exact frame asked for.
const seekConfirmTolerance = Duration(seconds: 10);

/// Reported as the bringup error when a live stream stopped feeding and the
/// bounded recovery gave up on it. A sentinel for a screen to match on, not a
/// message to show: this package has no localizations, and the only consumer
/// today is the diagnostic log.
const liveStreamLostError = 'live-stream-lost';

/// Reported as the bringup error when a stream that is NOT live ran out of
/// media nowhere near the item's end -- a transcode the client outran -- and
/// the bounded recovery could not get it going again.
const streamStarvedError = 'stream-starved';

/// Whether a seek actually landed. The player reports the seek target as its
/// position while the seek is still in flight, and a seek issued early in a
/// file's life can quietly fail and fall back to the start, so a single read
/// proves nothing. The position has to hold near the target across
/// consecutive reads before the seek counts.
Future<bool> confirmSeekHeld(
  Duration target,
  Duration Function() positionOf, {
  Duration probeInterval = const Duration(milliseconds: 150),
}) async {
  const probes = 12;
  const requiredHolds = 3;
  var held = 0;
  for (var i = 0; i < probes; i++) {
    await Future.delayed(probeInterval);
    held = (positionOf() - target).abs() < seekConfirmTolerance ? held + 1 : 0;
    if (held >= requiredHolds) {
      return true;
    }
  }
  return false;
}

/// Removes [vetoedCodecs] from every audio codec list in [profile], so the
/// server neither direct plays nor copies a codec this device has proven it
/// can't decode. An entry whose audio codec list empties is dropped outright,
/// since a missing list reads as no restriction at all.
void stripVetoedAudioCodecs(
  Map<String, dynamic> profile,
  Set<String> vetoedCodecs,
) {
  if (vetoedCodecs.isEmpty) return;
  final lowered = vetoedCodecs.map((c) => c.toLowerCase()).toSet();
  for (final key in const ['DirectPlayProfiles', 'TranscodingProfiles']) {
    final entries = profile[key];
    if (entries is! List) continue;
    entries.removeWhere((entry) {
      if (entry is! Map) return false;
      final codecs = entry['AudioCodec'];
      if (codecs is! String || codecs.isEmpty) return false;
      final kept = codecs
          .split(',')
          .where((c) => !lowered.contains(c.trim().toLowerCase()))
          .toList();
      if (kept.isEmpty) return true;
      entry['AudioCodec'] = kept.join(',');
      return false;
    });
  }
}

class PlaybackManager implements AudioOwnable {
  static const _mediaReadyPollInterval = Duration(milliseconds: 100);
  static const _defaultMediaReadyTimeout = Duration(seconds: 60);
  static const _onlineStartupReadyTimeout = Duration(seconds: 15);

  PlayerBackend? _backend;
  MediaStreamResolver? _resolver;
  PlayerService? _service;
  Future<void> Function(dynamic item)? _resolverConfigurator;
  bool Function(List<dynamic> items)? _externalPlaybackDecider;

  /// Host veto on what may play. [_queueContentFilter] is cheap and free of
  /// side effects, so a whole queue can be strained through it as it's set.
  /// [_playContentRefusal] may go to the network, so it's asked only about the
  /// one item about to open. A host that registers neither keeps the old
  /// behaviour.
  bool Function(dynamic item)? _queueContentFilter;
  Future<bool> Function(dynamic item)? _playContentRefusal;
  Future<List<dynamic>> Function(
    dynamic completedItem,
    List<dynamic> queueItems,
    int completedIndex,
  )?
  _nextSeasonItemsProvider;
  PlayerBackend Function(
    StreamResolutionResult resolution,
    PlayerBackend currentBackend,
  )?
  _backendSelector;
  /// Returns the reason this client refused direct play, or null to let
  /// the resolution stand. A reason is needed because a client-side
  /// refusal leaves the server's transcodingReasons empty, so a report
  /// otherwise shows a transcode nobody admits to asking for.
  String? Function(StreamResolutionResult resolution)? _transcodeSelector;
  String? _clientTranscodeReason;
  Duration Function(dynamic item, Duration startPosition)?
  _startPositionAdjuster;

  /// Chapter starts, and the item they were set for, so previous and next
  /// step through chapters before they step through the queue.
  ///
  /// Keyed to the item rather than cleared when a stream starts, because the
  /// same item restarts for a track switch, a transcode retry or a resume,
  /// and clearing would drop its chapters for the rest of its playback.
  /// Compared by identity, since the queue holds bare paths offline and
  /// asking those for an id throws.
  List<Duration> _chapterStarts = const [];
  Object? _chapterStartsItem;

  Future<PlaybackStartupRecoveryDecision> Function(
    PlaybackStartupFailureContext context,
  )?
  _startupRecoveryDecider;
  void Function(PlaybackDecisionContext context)? _playbackDecisionLogger;
  void Function(String message)? _diagnosticLogger;
  int? Function(List<Map<String, dynamic>> audioStreams, int? explicitIndex)? audioTrackSelector;
  int? Function(List<Map<String, dynamic>> subtitleStreams, List<Map<String, dynamic>> audioStreams, int? explicitIndex)? subtitleTrackSelector;
  final QueueService queueService = QueueService();
  final PlayerState state = PlayerState();
  final Set<PlayerBackend> _retainedBackends = <PlayerBackend>{};
  final List<StreamSubscription> _streamSubs = [];
  Timer? _progressTimer;
  _ProgressGeneration? _progressGeneration;
  StreamResolutionResult? _currentResolution;
  dynamic _lastPlaybackItem;
  StreamResolutionResult? _lastPlaybackResolution;
  bool _reResolvingForTrackMatch = false;
  int? _audioStreamIndex;
  int? _subtitleStreamIndex;
  bool _audioSelectionExplicit = false;
  bool _subtitleSelectionExplicit = false;
  bool _pendingItemAudioSelectionExplicit = false;
  bool _pendingItemSubtitleSelectionExplicit = false;
  String? _mediaSourceId;
  String? _pendingItemOverrideId;
  int? _pendingItemAudioStreamIndex;
  double _volume = 100;
  bool _isMuted = false;
  int? _pendingItemSubtitleStreamIndex;
  String? _pendingItemMediaSourceId;
  String? _lastItemId;
  String? _lastExplicitAudioLanguage;
  int? _lastExplicitAudioIndex;
  String? _lastExplicitAudioTitle;
  String? _lastExplicitSubtitleLanguage;
  bool? _lastExplicitSubtitleEnabled;
  Duration _lastKnownPosition = Duration.zero;
  Duration _itemKnownDuration = Duration.zero;
  int? _maxBitrateOverrideMbps;

  /// Host supplied measurement of the link to the active server, in bits per
  /// second. Consulted when nothing else caps the stream, so Auto means a
  /// measured ceiling rather than no ceiling. Null answers keep the request
  /// uncapped.
  Future<int?> Function()? autoBitrateProvider;
  DateTime? _playbackStartTime;
  bool _waitingForMedia = false;
  SubtitleRendererMode _subtitleRendererMode = SubtitleRendererMode.native;
  bool _isAutoNexting = false;
  bool _isManualNexting = false;
  bool suppressAutoNext = false;
  bool autoAdvanceEnabled = true;
  bool _isOfflinePlayback = false;
  bool _forceTranscodeForQueue = false;
  // What playItems was asked to allow for this queue. A recovery re-resolve
  // defaults enableDirectPlay to true, and without this it would silently
  // switch a viewer who had direct play off back on.
  bool _directPlayAllowedForQueue = true;
  bool _backendSelectionLockedForSession = false;
  PlayerBackend? _sessionLockedBackend;
  Future<void> Function()? _onOfflineStop;
  Future<void> Function(String url)? _onOfflineAutoNext;
  Map<String, Map<String, dynamic>> _offlineMetadataByUrl = {};
  Future<bool>? _stopInFlight;
  int _playbackSessionToken = 0;
  Future<void>? _externalSubsLoaded;
  Duration _deferredStartPosition = Duration.zero;
  bool _deferPlaybackToExternalPlayer = false;
  bool _skipExternalRoutingOnce = false;
  bool _forceExternalPlayerOnce = false;
  bool _forceExternalChooserOnce = false;
  bool _unsupportedAudioRecoveryInFlight = false;
  final Set<String> _vetoedAudioCodecs = <String>{};
  bool _suppressNextGenericBackendError = false;
  bool _teardownForReResolve = false;

  /// Live recovery budget. Attempt 1 resumes in place (re-resolving if the
  /// engine can't), attempt 2 re-resolves, and attempt 3 escalates one step
  /// past the current route: direct play hands the stream to the server,
  /// and a server-served channel forces a transcode. The next failure gives
  /// up. A clean minute since the last attempt restores the budget.
  ///
  /// Gaps are measured from the end of the previous attempt, since a tune can
  /// itself take ~10s: 4s before attempt 1 and the give-up, which outlasts a
  /// Fire Cube decoder's forced release, then 10s and 20s so a restarting
  /// server can come back. A re-resolve that throws schedules the next
  /// attempt instead of giving up, and these re-resolves skip the nested
  /// startup transcode retry so the budget alone paces them.
  static const _liveRecoveryMaxAttempts = 3;
  static const _liveRecoveryDebounce = Duration(seconds: 4);
  static const _liveRecoveryGapAttempt2 = Duration(seconds: 10);
  static const _liveRecoveryGapAttempt3 = Duration(seconds: 20);
  static const _liveRecoveryWindow = Duration(seconds: 60);

  /// The minimum gap since the previous attempt before [attempt] may run.
  /// Attempt 1 and the give-up step (any attempt past the budget) use the
  /// plain debounce; attempts 2 and 3 wait longer so a restarting server has
  /// time to come back.
  Duration _liveRecoveryGapBefore(int attempt) {
    switch (attempt) {
      case 2:
        return _liveRecoveryGapAttempt2;
      case 3:
        return _liveRecoveryGapAttempt3;
      default:
        return _liveRecoveryDebounce;
    }
  }
  int _liveRecoveryAttempts = 0;
  DateTime? _lastLiveRecoveryAt;
  bool _liveRecoveryInFlight = false;
  Timer? _liveRecoveryRetry;

  /// Set only around the re-resolve await inside `_recoverStalledStream`. A
  /// failed bringup state raised in that window is an intermediate failure
  /// the recovery loop may still paper over, not the terminal one listeners
  /// should see -- that only comes from `_giveUpOnStalledStream`, which runs
  /// outside this window.
  bool _suppressFailedBringupDuringRecovery = false;

  /// A live stream can open and keep receiving bytes without ever rendering
  /// a frame -- weak reception trickles data, so the HTTP read never times
  /// out and no backend error ever fires. Neither of `_recoverStalledStream`'s
  /// usual triggers (a backend error, an end-of-stream) helps here, so this
  /// watchdog covers the gap: it watches for a first frame after the stream
  /// opens, and for a frame after any later stall, and treats either miss as
  /// a stalled channel worth recovering.
  ///
  /// A first frame gets longer because a tune can take ~10s. A stall after
  /// playing gets 8s: Media3 won't resume until 5s is re-buffered, which a
  /// live stream only delivers in real time, so anything shorter would fire
  /// on ordinary rebuffers.
  static const _liveFirstFrameTimeout = Duration(seconds: 30);
  static const _liveMidStreamStallTimeout = Duration(seconds: 8);
  Timer? _liveStallWatchdog;

  /// Whether a live session is being watched at all: on when a live stream
  /// opens or resumes, off on any stop, give-up or tune-away. A stopped
  /// player still reports "not playing", and without this that would re-arm
  /// the watchdog and restart a channel the viewer already left.
  bool _liveStallWatchActive = false;

  /// Set by [pause], cleared by [resume], [playItems], [stop] and a fresh
  /// live open. Backends that report no `playWhenReady` (AppleTvBackend,
  /// AetherBackend, the web video backend, MediaKitPlayerBackend) can't tell
  /// a viewer pause from a stall on their own, so the manager tracks the
  /// viewer's own last pause/resume call and falls back to it.
  bool _viewerPaused = false;

  /// Whether a frame has rendered since the current live stream opened.
  /// Reset at each fresh open, set the first time `playing` reports true.
  bool _liveFrameSeenSinceOpen = false;

  /// True only when playback is genuinely advancing: unpaused AND not
  /// buffering. `state.isPlaying` alone means "unpaused", not "advancing" --
  /// the web/MediaKit backends forward media3-style playing/buffering as two
  /// independent streams, so `isPlaying` can stay true through a stall while
  /// `isBuffering` is what actually flips. Everywhere recovery reads
  /// progress must use this, not `state.isPlaying` alone.
  bool get _isActuallyPlaying => state.isPlaying && !state.isBuffering;

  /// Whether the current state looks like a stall worth recovering from,
  /// rather than a pause. On an engine that reports its own intent
  /// (`playWhenReady`), that intent decides. On one that doesn't, a pause
  /// this manager itself issued always wins; short of that, only buffering
  /// or "no frame shown yet" counts -- a quiet "not playing" with frames
  /// already on screen is indistinguishable from a pause made outside the
  /// app (system remote), so it must not be treated as a stall.
  bool _liveStallSuspected() {
    if (_isActuallyPlaying) return false;
    final playWhenReady = state.playWhenReady;
    if (playWhenReady != null) return playWhenReady;
    if (_viewerPaused) return false;
    return state.isBuffering || !_liveFrameSeenSinceOpen;
  }

  /// Bookkeeping shared by the playing and buffering listeners, since either
  /// stream can be the one whose change makes playback actually advance.
  /// Marks the first frame seen, clears the recovery status, and drops any
  /// retry still waiting to fire -- the channel does not need it any more.
  void _onProgressStreamsUpdated() {
    if (!_isActuallyPlaying) return;
    _liveFrameSeenSinceOpen = true;
    _setLiveRecoveryStatus(null);
    if (_liveRecoveryRetry?.isActive ?? false) {
      _diagnosticLogger?.call(
        'Live recovery: playback resumed, dropping a held retry',
      );
      _liveRecoveryRetry!.cancel();
      _liveRecoveryRetry = null;
    }
  }

  /// Arms (or re-arms) the live stall watchdog. A no-op off a live item, so
  /// every call site can invoke it without checking first. Captures the
  /// current viewer-intent generation so a timer that outlives a tune or a
  /// stop fires into nothing.
  void _armLiveStallWatchdog() {
    _liveStallWatchdog?.cancel();
    _liveStallWatchdog = null;
    if (!_liveStallWatchActive || !_currentItemIsLive || _isOfflinePlayback) {
      return;
    }
    final intent = _viewerIntentGeneration;
    final timeout = _liveFrameSeenSinceOpen
        ? _liveMidStreamStallTimeout
        : _liveFirstFrameTimeout;
    _liveStallWatchdog = Timer(timeout, () {
      _liveStallWatchdog = null;
      if (!_liveStallWatchActive || intent != _viewerIntentGeneration) return;
      if (!_liveStallSuspected()) return;
      _diagnosticLogger?.call(
        'Live stall watchdog: no frame for ${timeout.inSeconds}s, '
        'recovering',
      );
      unawaited(_recoverStalledStream(trigger: 'stalled'));
    });
  }

  void _disarmLiveStallWatchdog() {
    _liveStallWatchdog?.cancel();
    _liveStallWatchdog = null;
  }

  /// Starts watching the current live stream, from a fresh 30s window.
  void _startLiveStallWatch() {
    _liveStallWatchActive = true;
    _armLiveStallWatchdog();
  }

  /// Stops watching until the next live stream opens.
  void _endLiveStallWatch() {
    _liveStallWatchActive = false;
    _disarmLiveStallWatchdog();
  }

  /// Re-evaluates the watchdog after a playing or buffering change. A real
  /// frame or a viewer pause disarms it; buffering, or "not playing" with an
  /// unfulfilled intent to play, arms it if it isn't already running -- a
  /// buffering flicker must not keep resetting the first-frame window.
  void _evaluateLiveStallWatchdog() {
    if (!_liveStallWatchActive) return;
    if (!_currentItemIsLive || _isOfflinePlayback) return;
    if (!_liveStallSuspected()) {
      _disarmLiveStallWatchdog();
      return;
    }
    if (_liveStallWatchdog?.isActive ?? false) return;
    _armLiveStallWatchdog();
  }

  /// Bumped whenever the viewer moves on: a stop, or a new queue. Recovery
  /// carries it across its own awaits so it can tell "the viewer left" from
  /// "we restarted the stream ourselves". The session token cannot do that
  /// job -- recovery's own re-resolve takes a new one -- and reading it as
  /// abandonment made a failed recovery discard its own failure report.
  int _viewerIntentGeneration = 0;

  /// Gives up on recovering the channel the viewer has just left.
  ///
  /// Bumping the generation is what stops an attempt already under way from
  /// escalating, but a held retry is a timer that would otherwise still fire
  /// and start a re-resolve on top of whatever was tuned instead. Both ends
  /// have to be closed, and at the moment the viewer moves rather than later
  /// in the tune, or the timer fires inside that gap.
  void _abandonLiveRecovery(String reason) {
    _viewerIntentGeneration++;
    _endLiveStallWatch();
    if (_liveRecoveryRetry?.isActive ?? false) {
      _diagnosticLogger?.call('Live recovery: dropping a held retry, $reason');
    }
    _resetLiveRecoveryBudget();
  }

  /// Clears the live recovery attempt count, its timestamp, and any held
  /// retry timer.
  void _resetLiveRecoveryBudget() {
    _liveRecoveryAttempts = 0;
    _lastLiveRecoveryAt = null;
    _liveRecoveryRetry?.cancel();
    _liveRecoveryRetry = null;
    _setLiveRecoveryStatus(null);
  }

  /// Clock behind the live recovery budget and playback start time. A seam
  /// so tests can cross the rolling window without waiting a minute.
  DateTime Function() clock = DateTime.now;

  DateTime? _lastTrackSwitchReResolveAt;
  bool _transcodeSwitchRecoveryConsumed = false;
  Future<void>? _reResolveQueue;
  final _backendChangedController = StreamController<PlayerBackend>.broadcast();
  final _bringupStateController =
      StreamController<PlaybackBringupState>.broadcast();
  final _sessionEndedController = StreamController<void>.broadcast();
  final _liveRecoveryStatusController =
      StreamController<LiveRecoveryStatus?>.broadcast();
  PlaybackBringupState _bringupState = const PlaybackBringupState.idle();
  LiveRecoveryStatus? _liveRecoveryStatus;

  /// Updates the live recovery progress, emitting only when it actually
  /// changes so a held retry that keeps re-announcing the same attempt does
  /// not spam the stream.
  void _setLiveRecoveryStatus(LiveRecoveryStatus? status) {
    if (_liveRecoveryStatus == status) return;
    _liveRecoveryStatus = status;
    _liveRecoveryStatusController.add(status);
  }

  PlayerBackend? get backend => _backend;

  double get volume => _volume;
  bool get isMuted => _isMuted;

  void reportVolumeState({required double volume, required bool isMuted}) {
    _volume = volume.clamp(0, 100);
    _isMuted = isMuted;
  }

  Duration get currentPlaybackPosition {
    final backendPos = _backend?.position ?? Duration.zero;
    return Duration(
      microseconds: [
        backendPos.inMicroseconds,
        state.position.inMicroseconds,
        _lastKnownPosition.inMicroseconds,
      ].reduce((a, b) => a > b ? a : b),
    );
  }
  Stream<PlayerBackend> get backendChangedStream =>
      _backendChangedController.stream;
  PlaybackBringupState get bringupState => _bringupState;
  dynamic _lastPlayedItem;
  dynamic get lastPlayedItem => _lastPlayedItem;

  void Function(String itemId, int? subtitleStreamIndex)? onSubtitleTrackChanged;
  void Function(String itemId, int? audioStreamIndex)? onAudioTrackChanged;

  /// Fired only when the viewer picks a track, unlike the changed callbacks
  /// above which also report the automatic pick for a new item and the reset
  /// when one finishes. The index arrives raw, so -1 still reads as subtitles
  /// off rather than as no choice at all.
  void Function(String itemId, int subtitleStreamIndex)? onSubtitleTrackSelected;
  void Function(String itemId, int audioStreamIndex)? onAudioTrackSelected;

  Stream<PlaybackBringupState> get bringupStateStream =>
      _bringupStateController.stream;
  Stream<void> get sessionEndedStream => _sessionEndedController.stream;
  LiveRecoveryStatus? get liveRecoveryStatus => _liveRecoveryStatus;
  Stream<LiveRecoveryStatus?> get liveRecoveryStatusStream =>
      _liveRecoveryStatusController.stream;
  StreamResolutionResult? get currentResolution => _currentResolution;

  /// Item that gained a stream on the server after this session resolved. The
  /// resolution still lists what the item had at play time, so a selector
  /// reading it would leave the new track out.
  String? _streamsOutdatedItemId;

  bool streamsOutdatedFor(String itemId) => _streamsOutdatedItemId == itemId;

  void markStreamsOutdated(String itemId) => _streamsOutdatedItemId = itemId;
  int? get audioStreamIndex => _audioStreamIndex;
  int? get subtitleStreamIndex {
    if (_subtitleStreamIndex != null) {
      return _subtitleStreamIndex;
    }
    final activeId = _backend?.activeSubtitleTrackIndex;
    if (activeId == -1) {
      return -1;
    }
    if (activeId != null && activeId > 0) {
      return _streamIndexForMpvTrackId(activeId, 'Subtitle');
    }
    return null;
  }

  Future<int?> getSubtitleStreamIndexAsync() async {
    if (_subtitleStreamIndex != null) {
      return _subtitleStreamIndex;
    }
    final activeId = await _backend?.getActiveSubtitleTrackIndexAsync();
    if (activeId == -1) {
      return -1;
    }
    if (activeId != null && activeId > 0) {
      return _streamIndexForMpvTrackId(activeId, 'Subtitle');
    }
    return null;
  }

  int? get pendingAudioStreamIndex => _pendingItemAudioStreamIndex;
  int? get pendingSubtitleStreamIndex => _pendingItemSubtitleStreamIndex;
  String? get pendingMediaSourceId => _mediaSourceId;
  bool get audioSelectionExplicit => _audioSelectionExplicit;
  bool get subtitleSelectionExplicit => _subtitleSelectionExplicit;
  String? get lastExplicitAudioLanguage => _lastExplicitAudioLanguage;
  int? get lastExplicitAudioIndex => _lastExplicitAudioIndex;
  String? get lastExplicitAudioTitle => _lastExplicitAudioTitle;
  String? get lastExplicitSubtitleLanguage => _lastExplicitSubtitleLanguage;
  bool? get lastExplicitSubtitleEnabled => _lastExplicitSubtitleEnabled;
  bool get playbackDeferredToExternalPlayer => _deferPlaybackToExternalPlayer;

  /// Marks the work that happens before [playItems] can take ownership of the
  /// queue. Player routes use this to render launch feedback while item
  /// hydration, prompts, and queue construction are still in progress.
  void beginPlaybackPreparation() {
    _setBringupState(
      const PlaybackBringupState(phase: PlaybackBringupPhase.preparing),
    );
  }

  /// Clears an abandoned preparation without overwriting a newer playback
  /// phase that may already have taken ownership.
  void cancelPlaybackPreparation() {
    if (_bringupState.phase == PlaybackBringupPhase.preparing) {
      _setBringupState(const PlaybackBringupState.idle());
    }
  }

  bool consumeSkipExternalRoutingOnce() {
    final shouldSkip = _skipExternalRoutingOnce;
    _skipExternalRoutingOnce = false;
    return shouldSkip;
  }

  void skipExternalRoutingOnce() {
    _skipExternalRoutingOnce = true;
  }

  void forceExternalPlayerOnce() {
    _forceExternalPlayerOnce = true;
  }

  void forceExternalChooserOnce() {
    _forceExternalChooserOnce = true;
  }

  bool consumeForceExternalChooserOnce() {
    final shouldForce = _forceExternalChooserOnce;
    _forceExternalChooserOnce = false;
    return shouldForce;
  }

  void setBitrateOverride(int? mbps) {
    _maxBitrateOverrideMbps = mbps;
  }

  int? get maxBitrateOverrideMbps => _maxBitrateOverrideMbps;
  bool get isOfflinePlayback => _isOfflinePlayback;

  /// Completes when any in-flight stop operation (including the offline
  /// tracker's DB write) finishes.  Returns `null` when no stop is pending.
  Future<void>? get pendingStop => _stopInFlight;
  Duration consumeDeferredStartPosition() {
    final value = _deferredStartPosition;
    _deferredStartPosition = Duration.zero;
    return value;
  }

  Map<String, dynamic>? get currentOfflineMetadata {
    final url = queueService.currentItem;
    if (url is! String) return null;
    return _offlineMetadataByUrl[url];
  }

  void setOfflineMetadataByUrl(Map<String, Map<String, dynamic>> metadata) {
    _offlineMetadataByUrl = metadata;
  }

  void setPendingItemOverrides({
    required String itemId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? mediaSourceId,
    bool audioSelectionExplicit = false,
    bool subtitleSelectionExplicit = false,
  }) {
    final normalizedItemId = itemId.trim();
    if (normalizedItemId.isEmpty) {
      _clearPendingItemOverrides();
      return;
    }

    _pendingItemOverrideId = normalizedItemId;
    _pendingItemAudioStreamIndex = audioStreamIndex;
    _pendingItemSubtitleStreamIndex = subtitleStreamIndex;
    _pendingItemMediaSourceId = mediaSourceId == null || mediaSourceId.isEmpty
        ? null
        : mediaSourceId;
    _pendingItemAudioSelectionExplicit = audioSelectionExplicit;
    _pendingItemSubtitleSelectionExplicit = subtitleSelectionExplicit;
  }

  List<Map<String, dynamic>> get _currentMediaStreams {
    final resStreams = _currentResolution?.mediaStreams;
    if (resStreams != null) return resStreams;
    final url = queueService.currentItem;
    if (url is! String) return const [];
    final meta = _offlineMetadataByUrl[url];
    return (meta?['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
        const [];
  }

  Map<String, dynamic>? _defaultAudioStream(
    List<Map<String, dynamic>> mediaStreams,
  ) {
    final audio = mediaStreams.where((s) => s['Type'] == 'Audio').toList();
    if (audio.isEmpty) return null;
    return audio.firstWhere(
      (s) => s['IsDefault'] == true,
      orElse: () => audio.first,
    );
  }

  Map<String, dynamic> _buildBackendMediaPayload({
    required String url,
    List<Map<String, dynamic>> mediaStreams = const [],
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? container,
    String? videoRangeType,
    String? mediaType,
    Map<String, String> headers = const {},
    double? normalizationGainDb,
    String? hybridAudioUrl,
    bool isLive = false,
    bool autoPlay = true,
    List<ExternalSubtitle> externalSubtitles = const [],
    bool audioLike = false,
  }) {
    // Music and audiobooks are audio whatever their streams say. Media3 only
    // plays audio with no view when the payload says audio, so a stray video
    // stream must not change that.
    final resolvedMediaType =
        audioLike ? 'audio' : mediaType?.trim().toLowerCase();

    final Map<String, dynamic>? audioStream;
    if (audioStreamIndex != null) {
      final match = mediaStreams.firstWhere(
        (s) => s['Type'] == 'Audio' && s['Index'] == audioStreamIndex,
        orElse: () => const <String, dynamic>{},
      );
      audioStream = match.isNotEmpty
          ? match
          : _defaultAudioStream(mediaStreams);
    } else {
      audioStream = _defaultAudioStream(mediaStreams);
    }

    final Map<String, dynamic>? subtitleStream;
    if (subtitleStreamIndex != null && subtitleStreamIndex != -1) {
      final match = mediaStreams.firstWhere(
        (s) => s['Type'] == 'Subtitle' && s['Index'] == subtitleStreamIndex,
        orElse: () => const <String, dynamic>{},
      );
      subtitleStream = match.isNotEmpty ? match : null;
    } else {
      subtitleStream = null;
    }

    final videoStream = mediaStreams
        .where((s) => s['Type'] == 'Video')
        .firstOrNull;

    // Some servers report only the average, so it stands in when the real
    // rate is missing.
    final realRate = videoStream?['RealFrameRate'];
    final averageRate = videoStream?['AverageFrameRate'];
    final videoFrameRate = realRate is num
        ? realRate.toDouble()
        : averageRate is num
        ? averageRate.toDouble()
        : null;

    final audioStreamLang = _extractLanguage(audioStream);
    final subtitleStreamLang = _extractLanguage(subtitleStream);

    // Lets the player open a chosen track straight away instead of starting on
    // the container default and switching once the selection catches up. Only
    // for a real selection, since without one the player's own language
    // preference should decide, and not for the stripped streams where the
    // server already picked.
    final audioTrackOrdinal =
        _embeddedTracksStripped || audioStreamIndex == null
        ? null
        : TrackOrdinalMapper.mpvTrackIdForStream(
            streamIndex: audioStreamIndex,
            type: 'Audio',
            mediaStreams: mediaStreams,
            externalSubtitles: null,
            embeddedStripped: false,
          );

    // The player opens the chosen track at load from the container's own
    // numbering. A stripped stream carries the one audio track the server
    // already picked, so there is nothing to point at.
    final audioContainerIndex =
        _embeddedTracksStripped || audioStreamIndex == null
        ? null
        : TrackOrdinalMapper.containerStreamIndex(
            streamIndex: audioStreamIndex,
            mediaStreams: mediaStreams,
          );

    final declaredSubtitles = _declarableSubtitles(
      mediaStreams,
      externalSubtitles,
    );

    return <String, dynamic>{
      'url': url,
      'autoPlay': autoPlay,
      if (container != null && container.isNotEmpty) 'container': container,
      if (videoRangeType != null && videoRangeType.isNotEmpty)
        'videoRangeType': videoRangeType,
      if (audioStream != null) ...{
        'audioCodec': (audioStream['Codec'] ?? '').toString(),
        'audioProfile': (audioStream['Profile'] ?? '').toString(),
        if (audioStream['Channels'] is int) 'audioChannels': audioStream['Channels'],
      },
      if (audioContainerIndex != null) 'audioStreamIndex': audioContainerIndex,
      if (audioTrackOrdinal != null) 'audioTrackOrdinal': audioTrackOrdinal,
      if (audioStreamLang != null) 'preferredAudioLanguage': audioStreamLang,
      if (subtitleStreamLang != null)
        'preferredTextLanguage': subtitleStreamLang,
      if (videoStream != null && videoStream['DvProfile'] is int)
        'videoDvProfile': videoStream['DvProfile'],
      if (videoStream != null && videoStream['DvBlSignalCompatibilityId'] is int)
        'videoDvBlCompatId': videoStream['DvBlSignalCompatibilityId'],
      if (videoStream != null &&
          (videoStream['Codec']?.toString().isNotEmpty ?? false))
        'videoCodec': videoStream['Codec'].toString().toLowerCase(),
      if (videoFrameRate != null) 'videoFrameRate': videoFrameRate,
      if (videoStream != null && videoStream['Width'] is int)
        'videoWidth': videoStream['Width'],
      if (videoStream != null && videoStream['Height'] is int)
        'videoHeight': videoStream['Height'],
      if (headers.isNotEmpty) 'headers': headers,
      if (hybridAudioUrl != null && hybridAudioUrl.isNotEmpty)
        'hybridAudioUrl': hybridAudioUrl,
      'isLive': isLive,
      'mediaType':
          (resolvedMediaType == 'audio' || resolvedMediaType == 'video')
          ? resolvedMediaType
          : MediaStreamResolver.detectMediaType(mediaStreams, fallbackUrl: url),
      'normalizationGainDb':
          normalizationGainDb ??
          MediaStreamResolver.extractNormalizationGainDb(mediaStreams),
      if (declaredSubtitles.isNotEmpty) 'externalSubtitles': declaredSubtitles,
    };
  }

  /// Sidecars a backend can register while it opens the source, in the order
  /// [TrackOrdinalMapper] counts them, so an ordinal derived from that list
  /// still lands on the same track.
  ///
  /// Only text formats go out. A bitmap sidecar has no text equivalent, so a
  /// player asked to read one as text fails the decode instead of falling back.
  List<Map<String, dynamic>> _declarableSubtitles(
    List<Map<String, dynamic>> mediaStreams,
    List<ExternalSubtitle> externalSubtitles,
  ) {
    if (externalSubtitles.isEmpty) return const [];
    final effective = TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: mediaStreams,
      externalSubtitles: externalSubtitles,
      embeddedStripped: _embeddedSubtitlesUnavailable,
    );
    return [
      for (final sub in effective)
        if (_isDeclarableSubtitleCodec(sub.codec))
          {
            'url': _ensureSubtitleApiKey(sub.deliveryUrl),
            if (sub.title != null) 'title': sub.title,
            if (sub.language != null) 'language': sub.language,
            'codec': sub.codec,
            'isDefault': sub.isDefault,
            'isForced': sub.isForced,
          },
    ];
  }

  static bool _isDeclarableSubtitleCodec(String codec) => const {
    'srt',
    'subrip',
    'ass',
    'ssa',
    'vtt',
    'webvtt',
  }.contains(codec.trim().toLowerCase());

  String _traceItemId(dynamic item) {
    try {
      final dynamic dyn = item;
      final id = dyn.id?.toString();
      if (id != null && id.isNotEmpty) {
        return id;
      }
    } catch (_) {}

    if (item is Map) {
      final id = item['Id'] ?? item['id'];
      if (id != null) {
        return id.toString();
      }
    }

    return item.runtimeType.toString();
  }

  String _traceBackendName(PlayerBackend? backend) {
    return backend?.runtimeType.toString() ?? 'none';
  }

  bool _hasNoActivePlayback(PlayerBackend? backend) {
    final noBackendActivity =
        backend == null ||
        (!backend.isPlaying &&
            !backend.isBuffering &&
            backend.position <= Duration.zero &&
            backend.buffer <= Duration.zero &&
            backend.duration <= Duration.zero);

    return !_isOfflinePlayback &&
        queueService.currentItem == null &&
        _currentResolution == null &&
        _lastPlaybackResolution == null &&
        _lastPlaybackItem == null &&
        _playbackStartTime == null &&
        noBackendActivity;
  }

  void _setBringupState(PlaybackBringupState state) {
    if (_suppressFailedBringupDuringRecovery &&
        state.phase == PlaybackBringupPhase.failed) {
      _diagnosticLogger?.call(
        'Live recovery: dropping an intermediate failed bringup state '
        'during a re-resolve',
      );
      return;
    }
    _bringupState = state;
    _bringupStateController.add(state);
  }

  void setBackend(PlayerBackend backend, {bool disposePrevious = true}) {
    if (identical(_backend, backend)) {
      return;
    }
    final previous = _backend;
    _unsupportedAudioRecoveryInFlight = false;
    _suppressNextGenericBackendError = false;
    _endLiveStallWatch();
    _disposeStreamSubs();
    _backend = backend;
    _retainedBackends.add(backend);
    _bindStreams(backend);
    _subtitleRendererMode = SubtitleRendererMode.native;
    if (previous != null && !identical(previous, backend)) {
      unawaited(previous.stop());
    }
    _backendChangedController.add(backend);
    if (previous != null && disposePrevious) {
      _retainedBackends.remove(previous);
      previous.dispose();
    }
  }

  void setResolver(MediaStreamResolver resolver) {
    _resolver = resolver;
  }

  void setPlayerService(PlayerService service) {
    _service = service;
  }

  void setResolverConfigurator(
    Future<void> Function(dynamic item) configurator,
  ) {
    _resolverConfigurator = configurator;
  }

  void setExternalPlaybackDecider(bool Function(List<dynamic> items)? decider) {
    _externalPlaybackDecider = decider;
  }

  void setContentRefusal({
    bool Function(dynamic item)? queueFilter,
    Future<bool> Function(dynamic item)? playRefusal,
  }) {
    _queueContentFilter = queueFilter;
    _playContentRefusal = playRefusal;
  }

  void setNextSeasonItemsProvider(
    Future<List<dynamic>> Function(
      dynamic completedItem,
      List<dynamic> queueItems,
      int completedIndex,
    )?
    provider,
  ) {
    _nextSeasonItemsProvider = provider;
  }

  Future<void> configureResolverForItem(dynamic item) async {
    if (_resolverConfigurator == null) return;
    await _resolverConfigurator!(item);
  }

  void setBackendSelector(
    PlayerBackend Function(
      StreamResolutionResult resolution,
      PlayerBackend currentBackend,
    )?
    selector,
  ) {
    _backendSelector = selector;
  }

  PlaybackArbiter? _arbiter;

  void setAudioArbiter(PlaybackArbiter arbiter) {
    _arbiter = arbiter;
    arbiter.register(this);
  }

  @override
  AudioProducer get audioProducerId => AudioProducer.mainPlayback;

  /// Whether [item] is music or an audiobook, from a library item, an offline
  /// url's downloaded metadata, or a raw item map.
  bool _isAudioLikeItem(dynamic item) {
    final Map<dynamic, dynamic>? meta = switch (item) {
      String url => _offlineMetadataByUrl[url],
      Map map => map,
      _ => null,
    };
    if (meta == null) {
      try {
        return item?.isAudioLike == true;
      } catch (_) {
        return false;
      }
    }
    final type = meta['Type'];
    return type == 'Audio' || type == 'AudioBook' || meta['MediaType'] == 'Audio';
  }

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    if (reason == RevokeReason.background) {
      if (_isAudioLikeItem(queueService.currentItem)) return;
      await pause();
    } else {
      await stop(userInitiated: false);
    }
  }

  void setTranscodeSelector(
    String? Function(StreamResolutionResult resolution)? selector,
  ) {
    _transcodeSelector = selector;
  }

  void setStartPositionAdjuster(
    Duration Function(dynamic item, Duration startPosition)? adjuster,
  ) {
    _startPositionAdjuster = adjuster;
  }

  /// Set per item by whoever loaded its chapters, after playback of that
  /// item has started.
  void setChapterStarts(List<Duration> starts) {
    _chapterStarts = starts;
    _chapterStartsItem = queueService.currentItem;
  }

  /// Empty unless the starts belong to the item playing now. This manager is
  /// one instance shared with the audio screens, which never set chapters, so
  /// a song must not inherit a film's.
  List<Duration> get _currentChapterStarts =>
      identical(queueService.currentItem, _chapterStartsItem)
      ? _chapterStarts
      : const [];

  void setStartupRecoveryDecider(
    Future<PlaybackStartupRecoveryDecision> Function(
      PlaybackStartupFailureContext context,
    )?
    decider,
  ) {
    _startupRecoveryDecider = decider;
  }

  void setPlaybackDecisionLogger(
    void Function(PlaybackDecisionContext context)? logger,
  ) {
    _playbackDecisionLogger = logger;
  }

  /// Receives one-line notes about decisions that leave no other trace, such
  /// as an event that was deliberately dropped.
  void setDiagnosticLogger(void Function(String message)? logger) {
    _diagnosticLogger = logger;
  }

  void _resetBackendSelectionLock() {
    _backendSelectionLockedForSession = false;
    _sessionLockedBackend = null;
    _clientTranscodeReason = null;
  }

  Future<bool> Function(TransportAction action, {Duration? position})?
  _transportInterceptor;

  void setTransportInterceptor(
    Future<bool> Function(TransportAction action, {Duration? position})?
    interceptor,
  ) {
    _transportInterceptor = interceptor;
  }

  /// Whether transport actions are being routed to a coordinator (SyncPlay)
  /// instead of reaching the player directly. Housekeeping that would seek
  /// or pause on its own initiative must stand down while this is set: the
  /// coordinator owns the position, and such a seek or pause would be sent
  /// to every member of the group as if the user had asked for it.
  bool get hasTransportInterceptor => _transportInterceptor != null;

  Future<bool> _maybeIntercept(
    TransportAction action, {
    Duration? position,
  }) async {
    final interceptor = _transportInterceptor;
    if (interceptor == null) return false;
    try {
      return await interceptor(action, position: position);
    } catch (_) {
      return false;
    }
  }

  void _bindStreams(PlayerBackend backend) {
    _streamSubs.addAll([
      backend.positionStream.listen((pos) {
        state.setPosition(pos);
        if (pos > Duration.zero) _lastKnownPosition = pos;
        // A backend can refuse a speed it was given - bitstreamed audio cannot
        // be time stretched - so track what it actually settled on rather than
        // leaving the UI showing a rate that is not happening.
        final actualSpeed = backend.playbackSpeed;
        if (actualSpeed > 0 && actualSpeed != state.playbackSpeed) {
          state.setPlaybackSpeed(actualSpeed);
        }
      }),
      backend.durationStream.listen((dur) {
        if (_itemKnownDuration > Duration.zero &&
            dur.inMilliseconds < _itemKnownDuration.inMilliseconds * 9 ~/ 10) {
          state.setDuration(_itemKnownDuration);
        } else {
          state.setDuration(dur);
        }
      }),
      backend.bufferStream.listen(state.setBuffer),
      backend.playingStream.listen((playing) {
        // The intent is read from the backend at the same moment, so a
        // progress report can tell a viewer pause from a starved stream.
        state.setPlayWhenReady(backend.playWhenReady);
        state.setPlaying(playing);
        _onProgressStreamsUpdated();
        _evaluateLiveStallWatchdog();
      }),
      backend.bufferingStream.listen((buffering) {
        state.setPlayWhenReady(backend.playWhenReady);
        state.setBuffering(buffering);
        // On web/MediaKit, buffering going false while playing is already
        // true is the moment playback actually resumes -- the playing
        // stream never fires again to tell us. Run the same bookkeeping
        // here as the playing listener does.
        _onProgressStreamsUpdated();
        _evaluateLiveStallWatchdog();
      }),
      backend.completedStream.listen(_onTrackCompleted),
    ]);

    final errorStream = backend.errorStream;
    if (errorStream != null) {
      _streamSubs.add(
        errorStream.listen(_onBackendErrorEvent, onError: (_) {}),
      );
    }
  }

  void _disposeStreamSubs() {
    for (final sub in _streamSubs) {
      sub.cancel();
    }
    _streamSubs.clear();
  }

  /// The highest bitrate any of [item]'s sources needs, or null when the item
  /// does not say. Read duck-typed like the rest of the item, so a queue entry
  /// that is only an id costs nothing.
  int? _sourceBitrate(dynamic item) {
    try {
      final mediaSources = item.mediaSources as List?;
      if (mediaSources == null) return null;
      var highest = 0;
      for (final source in mediaSources) {
        if (source is! Map) continue;
        final bitrate = source['Bitrate'];
        if (bitrate is num && bitrate > highest) highest = bitrate.toInt();
      }
      return highest > 0 ? highest : null;
    } catch (_) {
      return null;
    }
  }

  Duration _resolvedItemDuration(dynamic item, String? mediaSourceId) {
    if (mediaSourceId != null) {
      try {
        final mediaSources = item.mediaSources as List?;
        if (mediaSources != null) {
          for (final source in mediaSources) {
            if (source is! Map) continue;
            if (source['Id'] != mediaSourceId) continue;
            final ticks = source['RunTimeTicks'];
            if (ticks is int && ticks > 0) {
              return Duration(microseconds: ticks ~/ 10);
            }
            if (ticks is num && ticks > 0) {
              return Duration(microseconds: ticks.toInt() ~/ 10);
            }
            break;
          }
        }
      } catch (_) {}
    }

    try {
      final runtime = item.runtime as Duration?;
      if (runtime != null) {
        return runtime;
      }
    } catch (_) {}

    return Duration.zero;
  }

  void _onTrackCompleted(bool completed) {
    if (!completed) return;

    // A live stream has no end, so the player reaching one means the source
    // starved. Every branch below is written for an item that finished and
    // would either stop playback or park the player on its last frame.
    if (_currentItemIsLive) {
      _logCompletion('live');
      unawaited(_recoverStalledStream());
      return;
    }

    final completedItem = queueService.currentItem;
    if (completedItem != null) {
      final itemId = MediaStreamResolver.extractItemId(completedItem);
      onSubtitleTrackChanged?.call(itemId, null);
      onAudioTrackChanged?.call(itemId, null);
    }

    if (_waitingForMedia ||
        _isAutoNexting ||
        _isManualNexting ||
        suppressAutoNext) {
      _logCompletion('suppressed');
      return;
    }
    if (!autoAdvanceEnabled && !_isPreroll(queueService.currentItem)) {
      _logCompletion('stop');
      _isAutoNexting = true;
      _mediaSourceId = null;
      _stopAndReportCurrent(skipQueueChange: true).whenComplete(() {
        _isAutoNexting = false;
        _notifySessionEnded();
      });
      return;
    }
    if (_playbackStartTime != null &&
        clock().difference(_playbackStartTime!).inSeconds < 5) {
      _logCompletion('too-soon');
      return;
    }
    final pos = _lastKnownPosition > state.position
        ? _lastKnownPosition
        : state.position;
    final backendDuration = _backend?.duration ?? Duration.zero;
    final effectiveDuration = _itemKnownDuration > Duration.zero
        ? _itemKnownDuration
        : (backendDuration > Duration.zero ? backendDuration : state.duration);

    if (effectiveDuration <= Duration.zero) {
      _logCompletion('no-duration', effectiveDuration: effectiveDuration);
      return;
    }

    final remaining = effectiveDuration - pos;
    if (remaining > const Duration(seconds: 5)) {
      // The player ran out of media early. That is starvation -- a server
      // transcode the client outran -- and it used to return here and do
      // nothing at all, parking the player on its last frame with no way back.
      //
      // But only the PLAYER's own duration may decide that. `effectiveDuration`
      // prefers library metadata, which routinely overstates a file's real
      // length, and believing it would turn an ordinary end-of-file into
      // retries, server churn and a failure card. When the player's own
      // duration says the media is spent, the file simply ended.
      final playerRemaining = backendDuration > Duration.zero
          ? backendDuration - pos
          : Duration.zero;
      if (playerRemaining > const Duration(seconds: 30)) {
        _logCompletion('starved', effectiveDuration: effectiveDuration);
        unawaited(_recoverStalledStream(trigger: 'starved', live: false));
      } else {
        _logCompletion('not-near-end', effectiveDuration: effectiveDuration);
      }
      return;
    }

    _logCompletion('auto-next', effectiveDuration: effectiveDuration);
    _isAutoNexting = true;
    _autoNext().whenComplete(() => _isAutoNexting = false);
  }

  /// Which branch of [_onTrackCompleted] ran, and the state it decided on.
  void _logCompletion(String branch, {Duration? effectiveDuration}) {
    final logger = _diagnosticLogger;
    if (logger == null) return;
    final resolution = _currentResolution ?? _lastPlaybackResolution;
    final item = queueService.currentItem ?? _lastPlaybackItem;
    logger(
      'Track completed -> $branch: autoAdvance=$autoAdvanceEnabled '
      'playMethod=${resolution?.playMethod.name ?? 'none'} '
      'liveStreamId=${resolution?.liveStreamId != null} '
      'liveTvItem=${_isLiveTvItem(item)} '
      'container=${resolution?.container ?? 'none'} '
      'duration=${effectiveDuration?.inMilliseconds ?? -1}ms '
      'position=${_lastKnownPosition.inMilliseconds}ms '
      'liveAttempts=$_liveRecoveryAttempts',
    );
  }

  /// A live stream that reports the end of its media has run out of playlist,
  /// not out of programme; a non-live starved transcode (`live: false`) is
  /// handled the same way. Follows the budget in [_liveRecoveryMaxAttempts]'s
  /// doc: cheap resumes, then re-resolves, the last with direct play
  /// disabled, then give up so the server releases the tuner and the live
  /// screen can offer Retry.
  ///
  /// [cheapResumeFirst] is false for a source the engine already reported as
  /// reset: re-opening it in place cannot help, so those attempts go straight
  /// to the re-resolve tier while still spending the same budget.
  Future<void> _recoverStalledStream({
    String trigger = 'completed',
    bool cheapResumeFirst = true,
    bool live = true,
    int? forIntent,
  }) async {
    // Belt and braces alongside the retry cancellation in
    // `_onProgressStreamsUpdated`: a timer already due to fire in the same
    // turn playback resumed would otherwise still run a recovery on top of
    // a channel that is fine again.
    if (forIntent != null && _isActuallyPlaying) {
      _diagnosticLogger?.call(
        'Live recovery: playback already resumed, dropping a held $trigger',
      );
      return;
    }
    // A recovery belongs to the channel that asked for it. Once the viewer has
    // tuned elsewhere there is nothing left to fix, and worse, re-resolving
    // now would take the tuner and the player away from the channel they just
    // asked for. A held retry carries the generation it was scheduled under,
    // so it can tell that it has been outlived.
    final intent = forIntent ?? _viewerIntentGeneration;
    if (intent != _viewerIntentGeneration) {
      _diagnosticLogger?.call(
        'Live recovery: the viewer moved on, abandoning a held $trigger',
      );
      return;
    }
    final now = clock();
    final lastAt = _lastLiveRecoveryAt;
    final sinceLast = lastAt == null ? null : now.difference(lastAt);
    final windowExpired =
        sinceLast != null && sinceLast >= _liveRecoveryWindow;
    // The attempt this event would become if it ran now, so it is held for
    // that attempt's own gap rather than a single fixed debounce.
    final nextAttempt =
        (sinceLast == null || windowExpired) ? 1 : _liveRecoveryAttempts + 1;
    final gap = _liveRecoveryGapBefore(nextAttempt);
    // Hold a burst, never drop one. By the time a second failure arrives the
    // player is usually stopped, and nothing else would ever ask again, so a
    // discarded event could strand the channel for good.
    if (_liveRecoveryInFlight ||
        (sinceLast != null && !windowExpired && sinceLast < gap)) {
      final wait = _liveRecoveryInFlight ? gap : gap - sinceLast!;
      _diagnosticLogger?.call(
        'Live recovery: holding a $trigger for ${wait.inMilliseconds}ms',
      );
      _scheduleLiveRecoveryRetry(
        wait,
        trigger: trigger,
        cheapResumeFirst: cheapResumeFirst,
        live: live,
        intent: intent,
      );
      return;
    }
    if (windowExpired) {
      _liveRecoveryAttempts = 0;
    }
    _lastLiveRecoveryAt = now;
    final attempt = ++_liveRecoveryAttempts;
    _liveRecoveryInFlight = true;
    try {
      if (attempt > _liveRecoveryMaxAttempts) {
        _diagnosticLogger?.call(
          'Live recovery: $trigger, budget spent after '
          '$_liveRecoveryMaxAttempts attempts, giving the channel up',
        );
        await _giveUpOnStalledStream(live: live, intent: intent);
        return;
      }
      _setLiveRecoveryStatus(
        LiveRecoveryStatus(
          attempt: attempt,
          maxAttempts: _liveRecoveryMaxAttempts,
        ),
      );
      // Cheapest tier: ask the player to re-open the source where the stream
      // is now. Most engines cannot, and one that says so falls straight
      // through to the re-resolve rather than spending its attempt on a call
      // that did nothing, then waiting for a recovery that is never coming.
      if (cheapResumeFirst && attempt == 1) {
        // Reset before the call, not after it returns true: the backend can
        // emit playing/non-buffering from inside `resumeLiveEdge`, before it
        // returns, and a reset placed after would erase that first frame.
        _liveFrameSeenSinceOpen = false;
        if (await _backend?.resumeLiveEdge() ?? false) {
          _diagnosticLogger?.call(
            'Live recovery: $trigger, attempt $attempt of '
            '$_liveRecoveryMaxAttempts, resumed the live edge',
          );
          // A cheap resume doesn't go through bringup, so nothing else would
          // re-arm the watchdog. Only the intent could have changed since the
          // await above; _armLiveStallWatchdog is a no-op if it has.
          if (intent == _viewerIntentGeneration) _startLiveStallWatch();
          return;
        }
        _diagnosticLogger?.call(
          'Live recovery: $trigger, attempt $attempt of '
          '$_liveRecoveryMaxAttempts, the engine cannot resume in place',
        );
      }

      // The cheap resume above was awaited, so the viewer has had a chance to
      // move on since. A re-resolve is the tier that would take the tuner from
      // whatever they tuned instead, so it is the one that must not run late.
      if (intent != _viewerIntentGeneration) {
        _diagnosticLogger?.call(
          'Live recovery: the viewer moved on, not re-resolving the channel',
        );
        return;
      }

      // A full re-resolve: new PlaybackInfo, a fresh tuner session and a fresh
      // upstream URL, which is materially different from re-opening the URL we
      // already have. The last attempt escalates one step past whatever route
      // the channel is currently on: a direct-played channel gives up direct
      // play and asks the server to serve the stream instead, which normally
      // means a remux, and a remuxed live channel arrives as HLS, which has a
      // real live window the raw transport stream never had -- transcoding is
      // left available but not demanded, since the server decides whether it
      // has to re-encode and for most channels it does not. A channel that is
      // already server-served has no such step left, so that one forces a
      // full transcode instead.
      final serverServed = attempt >= _liveRecoveryMaxAttempts;
      final currentPlayMethod =
          (_currentResolution ?? _lastPlaybackResolution)?.playMethod;
      final forceTranscode =
          serverServed && currentPlayMethod != StreamPlayMethod.directPlay;
      _diagnosticLogger?.call(
        'Live recovery: $trigger, attempt $attempt of '
        '$_liveRecoveryMaxAttempts, re-resolving the channel'
        '${forceTranscode
            ? ', forcing a transcode -- already server-served'
            : serverServed
            ? ' without direct play, letting the server serve it'
            : ''}',
      );
      // `_playCurrentItem` can emit a failed bringup state and then throw
      // (a startup failure, with `allowStartupRecovery: false` so it does
      // not retry itself) before this recovery attempt has decided whether
      // to hold and try again. Suppressing just around this await keeps
      // that intermediate failure off listeners; the give-up path below and
      // the budget-exceeded one above are outside it and still emit.
      _suppressFailedBringupDuringRecovery = true;
      try {
        await _reResolveAtCurrentPosition(
          isErrorRecovery: true,
          disableDirectPlay: serverServed,
          forceTranscode: forceTranscode,
          reason: forceTranscode
              ? 'live-edge-recovery-transcode'
              : serverServed
              ? 'live-edge-recovery-server-stream'
              : 'live-edge-recovery',
          allowStartupRecovery: false,
        );
      } finally {
        _suppressFailedBringupDuringRecovery = false;
      }
    } catch (e) {
      // The source is gone, not just stalled -- a re-resolve that threw
      // didn't spend a wasted attempt on the cheap resume, so the next one
      // goes straight to a fresh re-resolve. Only the last attempt gives up;
      // an earlier failure still has budget left, and the viewer may not
      // even have noticed if the channel comes back before it is spent.
      if (attempt < _liveRecoveryMaxAttempts &&
          intent == _viewerIntentGeneration) {
        _diagnosticLogger?.call(
          'Live recovery: attempt $attempt failed to re-resolve, retrying: $e',
        );
        _scheduleLiveRecoveryRetry(
          _liveRecoveryGapBefore(attempt + 1),
          trigger: 'retry-after-failure',
          cheapResumeFirst: false,
          live: live,
          intent: intent,
        );
      } else {
        _diagnosticLogger?.call(
          'Live recovery: attempt $attempt failed, giving the channel up: $e',
        );
        await _giveUpOnStalledStream(live: live, intent: intent);
      }
    } finally {
      // Stamped again at the end, not just the start: a re-resolve's own tune
      // can take several seconds, and measuring the next attempt's gap from
      // when this one finished (rather than when it began) is what keeps a
      // slow-but-working re-resolve from eating its own gap.
      _lastLiveRecoveryAt = clock();
      _liveRecoveryInFlight = false;
    }
  }

  /// Schedules a held or retried recovery attempt on [_liveRecoveryRetry],
  /// cancelling anything already waiting there.
  void _scheduleLiveRecoveryRetry(
    Duration wait, {
    required String trigger,
    required bool cheapResumeFirst,
    required bool live,
    required int intent,
  }) {
    _liveRecoveryRetry?.cancel();
    _liveRecoveryRetry = Timer(wait, () {
      unawaited(
        _recoverStalledStream(
          trigger: trigger,
          cheapResumeFirst: cheapResumeFirst,
          live: live,
          forIntent: intent,
        ),
      );
    });
  }

  /// The terminal step of [_recoverStalledStream]. Two jobs: release the
  /// tuner, and say the channel failed.
  ///
  /// The stop report is what frees the tuner. The failed bringup state is the
  /// manager's existing way of reporting that a stream could not be played --
  /// the same one the backend error path uses -- and a channel that died is a
  /// failure, not a finished queue, so this deliberately does not raise
  /// `sessionEnded`. The queue is kept so the screen can retune the same
  /// channel without rebuilding it.
  Future<void> _giveUpOnStalledStream({
    required bool live,
    required int intent,
  }) async {
    // Reporting a failure over a stop the viewer asked for, or over an item
    // they have since started, would leave a stale error on a screen that
    // moved on. Checked again after the teardown below, because a stop that
    // arrives while it is in flight is folded into it and produces no state of
    // its own -- so this failure would be the only thing the viewer is left
    // looking at.
    _setLiveRecoveryStatus(null);
    _endLiveStallWatch();
    bool viewerMovedOn() => intent != _viewerIntentGeneration;
    if (viewerMovedOn()) {
      _diagnosticLogger?.call(
        'Live recovery: the viewer moved on before the channel was given up',
      );
      return;
    }
    final item = queueService.currentItem ?? _lastPlaybackItem;
    final resolution = _currentResolution ?? _lastPlaybackResolution;
    _isAutoNexting = true;
    _mediaSourceId = null;
    try {
      await _stopAndReportCurrent(skipQueueChange: true);
    } catch (_) {
    } finally {
      _isAutoNexting = false;
      if (!viewerMovedOn()) {
        _setBringupState(
          PlaybackBringupState(
            phase: PlaybackBringupPhase.failed,
            sessionToken: _playbackSessionToken,
            itemId: item == null ? null : _traceItemId(item),
            backend: _traceBackendName(_backend),
            playMethod: resolution?.playMethod.name,
            error: live ? liveStreamLostError : streamStarvedError,
          ),
        );
      }
    }
  }

  void _clearPendingItemOverrides() {
    _pendingItemOverrideId = null;
    _pendingItemAudioStreamIndex = null;
    _pendingItemSubtitleStreamIndex = null;
    _pendingItemMediaSourceId = null;
  }

  void _notifySessionEnded() {
    if (_sessionEndedController.isClosed) return;
    _sessionEndedController.add(null);
  }

  bool _applyPendingItemOverridesIfNeeded(String itemId) {
    final pendingItemId = _pendingItemOverrideId;
    if (pendingItemId == null || pendingItemId != itemId) {
      return false;
    }

    _audioStreamIndex = _pendingItemAudioStreamIndex;
    _subtitleStreamIndex = _pendingItemSubtitleStreamIndex;
    _audioSelectionExplicit = _pendingItemAudioSelectionExplicit;
    _subtitleSelectionExplicit = _pendingItemSubtitleSelectionExplicit;
    _mediaSourceId = _pendingItemMediaSourceId;
    _clearPendingItemOverrides();
    return true;
  }

  String? _selectedAudioCodecOf(StreamResolutionResult resolution) {
    String? fallback;
    for (final stream in resolution.mediaStreams) {
      if ((stream['Type'] as String?) != 'Audio') continue;
      final codec = (stream['Codec'] as String?)?.toLowerCase();
      if (codec == null || codec.isEmpty) continue;
      fallback ??= codec;
      if (_audioStreamIndex != null && stream['Index'] == _audioStreamIndex) {
        return codec;
      }
      if (_audioStreamIndex == null && stream['IsDefault'] == true) {
        return codec;
      }
    }
    return fallback;
  }

  /// Records the playing audio codec as one this device can't decode, so the
  /// next resolve stops offering it. Returns whether anything new was
  /// learned, a retry without new information would just repeat the failure.
  bool _vetoSelectedAudioCodec(StreamResolutionResult resolution) {
    final codec = _selectedAudioCodecOf(resolution);
    if (codec == null || codec == 'raw' || codec.startsWith('pcm')) {
      return false;
    }
    var added = _vetoedAudioCodecs.add(codec);
    // The profile names DTS under both of its labels.
    if (codec == 'dts' || codec == 'dca') {
      final sibling = codec == 'dts' ? 'dca' : 'dts';
      added = _vetoedAudioCodecs.add(sibling) || added;
    }
    return added;
  }

  void _onBackendErrorEvent(Map<String, dynamic> event) {
    unawaited(_handleBackendErrorEvent(event));
  }

  Future<void> _handleBackendErrorEvent(Map<String, dynamic> event) async {
    final queueItem = queueService.currentItem;
    if (_isPreroll(queueItem)) {
      _suppressNextGenericBackendError = true;
      try {
        await _backend!.stop();
      } catch (_) {}
      await next();
      return;
    }

    // The old player is being stopped for a track-switch restart; its dying
    // error events are noise (the new stream's own failures still surface).
    if (_teardownForReResolve) {
      return;
    }

    // A player can keep talking after a stop, and by then the resolutions
    // are gone, so a failed bring-up would put a warning in the log and a
    // snackbar on a screen that is already leaving. Nothing legitimate is
    // lost: the backend is only asked to play once _currentResolution is
    // set, and a resolve failure is reported by _playCurrentItem itself.
    if (!_isOfflinePlayback &&
        _currentResolution == null &&
        _lastPlaybackResolution == null) {
      final message = event['message']?.toString();
      _diagnosticLogger?.call(
        'Dropped a late ${event['event']} from '
        '${_traceBackendName(_backend)} with no active session'
        '${message == null || message.isEmpty ? '' : ': $message'}',
      );
      return;
    }

    final eventType = event['event']?.toString();
    final kind = event['kind']?.toString();
    final recoverable = event['recoverable'] == true;
    final resolution = _currentResolution ?? _lastPlaybackResolution;

    void emitFailedBringupState(String fallbackMessage) {
      final message = event['message']?.toString().trim();
      _setBringupState(
        PlaybackBringupState(
          phase: PlaybackBringupPhase.failed,
          sessionToken: _playbackSessionToken,
          itemId: queueItem == null ? null : _traceItemId(queueItem),
          backend: _traceBackendName(_backend),
          playMethod: resolution?.playMethod.name,
          error: message != null && message.isNotEmpty
              ? message
              : fallbackMessage,
        ),
      );
    }

    // A transcoded stream that errors right after a user track switch gets
    // one silent re-resolve: the old encoder teardown can transiently break
    // the fresh manifest (shared hw-encoder slots, temp segment reaping).
    // The consumed flag is reset only by the next user-initiated re-resolve,
    // so this can never loop.
    bool canRetryTranscodeSwitch() =>
        resolution != null &&
        resolution.playMethod == StreamPlayMethod.transcode &&
        !_isOfflinePlayback &&
        !_waitingForMedia &&
        !_transcodeSwitchRecoveryConsumed &&
        _lastTrackSwitchReResolveAt != null &&
        DateTime.now().difference(_lastTrackSwitchReResolveAt!) <
            const Duration(seconds: 20);

    Future<void> retryTranscodeSwitch() async {
      _transcodeSwitchRecoveryConsumed = true;
      _suppressNextGenericBackendError = true;
      try {
        await _reResolveAtCurrentPosition(
          isErrorRecovery: true,
          reason: 'transcode-switch-retry',
        );
      } catch (_) {
        // A recovery that dies quietly leaves the bring-up phase parked at
        // resolving and the player screen spinning with no way out.
        emitFailedBringupState('Playback failed.');
      }
    }

    if (eventType == 'error') {
      if (_suppressNextGenericBackendError) {
        _suppressNextGenericBackendError = false;
        return;
      }

      if (canRetryTranscodeSwitch()) {
        await retryTranscodeSwitch();
        return;
      }

      // A live stream that trips over one bad response is not a dead channel.
      // Direct-played live has no playlist to starve, so this -- not the
      // end-of-stream path -- is how most of its failures arrive: an HTTP
      // error mid-stream. Re-preparing in place is exactly what the player
      // does to retry a source, so it gets the same bounded budget as any
      // other live recovery rather than going straight to a dead channel.
      // Not _suppressNextGenericBackendError: that swallows the NEXT error,
      // which on a flaky feed is the next real one, and the budget would never
      // be spent. A re-resolve's own dying-player noise is already dropped by
      // the _teardownForReResolve guard above.
      if (_currentItemIsLive && !_isOfflinePlayback) {
        await _recoverStalledStream(trigger: 'source-error');
        return;
      }

      emitFailedBringupState('Playback failed.');
      return;
    }

    if (eventType != 'playerError') {
      return;
    }

    if (!recoverable) {
      if (canRetryTranscodeSwitch()) {
        await retryTranscodeSwitch();
        return;
      }
      _suppressNextGenericBackendError = true;
      emitFailedBringupState('Playback failed.');
      return;
    }

    // Every recovery below re-resolves against the server, and none of that
    // preserves a local file: re-resolving with direct play disabled skips
    // the downloaded copy and streams instead, or hangs when the server is
    // unreachable. An error on local media is a real failure the user should
    // see. Media3's in-player audio offload retry is the one recovery that
    // stays on the file, so it is left to run.
    if (resolution != null &&
        resolution.isLocalMedia &&
        event['audioOffloadRetryTriggered'] != true) {
      _suppressNextGenericBackendError = true;
      emitFailedBringupState('Playback failed.');
      return;
    }

    // Deliberately not gated on _waitingForMedia. A container the player can't
    // parse fails before it ever reaches a ready state, so that gate left the
    // sources this recovery exists for sitting on a spinner. The re-resolve
    // takes the next session token, and the startup still running behind it
    // compares tokens and hands off to _cleanupPreemptedSession.
    bool canReResolve() =>
        resolution != null &&
        resolution.playMethod != StreamPlayMethod.transcode &&
        !_isOfflinePlayback &&
        !_unsupportedAudioRecoveryInFlight;

    Future<void> recoverViaTranscode() async {
      _unsupportedAudioRecoveryInFlight = true;
      // The stop below lets a startup still inside play() return, and the
      // next token is only taken after that stop. Retire the startup here or
      // it finishes as a normal start and reports a start for a session whose
      // stop already went out.
      ++_playbackSessionToken;
      try {
        await _reResolveAtCurrentPosition(
          forceTranscode: true,
          isErrorRecovery: true,
          reason: 'unsupported-audio-recovery',
        );
      } catch (_) {
        emitFailedBringupState('Playback failed.');
      } finally {
        _unsupportedAudioRecoveryInFlight = false;
      }
    }

    // A live source dropped or was reset upstream: re-resolve the stream at
    // the current position rather than forcing a transcode. The server hands
    // back a fresh session and the player rejoins at the edge. Re-opening the
    // source in place cannot help here, so this skips the cheap tier, but it
    // shares the recovery budget: a channel that is simply gone used to
    // re-tune the tuner for as long as the screen stayed open.
    if (kind == 'live_source_reset') {
      if (resolution == null || _isOfflinePlayback || _waitingForMedia) {
        return;
      }
      _suppressNextGenericBackendError = true;
      await _recoverStalledStream(
        trigger: 'live_source_reset',
        cheapResumeFirst: false,
      );
      return;
    }

    // Container/source error (e.g. brand-less MP4 that no extractor could
    // read) or a video codec or profile the engine can't play (e.g. a DV
    // profile it can't route). Only suppress the trailing generic error event
    // and recover when we can actually re-resolve, otherwise let the failure
    // surface.
    if (kind == 'unsupported_container' || kind == 'unsupported_video') {
      if (!canReResolve()) {
        return;
      }
      _suppressNextGenericBackendError = true;
      await recoverViaTranscode();
      return;
    }

    if (kind != 'unsupported_audio') {
      return;
    }

    _suppressNextGenericBackendError = true;

    if (event['audioOffloadRetryTriggered'] == true) {
      return;
    }

    // The device just proved it can't play this audio codec, so a retry has
    // to stop offering it or the server copies the same track into the next
    // stream and the failure repeats.
    final vetoAdded = resolution != null && _vetoSelectedAudioCodec(resolution);

    if (canReResolve()) {
      await recoverViaTranscode();
      return;
    }

    // Already transcoding. The failing codec got there because the profile
    // still allowed it, so a fresh veto makes one more resolve meaningful.
    if (vetoAdded &&
        resolution.playMethod == StreamPlayMethod.transcode &&
        !_isOfflinePlayback &&
        !_waitingForMedia &&
        !_unsupportedAudioRecoveryInFlight) {
      await recoverViaTranscode();
    }
  }

  Future<void> _autoNext() async {
    if (await _maybeIntercept(TransportAction.next)) return;
    _mediaSourceId = null;
    if (_isOfflinePlayback) {
      await _stopAndReportCurrent(skipQueueChange: true);
      final hadNext = queueService.next();
      if (hadNext) {
        final item = queueService.currentItem as String?;
        if (item != null) {
          await _onOfflineAutoNext?.call(item);
        }
      } else {
        _notifySessionEnded();
      }
      return;
    }
    await _stopAndReportCurrent(skipQueueChange: true);
    _resetBackendSelectionLock();
    final hadNext = queueService.next();
    if (hadNext) {
      await _playCurrentItem();
      return;
    }

    final advancedToNextSeason = await _tryAutoAdvanceToNextSeason();
    if (!advancedToNextSeason) {
      _notifySessionEnded();
    }
  }

  Future<bool> _tryAutoAdvanceToNextSeason() async {
    final provider = _nextSeasonItemsProvider;
    if (provider == null) return false;
    if (_isOfflinePlayback) return false;
    if (queueService.repeatMode != RepeatMode.none) return false;

    final completedItem = queueService.currentItem;
    final completedIndex = queueService.currentIndex;
    final queueSnapshot = queueService.items;
    if (completedItem == null || completedIndex < 0 || queueSnapshot.isEmpty) {
      return false;
    }
    if (completedIndex != queueSnapshot.length - 1) return false;

    List<dynamic> nextSeasonItems;
    try {
      nextSeasonItems = await provider(
        completedItem,
        queueSnapshot,
        completedIndex,
      );
    } catch (_) {
      return false;
    }

    if (nextSeasonItems.isEmpty) return false;

    queueService.addItems(nextSeasonItems);
    if (!queueService.next()) return false;
    await _playCurrentItem();
    return true;
  }

  void _preFetchNextSeasonIfNeeded() async {
    final provider = _nextSeasonItemsProvider;
    if (provider == null) return;
    if (_isOfflinePlayback) return;
    if (queueService.repeatMode != RepeatMode.none) return;

    final currentItem = queueService.currentItem;
    final currentIndex = queueService.currentIndex;
    final queueSnapshot = queueService.items;
    if (currentItem == null || currentIndex < 0 || queueSnapshot.isEmpty) {
      return;
    }
    if (currentIndex != queueSnapshot.length - 1) return;

    try {
      final nextSeasonItems = await provider(
        currentItem,
        queueSnapshot,
        currentIndex,
      );
      if (nextSeasonItems.isNotEmpty) {
        if (queueService.currentItem == currentItem &&
            queueService.currentIndex == currentIndex &&
            queueService.items.length == queueSnapshot.length) {
          queueService.addItems(nextSeasonItems);
        }
      }
    } catch (_) {}
  }


  Future<void> playItems(
    List<dynamic> items, {
    int startIndex = 0,
    Duration startPosition = Duration.zero,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? mediaSourceId,
    bool audioSelectionExplicit = false,
    bool subtitleSelectionExplicit = false,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    // False loads the item and leaves it paused at [startPosition]: a
    // SyncPlay handshake wants the player at the group's position without a
    // frame of playback until the group's own Unpause.
    bool autoPlay = true,
  }) async {
    _abandonLiveRecovery('the viewer tuned somewhere else');
    _viewerPaused = false;
    _clearPendingItemOverrides();
    _vetoedAudioCodecs.clear();
    _lastItemId = null;
    _lastExplicitAudioLanguage = null;
    _lastExplicitAudioIndex = null;
    _lastExplicitAudioTitle = null;
    _lastExplicitSubtitleLanguage = null;
    _lastExplicitSubtitleEnabled = null;
    _isAutoNexting = false;
    _isManualNexting = false;
    suppressAutoNext = false;
    dynamic pendingItem;
    if (items.isNotEmpty) {
      pendingItem = items[startIndex.clamp(0, items.length - 1)];
    }

    final queueFilter = _queueContentFilter;
    if (queueFilter != null && pendingItem != null) {
      if (queueFilter(pendingItem)) {
        // Return before the bringup phase moves off `preparing`. A launcher
        // holding a player route reads that as "nothing started" and closes
        // it, which is exactly the refusal we want and costs no new UI.
        return;
      }
      final allowed = items.where((i) => !queueFilter(i)).toList();
      if (allowed.length != items.length) {
        startIndex = allowed.indexOf(pendingItem);
        items = allowed;
      }
    }

    _setBringupState(
      PlaybackBringupState(
        phase: PlaybackBringupPhase.stoppingPrevious,
        itemId: pendingItem == null ? null : _traceItemId(pendingItem),
        backend: _traceBackendName(_backend),
      ),
    );
    await _stopAndReportCurrent();
    _resetBackendSelectionLock();
    _audioStreamIndex = audioStreamIndex;
    _subtitleStreamIndex = subtitleStreamIndex;
    _audioSelectionExplicit = audioSelectionExplicit;
    _subtitleSelectionExplicit = subtitleSelectionExplicit;
    _mediaSourceId = mediaSourceId;
    _forceTranscodeForQueue = !enableDirectPlay && !enableDirectStream;
    _directPlayAllowedForQueue = enableDirectPlay;
    final adjuster = _startPositionAdjuster;
    if (adjuster != null && startPosition > Duration.zero && items.isNotEmpty) {
      final currentItem = items[startIndex.clamp(0, items.length - 1)];
      final adjusted = adjuster(currentItem, startPosition);
      startPosition = adjusted < Duration.zero ? Duration.zero : adjusted;
    }
    queueService.setQueue(items, startIndex: startIndex);

    final forceExternal = _forceExternalPlayerOnce;
    _forceExternalPlayerOnce = false;

    final externalDecider = _externalPlaybackDecider;
    if (forceExternal || (externalDecider != null && externalDecider(items))) {
      _deferredStartPosition = startPosition;
      _deferPlaybackToExternalPlayer = true;
      _setBringupState(const PlaybackBringupState.idle());
      return;
    }

    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;
    await _playCurrentItem(
      startPosition: startPosition,
      enableDirectPlay: enableDirectPlay,
      enableDirectStream: enableDirectStream,
      enableTranscoding: enableTranscoding,
      autoPlay: autoPlay,
    );
  }

  Future<void> startQueuedPlayback({
    Duration startPosition = Duration.zero,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool freshResolution = false,
  }) async {
    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;
    if (freshResolution) {
      // A background timeout has ended ownership of the old source. Do not
      // carry its selected source into the new PlaybackInfo request.
      _mediaSourceId = null;
    }
    await _playCurrentItem(
      startPosition: startPosition,
      enableDirectPlay: enableDirectPlay,
      enableDirectStream: enableDirectStream,
      enableTranscoding: enableTranscoding,
    );
  }

  bool _isPreroll(dynamic item) {
    if (item == null) return false;
    try {
      if (item is Map) {
        return item['__moonfinIsPreroll'] == true;
      }
      final dynamic dynItem = item;
      final rawData = dynItem.rawData;
      if (rawData is Map) {
        return rawData['__moonfinIsPreroll'] == true;
      }
    } catch (_) {}
    return false;
  }

  /// Whether a queue item is a live TV channel.
  bool _isLiveTvItem(dynamic item) {
    if (item == null) return false;
    try {
      final Map? map = item is Map ? item : (item as dynamic).rawData as Map?;
      final type = map?['Type']?.toString();
      return type == 'TvChannel' || type == 'LiveTvChannel';
    } catch (_) {
      return false;
    }
  }

  /// Whether what is playing right now is a live stream. The server decides
  /// this, never the container or the URL: a channel can arrive as HLS, as a
  /// raw transport stream or as fragmented MP4, and only the resolution and
  /// the item say which of them is live. Two signals because a false negative
  /// is the one that kills playback, and `_lastPlaybackResolution` is the
  /// fallback because `_reResolveNow` clears the current resolution before it
  /// restarts.
  bool get _currentItemIsLive {
    final resolution = _currentResolution ?? _lastPlaybackResolution;
    if (resolution?.liveStreamId != null) return true;
    return _isLiveTvItem(queueService.currentItem ?? _lastPlaybackItem);
  }

  Future<void> _playCurrentItem({
    Duration startPosition = Duration.zero,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool allowStartupRecovery = true,
    bool autoPlay = true,
  }) async {
    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;
    // A channel started afresh -- a tune, or Retry on the card a spent budget
    // raised -- gets the whole budget back. A re-resolve reaches here too, and
    // that one is an attempt being spent, so it must not clear the count.
    if (!_teardownForReResolve) {
      _resetLiveRecoveryBudget();
    }

    if (_forceTranscodeForQueue) {
      enableDirectPlay = false;
      enableDirectStream = false;
      enableTranscoding = true;
    }
    enableDirectPlay = enableDirectPlay && _directPlayAllowedForQueue;

    final item = queueService.currentItem;
    if (item == null || _backend == null) {
      _setBringupState(const PlaybackBringupState.idle());
      return;
    }

    // The backstop for everything the queue filter couldn't answer without a
    // lookup. Prerolls carry no rating of their own and are skipped.
    final refusal = _playContentRefusal;
    if (refusal != null && !_isPreroll(item) && await refusal(item)) {
      suppressAutoNext = true;
      queueService.clear();
      state.reset();
      // Closes a player that's already open, rather than leaving it frozen on
      // the last frame.
      _notifySessionEnded();
      return;
    }

    final lockedBackend = _sessionLockedBackend;
    if (_backendSelectionLockedForSession &&
        lockedBackend != null &&
        !identical(_backend, lockedBackend)) {
      setBackend(lockedBackend, disposePrevious: false);
    }

    // Seed with where this session means to resume from, the way the offline
    // path does. If the backend never starts, every position source stays at
    // zero and the stop report tells the server the item was left at the very
    // beginning, wiping the resume point the user was about to return to.
    _lastKnownPosition = startPosition;
    final sessionToken = ++_playbackSessionToken;
    final itemId = _traceItemId(item);
    final appliedOverrides = _applyPendingItemOverridesIfNeeded(itemId);
    if (!appliedOverrides && _lastItemId != null && _lastItemId != itemId) {
      _translateTrackSelectionsForNewItem(item);
    }
    _lastItemId = itemId;
    _lastPlayedItem = item;
    _preFetchNextSeasonIfNeeded();

    _setBringupState(
      PlaybackBringupState(
        phase: PlaybackBringupPhase.resolving,
        sessionToken: sessionToken,
        itemId: itemId,
        backend: _traceBackendName(_backend),
      ),
    );
    _externalSubsLoaded = null;

    await _resetSubtitleRendererMode();
    if (sessionToken != _playbackSessionToken) return;

    if (_resolverConfigurator != null) {
      await _resolverConfigurator!(item);
      if (sessionToken != _playbackSessionToken) return;
    }

    if (_resolver == null) {
      throw StateError('No MediaStreamResolver configured');
    }

    final startTicks = startPosition > Duration.zero
        ? startPosition.inMicroseconds * 10
        : null;

    final forceTranscode = !enableDirectPlay && !enableDirectStream;
    final profile = _backend!.getDeviceProfile(
      useProgressiveTranscode: forceTranscode,
    );
    stripVetoedAudioCodecs(profile, _vetoedAudioCodecs);
    if (_maxBitrateOverrideMbps != null) {
      profile['MaxStreamingBitrate'] = _maxBitrateOverrideMbps! * 1000000;
    }
    var maxBitrate = profile['MaxStreamingBitrate'] as int?;
    if (maxBitrate == null && autoBitrateProvider != null) {
      final measured = await autoBitrateProvider!();
      if (sessionToken != _playbackSessionToken) return;
      if (measured != null && measured > 0) {
        // The measurement bounds how heavy a transcode the server is asked
        // for, but the server reads it as a ceiling on direct play too, and a
        // short sample under-reads a fast link. A source that outruns it keeps
        // the uncapped request rather than becoming a transcode nothing asked
        // for.
        final sourceBps = _sourceBitrate(item);
        final vetoesDirectPlay =
            enableDirectPlay && sourceBps != null && sourceBps > measured;
        if (!vetoesDirectPlay) {
          maxBitrate = measured;
          profile['MaxStreamingBitrate'] = measured;
        }
      }
    }

    final resolution = await _resolver!.resolve(
      item,
      deviceProfile: profile,
      maxStreamingBitrate: maxBitrate,
      audioStreamIndex: _audioStreamIndex,
      subtitleStreamIndex: _subtitleStreamIndex,
      startTimeTicks: startTicks,
      mediaSourceId: _mediaSourceId,
      enableDirectPlay: enableDirectPlay,
      enableDirectStream: enableDirectStream,
      enableTranscoding: enableTranscoding,
    );

    if (sessionToken != _playbackSessionToken) {
      _cleanupPreemptedSession(item, resolution);
      return;
    }

    _setBringupState(
      PlaybackBringupState(
        phase: PlaybackBringupPhase.opening,
        sessionToken: sessionToken,
        itemId: itemId,
        backend: _traceBackendName(_backend),
        playMethod: resolution.playMethod.name,
      ),
    );

    if (!_backendSelectionLockedForSession) {
      final selector = _backendSelector;
      if (selector != null && _backend != null) {
        final selectedBackend = selector(resolution, _backend!);
        if (!identical(selectedBackend, _backend)) {
          setBackend(selectedBackend, disposePrevious: false);
        }
      }

      _sessionLockedBackend = _backend;
      _backendSelectionLockedForSession = true;
    }

    final transcodeSelector = _transcodeSelector;
    if (transcodeSelector != null &&
        enableDirectPlay &&
        enableDirectStream &&
        enableTranscoding &&
        resolution.playMethod != StreamPlayMethod.transcode) {
      // Every fresh evaluation overwrites the stash, so a reason recorded
      // before a mid-session capability change can't outlive it. The forced
      // second pass skips this whole block, which is what carries the reason
      // through to the decision logger.
      _clientTranscodeReason = transcodeSelector(resolution);
      if (_clientTranscodeReason != null) {
        await _playCurrentItem(
          startPosition: startPosition,
          enableDirectPlay: false,
          enableDirectStream: false,
          enableTranscoding: true,
          allowStartupRecovery: allowStartupRecovery,
        );
        return;
      }
    }

    bool needsReResolve = false;

    final audioStreams = resolution.mediaStreams.where((s) => s['Type'] == 'Audio').toList();
    final subtitleStreams = resolution.mediaStreams.where((s) => s['Type'] == 'Subtitle').toList();

    if (audioTrackSelector != null) {
      final targetIdx = audioTrackSelector!(
        audioStreams,
        _audioSelectionExplicit ? _audioStreamIndex : null,
      );
      if (targetIdx != null && _audioStreamIndex != targetIdx) {
        _audioStreamIndex = targetIdx;
        if (resolution.playMethod == StreamPlayMethod.transcode) {
          needsReResolve = true;
        }
      }
    } else {
      if (_lastExplicitAudioLanguage != null) {
        final matchedIdx = _matchStreamIndexByLanguage(
          resolution.mediaStreams,
          _lastExplicitAudioLanguage,
          'Audio',
          preferredIndex: _lastExplicitAudioIndex,
          preferredTitle: _lastExplicitAudioTitle,
        );
        if (matchedIdx != null && _audioStreamIndex != matchedIdx) {
          _audioStreamIndex = matchedIdx;
          if (resolution.playMethod == StreamPlayMethod.transcode) {
            needsReResolve = true;
          }
        }
      }
    }

    if (subtitleTrackSelector != null) {
      final targetIdx = subtitleTrackSelector!(
        subtitleStreams,
        audioStreams,
        _subtitleSelectionExplicit ? _subtitleStreamIndex : null,
      );
      if (targetIdx != null && _subtitleStreamIndex != targetIdx) {
        _subtitleStreamIndex = targetIdx;
        if (resolution.playMethod == StreamPlayMethod.transcode) {
          needsReResolve = true;
        }
      }
    } else {
      if (_lastExplicitSubtitleEnabled == false) {
        if (_subtitleStreamIndex != -1) {
          _subtitleStreamIndex = -1;
          if (resolution.playMethod == StreamPlayMethod.transcode) {
            needsReResolve = true;
          }
        }
      } else if (_lastExplicitSubtitleLanguage != null) {
        final matchedIdx = _matchStreamIndexByLanguage(
          resolution.mediaStreams,
          _lastExplicitSubtitleLanguage,
          'Subtitle',
        );
        if (matchedIdx != null && _subtitleStreamIndex != matchedIdx) {
          _subtitleStreamIndex = matchedIdx;
          if (resolution.playMethod == StreamPlayMethod.transcode) {
            needsReResolve = true;
          }
        }
      }
    }

    if (needsReResolve && !_reResolvingForTrackMatch) {
      _reResolvingForTrackMatch = true;
      try {
        await _playCurrentItem(
          startPosition: startPosition,
          enableDirectPlay: enableDirectPlay,
          enableDirectStream: enableDirectStream,
          enableTranscoding: enableTranscoding,
          allowStartupRecovery: allowStartupRecovery,
          autoPlay: autoPlay,
        );
        return;
      } finally {
        _reResolvingForTrackMatch = false;
      }
    }

    _currentResolution = resolution;
    _streamsOutdatedItemId = null;
    _lastPlaybackItem = item;
    _lastPlaybackResolution = resolution;
    _mediaSourceId = resolution.mediaSourceId;
    _itemKnownDuration = _resolvedItemDuration(item, resolution.mediaSourceId);

    if (_audioStreamIndex != null && _audioSelectionExplicit) {
      final audioStreams = resolution.mediaStreams.where((s) => s['Type'] == 'Audio').toList();
      final stream = audioStreams.firstWhere(
        (s) => s['Index'] == _audioStreamIndex,
        orElse: () => const <String, dynamic>{},
      );
      if (stream.isNotEmpty) {
        _lastExplicitAudioLanguage = _extractLanguage(stream);
        _lastExplicitAudioIndex = _audioStreamIndex;
        _lastExplicitAudioTitle = _extractTrackTitle(stream);
      }
    }

    if (_subtitleStreamIndex != null && _subtitleSelectionExplicit) {
      if (_subtitleStreamIndex == -1) {
        _lastExplicitSubtitleEnabled = false;
        _lastExplicitSubtitleLanguage = null;
      } else {
        _lastExplicitSubtitleEnabled = true;
        final subtitleStreams = resolution.mediaStreams.where((s) => s['Type'] == 'Subtitle').toList();
        final stream = subtitleStreams.firstWhere(
          (s) => s['Index'] == _subtitleStreamIndex,
          orElse: () => const <String, dynamic>{},
        );
        if (stream.isNotEmpty) {
          _lastExplicitSubtitleLanguage = _extractLanguage(stream);
        }
      }
    }

    if (_audioStreamIndex == null) {
      // Keep the server-selected audio index for later re-resolves.
      // If it is missing, fall back to the file's default audio track.
      _audioStreamIndex = resolution.selectedAudioStreamIndex;
      if (_audioStreamIndex == null) {
        final audioStreams =
            resolution.mediaStreams.where((s) => s['Type'] == 'Audio').toList();
        if (audioStreams.isNotEmpty) {
          final defaultAudio = audioStreams.firstWhere(
            (s) => s['IsDefault'] == true,
            orElse: () => audioStreams.first,
          );
          _audioStreamIndex = defaultAudio['Index'] as int?;
        }
      }
    }

    if (_subtitleStreamIndex == null) {
      // Keep the server-selected subtitle index for later re-resolves.
      // If it is missing, fall back to the file's default subtitle track.
      _subtitleStreamIndex = resolution.selectedSubtitleStreamIndex;
      if (_subtitleStreamIndex == null) {
        final subtitleStreams =
            resolution.mediaStreams.where((s) => s['Type'] == 'Subtitle').toList();
        if (subtitleStreams.isNotEmpty) {
          final defaultSubtitle = subtitleStreams.firstWhere(
            (s) => s['IsDefault'] == true,
            orElse: () => subtitleStreams.first,
          );
          _subtitleStreamIndex = defaultSubtitle['Index'] as int?;
        }
      }
    }

    final playbackDecisionLogger = _playbackDecisionLogger;
    if (playbackDecisionLogger != null && _backend != null) {
      try {
        playbackDecisionLogger(
          PlaybackDecisionContext(
            mediaItem: item,
            resolution: resolution,
            backend: _backend!,
            deviceProfile: Map<String, dynamic>.from(profile),
            maxStreamingBitrate: maxBitrate,
            audioStreamIndex: _audioStreamIndex,
            subtitleStreamIndex: _subtitleStreamIndex,
            clientTranscodeReason:
                _clientTranscodeReason ??
                (_forceTranscodeForQueue ? 'callerDisabledDirectPlay' : null),
          ),
        );
      } catch (_) {}
    }

    if (_itemKnownDuration > Duration.zero) {
      state.setDuration(_itemKnownDuration);
    }

    _playbackStartTime = clock();
    _unsupportedAudioRecoveryInFlight = false;
    _suppressNextGenericBackendError = false;
    _waitingForMedia = true;
    bool mediaReady = false;
    Object? startupError;
    StackTrace? startupStackTrace;
    final useNativeStart = startTicks != null;
    try {
      final backendMediaPayload = _buildBackendMediaPayload(
        url: resolution.streamUrl,
        mediaStreams: resolution.mediaStreams,
        audioStreamIndex: _audioStreamIndex,
        subtitleStreamIndex: _subtitleStreamIndex,
        container: resolution.container,
        videoRangeType: resolution.videoRangeType,
        mediaType: resolution.mediaType,
        headers: resolution.requestHeaders,
        normalizationGainDb: resolution.normalizationGainDb,
        hybridAudioUrl: resolution.hybridAudioUrl,
        isLive: resolution.liveStreamId != null || _isLiveTvItem(item),
        autoPlay: autoPlay,
        externalSubtitles: resolution.externalSubtitles,
        audioLike: _isAudioLikeItem(item),
      );
      await _arbiter?.acquire(AudioProducer.mainPlayback);
      if (sessionToken != _playbackSessionToken) {
        _cleanupPreemptedSession(item, resolution);
        return;
      }
      // Reset before the source opens, not after: web (and possibly
      // MediaKit) can emit playing/non-buffering from inside `open`, before
      // it returns, and a reset placed after would erase that first frame.
      _liveFrameSeenSinceOpen = false;
      await _backend!.play(
        backendMediaPayload,
        startPosition: useNativeStart ? startPosition : Duration.zero,
      );
      if (sessionToken != _playbackSessionToken) {
        _cleanupPreemptedSession(item, resolution);
        return;
      }
      await _syncBackendRepeatModeIfSupported();
      if (sessionToken != _playbackSessionToken) {
        _cleanupPreemptedSession(item, resolution);
        return;
      }
      if (_backend!.requiresStartupMediaReadyCheck) {
        _setBringupState(
          PlaybackBringupState(
            phase: PlaybackBringupPhase.waitingForReady,
            sessionToken: sessionToken,
            itemId: itemId,
            backend: _traceBackendName(_backend),
            playMethod: resolution.playMethod.name,
          ),
        );
        mediaReady = await _waitForMediaReady(
          isTranscode: resolution.playMethod == StreamPlayMethod.transcode,
          timeout: _onlineStartupReadyTimeout,
        );
      } else {
        mediaReady = true;
      }
      if (sessionToken != _playbackSessionToken) {
        _cleanupPreemptedSession(item, resolution);
        return;
      }
    } catch (e, st) {
      if (sessionToken != _playbackSessionToken) return;
      startupError = e;
      startupStackTrace = st;
    } finally {
      if (sessionToken == _playbackSessionToken) {
        _waitingForMedia = false;
      }
    }

    if (sessionToken != _playbackSessionToken) {
      _cleanupPreemptedSession(item, resolution);
      return;
    }

    if (!mediaReady) {
      final backend = _backend!;
      if (backend.position > Duration.zero ||
          backend.buffer > Duration.zero ||
          backend.isPlaying) {
        mediaReady = true;
      }
    }

    if (!mediaReady) {
      _currentResolution = null;
      try {
        await _backend!.stop();
      } catch (_) {}

      if (_isPreroll(item)) {
        await next();
        return;
      }

      if (allowStartupRecovery) {
        // A transcode retry asks the server, which abandons a local file.
        final forceTranscodeFallback =
            enableTranscoding &&
            !resolution.isLocalMedia &&
            resolution.playMethod != StreamPlayMethod.transcode;
        if (forceTranscodeFallback) {
          var decision = PlaybackStartupRecoveryDecision.retryWithTranscode;
          final decider = _startupRecoveryDecider;
          if (decider != null) {
            try {
              decision = await decider(
                PlaybackStartupFailureContext(
                  resolution: resolution,
                  startPosition: startPosition,
                  error: startupError,
                  stackTrace: startupStackTrace,
                ),
              );
            } catch (_) {}
          }

          if (decision == PlaybackStartupRecoveryDecision.abortPlayback) {
            _setBringupState(
              PlaybackBringupState(
                phase: PlaybackBringupPhase.failed,
                sessionToken: sessionToken,
                itemId: itemId,
                backend: _traceBackendName(_backend),
                playMethod: resolution.playMethod.name,
                error: 'startupRecoveryAborted',
              ),
            );
            throw const PlaybackStartupRecoveryAbortedException();
          }
        }

        await _playCurrentItem(
          startPosition: startPosition,
          enableDirectPlay: forceTranscodeFallback ? false : enableDirectPlay,
          enableDirectStream: forceTranscodeFallback
              ? false
              : enableDirectStream,
          enableTranscoding: forceTranscodeFallback ? true : enableTranscoding,
          allowStartupRecovery: false,
          autoPlay: autoPlay,
        );
        return;
      }

      if (startupError != null && startupStackTrace != null) {
        _setBringupState(
          PlaybackBringupState(
            phase: PlaybackBringupPhase.failed,
            sessionToken: sessionToken,
            itemId: itemId,
            backend: _traceBackendName(_backend),
            playMethod: resolution.playMethod.name,
            error: startupError.runtimeType.toString(),
          ),
        );
        Error.throwWithStackTrace(startupError, startupStackTrace);
      }
      _setBringupState(
        PlaybackBringupState(
          phase: PlaybackBringupPhase.failed,
          sessionToken: sessionToken,
          itemId: itemId,
          backend: _traceBackendName(_backend),
          playMethod: resolution.playMethod.name,
          error: 'mediaNotReady',
        ),
      );
      // Outside recovery this is a normal return -- the caller reads the
      // failed bringup state above. During a recovery re-resolve that state
      // was just suppressed, so returning here would look like a successful
      // re-resolve and no further attempt would ever be scheduled. Throw
      // instead so the recovery loop's catch schedules the next attempt.
      if (_suppressFailedBringupDuringRecovery) {
        throw const _MediaNotReadyDuringRecoveryException();
      }
      return;
    }

    if (useNativeStart && !_backend!.nativelyHandlesStartPosition) {
      _setBringupState(
        PlaybackBringupState(
          phase: PlaybackBringupPhase.seekingResume,
          sessionToken: sessionToken,
          itemId: itemId,
          backend: _traceBackendName(_backend),
          playMethod: resolution.playMethod.name,
        ),
      );
      await _seekWhilePausedAndMaybeResume(
        startPosition,
        resumeAfterSeek: autoPlay,
      );
    }

    if (resolution.externalSubtitles.isNotEmpty) {
      _waitAndAddExternalSubtitles(sessionToken, resolution);
    } else {
      _externalSubsLoaded = Future.value();
    }

    if (resolution.playMethod == StreamPlayMethod.directPlay ||
        resolution.playMethod == StreamPlayMethod.directStream) {
      final hasRequestedTrackSelection =
          _audioStreamIndex != null ||
          (_subtitleStreamIndex != null && _subtitleStreamIndex != -1);

      if (hasRequestedTrackSelection) {
        _waitAndApplyTrackSelections(
          sessionToken,
          restorePosition: useNativeStart ? startPosition : null,
        );
      }
      if (_subtitleStreamIndex == -1) {
        _waitAndDisableSubtitles(sessionToken);
      }
    } else if (resolution.playMethod == StreamPlayMethod.transcode) {
      if (_subtitleStreamIndex != null && _subtitleStreamIndex != -1) {
        final isBurnedIn = _subtitleIsBurnedIntoVideo(_subtitleStreamIndex);
        if (isBurnedIn) {
          _waitAndDisableSubtitles(sessionToken, force: true);
        } else if (_subtitleRendererModeForStream(_subtitleStreamIndex!) ==
            SubtitleRendererMode.assOverlay) {
          _waitAndApplyTrackSelections(
            sessionToken,
            restorePosition: useNativeStart ? startPosition : null,
          );
        } else {
          _waitAndApplyExternalSubtitle(sessionToken, resolution);
        }
      } else if (_subtitleStreamIndex == -1) {
        _waitAndDisableSubtitles(sessionToken);
      }
    }

    _service?.onPlaybackStart(
      item,
      resolution,
      positionTicks: startTicks,
      audioStreamIndex: _audioStreamIndex,
      subtitleStreamIndex: _subtitleStreamIndex,
    );

    // Live TV played directly from the upstream URL no longer needs the server's
    // live-stream session; close it so only the client's connection remains
    // (providers often cap connections). Safe: the played URL is the upstream,
    // not the server, and directPlay+liveStreamId only happens via the live
    // upstream branch.
    final directLiveStreamId = resolution.liveStreamId;
    if (resolution.playMethod == StreamPlayMethod.directPlay &&
        directLiveStreamId != null &&
        directLiveStreamId.isNotEmpty) {
      final closeFuture = _service?.closeLiveStream(directLiveStreamId);
      if (closeFuture != null) unawaited(closeFuture);
    }

    _startProgressTimer();
    _setBringupState(
      PlaybackBringupState(
        phase: PlaybackBringupPhase.ready,
        sessionToken: sessionToken,
        itemId: itemId,
        backend: _traceBackendName(_backend),
        playMethod: resolution.playMethod.name,
      ),
    );
    // `autoPlay` is the manager's own intent, so it decides arming here
    // rather than the backend's (possibly stale) playWhenReady. The frame-seen
    // flag was already reset before the source opened, above.
    if (autoPlay) {
      _viewerPaused = false;
      _startLiveStallWatch();
    } else {
      _viewerPaused = true;
      _endLiveStallWatch();
    }
  }

  void _startProgressTimer() {
    _stopProgressTimer();
    final item = queueService.currentItem;
    final resolution = _currentResolution;
    if (item == null || resolution == null) return;

    var generation = _progressGeneration;
    if (generation == null ||
        generation.ended ||
        !identical(generation.item, item) ||
        !identical(generation.resolution, resolution)) {
      if (generation != null && !generation.ended) {
        _retireProgressGeneration(generation, currentPlaybackPosition);
        _issuePlaybackStop(generation);
      }
      generation = _ProgressGeneration(
        item: item,
        resolution: resolution,
        service: _service,
      );
      _progressGeneration = generation;
    }

    final activeGeneration = generation;
    _progressTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (activeGeneration.ended ||
          !identical(_progressGeneration, activeGeneration)) {
        return;
      }
      Future<void>? progress;
      try {
        progress = activeGeneration.service?.onPlaybackProgress(
          activeGeneration.item,
          activeGeneration.resolution,
          state.position,
          // Not `!isPlaying`: that reads true while the stream is merely
          // starved, so the server could never tell a viewer pause from a
          // stall. Engines with no intent flag fall back to the old answer.
          isPaused: state.isPaused,
          audioStreamIndex: _audioStreamIndex,
          subtitleStreamIndex: _subtitleStreamIndex,
          volumeLevel: _volume.round(),
          isMuted: _isMuted,
        );
      } catch (_) {
        return;
      }
      if (progress == null) return;
      unawaited(
        progress.then<void>(
          (_) => _progressSettled(activeGeneration),
          onError: (Object _, StackTrace _) =>
              _progressSettled(activeGeneration),
        ),
      );
    });
  }

  void _progressSettled(_ProgressGeneration generation) {
    if (generation.ended) {
      // The request may have reached the server after the original stop. A
      // second stop, scoped to this generation's old PlaySessionId, ensures
      // that no late progress report can be the server's final state.
      _issuePlaybackStop(generation);
    }
  }

  void _retireProgressGeneration(
    _ProgressGeneration generation,
    Duration position,
  ) {
    generation
      ..ended = true
      ..stopPosition = position;
    if (identical(_progressGeneration, generation)) {
      _progressGeneration = null;
    }
  }

  void _issuePlaybackStop(_ProgressGeneration generation) {
    final service = generation.service;
    if (service == null) return;
    try {
      unawaited(
        service
            .onPlaybackStop(
              generation.item,
              generation.resolution,
              generation.stopPosition,
            )
            .catchError((_) {}),
      );
    } catch (_) {}
  }

  void _stopProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = null;
  }

  Future<void> resume() async {
    _viewerPaused = false;
    if (await _maybeIntercept(TransportAction.resume)) return;
    await _backend?.resume();
  }

  Future<void> pause() async {
    _viewerPaused = true;
    if (await _maybeIntercept(TransportAction.pause)) return;
    await _backend?.pause();
  }

  Future<bool> _waitForMediaReady({
    bool isTranscode = false,
    Duration timeout = _defaultMediaReadyTimeout,
  }) async {
    bool isReady() {
      if (_backend!.duration > Duration.zero) return true;

      if (_backend!.position > Duration.zero) return true;
      if (_backend!.buffer > Duration.zero) return true;
      if (_backend!.isPlaying) return true;

      if (isTranscode && !_backend!.isBuffering) return true;
      return false;
    }

    if (isReady()) {
      return true;
    }

    final attempts =
        timeout.inMilliseconds ~/ _mediaReadyPollInterval.inMilliseconds;
    for (var i = 0; i < attempts; i++) {
      await Future.delayed(_mediaReadyPollInterval);
      if (isReady()) {
        return true;
      }
    }
    return false;
  }

  Future<void> _seekWhilePausedAndMaybeResume(
    Duration position, {
    bool resumeAfterSeek = true,
  }) async {
    for (var attempt = 0; attempt < 3; attempt++) {
      await _backend!.seekTo(position);
      if (await confirmSeekHeld(position, () => _backend!.position)) {
        break;
      }
      // A dropped seek falls back to the start of the file. Anywhere else
      // means something moved playback on purpose, so leave it alone.
      if (_backend!.position > seekConfirmTolerance) {
        break;
      }
    }

    if (resumeAfterSeek) {
      await _backend!.resume();
    }
  }

  Future<void> stop({bool userInitiated = true}) async {
    if (userInitiated && await _maybeIntercept(TransportAction.stop)) return;
    _abandonLiveRecovery('the viewer stopped playback');
    _viewerPaused = false;
    await _stopAndReportCurrent();
  }

  /// Ends the server/backend ownership of a backgrounded video while keeping
  /// the expected queued item available for a fresh resolution on return.
  Future<bool> stopForBackground(dynamic expectedItem) async {
    if (_stopInFlight != null ||
        !identical(queueService.currentItem, expectedItem)) {
      return false;
    }
    return _stopAndReportCurrent(
      skipQueueChange: true,
      expectedItem: expectedItem,
      releaseServerResources: true,
    );
  }

  Future<void> seekTo(Duration position) async {
    if (await _maybeIntercept(TransportAction.seek, position: position)) return;
    _lastKnownPosition = position;
    await _backend?.seekTo(position);
  }

  /// A seek the player performed on its own, from a control the manager does
  /// not own (the native tvOS transport). The player has already moved, so
  /// only the interceptor sees it: whoever is coordinating playback, if
  /// anyone, gets the same notice a [seekTo] would have given.
  Future<void> notifyExternalSeek(Duration position) async {
    _lastKnownPosition = position;
    await _maybeIntercept(TransportAction.seek, position: position);
  }

  Future<void> setPlaybackSpeed(double speed) async {
    await _backend?.setPlaybackSpeed(speed);
    state.setPlaybackSpeed(speed);
  }

  Future<void> next() async {
    if (await _maybeIntercept(TransportAction.next)) return;
    final chapter = nextChapterStart(_currentChapterStarts, state.position);
    if (chapter != null) {
      await seekTo(chapter);
      return;
    }
    await _advanceQueue();
  }

  /// Straight to the next item, without stepping chapters first. What Play
  /// Next and the media session's next action want, since both mean the next
  /// item however far into this one the position is.
  Future<void> nextInQueue() async {
    if (await _maybeIntercept(TransportAction.next)) return;
    await _advanceQueue();
  }

  Future<void> _advanceQueue() async {
    // Nothing queued after this, so run it to the end and let the ordinary
    // finish handle watched state and whatever follows, rather than stopping
    // on a dead player.
    if (!queueService.hasNext && state.duration > Duration.zero) {
      await seekTo(state.duration);
      return;
    }
    if (_isManualNexting || _isAutoNexting) return;
    _isManualNexting = true;
    _mediaSourceId = null;
    try {
      await _stopAndReportCurrent(skipQueueChange: true);
      _resetBackendSelectionLock();
      final hadNext = queueService.next();
      if (hadNext) {
        await _playCurrentItem();
      }
    } finally {
      _isManualNexting = false;
    }
  }

  Future<void> previous() async {
    if (await _maybeIntercept(TransportAction.previous)) return;
    final chapter =
        previousChapterStart(_currentChapterStarts, state.position);
    if (chapter != null) {
      await seekTo(chapter);
      return;
    }
    // A press this far in restarts the item, and so does one with nothing to
    // step back to.
    if (state.position.inSeconds > 3 || !queueService.hasPrevious) {
      await seekTo(Duration.zero);
      return;
    }
    _mediaSourceId = null;
    await _stopAndReportCurrent(skipQueueChange: true);
    _resetBackendSelectionLock();
    queueService.previous();
    await _playCurrentItem();
  }

  Future<void> playFromQueue(int index) async {
    _mediaSourceId = null;
    await _stopAndReportCurrent(skipQueueChange: true);
    _resetBackendSelectionLock();
    queueService.jumpTo(index);
    await _playCurrentItem();
  }

  void toggleRepeat() {
    queueService.toggleRepeat();
    state.setRepeatMode(queueService.repeatMode);
    unawaited(_syncBackendRepeatModeIfSupported());
  }

  Future<void> _syncBackendRepeatModeIfSupported() async {
    final dynamic backend = _backend;
    if (backend == null) return;
    try {
      await backend.setRepeatMode(queueService.repeatMode);
    } catch (_) {}
  }

  void toggleShuffle() {
    queueService.toggleShuffle();
    state.setShuffled(queueService.isShuffled);
  }

  /// Runs a track change with progress reporting paused, so a progress tick
  /// can't report the new selection against the old play session.
  Future<void> _withProgressPaused(Future<void> Function() action) async {
    _stopProgressTimer();
    try {
      await action();
    } finally {
      if (_progressTimer == null && _currentResolution != null) {
        _startProgressTimer();
      }
    }
  }

  Future<void> changeAudioTrack(
    int streamIndex, {
    bool userInitiated = true,
  }) => _withProgressPaused(() async {
    _audioStreamIndex = streamIndex;
    _audioSelectionExplicit = true;

    final currentItem = queueService.currentItem;
    if (currentItem != null) {
      final itemId = MediaStreamResolver.extractItemId(currentItem);
      onAudioTrackChanged?.call(itemId, streamIndex >= 0 ? streamIndex : null);
      if (userInitiated) onAudioTrackSelected?.call(itemId, streamIndex);
    }

    final streams = _currentMediaStreams;
    if (streams.isNotEmpty) {
      final selectedStream = streams.firstWhere(
        (s) => s['Type'] == 'Audio' && s['Index'] == streamIndex,
        orElse: () => const <String, dynamic>{},
      );
      if (selectedStream.isNotEmpty) {
        _lastExplicitAudioLanguage = _extractLanguage(selectedStream);
        _lastExplicitAudioIndex = streamIndex;
        _lastExplicitAudioTitle = _extractTrackTitle(selectedStream);
      }
    }

    if (_isOfflinePlayback) {
      final mpvId = _mpvTrackIdForStream(streamIndex, 'Audio');
      if (mpvId != null) {
        await _backend?.setAudioTrack(mpvId);
      } else {
        _waitAndApplyTrackSelections(_playbackSessionToken);
      }
    } else if (_currentResolution?.playMethod == StreamPlayMethod.directPlay &&
        (_backend?.supportsDirectPlayAudioSwitch ?? false)) {
      // Every embedded track is already in a direct-played stream, so a
      // re-resolve would tear the player down and rebuild it for a track it
      // already has. The next progress report carries the new index anyway.
      final ordinal = _mpvTrackIdForStream(streamIndex, 'Audio');
      if (ordinal != null) {
        await _backend?.setAudioTrack(ordinal);
      } else {
        await _reResolveAtCurrentPosition();
      }
    } else {
      await _reResolveAtCurrentPosition();
    }
  });

  static const _bitmapSubCodecs = {
    'pgs',
    'pgssub',
    'dvbsub',
    'dvdsub',
    'hdmv_pgs_subtitle',
    'dvd_subtitle',
    'dvb_subtitle',
    'xsub',
  };
  static const _assSubCodecs = {'ass', 'ssa'};

  bool _isSubtitleBitmap(int streamIndex) {
    final streams = _currentMediaStreams;
    if (streams.isEmpty) return false;
    final sub = streams
        .where((s) => s['Type'] == 'Subtitle')
        .firstWhere(
          (s) => s['Index'] == streamIndex,
          orElse: () => <String, dynamic>{},
        );
    final codec = ((sub['Codec'] as String?) ?? '').toLowerCase();
    return _bitmapSubCodecs.contains(codec);
  }

  /// Every way the picture can arrive with this subtitle already in it, so
  /// turning the track off in the player would leave it on screen. A bitmap
  /// subtitle the backend can't draw counts too, since asking for it is what
  /// made the server burn it in.
  bool _subtitleIsBurnedIntoVideo(int? streamIndex) =>
      (streamIndex != null &&
          streamIndex >= 0 &&
          _isSubtitleBitmap(streamIndex) &&
          !(_backend?.canRenderBitmapSubtitles ?? false)) ||
      _isSubtitleBurnedIn(streamIndex);

  /// Whether the server is painting [streamIndex] into the video itself.
  ///
  /// Not every server says so in the stream URL, so the delivery method the
  /// media source reports is asked as well. Missing it leaves the client
  /// drawing its own copy over the one already in the picture. Only a
  /// transcode can burn anything in, so that second answer is not worth
  /// reading on any other play method, where a stream can carry a delivery
  /// method describing what a transcode would have done.
  bool _isSubtitleBurnedIn(int? streamIndex) {
    if (streamIndex != null &&
        streamIndex >= 0 &&
        _currentResolution?.playMethod == StreamPlayMethod.transcode) {
      for (final s in _currentMediaStreams) {
        if (s['Type'] != 'Subtitle') continue;
        if (s['Index'] != streamIndex) continue;
        final method = (s['DeliveryMethod'] as String?)?.trim().toLowerCase();
        if (method == 'encode') return true;
        break;
      }
    }
    return _currentResolution?.streamUrl.toLowerCase().contains(
          'subtitlemethod=encode',
        ) ??
        false;
  }

  bool _isSubtitleExternal(int streamIndex) {
    final streams = _currentMediaStreams;
    if (streams.isEmpty) return false;
    for (final s in streams) {
      if (s['Type'] != 'Subtitle') continue;
      if (s['Index'] != streamIndex) continue;
      return s['IsExternal'] == true;
    }
    return false;
  }

  String? _subtitleCodecForStream(int streamIndex) {
    final streams = _currentMediaStreams;
    if (streams.isNotEmpty) {
      for (final stream in streams) {
        if (stream['Type'] != 'Subtitle') continue;
        if (stream['Index'] != streamIndex) continue;
        final codec = stream['Codec'] as String?;
        if (codec != null && codec.isNotEmpty) {
          return codec.toLowerCase();
        }
      }
    }

    final externals = _currentResolution?.externalSubtitles ?? const [];
    for (final sub in externals) {
      if (sub.streamIndex != streamIndex) continue;
      if (sub.codec.isNotEmpty) {
        return sub.codec.toLowerCase();
      }
    }

    return null;
  }

  String? _externalSubtitleUrlForStream(int streamIndex) {
    final externals = _currentResolution?.externalSubtitles ?? const [];
    for (final sub in externals) {
      if (sub.streamIndex != streamIndex) continue;
      if (sub.deliveryUrl.isNotEmpty) {
        return _ensureSubtitleApiKey(sub.deliveryUrl);
      }
    }

    final streams = _currentMediaStreams;
    for (final stream in streams) {
      if (stream['Type'] != 'Subtitle') continue;
      if (stream['Index'] != streamIndex) continue;

      final deliveryUrl = (stream['DeliveryUrl'] as String?)?.trim();
      if (deliveryUrl == null || deliveryUrl.isEmpty) {
        continue;
      }

      if (deliveryUrl.startsWith('http://') ||
          deliveryUrl.startsWith('https://')) {
        return deliveryUrl;
      }

      final streamUrl = _currentResolution?.streamUrl;
      if (streamUrl == null || streamUrl.isEmpty) {
        return deliveryUrl;
      }

      final baseUri = Uri.tryParse(streamUrl);
      if (baseUri == null) {
        return deliveryUrl;
      }

      return _ensureSubtitleApiKey(baseUri.resolve(deliveryUrl).toString());
    }

    return null;
  }

  String _ensureSubtitleApiKey(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return url;
    final hasApiKey = uri.queryParameters.keys.any(
      (k) => k.toLowerCase() == 'api_key',
    );
    if (hasApiKey) return url;
    final streamUrl = _currentResolution?.streamUrl;
    if (streamUrl == null || streamUrl.isEmpty) return url;
    final baseUri = Uri.tryParse(streamUrl);
    if (baseUri == null) return url;
    final tokenEntry = baseUri.queryParameters.entries.firstWhere(
      (entry) => entry.key.toLowerCase() == 'api_key',
      orElse: () => const MapEntry('', ''),
    );
    if (tokenEntry.key.isEmpty || tokenEntry.value.isEmpty) return url;
    final mergedParams = <String, String>{
      ...uri.queryParameters,
      tokenEntry.key: tokenEntry.value,
    };
    return uri.replace(queryParameters: mergedParams).toString();
  }

  SubtitleRendererMode _subtitleRendererModeForStream(int streamIndex) {
    final codec = _subtitleCodecForStream(streamIndex);
    if (codec != null && _assSubCodecs.contains(codec)) {
      return SubtitleRendererMode.assOverlay;
    }
    return SubtitleRendererMode.native;
  }

  Future<void> _applySubtitleRendererModeForStream(int streamIndex) async {
    final mode = _subtitleRendererModeForStream(streamIndex);
    if (_subtitleRendererMode == mode) {
      return;
    }
    await _backend?.setSubtitleRendererMode(mode);
    _subtitleRendererMode = mode;
  }

  Future<void> _resetSubtitleRendererMode() async {
    if (_subtitleRendererMode == SubtitleRendererMode.native) {
      return;
    }
    await _backend?.setSubtitleRendererMode(SubtitleRendererMode.native);
    _subtitleRendererMode = SubtitleRendererMode.native;
  }

  /// Pass `userInitiated: false` when reapplying the track already playing, so
  /// it isn't mistaken for the viewer choosing it.
  ///
  /// [refreshStreams] is for a subtitle added to the item after this session
  /// resolved, which the stream list this session carries has never seen.
  Future<void> changeSubtitleTrack(
    int streamIndex, {
    bool userInitiated = true,
    bool refreshStreams = false,
  }) => _withProgressPaused(
    () => _changeSubtitleTrackInner(
      streamIndex,
      userInitiated: userInitiated,
      refreshStreams: refreshStreams,
    ),
  );

  Future<void> _changeSubtitleTrackInner(
    int streamIndex, {
    bool userInitiated = true,
    bool refreshStreams = false,
  }) async {
    final previousSubtitleStreamIndex = _subtitleStreamIndex;
    final isBitmap = _isSubtitleBitmap(streamIndex);
    _subtitleStreamIndex = streamIndex;

    final currentItem = queueService.currentItem;
    if (currentItem != null) {
      final itemId = MediaStreamResolver.extractItemId(currentItem);
      onSubtitleTrackChanged?.call(itemId, streamIndex >= 0 ? streamIndex : null);
      if (userInitiated) onSubtitleTrackSelected?.call(itemId, streamIndex);
    }

    _subtitleSelectionExplicit = streamIndex >= 0;
    _lastExplicitSubtitleEnabled = streamIndex >= 0;
    if (streamIndex >= 0) {
      final streams = _currentMediaStreams;
      if (streams.isNotEmpty) {
        final selectedStream = streams.firstWhere(
          (s) => s['Type'] == 'Subtitle' && s['Index'] == streamIndex,
          orElse: () => const <String, dynamic>{},
        );
        if (selectedStream.isNotEmpty) {
          _lastExplicitSubtitleLanguage = _extractLanguage(selectedStream);
        }
      }
    } else {
      _lastExplicitSubtitleLanguage = null;
    }

    await _applySubtitleRendererModeForStream(streamIndex);

    // Every branch below resolves the track through the stream list this
    // session was built from, so an index the server added since then finds
    // nothing and the selection quietly does nothing. Re-resolving rebuilds
    // the list first and carries the index into it.
    if (refreshStreams && !_isOfflinePlayback) {
      await _reResolveAtCurrentPosition();
      return;
    }

    if (!_isOfflinePlayback &&
        !(_backend?.supportsRuntimeTrackSelection ?? true)) {
      final canRenderBitmap = _backend?.canRenderBitmapSubtitles ?? false;
      await _reResolveAtCurrentPosition(
        forceTranscode: isBitmap && !canRenderBitmap,
      );
      return;
    }

    if (_currentResolution?.playMethod == StreamPlayMethod.directPlay ||
        _isOfflinePlayback) {
      final isExternal = _isSubtitleDeliveredExternally(streamIndex);
      if (isBitmap && !(_backend?.canRenderBitmapSubtitles ?? false)) {
        await _backend?.disableSubtitleTrack();
        if (!_isOfflinePlayback) {
          await _reResolveAtCurrentPosition(forceTranscode: true);
        }
        return;
      }
      if (isExternal) {
        _waitAndApplyTrackSelections(_playbackSessionToken);
        return;
      }
      final mpvId = _mpvTrackIdForStream(streamIndex, 'Subtitle');
      if (mpvId != null) {
        await _backend?.setSubtitleTrack(
          mpvId,
          isBitmapSubtitle: isBitmap,
          subtitleCodec: _subtitleCodecForStream(streamIndex),
          isExternalSubtitle: isExternal,
          externalSubtitleUrl: _externalSubtitleUrlForStream(streamIndex),
        );
      } else {
        _waitAndApplyTrackSelections(_playbackSessionToken);
      }
    } else if (_currentResolution?.playMethod == StreamPlayMethod.transcode ||
        _currentResolution?.playMethod == StreamPlayMethod.directStream) {
      final previousWasBurned = _subtitleIsBurnedIntoVideo(
        previousSubtitleStreamIndex,
      );
      if (previousWasBurned && !isBitmap) {
        await _backend?.disableSubtitleTrack();
        await _reResolveAtCurrentPosition();
        return;
      }
      if (isBitmap) {
        await _reResolveAtCurrentPosition(forceTranscode: true);
        return;
      }

      final shouldPreferRuntimeTrackSelection =
          _backend?.supportsRuntimeTrackSelection ?? false;
      if (shouldPreferRuntimeTrackSelection) {
        final mpvId = _mpvTrackIdForStream(streamIndex, 'Subtitle');
        if (mpvId != null) {
          await _backend?.setSubtitleTrack(
            mpvId,
            isBitmapSubtitle: isBitmap,
            subtitleCodec: _subtitleCodecForStream(streamIndex),
            isExternalSubtitle: _isSubtitleDeliveredExternally(streamIndex),
            externalSubtitleUrl: _externalSubtitleUrlForStream(streamIndex),
          );
          return;
        }
      }

      // Not selectable in the current stream (e.g. embedded sub the server
      // didn't re-deliver externally): restart with the sub burned in.
      await _reResolveAtCurrentPosition(forceTranscode: true);
    } else {
      await _reResolveAtCurrentPosition();
    }
  }

  Future<void> disableSubtitles() => _withProgressPaused(() async {
    final previousWasBurned = _subtitleIsBurnedIntoVideo(_subtitleStreamIndex);
    _subtitleStreamIndex = -1;
    _lastExplicitSubtitleEnabled = false;
    _lastExplicitSubtitleLanguage = null;

    final currentItem = queueService.currentItem;
    if (currentItem != null) {
      onSubtitleTrackSelected?.call(
        MediaStreamResolver.extractItemId(currentItem),
        -1,
      );
    }

    await _resetSubtitleRendererMode();
    if (previousWasBurned || (!_isOfflinePlayback &&
        !(_backend?.supportsRuntimeTrackSelection ?? true))) {
      await _reResolveAtCurrentPosition();
      return;
    }
    await _backend?.disableSubtitleTrack();
  });

  Future<void> changeBitrate(int? mbps) async {
    _maxBitrateOverrideMbps = mbps;
    await _reResolveAtCurrentPosition(forceTranscode: mbps != null);
  }

  /// Serializes re-resolves so rapid track switches can't tear down the same
  /// session twice or race two restarts.
  Future<void> _reResolveAtCurrentPosition({
    bool forceTranscode = false,
    // Refuses direct play but leaves the server free to remux rather than
    // re-encode. [forceTranscode] refuses the remux too, which is a much
    // heavier ask and is only what a bitrate cap or a burned-in subtitle
    // needs.
    bool disableDirectPlay = false,
    bool isErrorRecovery = false,
    // Named only by the error-recovery paths, which is what the log needs to
    // tell an automatic teardown from one the viewer asked for.
    String reason = 'track-change',
    // Live recovery passes false: its own budget already paces the re-resolve
    // attempts, and the nested transcode retry this would otherwise trigger
    // on a startup failure doubles an attempt into two and forces a re-encode
    // the budget deliberately leaves optional.
    bool allowStartupRecovery = true,
  }) {
    final previous = _reResolveQueue;

    final run = () async {
      if (previous != null) {
        try {
          await previous;
        } catch (_) {}
      }

      final autoPlayAfterResolve = isErrorRecovery
          ? true
          : (_backend?.isPlaying ?? state.isPlaying);

      await _reResolveNow(
        forceTranscode: forceTranscode,
        disableDirectPlay: disableDirectPlay,
        isErrorRecovery: isErrorRecovery,
        autoPlayAfterResolve: autoPlayAfterResolve,
        reason: reason,
        allowStartupRecovery: allowStartupRecovery,
      );
    }();

    _reResolveQueue = run;
    return run;
  }

  Future<void> _reResolveNow({
    required bool forceTranscode,
    bool disableDirectPlay = false,
    required bool isErrorRecovery,
    required bool autoPlayAfterResolve,
    required String reason,
    bool allowStartupRecovery = true,
  }) async {
    // A re-resolve stops the backend, reports the stop and kills the server
    // job, so it is one of the few things that can clear the player's
    // playlist mid-playback. Naming the caller is what tells that apart from
    // a stop the user asked for.
    _diagnosticLogger?.call(
      'Re-resolving for $reason: forceTranscode=$forceTranscode '
      'errorRecovery=$isErrorRecovery live=$_currentItemIsLive '
      'playMethod='
      '${(_currentResolution ?? _lastPlaybackResolution)?.playMethod.name ?? 'none'}',
    );
    final backendPos = _backend?.position ?? Duration.zero;
    // A re-resolve opens a brand new stream. For live that stream starts at
    // zero, so carrying the old playhead forward asks it to resume past its
    // own end and it reports completion the moment it is ready.
    final currentPos = _currentItemIsLive
        ? Duration.zero
        : Duration(
            microseconds: [
              backendPos.inMicroseconds,
              state.position.inMicroseconds,
              _lastKnownPosition.inMicroseconds,
            ].reduce((a, b) => a > b ? a : b),
          );
    _stopProgressTimer();
    final item = queueService.currentItem ?? _lastPlaybackItem;
    final resolution = _currentResolution ?? _lastPlaybackResolution;
    final progressGeneration = _progressGeneration;
    if (progressGeneration != null) {
      _retireProgressGeneration(progressGeneration, currentPos);
    }
    _currentResolution = null;

    // Stop the backend before tearing down the server session so the old
    // player can't fetch segments of a killed transcode and surface a
    // spurious source error. The flag stays set through the whole teardown
    // because the dying player's error events arrive asynchronously.
    _teardownForReResolve = true;
    try {
      await _backend?.stop();
    } catch (_) {}

    if (item != null && resolution != null) {
      final stopReport = _service?.onPlaybackStop(item, resolution, currentPos);
      if (resolution.playMethod == StreamPlayMethod.directPlay) {
        // No server-side job to tear down, so don't delay the restart.
        if (stopReport != null) {
          unawaited(stopReport.catchError((_) {}));
        }
      } else {
        // The server kills the old encoder job on the stop report. The
        // ActiveEncodings delete is the deterministic backstop, since the
        // stop report is skipped for audiobooks and can fail transiently.
        try {
          await Future.wait([
            if (stopReport != null) stopReport,
            if (_service != null) _service!.stopTranscoding(resolution),
          ]).timeout(const Duration(seconds: 3));
        } catch (_) {}
      }
    }

    if (!isErrorRecovery) {
      _lastTrackSwitchReResolveAt = DateTime.now();
      _transcodeSwitchRecoveryConsumed = false;
    }

    try {
      await _playCurrentItem(
        startPosition: currentPos,
        enableDirectPlay: !forceTranscode && !disableDirectPlay,
        enableDirectStream: !forceTranscode,
        autoPlay: autoPlayAfterResolve,
        allowStartupRecovery: allowStartupRecovery,
      );
    } finally {
      _teardownForReResolve = false;
    }
  }

  Future<void> _applyStoredTrackSelections(
    int sessionToken, {
    Duration? restorePosition,
  }) async {
    if (sessionToken != _playbackSessionToken) return;
    final shouldRestore =
        restorePosition != null && restorePosition > Duration.zero;

    // Transcoded/remuxed streams carry only the server-selected audio track
    // (AudioStreamIndex is baked into the stream URL), so applying the
    // Jellyfin ordinal as a player track id would select a nonexistent track.
    if (_audioStreamIndex != null && !_embeddedTracksStripped) {
      final mpvId = _mpvTrackIdForStream(_audioStreamIndex!, 'Audio');
      if (mpvId != null && mpvId > 0) {
        await _backend?.setAudioTrack(mpvId);
        if (sessionToken != _playbackSessionToken) return;
      }
    }
    final isBurnedIn = _isSubtitleBurnedIn(_subtitleStreamIndex);
    if (isBurnedIn) {
      await _resetSubtitleRendererMode();
      await _backend?.disableSubtitleTrack();
    } else if (_subtitleStreamIndex != null && _subtitleStreamIndex! >= 0) {
      final isBitmap = _isSubtitleBitmap(_subtitleStreamIndex!);
      final canRenderBitmap = _backend?.canRenderBitmapSubtitles ?? false;
      if (isBitmap && !canRenderBitmap) {
        if (_subtitleSelectionExplicit &&
            _currentResolution?.playMethod == StreamPlayMethod.directPlay &&
            !_isOfflinePlayback) {
          await _reResolveAtCurrentPosition(forceTranscode: true);
        } else {
          await _resetSubtitleRendererMode();
          await _backend?.disableSubtitleTrack();
        }
      } else {
        await _applySubtitleRendererModeForStream(_subtitleStreamIndex!);
        if (sessionToken != _playbackSessionToken) return;
        final mpvId = _mpvTrackIdForStream(_subtitleStreamIndex!, 'Subtitle');
        if (mpvId != null) {
          await _backend?.setSubtitleTrack(
            mpvId,
            isBitmapSubtitle: isBitmap,
            subtitleCodec: _subtitleCodecForStream(_subtitleStreamIndex!),
            isExternalSubtitle: _isSubtitleDeliveredExternally(
              _subtitleStreamIndex!,
            ),
            externalSubtitleUrl: _externalSubtitleUrlForStream(
              _subtitleStreamIndex!,
            ),
          );
          if (sessionToken != _playbackSessionToken) return;
        }
      }
    } else if (_subtitleStreamIndex == -1) {
      await _resetSubtitleRendererMode();
      await _backend?.disableSubtitleTrack();
    }

    if (shouldRestore) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (sessionToken != _playbackSessionToken) return;
      final pos = _backend?.position ?? state.position;
      final regressedBy = restorePosition - pos;
      if (regressedBy > const Duration(seconds: 2)) {
        await _backend?.seekTo(restorePosition);
      }
    }
  }

  void _waitAndApplyTrackSelections(
    int sessionToken, {
    Duration? restorePosition,
  }) {
    _backend?.waitForTracksReady().then((_) async {
      if (sessionToken != _playbackSessionToken) return;

      // Always wait for external subtitles to load before setting tracks to avoid auto-selection/re-prepare races
      if (_currentResolution?.externalSubtitles.isNotEmpty ?? false) {
        await _externalSubsLoaded;
        if (sessionToken != _playbackSessionToken) return;
      }

      _applyStoredTrackSelections(
        sessionToken,
        restorePosition: restorePosition,
      );
    });
  }

  void _waitAndDisableSubtitles(int sessionToken, {bool force = false}) {
    _backend?.waitForTracksReady().then((_) {
      if (sessionToken != _playbackSessionToken) return;
      if (!force &&
          _subtitleStreamIndex != null &&
          _subtitleStreamIndex! >= 0) {
        return;
      }
      _backend?.disableSubtitleTrack();
    });
  }

  void _waitAndApplyExternalSubtitle(
    int sessionToken,
    StreamResolutionResult resolution,
  ) {
    _waitForTracksAndExternals().then((_) async {
      if (sessionToken != _playbackSessionToken) return;
      final streamIndex = _subtitleStreamIndex;
      if (streamIndex == null || streamIndex < 0) return;
      if (!_isSubtitleDeliveredExternally(streamIndex)) return;
      final mpvId = _mpvTrackIdForStream(streamIndex, 'Subtitle');
      if (mpvId == null) return;
      await _applySubtitleRendererModeForStream(streamIndex);
      if (sessionToken != _playbackSessionToken) return;
      await _backend?.setSubtitleTrack(
        mpvId,
        isBitmapSubtitle: _isSubtitleBitmap(streamIndex),
        subtitleCodec: _subtitleCodecForStream(streamIndex),
        isExternalSubtitle: true,
        externalSubtitleUrl: _externalSubtitleUrlForStream(streamIndex),
      );
    });
  }

  void _waitAndAddExternalSubtitles(
    int sessionToken,
    StreamResolutionResult resolution,
  ) {
    final completer = Completer<void>();
    _externalSubsLoaded = completer.future;
    final backend = _backend;
    if (backend == null) {
      completer.complete();
      return;
    }

    final embeddedSubCount = TrackOrdinalMapper.embeddedSubtitleCount(
      mediaStreams: _currentMediaStreams,
      embeddedStripped: _embeddedSubtitlesUnavailable,
    );
    final subsToAdd = TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: _currentMediaStreams,
      externalSubtitles: resolution.externalSubtitles,
      embeddedStripped: _embeddedSubtitlesUnavailable,
    );

    backend.waitForEmbeddedSubtitleCount(embeddedSubCount).then((_) async {
      if (sessionToken == _playbackSessionToken) {
        for (final sub in subsToAdd) {
          try {
            await backend.addExternalSubtitle(
              _ensureSubtitleApiKey(sub.deliveryUrl),
              title: sub.title,
              language: sub.language,
              codec: sub.codec,
            );
          } catch (_) {}
          if (sessionToken != _playbackSessionToken) break;
        }
      }
      completer.complete();
    });
  }

  Future<void> _waitForTracksAndExternals() async {
    await _backend?.waitForTracksReady();
    await _externalSubsLoaded;
  }

  /// Transcoded/remuxed streams don't carry the source's embedded subtitle
  /// tracks (and carry only the server-selected audio track).
  bool get _embeddedTracksStripped =>
      _currentResolution?.playMethod == StreamPlayMethod.transcode ||
      _currentResolution?.playMethod == StreamPlayMethod.directStream;

  /// Embedded subtitles the player will never see, either because the stream
  /// dropped them or because the player can't read them out of a container in
  /// the first place. Both cases mean the server's external copy is the only
  /// way to get the subtitle on screen.
  bool get _embeddedSubtitlesUnavailable =>
      _embeddedTracksStripped || !(_backend?.demuxesEmbeddedSubtitles ?? true);

  /// The external subtitles that actually get sub-added, in add order.
  List<ExternalSubtitle> get _effectiveExternalSubtitles {
    final resolution = _currentResolution;
    if (resolution == null) return const [];
    return TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: _currentMediaStreams,
      externalSubtitles: resolution.externalSubtitles,
      embeddedStripped: _embeddedSubtitlesUnavailable,
    );
  }

  /// Whether the player sees this subtitle stream as a sub-added external
  /// file (includes embedded streams re-delivered externally under
  /// transcode/directStream), as opposed to a demuxed embedded track.
  bool _isSubtitleDeliveredExternally(int streamIndex) {
    if (_currentResolution == null) return _isSubtitleExternal(streamIndex);
    return _effectiveExternalSubtitles.any(
      (s) => s.streamIndex == streamIndex,
    );
  }

  int? _mpvTrackIdForStream(int streamIndex, String type) =>
      TrackOrdinalMapper.mpvTrackIdForStream(
        streamIndex: streamIndex,
        type: type,
        mediaStreams: _currentMediaStreams,
        externalSubtitles: _currentResolution?.externalSubtitles,
        embeddedStripped: _embeddedSubtitlesUnavailable,
      );

  int? _streamIndexForMpvTrackId(int mpvTrackId, String type) =>
      TrackOrdinalMapper.streamIndexForMpvTrackId(
        mpvTrackId: mpvTrackId,
        type: type,
        mediaStreams: _currentMediaStreams,
        externalSubtitles: _currentResolution?.externalSubtitles,
        embeddedStripped: _embeddedSubtitlesUnavailable,
      );

  Future<void> playOffline(
    String url, {
    Duration startPosition = Duration.zero,
    Duration itemDuration = Duration.zero,
    List<String> queueUrls = const [],
    int startIndex = 0,
    Future<void> Function()? onStop,
    Future<void> Function(String url)? onAutoNext,
  }) async {
    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;
    _lastItemId = null;
    _lastExplicitAudioLanguage = null;
    _lastExplicitAudioIndex = null;
    _lastExplicitAudioTitle = null;
    _lastExplicitSubtitleLanguage = null;
    _lastExplicitSubtitleEnabled = null;
    _audioStreamIndex = null;
    _subtitleStreamIndex = null;
    _isAutoNexting = false;
    _isManualNexting = false;
    suppressAutoNext = false;
    await _stopAndReportCurrent();
    _resetBackendSelectionLock();
    _isOfflinePlayback = true;
    _onOfflineStop = onStop;
    _onOfflineAutoNext = onAutoNext;
    _itemKnownDuration = itemDuration;
    _currentResolution = null;
    _lastKnownPosition = startPosition;

    if (queueUrls.isNotEmpty) {
      queueService.setQueue(queueUrls, startIndex: startIndex);
    } else {
      queueService.setQueue([url]);
    }

    if (itemDuration > Duration.zero) {
      state.setDuration(itemDuration);
    }

    _playbackStartTime = clock();
    _waitingForMedia = true;
    ++_playbackSessionToken;
    final offlineStreams =
        (_offlineMetadataByUrl[url]?['MediaStreams'] as List?)
            ?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    try {
      await _backend!.play(
        _buildBackendMediaPayload(
          url: url,
          mediaStreams: offlineStreams,
          audioStreamIndex: _audioStreamIndex,
          subtitleStreamIndex: _subtitleStreamIndex,
          audioLike: _isAudioLikeItem(url),
        ),
        startPosition: startPosition,
      );
      await _syncBackendRepeatModeIfSupported();
      await _waitForMediaReady(timeout: const Duration(seconds: 5));
    } finally {
      _waitingForMedia = false;
    }

    if (startPosition > Duration.zero) {
      await _seekWhilePausedAndMaybeResume(startPosition);
    }
  }

  Future<bool> _stopAndReportCurrent({
    bool skipQueueChange = false,
    dynamic expectedItem,
    bool releaseServerResources = false,
  }) async {
    final existingStop = _stopInFlight;
    if (existingStop != null) {
      await existingStop;
      return false;
    }

    final stopFuture = (() async {
      if (expectedItem != null &&
          !identical(queueService.currentItem, expectedItem)) {
        return false;
      }
      // The other half of the re-resolve note: between them every app
      // initiated teardown of the player's playlist is now on the record.
      _diagnosticLogger?.call(
        'Stopping playback: live=$_currentItemIsLive '
        'skipQueueChange=$skipQueueChange '
        'releaseServerResources=$releaseServerResources '
        'position=${_lastKnownPosition.inMilliseconds}ms',
      );
      _deferredStartPosition = Duration.zero;
      _deferPlaybackToExternalPlayer = false;
      _endLiveStallWatch();
      _playbackSessionToken++;
      _stopProgressTimer();
      final backend = _backend;
      if (_hasNoActivePlayback(backend)) {
        if (!skipQueueChange) {
          _forceTranscodeForQueue = false;
          _directPlayAllowedForQueue = true;
          _resetBackendSelectionLock();
          queueService.clear();
          state.reset();
          _setBringupState(const PlaybackBringupState.idle());
        }
        return true;
      }
      if (_isOfflinePlayback) {
        if (!skipQueueChange) {
          await _onOfflineStop?.call();
          _onOfflineStop = null;
          _onOfflineAutoNext = null;
        }
        await _backend?.stop();
        _playbackStartTime = null;
        _waitingForMedia = false;
        if (!skipQueueChange) {
          _isOfflinePlayback = false;
          _forceTranscodeForQueue = false;
          _directPlayAllowedForQueue = true;
          _resetBackendSelectionLock();
          queueService.clear();
          state.reset();
          _setBringupState(const PlaybackBringupState.idle());
        }
        return true;
      }
      final item = queueService.currentItem;
      final resolution = _currentResolution ?? _lastPlaybackResolution;
      final reportItem = item ?? _lastPlaybackItem;
      final backendPos = _backend?.position ?? Duration.zero;
      final pos = Duration(
        microseconds: [
          backendPos.inMicroseconds,
          state.position.inMicroseconds,
          _lastKnownPosition.inMicroseconds,
        ].reduce((a, b) => a > b ? a : b),
      );
      final progressGeneration = _progressGeneration;
      if (progressGeneration != null) {
        _retireProgressGeneration(progressGeneration, pos);
      }
      if (reportItem != null && resolution != null) {
        if (progressGeneration != null &&
            identical(progressGeneration.item, reportItem) &&
            identical(progressGeneration.resolution, resolution)) {
          _issuePlaybackStop(progressGeneration);
        } else {
          try {
            unawaited(
              _service
                      ?.onPlaybackStop(reportItem, resolution, pos)
                      .catchError((_) {}) ??
                  Future<void>.value(),
            );
          } catch (_) {}
        }
        if (releaseServerResources &&
            resolution.playMethod != StreamPlayMethod.directPlay) {
          try {
            unawaited(_service?.stopTranscoding(resolution).catchError((_) {}));
          } catch (_) {}
        }
      }
      _currentResolution = null;
      _lastPlaybackItem = null;
      _lastPlaybackResolution = null;
      await _backend?.stop();
      _playbackStartTime = null;
      _waitingForMedia = false;
      if (!skipQueueChange) {
        _forceTranscodeForQueue = false;
        _directPlayAllowedForQueue = true;
        _resetBackendSelectionLock();
        queueService.clear();
        state.reset();
        _setBringupState(const PlaybackBringupState.idle());
      }
      return true;
    })();

    _stopInFlight = stopFuture;
    try {
      return await stopFuture;
    } finally {
      if (identical(_stopInFlight, stopFuture)) {
        _stopInFlight = null;
      }
    }
  }

  void _cleanupPreemptedSession(dynamic item, StreamResolutionResult? resolution) {
    if (item != null && resolution != null) {
      unawaited(_service?.onPlaybackStop(item, resolution, Duration.zero).catchError((_) => null));
    }
  }

  void dispose() {
    _liveRecoveryRetry?.cancel();
    _endLiveStallWatch();
    _stopProgressTimer();
    _disposeStreamSubs();
    _backendChangedController.close();
    _bringupStateController.close();
    _sessionEndedController.close();
    _liveRecoveryStatusController.close();
    for (final backend in _retainedBackends.toList()) {
      backend.dispose();
    }
    _retainedBackends.clear();
    _service?.dispose();
    queueService.dispose();
    state.dispose();
  }

  List<Map<String, dynamic>> _extractMediaStreams(dynamic item) {
    if (item is Map) {
      final streams = item['MediaStreams'] ?? item['mediaStreams'];
      if (streams is List) {
        return streams.cast<Map<String, dynamic>>();
      }
    }
    try {
      final dynamic dyn = item;
      final streams = dyn.mediaStreams;
      if (streams is List) {
        return streams.cast<Map<String, dynamic>>();
      }
    } catch (_) {}
    return const [];
  }

  void _translateTrackSelectionsForNewItem(dynamic item) {
    final newStreams = _extractMediaStreams(item);
    if (newStreams.isEmpty) {
      _audioStreamIndex = null;
      if (_lastExplicitSubtitleEnabled == false) {
        _subtitleStreamIndex = -1;
      } else {
        _subtitleStreamIndex = null;
      }
      return;
    }

    if (_lastExplicitAudioLanguage != null) {
      _audioStreamIndex = _matchStreamIndexByLanguage(
        newStreams,
        _lastExplicitAudioLanguage,
        'Audio',
        preferredIndex: _lastExplicitAudioIndex,
        preferredTitle: _lastExplicitAudioTitle,
      );
    } else {
      _audioStreamIndex = null;
    }

    if (_lastExplicitSubtitleEnabled == false) {
      _subtitleStreamIndex = -1;
    } else if (_lastExplicitSubtitleLanguage != null) {
      _subtitleStreamIndex = _matchStreamIndexByLanguage(
        newStreams,
        _lastExplicitSubtitleLanguage,
        'Subtitle',
      );
    } else {
      _subtitleStreamIndex = null;
    }

    final itemId = MediaStreamResolver.extractItemId(item);
    if (itemId.isNotEmpty) {
      onSubtitleTrackChanged?.call(itemId, _subtitleStreamIndex != null && _subtitleStreamIndex! >= 0 ? _subtitleStreamIndex : null);
      onAudioTrackChanged?.call(itemId, _audioStreamIndex != null && _audioStreamIndex! >= 0 ? _audioStreamIndex : null);
    }
  }
}

enum TransportAction { resume, pause, seek, stop, next, previous }

enum PlaybackStartupRecoveryDecision { retryWithTranscode, abortPlayback }

class PlaybackDecisionContext {
  final dynamic mediaItem;
  final StreamResolutionResult resolution;
  final PlayerBackend backend;
  final Map<String, dynamic> deviceProfile;
  final int? maxStreamingBitrate;
  final int? audioStreamIndex;
  final int? subtitleStreamIndex;

  /// Which client-side gate refused direct play, when one did. Server-side
  /// refusals arrive in [StreamResolutionResult.transcodingReasons] instead.
  final String? clientTranscodeReason;

  const PlaybackDecisionContext({
    required this.mediaItem,
    required this.resolution,
    required this.backend,
    required this.deviceProfile,
    required this.maxStreamingBitrate,
    this.audioStreamIndex,
    this.subtitleStreamIndex,
    this.clientTranscodeReason,
  });
}

class PlaybackStartupFailureContext {
  final StreamResolutionResult resolution;
  final Duration startPosition;
  final Object? error;
  final StackTrace? stackTrace;

  const PlaybackStartupFailureContext({
    required this.resolution,
    required this.startPosition,
    this.error,
    this.stackTrace,
  });
}

/// Thrown from `_playCurrentItem` when a recovery re-resolve's media never
/// becomes ready, so the recovery loop's catch schedules the next attempt
/// instead of treating the re-resolve as a success.
class _MediaNotReadyDuringRecoveryException implements Exception {
  const _MediaNotReadyDuringRecoveryException();

  @override
  String toString() => '_MediaNotReadyDuringRecoveryException: mediaNotReady';
}

class PlaybackStartupRecoveryAbortedException implements Exception {
  const PlaybackStartupRecoveryAbortedException();

  @override
  String toString() =>
      'PlaybackStartupRecoveryAbortedException: startup fallback canceled by user';
}

enum PlaybackBringupPhase {
  idle,
  preparing,
  stoppingPrevious,
  resolving,
  opening,
  waitingForReady,
  seekingResume,
  ready,
  failed,
}

extension PlaybackBringupPhaseX on PlaybackBringupPhase {
  bool get isInProgress => switch (this) {
    PlaybackBringupPhase.preparing ||
    PlaybackBringupPhase.stoppingPrevious ||
    PlaybackBringupPhase.resolving ||
    PlaybackBringupPhase.opening ||
    PlaybackBringupPhase.waitingForReady ||
    PlaybackBringupPhase.seekingResume => true,
    PlaybackBringupPhase.idle ||
    PlaybackBringupPhase.ready ||
    PlaybackBringupPhase.failed => false,
  };
}

class PlaybackBringupState {
  final PlaybackBringupPhase phase;
  final int? sessionToken;
  final String? itemId;
  final String? backend;
  final String? playMethod;
  final String? error;

  const PlaybackBringupState({
    required this.phase,
    this.sessionToken,
    this.itemId,
    this.backend,
    this.playMethod,
    this.error,
  });

  const PlaybackBringupState.idle()
    : phase = PlaybackBringupPhase.idle,
      sessionToken = null,
      itemId = null,
      backend = null,
      playMethod = null,
      error = null;
}

/// Progress of a bounded live recovery in flight, for a screen to show a
/// reconnecting indicator instead of a plain buffering spinner.
class LiveRecoveryStatus {
  final int attempt;
  final int maxAttempts;

  const LiveRecoveryStatus({required this.attempt, required this.maxAttempts});

  @override
  bool operator ==(Object other) =>
      other is LiveRecoveryStatus &&
      other.attempt == attempt &&
      other.maxAttempts == maxAttempts;

  @override
  int get hashCode => Object.hash(attempt, maxAttempts);
}

bool _languagesMatch(Map? stream, String? targetLanguage) {
  if (stream == null || targetLanguage == null) return false;
  final candidateLang = _extractLanguage(stream);
  if (candidateLang == null) return false;

  final normCandidate = _normalizeLanguage(candidateLang);
  final normTarget = _normalizeLanguage(targetLanguage);
  if (normCandidate.isEmpty || normTarget.isEmpty) return false;
  if (normCandidate == 'und' || normTarget == 'und') return false;
  if (normCandidate == normTarget) return true;

  final iso3Candidate = _toIso3(normCandidate);
  final iso3Target = _toIso3(normTarget);
  return iso3Candidate.isNotEmpty && iso3Candidate == iso3Target;
}

int? _matchStreamIndexByLanguage(
  List<Map<String, dynamic>> streams,
  String? lang,
  String type, {
  int? preferredIndex,
  String? preferredTitle,
}) {
  final candidates = streams.where((s) => s['Type'] == type).toList();
  // Tier 1: exact index that also language-matches.
  if (preferredIndex != null) {
    final i = candidates.indexWhere(
      (s) => s['Index'] == preferredIndex && _languagesMatch(s, lang),
    );
    if (i >= 0) return candidates[i]['Index'] as int?;
  }
  // Tier 2: same track name that language-matches (handles track-number shifts).
  if (preferredTitle != null && preferredTitle.isNotEmpty) {
    final normTitle = preferredTitle.trim().toLowerCase();
    final i = candidates.indexWhere(
      (s) =>
          _languagesMatch(s, lang) &&
          _extractTrackTitle(s)?.trim().toLowerCase() == normTitle,
    );
    if (i >= 0) return candidates[i]['Index'] as int?;
  }
  // Tier 3: first stream that language-matches.
  final i = candidates.indexWhere((s) => _languagesMatch(s, lang));
  return i >= 0 ? candidates[i]['Index'] as int? : null;
}

String? _extractLanguage(Map? stream) {
  if (stream == null) return null;
  final lang = stream['Language']?.toString();
  if (lang != null && lang.isNotEmpty && lang.toLowerCase() != 'und') {
    return lang;
  }
  for (final field in const ['Title', 'DisplayTitle']) {
    final title = stream[field]?.toString().toLowerCase();
    if (title != null && title.isNotEmpty) {
      final tokens = title.split(RegExp(r'[^a-z]')).where((t) => t.isNotEmpty);
      for (final token in tokens) {
        if (_kLanguageKeywords.containsKey(token)) {
          return _kLanguageKeywords[token];
        }
      }
    }
  }
  return lang;
}

/// Returns the most descriptive non-empty title for an audio stream,
/// preferring [Title] over [DisplayTitle]. Used to match tracks that have
/// shifted position between episodes (e.g. an alternate-dub track that moved
/// from index 3 to index 4 because the server added another track).
String? _extractTrackTitle(Map<dynamic, dynamic>? stream) {
  if (stream == null) return null;
  final title = stream['Title']?.toString();
  if (title != null && title.isNotEmpty) return title;
  final display = stream['DisplayTitle']?.toString();
  if (display != null && display.isNotEmpty) return display;
  return null;
}

const Map<String, String> _kLanguageKeywords = {
  'arabic': 'ara',
  'ara': 'ara',
  'english': 'eng',
  'eng': 'eng',
  'french': 'fra',
  'fra': 'fra',
  'fre': 'fra',
  'german': 'deu',
  'deu': 'deu',
  'ger': 'deu',
  'spanish': 'spa',
  'spa': 'spa',
  'italian': 'ita',
  'ita': 'ita',
  'japanese': 'jpn',
  'jpn': 'jpn',
  'chinese': 'zho',
  'zho': 'zho',
  'chi': 'zho',
  'portuguese': 'por',
  'por': 'por',
  'russian': 'rus',
  'rus': 'rus',
  'korean': 'kor',
  'kor': 'kor',
  'dutch': 'nld',
  'nld': 'nld',
  'dut': 'nld',
  'swedish': 'swe',
  'swe': 'swe',
  'turkish': 'tur',
  'tur': 'tur',
  'vietnamese': 'vie',
  'vie': 'vie',
  'polish': 'pol',
  'pol': 'pol',
  'hebrew': 'heb',
  'heb': 'heb',
  'hindi': 'hin',
  'hin': 'hin',
};

String _normalizeLanguage(String? language) {
  if (language == null) return '';
  final normalized = language.trim().toLowerCase();
  if (normalized.isEmpty) return '';
  return normalized.split(RegExp(r'[-_]')).first;
}

String _toIso3(String language) {
  if (_kLanguageKeywords.containsKey(language)) return _kLanguageKeywords[language]!;
  if (language.length == 3) return language;
  return _kIso6391To6392[language] ?? language;
}

const Map<String, String> _kIso6391To6392 = {
  'aa': 'aar',
  'ab': 'abk',
  'af': 'afr',
  'ak': 'aka',
  'am': 'amh',
  'an': 'arg',
  'ar': 'ara',
  'as': 'asm',
  'av': 'ava',
  'ae': 'ave',
  'ay': 'aym',
  'az': 'aze',
  'ba': 'bak',
  'bm': 'bam',
  'be': 'bel',
  'bn': 'ben',
  'bh': 'bih',
  'bi': 'bis',
  'bo': 'bod',
  'bs': 'bos',
  'br': 'bre',
  'bg': 'bul',
  'ca': 'cat',
  'cs': 'ces',
  'ch': 'cha',
  'ce': 'che',
  'cu': 'chu',
  'cv': 'chv',
  'kw': 'cor',
  'co': 'cos',
  'cr': 'cre',
  'cy': 'cym',
  'da': 'dan',
  'de': 'deu',
  'dv': 'div',
  'dz': 'dzo',
  'el': 'ell',
  'en': 'eng',
  'eo': 'epo',
  'et': 'est',
  'eu': 'eus',
  'ee': 'ewe',
  'fo': 'fao',
  'fa': 'fas',
  'fj': 'fij',
  'fi': 'fin',
  'fr': 'fra',
  'fy': 'fry',
  'ff': 'ful',
  'gd': 'gla',
  'ga': 'gle',
  'gl': 'glg',
  'gv': 'glv',
  'gn': 'grn',
  'gu': 'guj',
  'ht': 'hat',
  'ha': 'hau',
  'he': 'heb',
  'hz': 'her',
  'hi': 'hin',
  'ho': 'hmo',
  'hr': 'hrv',
  'hu': 'hun',
  'hy': 'hye',
  'ig': 'ibo',
  'is': 'isl',
  'io': 'ido',
  'ii': 'iii',
  'iu': 'iku',
  'ie': 'ile',
  'ia': 'ina',
  'id': 'ind',
  'ik': 'ipk',
  'it': 'ita',
  'jv': 'jav',
  'ja': 'jpn',
  'kl': 'kal',
  'kn': 'kan',
  'ks': 'kas',
  'ka': 'kat',
  'kr': 'kau',
  'kk': 'kaz',
  'km': 'khm',
  'ki': 'kik',
  'rw': 'kin',
  'ky': 'kir',
  'kv': 'kom',
  'kg': 'kon',
  'ko': 'kor',
  'kj': 'kua',
  'ku': 'kur',
  'lo': 'lao',
  'la': 'lat',
  'lv': 'lav',
  'li': 'lim',
  'ln': 'lin',
  'lt': 'lit',
  'lb': 'ltz',
  'lu': 'lub',
  'lg': 'lug',
  'mh': 'mah',
  'ml': 'mal',
  'mr': 'mar',
  'mk': 'mkd',
  'mg': 'mlg',
  'mt': 'mlt',
  'mn': 'mon',
  'mi': 'mri',
  'ms': 'msa',
  'my': 'mya',
  'na': 'nau',
  'nv': 'nav',
  'nr': 'nbl',
  'nd': 'nde',
  'ng': 'ndo',
  'ne': 'nep',
  'nl': 'nld',
  'nn': 'nno',
  'nb': 'nob',
  'no': 'nor',
  'ny': 'nya',
  'oc': 'oci',
  'oj': 'oji',
  'or': 'ori',
  'om': 'orm',
  'os': 'oss',
  'pa': 'pan',
  'pi': 'pli',
  'pl': 'pol',
  'pt': 'por',
  'ps': 'pus',
  'qu': 'que',
  'rm': 'roh',
  'ro': 'ron',
  'rn': 'run',
  'ru': 'rus',
  'sg': 'sag',
  'sa': 'san',
  'sr': 'srp',
  'si': 'sin',
  'sk': 'slk',
  'sl': 'slv',
  'se': 'sme',
  'sm': 'smo',
  'sn': 'sna',
  'sd': 'snd',
  'so': 'som',
  'st': 'sot',
  'es': 'spa',
  'sq': 'sqi',
  'sc': 'srd',
  'ss': 'ssw',
  'su': 'sun',
  'sw': 'swa',
  'sv': 'swe',
  'ty': 'tah',
  'ta': 'tam',
  'tt': 'tat',
  'te': 'tel',
  'tg': 'tgk',
  'tl': 'tgl',
  'th': 'tha',
  'ti': 'tir',
  'to': 'ton',
  'tn': 'tsn',
  'ts': 'tso',
  'tk': 'tuk',
  'tr': 'tur',
  'tw': 'twi',
  'ug': 'uig',
  'uk': 'ukr',
  'ur': 'urd',
  'uz': 'uzb',
  've': 'ven',
  'vi': 'vie',
  'vo': 'vol',
  'wa': 'wln',
  'wo': 'wol',
  'xh': 'xho',
  'yi': 'yid',
  'yo': 'yor',
  'za': 'zha',
  'zh': 'zho',
  'zu': 'zul',
};
