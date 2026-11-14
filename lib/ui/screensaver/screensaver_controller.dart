import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:playback_core/playback_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../data/models/aggregated_item.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/app_exit.dart';
import '../../util/platform_detection.dart';

class ScreensaverController {
  ScreensaverController(this._prefs, this._playbackManager) {
    if (PlatformDetection.isTV) {
      _enabledCache = _prefs.get(UserPreferences.screensaverEnabled);
      _timeoutCache = _prefs.get(UserPreferences.screensaverTimeout);
      _sleepAfterCache = _prefs.get(UserPreferences.sleepAfterIdle);
      _duringAudioCache = _prefs.get(UserPreferences.screensaverDuringAudio);
      _playingSub = _playbackManager.state.playingStream.listen(
        _onPlayingChanged,
      );
      _prefs.addListener(_onPrefsChanged);
      _restartIdleTimer();
      _restartSleepTimer();
    }
    visible.addListener(refreshWakeLock);
    _refreshWakeLock();
  }

  final UserPreferences _prefs;
  final PlaybackManager _playbackManager;

  @visibleForTesting
  Future<void> Function() exitApp = AppExit.closeApp;

  /// Apple discourages apps quitting themselves, so on Apple TV the screen
  /// goes back to tvOS's own screensaver and sleep while Moonfin stays open.
  @visibleForTesting
  bool handBackInsteadOfExit = PlatformDetection.isAppleTV;

  @visibleForTesting
  bool get holdsScreenOn => _wakeLockEnabled;

  final ValueNotifier<bool> visible = ValueNotifier(false);

  StreamSubscription<bool>? _playingSub;
  Timer? _idleTimer;
  Timer? _sleepTimer;
  int _sleepAfterCache = 0;
  bool _screenHandedBack = false;
  bool _duringAudioCache = false;
  final Set<LogicalKeyboardKey> _consumedKeys = {};
  bool _enabledCache = false;
  ScreensaverTimeout _timeoutCache = ScreensaverTimeout.m5;
  bool _activityPaused = false;
  bool _playbackActive = false;
  bool _streamPlaying = false;
  bool _trailerActive = false;
  bool _homePreviewActive = false;
  bool _nativePlayerPresented = false;
  bool _wakeLockEnabled = false;

  bool get activityPaused => _activityPaused;

  set activityPaused(bool value) {
    if (_activityPaused == value) return;
    _activityPaused = value;
    _refreshWakeLock();
    _onStateChanged();
  }

  void setPlaybackActive(bool value) {
    if (_playbackActive == value) return;
    _playbackActive = value;
    _refreshWakeLock();
    _onStateChanged();
  }

  /// Apple TV presents its player over the Flutter view, so our screensaver
  /// would draw underneath it and never be seen. While it is up the screen is
  /// left to tvOS, which means nothing is armed here and a paused player
  /// releases the idle timer so the system screensaver and sleep still work.
  void setNativePlayerPresented(bool value) {
    if (_nativePlayerPresented == value) return;
    _nativePlayerPresented = value;
    _refreshWakeLock();
    _onStateChanged();
  }

  void setMediaBarTrailerActive(bool value) {
    if (_trailerActive == value) return;
    _trailerActive = value;
    _refreshWakeLock();
    _onStateChanged();
  }

  /// A home card's preview, which can be a full trailer.
  void setHomePreviewActive(bool value) {
    if (_homePreviewActive == value) return;
    _homePreviewActive = value;
    _refreshWakeLock();
    _onStateChanged();
  }

  bool get _armed =>
      PlatformDetection.isTV &&
      _enabledCache &&
      !_activityPaused &&
      !_playbackActive &&
      (!_streamPlaying || (_duringAudioCache && _playingAudio)) &&
      !_trailerActive &&
      !_homePreviewActive &&
      !_nativePlayerPresented;

  bool get _playingAudio {
    final item = _playbackManager.queueService.currentItem;
    return item is AggregatedItem && item.isAudioLike;
  }

  void notifyInteraction() {
    if (!PlatformDetection.isTV || visible.value) return;
    _restartSleepTimer();
    if (_armed) {
      _restartIdleTimer();
    } else {
      _idleTimer?.cancel();
    }
  }

  void dismiss() {
    if (visible.value) {
      visible.value = false;
    }
    _restartIdleTimer();
    _restartSleepTimer();
  }

  bool dismissIfVisible() {
    if (!visible.value) return false;
    dismiss();
    return true;
  }

  bool handleKeyEvent(KeyEvent event) {
    if (!visible.value) {
      if (event is KeyDownEvent) {
        notifyInteraction();
      }
      return false;
    }
    if (event is KeyDownEvent || event is KeyRepeatEvent) {
      _consumedKeys.add(event.logicalKey);
      dismiss();
      return true;
    }
    return _consumedKeys.remove(event.logicalKey);
  }

