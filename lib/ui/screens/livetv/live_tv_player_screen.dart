import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:screen_brightness_platform_interface/screen_brightness_platform_interface.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../../data/services/log_service.dart';
import '../../../playback/subtitle_style.dart';
import '../../../playback/subtitle_view_config.dart';
import '../../../playback/system_volume.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/html_video_backend.dart';
import '../../../playback/media_kit_player_backend.dart';
import '../../../playback/playback_info_sections.dart';
import '../../../platform/pip_service.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/clock_format.dart';
import '../../../util/subtitle_track_logic.dart';
import '../../../util/platform_detection.dart';
import '../../../util/playback_time_label.dart';
import '../../../util/player_edge_drag.dart';
import '../../../util/system_ui.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/aether_video_view.dart';
import '../../widgets/playback/stream_info_dialog.dart';
import '../../widgets/player_volume_control.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../widgets/live_tv/channel_carousel_overlay.dart';
import '../../widgets/live_tv/incomplete_recording.dart';
import '../../widgets/live_tv/live_tv_recording_dialog.dart';
import '../../widgets/live_tv/live_tv_recording_icon.dart';
import 'channel_tune_observer.dart';
import 'live_tv_guide_screen.dart';
import '../../screensaver/screensaver_controller.dart';

const _kGuideResizeDuration = Duration(milliseconds: 250);

class LiveTvPlayerScreen extends StatefulWidget {
  final List<GuideChannel> channels;
  final int startIndex;

  const LiveTvPlayerScreen({
    super.key,
    required this.channels,
    required this.startIndex,
  });

  @override
  State<LiveTvPlayerScreen> createState() => _LiveTvPlayerScreenState();
}

