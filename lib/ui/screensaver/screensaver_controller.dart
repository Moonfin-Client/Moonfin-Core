import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:playback_core/playback_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';

class ScreensaverController {
  ScreensaverController(this._prefs, PlaybackManager playbackManager) {
    if (PlatformDetection.isTV) {
      _enabledCache = _prefs.get(UserPreferences.screensaverEnabled);
      _timeoutCache = _prefs.get(UserPreferences.screensaverTimeout);
      _playingSub = playbackManager.state.playingStream.listen(
        _onPlayingChanged,
      );
      _prefs.addListener(_onPrefsChanged);
      _restartIdleTimer();
    }
    visible.addListener(refreshWakeLock);
    _refreshWakeLock();
  }

  final UserPreferences _prefs;

  final ValueNotifier<bool> visible = ValueNotifier(false);

  StreamSubscription<bool>? _playingSub;
  Timer? _idleTimer;
  final Set<LogicalKeyboardKey> _consumedKeys = {};
  bool _enabledCache = false;
  ScreensaverTimeout _timeoutCache = ScreensaverTimeout.m5;
  bool _activityPaused = false;
  bool _playbackActive = false;
  bool _streamPlaying = false;
  bool _trailerActive = false;
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

  bool get _armed =>
      PlatformDetection.isTV &&
      _enabledCache &&
      !_activityPaused &&
      !_playbackActive &&
      !_streamPlaying &&
      !_trailerActive &&
      !_nativePlayerPresented;

  void notifyInteraction() {
    if (!PlatformDetection.isTV || visible.value) return;
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
    if (enabled == _enabledCache && timeout == _timeoutCache) return;
    _enabledCache = enabled;
    _timeoutCache = timeout;
    _refreshWakeLock();
    _onStateChanged();
  }

  void _onStateChanged() {
    if (!PlatformDetection.isTV) return;
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
    final shouldEnable = wakeLockNeeded(
      activityPaused: _activityPaused,
      playbackActive: _playbackActive,
      streamPlaying: _streamPlaying,
      trailerActive: _trailerActive,
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
    _prefs.removeListener(_onPrefsChanged);
    _wakeLockEnabled = false;
    unawaited(_setWakeLockEnabled(false));
  }
}
