import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import '../preference/user_preferences.dart';
import '../ui/navigation/app_router.dart';
import '../ui/navigation/destinations.dart';
import 'syncplay_state.dart';
import 'time_sync_manager.dart';

class SyncPlayManager extends ChangeNotifier {
  static const int _pingIntervalMs = 15000;
  static const int _commandLeadToleranceMs = 120;
  static const int _commandLateToleranceMs = 300;
  static const int _maxLateCatchUpMs = 15000;
  static const int _maxSeekDeltaMs = 6 * 60 * 60 * 1000;
  static const int _bufferingDebounceMs = 350;
  static const int _readyDebounceMs = 900;
  static const int _readyStabilityWindowMs = 400;
  // Buffering emitted this soon after a programmatic seek/resume is the seek
  // itself, not a stall. Reporting it would bounce the whole group into
  // Waiting because the server has no rate limit on buffering reports.
  static const int _bufferingSuppressionMs = 2500;
  // Half the server's MaxPlaybackOffset: close enough that skipping the seek
  // keeps us inside the server's tolerance.
  static const int _seekToleranceMs = 250;
  static const int _handshakeRetryDelayMs = 1200;
  static const int _maxHandshakeRetries = 3;
  static const double _defaultSpeed = 1.0;

  final PlaybackManager _playbackManager;
  final UserPreferences _preferences;

  final Logger _logger = Logger();

  SyncPlayState _state = SyncPlayState();
  List<SyncPlayGroupInfo> _availableGroups = const [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _ignoreWaitEnabled = false;

  TimeSyncManager? _timeSync;
  Timer? _pingTimer;
  Timer? _scheduledTimer;
  Timer? _bufferingTimer;
  Timer? _readyTimer;
  Timer? _driftTimer;
  Timer? _seekDebounceTimer;
  Timer? _queueSyncDebounceTimer;
  Duration? _pendingSeekTarget;

  StreamSubscription<bool>? _bufferingSub;
  StreamSubscription<void>? _queueChangedSub;
  bool _applyingRemoteCommand = false;
  final Map<String, String> _itemTitleCache = {};
  final Set<String> _pendingTitleLookups = {};

  final StreamController<SyncPlayUiEvent> _uiEventsController =
      StreamController<SyncPlayUiEvent>.broadcast();

  /// Transient one-shot UI events (toasts, dialogs) that the app shell can
  /// surface without requiring direct knowledge of SyncPlay state.
  Stream<SyncPlayUiEvent> get uiEvents => _uiEventsController.stream;

  String? _activeServerId;
  MediaServerClient? _currentClientRef;
  String? _lastCommandKey;
  int _lastSyncPositionMs = 0;
  int _lastSyncTimeMs = 0;
  bool _isBuffering = false;
  int _suppressBufferingUntilMs = 0;
  Timer? _suppressedBufferingRecheckTimer;

  SyncPlayManager(
    this._playbackManager,
    this._preferences,
  );

  SyncPlayState get state => _state;
  List<SyncPlayGroupInfo> get availableGroups => _availableGroups;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get ignoreWaitEnabled => _ignoreWaitEnabled;
  TimeSyncManager? get timeSyncManager => _timeSync;

  bool get syncPlayConfigured =>
      _preferences.get(UserPreferences.syncPlayEnabled);

  bool get syncPlayServerSupported {
    final client = _currentClient;
    if (client == null) return false;
    return client.serverType == ServerType.jellyfin &&
        client.syncPlayApi != null;
  }

  bool get syncPlayEnabled => syncPlayConfigured && syncPlayServerSupported;

  bool get advancedCorrectionEnabled =>
      _preferences.get(UserPreferences.syncPlayAdvancedCorrectionEnabled);

  bool get syncCorrectionEnabled =>
      advancedCorrectionEnabled &&
      _preferences.get(UserPreferences.syncPlayEnableSyncCorrection);

  bool get useSpeedToSync =>
      _preferences.get(UserPreferences.syncPlayUseSpeedToSync);

  bool get useSkipToSync =>
      _preferences.get(UserPreferences.syncPlayUseSkipToSync);

  int get minDelaySpeedToSync =>
      _preferences.get(UserPreferences.syncPlayMinDelaySpeedToSync).toInt();

  int get maxDelaySpeedToSync =>
      _preferences.get(UserPreferences.syncPlayMaxDelaySpeedToSync).toInt();

  int get speedToSyncDuration =>
      _preferences.get(UserPreferences.syncPlaySpeedToSyncDuration).toInt();

  int get minDelaySkipToSync =>
      _preferences.get(UserPreferences.syncPlayMinDelaySkipToSync).toInt();

  int get extraTimeOffset =>
      _preferences.get(UserPreferences.syncPlayExtraTimeOffset).toInt();

  MediaServerClient? get _currentClient {
    if (_currentClientRef != null) return _currentClientRef;
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      return factory.getActiveClient();
    } catch (_) {
      return null;
    }
  }

  SyncPlayApi? get _api => _currentClient?.syncPlayApi;

