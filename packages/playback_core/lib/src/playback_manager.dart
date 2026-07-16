import 'dart:async';

import 'media_stream_resolver.dart';
import 'playback_arbiter.dart';
import 'player_backend.dart';
import 'player_service.dart';
import 'player_state.dart';
import 'queue_service.dart';
import 'stream_resolution_result.dart';
import 'track_ordinal_mapper.dart';

class PlaybackManager implements AudioOwnable {
  static const _mediaReadyPollInterval = Duration(milliseconds: 100);
  static const _defaultMediaReadyTimeout = Duration(seconds: 60);
  static const _onlineStartupReadyTimeout = Duration(seconds: 15);

  PlayerBackend? _backend;
  MediaStreamResolver? _resolver;
  PlayerService? _service;
  Future<void> Function(dynamic item)? _resolverConfigurator;
  bool Function(List<dynamic> items)? _externalPlaybackDecider;
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
  bool Function(StreamResolutionResult resolution)? _transcodeSelector;
  Duration Function(dynamic item, Duration startPosition)?
  _startPositionAdjuster;
  Future<PlaybackStartupRecoveryDecision> Function(
    PlaybackStartupFailureContext context,
  )?
  _startupRecoveryDecider;
  void Function(PlaybackDecisionContext context)? _playbackDecisionLogger;
  int? Function(List<Map<String, dynamic>> audioStreams, int? explicitIndex)? audioTrackSelector;
  int? Function(List<Map<String, dynamic>> subtitleStreams, List<Map<String, dynamic>> audioStreams, int? explicitIndex)? subtitleTrackSelector;
  final QueueService queueService = QueueService();
  final PlayerState state = PlayerState();
  final Set<PlayerBackend> _retainedBackends = <PlayerBackend>{};
  final List<StreamSubscription> _streamSubs = [];
  Timer? _progressTimer;
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
  int? _pendingItemSubtitleStreamIndex;
  String? _pendingItemMediaSourceId;
  String? _lastItemId;
  String? _lastExplicitAudioLanguage;
  String? _lastExplicitSubtitleLanguage;
  bool? _lastExplicitSubtitleEnabled;
  Duration _lastKnownPosition = Duration.zero;
  Duration _itemKnownDuration = Duration.zero;
  int? _maxBitrateOverrideMbps;
  DateTime? _playbackStartTime;
  bool _waitingForMedia = false;
  SubtitleRendererMode _subtitleRendererMode = SubtitleRendererMode.native;
  bool _isAutoNexting = false;
  bool _isManualNexting = false;
  bool suppressAutoNext = false;
  bool autoAdvanceEnabled = true;
  bool _isOfflinePlayback = false;
  bool _forceTranscodeForQueue = false;
  bool _backendSelectionLockedForSession = false;
  PlayerBackend? _sessionLockedBackend;
  Future<void> Function()? _onOfflineStop;
  Future<void> Function(String url)? _onOfflineAutoNext;
  Map<String, Map<String, dynamic>> _offlineMetadataByUrl = {};
  Future<void>? _stopInFlight;
  int _playbackSessionToken = 0;
  Future<void>? _externalSubsLoaded;
  Duration _deferredStartPosition = Duration.zero;
  bool _deferPlaybackToExternalPlayer = false;
  bool _skipExternalRoutingOnce = false;
  bool _forceExternalPlayerOnce = false;
  bool _forceExternalChooserOnce = false;
  bool _unsupportedAudioRecoveryInFlight = false;
  bool _suppressNextGenericBackendError = false;
  bool _teardownForReResolve = false;
  DateTime? _lastTrackSwitchReResolveAt;
  bool _transcodeSwitchRecoveryConsumed = false;
  Future<void>? _reResolveQueue;
  final _backendChangedController = StreamController<PlayerBackend>.broadcast();
  final _bringupStateController =
      StreamController<PlaybackBringupState>.broadcast();
  final _sessionEndedController = StreamController<void>.broadcast();
  PlaybackBringupState _bringupState = const PlaybackBringupState.idle();

