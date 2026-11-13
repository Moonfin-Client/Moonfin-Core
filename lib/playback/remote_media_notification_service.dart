import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../data/services/cast/cast_service.dart';
import '../data/services/cast/cast_target.dart';
import '../data/services/media_server_client_factory.dart';
import '../data/services/socket_handler.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

/// Snapshot of an active remote playback session mirrored into the Android
/// system media notification when no local playback is running.
@immutable
class RemoteMediaSession {
  const RemoteMediaSession({
    required this.sessionId,
    required this.deviceName,
    required this.itemId,
    required this.title,
    required this.position,
    required this.isPlaying,
    this.jellyfinSessionId,
    this.castKind,
    this.subtitle,
    this.activityLabel = 'Watching on Moonfin',
    this.serverId,
    this.artUrl,
    this.duration,
    this.isBuffering = false,
    this.canSeek = false,
    this.supportsSetVolume = false,
    this.supportsVolumeStep = false,
    this.volumePercent,
  });

  final String sessionId;
  final String? jellyfinSessionId;
  final CastTargetKind? castKind;
  final String deviceName;
  final String itemId;
  final String title;
  final String? subtitle;
  final String activityLabel;
  final String? serverId;
  final String? artUrl;
  final Duration? duration;
  final Duration position;
  final bool isPlaying;
  final bool isBuffering;
  final bool canSeek;
  final bool supportsSetVolume;
  final bool supportsVolumeStep;
  final int? volumePercent;

  bool get isCastBacked => castKind != null;
  String get identityKey => '$sessionId:$itemId';

  RemoteMediaSession copyWith({
    Duration? position,
    bool? isPlaying,
    bool? isBuffering,
    int? volumePercent,
  }) {
    return RemoteMediaSession(
      sessionId: sessionId,
      jellyfinSessionId: jellyfinSessionId,
      castKind: castKind,
      deviceName: deviceName,
      itemId: itemId,
      title: title,
      subtitle: subtitle,
      activityLabel: activityLabel,
      serverId: serverId,
      artUrl: artUrl,
      duration: duration,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
      isBuffering: isBuffering ?? this.isBuffering,
      canSeek: canSeek,
      supportsSetVolume: supportsSetVolume,
      supportsVolumeStep: supportsVolumeStep,
      volumePercent: volumePercent ?? this.volumePercent,
    );
  }
}

/// Watches active [CastService] targets and controllable Jellyfin/Emby
/// sessions on the signed-in user's account, exposing the best candidate for
/// the Android mobile system media notification.
class RemoteMediaNotificationService {
  RemoteMediaNotificationService({
    required this._socketHandler,
    required this._castService,
    required this._prefs,
    required this._activeClient,
    this._clientFactory,
    bool? enabledOnPlatform,
    DateTime Function()? now,
  }) : _enabledOnPlatform =
           enabledOnPlatform ??
           (PlatformDetection.isAndroid && !PlatformDetection.isTV),
       _now = now ?? DateTime.now;

  static const Duration pausedSocketGrace = Duration(minutes: 30);

  final SocketHandler _socketHandler;
  final CastService _castService;
  final UserPreferences _prefs;
  final MediaServerClient? Function() _activeClient;
  final MediaServerClientFactory? _clientFactory;
  final bool _enabledOnPlatform;
  final DateTime Function() _now;

  final ValueNotifier<RemoteMediaSession?> activeSessionNotifier = ValueNotifier(
    null,
  );

  /// Incremented every time the paused socket grace window is (re)started, so
  /// listeners holding their own pause deadline (e.g. the notification's
  /// foreground release timer) can renew it under exactly the same conditions.
  /// Identical paused heartbeats do not bump it.
  final ValueNotifier<int> pausedGraceRenewals = ValueNotifier(0);

  final Map<String, Map<String, dynamic>> _sessionsById = {};
  StreamSubscription<ServerWebSocketMessage>? _socketEventSub;
  StreamSubscription<void>? _socketConnSub;
  Timer? _refreshDebounce;
  Timer? _fallbackPollTimer;
  Timer? _pausedGraceTimer;
  DateTime? _lastSessionsPushAt;
  DateTime? _pausedSince;
  String? _pausedIdentityKey;
  bool _started = false;
  bool _subscribedToSessions = false;
  MediaServerClient? _fetchingClient;
  int _sessionGeneration = 0;
  String? _dismissedIdentityKey;
  bool _dismissedWhilePaused = false;
  bool _dismissedIsCastBacked = false;
  bool _dismissedCandidatePlaying = false;
  String? _preferredSessionId;

