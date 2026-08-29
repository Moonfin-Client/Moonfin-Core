import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamepads/gamepads.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/core_download_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../playback/native_game_player.dart';
import '../../../util/game_cores.dart';
import '../../../util/game_storage.dart';
import '../../../util/core_input_descriptors.dart';
import '../../../util/native_controller_mapping.dart';
import '../../../util/native_controller_player_assignments.dart';
import '../../../util/platform_detection.dart';
import '../../../util/settings_save_retry.dart';
import '../../../util/focus/gamepad/android_gamepad_channel.dart';
import '../../../util/focus/gamepad/gamepad_suppressor.dart';
import '../../screensaver/screensaver_controller.dart';
import 'game_playback_ui.dart';
import 'playback_takeover.dart';
import 'native_controller_mapping_screen.dart';
import 'game_audio_owner.dart';

/// Why leaving the controller mapping screen deserves a warning.
enum PlayerOneWarning {
  /// A gamepad is connected, but none of them holds Player 1.
  gamepadNotAssigned,

  /// Player 1's chosen controller is gone and a different gamepad is present.
  assignedControllerMissing,
}

/// Why leaving deserves a warning, or null when it does not.
///
/// The question is not "is Player 1 empty" -- a remote is composed into port 0,
/// so it never is -- but "is a better input going unused". Only a connected
/// gamepad the user could move there earns the interruption. Holding port 0
/// owns Player 1, which covers a keyboard deliberately pinned to it.
@visibleForTesting
PlayerOneWarning? playerOneWarningFor(
  List<NativeControllerDevice> devices, {
  String? pinnedPlayerOneProfileId,
}) {
  if (devices.any((device) => device.port == 0)) return null;
  final hasGamepad = devices.any(
    (device) => device.deviceClass == NativeControllerDeviceClass.gamepad,
  );
  if (!hasGamepad) return null;
  final pinnedIsMissing =
      pinnedPlayerOneProfileId != null &&
      !devices.any((device) => device.id == pinnedPlayerOneProfileId);
  return pinnedIsMissing
      ? PlayerOneWarning.assignedControllerMissing
      : PlayerOneWarning.gamepadNotAssigned;
}

/// The bit [button] drives: its binding, else [fallback] unless something else
/// has claimed that bit.
///
/// Bindings are 1:1, so a default stops firing once another key is bound to the
/// same RetroPad button -- otherwise both would fire it.
@visibleForTesting
int? desktopBitForButton(
  NativeControllerMapping? mapping,
  GamepadButton button,
  int? fallback, {
  String gameId = '',
}) {
  final bound = desktopBoundBit(mapping, button, gameId: gameId);
  if (bound != null) return bound;
  if (fallback == null || mapping == null) return fallback;
  final claimed = mapping
      .bindingsForGame(gameId)
      .values
      .map((b) => 1 << b.retroPadIndex)
      .contains(fallback);
  return claimed ? null : fallback;
}

/// The per-profile binding tables to hand the native side for [gameId].
///
/// The mapping menu resolves through this same call, so what the core plays
/// with and what the menu shows cannot drift. Keycodes only; controller type
/// and stick snap go through their own channels.
@visibleForTesting
String controllerMappingsPayload(
  Map<String, NativeControllerMapping> mappings,
  String gameId,
) => jsonEncode({
  for (final entry in mappings.entries)
    entry.key: {
      for (final binding in entry.value.bindingsForGame(gameId).entries)
        binding.key.toString(): binding.value.retroPadIndex,
    },
});

/// The RetroPad bit a saved binding gives [button], or null when it is unbound.
///
/// Split out so the desktop trigger path is testable: the gamepad stream is a
/// static, and only Windows/Linux read it in Dart.
@visibleForTesting
int? desktopBoundBit(
  NativeControllerMapping? mapping,
  GamepadButton button, {
  String gameId = '',
}) {
  final code = desktopGamepadButtonCodes[button];
  if (mapping == null || code == null) return null;
  final bound = mapping.bindingsForGame(gameId)[code];
  return bound == null ? null : 1 << bound.retroPadIndex;
}

/// Native game player: the libretro core runs in the runner and renders into a
/// Flutter texture, so this screen stays plain Flutter. It downloads and
/// extracts the ROM, plays with a game controller, and syncs the save state on
/// exit. Used on tvOS (bundled cores) and Android/desktop (downloaded cores).
class NativeGamePlayerScreen extends StatefulWidget {
  const NativeGamePlayerScreen({
    super.key,
    required this.libraryId,
    required this.gameId,
    required this.core,
    this.gameName,
    this.startFresh = false,
    @visibleForTesting this.player,
  });

  final String libraryId;
  final String gameId;
  final String core;
  final String? gameName;
  final bool startFresh;

  /// Test-only seam: a fake [NativeGamePlayer] widget tests can drive
  /// through load/event lifecycles without a native runner. Always null in
  /// production, where [NativeGamePlayer.create] picks the platform bridge.
  @visibleForTesting
  final NativeGamePlayer? player;

  @override
  State<NativeGamePlayerScreen> createState() => _NativeGamePlayerScreenState();
}

