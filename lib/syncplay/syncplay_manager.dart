import 'dart:async';
import 'dart:math' as math;

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
import '../ui/widgets/video_mini_player.dart';
import 'sync_correction_policy.dart';
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
  static const int _maxReadyStabilityRetries = 4;
  // A Ready that never lands leaves the group waiting on this client, so the
  // report is repeated for a while rather than sent once and forgotten.
  static const int _readyWatchdogIntervalMs = 2500;
  static const int _maxReadyWatchdogReports = 5;

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
  Timer? _speedToSyncTimer;
  Timer? _readyWatchdogTimer;
  Duration? _pendingSeekTarget;
  int _readyWatchdogReports = 0;

  final SyncCorrectionPolicy _syncCorrection = SyncCorrectionPolicy();
  /// Whether the rate currently on the player is one SyncPlay put there. The
  /// player's own speed control writes straight to the backend on some
  /// platforms, so shared speed state cannot be trusted for this.
  bool _speedToSyncApplied = false;

  /// A pause SyncPlay applied to burn off a lead, and the timer that ends it.
  /// Non-null exactly while the pause is ours to undo: the player's own
  /// paused state cannot say whose pause it is.
  Timer? _syncWaitTimer;

  StreamSubscription<bool>? _bufferingSub;
  StreamSubscription<Duration>? _positionSub;
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
  /// Where the last Seek command sent the group, and when it reached us, so
  /// a local seek back to that same spot can be told apart from a new one.
  int _lastGroupSeekTargetMs = 0;
  int _lastGroupSeekAtMs = 0;
  bool _isBuffering = false;
  /// A Buffering report went out, so the server is holding the group for us
  /// and is owed a Ready when the stall ends. Without one it is not: the
  /// server answers an unsolicited Ready with an Unpause echo, and acting on
  /// that echo seeks the player, which on engines that raise a buffering edge
  /// for every seek produces another Ready. That cycle is the loop.
  bool _bufferingReported = false;
  /// The queue loaded paused for the group's handshake; a Playing state that
  /// arrives without an Unpause (the server ignoring our wait) starts it.
  bool _startedPausedForHandshake = false;
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

  /// One line per SyncPlay event, at debug level, so a stuck handshake can be
  /// read off a log rather than guessed at. Debug builds only: the logger's
  /// filter drops it in release anyway, and the closure keeps the message
  /// from even being built there.
  void _trace(String Function() message) {
    if (!kDebugMode) return;
    final ps = _playbackManager.state;
    _logger.d(
      'SyncPlay: ${message()} [group ${_state.groupState.name}, player '
      '${ps.isPlaying ? 'playing' : 'paused'}'
      '${ps.isBuffering ? '/buffering' : ''} at '
      '${ps.position.inMilliseconds}ms]',
    );
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
    _forgetSyncPoint();
    _clearLocalCorrections();
    notifyListeners();
  }

  void _forgetSyncPoint() {
    _lastSyncPositionMs = 0;
    _lastSyncTimeMs = 0;
    _lastGroupSeekTargetMs = 0;
    _lastGroupSeekAtMs = 0;
    _syncCorrection.reset();
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
    // On web the tab is hidden whenever the user looks at another window,
    // including the device that is starting the video. Anything the group
    // did meanwhile that no command reaches us for is picked up here.
    unawaited(_refreshCurrentGroupStateAfterReconnect());
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
    // in-flight Unpause.
    switch (_state.groupState) {
      case SyncPlayGroupState.paused:
        if (pm.state.isPlaying) _applyLocalPause();
        break;
      case SyncPlayGroupState.playing:
        // A pause of our own is the group's position being waited for, not a
        // player that fell out of step.
        if (!pm.state.isPlaying && _syncWaitTimer == null) _applyLocalResume();
        break;
      case SyncPlayGroupState.waiting:
      case SyncPlayGroupState.idle:
        break;
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
      _trace(
        () => 'dropped ${command.command.name} for item ${command.playlistItemId}, '
        'ours is $currentItemId',
      );
      return;
    }
    final key = command.dedupeKey;
    if (key == _lastCommandKey) return;
    _lastCommandKey = key;
    _trace(
      () => 'command ${command.command.name} to '
      '${SyncPlayUtils.ticksToMs(command.positionTicks)}ms at '
      '${command.whenUtcMs}, server now ${_timeSync?.getServerTimeNow()}',
    );

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
        // A join to a playing or paused group puts the group into Waiting
        // on the server, which then holds every member for this session's
        // Ready. But the joiner is told only the state from before the
        // join, and gets no state update for the switch, so the handshake
        // has to be entered here or the whole group hangs on a Ready that
        // never comes.
        if (_state.groupState == SyncPlayGroupState.playing ||
            _state.groupState == SyncPlayGroupState.paused) {
          _state.groupState = SyncPlayGroupState.waiting;
        }
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
        _trace(() => 'state update ${payload.update.state.name}');
        if (_startedPausedForHandshake &&
            _state.groupState == SyncPlayGroupState.playing) {
          _startedPausedForHandshake = false;
          _reconcileLocalPlayback();
        }
        if (_state.groupState == SyncPlayGroupState.waiting) {
          // Waiting can also be entered on someone else's buffering or an item
          // switch, and the group stays there until we confirm we are ready.
          _startReadyHandshake();
        } else {
          _stopReadyHandshake();
        }
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

    // Seek latency and convergence are per-stream, and a give-up must not
    // outlive the item that caused it.
    _syncCorrection.reset();

    final targetPlaylistItemId = _state.currentPlaylistItemId;
    final targetItemId = (idx >= 0 && idx < update.playlist.length)
        ? update.playlist[idx].itemId
        : null;
    final startMs = SyncPlayUtils.ticksToMs(update.startPositionTicks);
    // A queue change puts the group into Waiting until every session has
    // reported Ready, and the Unpause that ends it carries the position the
    // group is paused at. Playing through that handshake means reporting
    // Ready from seconds past the group and being dragged back by the Unpause.
    // So the player starts paused, and the Unpause is what starts it.
    final shouldAutoPlay =
        update.isPlaying && _state.groupState == SyncPlayGroupState.playing;
    _startedPausedForHandshake = update.isPlaying && !shouldAutoPlay;

    final localCurrentItemId =
        _itemId(_playbackManager.queueService.currentItem);
    final hasActivePlayer = _playbackManager.currentResolution != null;
    final needsRemoteLoad = targetItemId != null &&
        (targetItemId != localCurrentItemId || !hasActivePlayer);
    _trace(
      () => 'queue ${reason.name} item $targetItemId ($targetPlaylistItemId) from '
      '${startMs}ms isPlaying ${update.isPlaying} autoPlay $shouldAutoPlay '
      'reload $needsRemoteLoad',
    );
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
      if (startMs > 0) _seekPlayer(startMs);
      if (!shouldAutoPlay && _playbackManager.state.isPlaying) {
        _applyLocalPause();
      }
      _answerWaitingAfterQueueChange();
    });
  }

  /// A queue change made while the group waits is one the server holds the
  /// group on until this session reports Ready. After a join that wait was
  /// never announced by a state update, so the handshake would not start on
  /// its own; started here it retries until the player is up and settled.
  void _answerWaitingAfterQueueChange() {
    if (!_state.enabled) return;
    if (_state.groupState != SyncPlayGroupState.waiting) return;
    _startReadyHandshake();
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
      // Loaded paused when the group is not playing: the bring-up's own
      // resume after its start seek would otherwise undo the pause below,
      // and a joiner playing through the handshake reports Ready from past
      // the group, is seeked back, plays on, and reports again, forever.
      await _playbackManager.playItems(
        items,
        startIndex: startIndex,
        startPosition: Duration(milliseconds: startMs),
        autoPlay: shouldAutoPlay,
      );
      if (!shouldAutoPlay && _playbackManager.state.isPlaying) {
        await _playbackManager.pause();
      }
      _ensurePlayerRouteForItem(items[startIndex]);
    } catch (e) {
      _logger.w('SyncPlay failed to load remote queue', error: e);
    } finally {
      _applyingRemoteCommand = false;
    }
    _answerWaitingAfterQueueChange();
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
    // A viewer who minimized the video keeps watching in the mini player,
    // which follows the group's item on its own; reopening the full player on
    // every group item change would undo the minimize.
    if (!isAudio &&
        VideoMiniPlayerController.isSupported &&
        VideoMiniPlayerController.instance.isMinimized) {
      return;
    }
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
    _stopReadyHandshake();
    final targetMs = command.whenUtcMs;
    // Time sync is stopped while the app is in the background, which on web
    // means whenever the tab is hidden. An Unpause that arrives then is still
    // the group's decision: dropping it leaves this client paused in Waiting
    // while everyone else plays. Without a server clock the scheduled start
    // cannot be honoured, so it is applied now and drift correction takes
    // over once the clock is back.
    final serverNow = _timeSync?.getServerTimeNow();
    final delayMs = serverNow == null ? 0 : targetMs - serverNow;

    final positionMs =
        _clampedPositionMs(SyncPlayUtils.ticksToMs(command.positionTicks));
    // The server answers any Ready it gets while already playing with the
    // sync point it is on, unchanged. That is a confirmation, not a
    // correction: treating it as a late Unpause and seeking to where the
    // sync point has got to by now moves a player that was already there,
    // and on an engine that raises a buffering edge for every seek that
    // produces another Ready, and another echo.
    final isEcho = _state.groupState == SyncPlayGroupState.playing &&
        targetMs == _lastSyncTimeMs &&
        positionMs == _lastSyncPositionMs;
    if (isEcho) {
      _reconcileLocalPlayback();
      return;
    }
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
    _stopReadyHandshake();
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
    _lastGroupSeekTargetMs = _clampedPositionMs(raw);
    _lastGroupSeekAtMs = DateTime.now().millisecondsSinceEpoch;
    // The server has moved the group into Waiting: every other client is
    // paused at the target until all have reported Ready, and the Unpause
    // that follows carries that same position. A client that keeps playing
    // through the handshake is dragged back to it by that Unpause, which is
    // a visible jump backwards on every group seek. Whatever the group state
    // looks like from here: a Seek is also how the server corrects a Ready
    // reported from the wrong position, and a player left playing after
    // that correction reports from the wrong position again.
    _clearLocalCorrections();
    if (_playbackManager.state.isPlaying) {
      _applyLocalPause();
    }
    final fromMs = _playbackManager.state.position.inMilliseconds;
    final issued = _performSeek(positionMs);
    _openSyncPoint(positionMs, fromMs: fromMs, seekIssued: issued);
    // Seek only ever arrives from the waiting state, which has just flagged
    // every session as buffering. A seek that lands inside the buffer never
    // stalls the pipeline, so waiting on a buffering edge to report Ready
    // would leave the group waiting on a stall that is never coming.
    _startReadyHandshake(restart: true);
  }

  void _handleStop() {
    _stopReadyHandshake();
    _applyingRemoteCommand = true;
    try {
      _playbackManager.stop(userInitiated: false);
    } finally {
      _applyingRemoteCommand = false;
    }
    _clearLocalCorrections();
    _scheduledTimer?.cancel();
    _scheduledTimer = null;
    _driftTimer?.cancel();
    _driftTimer = null;
    _state.groupState = SyncPlayGroupState.idle;
    _forgetSyncPoint();
    notifyListeners();
  }

  void _performResume(int positionMs) {
    _clearLocalCorrections();
    _startedPausedForHandshake = false;
    final fromMs = _playbackManager.state.position.inMilliseconds;
    final issued = _performSeek(positionMs);
    if (!_playbackManager.state.isPlaying) _applyLocalResume();
    // A fresh sync point, opened at the instant the seek reaches the player
    // rather than when the command arrived, so the cost measured is the
    // seek's and not the wait for a scheduled sync point.
    _openSyncPoint(positionMs, fromMs: fromMs, seekIssued: issued);
  }

  void _openSyncPoint(
    int targetMs, {
    required int fromMs,
    required bool seekIssued,
  }) {
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final settings = _syncCorrectionSettings;
    if (seekIssued) {
      _syncCorrection.onSyncPointChanged(
        nowMs,
        targetPositionMs: targetMs,
        fromPositionMs: fromMs,
        settings: settings,
      );
    } else {
      _syncCorrection.onSyncPointResumed(
        nowMs,
        positionMs: fromMs,
        settings: settings,
      );
    }
  }

  void _performPause(int positionMs) {
    _applyLocalPause();
    if (_needsSeek(positionMs)) _seekPlayer(positionMs);
  }

  /// Pauses the player without routing back through the interceptor, for the
  /// cases where the group has no command to send us.
  void _applyLocalPause() {
    _clearLocalCorrections();
    _applyingRemoteCommand = true;
    try {
      _playbackManager.pause();
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  /// The counterpart of [_applyLocalPause]: starts the player where it is
  /// without asking the group for an Unpause.
  void _applyLocalResume() {
    _applyingRemoteCommand = true;
    try {
      _armBufferingSuppression();
      _playbackManager.resume();
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  /// Every seek SyncPlay itself issues goes through here, so the buffering
  /// edge the seek raises is never mistaken for a stall to report.
  void _seekPlayer(int positionMs) {
    _trace(() => 'seeking player to ${positionMs}ms');
    _applyingRemoteCommand = true;
    try {
      _armBufferingSuppression(forSeek: true);
      _playbackManager.seekTo(Duration(milliseconds: positionMs));
    } finally {
      _applyingRemoteCommand = false;
    }
  }

  /// Returns whether the seek was actually issued. A target already inside
  /// [_seekToleranceMs] never reaches the player, and a correction that moved
  /// nothing must not be waited on or scored as a failure.
  bool _performSeek(int positionMs) {
    final issued = _needsSeek(positionMs);
    if (issued) _seekPlayer(positionMs);
    if (syncCorrectionEnabled &&
        _state.groupState == SyncPlayGroupState.playing) {
      _scheduleDriftCorrection();
    }
    return issued;
  }

  /// The backend's own worst-case seek cost, or the policy's allowance when
  /// no backend is up.
  int get _maxSeekLatencyMs =>
      _playbackManager.backend?.maxSeekLatency.inMilliseconds ??
      SyncCorrectionPolicy.maxSeekLatencyAllowanceMs;

  bool _needsSeek(int targetMs) {
    final currentMs = _playbackManager.state.position.inMilliseconds;
    return (currentMs - targetMs).abs() > _seekToleranceMs;
  }

  /// [forSeek] widens the window to the backend's own worst-case seek cost. A
  /// seek that outlasts the short window is not a stall to report: reporting
  /// it pauses the whole group for the seek, and on a player that seeks slowly
  /// that is every corrective skip.
  void _armBufferingSuppression({bool forSeek = false}) {
    final windowMs = forSeek
        ? math.max(_bufferingSuppressionMs, _maxSeekLatencyMs)
        : _bufferingSuppressionMs;
    _suppressBufferingUntilMs =
        DateTime.now().millisecondsSinceEpoch + windowMs;
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

  /// Undoes a speed-to-sync nudge, and only that. Writing the rate when
  /// SyncPlay never changed it is not free: on the Apple TV path a rate write
  /// is play intent (`avPlayer.rate = value`), so an unconditional
  /// restore-to-1.0 resumes a player the group wants paused.
  void _restorePlaybackRate() {
    _speedToSyncTimer?.cancel();
    _speedToSyncTimer = null;
    if (!_speedToSyncApplied) return;
    _speedToSyncApplied = false;
    _playbackManager.setPlaybackSpeed(_defaultSpeed);
  }

  void _applyPlaybackRate(double speed) {
    _speedToSyncApplied = true;
    _playbackManager.setPlaybackSpeed(speed);
  }

  /// Holds the player paused for [durationMs] to let the group catch up. It
  /// is exact where a rate nudge is approximate, and it needs neither a seek
  /// nor a rate write, which on the Apple TV engine are the two things that
  /// glitch. The pause never reaches the group, and only [_stopSyncWait] or
  /// the timer undoes it.
  void _applySyncWait(int durationMs) {
    _applyLocalPause();
    _syncWaitTimer = Timer(Duration(milliseconds: durationMs), () {
      _syncWaitTimer = null;
      if (_state.groupState == SyncPlayGroupState.playing) _applyLocalResume();
      _scheduleDriftCorrection();
    });
  }

  /// Cancels a wait SyncPlay applied. The player is left paused: every caller
  /// is about to pause, stop or resume it itself.
  void _stopSyncWait() {
    _syncWaitTimer?.cancel();
    _syncWaitTimer = null;
  }

  /// Everything SyncPlay may have applied to the player on its own: a rate
  /// nudge or a wait. Called before any group command takes over.
  void _clearLocalCorrections() {
    _restorePlaybackRate();
    _stopSyncWait();
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

  SyncCorrectionSettings get _syncCorrectionSettings {
    // How slowly this player seeks is the difference between a correction that
    // converges and one that lands short every time, so it is read from the
    // backend rather than assumed. Null only before a player exists, where the
    // desktop-shaped defaults are the safe answer.
    final backend = _playbackManager.backend;
    return SyncCorrectionSettings(
      useSkipToSync: useSkipToSync,
      // A rate nudge on a player whose audio does not survive one is worse
      // than the drift it corrects, whatever the preference says.
      useSpeedToSync:
          useSpeedToSync && (backend?.supportsSmoothRateChange ?? true),
      minDelaySkipToSyncMs: minDelaySkipToSync,
      minDelaySpeedToSyncMs: minDelaySpeedToSync,
      maxDelaySpeedToSyncMs: maxDelaySpeedToSync,
      speedToSyncDurationMs: speedToSyncDuration,
      extraTimeOffsetMs: extraTimeOffset,
      typicalSeekLatencyMs: backend?.typicalSeekLatency.inMilliseconds ??
          SyncCorrectionPolicy.defaultTypicalSeekLatencyMs,
      maxSeekLatencyMs: _maxSeekLatencyMs,
    );
  }

  void _performDriftCorrection() {
    final tsm = _timeSync;
    if (tsm == null ||
        _state.groupState != SyncPlayGroupState.playing ||
        _lastSyncTimeMs == 0 ||
        _syncCorrection.hasGivenUp ||
        // Measuring a player we are holding paused would read as far behind.
        // The wait's own timer resumes the ticks.
        _syncWaitTimer != null) {
      return;
    }
    final pm = _playbackManager;
    // Sampled once so the log below describes the same instant the policy
    // judged, rather than a clock read a few milliseconds later.
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final serverNowMs = tsm.getServerTimeNow();
    final positionMs = pm.state.position.inMilliseconds;
    final isBuffering = pm.state.isBuffering || _isBuffering;
    final isPlaying = pm.state.isPlaying;
    final decision = _syncCorrection.evaluate(
      nowMs: nowMs,
      serverNowMs: serverNowMs,
      currentPositionMs: positionMs,
      lastSyncPositionMs: _lastSyncPositionMs,
      lastSyncTimeMs: _lastSyncTimeMs,
      isBuffering: isBuffering,
      isPlaying: isPlaying,
      clockJitterMs: tsm.offsetJitterMs,
      settings: _syncCorrectionSettings,
    );

    switch (decision.action) {
      // Leaves the rate alone: the pipeline is stalled or paused here.
      case SyncCorrectionAction.defer:
        _scheduleDriftCorrection();
      case SyncCorrectionAction.hold:
        _clearLocalCorrections();
        _scheduleDriftCorrection();
      case SyncCorrectionAction.wait:
        _applySyncWait(decision.waitDurationMs);
      case SyncCorrectionAction.skip:
        _clearLocalCorrections();
        final clamped = _clampedPositionMs(decision.targetPositionMs);
        // A target inside _seekToleranceMs never reaches the player, so the
        // policy has to take back the skip it already counted rather than wait
        // out a settle window for a seek that did not happen.
        if (!_performSeek(clamped)) _syncCorrection.onSkipDropped();
        _scheduleDriftCorrection();
      case SyncCorrectionAction.speed:
        _applyPlaybackRate(decision.speed);
        _speedToSyncTimer?.cancel();
        _speedToSyncTimer = Timer(
          Duration(milliseconds: decision.speedDurationMs),
          () {
            _restorePlaybackRate();
            _scheduleDriftCorrection();
          },
        );
      case SyncCorrectionAction.giveUp:
        _restorePlaybackRate();
        _logger.w(
          'SyncPlay: sync correction disabled for this item after '
          '${_syncCorrection.skipsUsed} skips failed to converge, leaving '
          'the client ${decision.measuredDelayMs}ms from the group '
          '(latency allowance ${_syncCorrection.seekLatencyAllowanceMs}ms)',
        );
    }
  }

  void _attachPlaybackObservers() {
    if (!_state.enabled) return;
    if (_bufferingSub != null) return;
    final pm = _playbackManager;
    _bufferingSub = pm.state.bufferingStream.listen(_onBuffering);
    // Every position sample goes to the policy so a seek's landing is timed at
    // the backend's resolution, not the 2s correction tick. A cost quantised
    // to 2s over-aims the next skip by up to that much.
    _positionSub = pm.state.positionStream.listen((position) {
      _syncCorrection.observe(
        nowMs: DateTime.now().millisecondsSinceEpoch,
        positionMs: position.inMilliseconds,
        isPlaying: pm.state.isPlaying,
        isBuffering: pm.state.isBuffering,
      );
    });
    _queueChangedSub ??= pm.queueService.queueChangedStream
        .listen((_) => _onLocalQueueChanged());
    pm.setTransportInterceptor(_interceptTransport);
  }

  void _stopPlaybackObservers() {
    _bufferingSub?.cancel();
    _bufferingSub = null;
    _positionSub?.cancel();
    _positionSub = null;
    _queueChangedSub?.cancel();
    _queueChangedSub = null;
    _bufferingTimer?.cancel();
    _bufferingTimer = null;
    _readyTimer?.cancel();
    _readyTimer = null;
    _stopReadyHandshake();
    _seekDebounceTimer?.cancel();
    _seekDebounceTimer = null;
    _pendingSeekTarget = null;
    _queueSyncDebounceTimer?.cancel();
    _queueSyncDebounceTimer = null;
    _clearLocalCorrections();
    _suppressedBufferingRecheckTimer?.cancel();
    _suppressedBufferingRecheckTimer = null;
    _suppressBufferingUntilMs = 0;
    _isBuffering = false;
    _bufferingReported = false;
    _startedPausedForHandshake = false;
    _playbackManager.setTransportInterceptor(null);
  }

  Future<bool> _interceptTransport(
    TransportAction action, {
    Duration? position,
  }) async {
    if (!_state.enabled || !syncPlayEnabled) return false;
    if (_applyingRemoteCommand) return false;
    _trace(() => 'local ${action.name} intercepted');
    switch (action) {
      case TransportAction.resume:
        await requestUnpause();
        return true;
      case TransportAction.pause:
        // Handing the press to the group swallows the local pause, and a
        // waiting group has no Pause command to send back, so the press would
        // land nowhere. Pausing here is safe because the command that does
        // arrive once everyone is ready carries the group's own position.
        if (_state.groupState == SyncPlayGroupState.waiting) {
          _applyLocalPause();
        }
        await requestPause();
        return true;
      case TransportAction.seek:
        final target = position ?? _playbackManager.state.position;
        // Swallowed either way: under SyncPlay the player only moves on the
        // group's command.
        if (!_isEchoOfGroupSeek(target)) _scheduleSeekRequest(target);
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

  /// Whether a local seek only asks for where the group's last Seek already
  /// sent everyone: an auto-skip re-fired by a landing just short of a
  /// segment end (see `MediaSegmentService._autoSkipped`). The group is
  /// already there, so dropping it loses nothing. A seek the user makes back
  /// to that spot once playback has moved past it still goes through.
  bool _isEchoOfGroupSeek(Duration target) {
    if (_lastGroupSeekAtMs == 0) return false;
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    if (nowMs - _lastGroupSeekAtMs > _maxSeekLatencyMs) return false;
    final targetMs = target.inMilliseconds;
    if ((targetMs - _lastGroupSeekTargetMs).abs() > _seekToleranceMs) {
      return false;
    }
    final currentMs = _playbackManager.state.position.inMilliseconds;
    return currentMs <= targetMs + _seekToleranceMs;
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
    _trace(() => 'player buffering $buffering');
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
      _bufferingTimer?.cancel();
      // Ready answers a wait. A stall the server never heard about (our own
      // seek, inside its suppression window) owes it nothing, and reporting
      // anyway is what starts the Ready/Unpause/seek cycle.
      if (_bufferingReported ||
          _state.groupState == SyncPlayGroupState.waiting) {
        _queueReadyReport();
      }
    }
  }

  void _queueBufferingReport() {
    _bufferingTimer?.cancel();
    _bufferingTimer = Timer(
      const Duration(milliseconds: _bufferingDebounceMs),
      _sendBufferingWithRetry,
    );
  }

  void _queueReadyReport({int attempt = 0}) {
    _readyTimer?.cancel();
    _readyTimer = Timer(
      const Duration(milliseconds: _readyDebounceMs),
      () async {
        if (!_state.enabled || !syncPlayEnabled) return;
        if (!await _isPlaybackPositionStable()) {
          // Dropping this report strands the whole group in Waiting, so retry
          // and report anyway once the attempts run out.
          if (attempt < _maxReadyStabilityRetries) {
            _queueReadyReport(attempt: attempt + 1);
            return;
          }
        }
        _sendReadyWithRetry();
      },
    );
  }

  /// Answers the Waiting handshake the server holds the whole group in. It
  /// leaves that state only once every session has reported Ready, and while it
  /// waits it replies to a pause request with a state update and no command at
  /// all, so a group left waiting on this client has no working transport.
  void _startReadyHandshake({bool restart = false}) {
    if (!_state.enabled || !syncPlayEnabled) return;
    if (_readyWatchdogTimer != null && !restart) return;
    _readyWatchdogTimer?.cancel();
    _readyWatchdogReports = 0;
    _reportReadyIfSettled();
    _readyWatchdogTimer = Timer.periodic(
      const Duration(milliseconds: _readyWatchdogIntervalMs),
      (_) {
        if (!_state.enabled ||
            !syncPlayEnabled ||
            _state.groupState != SyncPlayGroupState.waiting ||
            _readyWatchdogReports >= _maxReadyWatchdogReports) {
          _stopReadyHandshake();
          return;
        }
        _readyWatchdogReports++;
        // A buffering flag that never clears would hold the group forever, and
        // rejoining late beats leaving everyone without controls.
        _reportReadyIfSettled(
          force: _readyWatchdogReports >= _maxReadyWatchdogReports,
        );
      },
    );
  }

  /// Reports Ready only when the player really is. A real stall already has a
  /// Buffering report out that the server is right to wait on, and the recovery
  /// that ends it queues a Ready of its own.
  void _reportReadyIfSettled({bool force = false}) {
    if (_playbackManager.currentResolution == null) {
      _trace(() => 'not ready: no player yet');
      return;
    }
    if (!force && (_playbackManager.state.isBuffering || _isBuffering)) {
      _trace(() => 'not ready: still buffering');
      return;
    }
    _queueReadyReport();
  }

  void _stopReadyHandshake() {
    _readyWatchdogTimer?.cancel();
    _readyWatchdogTimer = null;
    _readyWatchdogReports = 0;
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
      _trace(() => 'sending Buffering for $playlistItemId, attempt $attempt');
      try {
        await api.sendBuffering(
          isPlaying: pm.state.isPlaying,
          playlistItemId: playlistItemId,
          positionTicks: positionTicks,
          when: _serverWhen(),
        );
        _bufferingReported = true;
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
      if (api == null) return;
      if (playlistItemId == null) {
        _logger.w(
          'SyncPlay: no playlist item to report Ready for, group '
          '${_state.groupState.name} is left waiting on this client',
        );
        return;
      }
      final pm = _playbackManager;
      final positionTicks =
          SyncPlayUtils.msToTicks(pm.state.position.inMilliseconds);
      _trace(() => 'sending Ready for $playlistItemId, attempt $attempt');
      try {
        await api.sendReady(
          isPlaying: pm.state.isPlaying,
          playlistItemId: playlistItemId,
          positionTicks: positionTicks,
          when: _serverWhen(),
        );
        _bufferingReported = false;
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
      _trace(() => 'requesting Pause');
      await _api?.sendPause();
    } catch (_) {}
  }

  Future<void> requestUnpause() async {
    if (!_state.enabled || !syncPlayEnabled) return;
    try {
      _trace(() => 'requesting Unpause');
      await _api?.sendUnpause();
    } catch (_) {}
  }

  Future<void> requestSeek(Duration position) async {
    if (!_state.enabled || !syncPlayEnabled) return;
    _trace(() => 'requesting Seek to ${position.inMilliseconds}ms');
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
      _trace(
        () => 'sending our queue of ${ids.length} from ${positionTicks ~/ 10000}ms',
      );
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
