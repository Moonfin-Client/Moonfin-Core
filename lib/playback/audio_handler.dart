import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/audiobook_resume_service.dart';
import '../data/services/cast/cast_target.dart';
import '../data/services/media_server_client_factory.dart';
import '../util/audio_artwork_url.dart';
import '../platform/pip_service.dart';
import '../util/platform_detection.dart';
import '../preference/user_preferences.dart';
import '../ui/navigation/app_router.dart';
import '../ui/widgets/cast_mini_player.dart';
import '../ui/widgets/remote_control_dialog.dart';
import 'aether_backend.dart';
import 'car_artwork.dart';
import 'headless_session_bootstrap.dart';
import 'last_playback_session_store.dart';
import 'media_browse_service.dart';
import 'remote_media_notification_service.dart';

class MoonfinAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final PlaybackManager _manager;
  final MediaServerClientFactory _clientFactory;
  final MediaBrowseService _browse;
  final LastPlaybackSessionStore _lastSessionStore;
  final RemoteMediaNotificationService? _remoteService;

  final List<StreamSubscription> _subs = [];
  final Map<String, BehaviorSubject<Map<String, dynamic>>> _childrenSubjects =
      {};

  Duration? _lastPushedPosition;
  DateTime? _lastPushedAt;
  DateTime? _lastSessionPersist;

  // Claim/release state for the in-app player's audio session (iOS `.playback`
  // category / Android audio focus). Acquired per-playback, kept through pause,
  // released on stop/idle. On Android this only applies when the active backend
  // does not manage focus itself (media3/ExoPlayer does; libmpv does not).
  bool _sessionConfigured = false;
  bool _sessionActive = false;
  bool _resumeAfterInterruption = false;

  static const Duration defaultPausedForegroundGrace = Duration(minutes: 30);

  final Duration pausedForegroundGrace;
  bool _remoteMode = false;
  bool _remotePlaybackInfoActive = false;
  String? _lastRemoteMediaKey;
  Duration? _lastRemotePushedPosition;
  DateTime? _lastRemotePushedAt;
  bool? _lastRemotePlaying;
  bool? _lastRemoteBuffering;
  bool? _lastRemoteCanSeek;
  int _remotePushGeneration = 0;
  Timer? _pausedIdleTimer;
  String? _pausedIdleKey;
  String? _timedOutRemoteMediaKey;
  bool _localPauseTimedOut = false;
  dynamic _lastLocalCurrentItem;

  AetherBackend? _engineNowPlaying;

  MoonfinAudioHandler(
    this._manager,
    this._clientFactory,
    this._browse,
    this._lastSessionStore, {
    this._remoteService,
    this.pausedForegroundGrace = defaultPausedForegroundGrace,
  }) {
    _bindStreams();
    unawaited(_attachAndroidInterruptions());
    _attachEngineNowPlaying();
    _remoteService?.activeSessionNotifier.addListener(_onRemoteSessionChanged);
    // Resolve the artwork provider authority before the first now-playing push
    // so its artUri can be wrapped; harmless no-op off Android.
    unawaited(CarArtwork.instance.ensureReady());
    if (_remoteService?.activeSession != null) {
      _onRemoteSessionChanged();
    }
  }

  bool get _hasLocalItem => _manager.queueService.currentItem != null;
  bool get _shouldMirrorRemote =>
      !_hasLocalItem &&
      !PlatformDetection.isTV &&
      _remoteService?.activeSession != null;
  bool get isRemoteMode => _remoteMode && !_hasLocalItem;
  String? get activeRemoteJellyfinSessionId =>
      isRemoteMode ? _remoteService?.activeSession?.jellyfinSessionId : null;
  CastTargetKind? get activeRemoteCastKind =>
      isRemoteMode ? _remoteService?.activeSession?.castKind : null;

  // stop() cancels _subs; car/lock-screen commands can arrive afterwards, so
  // re-bind before acting on them.
  void _ensureBound() {
    if (_subs.isEmpty) _bindStreams();
  }

  void _bindStreams() {
    final s = _manager.state;
    final q = _manager.queueService;

    _subs.addAll([
      s.playingStream.listen((_) {
        _pushPlaybackState();
        _updateAudioSession();
      }),
      s.bufferingStream.listen((_) => _pushPlaybackState()),
      // The MediaSession interpolates the scrubber from the last pushed
      // position, its timestamp and the speed, so steady linear playback needs
      // no per-tick update. Re-pushing every second would re-assert the active
      // queue item and make Android Auto yank the queue list back to the
      // current track while the user is scrolling it. Only a jump (seek or
      // skip) diverges from the interpolation and is worth a fresh push.
      s.positionStream.listen((_) {
        _maybePersistSession();
        if (_positionJumped()) _pushPlaybackState();
      }),
      s.durationStream.listen((_) => _pushMediaItemForCurrentTrack()),
      q.queueChangedStream.listen((_) {
        if (_hasLocalItem) {
          if (_remoteMode) _exitRemoteMode(emitIdle: false);
          _pushQueue();
          _pushMediaItemForCurrentTrack();
          _pushPlaybackState();
          _updateAudioSession();
          _persistSession();
          return;
        }
        if (_shouldMirrorRemote) {
          _onRemoteSessionChanged();
          return;
        }
        _pushQueue();
        _pushMediaItemForCurrentTrack();
        _pushPlaybackState();
        _updateAudioSession();
        _persistSession();
      }),
      // libmpv<->media3 can switch mid-run; hand focus to ExoPlayer when the
      // new backend manages it natively, re-acquire when it does not.
      _manager.backendChangedStream.listen((backend) {
        if (PlatformDetection.isAndroid && backend.managesAudioFocus) {
          unawaited(_deactivateSession());
        } else {
          _updateAudioSession();
        }
      }),
      // Closing Picture in Picture on iOS takes down the shared Now Playing
      // entry it borrowed, which leaves headphone and lock screen controls
      // dead. A fresh media item makes the platform side rewrite the whole
      // entry, not only the fields that changed.
      if (PlatformDetection.isIOS)
        GetIt.instance<PipService>().onPiPChanged
            .where((inPiP) => !inPiP)
            .listen((_) {
              _pushPlaybackState();
              _pushMediaItemForCurrentTrack();
            }),
    ]);
  }

  void _maybePersistSession() {
    final now = DateTime.now();
    final last = _lastSessionPersist;
    if (last != null && now.difference(last) < const Duration(seconds: 10)) {
      return;
    }
    _persistSession();
  }

  // True when the reported position has diverged from the linear playback the
  // MediaSession is already interpolating, i.e. a seek or skip happened. Steady
  // playback stays within the tolerance and needs no push.
  bool _positionJumped() {
    final base = _lastPushedPosition;
    final at = _lastPushedAt;
    final s = _manager.state;
    if (base == null || at == null || !s.isPlaying) return true;
    final elapsedMs = DateTime.now().difference(at).inMilliseconds;
    final expectedMs =
        base.inMilliseconds + (elapsedMs * s.playbackSpeed).round();
    return (s.position.inMilliseconds - expectedMs).abs() > 3000;
  }

  // Snapshot the audio queue for the media resumption card and empty queue
  // play restore. Audiobooks also refresh the client-authoritative local
  // resume point, which the in-app player only maintains while its own view
  // is open.
  void _persistSession() {
    final current = _manager.queueService.currentItem;
    if (current is! AggregatedItem || !current.isAudioLike) return;
    _lastSessionPersist = DateTime.now();

    final items = _manager.queueService.items
        .whereType<AggregatedItem>()
        .toList(growable: false);
    if (items.isEmpty) return;
    var index = items.indexWhere((i) => i.id == current.id);
    if (index < 0) index = 0;
    final positionMs = _manager.state.position.inMilliseconds;
    final mediaItem = _mediaItemFor(current);

    unawaited(_lastSessionStore.save(LastPlaybackSession(
      serverId: current.serverId,
      itemIds: items.map((i) => i.id).toList(growable: false),
      index: index,
      positionMs: positionMs,
      title: mediaItem.title,
      artist: mediaItem.artist,
      artUri: mediaItem.artUri?.toString(),
      isAudiobook: current.isAudiobook,
    )));

    if (current.isAudiobook && positionMs > 0) {
      unawaited(GetIt.instance<AudiobookResumeService>()
          .save(current.serverId, current.id, positionMs));
    }
  }

  bool _drivesSession(dynamic raw) {
    if (raw is! AggregatedItem) return false;
    if (PlatformDetection.isTV) return raw.isAudioLike;
    return true;
  }

  // Whether the active backend already requests/holds Android audio focus
  // itself (media3/ExoPlayer). Grabbing focus from Dart alongside it makes the
  // two owners fight and ExoPlayer latches a transient AUDIOFOCUS_LOSS.
  bool get _backendManagesFocus =>
      _manager.backend?.managesAudioFocus ?? false;

  // Acquire the session when something is playing and release it when the queue
  // empties. iOS gates on _drivesSession (its session-UI policy). Android gates
  // on the backend: anything playing on a backend that does not hold focus
  // itself needs it acquired here, which is what un-mutes Android Auto on libmpv.
  void _updateAudioSession() {
    if (_remoteMode || _shouldMirrorRemote) return;
    if (PlatformDetection.isAndroid && _backendManagesFocus) return;
    if (!PlatformDetection.isIOS && !PlatformDetection.isAndroid) return;
    final s = _manager.state;
    final q = _manager.queueService;
    final wantActive = s.isPlaying &&
        (PlatformDetection.isIOS
            ? _drivesSession(q.currentItem)
            : q.currentItem != null);
    if (wantActive) {
      _activateSession();
    } else if (q.currentItem == null) {
      _deactivateSession();
    }
  }

  Future<void> _activateSession() async {
    if (_sessionActive) return;
    _sessionActive = true;
    try {
      final session = await AudioSession.instance;
      if (!_sessionConfigured) {
        await session.configure(PlatformDetection.isIOS
            ? const AudioSessionConfiguration(
                avAudioSessionCategory: AVAudioSessionCategory.playback,
                avAudioSessionMode: AVAudioSessionMode.moviePlayback,
              )
            : const AudioSessionConfiguration(
                androidAudioAttributes: AndroidAudioAttributes(
                  contentType: AndroidAudioContentType.music,
                  usage: AndroidAudioUsage.media,
                ),
              ));
        _sessionConfigured = true;
      }
      final granted = await session.setActive(true);
      if (!granted && PlatformDetection.isAndroid) {
        // Android focus denied; retry on the next playing/queue/backend event.
        // iOS keeps the session flagged active so the app stays the Now Playing
        // owner even when setActive momentarily reports false.
        _sessionActive = false;
      }
    } catch (_) {
      _sessionActive = false;
    }
  }

  Future<void> _deactivateSession() async {
    if (!_sessionActive) return;
    _sessionActive = false;
    try {
      final session = await AudioSession.instance;
      await session.setActive(
        false,
        avAudioSessionSetActiveOptions:
            AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
      );
    } catch (_) {}
  }

  // Focus-loss handling for backends that do not manage focus themselves
  // (libmpv): pause when another app takes focus and resume when it returns, if
  // we were the one who paused. This listener lives for the handler's lifetime,
  // so it stays attached across stop() unlike the _subs subscriptions.
  Future<void> _attachAndroidInterruptions() async {
    if (!PlatformDetection.isAndroid) return;
    try {
      final session = await AudioSession.instance;
      session.interruptionEventStream.listen((event) {
        if (_backendManagesFocus || _remoteMode) return;
        if (event.begin) {
          _resumeAfterInterruption = _manager.state.isPlaying;
          if (_resumeAfterInterruption) _manager.pause();
        } else if (_resumeAfterInterruption) {
          _resumeAfterInterruption = false;
          _manager.resume();
        }
      });
    } catch (_) {}
  }

  // iOS music plays on the engine's own Now Playing session, which the system
  // shows in place of this handler's entry. Its presses come back here so they
  // do what ours would. Like the listener above, this outlives stop().
  void _attachEngineNowPlaying() {
    if (!PlatformDetection.isIOS ||
        !GetIt.instance.isRegistered<AetherBackend>()) {
      return;
    }
    final engine = _engineNowPlaying = GetIt.instance<AetherBackend>();
    engine.remoteCommandStream.listen((command) {
      switch (command['event']) {
        case 'play':
          unawaited(play());
        case 'pause':
          unawaited(pause());
        case 'seek':
          final positionMs = (command['positionMs'] as num?)?.toInt();
          if (positionMs != null) {
            unawaited(seek(Duration(milliseconds: positionMs)));
          }
        case 'next':
          unawaited(skipToNext());
        case 'previous':
          unawaited(skipToPrevious());
      }
    });
  }

  void _pushPlaybackState() {
    if (_shouldMirrorRemote) return;
    final s = _manager.state;
    final q = _manager.queueService;

    if (PlatformDetection.isTV && !_drivesSession(q.currentItem)) {
      // No music session (TV video / nothing playing): emit idle so audio_service
      // tears down the foreground notification and system controls.
      playbackState.add(PlaybackState(
        controls: const [],
        systemActions: const {},
        processingState: AudioProcessingState.idle,
        playing: false,
      ));
      _cancelPausedIdleTimer();
      return;
    }

    final currentItem = q.currentItem;
    if (currentItem == null) {
      _lastLocalCurrentItem = null;
      _localPauseTimedOut = false;
      if (_pausedIdleKey?.startsWith('local:') == true) {
        _cancelPausedIdleTimer();
      }
    } else {
      if (!identical(currentItem, _lastLocalCurrentItem)) {
        _lastLocalCurrentItem = currentItem;
        _localPauseTimedOut = false;
      }
      if (s.isPlaying || s.isBuffering) {
        _localPauseTimedOut = false;
        if (_pausedIdleKey?.startsWith('local:') == true) {
          _cancelPausedIdleTimer();
        }
      } else {
        if (_localPauseTimedOut) {
          return;
        }
        _scheduleLocalPausedIdleTimer(currentItem, q.currentIndex);
      }
    }
    final isAudiobook = currentItem is AggregatedItem && currentItem.isAudiobook;

    final controls = isAudiobook
        ? [
            MediaControl.rewind,
            s.isPlaying ? MediaControl.pause : MediaControl.play,
            MediaControl.fastForward,
            MediaControl.skipToNext,
          ]
        : [
            MediaControl.skipToPrevious,
            s.isPlaying ? MediaControl.pause : MediaControl.play,
            MediaControl.skipToNext,
            // Android Auto only renders buttons from the controls list, not from
            // the repeat/shuffle mode fields, so shuffle and repeat are custom
            // actions. The car tints every custom icon the same color, so the
            // active state is carried by a distinct glyph: the "on" variants add
            // a dot below, the Material convention users already recognize.
            MediaControl.custom(
              androidIcon:
                  s.isShuffled ? 'drawable/ic_shuffle_on' : 'drawable/ic_shuffle',
              label: s.isShuffled ? 'Shuffle on' : 'Shuffle',
              name: 'toggle_shuffle',
            ),
            MediaControl.custom(
              androidIcon: switch (q.repeatMode) {
                RepeatMode.none => 'drawable/ic_repeat',
                RepeatMode.repeatAll => 'drawable/ic_repeat_on',
                RepeatMode.repeatOne => 'drawable/ic_repeat_one',
              },
              label: switch (q.repeatMode) {
                RepeatMode.none => 'Repeat off',
                RepeatMode.repeatAll => 'Repeat all',
                RepeatMode.repeatOne => 'Repeat one',
              },
              name: 'toggle_repeat',
            ),
          ];

    _lastPushedPosition = s.position;
    _lastPushedAt = DateTime.now();
    playbackState.add(PlaybackState(
      controls: controls,
      systemActions: {
        MediaAction.seek,
        MediaAction.play,
        MediaAction.pause,
        MediaAction.playPause,
        MediaAction.stop,
        MediaAction.skipToNext,
        MediaAction.skipToPrevious,
        MediaAction.setSpeed,
        MediaAction.setRepeatMode,
        MediaAction.setShuffleMode,
        if (isAudiobook) MediaAction.fastForward,
        if (isAudiobook) MediaAction.rewind,
      },
      androidCompactActionIndices: const [0, 1, 2],
      processingState: s.isBuffering
          ? AudioProcessingState.buffering
          : q.currentItem != null
              ? AudioProcessingState.ready
              : AudioProcessingState.idle,
      playing: s.isPlaying,
      updatePosition: s.position,
      bufferedPosition: s.buffer,
      speed: s.playbackSpeed,
      queueIndex: q.currentIndex,
      // Keep the session's shuffle and repeat state correct for the lock screen,
      // Assistant, and other clients. Android Auto's buttons come from the
      // controls above, not these fields.
      repeatMode: switch (q.repeatMode) {
        RepeatMode.none => AudioServiceRepeatMode.none,
        RepeatMode.repeatOne => AudioServiceRepeatMode.one,
        RepeatMode.repeatAll => AudioServiceRepeatMode.all,
      },
      shuffleMode: s.isShuffled
          ? AudioServiceShuffleMode.all
          : AudioServiceShuffleMode.none,
    ));
  }

  void _onRemoteSessionChanged() {
    if (_hasLocalItem) {
      _timedOutRemoteMediaKey = null;
      if (_remoteMode) _exitRemoteMode(emitIdle: false);
      return;
    }
    final session = _remoteService?.activeSession;
    if (session == null || PlatformDetection.isTV) {
      _timedOutRemoteMediaKey = null;
      if (_remoteMode) _exitRemoteMode(emitIdle: true);
      return;
    }
    if (session.isPlaying || session.isBuffering) {
      _timedOutRemoteMediaKey = null;
      _cancelPausedIdleTimer();
    } else {
      if (_timedOutRemoteMediaKey != null &&
          _timedOutRemoteMediaKey != session.identityKey) {
        _timedOutRemoteMediaKey = null;
      }
      if (_timedOutRemoteMediaKey == session.identityKey) {
        return;
      }
      _scheduleRemotePausedIdleTimer(session.identityKey);
    }
    final mediaChanged =
        !_remoteMode || _lastRemoteMediaKey != session.identityKey;
    _remoteMode = true;
    if (mediaChanged) {
      unawaited(_pushRemoteMediaItemAndState(session));
    } else {
      _syncRemotePlaybackInfo(session);
      _pushRemotePlaybackState(session);
    }
  }

  void _cancelPausedIdleTimer() {
    _pausedIdleTimer?.cancel();
    _pausedIdleTimer = null;
    _pausedIdleKey = null;
  }

  void _scheduleRemotePausedIdleTimer(String identityKey) {
    final key = 'remote:$identityKey';
    if (_pausedIdleTimer != null && _pausedIdleKey == key) {
      return;
    }
    _pausedIdleTimer?.cancel();
    _pausedIdleKey = key;
    _pausedIdleTimer = Timer(pausedForegroundGrace, () {
      if (_pausedIdleKey != key) return;
      _pausedIdleTimer = null;
      _pausedIdleKey = null;
      if (_hasLocalItem || PlatformDetection.isTV) return;
      final current = _remoteService?.activeSession;
      if (current == null ||
          current.identityKey != identityKey ||
          current.isPlaying ||
          current.isBuffering) {
        return;
      }
      _timedOutRemoteMediaKey = identityKey;
      _exitRemoteMode(emitIdle: true);
    });
  }

  void _scheduleLocalPausedIdleTimer(dynamic currentItem, int queueIndex) {
    final key = 'local:${identityHashCode(currentItem)}:$queueIndex';
    if (_pausedIdleTimer != null && _pausedIdleKey == key) {
      return;
    }
    _pausedIdleTimer?.cancel();
    _pausedIdleKey = key;
    _pausedIdleTimer = Timer(pausedForegroundGrace, () {
      if (_pausedIdleKey != key) return;
      _pausedIdleTimer = null;
      _pausedIdleKey = null;
      if (_shouldMirrorRemote) return;
      final q = _manager.queueService;
      final s = _manager.state;
      if (!identical(q.currentItem, currentItem) ||
          q.currentIndex != queueIndex ||
          s.isPlaying ||
          s.isBuffering) {
        return;
      }
      _localPauseTimedOut = true;
      playbackState.add(PlaybackState(
        controls: const [],
        systemActions: const {},
        processingState: AudioProcessingState.idle,
        playing: false,
      ));
    });
  }

  void _exitRemoteMode({required bool emitIdle}) {
    _remoteMode = false;
    _remotePushGeneration++;
    if (_pausedIdleKey?.startsWith('remote:') == true) {
      _cancelPausedIdleTimer();
    }
    _lastRemoteMediaKey = null;
    _lastRemotePushedPosition = null;
    _lastRemotePushedAt = null;
    _lastRemotePlaying = null;
    _lastRemoteBuffering = null;
    _lastRemoteCanSeek = null;
    if (_remotePlaybackInfoActive) {
      _remotePlaybackInfoActive = false;
      try {
        androidPlaybackInfo.add(LocalAndroidPlaybackInfo());
      } catch (_) {}
    }
    if (emitIdle) {
      mediaItem.add(null);
      playbackState.add(PlaybackState(
        controls: const [],
        systemActions: const {},
        processingState: AudioProcessingState.idle,
        playing: false,
      ));
    }
  }

  Future<void> _pushRemoteMediaItemAndState(RemoteMediaSession session) async {
    final gen = ++_remotePushGeneration;
    _lastRemoteMediaKey = session.identityKey;

    MediaServerClient? artClient;
    if (session.serverId != null) {
      artClient = _clientFactory.getClientIfExists(session.serverId!);
    }
    if (artClient == null && GetIt.instance.isRegistered<MediaServerClient>()) {
      artClient = GetIt.instance<MediaServerClient>();
    }
    final authedArt = (session.artUrl != null && artClient != null)
        ? carAuthedImageUrl(artClient, session.artUrl)
        : session.artUrl;
    final wrappedArtUri = CarArtwork.instance.wrap(authedArt);

    if (wrappedArtUri?.scheme == 'content') {
      await CarArtwork.instance.persistHosts();
      if (gen != _remotePushGeneration || !_remoteMode || _hasLocalItem) {
        return;
      }
      final latest = _remoteService?.activeSession;
      if (latest == null || latest.identityKey != session.identityKey) return;
      session = latest;
    }

    final item = MediaItem(
      id: 'remote:${session.sessionId}:${session.itemId}',
      title: session.title,
      artist: session.subtitle,
      album: session.activityLabel,
      duration: session.duration,
      artUri: wrappedArtUri,
      extras: {
        'isRemoteSession': true,
        'remoteSessionId': session.sessionId,
        if (session.jellyfinSessionId != null)
          'jellyfinSessionId': session.jellyfinSessionId,
        if (session.serverId != null) 'serverId': session.serverId,
      },
    );
    queue.add(const []);
    mediaItem.add(item);
    _syncRemotePlaybackInfo(session);
    _pushRemotePlaybackState(session, force: true);
  }

  void _syncRemotePlaybackInfo(RemoteMediaSession session) {
    final supportsVolume =
        session.supportsSetVolume || session.supportsVolumeStep;
    final AndroidPlaybackInfo desired;
    if (!supportsVolume) {
      if (!_remotePlaybackInfoActive) return;
      desired = LocalAndroidPlaybackInfo();
      _remotePlaybackInfoActive = false;
    } else {
      final volumeType = session.supportsSetVolume
          ? AndroidVolumeControlType.absolute
          : AndroidVolumeControlType.relative;
      desired = RemoteAndroidPlaybackInfo(
        volumeControlType: volumeType,
        maxVolume: 100,
        volume: (session.volumePercent ?? 50).clamp(0, 100),
      );
      _remotePlaybackInfoActive = true;
    }
    if (!androidPlaybackInfo.hasValue || androidPlaybackInfo.value != desired) {
      try {
        androidPlaybackInfo.add(desired);
      } catch (_) {}
    }
  }

  bool _remotePositionJumped(RemoteMediaSession session) {
    final base = _lastRemotePushedPosition;
    final at = _lastRemotePushedAt;
    if (base == null || at == null || !session.isPlaying) return true;
    final elapsedMs = DateTime.now().difference(at).inMilliseconds;
    final expectedMs = base.inMilliseconds + elapsedMs;
    return (session.position.inMilliseconds - expectedMs).abs() > 3000;
  }

  void _pushRemotePlaybackState(
    RemoteMediaSession session, {
    bool force = false,
  }) {
    final stateChanged =
        force ||
        _lastRemotePlaying != session.isPlaying ||
        _lastRemoteBuffering != session.isBuffering ||
        _lastRemoteCanSeek != session.canSeek;
    if (!stateChanged && !_remotePositionJumped(session)) {
      return;
    }
    _lastRemotePlaying = session.isPlaying;
    _lastRemoteBuffering = session.isBuffering;
    _lastRemoteCanSeek = session.canSeek;
    _lastRemotePushedPosition = session.position;
    _lastRemotePushedAt = DateTime.now();

    playbackState.add(PlaybackState(
      controls: [
        if (session.canSeek) MediaControl.rewind,
        session.isPlaying ? MediaControl.pause : MediaControl.play,
        if (session.canSeek) MediaControl.fastForward,
        MediaControl.stop,
      ],
      systemActions: {
        MediaAction.play,
        MediaAction.pause,
        MediaAction.playPause,
        MediaAction.stop,
        if (session.canSeek) MediaAction.seek,
        if (session.canSeek) MediaAction.fastForward,
        if (session.canSeek) MediaAction.rewind,
      },
      androidCompactActionIndices:
          session.canSeek ? const [0, 1, 2] : const [0, 1],
      processingState: session.isBuffering
          ? AudioProcessingState.buffering
          : AudioProcessingState.ready,
      playing: session.isPlaying,
      updatePosition: session.position,
      speed: session.isPlaying ? 1.0 : 0.0,
    ));
  }

  void _pushMediaItemForCurrentTrack() {
    if (_shouldMirrorRemote) return;
    final raw = _manager.queueService.currentItem;
    if (raw is! AggregatedItem || (PlatformDetection.isTV && !raw.isAudioLike)) {
      mediaItem.add(null);
      return;
    }
    final item = _mediaItemFor(raw);
    mediaItem.add(item);
    unawaited(
      _engineNowPlaying?.setNowPlaying(
        title: item.title,
        artist: item.artist ?? '',
        artworkUrl: item.artUri?.toString(),
        hasNext: _manager.queueService.hasNext,
      ),
    );
    // The wrapped artUri is only readable once its host is on the provider's
    // allowlist.
    unawaited(CarArtwork.instance.persistHosts());
  }

  void _pushQueue() {
    final items = _manager.queueService.items;
    queue.add(items
        .whereType<AggregatedItem>()
        .map(_mediaItemFor)
        .toList());
    unawaited(CarArtwork.instance.persistHosts());
  }

  MediaItem _mediaItemFor(AggregatedItem item) {
    final client = _clientFor(item);
    final artUri = audioArtUrl(
      item,
      clientFactory: _clientFactory,
      maxHeight: 300,
    );

    final String? artistName;
    if (item.type == 'Episode') {
      artistName = (item.seriesName != null && item.seriesName!.isNotEmpty)
          ? item.seriesName
          : 'TV Show';
    } else if (item.type == 'Movie') {
      final directors = item.people
          .where((p) => p['Type'] == 'Director')
          .map((p) => p['Name'] as String?)
          .whereType<String>()
          .toList();
      if (directors.isNotEmpty) {
        artistName = directors.join(', ');
      } else {
        final studios = item.studios
            .map((s) => s['Name'] as String?)
            .whereType<String>()
            .toList();
        artistName = studios.isNotEmpty ? studios.first : 'Movie';
      }
    } else {
      artistName = item.artists.isNotEmpty
          ? item.artists.join(', ')
          : item.albumArtist;
    }

    // Wrapped and self-authenticating like the browse art: the car host (and
    // notification loaders) fetch this without the app's Authorization header.
    return MediaItem(
      id: item.id,
      title: item.name,
      artist: artistName,
      album: item.album,
      duration: item.runtime,
      artUri: CarArtwork.instance.wrap(carAuthedImageUrl(client, artUri)),
      extras: {'serverId': item.serverId},
    );
  }

  MediaServerClient _clientFor(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  @override
  Future<void> play() async {
    _ensureBound();
    if (isRemoteMode) {
      return _remoteService!.play();
    }
    if (_manager.queueService.currentItem != null) {
      return _manager.resume();
    }
    // Empty queue: a car head unit, steering wheel, or Bluetooth device sent
    // play with nothing loaded, so restore the last audio session.
    final prefs = GetIt.instance<UserPreferences>();
    if (!prefs.get(UserPreferences.resumeLastQueueOnPlay)) return;
    final last = await _lastSessionStore.load();
    if (last == null) return;
    final request = await _browse.resolveLastSession(last);
    if (request == null) return;
    await _manager.playItems(
      request.items,
      startIndex: request.startIndex,
      startPosition: request.startPosition,
    );
  }

  @override
  Future<void> pause() async {
    if (isRemoteMode) {
      return _remoteService!.pause();
    }
    return _manager.pause();
  }

  @override
  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async {
    // A message opened from the root shows itself once, as a playable row
    // that taps through to playFromMediaId, rather than as itself again.
    if (MediaBrowseService.isMessageId(parentMediaId)) {
      return [_browse.messageItem(parentMediaId).copyWith(playable: true)];
    }

    // An uncaught throw here means onLoadChildren never answers and the car
    // shows an endless spinner, so always return something.
    final List<MediaItem> items;
    try {
      items = await _browse.getChildren(parentMediaId, options);
    } catch (_) {
      return const [];
    }

    final isRoot = parentMediaId == AudioService.browsableRootId;
    final message = items.length == 1 &&
            MediaBrowseService.isMessageId(items.single.id)
        ? items.single
        : null;
    if (message == null) {
      if (isRoot) _clearCarError();
      return items;
    }
    if (isRoot) {
      // Google's full screen error wants a null root, which audio_service
      // can't send, and cars show an empty root as "no media". So the message
      // stays a folder here, where its title heads the screen, and the error
      // state reaches hosts that surface it another way. Only with nothing
      // loaded, so a failed listing never covers a song that's playing.
      if (_manager.queueService.currentItem == null) _pushCarError(message);
      return items;
    }
    // audio_service turns anything not playable into a folder, which would
    // hide the message behind a tap. Playable, it shows in the list.
    return [message.copyWith(playable: true)];
  }

  // PlaybackStateCompat error codes, which audio_service passes through but
  // doesn't name.
  static const _errorCodeAppError = 1;
  static const _errorCodeAuthenticationExpired = 3;

  bool _showingCarError = false;

  void _pushCarError(MediaItem message) {
    final errorCode = message.id == MediaBrowseService.signInMessageId
        ? _errorCodeAuthenticationExpired
        : _errorCodeAppError;
    if (_manager.queueService.currentItem != null) {
      // A non-fatal error rides on the real state, so a song keeps its
      // controls and playing state, and the next push clears it. The position
      // is refreshed because copyWith restamps the update time.
      playbackState.add(playbackState.value.copyWith(
        updatePosition: _manager.state.position,
        errorCode: errorCode,
        errorMessage: message.title,
      ));
      return;
    }
    _showingCarError = true;
    _pushErrorState(message.title, errorCode: errorCode);
  }

  void _clearCarError() {
    if (!_showingCarError) return;
    _showingCarError = false;
    _pushPlaybackState();
  }

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(
    String parentMediaId,
  ) =>
      _childrenSubjects.putIfAbsent(
        parentMediaId,
        () => BehaviorSubject.seeded(<String, dynamic>{}),
      );

  /// Makes subscribed car clients re-query [parentMediaId], or all subscribed
  /// parents when null. Called after the headless session restore completes
  /// and on sign-in changes.
  void notifyChildrenChanged([String? parentMediaId]) {
    if (parentMediaId != null) {
      _childrenSubjects[parentMediaId]?.add(<String, dynamic>{});
      return;
    }
    for (final subject in _childrenSubjects.values) {
      subject.add(<String, dynamic>{});
    }
  }

  @override
  Future<void> playFromMediaId(
    String mediaId, [
    Map<String, dynamic>? extras,
  ]) async {
    _ensureBound();
    if (MediaBrowseService.isMessageId(mediaId)) {
      _pushCarError(_browse.messageItem(mediaId));
      return;
    }
    final request = await _browse.resolvePlayRequest(mediaId);
    if (request == null) {
      _pushErrorState(_unavailableMessage);
      return;
    }
    await _playForCar(request);
  }

  static const _unavailableMessage = 'This item is unavailable right now';

  // A throw here would leave the car on a silent "playing" with nothing to say
  // why. Only a request that got no answer blames the server.
  Future<void> _playForCar(PlayRequest request) async {
    try {
      await _manager.playItems(
        request.items,
        startIndex: request.startIndex,
        startPosition: request.startPosition,
      );
    } catch (e) {
      final unreachable =
          e is TimeoutException || (e is DioException && e.response == null);
      _pushErrorState(
        unreachable
            ? _browse.messageItem(MediaBrowseService.offlineMessageId).title
            : _unavailableMessage,
      );
    }
  }

  // Android's media-resumption flow sends prepareFromMediaId followed by play.
  @override
  Future<void> prepareFromMediaId(
    String mediaId, [
    Map<String, dynamic>? extras,
  ]) =>
      playFromMediaId(mediaId, extras);

  @override
  Future<void> playFromSearch(
    String query, [
    Map<String, dynamic>? extras,
  ]) async {
    _ensureBound();
    final request = await _browse.resolveSearchPlay(query);
    if (request == null) {
      _pushErrorState('Nothing found for "$query"');
      return;
    }
    await _playForCar(request);
  }

  @override
  Future<List<MediaItem>> search(
    String query, [
    Map<String, dynamic>? extras,
  ]) =>
      _browse.search(query);

  void _pushErrorState(String message, {int? errorCode}) {
    playbackState.add(PlaybackState(
      controls: const [],
      systemActions: const {},
      processingState: AudioProcessingState.error,
      errorCode: errorCode,
      errorMessage: message,
      playing: false,
    ));
  }

  @override
  Future<void> stop() async {
    _cancelPausedIdleTimer();
    _timedOutRemoteMediaKey = null;
    _localPauseTimedOut = false;
    _lastLocalCurrentItem = null;
    if (isRemoteMode) {
      await _remoteService!.stop();
      if (_hasLocalItem) return;
      _exitRemoteMode(emitIdle: true);
      await super.stop();
      return;
    }
    for (final sub in _subs) {
      sub.cancel();
    }
    _subs.clear();
    await _manager.stop(userInitiated: false);
    await _deactivateSession();
    await super.stop();
  }

  @override
  Future<void> onNotificationDeleted() async {
    if (isRemoteMode) {
      _timedOutRemoteMediaKey = null;
      _remoteService!.dismissCurrent();
      _exitRemoteMode(emitIdle: true);
      return;
    }
    _cancelPausedIdleTimer();
    await super.onNotificationDeleted();
  }

  /// Releases timers, subscriptions, and listeners held by tests.
  @visibleForTesting
  void disposeForTest() {
    _cancelPausedIdleTimer();
    _remoteService?.activeSessionNotifier.removeListener(_onRemoteSessionChanged);
    for (final sub in _subs) {
      unawaited(sub.cancel());
    }
    _subs.clear();
  }

  @override
  Future<void> androidSetRemoteVolume(int volumeIndex) async {
    if (isRemoteMode) {
      await _remoteService!.setVolume(volumeIndex);
    }
  }

  @override
  Future<void> androidAdjustRemoteVolume(
    AndroidVolumeDirection direction,
  ) async {
    if (isRemoteMode) {
      await _remoteService!.adjustVolume(direction.index);
    }
  }

  @override
  Future<void> seek(Duration position) async {
    if (isRemoteMode) {
      return _remoteService!.seek(position);
    }
    return _manager.seekTo(position);
  }

  @override
  Future<void> skipToNext() async {
    if (isRemoteMode) {
      return _remoteService!.skipToNext();
    }
    return _manager.next();
  }

  @override
  Future<void> skipToPrevious() async {
    if (isRemoteMode) {
      return _remoteService!.skipToPrevious();
    }
    return _manager.previous();
  }

  @override
  Future<void> skipToQueueItem(int index) async =>
      _manager.playFromQueue(index);

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    final target = switch (repeatMode) {
      AudioServiceRepeatMode.none => RepeatMode.none,
      AudioServiceRepeatMode.one => RepeatMode.repeatOne,
      AudioServiceRepeatMode.all ||
      AudioServiceRepeatMode.group =>
        RepeatMode.repeatAll,
    };
    while (_manager.queueService.repeatMode != target) {
      _manager.toggleRepeat();
    }
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    final wantShuffle = shuffleMode != AudioServiceShuffleMode.none;
    if (_manager.state.isShuffled != wantShuffle) _manager.toggleShuffle();
  }

  @override
  Future<dynamic> customAction(String name, [Map<String, dynamic>? extras]) async {
    switch (name) {
      // toggleShuffle/toggleRepeat fire queueChangedStream, which re-pushes the
      // playback state (and its updated control icons), same as setShuffleMode.
      case 'toggle_shuffle':
        _manager.toggleShuffle();
      case 'toggle_repeat':
        _manager.toggleRepeat();
      default:
        return super.customAction(name, extras);
    }
  }

  @override
  Future<void> fastForward() async {
    final ms = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>().get(
            UserPreferences.skipForwardLength,
          )
        : 30000;
    final offset = Duration(milliseconds: ms);
    if (isRemoteMode) {
      return _remoteService!.fastForward(offset);
    }
    await _manager.seekTo(_manager.state.position + offset);
  }

  @override
  Future<void> rewind() async {
    final ms = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>().get(UserPreferences.skipBackLength)
        : 10000;
    final offset = Duration(milliseconds: ms);
    if (isRemoteMode) {
      return _remoteService!.rewind(offset);
    }
    final target = _manager.state.position - offset;
    await _manager.seekTo(target < Duration.zero ? Duration.zero : target);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _manager.setPlaybackSpeed(speed);
  }
}

