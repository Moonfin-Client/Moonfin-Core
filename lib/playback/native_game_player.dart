import 'dart:async';

import 'package:flutter/services.dart';

import '../util/core_input_descriptors.dart';
import '../util/platform_detection.dart';
import '../util/native_controller_mapping.dart';
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
/// Why a native game failed to start.
///
/// The platform channel carries these as strings -- every runner already emits
/// them, so the wire format is fixed -- but callers match on the enum instead
/// of retyping the literal.
enum GameLoadError {
  coreMissing('core_missing'),
  loadFailed('load_failed'),
  /// Anything else, including codes a newer runner may add.
  unknown('');

  const GameLoadError(this.code);

  /// The string the platform channel uses.
  final String code;

  static GameLoadError fromCode(String? code) => values.firstWhere(
        (e) => e.code == code,
        orElse: () => GameLoadError.unknown,
      );

  /// The error [e] represents, or [unknown] if it is not a channel failure.
  static GameLoadError of(Object e) =>
      e is PlatformException ? fromCode(e.code) : GameLoadError.unknown;
}

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

  /// Reads [corePath]'s options without loading a game, so a core that will
  /// not start is still configurable. Empty while a session is live, and may
  /// be a subset of [getOptions] -- cores can publish more at load time.
  Future<List<GameCoreOption>> probeOptions(String corePath, String systemDir);
  Future<void> setOption(String id, String value);
  Future<Map<String, String>> getCurrentOptions();
  Future<int> controllerCount();

  /// Every device type the core advertised for Moonfin's routable libretro
  /// ports. The native host separately logs capabilities on additional ports
  /// and types that Moonfin cannot currently expose.
  Future<List<CoreControllerType>> getControllerTypes();

  /// Applies a controller type to one libretro port. [retroDeviceJoypad] is
  /// Auto (Core default), never an inference from advertised ordering.
  Future<void> setControllerType(int port, int deviceType);

  /// Human-readable per-button labels the core advertised through
  /// RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS ("Coin", "Fire", ...). Cores
  /// re-send these after a controller-type change or a restart, so callers
  /// that display them should re-fetch after those events rather than
  /// caching indefinitely.
  Future<CoreInputDescriptors> getInputDescriptors();
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
      throw PlatformException(code: GameLoadError.loadFailed.code);
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

  // Not _invoke: a `start_failed` here means no emulation thread, so swallowing
  // it would leave the user on a frozen screen.
  @override
  Future<void> start() => _control.invokeMethod<void>('start');
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
      await _control.invokeMethod<void>('pulseButton', {
        'index': index,
        'durationMs': durationMs,
      });
    } catch (_) {}
  }

  @override
  Future<void> setInput(int port, int mask) async {
    try {
      await _control.invokeMethod<void>('setInput', {
        'port': port,
        'mask': mask,
      });
    } catch (_) {}
  }

  @override
  Future<List<GameCoreOption>> getOptions() async =>
      _decodeOptions(await _control.invokeMethod<List<dynamic>>('getOptions'));

  @override
  Future<List<GameCoreOption>> probeOptions(
    String corePath,
    String systemDir,
  ) async {
    try {
      return _decodeOptions(
        await _control.invokeMethod<List<dynamic>>('probeOptions', {
          'corePath': corePath,
          'systemDir': systemDir,
        }),
      );
    } on MissingPluginException {
      return const [];  // runner without the probe yet
    } on PlatformException {
      return const [];
    }
  }

  List<GameCoreOption> _decodeOptions(List<dynamic>? raw) {
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
      await _control.invokeMethod<void>('setOption', {
        'id': id,
        'value': value,
      });
    } catch (_) {}
  }

  @override
  Future<Map<String, String>> getCurrentOptions() async {
    try {
      final raw = await _control.invokeMethod<Map<dynamic, dynamic>>(
        'getCurrentOptions',
      );
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

  @override
  Future<List<CoreControllerType>> getControllerTypes() async {
    try {
      final raw = await _control.invokeListMethod<dynamic>(
        'getControllerTypes',
      );
      return (raw ?? const [])
          .whereType<Map>()
          .map(
            (value) =>
                CoreControllerType.fromMap(value.cast<String, dynamic>()),
          )
          .where((type) => type.port >= 0)
          .toList(growable: false);
    } catch (_) {
      return const [];
    }
  }

  // Allowed to throw, like restart(): the caller must not persist a type
  // the core rejected.
  @override
  Future<void> setControllerType(int port, int deviceType) =>
      _control.invokeMethod<void>('setControllerType', {
        'port': port,
        'deviceType': deviceType,
      });

  @override
  Future<CoreInputDescriptors> getInputDescriptors() async {
    try {
      final raw = await _control.invokeListMethod<dynamic>(
        'getInputDescriptors',
      );
      return CoreInputDescriptors.fromChannelPayload(raw);
    } catch (_) {
      return CoreInputDescriptors.empty;
    }
  }

  Future<void> _invoke(String method, [Map<String, dynamic>? arguments]) async {
    try {
      await _control.invokeMethod<void>(method, arguments);
    } catch (_) {}
  }
}