  RemoteMediaSession? get activeSession => activeSessionNotifier.value;

  bool _isWithinPausedSocketGrace() {
    final pausedSince = _pausedSince;
    if (pausedSince == null) return false;
    return _now().difference(pausedSince) < pausedSocketGrace;
  }

  /// True while mirroring an actively playing or recently paused Jellyfin
  /// remote session (or when one was locally dismissed while still playing) so
  /// the WebSocket stays connected across screen-off / background periods.
  bool get keepsSocketAlive {
    if (!_isFeatureEnabled) return false;
    final session = activeSessionNotifier.value;
    if (session != null) {
      if (session.isCastBacked) return false;
      return session.isPlaying || _isWithinPausedSocketGrace();
    }
    return _dismissedIdentityKey != null &&
        !_dismissedIsCastBacked &&
        _dismissedCandidatePlaying;
  }

  void _clearPausedGrace() {
    _pausedSince = null;
    _pausedIdentityKey = null;
    _pausedGraceTimer?.cancel();
    _pausedGraceTimer = null;
  }

  void _updatePausedGraceFor(RemoteMediaSession session) {
    if (session.isCastBacked || session.isPlaying) {
      _clearPausedGrace();
      return;
    }
    final prev = activeSessionNotifier.value;
    final pausedNewSession =
        _pausedSince == null || _pausedIdentityKey != session.identityKey;
    final transitionedToPaused = prev != null && prev.isPlaying;
    final soughtWhilePaused =
        prev != null &&
        prev.identityKey == session.identityKey &&
        prev.position != session.position;
    if (pausedNewSession || transitionedToPaused || soughtWhilePaused) {
      _pausedSince = _now();
      _pausedIdentityKey = session.identityKey;
      _pausedGraceTimer?.cancel();
      _pausedGraceTimer = Timer(pausedSocketGrace, () {
        _pausedGraceTimer = null;
        _syncFallbackPoll();
      });
      pausedGraceRenewals.value++;
    }
  }

  void _clearDismissedState() {
    _dismissedIdentityKey = null;
    _dismissedWhilePaused = false;
    _dismissedIsCastBacked = false;
    _dismissedCandidatePlaying = false;
  }

  void start() {
    if (_started || !_enabledOnPlatform) return;
    _started = true;

    _prefs.addListener(_onPrefsOrCastChanged);
    _castService.activeKindNotifier.addListener(_onPrefsOrCastChanged);
    _castService.activeTargetNotifier.addListener(_onPrefsOrCastChanged);
    _castService.castItemNotifier.addListener(_onPrefsOrCastChanged);
    _castService.remoteStateNotifier.addListener(_onPrefsOrCastChanged);
    _castService.remotePositionNotifier.addListener(_onPrefsOrCastChanged);
    _castService.remoteVolumeNotifier.addListener(_onPrefsOrCastChanged);

    _socketEventSub = _socketHandler.events.listen(_handleSocketEvent);
    _socketConnSub = _socketHandler.connections.listen((_) {
      _syncSubscription();
      unawaited(refreshSessions());
    });

    _syncSubscription();
    unawaited(refreshSessions());
  }

  /// Clears cached remote sessions (e.g. on sign-out or account switch).
  void clearSessions() {
    _sessionGeneration++;
    _sessionsById.clear();
    _preferredSessionId = null;
    _clearPausedGrace();
    _clearDismissedState();
    _lastSessionsPushAt = null;
    _syncSubscription();
    _recompute();
    _syncFallbackPoll();
  }

  /// Re-evaluates subscription and fetches sessions (e.g. on sign-in or resume).
  Future<void> refresh() async {
    if (!_started) return;
    _syncSubscription();
    final current = activeSessionNotifier.value;
    if (current != null && !current.isCastBacked && !current.isPlaying) {
      _pausedSince = null;
      _updatePausedGraceFor(current);
    }
    await refreshSessions();
    _recompute();
  }

