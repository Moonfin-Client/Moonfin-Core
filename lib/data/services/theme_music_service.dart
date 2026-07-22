import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import 'theme_audio_player.dart';

class ThemeMusicService implements AudioOwnable {
  final MediaServerClient _client;
  final UserPreferences _prefs;
  final PlaybackManager _playbackManager;
  final PlaybackArbiter _audioArbiter;

  ThemeAudioPlayer? _player;
  String? _currentThemeSourceId;
  Timer? _fadeTimer;
  Completer<void>? _fadeCompleter;
  double _targetVolume = 0.0;
  final Set<Object> _activeDetailScreens = {};
  bool _fadingOut = false;
  bool _externalAudioActive = false;
  bool _playSuppressed = false;
  int _playGeneration = 0;
  StreamSubscription<bool>? _mainPlaybackSub;
  AppLifecycleListener? _lifecycleListener;

  static const _fadeDurationMs = 2000;
  static const _fadeStepMs = 50;
  static const _validTypes = {'Series', 'Movie', 'Season', 'Episode', 'BoxSet'};

  ThemeMusicService(
    this._client,
    this._prefs,
    this._playbackManager,
    this._audioArbiter,
  ) {
    _audioArbiter.register(this);
    _mainPlaybackSub = _playbackManager.state.playingStream.listen((isPlaying) {
      if (isPlaying) {
        fadeOutAndStop();
      }
    });
    // Stop immediately when backgrounded. fadeOutAndStop defers the real stop to
    // a fade timer that is frozen while the app is suspended, so the player
    // would otherwise keep sounding. 'inactive' is excluded so a desktop window
    // losing focus does not kill the theme.
    _lifecycleListener = AppLifecycleListener(
      onStateChange: (state) {
        if (state == AppLifecycleState.paused ||
            state == AppLifecycleState.hidden ||
            state == AppLifecycleState.detached) {
          stop();
        }
      },
    );
  }

  @override
  AudioProducer get audioProducerId => AudioProducer.themeMusic;

  @override
  Future<void> onAudioRevoked(RevokeReason reason) {
    return fadeOutAndStop();
  }

  void registerDetailScreen(Object token) {
    _activeDetailScreens.add(token);
  }

  void unregisterDetailScreen(Object token) {
    _activeDetailScreens.remove(token);
    if (_activeDetailScreens.isEmpty) {
      if (_player != null) {
        fadeOutAndStop();
      } else {
        stop();
      }
    }
  }

  void setExternalAudioActive(bool active) {
    if (_externalAudioActive == active) return;
    _externalAudioActive = active;
    if (active) {
      fadeOutAndStop();
    }
  }