class _LiveTvPlayerScreenState extends State<LiveTvPlayerScreen>
    with WidgetsBindingObserver, ImmersiveSystemUi {
  final _manager = GetIt.instance<PlaybackManager>();
  // media_kit isn't registered on platforms that run a different backend, so
  // ask the container rather than listing them.
  final MediaKitPlayerBackend? _backend =
      GetIt.instance.isRegistered<MediaKitPlayerBackend>()
      ? GetIt.instance<MediaKitPlayerBackend>()
      : null;
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _screensaverController = GetIt.instance<ScreensaverController>();
  SubtitleStyle? _lastSubtitleStyle;

  MediaKitPlayerBackend? get _activeMediaKitBackend {
    final backend = _manager.backend;
    return backend is MediaKitPlayerBackend ? backend : null;
  }

  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _manager.backend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  HtmlVideoBackend? get _activeHtmlVideoBackend {
    final backend = _manager.backend;
    return backend is HtmlVideoBackend ? backend : null;
  }

  late int _currentIndex;
  bool _infoVisible = true;
  Timer? _hideTimer;
  bool _isStopping = false;
  bool _isSwitching = false;
  bool _isGuidePickerOpen = false;
  final _guideBackController = LiveTvGuideBackController();
  bool _isCarouselOpen = false;
  int _carouselSelectionRevision = 0;

  /// Guide data for the channel changer, warmed at tune time so the first UP
  /// press opens onto real cards. TV-only, like the changer itself.
  ChannelCarouselPrewarm? _carouselPrewarm;
  FocusNode? _carouselPriorFocus;
  bool _carouselPriorInfoVisible = true;
  int _carouselPriorControlIndex = 0;
  DateTime? _suppressBackUntil;
  bool _forcedLandscape = true;

  GuideProgram? _currentProgram;
  LiveTvRecordingState? _recordingState;
  bool _recordingActionInProgress = false;
  bool _recordingRefreshInProgress = false;
  int _programRequestRevision = 0;
  Timer? _programRefreshTimer;
  StreamSubscription<PlayerBackend>? _backendSub;

  /// Watches the bringup state for the whole time the screen is up, not just
  /// while a channel is tuning. A live stream that dies mid-watch is reported
  /// as a failed bringup by the manager once its bounded recovery is spent,
  /// and without a standing listener that report reaches nobody: playback
  /// simply stops and the viewer is left on a still frame with no way back.
  StreamSubscription<PlaybackBringupState>? _liveFailureSub;

  /// Defensive reconcile alongside [_liveFailureSub]: an intermediate
  /// recovery failure the manager already drops can still race a stale
  /// failure card onto the screen. If playback is actually advancing again
  /// while the card is up, clear it rather than trust the card was right.
  StreamSubscription<bool>? _failureCardReconcilePlayingSub;
  StreamSubscription<bool>? _failureCardReconcileBufferingSub;

  /// The tune path reports its own failures, so this must not double up on
  /// them. Only a failure arriving after a channel was playing is this
  /// listener's to report.
  bool _channelIsUp = false;

  /// Progress of the manager's bounded live recovery, or null when none is in
  /// flight. Drives the reconnecting overlay in place of the plain buffering
  /// spinner.
  LiveRecoveryStatus? _liveRecoveryStatus;
  StreamSubscription<LiveRecoveryStatus?>? _liveRecoveryStatusSub;

  /// Whether the persistent failure card is showing. Unlike the old snackbar
  /// it does not time out -- it stays until the viewer retries, tunes
  /// elsewhere, or leaves.
  bool _channelFailed = false;
  String? _failedChannelName;
  final _retryFocus = FocusNode(debugLabel: 'LiveTvRetry');

  /// Guards the focus reclaim below against fighting another widget forever.
  bool _reclaimingFocus = false;
  StreamSubscription<bool>? _screensaverPlayingSub;

  // Brightness and volume swipe gesture state (mobile/tablet). Left half of the
  // screen controls brightness, right half controls volume.
  double _brightnessValue = 0.5;
  double _systemVolume = 1.0;
  bool _showVolumeOverlay = false;
  bool _showBrightnessOverlay = false;
  Timer? _volumeOverlayTimer;
  Timer? _brightnessOverlayTimer;
  StreamSubscription<double>? _brightnessListenerSub;
  StreamSubscription<double>? _volumeListenerSub;
  double? _pendingMobileSystemVolume;
  bool _isApplyingMobileSystemVolume = false;
  double _verticalDragStartY = 0.0;
  double _verticalDragStartValue = 0.0;
  bool _verticalDragIsVolume = false;
  bool _verticalDragIgnored = false;
  int _media3VolumeBoostLevel = 0;

  // Desktop and web drive the player's own volume, from 0 to 100, instead of
  // the system one.
  double _playerVolume = 100;
  double _volumeBeforeMute = 100;
  Timer? _persistVolumeTimer;

  // Android Picture-in-Picture wiring. iOS Live TV PiP needs the separate
  // sample-buffer bridge and is not wired here.
  final _pipService = GetIt.instance<PipService>();
  StreamSubscription<bool>? _pipChangedSub;
  StreamSubscription<String>? _pipActionSub;
  StreamSubscription<bool>? _pipScreenLockSub;
  StreamSubscription<bool>? _pipPlayingSub;
  bool _wasPlayingBeforeScreenLock = false;

  // Captions the player found inside the video, which the server never lists
  // as subtitle streams. Held here rather than in the manager because they have
  // no stream index to hang off, and the id only means anything to the backend
  // that reported it.
  int? _captionTrackId;
  bool _captionTrackApplied = false;
  StreamSubscription<void>? _tracksChangedSub;

  final _overlayFocus = FocusNode();
  final _tvPlayPauseFocus = FocusNode(debugLabel: 'LiveTvPlayPause');
  final _tvChannelsFocus = FocusNode(debugLabel: 'LiveTvChannels');
  final _tvGuideFocus = FocusNode(debugLabel: 'LiveTvGuide');
  final _tvAudioFocus = FocusNode(debugLabel: 'LiveTvAudio');
  final _tvSubtitleFocus = FocusNode(debugLabel: 'LiveTvSubtitle');
  final _tvRecordFocus = FocusNode(debugLabel: 'LiveTvRecord');
  final _tvBitrateFocus = FocusNode(debugLabel: 'LiveTvBitrate');
  final _tvPlaybackInfoFocus = FocusNode(debugLabel: 'LiveTvPlaybackInfo');
  final _tvSkipBackFocus = FocusNode(debugLabel: 'LiveTvSkipBack');
  final _tvSkipForwardFocus = FocusNode(debugLabel: 'LiveTvSkipForward');
  final _tvJumpToLiveFocus = FocusNode(debugLabel: 'LiveTvJumpToLive');

  /// A live window shorter than this is the player's own buffer rather than
  /// anything worth rewinding through.
  static const _minRewindWindow = Duration(minutes: 1);

  /// How far behind the edge still counts as live, since the player sits a
  /// few segments back from it on purpose.
  static const _liveEdgeSlack = Duration(seconds: 10);

  /// Where a rewind or scrub will land, shown on the timeline until it's
  /// sought to, so a held key makes one seek rather than dozens.
  Duration? _seekTarget;
  Timer? _seekCommitTimer;
  DateTime? _scrubHoldStart;

  /// Whether the controls row carries the rewind buttons. The stream reports
  /// its window a little after it starts, so this follows the position.
  bool _canRewind = false;
  StreamSubscription<Duration>? _rewindWindowSub;

  // Index of the currently focused OSD control within _osdFocusOrder. Tracked
  // explicitly so arrow navigation never depends on FocusManager.primaryFocus
  // matching one of these exact nodes.
  int _focusedControlIndex = 0;
  PlayerState get _state => _manager.state;

  @override
  void initState() {
    super.initState();
    _screensaverController.setPlaybackActive(true);
    _screensaverPlayingSub = _state.playingStream.listen(
      _screensaverController.setPlaybackActive,
    );
    _currentIndex = widget.startIndex;
    _applyPlayerDisplayMode();
    _applySubtitleStyle();
    _prefs.addListener(_applySubtitleStyle);
    _backendSub = _manager.backendChangedStream.listen((backend) {
      // A new backend starts at its own default, so it gets the level back.
      if (_usesPlayerVolume) unawaited(backend.setVolume(_playerVolume));
      if (!mounted) return;
      _applySubtitleStyle(force: true);
      _listenForPlayerTrackChanges();
      setState(() {});
    });
    _listenForPlayerTrackChanges();
    _liveFailureSub = _manager.bringupStateStream.listen(_onBringupState);
    _failureCardReconcilePlayingSub = _state.playingStream.listen(
      (_) => _reconcileFailureCardWithPlayback(),
    );
    _failureCardReconcileBufferingSub = _state.bufferingStream.listen(
      (_) => _reconcileFailureCardWithPlayback(),
    );
    _liveRecoveryStatusSub = _manager.liveRecoveryStatusStream.listen((
      status,
    ) {
      if (!mounted) return;
      setState(() => _liveRecoveryStatus = status);
    });
    FocusManager.instance.addListener(_onGlobalFocusChanged);
    _tvPlayPauseFocus.addListener(_onControlFocusChanged);
    _tvChannelsFocus.addListener(_onControlFocusChanged);
    _tvGuideFocus.addListener(_onControlFocusChanged);
    _tvAudioFocus.addListener(_onControlFocusChanged);
    _tvSubtitleFocus.addListener(_onControlFocusChanged);
    _tvRecordFocus.addListener(_onControlFocusChanged);
    _tvBitrateFocus.addListener(_onControlFocusChanged);
    _tvPlaybackInfoFocus.addListener(_onControlFocusChanged);
    _tvSkipBackFocus.addListener(_onControlFocusChanged);
    _tvSkipForwardFocus.addListener(_onControlFocusChanged);
    _tvJumpToLiveFocus.addListener(_onControlFocusChanged);
    _canRewind = _rewindWindow != null;
    _rewindWindowSub = _state.positionStream.listen((_) {
      final canRewind = _rewindWindow != null;
      if (mounted && canRewind != _canRewind) {
        setState(() => _canRewind = canRewind);
      }
    });
    _playCurrentChannel();
    _scheduleHide();
    _startProgramRefresh();

    WidgetsBinding.instance.addObserver(this);
    if (PlatformDetection.isMobile) {
      _initBrightness();
      _initSystemVolume();
    } else if (_usesPlayerVolume) {
      _initPlayerVolume();
    }
    if (PlatformDetection.isAndroid && !PlatformDetection.isTV) {
      _pipService.enableAutoPiP(true, owner: this);
      _pipChangedSub = _pipService.onPiPChanged.listen(_onPiPChanged);
      _pipActionSub = _pipService.onPiPAction.listen(_onPiPAction);
      _pipScreenLockSub = _pipService.onScreenLock.listen(_onScreenLock);
      _pipPlayingSub = _state.playingStream.listen((playing) {
        _pipService.updatePiPActions(isPlaying: playing);
      });
    }
  }

  @override
  void dispose() {
    _screensaverPlayingSub?.cancel();
    _screensaverController.setPlaybackActive(false);
    _carouselPrewarm?.dispose();
    _hideTimer?.cancel();
    _seekCommitTimer?.cancel();
    _rewindWindowSub?.cancel();
    _programRefreshTimer?.cancel();
    _backendSub?.cancel();
    _liveFailureSub?.cancel();
    _failureCardReconcilePlayingSub?.cancel();
    _failureCardReconcileBufferingSub?.cancel();
    _liveRecoveryStatusSub?.cancel();
    _retryFocus.dispose();
    _prefs.removeListener(_applySubtitleStyle);
    FocusManager.instance.removeListener(_onGlobalFocusChanged);
    _tracksChangedSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _volumeOverlayTimer?.cancel();
    _brightnessOverlayTimer?.cancel();
    _pipChangedSub?.cancel();
    _pipActionSub?.cancel();
    _pipScreenLockSub?.cancel();
    _pipPlayingSub?.cancel();
    if (PlatformDetection.isAndroid && !PlatformDetection.isTV) {
      _pipService.enableAutoPiP(false, owner: this);
    }
    _volumeListenerSub?.cancel();
    if (_persistVolumeTimer?.isActive ?? false) {
      _persistVolumeTimer!.cancel();
      unawaited(_prefs.set(UserPreferences.playerVolume, _playerVolume));
    }
    if (PlatformDetection.isMobile) {
      VolumeController.instance.removeListener();
      _brightnessListenerSub?.cancel();
      Future.microtask(() async {
        try {
          if (PlatformDetection.isIOS) {
            await ScreenBrightnessPlatform.instance.setAutoReset(true);
          } else {
            await ScreenBrightnessPlatform.instance
                .resetApplicationScreenBrightness();
          }
        } catch (_) {}
      });
    }
    _tvPlayPauseFocus.removeListener(_onControlFocusChanged);
    _tvChannelsFocus.removeListener(_onControlFocusChanged);
    _tvGuideFocus.removeListener(_onControlFocusChanged);
    _tvAudioFocus.removeListener(_onControlFocusChanged);
    _tvSubtitleFocus.removeListener(_onControlFocusChanged);
    _tvRecordFocus.removeListener(_onControlFocusChanged);
    _tvBitrateFocus.removeListener(_onControlFocusChanged);
    _tvPlaybackInfoFocus.removeListener(_onControlFocusChanged);
    _tvSkipBackFocus.removeListener(_onControlFocusChanged);
    _tvSkipForwardFocus.removeListener(_onControlFocusChanged);
    _tvJumpToLiveFocus.removeListener(_onControlFocusChanged);
    _overlayFocus.dispose();
    _tvPlayPauseFocus.dispose();
    _tvChannelsFocus.dispose();
    _tvGuideFocus.dispose();
    _tvAudioFocus.dispose();
    _tvSubtitleFocus.dispose();
    _tvRecordFocus.dispose();
    _tvBitrateFocus.dispose();
    _tvPlaybackInfoFocus.dispose();
    _tvSkipBackFocus.dispose();
    _tvSkipForwardFocus.dispose();
    _tvJumpToLiveFocus.dispose();
    if (!_isStopping) {
      _manager.stop(userInitiated: false);
    }
    unawaited(_releasePlayerDisplayMode());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    // Android keeps the video rendering when backgrounded so the OS can capture
    // a live frame for auto-PiP. On resume, re-read the system brightness in
    // case it changed while away.
    if (lifecycleState == AppLifecycleState.resumed &&
        PlatformDetection.isMobile) {
      _syncBrightnessFromSystem();
    }
    if (lifecycleState == AppLifecycleState.resumed) {
      unawaited(_carouselPrewarm?.onAppResumed());
    }
  }

  void _onPiPChanged(bool isInPiP) {
    if (!mounted) return;
    if (!isInPiP) {
      _applyPlayerDisplayMode();
      _showInfo();
    }
  }

  void _onPiPAction(String action) {
    switch (action) {
      case 'playPause':
        if (_state.isPlaying) {
          _manager.pause();
        } else {
          _manager.resume();
        }
      case 'play':
        _manager.resume();
      case 'pause':
        _manager.pause();
      case 'dismissed':
        final lifecycle = WidgetsBinding.instance.lifecycleState;
        final isForeground =
            lifecycle == AppLifecycleState.resumed ||
            lifecycle == AppLifecycleState.inactive;
        if (isForeground) return;
        _exitPlayback();
    }
  }

  void _onScreenLock(bool locked) {
    if (locked) {
      _wasPlayingBeforeScreenLock = _state.isPlaying;
      if (_wasPlayingBeforeScreenLock) {
        _manager.pause();
      }
    } else if (_wasPlayingBeforeScreenLock) {
      _wasPlayingBeforeScreenLock = false;
      _manager.resume();
    }
  }

  void _initBrightness() {
    final brightness = ScreenBrightnessPlatform.instance;
    Future.microtask(() async {
      try {
        if (PlatformDetection.isIOS) {
          await brightness.setAutoReset(true);
          final current = await brightness.system;
          if (mounted) setState(() => _brightnessValue = current);
          _brightnessListenerSub = brightness.onSystemScreenBrightnessChanged
              .listen((value) {
                if (mounted && (value - _brightnessValue).abs() > 0.01) {
                  setState(() => _brightnessValue = value);
                }
              });
        } else {
          await brightness.setAutoReset(false);
          final current = await brightness.application;
          if (mounted) setState(() => _brightnessValue = current);
          _brightnessListenerSub = brightness
              .onApplicationScreenBrightnessChanged
              .listen((value) {
                if (mounted && (value - _brightnessValue).abs() > 0.01) {
                  setState(() => _brightnessValue = value);
                }
              });
        }
      } catch (_) {}
    });
  }

  void _syncBrightnessFromSystem() {
    Future.microtask(() async {
      try {
        final current = PlatformDetection.isIOS
            ? await ScreenBrightnessPlatform.instance.system
            : await ScreenBrightnessPlatform.instance.application;
        if (mounted && (current - _brightnessValue).abs() > 0.01) {
          setState(() => _brightnessValue = current);
        }
      } catch (_) {}
    });
  }

  Future<void> _setBrightness(double value) async {
    try {
      final clamped = value.clamp(0.0, 1.0);
      if (PlatformDetection.isIOS) {
        await ScreenBrightnessPlatform.instance.setSystemScreenBrightness(
          clamped,
        );
      } else {
        await ScreenBrightnessPlatform.instance.setApplicationScreenBrightness(
          clamped,
        );
      }
    } catch (_) {}
  }

  void _initSystemVolume() {
    final vc = VolumeController.instance;
    vc.showSystemUI = false;
    unawaited(_manager.backend?.setVolume(100.0));
    _volumeListenerSub = listenToSystemVolume((value) {
      if (mounted && (value - _systemVolume).abs() > 0.01) {
        setState(() => _systemVolume = value);
      }
      if (value < 0.99 &&
          _media3VolumeBoostLevel > 0 &&
          _activeMedia3Backend != null) {
        unawaited(_setMedia3VolumeBoostLevel(0));
      }
    });
  }

  bool get _usesPlayerVolume =>
      !PlatformDetection.isMobile && !PlatformDetection.isTV;

  void _initPlayerVolume() {
    _playerVolume = _prefs
        .get(UserPreferences.playerVolume)
        .clamp(0.0, 100.0)
        .toDouble();
    unawaited(_manager.backend?.setVolume(_playerVolume));
    _manager.reportVolumeState(
      volume: _playerVolume,
      isMuted: _playerVolume <= 0,
    );
    // A session remote sets the level without coming through here.
    _volumeListenerSub = _manager.volumeStream.listen((level) {
      if (!mounted || (level - _playerVolume).abs() < 0.5) return;
      setState(() => _playerVolume = level);
      _persistPlayerVolume();
    });
  }

  void _setPlayerVolume(double fraction) {
    final level = (fraction * 100).clamp(0.0, 100.0).toDouble();
    setState(() => _playerVolume = level);
    unawaited(_manager.backend?.setVolume(level));
    _manager.reportVolumeState(volume: level, isMuted: level <= 0);
    _persistPlayerVolume();
  }

  void _togglePlayerMute() {
    if (_playerVolume > 0) {
      _volumeBeforeMute = _playerVolume;
      _setPlayerVolume(0);
    } else {
      _setPlayerVolume(_volumeBeforeMute / 100);
    }
  }

  void _persistPlayerVolume() {
    _persistVolumeTimer?.cancel();
    _persistVolumeTimer = Timer(const Duration(milliseconds: 400), () {
      unawaited(_prefs.set(UserPreferences.playerVolume, _playerVolume));
    });
  }

  Future<void> _setMobileSystemVolume(
    double value, {
    bool syncFromSystem = false,
  }) async {
    final clamped = value.clamp(0.0, 1.0);
    if (mounted && (clamped - _systemVolume).abs() > 0.01) {
      setState(() => _systemVolume = clamped);
    }
    _pendingMobileSystemVolume = clamped;
    if (_isApplyingMobileSystemVolume) return;
    _isApplyingMobileSystemVolume = true;
    try {
      while (_pendingMobileSystemVolume != null) {
        final next = _pendingMobileSystemVolume!;
        _pendingMobileSystemVolume = null;
        await VolumeController.instance.setVolume(next);
      }
      if (syncFromSystem) {
        final actual = await VolumeController.instance.getVolume();
        if (mounted && (actual - _systemVolume).abs() > 0.01) {
          setState(() => _systemVolume = actual);
        }
      }
    } catch (_) {
    } finally {
      _isApplyingMobileSystemVolume = false;
    }
  }

  Future<void> _setMedia3VolumeBoostLevel(int level) async {
    final backend = _activeMedia3Backend;
    if (backend == null) return;
    final clampedLevel = level.clamp(0, 10).toInt();
    if (_media3VolumeBoostLevel != clampedLevel) {
      if (mounted) {
        setState(() => _media3VolumeBoostLevel = clampedLevel);
      } else {
        _media3VolumeBoostLevel = clampedLevel;
      }
    }
    await backend.setVolumeBoostLevel(clampedLevel);
  }

  void _showVolumeIndicator() {
    setState(() => _showVolumeOverlay = true);
    _volumeOverlayTimer?.cancel();
    _volumeOverlayTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showVolumeOverlay = false);
    });
  }

  void _showBrightnessIndicator() {
    setState(() => _showBrightnessOverlay = true);
    _brightnessOverlayTimer?.cancel();
    _brightnessOverlayTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showBrightnessOverlay = false);
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
    final size = MediaQuery.sizeOf(context);
    _verticalDragStartY = details.localPosition.dy;
    _verticalDragIgnored = startsInSystemEdgeStrip(
      _verticalDragStartY,
      size.height,
      MediaQuery.paddingOf(context),
    );
    if (_verticalDragIgnored) return;
    _verticalDragIsVolume = details.localPosition.dx > size.width / 2;
    if (_verticalDragIsVolume) {
      final includeBoost = _activeMedia3Backend != null;
      _verticalDragStartValue = includeBoost
          ? _systemVolume + (_media3VolumeBoostLevel / 10.0)
          : _systemVolume;
      return;
    }
    _verticalDragStartValue = _brightnessValue;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_verticalDragIgnored) return;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final deltaY = _verticalDragStartY - details.localPosition.dy;
    final deltaValue = deltaY / (screenHeight * 0.7);

    if (_verticalDragIsVolume) {
      final media3Backend = _activeMedia3Backend;
      if (media3Backend != null) {
        final rawEffective = (_verticalDragStartValue + deltaValue)
            .clamp(0.0, 2.0)
            .toDouble();
        final newSystemVolume = rawEffective.clamp(0.0, 1.0).toDouble();
        final newBoostLevel = rawEffective <= 1.0
            ? 0
            : ((rawEffective - 1.0) * 10.0).round().clamp(0, 10).toInt();
        unawaited(_setMedia3VolumeBoostLevel(newBoostLevel));
        unawaited(_setMobileSystemVolume(newSystemVolume));
      } else {
        final newVolume = (_verticalDragStartValue + deltaValue)
            .clamp(0.0, 1.0)
            .toDouble();
        unawaited(_setMobileSystemVolume(newVolume));
      }
      _showVolumeIndicator();
    } else {
      final newBrightness = (_verticalDragStartValue + deltaValue).clamp(
        0.0,
        1.0,
      );
      _brightnessValue = newBrightness;
      _setBrightness(newBrightness);
      _showBrightnessIndicator();
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_verticalDragIgnored) return;
    if (_verticalDragIsVolume) {
      unawaited(_setMobileSystemVolume(_systemVolume, syncFromSystem: true));
    }
  }

  void _onVerticalDragCancel() {
    if (_verticalDragIgnored) return;
    if (_verticalDragIsVolume) {
      unawaited(_setMobileSystemVolume(_systemVolume, syncFromSystem: true));
    }
  }

  bool get _indicatorsInverted =>
      _prefs.get(UserPreferences.gestureIndicatorPlacement) ==
      GestureIndicatorPlacement.inverted;

  Widget _buildVolumeOverlay() {
    final displayVolume = _systemVolume;
    final usingMedia3Boost = _activeMedia3Backend != null;
    final overlayProgress = usingMedia3Boost
        ? ((displayVolume * 100.0) + (_media3VolumeBoostLevel * 10.0)).clamp(
                0.0,
                200.0,
              ) /
              200.0
        : displayVolume.clamp(0.0, 1.0);
    final overlayLabel = usingMedia3Boost && _media3VolumeBoostLevel > 0
        ? 'Volume +$_media3VolumeBoostLevel'
        : '${(displayVolume * 100).round()}%';
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _showVolumeOverlay ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: IgnorePointer(
          child: Align(
            alignment: Alignment(_indicatorsInverted ? -0.85 : 0.85, 0.0),
            child: _buildGestureIndicator(
              icon: displayVolume <= 0
                  ? Icons.volume_off_rounded
                  : displayVolume < 0.5
                  ? Icons.volume_down_rounded
                  : Icons.volume_up_rounded,
              value: overlayProgress,
              label: overlayLabel,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrightnessOverlay() {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _showBrightnessOverlay ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: IgnorePointer(
          child: Align(
            alignment: Alignment(_indicatorsInverted ? 0.85 : -0.85, 0.0),
            child: _buildGestureIndicator(
              icon: _brightnessValue <= 0.25
                  ? Icons.brightness_low_rounded
                  : _brightnessValue >= 0.75
                  ? Icons.brightness_high_rounded
                  : Icons.brightness_medium_rounded,
              value: _brightnessValue,
              label: '${(_brightnessValue * 100).round()}%',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGestureIndicator({
    required IconData icon,
    required double value,
    required String label,
  }) {
    const barHeight = 120.0;
    final fillHeight = barHeight * value.clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: AppRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptiveIcon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 10),
          SizedBox(
            height: barHeight,
            width: 4,
            child: ClipRRect(
              borderRadius: AppRadius.circular(2),
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: ColoredBox(color: Colors.white24),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: fillHeight,
                    child: const ColoredBox(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 88,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GuideChannel get _currentChannel => widget.channels[_currentIndex];

  Future<bool> _playCurrentChannel() async {
    // A channel change starts a new stream, so whatever caption choice is
    // remembered has to be put back once this one reports its own captions.
    _captionTrackApplied = false;
    // The old channel is no longer up, and until the new one is, a failure
    // belongs to the tune below and nothing else. Left set, the persistent
    // listener claims the same failure first and the viewer gets told twice.
    _channelIsUp = false;
    _clearChannelFailedCard();
    _seekCommitTimer?.cancel();
    _seekTarget = null;
    final channel = _currentChannel;
    unawaited(_prefs.set(UserPreferences.liveTvLastChannelId, channel.id));
    final item = AggregatedItem(
      id: channel.id,
      serverId: _client.baseUrl,
      rawData: channel.rawData,
    );
    final allowDirect = _prefs.get(UserPreferences.liveTvDirectPlayEnabled);
    final terminalState = await observeChannelTune(
      channelId: channel.id,
      states: _manager.bringupStateStream,
      timeout: channelTuneTimeout,
      start: () => _manager.playItems(
        [item],
        enableDirectPlay: allowDirect,
        // Never withdrawn with direct play. A viewer who turns direct play off
        // wants the server to serve the channel, not to re-encode it: the
        // remux keeps the original codecs and arrives as HLS, which has the
        // live window a raw transport stream never had. Withdrawing both left
        // them with a transcode nobody asked for.
        enableDirectStream: true,
        // Keep transcoding available as a fallback so a failed direct-play
        // of the upstream URL recovers to the server transcode instead of
        // erroring.
        enableTranscoding: true,
      ),
    );
    if (!mounted || _isStopping || _currentChannel.id != channel.id) {
      return false;
    }
    final succeeded = terminalState?.phase == PlaybackBringupPhase.ready;
    _channelIsUp = succeeded;
    if (!succeeded) {
      _showChannelFailedCard(channel.name);
      return false;
    }
    _applySubtitleStyle(force: true);
    unawaited(_fetchCurrentProgram());
    _warmChannelCarousel();
    return true;
  }

  /// A failure that arrives once a channel is playing is the manager saying
  /// its bounded recovery could not save the stream. The tune path never sees
  /// it, because by then it has already returned.
  void _onBringupState(PlaybackBringupState state) {
    if (!mounted || _isStopping || !_channelIsUp) return;
    if (state.phase != PlaybackBringupPhase.failed) return;
    _channelIsUp = false;
    _showChannelFailedCard(_currentChannel.name);
  }

  /// Belt and braces: the manager suppresses an intermediate recovery
  /// failure so this screen never sees it, but if something still leaves
  /// the failure card up while the stream is genuinely playing again, drop
  /// it rather than leave the viewer looking at a stale Retry card.
  void _reconcileFailureCardWithPlayback() {
    if (!mounted || !_channelFailed) return;
    if (!_state.isPlaying || _state.isBuffering) return;
    _channelIsUp = true;
    _clearChannelFailedCard();
  }

  /// Shows the persistent failure card. It stays up until the viewer retries,
  /// tunes to another channel, or leaves -- unlike the snackbar it replaces,
  /// it never times out on its own.
  void _showChannelFailedCard(String channelName) {
    if (!mounted) return;
    setState(() {
      _channelFailed = true;
      _failedChannelName = channelName;
    });
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_channelFailed) return;
        _retryFocus.requestFocus();
      });
    }
  }

  void _clearChannelFailedCard() {
    if (!_channelFailed) return;
    setState(() {
      _channelFailed = false;
      _failedChannelName = null;
    });
  }

  /// Where focus rests when nothing on the OSD holds it: Retry while the
  /// failure card is up, so OK retries, otherwise the screen itself.
  void _focusPlayerRoot() {
    if (_channelFailed && PlatformDetection.isTV) {
      _retryFocus.requestFocus();
    } else {
      _overlayFocus.requestFocus();
    }
  }

  /// What the failure card's Retry control does.
  Future<void> _retryCurrentChannel() async {
    if (_isSwitching) return;
    _isSwitching = true;
    try {
      await _playCurrentChannel();
    } finally {
      _isSwitching = false;
    }
  }

  /// Takes focus back when something off-screen steals it.
  ///
  /// While this player is the route on top, every remote key belongs to it.
  /// A screen underneath that defers a focus request to a post-frame callback
  /// can land it after the player opened -- the route below is still mounted,
  /// so its own `mounted` check passes -- and from then on the remote appears
  /// dead: keys go to a widget nobody can see and the overlay never opens.
  /// The screens that did this are fixed, but this is the cheap backstop that
  /// makes the player robust against any other one, and the symptom is bad
  /// enough to be worth belt and braces.
  void _onGlobalFocusChanged() {
    if (!mounted || _isStopping || _reclaimingFocus) return;
    final route = ModalRoute.of(context);
    // Not our turn: a dialog or another screen is legitimately on top.
    if (route != null && !route.isCurrent) return;
    final focused = FocusManager.instance.primaryFocus;
    // Anything inside this screen -- the overlay buttons, the channel
    // carousel -- is ours and keeps what it took.
    if (focused != null &&
        (focused == _overlayFocus ||
            _overlayFocus.descendants.contains(focused))) {
      return;
    }
    // A null focus counts. When the OSD hides, the control that had focus is
    // unmounted, and focus is left for the framework to place: it walks up and
    // hands it to whichever scope still remembers a focused child, which can
    // be the screen underneath. That is how the remote goes dead after the
    // overlay has been used once, with no code here ever asking for it.
    _reclaimingFocus = true;
    GetIt.instance<LogService>().playback(
      'Live TV: focus left the player for '
      '${focused?.debugLabel ?? focused ?? 'nothing'}, taking it back',
      level: LogLevel.info,
    );
    // After this frame: reclaiming mid-notification would re-enter the
    // FocusManager while it is still dispatching this change.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reclaimingFocus = false;
      if (!mounted || _isStopping) return;
      final current = ModalRoute.of(context);
      if (current != null && !current.isCurrent) return;
      _focusPlayerRoot();
    });
  }

  Future<void> _switchChannel(int newIndex) async {
    if (_isSwitching) return;
    _isSwitching = true;
    try {
      setState(() {
        _currentIndex = newIndex;
        _currentProgram = null;
        _infoVisible = true;
      });
      await _playCurrentChannel();
      _scheduleHide();
    } finally {
      _isSwitching = false;
    }
  }

  Future<bool> _fetchCurrentProgram({bool withRecording = true}) async {
    final channelId = _currentChannel.id;
    final revision = ++_programRequestRevision;
    try {
      final now = DateTime.now();
      final response = await _client.liveTvApi.getGuide(
        startDate: now.subtract(const Duration(minutes: 30)),
        endDate: now.add(const Duration(hours: 3)),
        channelIds: [channelId],
        fields: 'Overview',
        enableTotalRecordCount: false,
        userId: _client.userId,
      );
      final items = (response['Items'] as List?) ?? [];
      if (!mounted ||
          _currentChannel.id != channelId ||
          revision != _programRequestRevision) {
        return false;
      }
      if (items.isEmpty) {
        setState(() {
          _currentProgram = null;
          _recordingState = null;
        });
        return false;
      }

      Map<String, dynamic>? selected;
      DateTime? selectedStart;
      DateTime? selectedEnd;
      for (final item in items) {
        final raw = item as Map<String, dynamic>;
        final start = parseServerDate(raw['StartDate'])?.toLocal();
        final end = parseServerDate(raw['EndDate'])?.toLocal();
        if (start == null || end == null) continue;

        selected ??= raw;
        selectedStart ??= start;
        selectedEnd ??= end;
        if (!now.isBefore(start) && now.isBefore(end)) {
          selected = raw;
          selectedStart = start;
          selectedEnd = end;
          break;
        }
      }

      if (selected == null || selectedStart == null || selectedEnd == null) {
        return false;
      }

      // A channel switch can complete while this request is in flight. Don't
      // let an older response overwrite the newly selected channel's OSD.
      if (!mounted ||
          _currentChannel.id != channelId ||
          revision != _programRequestRevision) {
        return false;
      }

      final selectedMap = selected;
      final selectedProgramStart = selectedStart;
      final selectedProgramEnd = selectedEnd;

      setState(() {
        if (_currentProgram?.id != selectedMap['Id']?.toString()) {
          _recordingState = null;
        }
        _currentProgram = GuideProgram(
          id: selectedMap['Id']?.toString() ?? '',
          channelId: channelId,
          name: selectedMap['Name']?.toString() ?? '',
          startDate: selectedProgramStart,
          endDate: selectedProgramEnd,
          overview: selectedMap['Overview'] as String?,
          episodeTitle: selectedMap['EpisodeTitle'] as String?,
          isMovie: selectedMap['IsMovie'] == true,
          isSeries: selectedMap['IsSeries'] == true,
          isSports: selectedMap['IsSports'] == true,
          isNews: selectedMap['IsNews'] == true,
          isKids: selectedMap['IsKids'] == true,
          isPremiere: selectedMap['IsPremiere'] == true,
          hasTimer: selectedMap['TimerId'] != null,
          hasSeriesTimer: selectedMap['SeriesTimerId'] != null,
          rawData: selectedMap,
        );
      });
      if (!withRecording) return true;
      final timers = await _client.liveTvApi.getTimers();
      if (!mounted ||
          _currentChannel.id != channelId ||
          revision != _programRequestRevision) {
        return false;
      }
      setState(() {
        _recordingState = LiveTvRecordingState.fromProgram(
          selectedMap,
          (timers['Items'] as List?) ?? const [],
        );
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  bool get _canRecordCurrentProgram => canRecordAiring(_currentProgram);

  Future<void> _showRecordingDialog() async {
    if (_recordingActionInProgress || _isSwitching || _isStopping) return;
    final l10n = AppLocalizations.of(context);
    _recordingActionInProgress = true;
    _hideTimer?.cancel();
    String? message;
    try {
      final refreshed = await _fetchCurrentProgram();
      if (!mounted || _isStopping) return;
      if (!refreshed || !_canRecordCurrentProgram || _recordingState == null) {
        message = l10n.failedToLoadRecordings;
        return;
      }
      final program = _currentProgram!;
      final recording = _recordingState!;
      message = await runLiveTvRecordingFlow(
        context: context,
        liveTvApi: _client.liveTvApi,
        program: program,
        recording: recording,
        programTime:
            '${_formatTime(program.startDate)} – ${_formatTime(program.endDate)}',
        channel: recordPromptChannel(
          _currentChannel.number,
          _currentChannel.name,
        ),
        use24HourClock: _prefs.get(UserPreferences.use24HourClock),
        stillOnProgram: () =>
            mounted && !_isStopping && _currentProgram?.id == program.id,
      );
      if (!mounted || _isStopping) return;
      await _fetchCurrentProgram();
    } finally {
      _recordingActionInProgress = false;
      if (mounted && !_isStopping) {
        _suppressBackNavigation();
        if (message != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
        _scheduleHide();
      }
    }
  }

  // The record button only shows while the overlay is up, which refreshes
  // the timers when it opens, so a hidden overlay skips them.
  void _startProgramRefresh() {
    _programRefreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!_recordingActionInProgress) {
        unawaited(_fetchCurrentProgram(withRecording: _infoVisible));
      }
    });
  }

  Future<void> _refreshRecordingStatus() async {
    if (_recordingRefreshInProgress) return;
    final program = _currentProgram;
    if (program == null) return;
    if (!DateTime.now().isBefore(program.endDate)) {
      await _fetchCurrentProgram();
      return;
    }
    final revision = _programRequestRevision;
    _recordingRefreshInProgress = true;
    try {
      final timers = await _client.liveTvApi.getTimers();
      if (!mounted ||
          _recordingActionInProgress ||
          revision != _programRequestRevision ||
          _currentChannel.id != program.channelId ||
          _currentProgram?.id != program.id) {
        return;
      }
      setState(() {
        _recordingState = LiveTvRecordingState.fromProgram(
          program.rawData,
          (timers['Items'] as List?) ?? const [],
        );
      });
    } catch (_) {
    } finally {
      _recordingRefreshInProgress = false;
    }
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    final hideDelay = PlatformDetection.useMobileUi
        ? const Duration(seconds: 8)
        : const Duration(seconds: 5);
    _hideTimer = Timer(hideDelay, () {
      if (!mounted) return;
      if (_isOverlayInteractionActive) {
        _scheduleHide();
        return;
      }
      setState(() => _infoVisible = false);
      if (PlatformDetection.isTV) {
        _focusPlayerRoot();
      }
    });
  }

  /// OSD controls in visual order. Audio/subtitle only participate when their
  /// buttons are shown, so arrow navigation never lands on a hidden control.
  List<FocusNode> get _osdFocusOrder => [
    if (_canRewind) _tvSkipBackFocus,
    _tvPlayPauseFocus,
    if (_canRewind) ...[_tvSkipForwardFocus, _tvJumpToLiveFocus],
    _tvChannelsFocus,
    _tvGuideFocus,
    if (_streamsOfType('Audio').length > 1) _tvAudioFocus,
    if (_hasSubtitleChoices) _tvSubtitleFocus,
    _tvBitrateFocus,
    if (_canRecordCurrentProgram) _tvRecordFocus,
    _tvPlaybackInfoFocus,
  ];

  bool get _isOverlayInteractionActive {
    if (_recordingActionInProgress) return true;
    if (_isGuidePickerOpen) return true;
    if (_isCarouselOpen) return true;
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) return true;
    return false;
  }

  void _onControlFocusChanged() {
    if (!mounted || !PlatformDetection.isTV) return;
    final order = _osdFocusOrder;
    final focused = order.indexWhere((node) => node.hasFocus);
    if (focused >= 0) {
      _focusedControlIndex = focused;
      if (!_infoVisible) {
        setState(() => _infoVisible = true);
      }
      _scheduleHide();
    }
  }

  bool get _isBackNavigationSuppressed {
    final until = _suppressBackUntil;
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  void _suppressBackNavigation([
    Duration duration = const Duration(milliseconds: 700),
  ]) {
    _suppressBackUntil = DateTime.now().add(duration);
  }

  void _showInfo() {
    if (_isCarouselOpen) return;
    final wasHidden = !_infoVisible;
    setState(() => _infoVisible = true);
    if (wasHidden && !_recordingActionInProgress) {
      unawaited(_refreshRecordingStatus());
    }
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_infoVisible || _isOverlayInteractionActive) return;
        _tvPlayPauseFocus.requestFocus();
      });
    }
    _scheduleHide();
  }

  void _hideInfo() {
    _hideTimer?.cancel();
    if (_infoVisible) {
      setState(() => _infoVisible = false);
    }
    // Move focus off the OSD controls so it doesn't immediately re-pin itself
    // (a focused control keeps the OSD visible via _onControlFocusChanged).
    if (PlatformDetection.isTV) {
      _focusPlayerRoot();
    }
  }

  void _toggleInfo() {
    if (_infoVisible) {
      _hideInfo();
    } else {
      _showInfo();
    }
  }

  void _warmChannelCarousel() {
    if (!PlatformDetection.isTV || widget.channels.length < 2) return;
    final prewarm = _carouselPrewarm ??= ChannelCarouselPrewarm(_client);
    prewarm.tuned(widget.channels, _currentChannel.id);
  }

  void _showChannelCarousel() {
    if (_isCarouselOpen || _isGuidePickerOpen || !PlatformDetection.isTV) {
      return;
    }
    _hideTimer?.cancel();
    _carouselPriorFocus = FocusManager.instance.primaryFocus;
    _carouselPriorInfoVisible = _infoVisible;
    _carouselPriorControlIndex = _focusedControlIndex;
    setState(() {
      _isCarouselOpen = true;
      _infoVisible = false;
    });
  }

  void _dismissChannelCarousel({bool showControls = false}) {
    if (!_isCarouselOpen) return;
    final priorFocus = _carouselPriorFocus;
    final priorInfoVisible = _carouselPriorInfoVisible;
    final priorControlIndex = _carouselPriorControlIndex;
    setState(() {
      _isCarouselOpen = false;
      _infoVisible = showControls ? true : priorInfoVisible;
      _focusedControlIndex = showControls
          ? _osdFocusOrder.indexOf(_tvPlayPauseFocus)
          : priorControlIndex;
    });
    _carouselPriorFocus = null;
    // The overlay consumes the back key-down, but its key-up lands after the
    // overlay has left the tree and Android turns that into a route pop.
    _suppressBackNavigation();
    if (_infoVisible) {
      _scheduleHide();
    } else {
      _hideTimer?.cancel();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (showControls) {
        final order = _osdFocusOrder;
        if (order.isNotEmpty) {
          order[_focusedControlIndex.clamp(0, order.length - 1)].requestFocus();
        }
      } else if (priorInfoVisible && priorFocus?.canRequestFocus == true) {
        priorFocus!.requestFocus();
      } else {
        _focusPlayerRoot();
      }
    });
  }

  void _showControlsFromCarousel() {
    _dismissChannelCarousel(showControls: true);
  }

  Future<void> _onCarouselChannelSelected(String channelId) async {
    final selectedIndex = widget.channels.indexWhere(
      (channel) => channel.id == channelId,
    );
    if (selectedIndex < 0 || !_isCarouselOpen) return;
    if (_isSwitching) return;
    if (selectedIndex == _currentIndex) {
      _dismissChannelCarousel();
      return;
    }

    final previousIndex = _currentIndex;
    final previousProgram = _currentProgram;
    _isSwitching = true;
    try {
      setState(() {
        _currentIndex = selectedIndex;
        _currentProgram = null;
        _infoVisible = false;
      });
      final succeeded = await _playCurrentChannel();
      if (!mounted || _isStopping) return;
      if (succeeded) {
        _dismissChannelCarousel();
        return;
      }

      // Keep the carousel open while restoring the previously working stream
      // and its metadata. The overlay owns the visible centered selection.
      setState(() {
        _currentIndex = previousIndex;
        _currentProgram = previousProgram;
        _infoVisible = false;
        _carouselSelectionRevision++;
      });
      final recovered = await _playCurrentChannel();
      if (!recovered && mounted) {
        setState(() => _currentProgram = null);
      }
    } finally {
      _isSwitching = false;
    }
  }

  void _togglePlayback() {
    _state.isPlaying ? _manager.pause() : _manager.resume();
    _scheduleHide();
  }

  LiveSeekWindow? get _rewindWindow {
    final window = _manager.backend?.liveSeekWindow;
    return window != null && window.length >= _minRewindWindow ? window : null;
  }

  Duration _behindLive(LiveSeekWindow window, Duration position) {
    final behind = window.edge - position;
    return behind > Duration.zero ? behind : Duration.zero;
  }

  bool get _osdControlHasFocus => _osdFocusOrder.any((node) => node.hasFocus);

  bool get _arrowsScrub =>
      _rewindWindow != null && (!_infoVisible || !_osdControlHasFocus);

  /// Moves the rewind target by [delta], kept inside the window, and seeks
  /// once the presses stop.
  void _skipLive(Duration delta) {
    final window = _rewindWindow;
    if (window == null) return;
    var target = (_seekTarget ?? _state.position) + delta;
    if (target < window.start) target = window.start;
    if (target > window.edge) target = window.edge;
    setState(() {
      _infoVisible = true;
      _seekTarget = target;
    });
    _seekCommitTimer?.cancel();
    _seekCommitTimer = Timer(
      const Duration(milliseconds: 600),
      () => unawaited(_commitLiveSeek()),
    );
    _scheduleHide();
  }

  Future<void> _commitLiveSeek() async {
    _seekCommitTimer?.cancel();
    final target = _seekTarget;
    if (target == null) return;
    await _manager.seekTo(target);
    if (mounted && _seekTarget == target) setState(() => _seekTarget = null);
  }

  void _jumpToLive() {
    final window = _rewindWindow;
    if (window == null) return;
    _seekCommitTimer?.cancel();
    setState(() => _seekTarget = window.edge);
    unawaited(_commitLiveSeek());
    if (!_state.isPlaying) unawaited(_manager.resume());
    _scheduleHide();
  }

  /// One press steps by the skip length, and holding the key speeds up so
  /// the far end of a long window is a few seconds away.
  void _scrubWithKey(KeyEvent event, {required bool forward}) {
    final now = DateTime.now();
    if (event is KeyDownEvent) _scrubHoldStart = now;
    final held = now.difference(_scrubHoldStart ?? now);
    final Duration step;
    if (held > const Duration(seconds: 3)) {
      step = const Duration(minutes: 1);
    } else if (held > const Duration(seconds: 1)) {
      step = const Duration(seconds: 30);
    } else {
      step = Duration(
        milliseconds: _prefs.get(
          forward
              ? UserPreferences.skipForwardLength
              : UserPreferences.skipBackLength,
        ),
      );
    }
    _skipLive(forward ? step : -step);
  }

  void _toggleOrientationLock() {
    setState(() => _forcedLandscape = !_forcedLandscape);
    _applyPlayerDisplayMode();
  }

  void _applyPlayerDisplayMode() {
    setImmersive(true);
    if (_forcedLandscape && !PlatformDetection.isTV) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      return;
    }

    SystemChrome.setPreferredOrientations([]);
  }

  Future<void> _releasePlayerDisplayMode() async {
    setImmersive(false);
    await SystemChrome.setPreferredOrientations([]);
  }

  void _showPlaybackInfo() {
    unawaited(() async {
      final (transcodingInfo, device) = await (
        fetchOwnTranscodingInfo(_client, _manager.currentResolution),
        playbackDeviceLabel(),
      ).wait;
      if (!mounted) return;
      await showStreamInfoDialog(
        context: context,
        title: AppLocalizations.of(context).playbackInformation,
        streamInfoSections: _buildLiveTvStreamInfoSections(
          transcodingInfo: transcodingInfo,
          device: device,
        ),
      );
    }());
    _showInfo();
  }

  bool get _hasSubtitleChoices =>
      _streamsOfType('Subtitle').isNotEmpty || _captionTracks.isNotEmpty;

  List<EmbeddedCaptionTrack> get _captionTracks =>
      _manager.backend?.embeddedCaptionTracks ?? const [];

  void _listenForPlayerTrackChanges() {
    _tracksChangedSub?.cancel();
    _tracksChangedSub = _manager.backend?.tracksChangedStream.listen(
      (_) => _onPlayerTracksChanged(),
    );
  }

  /// Rebuilds the controls once the player reports what it found, and puts a
  /// caption choice back after a channel change, which starts a new stream and
  /// drops every track selection with it.
  void _onPlayerTracksChanged() {
    if (!mounted) return;
    final tracks = _captionTracks;
    if (tracks.isEmpty) {
      _captionTrackApplied = false;
    } else if (!_captionTrackApplied &&
        tracks.any((track) => track.id == _captionTrackId)) {
      _captionTrackApplied = true;
      unawaited(_manager.backend?.setEmbeddedCaptionTrack(_captionTrackId!));
    }
    setState(() {});
  }

  List<Map<String, dynamic>> _streamsOfType(String type) =>
      (_manager.currentResolution?.mediaStreams ??
              const <Map<String, dynamic>>[])
          .where((s) => s['Type'] == type)
          .toList();

  String _streamLabel(Map<String, dynamic> stream, String fallback) {
    final display = stream['DisplayTitle'] as String? ?? '';
    if (display.isNotEmpty) return display;
    final title = stream['Title'] as String? ?? '';
    if (title.isNotEmpty) return title;
    final language = stream['Language'] as String? ?? '';
    if (language.isNotEmpty) return language;
    return fallback;
  }

  void _showAudioSelector() {
    final l10n = AppLocalizations.of(context);
    final streams = _streamsOfType('Audio');
    if (streams.isEmpty) return;

    final currentIndex =
        _manager.audioStreamIndex ??
        (streams.firstWhere(
              (s) => s['IsDefault'] == true,
              orElse: () => streams.first,
            )['Index']
            as int?);
    final selected = streams.indexWhere((s) => s['Index'] == currentIndex);

    final options = <TrackOption>[];
    for (var i = 0; i < streams.length; i++) {
      final details = [
        (streams[i]['Codec'] as String? ?? '').toUpperCase(),
        streams[i]['ChannelLayout'] as String? ?? '',
      ].where((s) => s.isNotEmpty).join(' • ');
      options.add(
        TrackOption(
          label: _streamLabel(streams[i], '${l10n.audioTrack} ${i + 1}'),
          subtitle: details.isEmpty ? null : details,
        ),
      );
    }

    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.audioTrack,
        options: options,
        selectedIndex: selected >= 0 ? selected : null,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      final index = streams[result]['Index'] as int?;
      if (index != null) unawaited(_manager.changeAudioTrack(index));
    }());
    _showInfo();
  }

  void _showSubtitleSelector() {
    final l10n = AppLocalizations.of(context);
    final streams = _streamsOfType('Subtitle');
    final captions = _captionTracks;

    final current = _manager.subtitleStreamIndex;
    final selectedStream = current == null || current < 0
        ? -1
        : streams.indexWhere((s) => s['Index'] == current);
    final selectedCaption = captions.indexWhere(
      (track) => track.id == _captionTrackId,
    );

    final options = <TrackOption>[TrackOption(label: l10n.off)];
    for (var i = 0; i < streams.length; i++) {
      final codec = (streams[i]['Codec'] as String? ?? '').toUpperCase();
      options.add(
        TrackOption(
          label: _streamLabel(streams[i], '${l10n.subtitleTrack} ${i + 1}'),
          subtitle: codec.isEmpty ? null : codec,
        ),
      );
    }
    for (final track in captions) {
      options.add(
        TrackOption(
          label: track.label,
          subtitle: track.language ?? l10n.embedded,
        ),
      );
    }

    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.subtitleTrack,
        options: options,
        selectedIndex: subtitleMenuSelectedRow(
          streamPosition: selectedStream,
          captionPosition: selectedCaption,
          streamCount: streams.length,
        ),
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;

      final target = subtitleMenuRowTarget(
        row: result,
        streamCount: streams.length,
        captionCount: captions.length,
      );
      _captionTrackId = null;
      _captionTrackApplied = false;

      final captionPosition = target.captionPosition;
      if (captionPosition != null) {
        final track = captions[captionPosition];
        _captionTrackId = track.id;
        _captionTrackApplied = true;
        unawaited(_manager.backend?.setEmbeddedCaptionTrack(track.id));
        return;
      }

      final streamPosition = target.streamPosition;
      if (streamPosition == null) {
        unawaited(_manager.disableSubtitles());
        return;
      }
      final index = streams[streamPosition]['Index'] as int?;
      if (index != null) unawaited(_manager.changeSubtitleTrack(index));
    }());
    _showInfo();
  }

  void _showBitrateSelector() {
    final l10n = AppLocalizations.of(context);
    final options = <int?>[null, 40, 20, 12, 8, 4, 2];
    final current = _manager.maxBitrateOverrideMbps;

    final trackOptions = options
        .map(
          (mbps) => TrackOption(
            label: mbps == null ? l10n.auto : l10n.bitrateValueMbps(mbps),
          ),
        )
        .toList();
    final currentIdx = options.indexWhere((mbps) => mbps == current);

    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.bitrate,
        options: trackOptions,
        selectedIndex: currentIdx >= 0 ? currentIdx : null,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      unawaited(_manager.changeBitrate(options[result]));
    }());
    _showInfo();
  }

  List<Map<String, dynamic>> _buildLiveTvStreamInfoSections({
    Map<String, dynamic>? transcodingInfo,
    String? device,
  }) {
    final resolution = _manager.currentResolution;
    final channel = _currentChannel;
    return buildPlaybackInfoSections(
      l10n: AppLocalizations.of(context),
      resolution: resolution,
      mediaStreams: resolution?.mediaStreams ?? const <Map<String, dynamic>>[],
      audioStreamIndex: _manager.audioStreamIndex,
      // A caption track isn't a server stream, so it gets no Subtitles section.
      subtitleStreamIndex: _captionTrackId == null
          ? _manager.subtitleStreamIndex
          : -1,
      transcodingInfo: transcodingInfo,
      transcodeForced: transcodeForcedBySettings(_manager),
      qualityLimitMbps: userQualityLimitMbps(
        _manager.maxBitrateOverrideMbps,
        _prefs.get(UserPreferences.maxBitrate),
      ),
      channel: channel.number == null
          ? channel.name
          : '${channel.number} ${channel.name}',
      program: _currentProgram?.name,
      player: playerEngineName(_manager.backend),
      device: device,
      audioRoute: playbackAudioRoute(resolution?.mediaSourceId),
    );
  }

  // Opens the channel guide as an in-player overlay (not a separate route) so
  // the single existing video surface can be shrunk into the mini-player box
  // and shown for BOTH the media_kit and Media3 engines. See [_buildVideoSurface].
  Future<void> _showChannelPicker() async {
    if (_isGuidePickerOpen) return;
    _hideTimer?.cancel();
    _suppressBackNavigation();
    setState(() => _isGuidePickerOpen = true);
    await _releasePlayerDisplayMode();
  }

  void _closeGuideOverlay() {
    if (!_isGuidePickerOpen) return;
    setState(() => _isGuidePickerOpen = false);
    _applyPlayerDisplayMode();
    _suppressBackNavigation();
    if (_infoVisible) {
      _scheduleHide();
      if (PlatformDetection.isTV) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !_infoVisible) return;
          _tvGuideFocus.requestFocus();
        });
      }
    }
  }

  Future<void> _onGuideChannelSelected(String channelId) async {
    _closeGuideOverlay();
    if (channelId == _currentChannel.id) return;
    final selectedIndex = widget.channels.indexWhere(
      (channel) => channel.id == channelId,
    );
    if (selectedIndex >= 0) {
      await _switchChannel(selectedIndex);
    }
  }

  Future<void> _exitPlayback() async {
    if (_isStopping) return;
    _isStopping = true;
    await _manager.stop(userInitiated: false);
    await _releasePlayerDisplayMode();
    if (mounted) Navigator.of(context).pop();
  }

  /// [force] pushes even when nothing changed, for a new stream or backend.
  void _applySubtitleStyle({bool force = false}) {
    final backend = _manager.backend;
    if (backend == null) return;
    final style = SubtitleStyle.forResolution(
      _prefs,
      _manager.currentResolution,
    );
    if (!force && style == _lastSubtitleStyle) return;
    _lastSubtitleStyle = style;
    unawaited(
      backend.configureSubtitleStyle(
        textColor: style.textColor,
        backgroundColor: style.backgroundColor,
        strokeColor: style.strokeColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        verticalOffset: style.verticalOffset,
      ),
    );
  }

  SubtitleViewConfiguration _buildSubtitleConfig() =>
      buildSubtitleViewConfiguration(
        context: context,
        prefs: _prefs,
        resolution: _manager.currentResolution,
        subtitleStreamIndex: _manager.subtitleStreamIndex,
      );

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    // While either in-player picker is open it owns all navigation keys.
    // Let them flow to the embedded guide's focus subtree.
    if (_isGuidePickerOpen || _isCarouselOpen) {
      return KeyEventResult.ignored;
    }

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowUp:
        if (PlatformDetection.isTV) {
          _showChannelCarousel();
          return KeyEventResult.handled;
        }
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      case LogicalKeyboardKey.arrowDown:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          // A scrub reveals the controls without focusing them.
          if (!_osdControlHasFocus) _tvPlayPauseFocus.requestFocus();
          _scheduleHide();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      case LogicalKeyboardKey.select:
      case LogicalKeyboardKey.enter:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (_seekTarget != null && !_osdControlHasFocus) {
          unawaited(_commitLiveSeek());
          return KeyEventResult.handled;
        }

        if (PlatformDetection.isTV) {
          final focused = FocusManager.instance.primaryFocus;
          if (focused == _tvChannelsFocus) {
            _showChannelCarousel();
            return KeyEventResult.handled;
          }
          if (focused == _tvGuideFocus) {
            unawaited(_showChannelPicker());
            return KeyEventResult.handled;
          }
        }

        _togglePlayback();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaPlayPause:
      case LogicalKeyboardKey.mediaPlay:
      case LogicalKeyboardKey.mediaPause:
        if (event is KeyDownEvent) {
          final key = event.logicalKey;
          final pause =
              key == LogicalKeyboardKey.mediaPause ||
              (key == LogicalKeyboardKey.mediaPlayPause && _state.isPlaying);
          pause ? _manager.pause() : _manager.resume();
          _showInfo();
        }
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaRewind:
      case LogicalKeyboardKey.mediaFastForward:
        if (_rewindWindow == null) return KeyEventResult.ignored;
        _scrubWithKey(
          event,
          forward: event.logicalKey == LogicalKeyboardKey.mediaFastForward,
        );
        return KeyEventResult.handled;
      // Until the viewer moves down into the buttons, left and right scrub.
      case LogicalKeyboardKey.arrowLeft when _arrowsScrub:
      case LogicalKeyboardKey.arrowRight when _arrowsScrub:
        _scrubWithKey(
          event,
          forward: event.logicalKey == LogicalKeyboardKey.arrowRight,
        );
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowLeft:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          _moveControlFocus(-1);
          return KeyEventResult.handled;
        }
        _showInfo();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowRight:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          _moveControlFocus(1);
          return KeyEventResult.handled;
        }
        _showInfo();
        return KeyEventResult.handled;
      default:
        return KeyEventResult.ignored;
    }
  }

  void _moveControlFocus(int delta) {
    final order = _osdFocusOrder;
    // The rewind buttons join the row once the stream reports its window,
    // which shifts every index after the focus was last recorded.
    final focused = order.indexWhere((node) => node.hasFocus);
    if (focused >= 0) _focusedControlIndex = focused;
    _focusedControlIndex = (_focusedControlIndex + delta).clamp(
      0,
      order.length - 1,
    );
    order[_focusedControlIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final gesturesEnabled =
        PlatformDetection.isMobile &&
        !_isGuidePickerOpen &&
        _prefs.get(UserPreferences.playerSwipeGestures);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isCarouselOpen) {
          _dismissChannelCarousel();
          return;
        }
        if (_isGuidePickerOpen) {
          if (_guideBackController.consumeBackPress()) return;
          _closeGuideOverlay();
          return;
        }
        if (_isBackNavigationSuppressed) return;
        // Back dismisses the on-screen controls first; only exit the player once
        // the OSD is already hidden (e.g. after returning from the EPG overlay,
        // where a focused control otherwise keeps the OSD pinned open).
        if (_infoVisible) {
          _hideInfo();
          return;
        }
        _exitPlayback();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Focus(
          focusNode: _overlayFocus,
          autofocus: true,
          onKeyEvent: _handleKeyEvent,
          child: GestureDetector(
            onTap: PlatformDetection.isTV ? null : _toggleInfo,
            onVerticalDragStart: gesturesEnabled ? _onVerticalDragStart : null,
            onVerticalDragUpdate: gesturesEnabled
                ? _onVerticalDragUpdate
                : null,
            onVerticalDragEnd: gesturesEnabled ? _onVerticalDragEnd : null,
            onVerticalDragCancel: gesturesEnabled
                ? _onVerticalDragCancel
                : null,
            behavior: HitTestBehavior.opaque,
            child: MouseRegion(
              cursor: PlatformDetection.useDesktopUi && !_infoVisible
                  ? SystemMouseCursors.none
                  : SystemMouseCursors.basic,
              onHover: (_) {
                if (PlatformDetection.useDesktopUi) {
                  if (_infoVisible) {
                    _scheduleHide();
                  } else {
                    _showInfo();
                  }
                }
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildVideoSurface(),
                  _buildBufferingIndicator(),
                  _buildReconnectingOverlay(),
                  if (PlatformDetection.isMobile) _buildBrightnessOverlay(),
                  if (PlatformDetection.isMobile) _buildVolumeOverlay(),
                  if (_isGuidePickerOpen) _buildGuideOverlay(),
                  if (_isCarouselOpen) _buildChannelCarouselOverlay(),
                  if (_infoVisible &&
                      !_isGuidePickerOpen &&
                      !_isCarouselOpen) ...[
                    const Positioned.fill(
                      child: IgnorePointer(
                        child: ColoredBox(color: Color(0x4D000000)),
                      ),
                    ),
                    _buildTopOverlay(),
                    _buildBottomOverlay(),
                  ],
                  if (_channelFailed &&
                      !_isGuidePickerOpen &&
                      !_isCarouselOpen)
                    _buildChannelFailedCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fullscreen normally, or the mini-player box (geometry shared with the guide
  // overlay) while the in-player guide is open. The surface is only resized,
  // never recreated, so the Media3 SurfaceView keeps its decoder and frame-rate
  // matching intact.
  Rect _videoRect(Size size) {
    if (_isGuidePickerOpen) {
      return const Rect.fromLTWH(
        LiveTvGuideScreen.miniPlayerVideoLeft,
        LiveTvGuideScreen.miniPlayerVideoTop,
        LiveTvGuideScreen.miniPlayerVideoWidth,
        LiveTvGuideScreen.miniPlayerVideoHeight,
      );
    }
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  Widget _buildVideoSurface() {
    return AnimatedPositioned.fromRect(
      rect: _videoRect(MediaQuery.sizeOf(context)),
      duration: _kGuideResizeDuration,
      curve: Curves.easeInOut,
      child: _buildVideoChild(),
    );
  }

  Widget _buildVideoChild() {
    if (PlatformDetection.isApple || PlatformDetection.isAppleTV) {
      return const AetherVideoView();
    }

    final prefersMedia3 =
        _prefs.get(UserPreferences.playbackEnginePreference) ==
        PlaybackEnginePreference.media3;
    final prewarmMedia3 = _manager.backend == null && prefersMedia3;
    if (_activeMedia3Backend != null || prewarmMedia3) {
      return const Media3VideoView(fill: Colors.black);
    }

    final htmlBackend = _activeHtmlVideoBackend;
    if (htmlBackend != null) {
      return htmlBackend.buildView(fit: BoxFit.contain);
    }

    final mediaKitBackend = _activeMediaKitBackend ?? _backend;
    if (mediaKitBackend == null) {
      return const ColoredBox(color: Colors.black);
    }
    if (PlatformDetection.useNativeVideoSurface) {
      return NativeVideoView(
        player: mediaKitBackend.player,
        fill: Colors.black,
        videoOutput: 'gpu',
        hardwareDecodingEnabled: _prefs.get(UserPreferences.hardwareDecoding),
      );
    }

    final controller = mediaKitBackend.videoController;
    if (controller == null) {
      return const ColoredBox(color: Colors.black);
    }

    return Video(
      controller: controller,
      controls: NoVideoControls,
      fit: BoxFit.contain,
      fill: Colors.black,
      pauseUponEnteringBackgroundMode: false,
      subtitleViewConfiguration: _buildSubtitleConfig(),
    );
  }

  Widget _buildGuideOverlay() {
    return Positioned.fill(
      child: LiveTvGuideScreen(
        embedded: true,
        miniPlayerMode: true,
        currentChannel: _currentChannel,
        onChannelSelected: _onGuideChannelSelected,
        onClose: _closeGuideOverlay,
        backController: _guideBackController,
      ),
    );
  }

  Widget _buildChannelCarouselOverlay() {
    return Positioned.fill(
      child: ChannelCarouselOverlay(
        client: _client,
        channels: widget.channels,
        currentChannelId: _currentChannel.id,
        selectionRevision: _carouselSelectionRevision,
        onChannelSelected: _onCarouselChannelSelected,
        onDismiss: () => _dismissChannelCarousel(),
        onShowControls: _showControlsFromCarousel,
        prewarm: _carouselPrewarm,
      ),
    );
  }

  Widget _buildBufferingIndicator() {
    return AnimatedPositioned.fromRect(
      rect: _videoRect(MediaQuery.sizeOf(context)),
      duration: _kGuideResizeDuration,
      curve: Curves.easeInOut,
      child: StreamBuilder<bool>(
        stream: _state.bufferingStream,
        initialData: _state.isBuffering,
        builder: (context, snap) {
          // The reconnecting overlay has its own spinner; showing both would
          // put two on screen at once.
          if (_liveRecoveryStatus != null) return const SizedBox.shrink();
          if (snap.data != true) return const SizedBox.shrink();
          return Center(
            child: CircularProgressIndicator(color: AppColorScheme.accent),
          );
        },
      ),
    );
  }

  Widget _buildReconnectingOverlay() {
    final status = _liveRecoveryStatus;
    if (status == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    return AnimatedPositioned.fromRect(
      rect: _videoRect(MediaQuery.sizeOf(context)),
      duration: _kGuideResizeDuration,
      curve: Curves.easeInOut,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColorScheme.accent),
            const SizedBox(height: AppSpacing.spaceMd),
            Text(
              l10n.liveReconnecting(status.attempt, status.maxAttempts),
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppTypography.fontSizeMd,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Replaces the old transient snackbar. Stays up until the viewer retries
  /// via the Retry control, tunes to another channel, or leaves the screen.
  Widget _buildChannelFailedCard() {
    final l10n = AppLocalizations.of(context);
    final channelName = _failedChannelName ?? _currentChannel.name;
    return Positioned.fill(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spaceLg,
            vertical: AppSpacing.spaceLg,
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: AppRadius.circular(14),
            border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.failedToPlayChannel(channelName),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppTypography.fontSizeMd,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              _LiveTvRetryButton(
                focusNode: _retryFocus,
                label: l10n.retry,
                onPressed: () => unawaited(_retryCurrentChannel()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopOverlay() {
    final padding = MediaQuery.of(context).padding;
    final channel = _currentChannel;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: padding.top + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
          bottom: AppSpacing.spaceMd,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            if (!PlatformDetection.useLeanbackUi)
              IconButton(
                onPressed: _exitPlayback,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            const SizedBox(width: AppSpacing.spaceSm),
            if (channel.number != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColorScheme.accent,
                  borderRadius: AppRadius.circular(4),
                ),
                child: Text(
                  channel.number!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeMd,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.spaceMd),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    channel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppTypography.fontSizeLg,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (_currentProgram != null)
                    Text(
                      _currentProgram!.name,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: AppTypography.fontSizeSm,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (_currentProgram?.hasTimer == true)
              const Padding(
                padding: EdgeInsets.only(left: AppSpacing.spaceSm),
                child: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomOverlay() {
    final padding = MediaQuery.of(context).padding;
    final program = _currentProgram;
    final episodeLine = program?.episodeLine ?? '';

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          bottom: padding.bottom + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
          top: AppSpacing.spaceMd,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (episodeLine.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.spaceXs),
                child: Text(
                  episodeLine,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: AppTypography.fontSizeSm,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            _buildTimelineSection(),
            _buildPlaybackControlsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaybackControlsRow() {
    final l10n = AppLocalizations.of(context);
    final hasAudioChoices = _streamsOfType('Audio').length > 1;
    final hasSubtitles = _hasSubtitleChoices;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.spaceSm),
      child: Row(
        children: [
          if (_canRewind) ...[
            _buildOverlayControlButton(
              focusNode: PlatformDetection.isTV ? _tvSkipBackFocus : null,
              icon: Icons.fast_rewind_rounded,
              tooltip: l10n.playerTooltipSeekBack,
              onPressed: () => _skipLive(
                -Duration(
                  milliseconds: _prefs.get(UserPreferences.skipBackLength),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.spaceSm),
          ],
          StreamBuilder<bool>(
            stream: _state.playingStream,
            initialData: _state.isPlaying,
            builder: (context, snap) {
              final isPlaying = snap.data ?? _state.isPlaying;
              return _buildOverlayControlButton(
                focusNode: PlatformDetection.isTV ? _tvPlayPauseFocus : null,
                icon: isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                tooltip: isPlaying ? l10n.pause : l10n.play,
                onPressed: _togglePlayback,
              );
            },
          ),
          if (_canRewind) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              focusNode: PlatformDetection.isTV ? _tvSkipForwardFocus : null,
              icon: Icons.fast_forward_rounded,
              tooltip: l10n.playerTooltipSeekForward,
              onPressed: () => _skipLive(
                Duration(
                  milliseconds: _prefs.get(UserPreferences.skipForwardLength),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.spaceSm),
            StreamBuilder<Duration>(
              stream: _state.positionStream,
              initialData: _state.position,
              builder: (context, snap) {
                final window = _rewindWindow;
                final behind = window == null
                    ? Duration.zero
                    : _behindLive(
                        window,
                        _seekTarget ?? snap.data ?? _state.position,
                      );
                return _buildOverlayControlButton(
                  focusNode: PlatformDetection.isTV
                      ? _tvJumpToLiveFocus
                      : null,
                  icon: Icons.live_tv_rounded,
                  iconColor: behind > _liveEdgeSlack
                      ? Colors.white
                      : Colors.red,
                  tooltip: l10n.liveTvJumpToLive,
                  onPressed: _jumpToLive,
                );
              },
            ),
          ],
          if (PlatformDetection.isTV) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              focusNode: _tvChannelsFocus,
              icon: Icons.grid_view_rounded,
              tooltip: l10n.channels,
              onPressed: _showChannelCarousel,
            ),
          ],
          const SizedBox(width: AppSpacing.spaceSm),
          _buildOverlayControlButton(
            focusNode: PlatformDetection.isTV ? _tvGuideFocus : null,
            icon: Icons.list_rounded,
            tooltip: l10n.guide,
            onPressed: () => unawaited(_showChannelPicker()),
          ),
          if (PlatformDetection.isMobile) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              icon: _forcedLandscape
                  ? Icons.screen_lock_landscape_outlined
                  : Icons.screen_rotation_outlined,
              tooltip: _forcedLandscape
                  ? l10n.playerTooltipUnlockOrientation
                  : l10n.playerTooltipLockLandscape,
              onPressed: _toggleOrientationLock,
            ),
          ],
          if (hasAudioChoices) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              focusNode: PlatformDetection.isTV ? _tvAudioFocus : null,
              icon: Icons.audiotrack_rounded,
              tooltip: l10n.audioTrack,
              onPressed: _showAudioSelector,
            ),
          ],
          if (hasSubtitles) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              focusNode: PlatformDetection.isTV ? _tvSubtitleFocus : null,
              icon: Icons.subtitles_rounded,
              tooltip: l10n.subtitleTrack,
              onPressed: _showSubtitleSelector,
            ),
          ],
          const SizedBox(width: AppSpacing.spaceSm),
          _buildOverlayControlButton(
            focusNode: PlatformDetection.isTV ? _tvBitrateFocus : null,
            icon: Icons.video_settings_outlined,
            tooltip: l10n.bitrate,
            onPressed: _showBitrateSelector,
          ),
          if (_canRecordCurrentProgram) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              focusNode: PlatformDetection.isTV ? _tvRecordFocus : null,
              icon: _recordingState?.seriesTimerId != null
                  ? Icons.fiber_smart_record
                  : Icons.fiber_manual_record,
              iconColor: _recordingState?.seriesTimerId != null
                  ? (_recordingState?.timerId != null
                        ? Colors.red
                        : LiveTvRecordingIcon.skippedColor)
                  : (_recordingState?.isRecording == true
                        ? Colors.red
                        : Colors.white),
              tooltip: _recordingState?.timerId != null
                  ? l10n.cancelRecordingAction
                  : l10n.record,
              onPressed: () => unawaited(_showRecordingDialog()),
            ),
          ],
          const SizedBox(width: AppSpacing.spaceSm),
          _buildOverlayControlButton(
            focusNode: PlatformDetection.isTV ? _tvPlaybackInfoFocus : null,
            icon: Icons.info_outline_rounded,
            tooltip: l10n.playbackInformation,
            onPressed: _showPlaybackInfo,
          ),
          if (_usesPlayerVolume && PlatformDetection.useDesktopUi)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildOverlayControlButton(
                    icon: volumeIconFor(_playerVolume / 100),
                    tooltip: _playerVolume > 0 ? l10n.mute : l10n.unmute,
                    onPressed: _togglePlayerMute,
                  ),
                  const SizedBox(width: AppSpacing.spaceSm),
                  // Shrinks before the row overflows in a narrow window.
                  Flexible(
                    child: SizedBox(
                      width: 120,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          overlayShape: SliderComponentShape.noOverlay,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 6,
                          ),
                        ),
                        child: Slider(
                          value: _playerVolume / 100,
                          activeColor: AppColorScheme.accent,
                          inactiveColor: Colors.white24,
                          onChangeStart: (_) => _hideTimer?.cancel(),
                          onChanged: _setPlayerVolume,
                          onChangeEnd: (_) => _scheduleHide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTimelineSection() {
    return StreamBuilder<Duration>(
      stream: _state.positionStream,
      initialData: _state.position,
      builder: (context, positionSnap) {
        return StreamBuilder<Duration>(
          stream: _state.durationStream,
          initialData: _state.duration,
          builder: (context, durationSnap) {
            final window = _rewindWindow;
            if (window != null) {
              return _buildRewindTimeline(
                window,
                _seekTarget ?? positionSnap.data ?? _state.position,
              );
            }
            final program = _currentProgram;
            double? progress;
            String leftLabel;
            String rightLabel;

            if (program != null) {
              final now = DateTime.now();
              progress = program.progressAt(now).clamp(0.0, 1.0);
              leftLabel = _formatTime(program.startDate);
              rightLabel = _formatTime(program.endDate);
            } else {
              final position = positionSnap.data ?? Duration.zero;
              final duration = durationSnap.data ?? Duration.zero;
              if (duration > Duration.zero) {
                progress = (position.inMilliseconds / duration.inMilliseconds)
                    .clamp(0.0, 1.0);
                leftLabel = formatPlaybackDuration(position);
                // Recorded content follows the same bottom right slot the
                // video player uses, including an empty label for none.
                rightLabel = formatPlaybackTimeSlot(
                  context,
                  slot: _prefs.get(UserPreferences.playbackTimeBelowRight),
                  position: position,
                  duration: duration,
                  use24Hour: _prefs.get(UserPreferences.use24HourClock),
                  playbackSpeed: _state.playbackSpeed,
                );
              } else {
                progress = null;
                leftLabel = _formatTime(DateTime.now());
                rightLabel = 'LIVE';
              }
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: AppRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation(AppColorScheme.accent),
                    minHeight: 3,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceXs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      leftLabel,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: AppTypography.fontSizeXs,
                      ),
                    ),
                    Text(
                      rightLabel,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: AppTypography.fontSizeXs,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// The window the stream can be rewound through, with the time of day the
  /// playhead is at on the left and how far behind live it is on the right.
  Widget _buildRewindTimeline(LiveSeekWindow window, Duration position) {
    final l10n = AppLocalizations.of(context);
    final behind = _behindLive(window, position);
    final fraction =
        ((position - window.start).inMilliseconds /
                window.length.inMilliseconds)
            .clamp(0.0, 1.0);
    const labelStyle = TextStyle(
      color: Colors.white54,
      fontSize: AppTypography.fontSizeXs,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (PlatformDetection.isTV)
          ClipRRect(
            borderRadius: AppRadius.circular(2),
            child: LinearProgressIndicator(
              value: fraction,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation(AppColorScheme.accent),
              minHeight: 3,
            ),
          )
        else
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              overlayShape: SliderComponentShape.noOverlay,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            ),
            child: Slider(
              value: fraction,
              activeColor: AppColorScheme.accent,
              inactiveColor: Colors.white24,
              onChangeStart: (_) {
                _seekCommitTimer?.cancel();
                _hideTimer?.cancel();
              },
              onChanged: (value) => setState(
                () => _seekTarget = window.start + window.length * value,
              ),
              onChangeEnd: (_) {
                unawaited(_commitLiveSeek());
                _scheduleHide();
              },
            ),
          ),
        const SizedBox(height: AppSpacing.spaceXs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatTime(DateTime.now().subtract(behind)),
              style: labelStyle,
            ),
            Text(
              behind > _liveEdgeSlack
                  ? '-${formatPlaybackDuration(behind)}'
                  : l10n.liveBadge,
              style: labelStyle,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverlayControlButton({
    FocusNode? focusNode,
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    Color iconColor = Colors.white,
  }) {
    if (PlatformDetection.isTV) {
      return _LiveTvRoundControlButton(
        focusNode: focusNode,
        onPressed: onPressed,
        tooltip: tooltip,
        icon: icon,
        iconColor: iconColor,
      );
    }

    return IconButton(
      focusNode: focusNode,
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white.withValues(alpha: 0.14),
        minimumSize: const Size(44, 44),
        padding: const EdgeInsets.all(8),
        shape: const CircleBorder(),
      ),
      icon: Icon(icon, size: 22, color: iconColor),
    );
  }

  String _formatTime(DateTime dt) {
    return formatClockTime(
      dt,
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
  }
}

class _LiveTvRoundControlButton extends StatefulWidget {
  final FocusNode? focusNode;
  final VoidCallback onPressed;
  final String tooltip;
  final IconData icon;
  final Color iconColor;

  const _LiveTvRoundControlButton({
    required this.onPressed,
    required this.tooltip,
    required this.icon,
    this.focusNode,
    this.iconColor = Colors.white,
  });

  @override
  State<_LiveTvRoundControlButton> createState() =>
      _LiveTvRoundControlButtonState();
}

class _LiveTvRoundControlButtonState extends State<_LiveTvRoundControlButton> {
  late FocusNode _effectiveFocusNode;
  bool _ownsNode = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _effectiveFocusNode = widget.focusNode!;
    } else {
      _effectiveFocusNode = FocusNode();
      _ownsNode = true;
    }
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _LiveTvRoundControlButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode == widget.focusNode) return;

    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsNode) {
      _effectiveFocusNode.dispose();
      _ownsNode = false;
    }

    if (widget.focusNode != null) {
      _effectiveFocusNode = widget.focusNode!;
    } else {
      _effectiveFocusNode = FocusNode();
      _ownsNode = true;
    }
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsNode) {
      _effectiveFocusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    final hasFocus = _effectiveFocusNode.hasFocus;
    if (_focused != hasFocus) {
      setState(() => _focused = hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = ThemeRegistry.active.borders.focusBorder.color;
    return Focus(
      focusNode: _effectiveFocusNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          // The outer Focus is the single focus target for this button; a
          // focusable InkWell would add a second, invisible focus node that
          // breaks the OSD's manual arrow navigation.
          canRequestFocus: false,
          customBorder: const CircleBorder(),
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _focused
                  ? AppColorScheme.accent.withValues(alpha: 0.30)
                  : Colors.white.withValues(alpha: 0.14),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.focusBorder.copyWith(
                  color: _focused
                      ? focusColor
                      : Colors.white.withValues(alpha: 0.10),
                  width: _focused ? 2 : 1,
                ),
              ),
            ),
            child: Icon(widget.icon, size: 24, color: widget.iconColor),
          ),
        ),
      ),
    );
  }
}

/// The failure card's Retry control. Styled like [_LiveTvRoundControlButton]
/// so it fits the rest of this screen's overlay chrome, but as a labelled
/// pill rather than an icon -- and it owns select/enter itself so the OSD's
/// key handler never has to special-case the card being up.
class _LiveTvRetryButton extends StatefulWidget {
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final String label;

  const _LiveTvRetryButton({
    required this.onPressed,
    required this.label,
    required this.focusNode,
  });

  @override
  State<_LiveTvRetryButton> createState() => _LiveTvRetryButtonState();
}

class _LiveTvRetryButtonState extends State<_LiveTvRetryButton> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    final hasFocus = widget.focusNode.hasFocus;
    if (_focused != hasFocus) {
      setState(() => _focused = hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = ThemeRegistry.active.borders.focusBorder.color;
    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: InkWell(
        // Same reasoning as _LiveTvRoundControlButton: the outer Focus is the
        // single focus target, a focusable InkWell would add a second one.
        canRequestFocus: false,
        borderRadius: AppRadius.circular(24),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: AppRadius.circular(24),
            color: _focused
                ? AppColorScheme.accent.withValues(alpha: 0.30)
                : Colors.white.withValues(alpha: 0.14),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.focusBorder.copyWith(
                color: _focused
                    ? focusColor
                    : Colors.white.withValues(alpha: 0.10),
                width: _focused ? 2 : 1,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeMd,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
