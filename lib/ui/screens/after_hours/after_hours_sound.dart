import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:media_kit/media_kit.dart';

import '../../../playback/mpv_player_registry.dart';
import '../../../util/platform_detection.dart';
import 'after_hours_game.dart';

/// The arcade's effects and menu music. Each effect keeps its own player
/// loaded and parked at the start, so a trigger is only a seek and an unpause.
class AfterHoursSound {
  AfterHoursSound._();

  static final instance = AfterHoursSound._();

  static const _enabledPref = Preference<bool>(
    key: 'after_hours_sound',
    defaultValue: true,
  );

  /// Apple builds leave libmpv out, so the arcade is silent there.
  static bool get _supported =>
      !PlatformDetection.isApple && !PlatformDetection.isAppleTV;

  bool get enabled => _enabled;
  bool _enabled = true;
  final Map<ArcadeSound, Player> _fx = {};
  Player? _music;
  bool _musicOn = false;
  int _users = 0;
  Timer? _unload;

  PreferenceStore? get _store => GetIt.instance.maybeGet<PreferenceStore>();

  /// Loads the players for as long as someone holds the sound open.
  void acquire() {
    _users++;
    _unload?.cancel();
    if (_users > 1) return;
    _enabled = _store?.get(_enabledPref) ?? true;
    if (!_supported || _fx.isNotEmpty) return;
    try {
      for (final s in ArcadeSound.values) {
        final player = _create();
        _fx[s] = player;
        unawaited(
          player.open(
            Media('asset:///assets/after_hours/${s.file}.wav'),
            play: false,
          ),
        );
      }
    } catch (e) {
      // Without libmpv the arcade still plays, only silently.
      debugPrint('[AfterHours] sound unavailable: $e');
    }
  }

  Player _create() => MpvPlayerRegistry.instance.create(
    configuration: const PlayerConfiguration(libass: false),
  );

  /// The players stay loaded a while after the last user lets go, since
  /// loading them takes about a second and the Version row is often pressed
  /// again once its count runs out.
  void release() {
    if (_users == 0) return;
    _users--;
    if (_users > 0) return;
    final music = _music;
    _music = null;
    _musicOn = false;
    if (music != null) unawaited(MpvPlayerRegistry.instance.dispose(music));
    if (_fx.isNotEmpty) {
      _unload = Timer(const Duration(seconds: 30), _disposeEffects);
    }
  }

  void _disposeEffects() {
    if (_users > 0) return;
    for (final p in _fx.values) {
      unawaited(MpvPlayerRegistry.instance.dispose(p));
    }
    _fx.clear();
  }

  void play(ArcadeSound s) {
    if (!_enabled) return;
    final p = _fx[s];
    if (p == null) return;
    unawaited(_restart(p));
  }

  Future<void> _restart(Player p) async {
    try {
      await p.seek(Duration.zero);
      await p.play();
    } catch (_) {
      // A player torn down mid-trigger just stays quiet.
    }
  }

  void music(bool on) {
    _musicOn = on;
    _applyMusic();
  }

  void _applyMusic() {
    if (!_supported) return;
    final want = _musicOn && _enabled && _users > 0;
    var player = _music;
    if (want && player == null) {
      if (_fx.isEmpty) return;
      player = _music = _create();
      // Looping the file rather than a one item playlist seeks back instead
      // of reopening it, which keeps the four bars tight.
      unawaited(player.setPlaylistMode(PlaylistMode.single));
      unawaited(player.setVolume(70));
      unawaited(
        player.open(Media('asset:///assets/after_hours/menu-loop.mp3')),
      );
      return;
    }
    if (player == null) return;
    unawaited(want ? player.play() : player.pause());
  }

  Future<void> setEnabled(bool on) async {
    _enabled = on;
    _applyMusic();
    await _store?.set(_enabledPref, on);
  }
}