  /// Dismisses the current remote notification locally without stopping TV
  /// playback. Returns once a new item plays or a paused item resumes.
  void dismissCurrent() {
    final current = activeSessionNotifier.value;
    if (current == null) return;
    _dismissedIdentityKey = current.identityKey;
    _dismissedWhilePaused = !current.isPlaying;
    _dismissedIsCastBacked = current.isCastBacked;
    _dismissedCandidatePlaying = current.isPlaying;
    _clearPausedGrace();
    activeSessionNotifier.value = null;
    _syncFallbackPoll();
  }

  void _onPrefsOrCastChanged() {
    _syncSubscription();
    _recompute();
  }

  bool get _isFeatureEnabled =>
      _enabledOnPlatform && _prefs.get(UserPreferences.remoteMediaNotification);

  void _syncSubscription() {
    final wantSubscribed = _started && _isFeatureEnabled && _activeClient() != null;
    if (wantSubscribed == _subscribedToSessions) return;
    _subscribedToSessions = wantSubscribed;
    if (wantSubscribed) {
      _socketHandler.subscribe('Sessions');
    } else {
      _socketHandler.unsubscribe('Sessions');
    }
  }

  void _handleSocketEvent(ServerWebSocketMessage event) {
    if (!_isFeatureEnabled) return;
    switch (event) {
      case SessionsMessage(:final sessions):
        _lastSessionsPushAt = DateTime.now();
        _applySessionsSnapshot(sessions);
      case SessionEndedMessage(:final sessionId):
        if (_sessionsById.remove(sessionId) != null) {
          if (_preferredSessionId == sessionId) {
            _preferredSessionId = null;
          }
          _recompute();
        }
      case PlayMessage():
      case PlaystateMessage():
      case GeneralCommandMessage():
        _scheduleRefresh();
      default:
        break;
    }
  }

  void _scheduleRefresh() {
    if (!_isFeatureEnabled || _refreshDebounce != null) return;
    _refreshDebounce = Timer(const Duration(milliseconds: 250), () {
      _refreshDebounce = null;
      unawaited(refreshSessions());
    });
  }

  Future<void> refreshSessions() async {
    if (!_isFeatureEnabled) return;
    final client = _activeClient();
    if (client == null ||
        client.accessToken == null ||
        client.accessToken!.isEmpty) {
      return;
    }
    if (identical(_fetchingClient, client)) return;
    final generation = _sessionGeneration;
    _fetchingClient = client;
    try {
      final sessions = await client.sessionApi.getSessions(
        controllableByUserId: client.userId,
      );
      if (generation != _sessionGeneration ||
          !identical(client, _activeClient())) {
        return;
      }
      _applySessionsSnapshot(sessions, replaceAll: true);
    } catch (_) {
      // Non-Jellyfin/Emby servers or transient network errors are ignored.
    } finally {
      if (identical(_fetchingClient, client)) _fetchingClient = null;
    }
  }

  void _applySessionsSnapshot(
    List<Map<String, dynamic>> sessions, {
    bool replaceAll = false,
  }) {
    if (replaceAll) {
      _sessionsById.clear();
    }
    for (final session in sessions) {
      final id = session['Id']?.toString();
      if (id == null || id.isEmpty) continue;
      _sessionsById[id] = session;
    }
    _recompute();
  }

  void _recompute() {
    if (!_isFeatureEnabled) {
      _preferredSessionId = null;
      _clearPausedGrace();
      _clearDismissedState();
      _setSession(null);
      _syncFallbackPoll();
      return;
    }

    final candidate = _buildCastCandidate() ?? _buildRemoteSessionCandidate();
    if (candidate == null) {
      _preferredSessionId = null;
      _clearPausedGrace();
      _clearDismissedState();
      _setSession(null);
      _syncFallbackPoll();
      return;
    }

    _preferredSessionId = candidate.sessionId;

    if (_dismissedIdentityKey != null) {
      final sameItem = _dismissedIdentityKey == candidate.identityKey;
      final resumedFromPause = _dismissedWhilePaused && candidate.isPlaying;
      if (sameItem && !resumedFromPause) {
        _dismissedIsCastBacked = candidate.isCastBacked;
        _dismissedCandidatePlaying = candidate.isPlaying;
        _clearPausedGrace();
        _setSession(null);
        _syncFallbackPoll();
        return;
      }
      _clearDismissedState();
    }

    _updatePausedGraceFor(candidate);
    _setSession(candidate);
    _syncFallbackPoll();
  }

