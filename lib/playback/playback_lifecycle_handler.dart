import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';
import '../util/platform_detection.dart';
import 'media3_player_backend.dart';

class _StaleVideoClaim {
  _StaleVideoClaim({
    required this.item,
    required this.position,
    required this.wasPlaying,
    required this.cleanup,
  });

  final AggregatedItem item;
  final Duration position;
  final bool wasPlaying;
  final Future<bool> cleanup;
}

class PlaybackLifecycleHandler with WidgetsBindingObserver {
  // Detaching the render surface can regress the backend position, but only
  // right after the app goes to the background. _restoreState runs the same
  // correction on resume, so ten seconds of ticks is enough.
  static const int _maxBgCorrectionTicks = 40;
  static const Duration _videoBackgroundGracePeriod = Duration(seconds: 3);

  final PlaybackManager _manager;
  Duration? _savedPosition;
  bool? _wasPlaying;
  Timer? _bgCorrectionTimer;
  int _bgCorrectionTicks = 0;
  bool _bgSeekInFlight = false;
  bool _screenLocked = false;
  Timer? _videoStopTimer;
  AggregatedItem? _videoStopItem;
  dynamic _savedStateItem;
  _StaleVideoClaim? _staleVideoClaim;
  _StaleVideoClaim? _staleRestoreClaim;

  void setScreenLocked(bool locked) {
    _screenLocked = locked;
  }

  PlaybackLifecycleHandler(this._manager) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _cancelVideoStop();
    }

    final currentItem = _manager.queueService.currentItem;
    bool isAudio = false;
    if (currentItem is AggregatedItem) {
      isAudio = currentItem.isAudioLike;
    } else if (currentItem is String) {
      final meta = _manager.currentOfflineMetadata;
      if (meta != null) {
        final type = meta['Type']?.toString();
        final mediaType = meta['MediaType']?.toString();
        isAudio =
            type == 'Audio' || type == 'AudioBook' || mediaType == 'Audio';
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
        _scheduleVideoStop(currentItem);
        break;
      case AppLifecycleState.resumed:
        final backend = _manager.backend;
        if (backend is Media3PlayerBackend &&
            !identical(_staleVideoClaim?.item, currentItem) &&
            !identical(_staleRestoreClaim?.item, currentItem)) {
          unawaited(backend.appResumed());
        }
        unawaited(_restoreState());
        break;
      default:
        break;
    }
  }

  void _scheduleVideoStop(dynamic currentItem) {
    if (!PlatformDetection.isAndroid ||
        !PlatformDetection.isTV ||
        currentItem is! AggregatedItem) {
      return;
    }

    if (identical(_videoStopItem, currentItem) ||
        identical(_staleVideoClaim?.item, currentItem)) {
      return;
    }

    _videoStopTimer?.cancel();
    _videoStopItem = currentItem;
    _videoStopTimer = Timer(_videoBackgroundGracePeriod, () {
      _videoStopTimer = null;
      if (!identical(_videoStopItem, currentItem) ||
          !identical(_manager.queueService.currentItem, currentItem)) {
        return;
      }
      final claim = _StaleVideoClaim(
        item: currentItem,
        position: _isLiveTv(currentItem)
            ? Duration.zero
            : (_savedPosition ?? Duration.zero),
        wasPlaying: _wasPlaying ?? false,
        cleanup: _cleanupVideoSession(currentItem),
      );
      _staleVideoClaim = claim;
      unawaited(claim.cleanup);
    });
  }

  Future<bool> _cleanupVideoSession(AggregatedItem item) async {
    try {
      return await _manager.stopForBackground(item);
    } catch (_) {
      return false;
    }
  }

  bool _isLiveTv(AggregatedItem item) =>
      item.type == 'TvChannel' || item.type == 'LiveTvChannel';

  void _cancelVideoStop() {
    _videoStopTimer?.cancel();
    _videoStopTimer = null;
    _videoStopItem = null;
  }

  void _saveState() {
    final currentItem = _manager.queueService.currentItem;
    if (currentItem == null) return;
    if (!identical(_savedStateItem, currentItem)) {
      _savedPosition = null;
      _wasPlaying = null;
      _savedStateItem = currentItem;
    }

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
    _bgCorrectionTicks = 0;
    _bgCorrectionTimer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      if (++_bgCorrectionTicks > _maxBgCorrectionTicks) {
        _stopBgCorrection();
        return;
      }
      _bgCorrect();
    });
    unawaited(_bgCorrect());
  }

  void _stopBgCorrection() {
    _bgCorrectionTimer?.cancel();
    _bgCorrectionTimer = null;
  }

  Future<void> _bgCorrect() async {
    final saved = _savedPosition;
    if (saved == null) return;
    if (_manager.queueService.currentItem == null) {
      _stopBgCorrection();
      return;
    }
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

    if (_staleRestoreClaim != null) return;

    final staleClaim = _staleVideoClaim;
    if (staleClaim != null) {
      _staleVideoClaim = null;
      _staleRestoreClaim = staleClaim;
      _savedPosition = null;
      _wasPlaying = null;
      _savedStateItem = null;

      try {
        final cleanupSucceeded = await staleClaim.cleanup;
        if (!cleanupSucceeded ||
            !identical(_manager.queueService.currentItem, staleClaim.item)) {
          return;
        }
        await _manager.startQueuedPlayback(
          startPosition: staleClaim.position,
          freshResolution: true,
        );
        if (!staleClaim.wasPlaying && _manager.state.isPlaying) {
          await _manager.pause();
        }
      } catch (_) {
      } finally {
        if (identical(_staleRestoreClaim, staleClaim)) {
          _staleRestoreClaim = null;
        }
      }
      return;
    }

    final savedPos = _savedPosition;
    final wasPlaying = _wasPlaying;
    _savedPosition = null;
    _wasPlaying = null;
    _savedStateItem = null;

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
