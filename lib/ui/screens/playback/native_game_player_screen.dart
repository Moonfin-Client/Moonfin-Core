import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamepads/gamepads.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/native_game_player.dart';
import '../../../util/game_cores.dart';
import '../../../util/game_storage.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/gamepad/gamepad_suppressor.dart';

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
  });

  final String libraryId;
  final String gameId;
  final String core;
  final String? gameName;
  final bool startFresh;

  @override
  State<NativeGamePlayerScreen> createState() => _NativeGamePlayerScreenState();
}

class _NativeGamePlayerScreenState extends State<NativeGamePlayerScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final NativeGamePlayer _player = NativeGamePlayer.create();

  String get _stateKey => gameStateKey(widget.gameId, widget.core);

  String? _error;
  String _status = '';
  double? _progress;
  int? _textureId;
  double _aspect = 4 / 3;
  int _controllers = 1;
  bool _exiting = false;
  StreamSubscription<Map<String, dynamic>>? _events;

  // In-game overlay, opened with the Menu button and driven by the same
  // controller (mirrored button events) or the Siri remote (remote presses).
  bool _overlayOpen = false;
  bool _settingsOpen = false;
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
    GamepadButton.back: 1 << 2,
    GamepadButton.leftStick: 1 << 14,
    GamepadButton.rightStick: 1 << 15,
  };

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _enterImmersive();
    // The pad belongs to the libretro core while a game is running, so UI level
    // pad navigation stays suppressed for the lifetime of this screen.
    GamepadSuppressor.push();
    _events = _player.events.listen(_onEvent);
    if (_readsGamepadsInDart) {
      _gamepadEvents = Gamepads.normalizedEvents.listen(_onGamepadEvent);
    }
    _prepare();
  }

  @override
  void dispose() {
    _events?.cancel();
    _gamepadEvents?.cancel();
    _startHoldTimer?.cancel();
    _overlayScroll.dispose();
    _settingsScroll.dispose();
    _pickerScroll.dispose();
    GamepadSuppressor.pop();
    WakelockPlus.disable();
    // Best-effort restore if disposed without going through an exit path.
    unawaited(_restoreSystemUi());
    unawaited(_player.stop());
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
        if (mounted) setState(() => _controllers = count);
        // Keyboard and touch platforms play fine without a controller, so
        // losing the last one should not pause the game there.
        if (!usesKeyboardInput && !usesOnScreenControls) {
          if (count == 0) {
            _player.pause();
          } else {
            _player.resume();
          }
        }
      case 'menuPressed':
        _toggleOverlay();
      case 'remotePress':
        _onRemotePress(event['key']?.toString());
      case 'button':
        final index = (event['index'] as num?)?.toInt() ?? -1;
        final pressed = event['pressed'] as bool? ?? false;
        if (index == 3 && !PlatformDetection.isAppleTV) {
          _onStartButton(pressed);
        } else if (_overlayOpen && pressed) {
          _nav(_navForButton(index));
        }
      case 'error':
        if (mounted) {
          setState(() => _error = event['message']?.toString() ?? 'Error');
        }
    }
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
      if (button == GamepadButton.start) {
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
        if (pressed) _nav(_navActionForGamepad(button));
        return;
      }
      final bit = _gamepadButtonToBit[button];
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
        _setTriggerBit(1 << 12, event.value);
      case GamepadAxis.rightTrigger:
        _setTriggerBit(1 << 13, event.value);
      default:
        return;
    }
    _sendMask();
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

  void _setTriggerBit(int bit, double value) {
    _stickMask = value >= _gamepadDeadzone ? _stickMask | bit : _stickMask & ~bit;
  }

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
    if (_pickerOpen) {
      setState(() => _pickerOption = null);
    } else if (_settingsOpen) {
      setState(() => _settingsOpen = false);
    } else {
      _closeOverlay();
    }
  }

  Future<void> _prepare() async {
    final games = _client.gamesApi;
    if (games == null) {
      setState(() => _error = 'This server does not support games.');
      return;
    }
    final coreId = libretroCoreId(widget.core);
    if (coreId == null) {
      setState(() => _error = 'This system is not supported yet.');
      return;
    }

    // tvOS and macOS bundle their cores, so the native side loads them from the
    // app. Android, Windows, and Linux load a downloaded file.
    String? corePath;
    if (!bundlesGameCores) {
      if (!supportsCoreDownloads) {
        if (mounted) {
          setState(() => _error = 'This system is not supported on this device.');
        }
        return;
      }
      corePath = await installedCorePath(coreId);
      if (corePath == null) {
        if (mounted) {
          setState(() => _error =
              'The core for this system is not installed. Add it in Settings > Playback > Emulator Cores.');
        }
        return;
      }
    }

    try {
      final detail = await games.getGame(widget.libraryId, widget.gameId);
      if (detail == null || !mounted) {
        if (mounted) setState(() => _error = 'Game not found.');
        return;
      }

      await GameStorage.migrateOffCache();
      final systemDir = await GameStorage.systemDir();
      final saveDir = await GameStorage.saveDir();
      final cacheDir =
          await GameStorage.romDir(widget.libraryId, widget.gameId);
      await GameStorage.writeMeta(cacheDir, detail.title, detail.system);

      setState(() => _status = 'Downloading...');
      final romFile = File('${cacheDir.path}/${detail.fileName}');
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
        final biosFile = File('${systemDir.path}/${bios.fileName}');
        if (!await biosFile.exists()) {
          await games.downloadBios(widget.libraryId, bios.id, biosFile.path);
        }
      }
      if (!mounted) return;

      setState(() {
        _status = 'Starting...';
        _progress = null;
      });
      final contentPath = await _extractIfArchive(romFile, cacheDir);
      if (contentPath == null) {
        if (mounted) {
          setState(() => _error = 'This archive format is not supported.');
        }
        return;
      }

      final settingsJson =
          await _loadSettings(games, coreId).catchError((_) => null);
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

      await _player.start();
      if (!widget.startFresh) {
        final save = await games.getSave(_stateKey);
        if (save != null && save.isNotEmpty) {
          await _player.loadState(Uint8List.fromList(save));
        }
      }
      if (mounted) setState(() => _textureId = info.textureId);
    } catch (e) {
      if (mounted) {
        final message = e is PlatformException && e.code == 'core_missing'
            ? 'The core for this system is not included in this build.'
            : 'Could not start this game. ($e)';
        setState(() => _error = message);
      }
    }
  }

  /// Returns the playable content path: the file itself, or the ROM extracted
  /// from a .zip next to it. 7z is not readable here yet.
  Future<String?> _extractIfArchive(File file, Directory cacheDir) async {
    final lower = file.path.toLowerCase();
    if (lower.endsWith('.7z')) return null;
    if (!lower.endsWith('.zip')) return file.path;

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
      final outPath = '${cacheDir.path}/${best.name.split('/').last}';
      final output = OutputFileStream(outPath);
      best.writeContent(output);
      await output.close();
      await marker.writeAsString(outPath);
      return outPath;
    } finally {
      await input.close();
    }
  }

  Future<Map<String, String>?> _loadSettings(
      GamesApi games, String coreId) async {
    final blob = await games.getSave('moonfin-native-$coreId', kind: 'settings');
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

  List<_OverlayAction> _actions() => [
        _OverlayAction('Resume', _closeOverlay),
        _OverlayAction('Press Start', () => _pressButton(3)),
        _OverlayAction('Press Select', () => _pressButton(2)),
        _OverlayAction('Save state', _saveState),
        _OverlayAction('Load state', _loadState),
        _OverlayAction('Restart', _restart),
        _OverlayAction(
          _fastForward > 1 ? 'Fast-forward: On' : 'Fast-forward: Off',
          _toggleFastForward,
        ),
        _OverlayAction('Emulator settings', _openSettings),
        _OverlayAction('Exit', _exit),
      ];

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
    }
  }

  void _closeOverlay() {
    setState(() {
      _overlayOpen = false;
      _settingsOpen = false;
      _pickerOption = null;
    });
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
    final wrapped = ((current + delta) % count + count) % count;
    setState(() {
      if (_pickerOpen) {
        _pickerSelected = wrapped;
      } else if (_settingsOpen) {
        _settingsSelected = wrapped;
      } else {
        _selected = wrapped;
      }
    });
    _ensureVisible(controller, wrapped);
  }

  // Scrolls the selected row back into view, walking the list by whole rows.
  void _ensureVisible(ScrollController controller, int index) {
    if (!controller.hasClients) return;
    final position = controller.position;
    final top = index * _rowExtent;
    final bottom = top + _rowExtent;
    var target = position.pixels;
    if (top < position.pixels) {
      target = top;
    } else if (bottom > position.pixels + position.viewportDimension) {
      target = bottom - position.viewportDimension;
    }
    target = target.clamp(position.minScrollExtent, position.maxScrollExtent);
    if (target == position.pixels) return;
    controller.animateTo(
      target,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
  }

  void _confirm() {
    if (_pickerOpen) {
      _applyPicker();
    } else if (_settingsOpen) {
      _openPicker(_settingsSelected);
    } else {
      _actions()[_selected].onSelect();
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
      _pickerSelected =
          opt.choices.indexOf(opt.current).clamp(0, opt.choices.length - 1);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _pickerOpen) _ensureVisible(_pickerScroll, _pickerSelected);
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

  Future<void> _persistOptions() async {
    final games = _client.gamesApi;
    final coreId = libretroCoreId(widget.core);
    if (games == null || coreId == null || _options.isEmpty) return;
    final blob =
        _options.map((o) => '${o.id}=${o.current}').join('\n').codeUnits;
    try {
      await games.putSave('moonfin-native-$coreId', blob, kind: 'settings');
    } on Exception {
      // A settings write is not worth interrupting the game for.
    }
  }

  Future<void> _saveState() async {
    final games = _client.gamesApi;
    final bytes = await _player.saveState();
    if (bytes != null && bytes.isNotEmpty && games != null) {
      await games.putSave(_stateKey, bytes);
    }
    _closeOverlay();
  }

  Future<void> _loadState() async {
    final games = _client.gamesApi;
    final save = await games?.getSave(_stateKey);
    if (save != null && save.isNotEmpty) {
      await _player.loadState(Uint8List.fromList(save));
    }
    _closeOverlay();
  }

  Future<void> _restart() async {
    await _player.restart();
    _closeOverlay();
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
    final options = await _player.getOptions();
    if (!mounted) return;
    setState(() {
      _options = List.of(options);
      _settingsOpen = true;
      _settingsSelected = 0;
    });
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
        if (options.isNotEmpty) {
          final coreId = libretroCoreId(widget.core);
          final blob = options.entries
              .map((e) => '${e.key}=${e.value}')
              .join('\n')
              .codeUnits;
          await games.putSave('moonfin-native-$coreId', blob,
              kind: 'settings');
        }
      }
    } catch (_) {
      // Exit must not be blocked by sync failures.
    }
    await _player.stop();
    await _restoreSystemUi();
    if (mounted) context.pop();
  }

  // Leaves the loading or error screen without the save-on-exit that a running
  // game does.
  void _backOut() {
    unawaited(_player.stop());
    unawaited(_restoreSystemUi());
    if (mounted) context.pop();
  }

  // Phones and tablets play full screen in landscape, the natural orientation
  // for the on-screen pad and most games. TV and desktop are left alone.
  void _enterImmersive() {
    if (!usesOnScreenControls) return;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> _restoreSystemUi() async {
    if (!usesOnScreenControls) return;
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) {
    Widget scaffold = _buildScaffold(context);
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
                child: Texture(textureId: _textureId!),
              ),
            ),
          if (_textureId == null && _error == null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    _status,
                    style: const TextStyle(color: Colors.white70),
                  ),
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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                      child: _touchButton(1 << 4, const Icon(Icons.keyboard_arrow_up, color: white)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _touchButton(1 << 5, const Icon(Icons.keyboard_arrow_down, color: white)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _touchButton(1 << 6, const Icon(Icons.keyboard_arrow_left, color: white)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _touchButton(1 << 7, const Icon(Icons.keyboard_arrow_right, color: white)),
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
                    Align(alignment: Alignment.topCenter, child: _touchButton(1 << 9, const Text('X'))),
                    Align(alignment: Alignment.bottomCenter, child: _touchButton(1 << 0, const Text('B'))),
                    Align(alignment: Alignment.centerLeft, child: _touchButton(1 << 1, const Text('Y'))),
                    Align(alignment: Alignment.centerRight, child: _touchButton(1 << 8, const Text('A'))),
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
                    _touchButton(1 << 2, const Text('SEL', style: TextStyle(fontSize: 11)), size: 44),
                    _touchButton(1 << 3, const Text('START', style: TextStyle(fontSize: 10)), size: 44),
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
    final showBack = _settingsOpen || _pickerOpen;
    final String title;
    if (_pickerOpen) {
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
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 28),
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
      child: ListView.builder(
        key: const ValueKey('actions'),
        controller: _overlayScroll,
        shrinkWrap: true,
        itemExtent: _rowExtent,
        itemCount: actions.length,
        itemBuilder: (context, i) => _overlayRow(
          actions[i].label,
          i == _selected,
          () {
            setState(() => _selected = i);
            actions[i].onSelect();
          },
        ),
      ),
    );
  }

  Widget _overlayRow(String label, bool selected, VoidCallback onTap,
      {IconData? trailing}) {
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
                style: TextStyle(
                  color: selected ? Colors.black : Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            if (trailing != null)
              Icon(trailing,
                  size: 22, color: selected ? Colors.black : Colors.white),
          ],
        ),
      ),
    );
  }
}

class _OverlayAction {
  const _OverlayAction(this.label, this.onSelect);
  final String label;
  final VoidCallback onSelect;
}