  void _setSession(RemoteMediaSession? next) {
    final prev = activeSessionNotifier.value;
    if (_sameSession(prev, next)) return;
    if (next == null) {
      _clearPausedGrace();
    } else {
      _updatePausedGraceFor(next);
    }
    activeSessionNotifier.value = next;
    _syncFallbackPoll();
  }

  void _syncFallbackPoll() {
    final session = activeSessionNotifier.value;
    final hasActiveJellyfin =
        session != null &&
        !session.isCastBacked &&
        (session.isPlaying || _isWithinPausedSocketGrace());
    final hasDismissedJellyfin =
        _dismissedIdentityKey != null && !_dismissedIsCastBacked;
    final needPoll =
        _isFeatureEnabled && (hasActiveJellyfin || hasDismissedJellyfin);
    if (!needPoll) {
      _fallbackPollTimer?.cancel();
      _fallbackPollTimer = null;
      return;
    }
    _fallbackPollTimer ??= Timer.periodic(const Duration(seconds: 10), (_) {
      final last = _lastSessionsPushAt;
      if (last == null ||
          DateTime.now().difference(last) > const Duration(seconds: 8)) {
        unawaited(refreshSessions());
      }
    });
  }

  RemoteMediaSession? _buildCastCandidate() {
    final kind = _castService.activeKindNotifier.value;
    final item = _castService.castItemNotifier.value;
    if (kind == null || item == null) return null;

    final state = _castService.remoteStateNotifier.value;
    if (state == 'idle') return null;

    final target = _castService.activeTargetNotifier.value;
    final deviceName = (target?.title.trim().isNotEmpty ?? false)
        ? target!.title.trim()
        : kind.name;
    final duration = item.runtime;
    final positionTicks = _castService.remotePositionNotifier.value;
    final position = positionTicks > 0
        ? Duration(microseconds: positionTicks ~/ 10)
        : Duration.zero;
    final volume = _castService.remoteVolumeNotifier.value;
    final client =
        (item.serverId.isNotEmpty
            ? _clientFactory?.getClientIfExists(item.serverId)
            : null) ??
        _activeClient();

    return RemoteMediaSession(
      sessionId: target != null ? 'cast:${kind.name}:${target.id}' : 'cast:${kind.name}',
      jellyfinSessionId:
          kind == CastTargetKind.jellyfinSession ? target?.id : null,
      castKind: kind,
      deviceName: deviceName,
      itemId: item.id,
      title: item.name,
      subtitle: _formatSubtitle(
        type: item.type ?? '',
        mediaType: item.rawData['MediaType'] as String?,
        seriesName: item.seriesName,
        channelName: item.rawData['ChannelName'] as String?,
        seasonNumber: item.parentIndexNumber,
        episodeNumber: item.indexNumber,
        productionYear: item.productionYear,
        artists: item.artists,
        albumArtist: item.albumArtist,
        album: item.album,
      ),
      activityLabel: item.isAudioLike
          ? 'Listening on Moonfin'
          : 'Watching on Moonfin',
      serverId: item.serverId,
      artUrl: client?.imageApi.getPrimaryImageUrl(item.id, maxHeight: 300),
      duration: duration,
      position: position,
      isPlaying: state == null || state == 'playing' || state == 'buffering',
      isBuffering: state == null || state == 'buffering',
      canSeek: duration != null && duration > Duration.zero,
      supportsSetVolume: kind != CastTargetKind.airPlay && volume != null,
      volumePercent: volume != null ? (volume * 100).round().clamp(0, 100) : null,
    );
  }

