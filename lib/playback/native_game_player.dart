import 'dart:async';

import 'package:flutter/services.dart';

import '../util/platform_detection.dart';
import 'appletv_game_player.dart';
import 'native_game_player_channel.dart';

/// Result of loading a game into a native libretro session.
class GameLoadInfo {
  const GameLoadInfo({
    required this.textureId,
    required this.width,
    required this.height,
    required this.aspect,
    required this.fps,
    required this.sampleRate,
  });

  final int textureId;
  final int width;
  final int height;
  final double aspect;
  final double fps;
  final double sampleRate;
}

/// One emulator core option (from the core's variables list).
class GameCoreOption {
  const GameCoreOption({
    required this.id,
    required this.label,
    required this.current,
    required this.choices,
  });

  final String id;
  final String label;
  final String current;
  final List<String> choices;
}

/// Platform-neutral bridge to a native libretro session. The core's video
/// arrives as a Flutter texture and controller input stays native, so this
/// only carries lifecycle, saves, options, and UI events.
///
/// Each platform binds it to its own method/event channels. libretro's global
/// C callbacks mean only one session can run per process at a time.
abstract class NativeGamePlayer {
  /// The bridge for the current platform: the bundled tvOS session, or the
  /// shared Android/desktop session.
  factory NativeGamePlayer.create() {
    if (PlatformDetection.isAppleTV) return AppleTvGamePlayer();
    return NativeGamePlayerChannel();
  }

  Stream<Map<String, dynamic>> get events;

  /// Loads a core and ROM. [core] is the libretro core id. [corePath] is the
  /// downloaded core file (Android/desktop) or null when the platform bundles
  /// its cores (tvOS).
  Future<GameLoadInfo> load({
    required String core,
    String? corePath,
    required String romPath,
    required String systemDir,
    required String saveDir,
    required String gameId,
    Map<String, String>? options,
  });

  Future<void> start();
  Future<void> pause();
  Future<void> resume();
  Future<void> restart();
  Future<void> stop();
  Future<Uint8List?> saveState();
  Future<bool> loadState(Uint8List data);
  Future<void> setFastForward(int factor);
  Future<void> pulseButton(int index, {int durationMs = 150});

  /// Sends the current RetroPad button mask for a port. Used by the desktop
  /// keyboard path, where input comes from Flutter rather than a native source.
  Future<void> setInput(int port, int mask);
  Future<List<GameCoreOption>> getOptions();
  Future<void> setOption(String id, String value);
  Future<Map<String, String>> getCurrentOptions();
  Future<int> controllerCount();
}

/// Shared method/event channel implementation. Subclasses only supply the
/// channel names for their platform's native runner.
class MethodChannelGamePlayer implements NativeGamePlayer {
  MethodChannelGamePlayer(String controlChannel, String eventChannel)
      : _control = MethodChannel(controlChannel),
        _events = EventChannel(eventChannel);

  final MethodChannel _control;
  final EventChannel _events;
  Stream<Map<String, dynamic>>? _eventStream;

  @override
  Stream<Map<String, dynamic>> get events {
    return _eventStream ??= _events
        .receiveBroadcastStream()
        .where((event) => event is Map)
        .map((event) => (event as Map).cast<String, dynamic>())
        .asBroadcastStream();
  }

  @override
  Future<GameLoadInfo> load({
    required String core,
    String? corePath,
    required String romPath,
    required String systemDir,
    required String saveDir,
    required String gameId,
    Map<String, String>? options,
  }) async {
    final result = await _control.invokeMethod<Map<dynamic, dynamic>>('load', {
      'core': core,
      'corePath': ?corePath,
      'romPath': romPath,
      'systemDir': systemDir,
      'saveDir': saveDir,
      'gameId': gameId,
      if (options != null && options.isNotEmpty) 'options': options,
    });
    if (result == null) {
      throw PlatformException(code: 'load_failed');
    }
    return GameLoadInfo(
      textureId: (result['textureId'] as num).toInt(),
      width: (result['width'] as num?)?.toInt() ?? 0,
      height: (result['height'] as num?)?.toInt() ?? 0,
      aspect: (result['aspect'] as num?)?.toDouble() ?? (4 / 3),
      fps: (result['fps'] as num?)?.toDouble() ?? 60,
      sampleRate: (result['sampleRate'] as num?)?.toDouble() ?? 44100,
    );
  }

  @override
  Future<void> start() => _invoke('start');
  @override
  Future<void> pause() => _invoke('pause');
  @override
  Future<void> resume() => _invoke('resume');
  // Unlike the other lifecycle calls below, this one is allowed to throw: the
  // native side genuinely raises a `restart_unavailable` PlatformException
  // for cores that can't restart, and the UI (native_game_player_screen's
  // _restart) has a catch clause specifically for that code. Swallowing it
  // here the way _invoke does for fire-and-forget calls would make that
  // branch permanently unreachable.
  @override
  Future<void> restart() => _control.invokeMethod<void>('restart');
  @override
  Future<void> stop() => _invoke('stop');

  @override
  Future<Uint8List?> saveState() async {
    try {
      return await _control.invokeMethod<Uint8List>('saveState');
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> loadState(Uint8List data) async {
    try {
      final ok = await _control.invokeMethod<bool>('loadState', {'data': data});
      return ok ?? false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> setFastForward(int factor) async {
    try {
      await _control.invokeMethod<void>('setFastForward', {'factor': factor});
    } catch (_) {}
  }

  // Briefly holds a RetroPad button (index) so the overlay can send Start/Select.
  @override
  Future<void> pulseButton(int index, {int durationMs = 150}) async {
    try {
      await _control.invokeMethod<void>(
          'pulseButton', {'index': index, 'durationMs': durationMs});
    } catch (_) {}
  }

  @override
  Future<void> setInput(int port, int mask) async {
    try {
      await _control.invokeMethod<void>('setInput', {'port': port, 'mask': mask});
    } catch (_) {}
  }

  @override
  Future<List<GameCoreOption>> getOptions() async {
    final raw = await _control.invokeMethod<List<dynamic>>('getOptions');
    return (raw ?? const [])
        .whereType<Map>()
        .map((m) {
          final map = m.cast<String, dynamic>();
          final choices = (map['choices'] as List<dynamic>? ?? const [])
              .whereType<Map>()
              .map((c) => c['value']?.toString() ?? '')
              .where((v) => v.isNotEmpty)
              .toList(growable: false);
          return GameCoreOption(
            id: map['id']?.toString() ?? '',
            label: map['label']?.toString() ?? '',
            current: map['current']?.toString() ?? '',
            choices: choices,
          );
        })
        .where((o) => o.id.isNotEmpty && o.choices.length > 1)
        .toList(growable: false);
  }

  @override
  Future<void> setOption(String id, String value) async {
    try {
      await _control.invokeMethod<void>('setOption', {'id': id, 'value': value});
    } catch (_) {}
  }

  @override
  Future<Map<String, String>> getCurrentOptions() async {
    try {
      final raw = await _control
          .invokeMethod<Map<dynamic, dynamic>>('getCurrentOptions');
      return (raw ?? const {}).cast<String, String>();
    } catch (_) {
      return const {};
    }
  }

  @override
  Future<int> controllerCount() async {
    try {
      final count = await _control.invokeMethod<int>('controllerCount');
      return count ?? 0;
    } catch (_) {
      return 0;
    }
  }

  Future<void> _invoke(String method) async {
    try {
      await _control.invokeMethod<void>(method);
    } catch (_) {}
  }
}