  Future<void> playForItem(AggregatedItem item) async {
    if (!_prefs.get(UserPreferences.themeMusicEnabled)) return;
    final activeItem = _playbackManager.queueService.currentItem;
    if (activeItem != null) return;
    if (_playbackManager.state.isPlaying) return;
    if (_externalAudioActive) return;
    if (_playSuppressed) return;
    if (!_validTypes.contains(item.type)) {
      fadeOutAndStop();
      return;
    }

    final themeItemId =
        (item.type == 'Episode' || item.type == 'Season') &&
            item.seriesId != null
        ? item.seriesId!
        : item.id;

    if (_currentThemeSourceId == themeItemId && _player != null) {
      if (_fadingOut) {
        _fadeTimer?.cancel();
        _fadeTimer = null;
        _fadingOut = false;
        _fadeIn(_playGeneration);
      }
      return;
    }

    stop();
    final generation = ++_playGeneration;
    _currentThemeSourceId = themeItemId;

    ThemeAudioPlayer? localPlayer;
    try {
      final data = await _client.itemsApi.getThemeMedia(themeItemId);
      if (generation != _playGeneration || _activeDetailScreens.isEmpty) return;

      final songsResult = data['ThemeSongsResult'] as Map<String, dynamic>?;
      final songs =
          (songsResult?['Items'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      if (songs.isEmpty) return;

      final song = songs[Random().nextInt(songs.length)];
      final songId = song['Id']?.toString() ?? '';
      final url = _buildAudioUrl(songId);

      _targetVolume = _prefs.get(UserPreferences.themeMusicVolume) / 100.0;

      // Ask the arbiter for permission to play. This will revoke existing previews if any.
      await _audioArbiter.acquire(AudioProducer.themeMusic);
      if (generation != _playGeneration ||
          _activeDetailScreens.isEmpty ||
          _externalAudioActive) {
        return;
      }

      localPlayer = ThemeAudioPlayer.create();
      _player = localPlayer;

      await localPlayer.setVolume(0);
      if (generation != _playGeneration || _activeDetailScreens.isEmpty) {
        await _safeDispose(localPlayer);
        return;
      }

      await localPlayer.open(url);
      if (generation != _playGeneration || _activeDetailScreens.isEmpty) {
        await _safeDispose(localPlayer);
        return;
      }

      if (_prefs.get(UserPreferences.themeMusicLoop)) {
        await localPlayer.setLoop();
        if (generation != _playGeneration || _activeDetailScreens.isEmpty) {
          await _safeDispose(localPlayer);
          return;
        }
      }

      _fadeIn(generation);
    } catch (_) {
      if (localPlayer != null &&
          (generation != _playGeneration || _player != localPlayer || _activeDetailScreens.isEmpty)) {
        await _safeDispose(localPlayer);
      }
    }
  }

  Future<void> _safeDispose(ThemeAudioPlayer player) async {
    try {
      await player.setVolume(0);
    } catch (_) {}
    try {
      await player.pause();
    } catch (_) {}
    try {
      await player.dispose();
    } catch (_) {}
  }

  String _buildAudioUrl(String songId) {
    final token = _client.accessToken ?? '';
    return '${_client.baseUrl}/Audio/$songId/stream?static=true&audioCodec=mp3&audioBitrate=128000&${_client.serverType.tokenQueryParam}=$token';
  }

  void _fadeIn(int generation) {
    _fadeTimer?.cancel();
    final steps = _fadeDurationMs ~/ _fadeStepMs;
    var step = 0;
    _fadeTimer = Timer.periodic(Duration(milliseconds: _fadeStepMs), (timer) {
      if (generation != _playGeneration || _player == null) {
        timer.cancel();
        return;
      }
      step++;
      final volume = (step / steps) * _targetVolume * 100;
      _player?.setVolume(volume.clamp(0, 100));
      if (step >= steps) timer.cancel();
    });
  }

  Future<void> fadeOutAndStop() {
    final player = _player;
    if (player == null || _fadingOut) return _fadeCompleter?.future ?? Future.value();

    _fadeTimer?.cancel();
    _fadingOut = true;
    _fadeCompleter = Completer<void>();
    final generation = _playGeneration;
    final currentVolume = player.currentVolume;
    final steps = _fadeDurationMs ~/ _fadeStepMs;
    var step = 0;

    _fadeTimer = Timer.periodic(Duration(milliseconds: _fadeStepMs), (timer) {
      if (generation != _playGeneration || _player != player) {
        timer.cancel();
        if (_fadeCompleter != null && !_fadeCompleter!.isCompleted) {
          _fadeCompleter!.complete();
        }
        return;
      }
      step++;
      final volume = currentVolume * (1.0 - step / steps);
      player.setVolume(volume.clamp(0, 100));
      if (step >= steps) {
        timer.cancel();
        stop();
      }
    });

    return _fadeCompleter!.future;
  }

  void stop() {
    _fadeTimer?.cancel();
    _fadeTimer = null;
    _fadingOut = false;
    _playGeneration++;
    final player = _player;
    _player = null;
    _currentThemeSourceId = null;
    if (player != null) {
      try {
        player.setVolume(0);
      } catch (_) {}
      try {
        player.pause();
      } catch (_) {}
      unawaited(_safeDispose(player));
    }
    if (_fadeCompleter != null && !_fadeCompleter!.isCompleted) {
      _fadeCompleter!.complete();
    }
  }

  void forceStop({
    Duration suppressionDuration = const Duration(milliseconds: 800),
  }) {
    stop();
    _playSuppressed = true;
    Future<void>.delayed(suppressionDuration).then((_) {
      _playSuppressed = false;
    });
  }

  void dispose() {
    _mainPlaybackSub?.cancel();
    _lifecycleListener?.dispose();
    stop();
  }
}