  RemoteMediaSession? _buildRemoteSessionCandidate() {
    final client = _activeClient();
    if (client == null) return null;

    final selfDeviceId = client.deviceInfo.id;
    final currentUserId = client.userId;

    final candidates = <Map<String, dynamic>>[];
    for (final session in _sessionsById.values) {
      final deviceId = session['DeviceId']?.toString();
      if (deviceId != null && deviceId == selfDeviceId) continue;

      if (currentUserId != null && currentUserId.isNotEmpty) {
        final sessionUserId = session['UserId']?.toString();
        if (sessionUserId != null && sessionUserId != currentUserId) continue;
      }

      final nowPlaying = session['NowPlayingItem'];
      if (nowPlaying is! Map<String, dynamic>) continue;

      if (!_isControllable(session)) continue;
      candidates.add(session);
    }

    if (candidates.isEmpty) return null;

    candidates.sort((a, b) => _compareSessions(a, b));
    final chosen = candidates.first;
    final sessionId = chosen['Id']?.toString();
    if (sessionId == null || sessionId.isEmpty) return null;

    final nowPlaying = chosen['NowPlayingItem'] as Map<String, dynamic>;
    final itemId = nowPlaying['Id']?.toString();
    if (itemId == null || itemId.isEmpty) return null;

    final playState = chosen['PlayState'] as Map<String, dynamic>?;
    final deviceName = _deviceNameFor(chosen);
    final runtimeTicks = (nowPlaying['RunTimeTicks'] as num?)?.toInt();
    final positionTicks = (playState?['PositionTicks'] as num?)?.toInt() ?? 0;
    final duration = runtimeTicks != null && runtimeTicks > 0
        ? Duration(microseconds: runtimeTicks ~/ 10)
        : null;
    final position = positionTicks > 0
        ? Duration(microseconds: positionTicks ~/ 10)
        : Duration.zero;
    final isPaused = playState?['IsPaused'] as bool? ?? false;
    final canSeek =
        (playState?['CanSeek'] as bool?) ??
        (duration != null && duration > Duration.zero);
    final volumeLevel = (playState?['VolumeLevel'] as num?)?.round();
    final commands = _supportedCommands(chosen);

    final type = nowPlaying['Type'] as String? ?? '';
    final mediaType = nowPlaying['MediaType'] as String?;
    final isAudioLike =
        type == 'Audio' || type == 'AudioBook' || mediaType == 'Audio';

    return RemoteMediaSession(
      sessionId: sessionId,
      jellyfinSessionId: sessionId,
      deviceName: deviceName,
      itemId: itemId,
      title: nowPlaying['Name'] as String? ?? 'Moonfin',
      subtitle: _formatSubtitle(
        type: type,
        mediaType: mediaType,
        seriesName: nowPlaying['SeriesName'] as String?,
        channelName: nowPlaying['ChannelName'] as String?,
        seasonNumber: (nowPlaying['ParentIndexNumber'] as num?)?.toInt(),
        episodeNumber: (nowPlaying['IndexNumber'] as num?)?.toInt(),
        productionYear: (nowPlaying['ProductionYear'] as num?)?.toInt(),
        artists:
            (nowPlaying['Artists'] as List?)
                ?.whereType<String>()
                .toList(growable: false) ??
            const [],
        albumArtist: nowPlaying['AlbumArtist'] as String?,
        album: nowPlaying['Album'] as String?,
      ),
      activityLabel: isAudioLike
          ? 'Listening on Moonfin'
          : 'Watching on Moonfin',
      artUrl: client.imageApi.getPrimaryImageUrl(itemId, maxHeight: 300),
      duration: duration,
      position: position,
      isPlaying: !isPaused,
      canSeek: canSeek,
      supportsSetVolume: commands.contains('SetVolume'),
      supportsVolumeStep:
          commands.contains('VolumeUp') && commands.contains('VolumeDown'),
      volumePercent: volumeLevel?.clamp(0, 100),
    );
  }

  int _compareSessions(Map<String, dynamic> a, Map<String, dynamic> b) {
    final aId = a['Id']?.toString();
    final bId = b['Id']?.toString();
    if (_preferredSessionId != null) {
      if (aId == _preferredSessionId && bId != _preferredSessionId) return -1;
      if (bId == _preferredSessionId && aId != _preferredSessionId) return 1;
    }

    final aPaused = (a['PlayState'] as Map?)?['IsPaused'] as bool? ?? false;
    final bPaused = (b['PlayState'] as Map?)?['IsPaused'] as bool? ?? false;
    if (aPaused != bPaused) return aPaused ? 1 : -1;

    final aLast = DateTime.tryParse(a['LastActivityDate']?.toString() ?? '');
    final bLast = DateTime.tryParse(b['LastActivityDate']?.toString() ?? '');
    if (aLast != null && bLast != null) return bLast.compareTo(aLast);
    if (aLast != null) return -1;
    if (bLast != null) return 1;
    return 0;
  }

  static bool _isControllable(Map<String, dynamic> session) {
    if (session['SupportsMediaControl'] == true) return true;
    if (session['SupportsRemoteControl'] == true) return true;
    return _supportedCommands(session).isNotEmpty;
  }