  /// Returns a cached display title for a SyncPlay queue item id, kicking off
  /// a background resolution via the items API on the first miss.
  String? itemTitleFor(String itemId) {
    if (itemId.isEmpty) return null;
    final cached = _itemTitleCache[itemId];
    if (cached != null) return cached;
    if (_pendingTitleLookups.add(itemId)) {
      unawaited(_fetchItemTitle(itemId));
    }
    return null;
  }

  Future<void> _fetchItemTitle(String itemId) async {
    try {
      final client = _currentClient;
      if (client == null) return;
      final result = await client.itemsApi.getItem(itemId);
      final name = result['Name'] as String?;
      if (name != null && name.isNotEmpty) {
        _itemTitleCache[itemId] = name;
        notifyListeners();
      }
    } catch (_) {
      // Leave the entry pending so a future retry from the UI can try again.
      _pendingTitleLookups.remove(itemId);
    }
  }

  void setActiveClient(MediaServerClient? client) {
    final newId = client?.baseUrl;
    if (_activeServerId == newId) return;
    _activeServerId = newId;
    _currentClientRef = client;
    if (_state.enabled) {
      _resetState();
    }
  }

  void _setLoading(bool value) {
    if (_isLoading == value) return;
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> fetchGroups() async {
    if (!syncPlayEnabled) {
      _availableGroups = const [];
      notifyListeners();
      return;
    }
    final api = _api;
    if (api == null) return;
    _setLoading(true);
    _errorMessage = null;
    try {
      _availableGroups = await api.getGroups();
    } catch (e) {
      _errorMessage = 'Failed to load groups';
      _logger.w('SyncPlay fetchGroups failed', error: e);
    }
    _setLoading(false);
  }

  Future<void> createGroup(
    String name, {
    bool withCurrentQueueSnapshot = true,
  }) async {
    if (!syncPlayEnabled) {
      _setError('SyncPlay is currently unavailable');
      return;
    }
    final api = _api;
    if (api == null) return;
    _setLoading(true);
    _errorMessage = null;
    try {
      await api.createGroup(name);
      _state.enabled = true;
      _startTimeSync();
      _startPingLoop();
      _attachPlaybackObservers();
      if (withCurrentQueueSnapshot) {
        await syncCurrentPlaybackQueueToGroup();
      }
    } catch (e) {
      _errorMessage = 'Failed to create group';
      _logger.w('SyncPlay createGroup failed', error: e);
    }
    _setLoading(false);
  }

  Future<void> joinGroup(
    String groupId, {
    bool withCurrentQueueSnapshot = false,
  }) async {
    if (!syncPlayEnabled) {
      _setError('SyncPlay is currently unavailable');
      return;
    }
    final api = _api;
    if (api == null) return;
    _setLoading(true);
    _errorMessage = null;
    try {
      await api.joinGroup(groupId);
      _state.enabled = true;
      _startTimeSync();
      _startPingLoop();
      _attachPlaybackObservers();
      if (withCurrentQueueSnapshot) {
        await syncCurrentPlaybackQueueToGroup();
      }
    } catch (e) {
      _errorMessage = 'Failed to join group';
      _logger.w('SyncPlay joinGroup failed', error: e);
    }
    _setLoading(false);
  }

  Future<void> leaveGroup() async {
    final api = _api;
    if (api != null) {
      try {
        await api.leaveGroup();
      } catch (_) {}
    }
    _resetState();
  }

  void _resetState() {
    _state = SyncPlayState();
    _stopTimeSync();
    _stopPingLoop();
    _stopPlaybackObservers();
    _scheduledTimer?.cancel();
    _scheduledTimer = null;
    _driftTimer?.cancel();
    _driftTimer = null;
    _lastCommandKey = null;
    _lastSyncPositionMs = 0;
    _lastSyncTimeMs = 0;
    _restorePlaybackRate();
    notifyListeners();
  }

  void _startTimeSync() {
    final api = _api;
    if (api == null) return;
    _stopTimeSync();
    final tsm = TimeSyncManager(api);
    _timeSync = tsm;
    tsm.startSync();
  }

  void _stopTimeSync() {
    _timeSync?.stopSync();
    _timeSync = null;
  }

  void _startPingLoop() {
    _stopPingLoop();
    _pingTimer = Timer.periodic(
      const Duration(milliseconds: _pingIntervalMs),
      (_) async {
        if (!_state.enabled) return;
        final rtt = _timeSync?.roundTripTime ?? 0;
        try {
          await _api?.sendPing(rtt);
        } catch (_) {}
      },
    );
  }

  void _stopPingLoop() {
    _pingTimer?.cancel();
    _pingTimer = null;
  }

  void appDidEnterBackground() {
    _stopTimeSync();
    _stopPingLoop();
  }

  void appDidBecomeActive() {
    if (!_state.enabled || !syncPlayEnabled) return;
    _startTimeSync();
    _startPingLoop();
    _attachPlaybackObservers();
  }

  void handleRealtimeConnected() {
    if (!_state.enabled || !syncPlayEnabled) return;
    _refreshCurrentGroupStateAfterReconnect();
  }

  void handleRealtimeSessionInterrupted(String message) {
    _errorMessage = message;
    _resetState();
  }

  Future<void> _refreshCurrentGroupStateAfterReconnect() async {
    final groupId = _state.groupId;
    final api = _api;
    if (groupId == null || groupId.isEmpty || api == null) return;
    try {
      final group = await api.getGroup(groupId);
      _state.groupId = group.groupId;
      _state.groupName = group.groupName;
      _state.participants = group.participants;
      _state.lastUpdateAt = group.lastUpdatedAt;
      if (group.state != null) _state.groupState = group.state!;
      _reconcileLocalPlayback();
      notifyListeners();
    } catch (_) {
      try {
        final groups = await api.getGroups();
        final match = groups.firstWhere(
          (g) => g.groupId == groupId,
          orElse: () => const SyncPlayGroupInfo(groupId: ''),
        );
        if (match.groupId.isEmpty) {
          _resetState();
          return;
        }
        _state.groupName = match.groupName;
        _state.participants = match.participants;
        _state.lastUpdateAt = match.lastUpdatedAt;
        if (match.state != null) _state.groupState = match.state!;
        _reconcileLocalPlayback();
        notifyListeners();
      } catch (_) {
        _errorMessage = 'Failed to recover SyncPlay state';
        notifyListeners();
      }
    }
  }

  void _reconcileLocalPlayback() {
    final pm = _playbackManager;
    // Waiting is a transient handshake state: the server sends an explicit
    // Pause when it wants clients paused, so pausing here would fight the
    // in-flight Unpause. These calls also shouldn't bounce through the
    // transport interceptor back into SyncPlay requests.
    _applyingRemoteCommand = true;
    try {
      switch (_state.groupState) {
        case SyncPlayGroupState.paused:
          if (pm.state.isPlaying) pm.pause();
          break;
        case SyncPlayGroupState.playing:
          if (!pm.state.isPlaying) pm.resume();
          break;
        case SyncPlayGroupState.waiting:
        case SyncPlayGroupState.idle:
          break;
      }
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  void handlePlaybackCommand(SyncPlayCommand command) {
    if (!_state.enabled || !syncPlayEnabled) return;
    final groupId = _state.groupId;
    if (groupId != null && groupId.isNotEmpty && command.groupId != groupId) {
      return;
    }
    final currentItemId = _state.currentPlaylistItemId;
    if (command.playlistItemId != null &&
        currentItemId != null &&
        currentItemId.isNotEmpty &&
        command.playlistItemId != currentItemId) {
      return;
    }
    final key = command.dedupeKey;
    if (key == _lastCommandKey) return;
    _lastCommandKey = key;

    switch (command.command) {
      case SyncPlayCommandType.unpause:
        _handleUnpause(command);
        break;
      case SyncPlayCommandType.pause:
        _handlePause(command);
        break;
      case SyncPlayCommandType.seek:
        _handleSeek(command);
        break;
      case SyncPlayCommandType.stop:
        _handleStop();
        break;
    }
  }

  void handleGroupUpdate(SyncPlayGroupUpdate update) {
    if (!syncPlayEnabled) return;
    switch (update.type) {
      case SyncPlayGroupUpdateType.groupJoined:
        final payload = update.payload as SyncPlayGroupJoinedPayload;
        final info = payload.info;
        _state.enabled = true;
        _state.groupId = info.groupId;
        _state.groupName = info.groupName;
        _state.participants = info.participants;
        _state.lastUpdateAt = info.lastUpdatedAt;
        if (info.state != null) _state.groupState = info.state!;
        _startTimeSync();
        _startPingLoop();
        _attachPlaybackObservers();
        notifyListeners();
        break;
      case SyncPlayGroupUpdateType.groupLeft:
        _resetState();
        break;
      case SyncPlayGroupUpdateType.notInGroup:
        _errorMessage = 'You are no longer in a SyncPlay group';
        _resetState();
        break;
      case SyncPlayGroupUpdateType.groupDoesNotExist:
        _errorMessage = 'That SyncPlay group no longer exists';
        _resetState();
        break;
      case SyncPlayGroupUpdateType.libraryAccessDenied:
        _errorMessage =
            'You do not have access to one or more items in this group';
        _uiEventsController
            .add(const SyncPlayUiEvent.libraryAccessDenied());
        _resetState();
        break;
      case SyncPlayGroupUpdateType.stateUpdate:
        final payload = update.payload as SyncPlayStateUpdatePayload;
        _state.groupState = payload.update.state;
        notifyListeners();
        break;
      case SyncPlayGroupUpdateType.playQueue:
        final payload = update.payload as SyncPlayPlayQueuePayload;
        _applyQueueUpdate(payload.update);
        notifyListeners();
        break;
      case SyncPlayGroupUpdateType.userJoined:
        final payload = update.payload as SyncPlayUserJoinedPayload;
        if (!_state.participants.contains(payload.userName)) {
          _state.participants = [..._state.participants, payload.userName];
          _uiEventsController
              .add(SyncPlayUiEvent.userJoined(payload.userName));
          notifyListeners();
        }
        break;
      case SyncPlayGroupUpdateType.userLeft:
        final payload = update.payload as SyncPlayUserLeftPayload;
        final updated = _state.participants
            .where((p) => p != payload.userName)
            .toList();
        if (updated.length != _state.participants.length) {
          _state.participants = updated;
          _uiEventsController
              .add(SyncPlayUiEvent.userLeft(payload.userName));
          notifyListeners();
        }
        break;
    }
  }

  void _applyQueueUpdate(SyncPlayPlayQueueUpdate update) {
    final previousPlaylistItemId = _state.currentPlaylistItemId;
    _state.queue = update.playlist;
    _state.currentItemIndex = update.playingItemIndex;
    final idx = update.playingItemIndex;
    _state.currentPlaylistItemId =
        (idx >= 0 && idx < update.playlist.length)
            ? update.playlist[idx].playlistItemId
            : null;
    _state.repeatMode = update.repeatMode;
    _state.shuffleMode = update.shuffleMode;
    _state.lastUpdateAt = update.lastUpdate;

    final reason = update.reason;
    final isItemSwitch = reason == SyncPlayQueueUpdateReason.newPlaylist ||
        reason == SyncPlayQueueUpdateReason.setCurrentItem ||
        reason == SyncPlayQueueUpdateReason.nextItem ||
        reason == SyncPlayQueueUpdateReason.previousItem ||
        previousPlaylistItemId != _state.currentPlaylistItemId;
    if (!isItemSwitch) return;

    final targetPlaylistItemId = _state.currentPlaylistItemId;
    final targetItemId = (idx >= 0 && idx < update.playlist.length)
        ? update.playlist[idx].itemId
        : null;
    final startMs = SyncPlayUtils.ticksToMs(update.startPositionTicks);
    final shouldAutoPlay = update.isPlaying;

    final localCurrentItemId =
        _itemId(_playbackManager.queueService.currentItem);
    final hasActivePlayer = _playbackManager.currentResolution != null;
    final needsRemoteLoad = targetItemId != null &&
        (targetItemId != localCurrentItemId || !hasActivePlayer);
    if (needsRemoteLoad) {
      unawaited(_loadRemoteQueueLocally(
        update: update,
        startMs: startMs,
        shouldAutoPlay: shouldAutoPlay,
        targetPlaylistItemId: targetPlaylistItemId,
      ));
      return;
    }

    Timer(const Duration(milliseconds: 750), () {
      if (!_state.enabled) return;
      if (_state.currentPlaylistItemId != targetPlaylistItemId) return;
      _applyingRemoteCommand = true;
      try {
        if (startMs > 0) {
          _armBufferingSuppression();
          _playbackManager.seekTo(Duration(milliseconds: startMs));
        }
        if (!shouldAutoPlay && _playbackManager.state.isPlaying) {
          _playbackManager.pause();
        }
      } finally {
        _applyingRemoteCommand = false;
      }
    });
  }

  Future<void> _loadRemoteQueueLocally({
    required SyncPlayPlayQueueUpdate update,
    required int startMs,
    required bool shouldAutoPlay,
    required String? targetPlaylistItemId,
  }) async {
    final client = _currentClient;
    if (client == null) return;
    final serverId = _resolveActiveServerId(client);
    if (serverId == null) return;

    final loaded = await Future.wait(update.playlist.map((entry) async {
      try {
        final raw = await client.itemsApi.getItem(entry.itemId);
        return AggregatedItem(
          id: entry.itemId,
          serverId: serverId,
          rawData: raw,
        );
      } catch (_) {
        return null;
      }
    }));
    final items = loaded.whereType<AggregatedItem>().toList(growable: false);
    if (items.isEmpty) return;
    if (!_state.enabled) return;
    if (_state.currentPlaylistItemId != targetPlaylistItemId) return;

    final startIndex = update.playingItemIndex < 0
        ? 0
        : (update.playingItemIndex >= items.length
            ? items.length - 1
            : update.playingItemIndex);

    _applyingRemoteCommand = true;
    try {
      _armBufferingSuppression();
      await _playbackManager.playItems(
        items,
        startIndex: startIndex,
        startPosition: Duration(milliseconds: startMs),
      );
      if (!shouldAutoPlay) {
        await _playbackManager.pause();
      }
      _ensurePlayerRouteForItem(items[startIndex]);
    } catch (e) {
      _logger.w('SyncPlay failed to load remote queue', error: e);
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  void _ensurePlayerRouteForItem(AggregatedItem item) {
    final currentPath =
        appRouter.routerDelegate.currentConfiguration.uri.path;
    if (currentPath == Destinations.videoPlayer ||
        currentPath == Destinations.audioPlayer) {
      return;
    }
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio = item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
    appRouter.push(
      isAudio ? Destinations.audioPlayer : Destinations.videoPlayer,
    );
  }

  String? _resolveActiveServerId(MediaServerClient client) {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      final entries = factory.clients.entries;
      for (final entry in entries) {
        if (identical(entry.value, client)) return entry.key;
      }
    } catch (_) {}
    return null;
  }

  void _handleUnpause(SyncPlayCommand command) {
    final tsm = _timeSync;
    if (tsm == null) return;
    final serverNow = tsm.getServerTimeNow();
    final targetMs = command.whenUtcMs;
    final delayMs = targetMs - serverNow;

    final positionMs =
        _clampedPositionMs(SyncPlayUtils.ticksToMs(command.positionTicks));
    _lastSyncPositionMs = positionMs;
    _lastSyncTimeMs = targetMs;

    if (!advancedCorrectionEnabled) {
      if (delayMs > 0) {
        _scheduleAction(delayMs, () => _performResume(positionMs));
      } else {
        _performResume(positionMs);
      }
    } else if (delayMs > _commandLeadToleranceMs) {
      _scheduleAction(delayMs, () => _performResume(positionMs));
    } else if (delayMs >= -_commandLateToleranceMs) {
      _performResume(positionMs);
    } else {
      final elapsed = (-delayMs) > _maxLateCatchUpMs
          ? _maxLateCatchUpMs
          : (-delayMs);
      _performResume(_clampedPositionMs(positionMs + elapsed));
    }

    _state.groupState = SyncPlayGroupState.playing;
    notifyListeners();
  }

  void _handlePause(SyncPlayCommand command) {
    final positionMs =
        _clampedPositionMs(SyncPlayUtils.ticksToMs(command.positionTicks));
    _performPause(positionMs);
    _state.groupState = SyncPlayGroupState.paused;
    notifyListeners();
  }

  void _handleSeek(SyncPlayCommand command) {
    final serverNow = _timeSync?.getServerTimeNow() ?? 0;
    final lateness = serverNow - command.whenUtcMs;
    final raw = SyncPlayUtils.ticksToMs(command.positionTicks);
    int adjusted = raw;
    if (advancedCorrectionEnabled &&
        lateness > _commandLateToleranceMs &&
        _state.groupState == SyncPlayGroupState.playing) {
      adjusted += lateness > _maxLateCatchUpMs ? _maxLateCatchUpMs : lateness;
    }
    final positionMs = _clampedPositionMs(adjusted);
    _lastSyncPositionMs = positionMs;
    _lastSyncTimeMs = serverNow;
    _performSeek(positionMs);
  }

  void _handleStop() {
    _applyingRemoteCommand = true;
    try {
      _playbackManager.stop(userInitiated: false);
    } finally {
      _applyingRemoteCommand = false;
    }
    _restorePlaybackRate();
    _scheduledTimer?.cancel();
    _scheduledTimer = null;
    _driftTimer?.cancel();
    _driftTimer = null;
    _state.groupState = SyncPlayGroupState.idle;
    _lastSyncPositionMs = 0;
    _lastSyncTimeMs = 0;
    notifyListeners();
  }

  void _performResume(int positionMs) {
    _applyingRemoteCommand = true;
    try {
      if (_needsSeek(positionMs)) {
        _armBufferingSuppression();
        _playbackManager.seekTo(Duration(milliseconds: positionMs));
      }
      if (!_playbackManager.state.isPlaying) {
        _armBufferingSuppression();
        _playbackManager.resume();
      }
    } finally {
      _applyingRemoteCommand = false;
    }
    _restorePlaybackRate();
    if (syncCorrectionEnabled) _scheduleDriftCorrection();
  }

  void _performPause(int positionMs) {
    _restorePlaybackRate();
    _applyingRemoteCommand = true;
    try {
      _playbackManager.pause();
      if (_needsSeek(positionMs)) {
        _armBufferingSuppression();
        _playbackManager.seekTo(Duration(milliseconds: positionMs));
      }
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  void _performSeek(int positionMs) {
    if (_needsSeek(positionMs)) {
      _applyingRemoteCommand = true;
      try {
        _armBufferingSuppression();
        _playbackManager.seekTo(Duration(milliseconds: positionMs));
      } finally {
        _applyingRemoteCommand = false;
      }
    }
    if (syncCorrectionEnabled &&
        _state.groupState == SyncPlayGroupState.playing) {
      _scheduleDriftCorrection();
    }
  }

  bool _needsSeek(int targetMs) {
    final currentMs = _playbackManager.state.position.inMilliseconds;
    return (currentMs - targetMs).abs() > _seekToleranceMs;
  }

  void _armBufferingSuppression() {
    _suppressBufferingUntilMs =
        DateTime.now().millisecondsSinceEpoch + _bufferingSuppressionMs;
  }

  int _clampedPositionMs(int value) {
    final durationMs = _playbackManager.state.duration.inMilliseconds;
    if (durationMs <= 0) {
      final v = value < 0 ? 0 : value;
      return v > _maxSeekDeltaMs ? _maxSeekDeltaMs : v;
    }
    final v = value < 0 ? 0 : value;
    return v > durationMs ? durationMs : v;
  }

  void _restorePlaybackRate() {
    _playbackManager.setPlaybackSpeed(_defaultSpeed);
  }

  void _scheduleAction(int delayMs, void Function() action) {
    _scheduledTimer?.cancel();
    _scheduledTimer = Timer(Duration(milliseconds: delayMs < 0 ? 0 : delayMs), action);
  }

  void _scheduleDriftCorrection() {
    if (!syncCorrectionEnabled ||
        _state.groupState != SyncPlayGroupState.playing) {
      return;
    }
    _driftTimer?.cancel();
    _driftTimer = Timer(const Duration(seconds: 2), _performDriftCorrection);
  }

  void _performDriftCorrection() {
    final tsm = _timeSync;
    if (tsm == null ||
        _state.groupState != SyncPlayGroupState.playing ||
        _lastSyncTimeMs == 0) {
      return;
    }
    final pm = _playbackManager;
    final currentMs = pm.state.position.inMilliseconds;
    final serverNow = tsm.getServerTimeNow();
    final expectedMs =
        _lastSyncPositionMs + (serverNow - _lastSyncTimeMs) + extraTimeOffset;

    final delay = currentMs - expectedMs;
    final absDelay = delay.abs();

    if (useSkipToSync && absDelay > minDelaySkipToSync) {
      _performSeek(expectedMs);
      _scheduleDriftCorrection();
      return;
    }

    if (useSpeedToSync &&
        absDelay > minDelaySpeedToSync &&
        absDelay < maxDelaySpeedToSync) {
      final speed = delay > 0 ? 0.95 : 1.05;
      pm.setPlaybackSpeed(speed);
      Timer(Duration(milliseconds: speedToSyncDuration), () {
        _restorePlaybackRate();
        _scheduleDriftCorrection();
      });
      return;
    }

    _scheduleDriftCorrection();
  }

  void _attachPlaybackObservers() {
    if (!_state.enabled) return;
    if (_bufferingSub != null) return;
    final pm = _playbackManager;
    _bufferingSub = pm.state.bufferingStream.listen(_onBuffering);
    _queueChangedSub ??= pm.queueService.queueChangedStream
        .listen((_) => _onLocalQueueChanged());
    pm.setTransportInterceptor(_interceptTransport);
  }

  void _stopPlaybackObservers() {
    _bufferingSub?.cancel();
    _bufferingSub = null;
    _queueChangedSub?.cancel();
    _queueChangedSub = null;
    _bufferingTimer?.cancel();
    _bufferingTimer = null;
    _readyTimer?.cancel();
    _readyTimer = null;
    _seekDebounceTimer?.cancel();
    _seekDebounceTimer = null;
    _pendingSeekTarget = null;
    _queueSyncDebounceTimer?.cancel();
    _queueSyncDebounceTimer = null;
    _suppressedBufferingRecheckTimer?.cancel();
    _suppressedBufferingRecheckTimer = null;
    _suppressBufferingUntilMs = 0;
    _isBuffering = false;
    _playbackManager.setTransportInterceptor(null);
  }

  Future<bool> _interceptTransport(
    TransportAction action, {
    Duration? position,
  }) async {
    if (!_state.enabled || !syncPlayEnabled) return false;
    if (_applyingRemoteCommand) return false;
    switch (action) {
      case TransportAction.resume:
        await requestUnpause();
        return true;
      case TransportAction.pause:
        await requestPause();
        return true;
      case TransportAction.seek:
        _scheduleSeekRequest(position ?? _playbackManager.state.position);
        return true;
      case TransportAction.stop:
        await requestStop();
        return true;
      case TransportAction.next:
        await requestNext();
        return true;
      case TransportAction.previous:
        await requestPrevious();
        return true;
    }
  }

  void _scheduleSeekRequest(Duration position) {
    _pendingSeekTarget = position;
    _seekDebounceTimer?.cancel();
    _seekDebounceTimer = Timer(
      const Duration(milliseconds: 250),
      () {
        final target = _pendingSeekTarget;
        _pendingSeekTarget = null;
        if (target != null) {
          unawaited(requestSeek(target));
        }
      },
    );
  }

  void _onLocalQueueChanged() {
    if (!_state.enabled || !syncPlayEnabled) return;
    if (_applyingRemoteCommand) return;
    _queueSyncDebounceTimer?.cancel();
    _queueSyncDebounceTimer = Timer(
      const Duration(milliseconds: 400),
      () => unawaited(syncCurrentPlaybackQueueToGroup()),
    );
  }

  void _onBuffering(bool buffering) {
    if (!_state.enabled) return;
    if (buffering && !_isBuffering) {
      _isBuffering = true;
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      if (nowMs < _suppressBufferingUntilMs) {
        // This buffering was caused by our own seek/resume. Re-check when the
        // window expires and report only a genuine stall that outlasts it.
        _suppressedBufferingRecheckTimer?.cancel();
        _suppressedBufferingRecheckTimer = Timer(
          Duration(milliseconds: _suppressBufferingUntilMs - nowMs),
          () {
            if (_state.enabled && _isBuffering) _queueBufferingReport();
          },
        );
        return;
      }
      _queueBufferingReport();
    } else if (!buffering && _isBuffering) {
      _isBuffering = false;
      _suppressedBufferingRecheckTimer?.cancel();
      _suppressedBufferingRecheckTimer = null;
      // A pending report for a blip that already recovered shouldn't fire.
      // The Ready report is never suppressed because the server waits on it.
      _bufferingTimer?.cancel();
      _queueReadyReport();
    }
  }

  void _queueBufferingReport() {
    _bufferingTimer?.cancel();
    _bufferingTimer = Timer(
      const Duration(milliseconds: _bufferingDebounceMs),
      _sendBufferingWithRetry,
    );
  }

  void _queueReadyReport() {
    _readyTimer?.cancel();
    _readyTimer = Timer(
      const Duration(milliseconds: _readyDebounceMs),
      () async {
        if (!await _isPlaybackPositionStable()) return;
        _sendReadyWithRetry();
      },
    );
  }

  Future<bool> _isPlaybackPositionStable() async {
    final pm = _playbackManager;
    if (pm.state.isBuffering) return false;
    final before = pm.state.position;
    await Future.delayed(
      const Duration(milliseconds: _readyStabilityWindowMs),
    );
    if (pm.state.isBuffering) return false;
    final after = pm.state.position;
    final deltaMs = (after - before).inMilliseconds;
    if (pm.state.isPlaying) {
      return deltaMs >= 80 && deltaMs <= 1200;
    }
    return deltaMs.abs() <= 120;
  }

  /// Current time on the server's clock, for stamping outgoing reports. The
  /// server rejects Ready/Buffering elapsed math when When is more than 2s
  /// off its own clock, so the local clock alone isn't good enough.
  DateTime? _serverWhen() {
    final tsm = _timeSync;
    if (tsm == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(
      tsm.getServerTimeNow(),
      isUtc: true,
    );
  }

  String? _currentPlaylistItemId() {
    final id = _state.currentPlaylistItemId;
    if (id != null && id.isNotEmpty) return id;
    final currentItem = _playbackManager.queueService.currentItem;
    final currentId = _itemId(currentItem);
    if (currentId == null) return null;
    for (final item in _state.queue) {
      if (item.itemId == currentId) return item.playlistItemId;
    }
    return null;
  }

  String? _itemId(dynamic item) {
    if (item == null) return null;
    try {
      final id = item.id;
      if (id is String) return id;
    } catch (_) {}
    return null;
  }

  Future<void> _sendBufferingWithRetry() async {
    for (var attempt = 0; attempt < _maxHandshakeRetries; attempt++) {
      if (!_state.enabled || !syncPlayEnabled) return;
      final api = _api;
      final playlistItemId = _currentPlaylistItemId();
      if (api == null || playlistItemId == null) return;
      final pm = _playbackManager;
      final positionTicks =
          SyncPlayUtils.msToTicks(pm.state.position.inMilliseconds);
      try {
        await api.sendBuffering(
          isPlaying: pm.state.isPlaying,
          playlistItemId: playlistItemId,
          positionTicks: positionTicks,
          when: _serverWhen(),
        );
        return;
      } catch (_) {
        if (attempt == _maxHandshakeRetries - 1) return;
        await Future.delayed(
          const Duration(milliseconds: _handshakeRetryDelayMs),
        );
      }
    }
  }

  Future<void> _sendReadyWithRetry() async {
    for (var attempt = 0; attempt < _maxHandshakeRetries; attempt++) {
      if (!_state.enabled || !syncPlayEnabled) return;
      final api = _api;
      final playlistItemId = _currentPlaylistItemId();
      if (api == null || playlistItemId == null) return;
      final pm = _playbackManager;
      final positionTicks =
          SyncPlayUtils.msToTicks(pm.state.position.inMilliseconds);
      try {
        await api.sendReady(
          isPlaying: pm.state.isPlaying,
          playlistItemId: playlistItemId,
          positionTicks: positionTicks,
          when: _serverWhen(),
        );
        return;
      } catch (_) {
        if (attempt == _maxHandshakeRetries - 1) return;
        await Future.delayed(
          const Duration(milliseconds: _handshakeRetryDelayMs),
        );
      }
    }
  }

  Future<void> requestPause() async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.sendPause();
    } catch (_) {}
  }

  Future<void> requestUnpause() async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.sendUnpause();
    } catch (_) {}
  }

  Future<void> requestSeek(Duration position) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.sendSeek(SyncPlayUtils.msToTicks(position.inMilliseconds));
    } catch (_) {}
  }

  Future<void> requestStop() async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.sendStop();
    } catch (_) {}
  }

  Future<void> requestNext() async {
    final id = _currentPlaylistItemId();
    if (!_state.enabled || !syncPlayEnabled || id == null) return;
    try {
      await _api?.nextItem(id);
    } catch (_) {}
  }

  Future<void> requestPrevious() async {
    final id = _currentPlaylistItemId();
    if (!_state.enabled || !syncPlayEnabled || id == null) return;
    try {
      await _api?.previousItem(id);
    } catch (_) {}
  }

  Future<void> requestSetCurrentItem(String playlistItemId) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.setPlaylistItem(playlistItemId);
    } catch (_) {
      _setError('Failed to set current item');
    }
  }

  Future<void> requestRemoveFromQueue(String playlistItemId) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.removeFromPlaylist([playlistItemId]);
    } catch (_) {
      _setError('Failed to remove from queue');
    }
  }

  Future<void> requestClearQueue({bool clearPlayingItem = false}) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.removeFromPlaylist(
        const [],
        clearPlaylist: true,
        clearPlayingItem: clearPlayingItem,
      );
    } catch (_) {
      _setError('Failed to clear queue');
    }
  }

  Future<void> requestMoveQueueItem(String playlistItemId, int newIndex) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      await _api?.movePlaylistItem(
        playlistItemId: playlistItemId,
        newIndex: newIndex < 0 ? 0 : newIndex,
      );
    } catch (_) {
      _setError('Failed to move queue item');
    }
  }

  Future<void> requestQueueItemIds(
    List<String> itemIds, {
    SyncPlayQueueMode mode = SyncPlayQueueMode.queue,
  }) async {
    if (!_state.enabled || !syncPlayEnabled || itemIds.isEmpty) return;
    try {
      await _api?.queue(itemIds: itemIds, mode: mode);
    } catch (_) {
      _setError('Failed to queue items');
    }
  }

  Future<void> requestSetRepeatMode(SyncPlayRepeatMode mode) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    final previous = _state.repeatMode;
    _state.repeatMode = mode;
    notifyListeners();
    try {
      await _api?.setRepeatMode(mode);
    } catch (_) {
      _state.repeatMode = previous;
      _setError('Failed to set repeat mode');
    }
  }

  Future<void> requestSetShuffleMode(SyncPlayShuffleMode mode) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    final previous = _state.shuffleMode;
    _state.shuffleMode = mode;
    notifyListeners();
    try {
      await _api?.setShuffleMode(mode);
    } catch (_) {
      _state.shuffleMode = previous;
      _setError('Failed to set shuffle mode');
    }
  }

  Future<void> requestSetIgnoreWait(bool enabled) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    final previous = _ignoreWaitEnabled;
    _ignoreWaitEnabled = enabled;
    notifyListeners();
    try {
      await _api?.setIgnoreWait(enabled);
    } catch (_) {
      _ignoreWaitEnabled = previous;
      _setError('Failed to update ignore-wait');
    }
  }

  void cycleRepeatMode() {
    final next = switch (_state.repeatMode) {
      SyncPlayRepeatMode.repeatNone => SyncPlayRepeatMode.repeatAll,
      SyncPlayRepeatMode.repeatAll => SyncPlayRepeatMode.repeatOne,
      SyncPlayRepeatMode.repeatOne => SyncPlayRepeatMode.repeatNone,
    };
    requestSetRepeatMode(next);
  }

  void toggleShuffleMode() {
    requestSetShuffleMode(_state.shuffleMode == SyncPlayShuffleMode.shuffle
        ? SyncPlayShuffleMode.sorted
        : SyncPlayShuffleMode.shuffle);
  }

  Future<void> syncCurrentPlaybackQueueToGroup() async {
    if (!_state.enabled || !syncPlayEnabled) return;
    final pm = _playbackManager;
    final items = pm.queueService.items;
    if (items.isEmpty) return;
    final ids = <String>[];
    for (final i in items) {
      final id = _itemId(i);
      if (id != null) ids.add(id);
    }
    if (ids.isEmpty) return;
    final currentIdx = pm.queueService.currentIndex;
    final clamped = currentIdx < 0
        ? 0
        : (currentIdx >= ids.length ? ids.length - 1 : currentIdx);
    final positionTicks =
        SyncPlayUtils.msToTicks(pm.state.position.inMilliseconds);
    try {
      await _api?.setNewQueue(
        itemIds: ids,
        startIndex: clamped,
        startPositionTicks: positionTicks,
      );
    } catch (_) {
      _setError('Failed to sync current playback queue');
    }
  }

  @override
  void dispose() {
    _resetState();
    _uiEventsController.close();
    super.dispose();
  }
}

/// Transient SyncPlay UI signals (toasts, dialogs) decoupled from persistent
/// state so the app shell can react without polling the manager.
sealed class SyncPlayUiEvent {
  const SyncPlayUiEvent();
  const factory SyncPlayUiEvent.userJoined(String userName) =
      SyncPlayUserJoinedEvent;
  const factory SyncPlayUiEvent.userLeft(String userName) =
      SyncPlayUserLeftEvent;
  const factory SyncPlayUiEvent.libraryAccessDenied() =
      SyncPlayLibraryAccessDeniedEvent;
}

class SyncPlayUserJoinedEvent extends SyncPlayUiEvent {
  final String userName;
  const SyncPlayUserJoinedEvent(this.userName);
}

class SyncPlayUserLeftEvent extends SyncPlayUiEvent {
  final String userName;
  const SyncPlayUserLeftEvent(this.userName);
}

class SyncPlayLibraryAccessDeniedEvent extends SyncPlayUiEvent {
  const SyncPlayLibraryAccessDeniedEvent();
}
