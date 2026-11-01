import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';

import '../../playback/mpv_client_certificate.dart';
import '../../playback/mpv_player_registry.dart';
import '../../util/platform_detection.dart';

abstract class ThemeAudioPlayer {
  Future<void> setVolume(double volume);
  Future<void> open(String url);
  Future<void> setLoop();
  Future<void> pause();
  Future<void> dispose();
  double get currentVolume;

  factory ThemeAudioPlayer.create() => PlatformDetection.useApplePreviewPlayer
      ? AppleTvThemeAudioPlayer()
      : MediaKitThemeAudioPlayer();
}

class MediaKitThemeAudioPlayer implements ThemeAudioPlayer {
  final Player _player = MpvPlayerRegistry.instance.create();

  @override
  double get currentVolume => _player.state.volume;

  @override
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  @override
  Future<void> open(String url) async {
    await applyMpvClientCertificate(_player, url);
    return _player.open(Media(url));
  }

  @override
  Future<void> setLoop() => _player.setPlaylistMode(PlaylistMode.loop);

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> dispose() => MpvPlayerRegistry.instance.dispose(_player);
}

class AppleTvThemeAudioPlayer implements ThemeAudioPlayer {
  static const _channel = MethodChannel('moonfin/appletv_theme_music');
  static int _nextToken = 0;

  final int _token = _nextToken++;
  double _volume = 0;

  @override
  double get currentVolume => _volume;

  Future<void> _send(String method, [Map<String, dynamic>? extra]) async {
    try {
      await _channel.invokeMethod(method, {'token': _token, ...?extra});
    } catch (_) {}
  }

  @override
  Future<void> setVolume(double volume) {
    _volume = volume;
    return _send('setVolume', {'volume': volume});
  }

  @override
  Future<void> open(String url) => _send('open', {'url': url});

  @override
  Future<void> setLoop() async {}

  @override
  Future<void> pause() => _send('stop');

  @override
  Future<void> dispose() => _send('stop');
}