class _NativeGamePlayerScreenState extends State<NativeGamePlayerScreen>
    with GameAudioOwner, WidgetsBindingObserver {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  late final NativeGamePlayer _player;
  late final CoreDownloadService _cores = CoreDownloadService(
    GetIt.instance<PreferenceStore>(),
  );

  String get _stateKey => gameStateKey(widget.gameId, widget.core);

  String? _error;
  String _status = '';
  double? _progress;
  String? _coreMessage;
  Timer? _coreMessageTimer;
  String? _inputNotice;
  Timer? _inputNoticeTimer;
  int? _textureId;
  double _aspect = 4 / 3;
  int _controllers = 1;

  // Same gate controllersChanged pauses on, so resume can't undo that pause.
  bool get _hasNoUsableInput =>
      _controllers == 0 && !usesKeyboardInput && !usesOnScreenControls;

  // Guards the "playing with the remote" notice so it shows once per
  // session rather than every time the remote's Bluetooth link naps and
  // wakes, which would otherwise re-fire controllersChanged repeatedly.
  bool _notifiedNavigationOnly = false;
  bool _exiting = false;
  // True once the native session has been told to stop. Separate from
  // _exiting so a fatal error can tear the core down without also
  // suppressing the route pop that the user still needs.
  bool _sessionStopped = false;
  RetroArtworkActivityGate? _artworkActivityGate;
  bool _holdsGameplayArtworkBlock = false;
  ScreensaverController? _screensaverController;
  StreamSubscription<Map<String, dynamic>>? _events;

  // In-game overlay, opened with the Menu button and driven by the same
  // controller (mirrored button events) or the Siri remote (remote presses).
  bool _overlayOpen = false;
  bool _settingsOpen = false;
  bool _controllerMappingOpen = false;
  bool _confirmingExit = false;
  bool _confirmingControllerMappingExit = false;
  String _controllerMappingExitLeaveLabel = 'Leave anyway';
  String _controllerMappingExitWarning = '';
  int _selected = 0;
  int _settingsSelected = 0;
  int _fastForward = 1;
  List<GameCoreOption> _options = const [];

  // When set, the overlay shows the value list for this option instead of the
  // settings list, so a choice can be seen and picked rather than cycled blind.
  int? _pickerOption;
  int _pickerSelected = 0;
  bool get _pickerOpen => _pickerOption != null;

  // The overlay lists are driven by an index rather than Flutter focus, so they
  // need to be scrolled to the selection by hand.
  static const double _rowExtent = 58;
  final ScrollController _overlayScroll = ScrollController();
  final ScrollController _settingsScroll = ScrollController();
  final ScrollController _pickerScroll = ScrollController();
  final GlobalKey<NativeControllerMappingScreenState> _controllerMappingKey =
      GlobalKey<NativeControllerMappingScreenState>();
  List<NativeControllerDevice> _controllerDevices = const [];
  Map<String, NativeControllerMapping> _controllerMappings = const {};
  NativeControllerPlayerAssignments _controllerAssignments =
      NativeControllerPlayerAssignments.empty;
  bool _controllerAssignmentsReachable = true;
  Map<int, List<CoreControllerType>> _controllerTypesByPort = const {};
  CoreInputDescriptors _inputDescriptors = CoreInputDescriptors.empty;
  int _controllerRefreshGeneration = 0;
  Future<void> _controllerAssignmentUpdate = Future<void>.value();

  // Controller Start is deferred so it can double as the menu gesture: a quick
  // press reaches the game on release, holding it opens the overlay.
  static const _startHoldDuration = Duration(milliseconds: 1500);
  Timer? _startHoldTimer;
  bool _startHeld = false;
  bool _startHoldConsumed = false;

  // Desktop keyboard: keys map to RetroPad bits and the combined mask is sent
  // to the core.
  int _keyboardMask = 0;
  static final _keyToBit = <LogicalKeyboardKey, int>{
    LogicalKeyboardKey.arrowUp: 1 << 4,
    LogicalKeyboardKey.arrowDown: 1 << 5,
    LogicalKeyboardKey.arrowLeft: 1 << 6,
    LogicalKeyboardKey.arrowRight: 1 << 7,
    LogicalKeyboardKey.keyZ: 1 << 0,
    LogicalKeyboardKey.keyX: 1 << 8,
    LogicalKeyboardKey.keyA: 1 << 1,
    LogicalKeyboardKey.keyS: 1 << 9,
    LogicalKeyboardKey.enter: 1 << 3,
    LogicalKeyboardKey.shiftRight: 1 << 2,
    LogicalKeyboardKey.keyQ: 1 << 10,
    LogicalKeyboardKey.keyW: 1 << 11,
  };

  // Windows and Linux read controllers in Dart through the gamepads package.
  // The other platforms poll them natively in the runner.
  bool get _readsGamepadsInDart =>
      PlatformDetection.isWindows || PlatformDetection.isLinux;
  StreamSubscription<NormalizedGamepadEvent>? _gamepadEvents;
  int _gamepadMask = 0;
  int _stickMask = 0;
  static const _gamepadDeadzone = 0.5;
  static const _gamepadButtonToBit = <GamepadButton, int>{
    GamepadButton.a: 1 << 0,
    GamepadButton.b: 1 << 8,
    GamepadButton.x: 1 << 1,
    GamepadButton.y: 1 << 9,
    GamepadButton.dpadUp: 1 << 4,
    GamepadButton.dpadDown: 1 << 5,
    GamepadButton.dpadLeft: 1 << 6,
    GamepadButton.dpadRight: 1 << 7,
    GamepadButton.leftBumper: 1 << 10,
    GamepadButton.rightBumper: 1 << 11,
    // A pad may report a trigger as a button or as an axis; both resolve
    // through the same binding, and both default to L2/R2.
    GamepadButton.leftTrigger: 1 << 12,
    GamepadButton.rightTrigger: 1 << 13,
    GamepadButton.back: 1 << 2,
    GamepadButton.leftStick: 1 << 14,
    GamepadButton.rightStick: 1 << 15,
  };

  @override
  void initState() {
    super.initState();
    // Without this the emulation thread keeps running after the system Home
    // button. The native side has a pause hook on SurfaceProducer.Callback,
    // but setCallback is a documented no-op for SurfaceTextureSurfaceProducer
    // (see buglog), so that hook never fires and nothing else was listening.
    WidgetsBinding.instance.addObserver(this);
    _player = widget.player ?? NativeGamePlayer.create();
    _acquireGameplayArtworkBlock();
    _acquireScreensaverBlock();
    _enterImmersive();
    // A game owns every key from here; a stale IME binding from the browse
    // screen's search field would otherwise sit in front of the d-pad.
    detachTextInputForPlayback();
    // The pad belongs to the libretro core while a game is running, so UI level
    // pad navigation stays suppressed for the lifetime of this screen.
    GamepadSuppressor.push();
    claimGameAudio();
    _events = _player.events.listen(
      _onEvent,
      onError: (Object error) => _setFatalError('Playback error: $error'),
    );
    if (_readsGamepadsInDart) {
      _gamepadEvents = Gamepads.normalizedEvents.listen(_onGamepadEvent);
    }
    _prepare();
  }

  void _acquireGameplayArtworkBlock() {
    if (_holdsGameplayArtworkBlock ||
        !GetIt.instance.isRegistered<RetroArtworkActivityGate>()) {
      return;
    }
    _artworkActivityGate = GetIt.instance<RetroArtworkActivityGate>();
    _holdsGameplayArtworkBlock = true;
    _artworkActivityGate!.setGameplayActive(true);
    // The gate stops new artwork work but frees none of what is already
    // decoded, and the core about to load allocates its own heap and frame
    // buffers on top of whatever this app is still holding.
    releaseImageMemoryForPlayback();
  }

  void _releaseGameplayArtworkBlock() {
    if (!_holdsGameplayArtworkBlock) return;
    _holdsGameplayArtworkBlock = false;
    _artworkActivityGate?.setGameplayActive(false);
  }

  // The screensaver controller owns the wake lock, so marking playback active
  // does both jobs at once: the display stays awake, and the idle screensaver
  // stays disarmed. Taking the wake lock directly leaves the controller
  // believing the app is idle, and the screensaver then draws itself over a
  // running game -- with no way out, because gameplay keys are consumed
  // natively and never reach the dismiss handler in Flutter's key pipeline.
  void _acquireScreensaverBlock() {
    if (!GetIt.instance.isRegistered<ScreensaverController>()) return;
    _screensaverController = GetIt.instance<ScreensaverController>();
    _screensaverController!.setPlaybackActive(true);
  }

  void _releaseScreensaverBlock() {
    final controller = _screensaverController;
    if (controller == null) return;
    _screensaverController = null;
    controller.setPlaybackActive(false);
  }

  @override
  Future<void> pauseForAudioClaim() => _player.pause();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _releaseGameplayArtworkBlock();
    _releaseScreensaverBlock();
    releaseGameAudio();
    _events?.cancel();
    _gamepadEvents?.cancel();
    _startHoldTimer?.cancel();
    _coreMessageTimer?.cancel();
    _inputNoticeTimer?.cancel();
    _overlayScroll.dispose();
    _settingsScroll.dispose();
    _pickerScroll.dispose();
    GamepadSuppressor.pop();
    // Best-effort restore if disposed without going through an exit path.
    unawaited(_restoreSystemUi());
    // _exit() and _backOut() already await/queue their own stop() before
    // popping the route, which is what tears this screen down in the normal
    // case. Calling stop() again here would be a second, redundant teardown
    // of the single per-process libretro session -- and on the native side, a
    // save-state that lands just as a stop() call arrives can hang forever,
    // so every extra unawaited stop() widens that race. Only fire one here
    // when neither exit path already did.
    if (!_sessionStopped) unawaited(_player.stop());
    super.dispose();
  }

  void _onEvent(Map<String, dynamic> event) {
    switch (event['event']) {
      case 'videoGeometry':
        final aspect = (event['aspect'] as num?)?.toDouble();
        if (aspect != null && aspect > 0 && mounted) {
          setState(() => _aspect = aspect);
        }
      case 'controllersChanged':
        final count = (event['count'] as num?)?.toInt() ?? 0;
        // Defaults to false so an older native build that never sends this
        // key behaves exactly as before: no notice, same blocking gate.
        final navigationOnly = event['navigationOnly'] as bool? ?? false;
        if (mounted) setState(() => _controllers = count);
        // The native registry can change independently of the overlay. Refresh
        // profile metadata as a best-effort snapshot; gameplay never waits on
        // this Dart-side work.
        unawaited(_refreshControllerMappings());
        // Keyboard and touch platforms play fine without a controller, so
        // losing the last one should not pause the game there.
        if (!usesKeyboardInput && !usesOnScreenControls) {
          if (_hasNoUsableInput) {
            _player.pause();
          } else if (!_overlayOpen) {
            // The overlay owns the visible pause, so a device connecting or
            // waking while it is open must not start the game moving
            // underneath it. Closing the overlay resumes.
            _player.resume();
          }
        }
        // Same platform gate as the pause above: the notice explains why the
        // game is playable with no gamepad, which only needs saying where
        // there is no keyboard or on-screen pad to answer it already. The
        // native side ships to Android phones too, where an attached
        // Bluetooth keyboard would otherwise report navigationOnly.
        if (navigationOnly &&
            !_notifiedNavigationOnly &&
            !usesKeyboardInput &&
            !usesOnScreenControls) {
          _notifiedNavigationOnly = true;
          _showInputNotice(
            'No game controller connected — playing with the remote.',
          );
        }
      case 'menuPressed':
        _toggleOverlay();
      case 'remotePress':
        _onRemotePress(event['key']?.toString());
      case 'button':
        final index = (event['index'] as num?)?.toInt() ?? -1;
        final pressed = event['pressed'] as bool? ?? false;
        if (index == 3 &&
            !PlatformDetection.isAppleTV &&
            !_controllerMappingOpen) {
          _onStartButton(pressed);
        } else if (_overlayOpen) {
          // The mapping screen is unmounted while confirming; fall through to _nav.
          if (_controllerMappingOpen && !_confirmingControllerMappingExit) {
            // Both edges: Controller Test needs the release to cancel its
            // exit hold. handleButton drops the releases it does not want.
            _controllerMappingKey.currentState?.handleButton(index, pressed);
          } else if (pressed) {
            _nav(_navForButton(index));
          }
        }
      case 'coreMessage':
        _showCoreMessage(event['message']?.toString());
      case 'error':
        _setFatalError(event['message']?.toString() ?? 'Error');
    }
  }

  // Shared by the in-band 'error' event and the event stream's own onError:
  // an unrecoverable native failure. When a texture is already live, this
  // stops the core and drops it so the error message isn't shown floating
  // over a frozen game. Guarded against _sessionStopped so it never races the
  // stop() that the normal exit path already performs.
  void _setFatalError(String message) {
    if (!mounted) return;
    _releaseGameplayArtworkBlock();
    final hadTexture = _textureId != null && !_sessionStopped;
    setState(() {
      _error = message;
      if (hadTexture) _textureId = null;
    });
    if (hadTexture) {
      // Mark the session as torn down so dispose()'s stop() guard and any
      // later _exit()/_backOut() do not stop() a second time. The route pop
      // stays available: _exiting is deliberately left alone here, so the
      // user is never stranded on the error screen behind a dead back button.
      _sessionStopped = true;
      unawaited(_player.stop());
    }
  }

  void _showTransientMessage(String message) {
    if (!mounted) return;
    showGamePlaybackMessage(context, message);
  }

  // Cores warn about things like missing system files while they run, so show
  // the latest one briefly over the game rather than dropping it.
  void _showCoreMessage(String? message) {
    if (message == null || message.isEmpty || !mounted) return;
    _coreMessageTimer?.cancel();
    setState(() => _coreMessage = message);
    _coreMessageTimer = Timer(const Duration(seconds: 6), () {
      if (mounted) setState(() => _coreMessage = null);
    });
  }

  // Kept separate from _coreMessage: the core emits its own messages at
  // session start and would otherwise clobber this notice.
  void _showInputNotice(String? message) {
    if (message == null || message.isEmpty || !mounted) return;
    _inputNoticeTimer?.cancel();
    setState(() => _inputNotice = message);
    // Shorter than a core message's six seconds: this one says the same thing
    // every launch, so it only has to register, not be read.
    _inputNoticeTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _inputNotice = null);
    });
  }

  // Mirrored RetroPad indices: 0=confirm (bottom face), 8=cancel (east face),
  // 4=up, 5=down, 6=left, 7=right.
  String? _navForButton(int index) => const {
    4: 'up',
    5: 'down',
    6: 'left',
    7: 'right',
    0: 'confirm',
    8: 'cancel',
  }[index];

  // Controller Start: a quick press is pulsed to the game on release, holding
  // past the threshold opens the overlay, and while the overlay is open a press
  // just closes it. tvOS keeps its native Start injection and menu button, so
  // this tracker never runs there.
  void _onStartButton(bool pressed) {
    if (pressed) {
      if (_overlayOpen) {
        _startHoldConsumed = true;
        _toggleOverlay();
        return;
      }
      _startHoldConsumed = false;
      _startHoldTimer?.cancel();
      _startHoldTimer = Timer(_startHoldDuration, () {
        _startHoldTimer = null;
        _startHoldConsumed = true;
        if (mounted) {
          setState(() => _startHeld = false);
          _toggleOverlay();
        }
      });
      if (mounted) setState(() => _startHeld = true);
    } else {
      _startHoldTimer?.cancel();
      _startHoldTimer = null;
      final consumed = _startHoldConsumed;
      _startHoldConsumed = false;
      if (mounted && _startHeld) setState(() => _startHeld = false);
      if (!consumed) _player.pulseButton(3);
    }
  }

  void _sendMask() {
    _player.setInput(0, _keyboardMask | _touchMask | _gamepadMask | _stickMask);
  }

  void _onGamepadEvent(NormalizedGamepadEvent event) {
    final button = event.button;
    if (button != null) {
      final pressed = event.value != 0;
      if (button == GamepadButton.start && !_controllerMappingOpen) {
        _onStartButton(pressed);
        return;
      }
      if (_overlayOpen) {
        // The game is paused under the overlay, so drop any held buttons and
        // drive the menu instead.
        if (_gamepadMask != 0 || _stickMask != 0) {
          _gamepadMask = 0;
          _stickMask = 0;
          _sendMask();
        }
        // The remapping panel is driven by RetroPad indices from the native
        // 'button' event stream, which only Android and the Apple runners
        // emit -- desktop runners consume setInput and send nothing back. So
        // the panel has to be fed from here, or its rows would sit inert
        // while the d-pad quietly moved the pause menu underneath it.
        //
        // No guard against the press that is being captured for a binding:
        // handleButton already ignores everything while _capturing is set,
        // which is what keeps the button the user is binding from also
        // activating the row they are binding it to.
        // Same gate as the 'button' handler above.
        if (_controllerMappingOpen && !_confirmingControllerMappingExit) {
          // Both edges, for the same reason as the native route.
          final index = _retroPadIndexForGamepad(button);
          if (index != null) {
            _controllerMappingKey.currentState?.handleButton(index, pressed);
          }
        } else if (pressed) {
          _nav(_navActionForGamepad(button));
        }
        return;
      }
      final bit = _bitForGamepadButton(event.gamepadId, button);
      if (bit == null) return;
      _gamepadMask = pressed ? _gamepadMask | bit : _gamepadMask & ~bit;
      _sendMask();
      return;
    }
    final axis = event.axis;
    if (axis == null || _overlayOpen) return;
    switch (axis) {
      case GamepadAxis.leftStickX:
        _setStickBits(1 << 6, 1 << 7, event.value);
      case GamepadAxis.leftStickY:
        _setStickBits(1 << 5, 1 << 4, event.value);
      case GamepadAxis.leftTrigger:
        _setTriggerBit(
          event.gamepadId,
          GamepadButton.leftTrigger,
          1 << 12,
          event.value,
        );
      case GamepadAxis.rightTrigger:
        _setTriggerBit(
          event.gamepadId,
          GamepadButton.rightTrigger,
          1 << 13,
          event.value,
        );
      default:
        return;
    }
    _sendMask();
  }

  /// The RetroPad bit a physical button should set, honouring any custom
  /// mapping saved for the controller that produced it.
  ///
  /// A button the user has not rebound keeps [_gamepadButtonToBit]'s default,
  /// unless something else is now bound to that RetroPad button: bindings are
  /// 1:1, so bind Y to RetroPad A and the physical A stops sending A. Matches
  /// Android's table and EmulatorJS, which clears duplicates the same way.
  int? _bitForGamepadButton(String gamepadId, GamepadButton button) {
    final mapping = _controllerMappings[desktopControllerDeviceId(gamepadId)];
    return desktopBitForButton(
      mapping,
      button,
      _gamepadButtonToBit[button],
      gameId: widget.gameId,
    );
  }

  // Negative stick values map to the first bit, positive to the second. The Y
  // axis reports up as positive, so up is the positive bit there.
  void _setStickBits(int negativeBit, int positiveBit, double value) {
    _stickMask &= ~(negativeBit | positiveBit);
    if (value <= -_gamepadDeadzone) {
      _stickMask |= negativeBit;
    } else if (value >= _gamepadDeadzone) {
      _stickMask |= positiveBit;
    }
  }

  /// Sets whichever RetroPad bit an analog trigger is bound to.
  ///
  /// Triggers arrive as axes here but are BOUND as buttons, so a pad reporting
  /// a trigger either way honours the one binding. The bit last driven is
  /// remembered so rebinding a held trigger releases the bit it used to drive
  /// instead of stranding it.
  void _setTriggerBit(
    String gamepadId,
    GamepadButton trigger,
    int fallbackBit,
    double value,
  ) {
    final mapping = _controllerMappings[desktopControllerDeviceId(gamepadId)];
    final bit =
        desktopBoundBit(mapping, trigger, gameId: widget.gameId) ?? fallbackBit;
    // Keyed by pad too: two controllers resolve the same trigger to different
    // bits, and a shared key let one clear the bit the other was holding.
    final key = (gamepadId, trigger);
    final previous = _triggerBits[key];
    if (previous != null && previous != bit) _stickMask &= ~previous;
    _triggerBits[key] = bit;
    _stickMask = value >= _gamepadDeadzone
        ? _stickMask | bit
        : _stickMask & ~bit;
  }

  /// The bit each pad's analog trigger currently drives; see [_setTriggerBit].
  final Map<(String, GamepadButton), int> _triggerBits =
      <(String, GamepadButton), int>{};

  /// The RetroPad index [NativeControllerMappingScreen.handleButton] expects
  /// for a physical button. Deliberately the raw button rather than the
  /// remapped one: the panel is navigated with the pad as it physically is,
  /// otherwise a half-finished remap could leave the user unable to reach the
  /// row that would fix it.
  int? _retroPadIndexForGamepad(GamepadButton button) => switch (button) {
    GamepadButton.dpadUp => 4,
    GamepadButton.dpadDown => 5,
    GamepadButton.dpadLeft => 6,
    GamepadButton.dpadRight => 7,
    GamepadButton.a => 0,
    GamepadButton.b => 8,
    _ => null,
  };

  String? _navActionForGamepad(GamepadButton button) => switch (button) {
    GamepadButton.dpadUp => 'up',
    GamepadButton.dpadDown => 'down',
    GamepadButton.dpadLeft => 'left',
    GamepadButton.dpadRight => 'right',
    GamepadButton.a => 'confirm',
    GamepadButton.b => 'cancel',
    _ => null,
  };

  void _onRemotePress(String? key) => _nav(key == 'select' ? 'confirm' : key);

  // On-screen touch gamepad: each button toggles its RetroPad bit and the mask
  // is sent to the core. The buttons have no pressed state to redraw, so this
  // skips setState.
  int _touchMask = 0;
  void _touchPress(int bit, bool down) {
    _touchMask = down ? _touchMask | bit : _touchMask & ~bit;
    _sendMask();
  }

  // Desktop keyboard: Escape or Backspace opens the overlay, arrows and Enter
  // drive it while open, and everything else feeds the RetroPad mask to the
  // core.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.escape ||
            event.logicalKey == LogicalKeyboardKey.backspace)) {
      _toggleOverlay();
      return KeyEventResult.handled;
    }
    if (_overlayOpen && event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          _moveSelection(-1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowDown:
          _moveSelection(1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          _changeValue(-1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
          _changeValue(1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.space:
          _confirm();
          return KeyEventResult.handled;
      }
    }
    // Only the platforms that actually play with a keyboard turn keys into
    // RetroPad bits. Android reads controllers natively and forwards them over
    // the gamepad channel, so mapping them here as well would send every press
    // to the core twice.
    if (!usesKeyboardInput) return KeyEventResult.ignored;
    final bit = _keyToBit[event.logicalKey];
    if (bit == null) return KeyEventResult.ignored;
    if (event is KeyDownEvent) {
      _keyboardMask |= bit;
    } else if (event is KeyUpEvent) {
      _keyboardMask &= ~bit;
    } else {
      return KeyEventResult.ignored;
    }
    _sendMask();
    return KeyEventResult.handled;
  }

  // Menu opens or closes the overlay. The rest only act while it is open.
  void _nav(String? action) {
    switch (action) {
      case 'menu':
        _toggleOverlay();
      case 'up':
        if (_overlayOpen) _moveSelection(-1);
      case 'down':
        if (_overlayOpen) _moveSelection(1);
      case 'left':
        if (_overlayOpen) _changeValue(-1);
      case 'right':
        if (_overlayOpen) _changeValue(1);
      case 'confirm':
        if (_overlayOpen) _confirm();
      case 'cancel':
        if (_overlayOpen) _overlayBack();
    }
  }

  // Steps back one overlay level: the value picker returns to the settings
  // list, the settings list to the pause menu, and the pause menu resumes.
  void _overlayBack() {
    // Back out of the confirmation before any other level, so a stray Back
    // never falls through to something that ends the session.
    if (_confirmingExit) {
      _cancelExitConfirmation();
    } else if (_confirmingControllerMappingExit) {
      _cancelControllerMappingExitConfirmation();
    } else if (_pickerOpen) {
      setState(() => _pickerOption = null);
    } else if (_settingsOpen) {
      setState(() => _settingsOpen = false);
    } else if (_controllerMappingOpen) {
      // The mapping screen has its own levels (armed capture, player and
      // controller-type pickers, copy confirmation). Let it step back through
      // them first; closing outright would skip the list the user came from.
      if (_controllerMappingKey.currentState?.handleBack() == true) return;
      unawaited(_requestControllerMappingClose());
    } else {
      _closeOverlay();
    }
  }

  Future<void> _prepare() async {
    final games = _client.gamesApi;
    if (games == null) {
      _releaseGameplayArtworkBlock();
      setState(() => _error = 'This server does not support games.');
      return;
    }
    final coreId = libretroCoreId(widget.core);
    if (coreId == null || !nativeCanPlay(widget.core)) {
      _releaseGameplayArtworkBlock();
      setState(() => _error = 'This system is not supported yet.');
      return;
    }
    try {
      // Isolated from the outer try below: this reads persisted, user-editable
      // JSON, and a corrupt mapping must degrade to default controller
      // mappings rather than turn a cosmetic remap problem into a hard
      // "Could not start this game" failure for the whole screen.
      try {
        await _loadControllerMappings(games);
      } catch (e) {
        debugPrint(
          '[NativeGamePlayerScreen] Ignoring bad controller mapping data: $e',
        );
        _controllerDevices = const [];
        _controllerMappings = const {};
      }

      // tvOS and macOS bundle their cores, so the native side loads them from
      // the app. Android, Windows, and Linux load a downloaded file.
      String? corePath;
      if (!bundlesGameCores) {
        if (!supportsCoreDownloads) {
          _releaseGameplayArtworkBlock();
          if (mounted) {
            setState(
              () => _error = 'This system is not supported on this device.',
            );
          }
          return;
        }
        corePath = await installedCorePath(coreId);
        if (corePath == null) {
          _releaseGameplayArtworkBlock();
          if (mounted) {
            setState(
              () => _error =
                  'The core for this system is not installed. Add it in Settings > Playback > Emulator Cores.',
            );
          }
          return;
        }
      }

      final detail = await games.getGame(widget.libraryId, widget.gameId);
      if (detail == null || !mounted) {
        _releaseGameplayArtworkBlock();
        if (mounted) setState(() => _error = 'Game not found.');
        return;
      }

      await GameStorage.migrateOffCache();
      if (!await _installSupportFiles(coreId)) return;
      final systemDir = await GameStorage.systemDir();
      final saveDir = await GameStorage.saveDir();
      final cacheDir = await GameStorage.romDir(
        widget.libraryId,
        widget.gameId,
      );
      await GameStorage.writeMeta(cacheDir, detail.title, detail.system);
      // Five awaited IO calls happened since the last mounted check above, and
      // only one native libretro session can exist per process -- so backing
      // out mid-extraction must not let a later step start a session on a
      // torn-down screen.
      if (!mounted) return;

      setState(() => _status = 'Downloading...');
      // The server names these files; a traversal or absolute path here means
      // the server is hostile or compromised. Reject rather than sanitize
      // (same decision as the native host's lh_load game_id guard) and
      // surface it as a visible error instead of silently writing wherever
      // the name points.
      final String romFileName;
      try {
        romFileName = sanitizeDownloadFileName(detail.fileName);
      } on FormatException catch (e) {
        _setFatalError(
          'This game has an invalid file name and cannot be downloaded. (${e.message})',
        );
        return;
      }
      final romFile = File(p.join(cacheDir.path, romFileName));
      if (!await romFile.exists()) {
        await games.downloadRom(
          widget.libraryId,
          widget.gameId,
          romFile.path,
          onProgress: (received, total) {
            if (mounted && total > 0) {
              setState(() => _progress = received / total);
            }
          },
        );
      }

      for (final bios in detail.bios) {
        final String biosFileName;
        try {
          biosFileName = sanitizeDownloadFileName(bios.fileName);
        } on FormatException catch (e) {
          _setFatalError(
            'A required BIOS file has an invalid name and cannot be downloaded. (${e.message})',
          );
          return;
        }
        final biosFile = File(p.join(systemDir.path, biosFileName));
        if (!await biosFile.exists()) {
          await games.downloadBios(widget.libraryId, bios.id, biosFile.path);
        }
      }
      if (!mounted) return;

      setState(() {
        _status = 'Starting...';
        _progress = null;
      });
      final contentPath = await _extractIfArchive(
        romFile,
        cacheDir,
        preserveArchive: isArcadeFamilyCore(widget.core),
      );
      if (contentPath == null) {
        _releaseGameplayArtworkBlock();
        // Extraction may already have reported something more specific than this.
        if (mounted && _error == null) {
          setState(() => _error = 'This archive format is not supported.');
        }
        return;
      }

      Map<String, String>? settingsJson;
      try {
        settingsJson = await _loadSettings(games, coreId);
        _coreOptionsReadable = true;
      } catch (_) {
        // Unreachable is not the same as absent. Starting on defaults is
        // recoverable; persisting those defaults over settings we never
        // managed to read is not, so writes stay disabled for this session.
        _coreOptionsReadable = false;
      }
      // Last check before starting the one-per-process native session: if the
      // screen was unmounted while settings were loading, starting it now
      // would leave a session running with nothing left to tear it down.
      if (!mounted) return;
      final info = await _player.load(
        core: coreId,
        corePath: corePath,
        romPath: contentPath,
        systemDir: systemDir.path,
        saveDir: saveDir.path,
        gameId: widget.gameId,
        options: settingsJson,
      );
      if (!mounted) {
        await _player.stop();
        return;
      }
      _aspect = info.aspect > 0 ? info.aspect : 4 / 3;
      _controllers = await _player.controllerCount();
      _notifiedNavigationOnly = false;
      await _loadControllerTypes(coreId, games);

      await _player.start();
      if (!widget.startFresh) {
        final save = await loadGameStateWithMigration(
          games,
          widget.gameId,
          widget.core,
        );
        if (save != null && save.isNotEmpty) {
          await _player.loadState(Uint8List.fromList(save));
        }
      }
      if (mounted) setState(() => _textureId = info.textureId);
    } catch (e) {
      _releaseGameplayArtworkBlock();
      // load() may have succeeded before this threw, leaving the host, audio
      // thread and texture allocated behind the error screen. stop() is
      // idempotent, so calling it when nothing loaded is safe.
      await _player.stop();
      if (mounted) {
        setState(() => _error = _startFailureMessage(e));
      }
    }
  }

  /// Makes sure the core's support files are in the system directory, fetching
  /// them if they are missing. PSP is the case that matters, since the core
  /// boots straight into a failure without them. Returns false once the error
  /// is on screen.
  Future<bool> _installSupportFiles(String coreId) async {
    if (await coreSupportFilesInstalled(coreId)) return true;
    if (!mounted) return false;
    setState(() {
      _status = 'Installing system files...';
      _progress = 0;
    });
    try {
      await _cores.installSupportFiles(
        coreId,
        onProgress: (p) {
          if (mounted) setState(() => _progress = p);
        },
      );
    } catch (_) {
      if (mounted) {
        setState(
          () => _error =
              'The system files for this core could not be installed. Check your connection and try again.',
        );
      }
      return false;
    }
    if (mounted) setState(() => _progress = null);
    return mounted;
  }

  /// The message shown when the native session fails to start.
  ///
  /// `load_failed` is deliberately not reported as an error condition the user
  /// should try to interpret. It is the single code every native load failure
  /// collapses into -- the core rejecting the ROM, and the core demanding a
  /// renderer this host does not provide, arrive here identically -- so naming
  /// a cause would be a guess. What every one of those cases has in common is
  /// that the same game is very likely playable through the other backend, so
  /// the message points at the control that switches it. The wording matches
  /// the game detail screen's own labels so the user is looking for a string
  /// that actually appears on screen.
  ///
  /// The most common trigger today is a hardware-rendered core: the host
  /// answers RETRO_ENVIRONMENT_SET_HW_RENDER with false, and cores with no
  /// software renderer (e.g. Nintendo 64's mupen64plus_next) fail their
  /// content load outright.
  String _startFailureMessage(Object error) {
    if (error is PlatformException) {
      switch (error.code) {
        case 'core_missing':
          return 'The core for this system is not included in this build.';
        case 'load_failed':
          return 'This game cannot be played with the native core.\n'
              'Open the game\'s details screen and switch it to '
              '"EmulatorJS (WebView)".\nYou may also try resetting this core\'s settings in '
              'Settings > Playback > Emulator Cores and try again.';
      }
    }
    return 'Could not start this game. ($error)';
  }

  /// Returns the playable content path: the file itself, the ROM extracted
  /// from a .zip next to it, or (when [preserveArchive] is true) the zip
  /// path unmodified. Arcade cores (FBNeo/MAME) identify a machine by the
  /// zip's own name and expect every chip inside it, so extracting "the
  /// largest file" like every other system does would destroy the set.
  /// 7z is not readable here yet.
  ///
  /// The file's signature decides, not its name: a server unpacks a single-ROM
  /// archive itself and sends the raw ROM under the archive's own name, so a
  /// download called .zip is often a plain ROM already.
  Future<String?> _extractIfArchive(
    File file,
    Directory cacheDir, {
    bool preserveArchive = false,
  }) async {
    if (preserveArchive) return file.path;

    final signature = await _readSignature(file);
    if (_is7zSignature(signature)) return null;
    if (!_isZipSignature(signature)) return file.path;

    final marker = File('${cacheDir.path}/.extracted');
    if (await marker.exists()) {
      final existing = await marker.readAsString();
      if (existing.isNotEmpty && await File(existing).exists()) {
        return existing;
      }
    }

    final input = InputFileStream(file.path);
    try {
      final archive = ZipDecoder().decodeStream(input);
      ArchiveFile? best;
      for (final entry in archive) {
        if (!entry.isFile) continue;
        if (best == null || entry.size > best.size) best = entry;
      }
      if (best == null) return null;
      // The archive came from the server, so its entry names are as untrusted
      // as the download file names. Split on either separator before taking the
      // last segment: the zip format specifies forward slashes, but nothing
      // enforces it, and a hostile archive can use backslashes precisely to
      // slip past a '/'-only split on Windows. Whatever survives still has to
      // pass the same single-segment rejection.
      final String entryName;
      try {
        entryName = sanitizeDownloadFileName(
          best.name.split(RegExp(r'[/\\]')).last,
        );
      } on FormatException {
        _setFatalError(
          'The downloaded archive contains an unusable file name.',
        );
        return null;
      }
      final outPath = p.join(cacheDir.path, entryName);
      final output = OutputFileStream(outPath);
      best.writeContent(output);
      await output.close();
      await marker.writeAsString(outPath);
      return outPath;
    } finally {
      await input.close();
    }
  }

  static Future<List<int>> _readSignature(File file) async {
    final handle = await file.open();
    try {
      return await handle.read(6);
    } finally {
      await handle.close();
    }
  }

  static bool _isZipSignature(List<int> s) =>
      s.length >= 4 &&
      s[0] == 0x50 &&
      s[1] == 0x4B &&
      s[2] == 0x03 &&
      s[3] == 0x04;

  static bool _is7zSignature(List<int> s) =>
      s.length >= 6 &&
      s[0] == 0x37 &&
      s[1] == 0x7A &&
      s[2] == 0xBC &&
      s[3] == 0xAF &&
      s[4] == 0x27 &&
      s[5] == 0x1C;

  /// This game's emulator settings for this device, falling back through the
  /// documents written before each narrowing of scope: per game, then the
  /// core-wide one.
  ///
  /// Older documents are inherited in memory but never written back to. The
  /// core-wide one holds every game's options for this core, so copying it
  /// forward would carry another game's dipswitches along. The first write
  /// stores this game's options under the current id, which is the migration.
  Future<Map<String, String>?> _loadSettings(
    GamesApi games,
    String coreId,
  ) async {
    final own = await _readSettings(games, _gameOptionsSaveId(coreId));
    if (own != null) return own;
    final perGame = await _readSettings(
      games,
      _legacyGameOptionsSaveId(coreId),
    );
    if (perGame != null) return perGame;
    return _readSettings(games, _legacyCoreOptionsSaveId(coreId));
  }

  Future<Map<String, String>?> _readSettings(
    GamesApi games,
    String saveId,
  ) async {
    final blob = await games.getSave(saveId, kind: 'settings');
    if (blob == null || blob.isEmpty) return null;
    final text = String.fromCharCodes(blob);
    final map = <String, String>{};
    for (final line in text.split('\n')) {
      final eq = line.indexOf('=');
      if (eq > 0) {
        map[line.substring(0, eq)] = line.substring(eq + 1);
      }
    }
    return map.isEmpty ? null : map;
  }

  // Exit is the one destructive action in this menu, and it is reachable by a
  // single press from several input paths. Confirming it as a replacement
  // action list rather than a dialog keeps it navigable by remote, gamepad and
  // keyboard alike, because selection, wrapping and scrolling are all driven
  // off this list. "Keep playing" is first so the default highlight is the
  // safe choice.
  List<_OverlayAction> _actions() {
    if (_confirmingExit) {
      return [
        _OverlayAction('Keep playing', _cancelExitConfirmation),
        _OverlayAction('Save & exit', _saveAndExit),
        _OverlayAction('Exit game', _exit, danger: true),
      ];
    }
    if (_confirmingControllerMappingExit) {
      return [
        _OverlayAction(
          'Keep editing',
          _cancelControllerMappingExitConfirmation,
        ),
        _OverlayAction(
          _controllerMappingExitLeaveLabel,
          _closeControllerMapping,
          danger: true,
        ),
      ];
    }
    return _mainActions();
  }

  List<_OverlayAction> _mainActions() => [
    _OverlayAction('Resume', _closeOverlay),
    _OverlayAction('Press Start', () => _pressButton(3)),
    _OverlayAction('Press Select', () => _pressButton(2)),
    _OverlayAction('Save state', _saveState),
    _OverlayAction('Load state', _loadState),
    _OverlayAction(
      _fastForward > 1 ? 'Fast-forward: On' : 'Fast-forward: Off',
      _toggleFastForward,
    ),
    _OverlayAction('Restart', _restart),
    // Hidden when nothing was found to remap, which covers both the Apple
    // platforms (no remapping at all) and a desktop session with no controller
    // plugged in, where the panel would open onto an empty list.
    if (_controllerDevices.isNotEmpty)
      _OverlayAction('Controller mapping', _openControllerMapping),
    _OverlayAction('Emulator settings', _openSettings),
    _OverlayAction('Reset emulator settings', _resetEmulatorSettings),
    _OverlayAction('Exit', _requestExit),
  ];

  /// Asks before ending a running session.
  ///
  /// Only while a game is actually running: on the loading or error screen
  /// there is nothing to lose, and making the user confirm their way off a
  /// failure message would be obstructive.
  void _requestExit() {
    if (_textureId == null || _error != null) {
      _exit();
      return;
    }
    setState(() {
      _confirmingExit = true;
      _selected = 0;
    });
  }

  void _cancelExitConfirmation() {
    setState(() {
      _confirmingExit = false;
      _selected = 0;
    });
  }

  /// Stops emulating while the app is in the background, and picks up again on
  /// return.
  ///
  /// Deliberately does NOT save state: a save is destructive and belongs to a
  /// choice the user made, not to a Home button press.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Nothing is running before the texture exists, and resuming then would
    // start a session the load path has not finished setting up.
    if (_textureId == null || _exiting) return;
    switch (state) {
      case AppLifecycleState.resumed:
        // The overlay is the one pause the user can see, so it decides
        // whether coming back to the app should start the game moving again.
        if (!_overlayOpen && !_hasNoUsableInput) _player.resume();
      case AppLifecycleState.inactive:
        // Transient and common (a system dialog, the volume panel). Pausing
        // here would flicker the game for events the user never left for.
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        _player.pause();
    }
  }

  void _toggleOverlay() {
    if (_textureId == null) return;
    if (_overlayOpen) {
      _overlayBack();
    } else {
      _player.pause();
      setState(() {
        _overlayOpen = true;
        _selected = 0;
      });
      unawaited(AndroidGamepadChannel.setOverlayOpen(true));
    }
  }

  void _closeOverlay() {
    setState(() {
      _overlayOpen = false;
      _settingsOpen = false;
      _controllerMappingOpen = false;
      _confirmingExit = false;
      _confirmingControllerMappingExit = false;
      _controllerMappingExitWarning = '';
      _pickerOption = null;
    });
    unawaited(AndroidGamepadChannel.setOverlayOpen(false));
    _player.resume();
  }

  void _moveSelection(int delta) {
    final int count;
    final int current;
    final ScrollController controller;
    if (_pickerOpen) {
      count = _options[_pickerOption!].choices.length;
      current = _pickerSelected;
      controller = _pickerScroll;
    } else if (_settingsOpen) {
      count = _options.length;
      current = _settingsSelected;
      controller = _settingsScroll;
    } else {
      count = _actions().length;
      current = _selected;
      controller = _overlayScroll;
    }
    if (count == 0) return;
    final wrapped = wrapGamePlaybackMenuSelection(current, delta, count);
    setState(() {
      if (_pickerOpen) {
        _pickerSelected = wrapped;
      } else if (_settingsOpen) {
        _settingsSelected = wrapped;
      } else {
        _selected = wrapped;
      }
    });
    ensureGamePlaybackMenuSelectionVisible(
      controller,
      wrapped,
      rowExtent: _rowExtent,
    );
  }

  void _confirm() {
    if (_pickerOpen) {
      _applyPicker();
    } else if (_settingsOpen) {
      if (_options.isNotEmpty && _settingsSelected < _options.length) {
        _openPicker(_settingsSelected);
      }
    } else {
      final actions = _actions();
      if (_selected < actions.length) actions[_selected].onSelect();
    }
  }

  // Left and right still cycle the highlighted setting in place, a quick tweak
  // for anyone on a d-pad who doesn't want the full picker.
  void _changeValue(int delta) {
    if (!_settingsOpen || _pickerOpen || _options.isEmpty) return;
    final opt = _options[_settingsSelected];
    if (opt.choices.length < 2) return;
    var idx = opt.choices.indexOf(opt.current) + delta;
    idx %= opt.choices.length;
    if (idx < 0) idx += opt.choices.length;
    _applyOption(_settingsSelected, opt.choices[idx]);
  }

  // Opens the value list for a setting so its choices can be seen and picked.
  void _openPicker(int optionIndex) {
    final opt = _options[optionIndex];
    if (opt.choices.length < 2) return;
    setState(() {
      _pickerOption = optionIndex;
      _pickerSelected = opt.choices
          .indexOf(opt.current)
          .clamp(0, opt.choices.length - 1);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _pickerOpen) {
        ensureGamePlaybackMenuSelectionVisible(
          _pickerScroll,
          _pickerSelected,
          rowExtent: _rowExtent,
        );
      }
    });
  }

  void _applyPicker() {
    final index = _pickerOption;
    if (index == null) return;
    _applyOption(index, _options[index].choices[_pickerSelected]);
    setState(() => _pickerOption = null);
  }

  void _applyOption(int optionIndex, String value) {
    final opt = _options[optionIndex];
    _player.setOption(opt.id, value);
    setState(() {
      _options[optionIndex] = GameCoreOption(
        id: opt.id,
        label: opt.label,
        current: value,
        choices: opt.choices,
      );
    });
    // Persist on every change so settings survive leaving by any route, not
    // only the menu Exit. Leaving through the system Home button never reaches
    // _exit.
    unawaited(_persistOptions());
  }

  /// Emulator settings are stored per game, not per core.
  ///
  /// Cores publish per-game options -- FBNeo's dipswitches are per driver -- so
  /// a single document per core cannot hold two games' settings at once.
  /// Confirmed on device: BurgerTime's lives reverted after merely loading and
  /// exiting Spy Hunter, with no setting changed there, because that exit
  /// rewrote the shared document from Spy Hunter's options alone. Per-game ids
  /// remove the sharing rather than arbitrate it.
  /// Emulator settings are per game AND per device.
  ///
  /// Per device because they are not all portable: a colour depth or frame
  /// skip that is right on the Shield can be wrong on weaker hardware, and a
  /// setting that follows the user onto a slower box makes that box worse.
  /// Game-configuration options (dipswitches) would be safe to share, but
  /// libretro gives no way to tell the two classes apart, so the whole
  /// document stays local rather than guessing wrong in the harmful direction.
  String _gameOptionsSaveId(String coreId) {
    final deviceId = _client.deviceInfo.id;
    final base = 'moonfin-native-$coreId-${widget.gameId}';
    return deviceId.isEmpty ? base : '$base-$deviceId';
  }

  /// The pre-per-device id. Read as a fallback so settings saved before this
  /// split still apply; never written to.
  String _legacyGameOptionsSaveId(String coreId) =>
      'moonfin-native-$coreId-${widget.gameId}';

  /// The pre-per-game id, read for its values when a game has no document of
  /// its own. Never written to; see [_loadSettings].
  static String _legacyCoreOptionsSaveId(String coreId) =>
      'moonfin-native-$coreId';

  /// False when this game's settings could not be READ this session, which
  /// would make a write a blind overwrite of settings we never saw.
  bool _coreOptionsReadable = true;

  /// The one place emulator settings are written, so the retry policy and the
  /// save id cannot drift between the menu path and the exit path.
  ///
  /// A whole-document write is correct here because the document belongs to
  /// one game and [options] is that game's complete option set -- both callers
  /// enumerate what the core published for the loaded content.
  ///
  /// [backoff] is shortened on exit: a user leaving the game should not wait
  /// out a full retry ladder for a settings write.
  Future<void> _writeOptions(
    GamesApi games,
    String coreId,
    Iterable<MapEntry<String, String>> options, {
    List<Duration> backoff = defaultSettingsSaveBackoff,
  }) {
    if (!_coreOptionsReadable) {
      throw StateError('emulator settings were not readable this session');
    }
    return retryOnTransientFailure(
      () => games.putSave(
        _gameOptionsSaveId(coreId),
        options.map((e) => '${e.key}=${e.value}').join('\n').codeUnits,
        kind: 'settings',
      ),
      backoff: backoff,
    );
  }

  Future<void> _persistOptions() async {
    final games = _client.gamesApi;
    final coreId = libretroCoreId(widget.core);
    if (games == null || coreId == null || _options.isEmpty) return;
    if (!_coreOptionsReadable) {
      _showTransientMessage(
        'Saved settings could not be read; not overwriting them.',
      );
      return;
    }
    try {
      await _writeOptions(
        games,
        coreId,
        _options.map((o) => MapEntry(o.id, o.current)),
      );
    } catch (_) {
      // The option is live in the core either way, but it will be back to its
      // old value next launch, and only the user can decide to redo it.
      _showTransientMessage('Setting applied for now, but not saved.');
    }
  }

  /// True only when the state actually reached the server.
  Future<bool> _persistState() async {
    final games = _client.gamesApi;
    final bytes = await _player.saveState();
    if (bytes == null || bytes.isEmpty || games == null) return false;
    await games.putSave(_stateKey, bytes);
    return true;
  }

  Future<void> _saveState() async {
    try {
      await _persistState();
    } catch (_) {
      _showTransientMessage('Could not save state.');
    } finally {
      if (mounted) _closeOverlay();
    }
  }

  /// Leaves only once the state is stored. Exiting on a failed save is the
  /// exact outcome the exit warning exists to prevent, so a failure keeps the
  /// game running and says so.
  Future<void> _saveAndExit() async {
    var saved = false;
    try {
      saved = await _persistState();
    } catch (_) {
      saved = false;
    }
    if (saved) {
      await _exit();
      return;
    }
    if (mounted) _showTransientMessage('Could not save state. Still playing.');
  }

  Future<void> _loadState() async {
    try {
      final games = _client.gamesApi;
      final save = games == null
          ? null
          : await loadGameStateWithMigration(games, widget.gameId, widget.core);
      if (save != null && save.isNotEmpty) {
        await _player.loadState(Uint8List.fromList(save));
      }
    } catch (_) {
      _showTransientMessage('Could not load state.');
    } finally {
      if (mounted) _closeOverlay();
    }
  }

  Future<void> _restart() async {
    try {
      // _applyOption persists in the background. Re-send and flush the
      // visible values here so an immediate restart cannot race that
      // best-effort write.
      for (final option in _options) {
        await _player.setOption(option.id, option.current);
      }
      await _persistOptions();
      await _player.restart();
    } on PlatformException catch (e) {
      _showTransientMessage(
        e.code == 'restart_unavailable'
            ? 'Restart is not available for this core.'
            : 'Could not restart.',
      );
    } catch (_) {
      _showTransientMessage('Could not restart.');
    } finally {
      if (mounted) _closeOverlay();
    }
  }

  // The first value in a legacy libretro option is its core-defined default.
  // Restart immediately because many cores only read these during initialization.
  Future<void> _resetEmulatorSettings() async {
    try {
      final options = await _player.getOptions();
      if (options.isEmpty) return;
      for (final option in options) {
        await _player.setOption(option.id, option.choices.first);
      }
      if (!mounted) return;
      setState(() {
        _options = options
            .map(
              (option) => GameCoreOption(
                id: option.id,
                label: option.label,
                current: option.choices.first,
                choices: option.choices,
              ),
            )
            .toList(growable: false);
      });
      await _persistOptions();
      await _player.restart();
    } catch (_) {
      _showTransientMessage('Could not reset emulator settings.');
    } finally {
      if (mounted) _closeOverlay();
    }
  }

  // Resume first so the running core samples the pulse, then send the button.
  void _pressButton(int index) {
    _closeOverlay();
    _player.pulseButton(index);
  }

  void _toggleFastForward() {
    _fastForward = _fastForward > 1 ? 1 : 2;
    _player.setFastForward(_fastForward);
    setState(() {});
  }

  Future<void> _openSettings() async {
    // Invoked as an unawaited VoidCallback from the overlay, and unlike its
    // sibling action methods, getOptions() does not swallow its own errors --
    // a throwing core would otherwise surface as an unhandled async error
    // with no feedback to the player.
    List<GameCoreOption> options;
    try {
      options = await _player.getOptions();
    } catch (_) {
      if (mounted) _showTransientMessage('Could not load emulator settings.');
      return;
    }
    if (!mounted) return;
    setState(() {
      _options = List.of(options);
      _settingsOpen = true;
      _settingsSelected = 0;
    });
  }

  /// The controllers that can be remapped on this platform.
  ///
  /// Android asks its gamepad channel, which is also what applies the mapping.
  /// Windows and Linux ask the gamepads package, since on those platforms the
  /// mapping is applied here in Dart. Apple platforms bind their buttons in
  /// Swift and have no remapping, so they report nothing and the menu entry is
  /// hidden.
  Future<List<NativeControllerDevice>> _remappableDevices() async {
    if (PlatformDetection.isAndroid) {
      final rawDevices = await AndroidGamepadChannel.getNativeGamepadDevices();
      return rawDevices
          .map(NativeControllerDevice.fromMap)
          .where((device) => device.id.isNotEmpty)
          .toList(growable: false);
    }
    if (!_readsGamepadsInDart) return const [];
    final pads = await Gamepads.list();
    return pads
        .where((pad) => pad.id.isNotEmpty)
        .map(
          (pad) => NativeControllerDevice(
            id: desktopControllerDeviceId(pad.id),
            name: pad.name.isEmpty ? 'Gamepad ${pad.id}' : pad.name,
            connectionId: desktopControllerDeviceId(pad.id),
          ),
        )
        .toList(growable: false);
  }

  Future<void> _loadControllerMappings(GamesApi games) async {
    // Assignments are pushed before the core starts, so the native registry
    // allocates ports from the user's choice on the first pass rather than
    // reshuffling everyone a moment after the game appears.
    final assignmentLoad = await loadControllerPlayerAssignmentsChecked(games);
    _controllerAssignments = assignmentLoad.assignments;
    _controllerAssignmentsReachable = assignmentLoad.reachable;
    await _syncControllerAssignments();
    await _refreshControllerMappings(games: games);
  }

  /// Re-reads what the core calls each button. Cores re-send their input
  /// descriptors after a port's device type changes, so this runs after every
  /// controller-type change as well as at load.
  Future<void> _refreshInputDescriptors() async {
    try {
      final descriptors = await _player.getInputDescriptors();
      if (!mounted) return;
      setState(() => _inputDescriptors = descriptors);
    } catch (error) {
      // Descriptions are a labelling nicety; without them the mapping screen
      // shows bare button names, which is what it always did.
      debugPrint(
        '[NativeGamePlayerScreen] Could not read input descriptors: $error',
      );
    }
  }

  Future<void> _syncControllerAssignments([
    NativeControllerPlayerAssignments? assignments,
  ]) async {
    if (!PlatformDetection.isAndroid) return;
    await AndroidGamepadChannel.setControllerAssignments(
      (assignments ?? _controllerAssignments).toJson(),
    );
  }

  /// Applies an edited player assignment: native first so the ports move
  /// immediately, then persisted, then the device list is re-read so the UI
  /// shows the slots the registry actually handed out.
  Future<void> _onControllerAssignmentsChanged(
    NativeControllerPlayerAssignments assignments,
  ) async {
    setState(() => _controllerAssignments = assignments);
    // The mapping panel intentionally does not await its callback so its
    // player picker closes instantly. Keep those writes ordered here, and let
    // a top-level Back await this tail before checking the native allocation.
    final previous = _controllerAssignmentUpdate;
    final update = _applyControllerAssignments(assignments, previous);
    _controllerAssignmentUpdate = update;
    return update;
  }

  Future<void> _applyControllerAssignments(
    NativeControllerPlayerAssignments assignments,
    Future<void> previous,
  ) async {
    try {
      await previous;
    } catch (_) {
      // A later edit still deserves a chance to reach the native registry.
    }
    await _syncControllerAssignments(assignments);
    final games = _client.gamesApi;
    if (games != null) {
      if (!_controllerAssignmentsReachable) {
        // An empty fallback after a failed read is not the stored truth. Keep
        // the native assignment live, but never replace pins we could not see.
        _showTransientMessage(
          'Saved player assignments could not be read; not overwriting them.',
        );
      } else {
        try {
          await saveControllerPlayerAssignments(games, assignments);
        } catch (error) {
          // The assignment is live for this session. This edit is made from
          // the controller menu, not mid-game, so a transient line there is
          // the cheaper surprise -- cheaper than the pin being silently gone
          // at the next launch.
          debugPrint(
            '[NativeGamePlayerScreen] Could not save player assignment: $error',
          );
          _showTransientMessage(
            'Player assignment applied for now, but not saved to the server.',
          );
        }
      }
    }
    await _refreshControllerMappings();
  }

  /// Closes the mapping screen, unless a fresh native allocation says Player
  /// 1 has no connected assignable controller. This runs only after the panel
  /// declined to consume Back, so its submenus retain their ordinary Back
  /// behaviour.
  Future<void> _requestControllerMappingClose() async {
    if (_confirmingControllerMappingExit || !_controllerMappingOpen) return;
    try {
      await _controllerAssignmentUpdate;
    } catch (_) {
      // The edit already reported its save failure; still inspect the live
      // allocation, which is the source of truth for this warning.
    }
    if (!mounted || !_controllerMappingOpen) return;

    if (!PlatformDetection.isAndroid) {
      _closeControllerMapping();
      return;
    }

    late final List<NativeControllerDevice> devices;
    try {
      devices = await _remappableDevices();
    } catch (error) {
      debugPrint(
        '[NativeGamePlayerScreen] Could not verify Player 1 allocation: $error',
      );
      if (!mounted || !_controllerMappingOpen) return;
      _showControllerMappingExitConfirmation(
        'Could not verify whether Player 1 currently has a connected '
        'controller.',
      );
      return;
    }
    if (!mounted || !_controllerMappingOpen) return;
    final pinnedPlayerOne = _controllerAssignments.profileIdByPlayer[1];
    final reason = playerOneWarningFor(
      devices,
      pinnedPlayerOneProfileId: pinnedPlayerOne,
    );
    if (reason == null) {
      _closeControllerMapping();
      return;
    }

    final hasRemote = devices.any(
      (device) =>
          device.deviceClass == NativeControllerDeviceClass.remote &&
          !device.supported,
    );
    final hasKeyboard = devices.any(
      (device) =>
          device.deviceClass == NativeControllerDeviceClass.keyboard &&
          !device.supported,
    );
    // Say what WILL happen, not only what is missing: a remote does play as
    // Player 1, just poorly, and that is the part worth knowing.
    final fallback = switch ((hasRemote, hasKeyboard)) {
      (true, _) => 'The remote will play as Player 1, which is very limited.',
      (false, true) =>
        'The keyboard will play as Player 1, which is very limited.',
      (false, false) => 'Player 1 will have no input at all.',
    };
    _controllerDevices = devices;
    final warning = switch (reason) {
      PlayerOneWarning.assignedControllerMissing =>
        "Player 1's assigned controller is not connected, but another "
            'gamepad is.',
      PlayerOneWarning.gamepadNotAssigned =>
        'You have a gamepad connected, but none is assigned to Player 1.',
    };
    _showControllerMappingExitConfirmation(
      '$warning $fallback',
      leaveLabel: hasRemote
          ? 'Use the remote for Player 1'
          : hasKeyboard
          ? 'Use the keyboard for Player 1'
          : 'Leave with Player 1 vacant',
    );
  }

  void _showControllerMappingExitConfirmation(
    String warning, {
    String leaveLabel = 'Leave anyway',
  }) {
    if (!mounted) return;
    setState(() {
      _controllerMappingExitLeaveLabel = leaveLabel;
      _controllerMappingExitWarning = warning;
      _confirmingControllerMappingExit = true;
      _selected = 0;
    });
  }

  void _cancelControllerMappingExitConfirmation() {
    setState(() {
      _confirmingControllerMappingExit = false;
      _controllerMappingExitWarning = '';
      _selected = 0;
    });
  }

  void _closeControllerMapping() {
    if (!mounted) return;
    setState(() {
      _controllerMappingOpen = false;
      _confirmingControllerMappingExit = false;
      _controllerMappingExitWarning = '';
      _selected = 0;
    });
  }

  Future<void> _refreshControllerMappings({GamesApi? games}) async {
    final generation = ++_controllerRefreshGeneration;
    try {
      final api = games ?? _client.gamesApi;
      if (api == null) return;
      final devices = await _remappableDevices();
      final profileIds = devices.map((device) => device.id).toSet();
      // Keep active-session edits while a hot-plug refresh discovers a new
      // profile. Persisted reads are only needed for profiles not already
      // present; otherwise a delayed refresh could visibly revert a mapping
      // that was just captured in this session.
      final mappings = <String, NativeControllerMapping>{
        ..._controllerMappings,
      };
      final loaded = await Future.wait(
        profileIds
            .where((id) => !mappings.containsKey(id))
            .map(
              (id) async =>
                  MapEntry(id, await loadControllerMappingChecked(api, id)),
            ),
      );
      if (!mounted || generation != _controllerRefreshGeneration) return;
      final currentMappings = _controllerMappings;
      mappings
        ..clear()
        ..addAll(currentMappings);
      for (final entry in loaded) {
        if (currentMappings.containsKey(entry.key)) continue;
        if (!entry.value.reachable) {
          // The read failed, so we do NOT know this pad's bindings. Leaving it
          // out means the screen shows nothing to edit rather than showing
          // defaults that a later edit would persist over the real mapping.
          _unreadableMappingProfiles.add(entry.key);
          continue;
        }
        _unreadableMappingProfiles.remove(entry.key);
        mappings[entry.key] = entry.value.mapping;
      }
      final coreId = libretroCoreId(widget.core);
      final repairedProfiles = <String>{};
      if (coreId != null && _controllerTypesByPort.isNotEmpty) {
        for (final device in devices) {
          final port = device.port;
          final mapping = mappings[device.id];
          if (port == null || mapping == null) continue;
          final selected = mapping.controllerTypeForCore(coreId);
          if (!_isControllerTypeSupportedAtPort(
            coreId,
            port,
            selected,
            _controllerTypesByPort,
          )) {
            mappings[device.id] = mapping.withControllerType(
              coreId,
              retroDeviceJoypad,
            );
            repairedProfiles.add(device.id);
          }
        }
      }
      setState(() {
        _controllerDevices = devices;
        _controllerMappings = Map.unmodifiable(mappings);
      });
      await _syncControllerMappings();
      if (_controllerTypesByPort.isNotEmpty) {
        await _syncControllerTypes();
      }
      await Future.wait(
        repairedProfiles.map((deviceId) async {
          try {
            await saveControllerMapping(api, deviceId, mappings[deviceId]!);
          } catch (_) {
            // The repaired Auto setting remains active for this session.
          }
        }),
      );
    } catch (error) {
      debugPrint('[NativeGamePlayerScreen] Controller refresh failed: $error');
    }
  }

  /// Resolved for the current game here rather than natively, because the
  /// Android parser reads one flat table per profile. Stick snap is resolved
  /// the same way just below.
  String _controllerMappingsJson() =>
      controllerMappingsPayload(_controllerMappings, widget.gameId);

  /// Pushes the mappings to whatever applies them.
  ///
  /// Only Android has a native side to tell: it filters KeyEvents before they
  /// ever reach Dart. On Windows and Linux nothing needs pushing, because
  /// [_bitForGamepadButton] consults [_controllerMappings] directly as each
  /// event arrives.
  Future<void> _syncControllerMappings() async {
    if (!PlatformDetection.isAndroid) return;
    await AndroidGamepadChannel.setControllerMapping(_controllerMappingsJson());
    await AndroidGamepadChannel.setStickSnap({
      for (final entry in _controllerMappings.entries)
        entry.key: entry.value.snapForGame(widget.gameId).wireName,
    });
  }

  /// Reads every advertisement for Moonfin's routable ports, including device
  /// types the current UI cannot offer yet. The native host also logs entries
  /// for extra ports, while Dart retains the routable entries unfiltered.
  Future<void> _loadControllerTypes(String coreId, GamesApi games) async {
    final advertised = await _player.getControllerTypes();
    final byPort = <int, List<CoreControllerType>>{};
    for (final type in advertised) {
      byPort.putIfAbsent(type.port, () => []).add(type);
    }

    final next = <String, NativeControllerMapping>{..._controllerMappings};
    final changedProfiles = <String>{};
    // No advertisement can mean a legacy runner. Keep a saved choice in that
    // case; a non-empty current advertisement is what proves an old alternate
    // is no longer valid for this core/port.
    if (advertised.isNotEmpty) {
      for (final device in _controllerDevices) {
        final port = device.port;
        final mapping = next[device.id];
        if (port == null || mapping == null) continue;
        final selected = mapping.controllerTypeForCore(coreId);
        if (selected == retroDeviceJoypad) continue;
        if (!_isControllerTypeSupportedAtPort(coreId, port, selected, byPort)) {
          next[device.id] = mapping.withControllerType(
            coreId,
            retroDeviceJoypad,
          );
          changedProfiles.add(device.id);
        }
      }
    }
    if (!mounted) return;
    setState(() {
      _controllerTypesByPort = Map<int, List<CoreControllerType>>.unmodifiable({
        for (final entry in byPort.entries)
          entry.key: List<CoreControllerType>.unmodifiable(entry.value),
      });
      _controllerMappings = Map.unmodifiable(next);
    });
    await _syncControllerTypes();
    await _refreshInputDescriptors();
    await Future.wait(
      changedProfiles.map((deviceId) async {
        try {
          await saveControllerMapping(games, deviceId, next[deviceId]!);
        } catch (_) {
          // Auto still applies for this session if repairing an obsolete saved
          // layout cannot be persisted right now.
        }
      }),
    );
  }

  /// Applies each profile's saved layout to its current session port. The
  /// native bridge maps [retroDeviceJoypad] to the core default.
  Future<void> _syncControllerTypes() async {
    final coreId = libretroCoreId(widget.core);
    if (coreId == null || _controllerTypesByPort.isEmpty) return;
    for (final device in _controllerDevices) {
      final port = device.port;
      if (!device.supported || port == null) continue;
      final mapping = _controllerMappings[device.id];
      final selected =
          mapping?.controllerTypeForCore(coreId) ?? retroDeviceJoypad;
      final type =
          _isControllerTypeSupportedAtPort(
            coreId,
            port,
            selected,
            _controllerTypesByPort,
          )
          ? selected
          : retroDeviceJoypad;
      await _player.setControllerType(port, type);
    }
  }

  bool _isControllerTypeSupportedAtPort(
    String coreId,
    int port,
    int deviceType,
    Map<int, List<CoreControllerType>> typesByPort,
  ) {
    if (deviceType == retroDeviceJoypad) return true;
    return typesByPort[port]?.any(
          (type) => type.id == deviceType && type.isSupportedForCore(coreId),
        ) ??
        false;
  }

  /// Profiles whose stored mapping could not be READ this session. Writing for
  /// one of these would overwrite bindings we never managed to see.
  final Set<String> _unreadableMappingProfiles = <String>{};

  /// Whether [deviceId]'s mapping may be written back to the server.
  ///
  /// Every mapping write must pass through this: a profile whose read failed
  /// holds a fallback, so writing it replaces bindings we never saw.
  bool _canPersistMapping(String deviceId) =>
      !_unreadableMappingProfiles.contains(deviceId);

  static const String _unreadableMappingMessage =
      'Saved mapping could not be read; not overwriting it.';

  Future<void> _updateControllerMapping(
    String deviceId,
    NativeControllerMapping mapping,
  ) async {
    final games = _client.gamesApi;
    if (games == null) return;
    // Applied to the session first, so the panel's display and what the core
    // receives agree; only the write is refused.
    setState(() {
      _controllerMappings = Map.unmodifiable({
        ..._controllerMappings,
        deviceId: mapping,
      });
    });
    await _syncControllerMappings();
    if (!_canPersistMapping(deviceId)) {
      // Refusing is the safe half of the trade: the edit applies for this
      // session, but is not persisted over a mapping we failed to load.
      _showTransientMessage(_unreadableMappingMessage);
      return;
    }
    try {
      await saveControllerMapping(games, deviceId, mapping);
    } catch (_) {
      // The mapping is active for this session, but it will not survive the
      // exit, and only the user can decide whether to redo it later.
      _showTransientMessage('Button saved for now, but not to the server.');
    }
  }

  Future<void> _updateControllerType(String deviceId, int deviceType) async {
    final games = _client.gamesApi;
    final coreId = libretroCoreId(widget.core);
    if (games == null || coreId == null) return;
    final device = _controllerDevices
        .where((item) => item.id == deviceId)
        .firstOrNull;
    if (device?.supported == true && device?.port != null) {
      try {
        await _player.setControllerType(device!.port!, deviceType);
      } catch (_) {
        _showTransientMessage('Controller type not supported by this core.');
        return;
      }
    }
    final current =
        _controllerMappings[deviceId] ?? NativeControllerMapping.empty;
    final next = current.withControllerType(coreId, deviceType);
    setState(() {
      _controllerMappings = Map.unmodifiable({
        ..._controllerMappings,
        deviceId: next,
      });
    });
    if (!_canPersistMapping(deviceId)) {
      // The type is live on the port either way; the write is what would
      // destroy bindings this session never managed to read.
      _showTransientMessage(_unreadableMappingMessage);
      return;
    }
    try {
      await saveControllerMapping(games, deviceId, next);
    } catch (_) {
      // The layout stays applied for this session; say so rather than let the
      // user find it reverted at the next launch.
      _showTransientMessage(
        'Controller type applied for now, but not saved to the server.',
      );
    }
  }

  Future<void> _copyControllerMapping(String sourceDeviceId) async {
    final games = _client.gamesApi;
    final coreId = libretroCoreId(widget.core);
    if (games == null || coreId == null) return;
    final sourceDevice = _controllerDevices.firstWhere(
      (device) => device.id == sourceDeviceId,
      orElse: () => const NativeControllerDevice(id: '', name: ''),
    );
    if (!sourceDevice.supported || sourceDevice.port == null) return;
    final source = _controllerMappings[sourceDeviceId];
    if (source == null) return;
    final targetIds = _controllerDevices
        .where(
          (device) =>
              device.supported &&
              device.port != null &&
              device.id != sourceDeviceId,
        )
        .map((device) => device.id)
        .toSet();
    if (targetIds.isEmpty) return;
    final sourceType = source.controllerTypeForCore(coreId);
    final next = <String, NativeControllerMapping>{
      ..._controllerMappings,
      for (final target in _controllerDevices.where(
        (device) => targetIds.contains(device.id),
      ))
        target.id:
            (_controllerMappings[target.id] ?? NativeControllerMapping.empty)
                // Copies the table the user is looking at, and scopes it to
                // this game on the target too, so the copy cannot reach games
                // the user was not looking at.
                .withBindingsForGame(
                  widget.gameId,
                  source.bindingsForGame(widget.gameId),
                )
                .withControllerType(
              coreId,
              target.port != null &&
                      _isControllerTypeSupportedAtPort(
                        coreId,
                        target.port!,
                        sourceType,
                        _controllerTypesByPort,
                      )
                  ? sourceType
                  : retroDeviceJoypad,
            ),
    };
    if (mounted) {
      setState(() => _controllerMappings = Map.unmodifiable(next));
    } else {
      _controllerMappings = Map.unmodifiable(next);
    }
    await _syncControllerMappings();
    await _syncControllerTypes();
    // One profile failing to persist must not prevent other pads from
    // receiving the active-session mapping, so failures are counted rather
    // than thrown, and reported once instead of once per pad.
    var failed = 0;
    final writable = targetIds.where(_canPersistMapping).toSet();
    final skipped = targetIds.length - writable.length;
    await Future.wait(
      writable.map((id) async {
        try {
          await saveControllerMapping(games, id, next[id]!);
        } catch (_) {
          failed++;
        }
      }),
    );
    // Skipped and failed are different facts: one is a mapping we refused to
    // overwrite, the other a write that did not land.
    if (skipped > 0) {
      _showTransientMessage(_unreadableMappingMessage);
    }
    if (failed > 0) {
      _showTransientMessage(
        failed == writable.length
            ? 'Copied for now, but not saved to the server.'
            : 'Copied, but $failed of ${writable.length} pads were not saved '
                  'to the server.',
      );
    }
  }

  void _openControllerMapping() {
    setState(() {
      _controllerMappingOpen = true;
      _settingsOpen = false;
      _pickerOption = null;
    });
    unawaited(_refreshControllerMappings());
    // FBNeo sends SET_INPUT_DESCRIPTORS from the emulation thread a few ms
    // after load returns, so the read at load time saw nothing; re-read here.
    unawaited(_refreshInputDescriptors());
  }

  Future<void> _exit() async {
    if (_exiting) return;
    _exiting = true;
    final games = _client.gamesApi;
    try {
      if (_textureId != null && games != null) {
        final state = await _player.saveState();
        if (state != null && state.isNotEmpty) {
          await games.putSave(_stateKey, state);
        }
        final options = await _player.getCurrentOptions();
        final coreId = libretroCoreId(widget.core);
        if (options.isNotEmpty && coreId != null) {
          // One short retry only: the user is leaving, so a long ladder here
          // would read as a hung exit.
          await _writeOptions(
            games,
            coreId,
            options.entries,
            backoff: const [Duration(milliseconds: 250)],
          );
        }
      }
    } catch (_) {
      // Exit must not be blocked by sync failures.
    }
    if (!_sessionStopped) {
      _sessionStopped = true;
      try {
        await _player.stop().timeout(const Duration(seconds: 3));
      } catch (_) {
        // The route must still be escapable when native teardown fails or stalls.
      }
    }
    try {
      await _restoreSystemUi();
    } finally {
      if (mounted) context.pop();
    }
  }

  // Leaves the loading or error screen without the save-on-exit that a running
  // game does. Guarded the same way as _exit(): reachable both from the menu
  // and from the system back gesture, and a second invocation (or a prior
  // _setFatalError that already stopped the session) must not stop() again.
  void _backOut() {
    if (_exiting) return;
    _exiting = true;
    if (!_sessionStopped) {
      _sessionStopped = true;
      unawaited(_player.stop());
    }
    unawaited(_restoreSystemUi());
    if (mounted) context.pop();
  }

  // Phones and tablets play full screen in landscape, the natural orientation
  // for the on-screen pad and most games. TV and desktop are left alone.
  void _enterImmersive() {
    GamePlaybackSystemUi.enter(
      immersive: usesOnScreenControls,
      lockLandscape: usesOnScreenControls,
    );
  }

  Future<void> _restoreSystemUi() =>
      GamePlaybackSystemUi.restore(immersive: usesOnScreenControls);

  @override
  Widget build(BuildContext context) {
    Widget scaffold = _buildScaffold(context);
    // Keyboard-driven platforms only, deliberately. Putting this on Android as
    // well briefly looked like the way to catch a USB keyboard's Escape, but it
    // inserts the framework's key pipeline in front of every gameplay key that
    // falls through from the native router -- and each of those then waits on a
    // platform -> Dart -> platform round trip before Android considers the
    // event handled, which shows up as input lag. Android catches Escape in
    // NativePadInput instead, alongside Menu, and never involves Flutter.
    if (usesKeyboardInput) {
      scaffold = Focus(autofocus: true, onKeyEvent: _onKey, child: scaffold);
    }
    // Back never exits directly while a game runs: it walks out of settings and
    // the overlay first, then opens the overlay, whose Exit action saves before
    // popping. The loading and error screens pop normally.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_textureId == null || _error != null) {
          _backOut();
        } else {
          _toggleOverlay();
        }
      },
      child: scaffold,
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_textureId != null)
            Center(
              child: AspectRatio(
                aspectRatio: _aspect,
                // The core renders at its native resolution (a few hundred
                // pixels per side) and this texture is stretched to the whole
                // display. Texture defaults to FilterQuality.low, whose 2x2
                // bilinear tap turns every source pixel into a gradient at the
                // 4-8x magnification a TV asks for, which is why native cores
                // looked soft next to EmulatorJS. Point sampling keeps the
                // pixel art crisp. Scaling is still non-integer here, so
                // pixels land on uneven widths; an integer prescale in the
                // host removes that separately.
                child: Texture(
                  textureId: _textureId!,
                  filterQuality: FilterQuality.none,
                ),
              ),
            ),
          if (_textureId == null && _error == null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(_status, style: const TextStyle(color: Colors.white70)),
                  if (_progress != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 320,
                      child: LinearProgressIndicator(value: _progress),
                    ),
                  ],
                ],
              ),
            ),
          if (_error != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(48),
                child: Text(
                  _error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          if (_textureId != null &&
              _controllers == 0 &&
              !_overlayOpen &&
              !usesKeyboardInput &&
              !usesOnScreenControls)
            Container(
              color: Colors.black87,
              alignment: Alignment.center,
              child: const Text(
                'Connect a Bluetooth game controller to play.',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          if (_textureId == null || _error != null)
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  iconSize: 32,
                  onPressed: _backOut,
                ),
              ),
            ),
          if (_inputNotice != null && _error == null)
            Positioned(
              left: 24,
              right: 24,
              bottom: 88,
              // Purely informational, so it never takes a press meant for the
              // on-screen pad underneath it.
              child: IgnorePointer(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _inputNotice!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          if (_coreMessage != null && _error == null)
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              // Purely informational, so it never takes a press meant for the
              // on-screen pad underneath it.
              child: IgnorePointer(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _coreMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          if (_textureId != null && !_overlayOpen && usesOnScreenControls)
            _buildTouchControls(),
          if (_textureId != null &&
              !_overlayOpen &&
              !usesOnScreenControls &&
              PlatformDetection.isDesktop)
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white54, size: 30),
                  onPressed: _toggleOverlay,
                ),
              ),
            ),
          if (_startHeld && !_overlayOpen) _buildHoldIndicator(),
          if (_overlayOpen) _buildOverlay(),
        ],
      ),
    );
  }

  Widget _touchButton(int bit, Widget label, {double size = 56}) {
    return GestureDetector(
      onTapDown: (_) => _touchPress(bit, true),
      onTapUp: (_) => _touchPress(bit, false),
      onTapCancel: () => _touchPress(bit, false),
      child: Container(
        width: size,
        height: size,
        margin: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white24,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: label,
        ),
      ),
    );
  }

  Widget _buildTouchControls() {
    const white = Colors.white;
    return Positioned.fill(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              bottom: 24,
              child: SizedBox(
                width: 168,
                height: 168,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: _touchButton(
                        1 << 4,
                        const Icon(Icons.keyboard_arrow_up, color: white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _touchButton(
                        1 << 5,
                        const Icon(Icons.keyboard_arrow_down, color: white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _touchButton(
                        1 << 6,
                        const Icon(Icons.keyboard_arrow_left, color: white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _touchButton(
                        1 << 7,
                        const Icon(Icons.keyboard_arrow_right, color: white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 24,
              child: SizedBox(
                width: 168,
                height: 168,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: _touchButton(1 << 9, const Text('X')),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _touchButton(1 << 0, const Text('B')),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _touchButton(1 << 1, const Text('Y')),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _touchButton(1 << 8, const Text('A')),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _touchButton(
                      1 << 2,
                      const Text('SEL', style: TextStyle(fontSize: 11)),
                      size: 44,
                    ),
                    _touchButton(
                      1 << 3,
                      const Text('START', style: TextStyle(fontSize: 10)),
                      size: 44,
                    ),
                  ],
                ),
              ),
            ),
            // Shoulder buttons, used by PlayStation, SNES, and Game Boy Advance.
            Positioned(
              left: 24,
              bottom: 200,
              child: _touchButton(1 << 10, const Text('L')),
            ),
            Positioned(
              right: 24,
              bottom: 200,
              child: _touchButton(1 << 11, const Text('R')),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.menu, color: white, size: 30),
                onPressed: _toggleOverlay,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoldIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: _startHoldDuration,
                  builder: (_, value, _) => CircularProgressIndicator(
                    value: value,
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                AppLocalizations.of(context).gameHoldToOpenMenu,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    final l10n = AppLocalizations.of(context);
    final showBack = _settingsOpen || _pickerOpen || _controllerMappingOpen;
    final String title;
    if (_confirmingControllerMappingExit) {
      title = 'Player 1 unavailable';
    } else if (_controllerMappingOpen) {
      title = 'Controller mapping';
    } else if (_pickerOpen) {
      title = _options[_pickerOption!].label;
    } else if (_settingsOpen) {
      title = l10n.gameEmulatorSettings;
    } else {
      title = widget.gameName ?? l10n.gamePaused;
    }

    // The scrim steps back one level on tap, and the panel absorbs taps so only
    // its rows act.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggleOverlay,
      child: Container(
        color: Colors.black.withValues(alpha: 0.72),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {},
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 520,
              maxHeight: MediaQuery.sizeOf(context).height * 0.82,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        if (showBack)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _overlayBack,
                            child: const SizedBox(
                              width: 44,
                              height: 44,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          )
                        else
                          const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildOverlayBody(l10n),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayBody(AppLocalizations l10n) {
    if (_controllerMappingOpen && !_confirmingControllerMappingExit) {
      return NativeControllerMappingScreen(
        key: _controllerMappingKey,
        devices: _controllerDevices,
        mappings: _controllerMappings,
        onMappingChanged: _updateControllerMapping,
        coreId: libretroCoreId(widget.core) ?? '',
        controllerTypesByPort: _controllerTypesByPort,
        onControllerTypeChanged: _updateControllerType,
        onCopyMapping: _copyControllerMapping,
        assignments: _controllerAssignments,
        inputDescriptors: _inputDescriptors,
        gameId: widget.gameId,
        onAssignmentChanged: PlatformDetection.isAndroid
            ? _onControllerAssignmentsChanged
            : null,
        onClose: () => unawaited(_requestControllerMappingClose()),
      );
    }
    if (_pickerOpen) {
      final opt = _options[_pickerOption!];
      return Flexible(
        child: ListView.builder(
          key: const ValueKey('picker'),
          controller: _pickerScroll,
          shrinkWrap: true,
          itemExtent: _rowExtent,
          itemCount: opt.choices.length,
          itemBuilder: (context, i) => _overlayRow(
            opt.choices[i],
            i == _pickerSelected,
            () {
              setState(() => _pickerSelected = i);
              _applyPicker();
            },
            trailing: opt.choices[i] == opt.current ? Icons.check : null,
          ),
        ),
      );
    }
    if (_settingsOpen) {
      if (_options.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            l10n.gameNoCoreOptions,
            style: const TextStyle(color: Colors.white54, fontSize: 20),
          ),
        );
      }
      return Flexible(
        child: ListView.builder(
          key: const ValueKey('settings'),
          controller: _settingsScroll,
          shrinkWrap: true,
          itemExtent: _rowExtent,
          itemCount: _options.length,
          itemBuilder: (context, i) => _overlayRow(
            '${_options[i].label}:  ${_options[i].current}',
            i == _settingsSelected,
            () {
              setState(() => _settingsSelected = i);
              _openPicker(i);
            },
          ),
        ),
      );
    }
    final actions = _actions();
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_confirmingExit)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Text(
                'Exit this game? Progress since the last save will be lost.',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
          if (_confirmingControllerMappingExit)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Text(
                _controllerMappingExitWarning,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
          Flexible(
            child: ListView.builder(
              key: const ValueKey('actions'),
              controller: _overlayScroll,
              shrinkWrap: true,
              itemExtent: _rowExtent,
              itemCount: actions.length,
              itemBuilder: (context, i) =>
                  _overlayRow(actions[i].label, i == _selected, () {
                    setState(() => _selected = i);
                    actions[i].onSelect();
                  }, danger: actions[i].danger),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overlayRow(
    String label,
    bool selected,
    VoidCallback onTap, {
    IconData? trailing,
    bool danger = false,
  }) {
    // Selected rows invert to a white fill, so the warning tint only applies
    // when unselected; on the highlight it would be unreadable.
    final labelColor = selected
        ? Colors.black
        : (danger ? const Color(0xFFFF8A80) : Colors.white);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: labelColor, fontSize: 22),
              ),
            ),
            if (trailing != null)
              Icon(
                trailing,
                size: 22,
                color: selected ? Colors.black : Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}

class _OverlayAction {
  const _OverlayAction(this.label, this.onSelect, {this.danger = false});
  final String label;
  final VoidCallback onSelect;

  /// Marks an action that ends the session, so the row can read as the
  /// consequential one rather than looking like every other menu entry.
  final bool danger;
}