Future<void> initAudioService({
  required PlaybackManager manager,
  required MediaServerClientFactory clientFactory,
}) async {
  final bootstrap = GetIt.instance<HeadlessSessionBootstrap>();
  final browse = GetIt.instance<MediaBrowseService>();
  final lastSessionStore = GetIt.instance<LastPlaybackSessionStore>();
  final remoteService =
      GetIt.instance.isRegistered<RemoteMediaNotificationService>()
      ? GetIt.instance<RemoteMediaNotificationService>()
      : null;

  final handler = await AudioService.init<MoonfinAudioHandler>(
    builder: () => MoonfinAudioHandler(
      manager,
      clientFactory,
      browse,
      lastSessionStore,
      remoteService: remoteService,
    ),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.moonfin.app.audio',
      androidNotificationChannelName: 'Music Playback',
      androidNotificationOngoing: false,
      // Keep the foreground notification alive across temporary pauses so
      // lock-screen / shade controls and the remote session socket remain
      // responsive for resuming. Unbounded battery drain is prevented by
      // MoonfinAudioHandler.defaultPausedForegroundGrace, which emits idle
      // after 30 minutes of continuous pause to release the wake lock and
      // foreground service.
      androidStopForegroundOnPause: false,
      notificationColor: const Color(0xFF1A1A2E),
      androidNotificationIcon: 'drawable/ic_notification',
      androidBrowsableRootExtras: {
        AndroidContentStyle.supportedKey: true,
        AndroidContentStyle.browsableHintKey:
            AndroidContentStyle.categoryListItemHintValue,
        AndroidContentStyle.playableHintKey:
            AndroidContentStyle.listItemHintValue,
      },
    ),
  );

  if (!GetIt.instance.isRegistered<MoonfinAudioHandler>()) {
    GetIt.instance.registerSingleton<MoonfinAudioHandler>(handler);
  }

  remoteService?.start();

  if (PlatformDetection.isAndroid && !PlatformDetection.isTV) {
    AudioService.notificationClicked
        .where((clicked) => clicked)
        .listen((_) {
          if (!handler.isRemoteMode) return;
          final navContext =
              appRouter.routerDelegate.navigatorKey.currentContext;
          if (navContext == null || !navContext.mounted) return;
          final castKind = handler.activeRemoteCastKind;
          final jellyfinSessionId = handler.activeRemoteJellyfinSessionId;
          if (castKind != null && jellyfinSessionId == null) {
            showCastControlsSheet(navContext);
            return;
          }
          showRemoteControlDialog(
            navContext,
            initialSessionId: jellyfinSessionId,
          );
        });
  }

  // Kick the widget-free session restore so a car client that bound the
  // service headlessly gets a populated tree; the notify makes Android Auto
  // re-query the root it may have seen empty during engine startup.
  if (PlatformDetection.isAndroid) {
    unawaited(bootstrap.ensureSession().then((client) {
      if (client != null) handler.notifyChildrenChanged();
    }));
  }
}