  static Set<String> _supportedCommands(Map<String, dynamic> session) {
    final capabilities = session['Capabilities'];
    final raw =
        session['SupportedCommands'] ??
        (capabilities is Map ? capabilities['SupportedCommands'] : null);
    if (raw is! List) return const {};
    return raw.whereType<String>().toSet();
  }

  static String _deviceNameFor(Map<String, dynamic> session) {
    final device = session['DeviceName']?.toString().trim() ?? '';
    if (device.isNotEmpty) return device;
    final client = session['Client']?.toString().trim() ?? '';
    return client.isNotEmpty ? client : 'Remote device';
  }

  static String? _formatSubtitle({
    required String type,
    required String? mediaType,
    required String? seriesName,
    required String? channelName,
    required int? seasonNumber,
    required int? episodeNumber,
    required int? productionYear,
    required List<String> artists,
    required String? albumArtist,
    String? album,
  }) {
    final parts = <String>[];
    if (type == 'Episode') {
      final series = seriesName?.trim() ?? '';
      if (series.isNotEmpty) parts.add(series);
      final epTag = switch ((seasonNumber, episodeNumber)) {
        (final int s, final int e) => 'S${s}E$e',
        (null, final int e) => 'E$e',
        _ => '',
      };
      if (epTag.isNotEmpty) parts.add(epTag);
    } else if (type == 'Audio' ||
        type == 'AudioBook' ||
        type == 'MusicVideo' ||
        mediaType == 'Audio') {
      final artist = artists.isNotEmpty
          ? artists.join(', ')
          : (albumArtist?.trim() ?? '');
      if (artist.isNotEmpty) parts.add(artist);
      final albumName = album?.trim() ?? '';
      if (albumName.isNotEmpty) parts.add(albumName);
    } else if (type == 'Program' || type == 'TvChannel') {
      final channel = channelName?.trim() ?? '';
      if (channel.isNotEmpty) parts.add(channel);
    } else if (productionYear != null) {
      parts.add('$productionYear');
    }
    if (parts.isEmpty) return null;
    return parts.join(' • ');
  }

  static bool _sameSession(RemoteMediaSession? a, RemoteMediaSession? b) {
    if (identical(a, b)) return true;
    if (a == null || b == null) return false;
    return a.sessionId == b.sessionId &&
        a.jellyfinSessionId == b.jellyfinSessionId &&
        a.castKind == b.castKind &&
        a.deviceName == b.deviceName &&
        a.itemId == b.itemId &&
        a.title == b.title &&
        a.subtitle == b.subtitle &&
        a.activityLabel == b.activityLabel &&
        a.artUrl == b.artUrl &&
        a.duration == b.duration &&
        a.position == b.position &&
        a.isPlaying == b.isPlaying &&
        a.isBuffering == b.isBuffering &&
        a.canSeek == b.canSeek &&
        a.supportsSetVolume == b.supportsSetVolume &&
        a.supportsVolumeStep == b.supportsVolumeStep &&
        a.volumePercent == b.volumePercent;
  }

  // --- Transport commands ---

  Future<void> play() async {
    final session = activeSessionNotifier.value;
    if (session == null) return;
    if (session.isCastBacked) {
      await _castService.play(session.castKind!);
      return;
    }
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(session.sessionId, 'Unpause');
    _applyOptimistic(session, isPlaying: true);
    _scheduleRefresh();
  }

  Future<void> pause() async {
    final session = activeSessionNotifier.value;
    if (session == null) return;
    if (session.isCastBacked) {
      await _castService.pause(session.castKind!);
      return;
    }
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(session.sessionId, 'Pause');
    _applyOptimistic(session, isPlaying: false);
    _scheduleRefresh();
  }

  Future<void> stop() async {
    final session = activeSessionNotifier.value;
    if (session == null) return;
    if (session.isCastBacked) {
      await _castService.stop(session.castKind!);
      if (_isSameSession(session)) {
        _setSession(null);
      }
      return;
    }
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(session.sessionId, 'Stop');
    _sessionsById.remove(session.sessionId);
    if (_preferredSessionId == session.sessionId) {
      _preferredSessionId = null;
    }
    if (_isSameSession(session)) {
      _setSession(null);
    }
    _scheduleRefresh();
  }

