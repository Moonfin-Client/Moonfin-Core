import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';
import '../util/platform_detection.dart';
import 'media3_player_backend.dart';

class PlaybackLifecycleHandler with WidgetsBindingObserver {
  final PlaybackManager _manager;
  Duration? _savedPosition;
  bool? _wasPlaying;
  Timer? _bgCorrectionTimer;
  bool _bgSeekInFlight = false;
  bool _screenLocked = false;

  void setScreenLocked(bool locked) {
    _screenLocked = locked;
  }

  PlaybackLifecycleHandler(this._manager) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final currentItem = _manager.queueService.currentItem;
    bool isAudio = false;
    if (currentItem is AggregatedItem) {
      isAudio = currentItem.isAudioLike;
    } else if (currentItem is String) {
      final meta = _manager.currentOfflineMetadata;
      if (meta != null) {
        final type = meta['Type']?.toString();
        final mediaType = meta['MediaType']?.toString();
        isAudio = type == 'Audio' || type == 'AudioBook' || mediaType == 'Audio';
      }
    }
    if (isAudio) {
      return;
    }
    switch (state) {
      case AppLifecycleState.inactive:
        if (PlatformDetection.isMobile) _saveState();
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _saveState();
        final backend = _manager.backend;
        if (backend is Media3PlayerBackend) {
          unawaited(backend.appPaused());
        }
        break;
      case AppLifecycleState.resumed:
        final backend = _manager.backend;
        if (backend is Media3PlayerBackend) {
          unawaited(backend.appResumed());
        }
        _restoreState();
        break;
      default:
        break;
    }
  }

  void _saveState() {
    if (_manager.queueService.currentItem == null) return;

    final newPos = _manager.state.position;
    if (_savedPosition != null && newPos < _savedPosition!) {
      return;
    }

    _savedPosition = newPos;
    _wasPlaying = _manager.state.isPlaying || (_wasPlaying == true);

    if (_wasPlaying != true) {
      _bgCorrectionTimer?.cancel();
      _bgCorrectionTimer = null;
      return;
    }

    _bgCorrectionTimer?.cancel();
    _bgCorrectionTimer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) => _bgCorrect(),
    );
    unawaited(_bgCorrect());
  }

  Future<void> _bgCorrect() async {
    final saved = _savedPosition;
    if (saved == null) return;
    if (_manager.queueService.currentItem == null) return;
    if (_bgSeekInFlight) return;

    final currentPos = _manager.backend?.position ?? _manager.state.position;
    if (currentPos >= saved - const Duration(seconds: 1)) return;

    final regressedBy = saved - currentPos;
    if (saved > const Duration(seconds: 1) &&
        regressedBy > const Duration(seconds: 2)) {
      _bgSeekInFlight = true;
      try {
        await _manager.seekTo(saved);
      } finally {
        _bgSeekInFlight = false;
      }
    }
  }

  Future<void> _restoreState() async {
    _bgCorrectionTimer?.cancel();
    _bgCorrectionTimer = null;
    _bgSeekInFlight = false;

    if (_screenLocked) return;

    final savedPos = _savedPosition;
    final wasPlaying = _wasPlaying;
    _savedPosition = null;
    _wasPlaying = null;

    if (savedPos == null || wasPlaying == null) return;
    if (_manager.queueService.currentItem == null) return;

    try {
      if (!wasPlaying && _manager.state.isPlaying) {
        await _manager.pause();
      }

      final currentPos = _manager.backend?.position ?? _manager.state.position;
      final regressedBy = savedPos - currentPos;
      if (savedPos > const Duration(seconds: 1) &&
          regressedBy > const Duration(seconds: 2)) {
        await _manager.seekTo(savedPos);

        await Future.delayed(const Duration(milliseconds: 120));
        final verifyPos = _manager.backend?.position ?? _manager.state.position;
        if (verifyPos < savedPos - const Duration(seconds: 3)) {
          await _manager.seekTo(savedPos);
        }
      }

      if (wasPlaying && !_manager.state.isPlaying) {
        await _manager.resume();
      }
    } catch (_) {}
  }
}
