import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart';
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

  /// Apple builds leave libmpv out, so there the clips play through
  /// AVAudioPlayer on a native channel instead.
  static bool get _apple =>
      PlatformDetection.isApple || PlatformDetection.isAppleTV;
  static const _native = MethodChannel('moonfin/arcade_sound');
  static const _musicAsset = 'assets/after_hours/menu-loop.mp3';

  bool get enabled => _enabled;
  bool _enabled = true;
  final Map<ArcadeSound, Player> _fx = {};
  Player? _music;
  bool _musicOn = false;
  int _users = 0;
  Timer? _unload;
  bool _nativeFx = false;
  bool _nativeMusic = false;

  PreferenceStore? get _store => GetIt.instance.maybeGet<PreferenceStore>();

  /// Loads the players for as long as someone holds the sound open.
  void acquire() {
    _users++;
    _unload?.cancel();
    if (_users > 1) return;
    _enabled = _store?.get(_enabledPref) ?? true;
    if (_apple) {
      if (_nativeFx) return;
      _nativeFx = true;
      for (final s in ArcadeSound.values) {
        unawaited(_nativeLoad(s.name, _fxAsset(s)));
      }
      return;
    }
    if (_fx.isNotEmpty) return;
    try {
      for (final s in ArcadeSound.values) {
        final player = _create();
        _fx[s] = player;
        unawaited(player.open(Media('asset:///${_fxAsset(s)}'), play: false));
      }
    } catch (e) {
      // Without libmpv the arcade still plays, only silently.
      debugPrint('[AfterHours] sound unavailable: $e');
    }
  }

  static String _fxAsset(ArcadeSound s) => 'assets/after_hours/${s.file}.wav';

  Future<bool> _nativeLoad(
    String id,
    String asset, {
    bool loop = false,
    double volume = 1,
  }) async {
    try {
      final bytes = await rootBundle.load(asset);
      return await _native.invokeMethod<bool>('load', {
            'id': id,
            'data': bytes.buffer.asUint8List(
              bytes.offsetInBytes,
              bytes.lengthInBytes,
            ),
            'loop': loop,
            'volume': volume,
          }) ??
          false;
    } catch (e) {
      debugPrint('[AfterHours] sound unavailable: $e');
      return false;
    }
  }

  void _nativeCall(String method, String id) {
    unawaited(
      _native.invokeMethod<void>(method, {'id': id}).catchError((_) {}),
    );
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
    if (_nativeMusic) {
      _nativeMusic = false;
      _nativeCall('unload', 'music');
    }
    if (_fx.isNotEmpty || _nativeFx) {
      _unload = Timer(const Duration(seconds: 30), _disposeEffects);
    }
  }

  void _disposeEffects() {
    if (_users > 0) return;
    if (_nativeFx) {
      _nativeFx = false;
      for (final s in ArcadeSound.values) {
        _nativeCall('unload', s.name);
      }
    }
    for (final p in _fx.values) {
      unawaited(MpvPlayerRegistry.instance.dispose(p));
    }
    _fx.clear();
  }

  void play(ArcadeSound s) {
    if (!_enabled) return;
    if (_nativeFx) {
      _nativeCall('play', s.name);
      return;
    }
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

  bool get _wantMusic => _musicOn && _enabled && _users > 0;

  void _applyMusic() {
    final want = _wantMusic;
    if (_apple) {
      _applyNativeMusic(want);
      return;
    }
    var player = _music;
    if (want && player == null) {
      if (_fx.isEmpty) return;
      player = _music = _create();
      // Looping the file rather than a one item playlist seeks back instead
      // of reopening it, which keeps the four bars tight.
      unawaited(player.setPlaylistMode(PlaylistMode.single));
      unawaited(player.setVolume(70));
      unawaited(player.open(Media('asset:///$_musicAsset')));
      return;
    }
    if (player == null) return;
    unawaited(want ? player.play() : player.pause());
  }

  void _applyNativeMusic(bool want) {
    if (want && !_nativeMusic) {
      if (!_nativeFx) return;
      _nativeMusic = true;
      unawaited(
        _nativeLoad('music', _musicAsset, loop: true, volume: .7).then((ok) {
          if (ok && _nativeMusic && _wantMusic) {
            _nativeCall('resume', 'music');
          }
        }),
      );
      return;
    }
    if (!_nativeMusic) return;
    _nativeCall(want ? 'resume' : 'pause', 'music');
  }

  Future<void> setEnabled(bool on) async {
    _enabled = on;
    _applyMusic();
    await _store?.set(_enabledPref, on);
  }
}