  Future<void> seek(Duration position) async {
    final session = activeSessionNotifier.value;
    if (session == null || !session.canSeek) return;
    final clamped = position < Duration.zero
        ? Duration.zero
        : (session.duration != null && position > session.duration!)
        ? session.duration!
        : position;
    final ticks = clamped.inMicroseconds * 10;
    if (session.isCastBacked) {
      await _castService.seek(session.castKind!, positionTicks: ticks);
      return;
    }
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(
      session.sessionId,
      'Seek',
      seekPositionTicks: ticks,
    );
    _applyOptimistic(session, position: clamped);
    _scheduleRefresh();
  }

  Future<void> fastForward(Duration offset) async {
    final session = activeSessionNotifier.value;
    if (session == null || !session.canSeek) return;
    await seek(session.position + offset);
  }

  Future<void> rewind(Duration offset) async {
    final session = activeSessionNotifier.value;
    if (session == null || !session.canSeek) return;
    await seek(session.position - offset);
  }

  Future<void> skipToNext() async {
    final session = activeSessionNotifier.value;
    if (session == null || session.isCastBacked) return;
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(
      session.sessionId,
      'NextTrack',
    );
    _scheduleRefresh();
  }

  Future<void> skipToPrevious() async {
    final session = activeSessionNotifier.value;
    if (session == null || session.isCastBacked) return;
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendPlayStateCommand(
      session.sessionId,
      'PreviousTrack',
    );
    _scheduleRefresh();
  }

  Future<void> setVolume(int percent) async {
    final session = activeSessionNotifier.value;
    if (session == null) return;
    final clamped = percent.clamp(0, 100);
    if (session.isCastBacked) {
      await _castService.setVolume(session.castKind!, volume: clamped / 100.0);
      return;
    }
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendGeneralCommand(
      session.sessionId,
      'SetVolume',
      arguments: {'Volume': '$clamped'},
    );
    _applyOptimistic(session, volumePercent: clamped);
    _scheduleRefresh();
  }

  Future<void> adjustVolume(int direction) async {
    final session = activeSessionNotifier.value;
    if (session == null || direction == 0) return;
    if (session.isCastBacked ||
        (!session.supportsVolumeStep && session.supportsSetVolume)) {
      final current = session.volumePercent ?? 50;
      await setVolume(current + (direction > 0 ? 5 : -5));
      return;
    }
    if (!session.supportsVolumeStep) return;
    final client = _activeClient();
    if (client == null) return;
    await client.sessionApi.sendGeneralCommand(
      session.sessionId,
      direction > 0 ? 'VolumeUp' : 'VolumeDown',
    );
    _scheduleRefresh();
  }

  bool _isSameSession(RemoteMediaSession expected) {
    final current = activeSessionNotifier.value;
    return current != null &&
        current.sessionId == expected.sessionId &&
        current.identityKey == expected.identityKey;
  }

  void _applyOptimistic(
    RemoteMediaSession expected, {
    bool? isPlaying,
    Duration? position,
    int? volumePercent,
  }) {
    if (!_isSameSession(expected)) return;
    final current = activeSessionNotifier.value!;
    _setSession(
      current.copyWith(
        isPlaying: isPlaying,
        position: position,
        volumePercent: volumePercent,
      ),
    );
  }

  void dispose() {
    if (!_started) return;
    _started = false;
    _refreshDebounce?.cancel();
    _refreshDebounce = null;
    _fallbackPollTimer?.cancel();
    _fallbackPollTimer = null;
    _clearPausedGrace();
    _socketEventSub?.cancel();
    _socketEventSub = null;
    _socketConnSub?.cancel();
    _socketConnSub = null;
    if (_subscribedToSessions) {
      _subscribedToSessions = false;
      _socketHandler.unsubscribe('Sessions');
    }
    _prefs.removeListener(_onPrefsOrCastChanged);
    _castService.activeKindNotifier.removeListener(_onPrefsOrCastChanged);
    _castService.activeTargetNotifier.removeListener(_onPrefsOrCastChanged);
    _castService.castItemNotifier.removeListener(_onPrefsOrCastChanged);
    _castService.remoteStateNotifier.removeListener(_onPrefsOrCastChanged);
    _castService.remotePositionNotifier.removeListener(_onPrefsOrCastChanged);
    _castService.remoteVolumeNotifier.removeListener(_onPrefsOrCastChanged);
    activeSessionNotifier.dispose();
    pausedGraceRenewals.dispose();
  }
}