  PlayerBackend? get backend => _backend;
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

  Stream<PlaybackBringupState> get bringupStateStream =>
      _bringupStateController.stream;
  Stream<void> get sessionEndedStream => _sessionEndedController.stream;
  StreamResolutionResult? get currentResolution => _currentResolution;
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
  String? get lastExplicitSubtitleLanguage => _lastExplicitSubtitleLanguage;
  bool? get lastExplicitSubtitleEnabled => _lastExplicitSubtitleEnabled;
  bool get playbackDeferredToExternalPlayer => _deferPlaybackToExternalPlayer;
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
    String? container,
    String? videoRangeType,
    String? mediaType,
    Map<String, String> headers = const {},
    double? normalizationGainDb,
    String? hybridAudioUrl,
  }) {
    final resolvedMediaType = mediaType?.trim().toLowerCase();
    final audioStream = _defaultAudioStream(mediaStreams);
    final videoStream = mediaStreams
        .where((s) => s['Type'] == 'Video')
        .firstOrNull;
    return <String, dynamic>{
      'url': url,
      if (container != null && container.isNotEmpty) 'container': container,
      if (videoRangeType != null && videoRangeType.isNotEmpty)
        'videoRangeType': videoRangeType,
      if (audioStream != null) ...{
        'audioCodec': (audioStream['Codec'] ?? '').toString(),
        'audioProfile': (audioStream['Profile'] ?? '').toString(),
        if (audioStream['Channels'] is int) 'audioChannels': audioStream['Channels'],
        if (audioStream['Index'] is int) 'audioStreamIndex': audioStream['Index'],
      },
      if (videoStream != null && videoStream['DvProfile'] is int)
        'videoDvProfile': videoStream['DvProfile'],
      if (videoStream != null && videoStream['RealFrameRate'] is num)
        'videoFrameRate': (videoStream['RealFrameRate'] as num).toDouble(),
      if (videoStream != null && videoStream['Width'] is int)
        'videoWidth': videoStream['Width'],
      if (videoStream != null && videoStream['Height'] is int)
        'videoHeight': videoStream['Height'],
      if (headers.isNotEmpty) 'headers': headers,
      if (hybridAudioUrl != null && hybridAudioUrl.isNotEmpty)
        'hybridAudioUrl': hybridAudioUrl,
      'mediaType':
          (resolvedMediaType == 'audio' || resolvedMediaType == 'video')
          ? resolvedMediaType
          : MediaStreamResolver.detectMediaType(mediaStreams, fallbackUrl: url),
      'normalizationGainDb':
          normalizationGainDb ??
          MediaStreamResolver.extractNormalizationGainDb(mediaStreams),
    };
  }

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

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    if (reason == RevokeReason.background) {
      final item = queueService.currentItem;
      bool isAudio = false;
      try {
        isAudio = item?.isAudioLike == true;
      } catch (_) {}
      if (!isAudio && item is String) {
        try {
          final meta = currentOfflineMetadata;
          if (meta != null) {
            final type = meta['Type']?.toString();
            final mediaType = meta['MediaType']?.toString();
            isAudio = type == 'Audio' || type == 'AudioBook' || mediaType == 'Audio';
          }
        } catch (_) {}
      }
      if (isAudio) return;
      await pause();
    } else {
      await stop(userInitiated: false);
    }
  }

  void setTranscodeSelector(
    bool Function(StreamResolutionResult resolution)? selector,
  ) {
    _transcodeSelector = selector;
  }

  void setStartPositionAdjuster(
    Duration Function(dynamic item, Duration startPosition)? adjuster,
  ) {
    _startPositionAdjuster = adjuster;
  }

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

  void _resetBackendSelectionLock() {
    _backendSelectionLockedForSession = false;
    _sessionLockedBackend = null;
  }

  Future<bool> Function(TransportAction action, {Duration? position})?
  _transportInterceptor;

  void setTransportInterceptor(
    Future<bool> Function(TransportAction action, {Duration? position})?
    interceptor,
  ) {
    _transportInterceptor = interceptor;
  }

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
      backend.playingStream.listen(state.setPlaying),
      backend.bufferingStream.listen(state.setBuffering),
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
      return;
    }
    if (!autoAdvanceEnabled && !_isPreroll(queueService.currentItem)) {
      _isAutoNexting = true;
      _mediaSourceId = null;
      _stopAndReportCurrent(skipQueueChange: true).whenComplete(() {
        _isAutoNexting = false;
        _notifySessionEnded();
      });
      return;
    }
    if (_playbackStartTime != null &&
        DateTime.now().difference(_playbackStartTime!).inSeconds < 5) {
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
      return;
    }

    final remaining = effectiveDuration - pos;
    if (remaining > const Duration(seconds: 5)) {
      return;
    }

    _isAutoNexting = true;
    _autoNext().whenComplete(() => _isAutoNexting = false);
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
        await _reResolveAtCurrentPosition(isErrorRecovery: true);
      } catch (_) {}
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

    bool canReResolve() =>
        resolution != null &&
        resolution.playMethod != StreamPlayMethod.transcode &&
        !_isOfflinePlayback &&
        !_waitingForMedia &&
        !_unsupportedAudioRecoveryInFlight;

    Future<void> recoverViaTranscode() async {
      _unsupportedAudioRecoveryInFlight = true;
      try {
        await _reResolveAtCurrentPosition(forceTranscode: true);
      } catch (_) {
      } finally {
        _unsupportedAudioRecoveryInFlight = false;
      }
    }

    // Container/source error (e.g. brand-less MP4 that no extractor could read).
    // Only suppress the trailing generic "error" event and recover when we can
    // actually re-resolve; otherwise let the failure surface.
    if (kind == 'unsupported_container') {
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

    if (!canReResolve()) {
      return;
    }
    await recoverViaTranscode();
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
  }) async {
    _clearPendingItemOverrides();
    _lastItemId = null;
    _lastExplicitAudioLanguage = null;
    _lastExplicitSubtitleLanguage = null;
    _lastExplicitSubtitleEnabled = null;
    _isAutoNexting = false;
    _isManualNexting = false;
    suppressAutoNext = false;
    dynamic pendingItem;
    if (items.isNotEmpty) {
      pendingItem = items[startIndex.clamp(0, items.length - 1)];
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
    );
  }

  Future<void> startQueuedPlayback({
    Duration startPosition = Duration.zero,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async {
    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;
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

  Future<void> _playCurrentItem({
    Duration startPosition = Duration.zero,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool allowStartupRecovery = true,
  }) async {
    _deferredStartPosition = Duration.zero;
    _deferPlaybackToExternalPlayer = false;

    if (_forceTranscodeForQueue) {
      enableDirectPlay = false;
      enableDirectStream = false;
      enableTranscoding = true;
    }

    final item = queueService.currentItem;
    if (item == null || _backend == null) {
      _setBringupState(const PlaybackBringupState.idle());
      return;
    }

    final lockedBackend = _sessionLockedBackend;
    if (_backendSelectionLockedForSession &&
        lockedBackend != null &&
        !identical(_backend, lockedBackend)) {
      setBackend(lockedBackend, disposePrevious: false);
    }

    _lastKnownPosition = Duration.zero;
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
    if (_maxBitrateOverrideMbps != null) {
      profile['MaxStreamingBitrate'] = _maxBitrateOverrideMbps! * 1000000;
    }
    final maxBitrate = profile['MaxStreamingBitrate'] as int?;

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
        resolution.playMethod != StreamPlayMethod.transcode &&
        transcodeSelector(resolution)) {
      await _playCurrentItem(
        startPosition: startPosition,
        enableDirectPlay: false,
        enableDirectStream: false,
        enableTranscoding: true,
        allowStartupRecovery: allowStartupRecovery,
      );
      return;
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
        );
        return;
      } finally {
        _reResolvingForTrackMatch = false;
      }
    }

    _currentResolution = resolution;
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
          ),
        );
      } catch (_) {}
    }

    if (_itemKnownDuration > Duration.zero) {
      state.setDuration(_itemKnownDuration);
    }

    _playbackStartTime = DateTime.now();
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
        container: resolution.container,
        videoRangeType: resolution.videoRangeType,
        mediaType: resolution.mediaType,
        headers: resolution.requestHeaders,
        normalizationGainDb: resolution.normalizationGainDb,
        hybridAudioUrl: resolution.hybridAudioUrl,
      );
      await _arbiter?.acquire(AudioProducer.mainPlayback);
      if (sessionToken != _playbackSessionToken) {
        _cleanupPreemptedSession(item, resolution);
        return;
      }
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
      _waitingForMedia = false;
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
        final forceTranscodeFallback =
            enableTranscoding &&
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
      await _seekWhilePausedAndResume(startPosition);
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
        final isBurnedIn =
            (_isSubtitleBitmap(_subtitleStreamIndex!) &&
             !(_backend?.canRenderBitmapSubtitles ?? false)) ||
            resolution.streamUrl.toLowerCase().contains('subtitlemethod=encode');
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
  }

  void _startProgressTimer() {
    _stopProgressTimer();
    _progressTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      final item = queueService.currentItem;
      final resolution = _currentResolution;
      if (item == null || resolution == null) return;
      _service?.onPlaybackProgress(
        item,
        resolution,
        state.position,
        isPaused: !state.isPlaying,
        audioStreamIndex: _audioStreamIndex,
        subtitleStreamIndex: _subtitleStreamIndex,
      );
    });
  }

  void _stopProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = null;
  }

  Future<void> resume() async {
    if (await _maybeIntercept(TransportAction.resume)) return;
    await _backend?.resume();
  }

  Future<void> pause() async {
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

  Future<void> _seekWhilePausedAndResume(Duration position) async {
    await _backend!.seekTo(position);
    for (var i = 0; i < 50; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if ((_backend!.position - position).abs() < const Duration(seconds: 10)) {
        break;
      }
    }
    await _backend!.resume();
  }

  Future<void> stop({bool userInitiated = true}) async {
    if (userInitiated && await _maybeIntercept(TransportAction.stop)) return;
    await _stopAndReportCurrent();
  }

  Future<void> seekTo(Duration position) async {
    if (await _maybeIntercept(TransportAction.seek, position: position)) return;
    _lastKnownPosition = position;
    await _backend?.seekTo(position);
  }

  Future<void> setPlaybackSpeed(double speed) async {
    await _backend?.setPlaybackSpeed(speed);
    state.setPlaybackSpeed(speed);
  }

  Future<void> next() async {
    if (await _maybeIntercept(TransportAction.next)) return;
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
    if (state.position.inSeconds > 3) {
      await seekTo(Duration.zero);
      return;
    }
    _mediaSourceId = null;
    await _stopAndReportCurrent(skipQueueChange: true);
    _resetBackendSelectionLock();
    final hadPrevious = queueService.previous();
    if (hadPrevious) {
      await _playCurrentItem();
    }
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

  Future<void> changeAudioTrack(int streamIndex) => _withProgressPaused(() async {
    _audioStreamIndex = streamIndex;
    _audioSelectionExplicit = true;

    final currentItem = queueService.currentItem;
    if (currentItem != null) {
      final itemId = MediaStreamResolver.extractItemId(currentItem);
      onAudioTrackChanged?.call(itemId, streamIndex >= 0 ? streamIndex : null);
    }

    final streams = _currentMediaStreams;
    if (streams.isNotEmpty) {
      final selectedStream = streams.firstWhere(
        (s) => s['Type'] == 'Audio' && s['Index'] == streamIndex,
        orElse: () => const <String, dynamic>{},
      );
      if (selectedStream.isNotEmpty) {
        _lastExplicitAudioLanguage = _extractLanguage(selectedStream);
      }
    }

    if (_isOfflinePlayback) {
      final mpvId = _mpvTrackIdForStream(streamIndex, 'Audio');
      if (mpvId != null) {
        await _backend?.setAudioTrack(mpvId);
      } else {
        _waitAndApplyTrackSelections(_playbackSessionToken);
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

  Future<void> changeSubtitleTrack(int streamIndex) =>
      _withProgressPaused(() => _changeSubtitleTrackInner(streamIndex));

  Future<void> _changeSubtitleTrackInner(int streamIndex) async {
    final previousSubtitleStreamIndex = _subtitleStreamIndex;
    final isBitmap = _isSubtitleBitmap(streamIndex);
    _subtitleStreamIndex = streamIndex;

    final currentItem = queueService.currentItem;
    if (currentItem != null) {
      final itemId = MediaStreamResolver.extractItemId(currentItem);
      onSubtitleTrackChanged?.call(itemId, streamIndex >= 0 ? streamIndex : null);
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
      final previousWasBurned =
          (previousSubtitleStreamIndex != null &&
           previousSubtitleStreamIndex >= 0 &&
           _isSubtitleBitmap(previousSubtitleStreamIndex) &&
           !(_backend?.canRenderBitmapSubtitles ?? false)) ||
          (_currentResolution?.streamUrl.toLowerCase().contains('subtitlemethod=encode') ?? false);
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
    final previousWasBurned =
        _currentResolution?.streamUrl.toLowerCase().contains('subtitlemethod=encode') ?? false;
    _subtitleStreamIndex = -1;
    _lastExplicitSubtitleEnabled = false;
    _lastExplicitSubtitleLanguage = null;
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
    bool isErrorRecovery = false,
  }) {
    final previous = _reResolveQueue;
    final run = () async {
      if (previous != null) {
        try {
          await previous;
        } catch (_) {}
      }
      await _reResolveNow(
        forceTranscode: forceTranscode,
        isErrorRecovery: isErrorRecovery,
      );
    }();
    _reResolveQueue = run;
    return run;
  }

  Future<void> _reResolveNow({
    required bool forceTranscode,
    required bool isErrorRecovery,
  }) async {
    final backendPos = _backend?.position ?? Duration.zero;
    final currentPos = Duration(
      microseconds: [
        backendPos.inMicroseconds,
        state.position.inMicroseconds,
        _lastKnownPosition.inMicroseconds,
      ].reduce((a, b) => a > b ? a : b),
    );
    _stopProgressTimer();
    final item = queueService.currentItem ?? _lastPlaybackItem;
    final resolution = _currentResolution ?? _lastPlaybackResolution;
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
        enableDirectPlay: !forceTranscode,
        enableDirectStream: !forceTranscode,
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
    final isBurnedIn = _currentResolution?.streamUrl.toLowerCase().contains('subtitlemethod=encode') ?? false;
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
      embeddedStripped: _embeddedTracksStripped,
    );
    final subsToAdd = TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: _currentMediaStreams,
      externalSubtitles: resolution.externalSubtitles,
      embeddedStripped: _embeddedTracksStripped,
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

  /// The external subtitles that actually get sub-added, in add order.
  List<ExternalSubtitle> get _effectiveExternalSubtitles {
    final resolution = _currentResolution;
    if (resolution == null) return const [];
    return TrackOrdinalMapper.effectiveExternalSubtitles(
      mediaStreams: _currentMediaStreams,
      externalSubtitles: resolution.externalSubtitles,
      embeddedStripped: _embeddedTracksStripped,
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
        embeddedStripped: _embeddedTracksStripped,
      );

  int? _streamIndexForMpvTrackId(int mpvTrackId, String type) =>
      TrackOrdinalMapper.streamIndexForMpvTrackId(
        mpvTrackId: mpvTrackId,
        type: type,
        mediaStreams: _currentMediaStreams,
        externalSubtitles: _currentResolution?.externalSubtitles,
        embeddedStripped: _embeddedTracksStripped,
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

    _playbackStartTime = DateTime.now();
    _waitingForMedia = true;
    ++_playbackSessionToken;
    final offlineStreams =
        (_offlineMetadataByUrl[url]?['MediaStreams'] as List?)
            ?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    try {
      await _backend!.play(
        _buildBackendMediaPayload(url: url, mediaStreams: offlineStreams),
        startPosition: startPosition,
      );
      await _syncBackendRepeatModeIfSupported();
      await _waitForMediaReady(timeout: const Duration(seconds: 5));
    } finally {
      _waitingForMedia = false;
    }

    if (startPosition > Duration.zero) {
      await _seekWhilePausedAndResume(startPosition);
    }
  }

  Future<void> _stopAndReportCurrent({bool skipQueueChange = false}) async {
    final existingStop = _stopInFlight;
    if (existingStop != null) {
      await existingStop;
      return;
    }

    final stopFuture = (() async {
      _deferredStartPosition = Duration.zero;
      _deferPlaybackToExternalPlayer = false;
      _playbackSessionToken++;
      _stopProgressTimer();
      final backend = _backend;
      if (_hasNoActivePlayback(backend)) {
        if (!skipQueueChange) {
          _forceTranscodeForQueue = false;
          _resetBackendSelectionLock();
          queueService.clear();
          state.reset();
          _setBringupState(const PlaybackBringupState.idle());
        }
        return;
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
          _resetBackendSelectionLock();
          queueService.clear();
          state.reset();
          _setBringupState(const PlaybackBringupState.idle());
        }
        return;
      }
      final item = queueService.currentItem;
      final resolution = _currentResolution ?? _lastPlaybackResolution;
      final reportItem = item ?? _lastPlaybackItem;
      if (reportItem != null && resolution != null) {
        final backendPos = _backend?.position ?? Duration.zero;
        final pos = Duration(
          microseconds: [
            backendPos.inMicroseconds,
            state.position.inMicroseconds,
            _lastKnownPosition.inMicroseconds,
          ].reduce((a, b) => a > b ? a : b),
        );
        unawaited(_service?.onPlaybackStop(reportItem, resolution, pos).catchError((_) => null));
      }
      _currentResolution = null;
      _lastPlaybackItem = null;
      _lastPlaybackResolution = null;
      await _backend?.stop();
      _playbackStartTime = null;
      _waitingForMedia = false;
      if (!skipQueueChange) {
        _forceTranscodeForQueue = false;
        _resetBackendSelectionLock();
        queueService.clear();
        state.reset();
        _setBringupState(const PlaybackBringupState.idle());
      }
    })();

    _stopInFlight = stopFuture;
    try {
      await stopFuture;
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
    _stopProgressTimer();
    _disposeStreamSubs();
    _backendChangedController.close();
    _bringupStateController.close();
    _sessionEndedController.close();
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

  const PlaybackDecisionContext({
    required this.mediaItem,
    required this.resolution,
    required this.backend,
    required this.deviceProfile,
    required this.maxStreamingBitrate,
    this.audioStreamIndex,
    this.subtitleStreamIndex,
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

class PlaybackStartupRecoveryAbortedException implements Exception {
  const PlaybackStartupRecoveryAbortedException();

  @override
  String toString() =>
      'PlaybackStartupRecoveryAbortedException: startup fallback canceled by user';
}

enum PlaybackBringupPhase {
  idle,
  stoppingPrevious,
  resolving,
  opening,
  waitingForReady,
  seekingResume,
  ready,
  failed,
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

int? _matchStreamIndexByLanguage(List<Map<String, dynamic>> streams, String? lang, String type) {
  final candidates = streams.where((s) => s['Type'] == type).toList();
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