  void _onPlayingChanged(bool playing) {
    if (_streamPlaying == playing) return;
    _streamPlaying = playing;
    _refreshWakeLock();
    _onStateChanged();
  }

  void _onPrefsChanged() {
    final enabled = _prefs.get(UserPreferences.screensaverEnabled);
    final timeout = _prefs.get(UserPreferences.screensaverTimeout);
    final sleepAfter = _prefs.get(UserPreferences.sleepAfterIdle);
    final duringAudio = _prefs.get(UserPreferences.screensaverDuringAudio);
    if (enabled == _enabledCache &&
        timeout == _timeoutCache &&
        sleepAfter == _sleepAfterCache &&
        duringAudio == _duringAudioCache) {
      return;
    }
    _enabledCache = enabled;
    _timeoutCache = timeout;
    _sleepAfterCache = sleepAfter;
    _duringAudioCache = duringAudio;
    _refreshWakeLock();
    _onStateChanged();
  }

  void _onStateChanged() {
    if (!PlatformDetection.isTV) return;
    _restartSleepTimer();
    if (!_armed) {
      _idleTimer?.cancel();
      if (visible.value) {
        visible.value = false;
      }
      return;
    }
    if (!visible.value) {
      _restartIdleTimer();
    }
  }

  void _restartIdleTimer() {
    _idleTimer?.cancel();
    if (!_armed) return;
    _idleTimer = Timer(Duration(minutes: _timeoutCache.minutes), () {
      if (_armed && !visible.value) {
        visible.value = true;
      }
    });
  }

  static bool get sleepAfterIdleSupported =>
      PlatformDetection.isTV &&
      (PlatformDetection.isAndroid || PlatformDetection.isAppleTV);

  /// A paused player counts as idle too, since it holds the screen on just
  /// like the screensaver does.
  bool get _sleepArmed =>
      sleepAfterIdleSupported &&
      _sleepAfterCache > 0 &&
      !_activityPaused &&
      !_streamPlaying;

  void _restartSleepTimer() {
    _sleepTimer?.cancel();
    if (_screenHandedBack) {
      _screenHandedBack = false;
      _refreshWakeLock();
    }
    if (!_sleepArmed) return;
    _sleepTimer = Timer(
      Duration(minutes: _sleepAfterCache),
      () => unawaited(_letTvSleep()),
    );
  }

  Future<void> _letTvSleep() async {
    if (!_sleepArmed) return;
    if (handBackInsteadOfExit) {
      _screenHandedBack = true;
      _refreshWakeLock();
      return;
    }
    if (_playbackManager.queueService.currentItem != null) {
      await _playbackManager.stop(userInitiated: false);
      await _playbackManager.lastStopReport.timeout(
        const Duration(seconds: 5),
        onTimeout: () {},
      );
    }
    await exitApp();
  }

  static const _systemChannel = MethodChannel('moonfin/appletv_system');

  Future<void> _setWakeLockEnabled(bool enabled) async {
    try {
      if (PlatformDetection.isAppleTV) {
        await _systemChannel.invokeMethod('setIdleTimerDisabled', enabled);
      } else if (enabled) {
        await WakelockPlus.enable();
      } else {
        await WakelockPlus.disable();
      }
    } catch (_) {}
  }

  @visibleForTesting
  static bool wakeLockNeeded({
    required bool activityPaused,
    required bool playbackActive,
    required bool streamPlaying,
    required bool trailerActive,
    required bool screensaverVisible,
    required bool isTv,
    required bool screensaverEnabled,
    required bool nativePlayerPresented,
  }) {
    if (activityPaused) return false;
    return playbackActive ||
        streamPlaying ||
        trailerActive ||
        screensaverVisible ||
        (isTv && screensaverEnabled && !nativePlayerPresented);
  }

  void _refreshWakeLock({bool force = false}) {
    final shouldEnable =
        !_screenHandedBack &&
        wakeLockNeeded(
          activityPaused: _activityPaused,
          playbackActive: _playbackActive,
          streamPlaying: _streamPlaying,
          trailerActive: _trailerActive || _homePreviewActive,
          screensaverVisible: visible.value,
          isTv: PlatformDetection.isTV,
          screensaverEnabled: _enabledCache,
          nativePlayerPresented: _nativePlayerPresented,
        );
    if (_wakeLockEnabled == shouldEnable && !force) {
      return;
    }
    _wakeLockEnabled = shouldEnable;
    unawaited(_setWakeLockEnabled(shouldEnable));
  }

  void refreshWakeLock() {
    _refreshWakeLock(force: true);
  }

  void dispose() {
    visible.removeListener(refreshWakeLock);
    _playingSub?.cancel();
    _idleTimer?.cancel();
    _sleepTimer?.cancel();
    _prefs.removeListener(_onPrefsChanged);
    _wakeLockEnabled = false;
    unawaited(_setWakeLockEnabled(false));
  }
}
