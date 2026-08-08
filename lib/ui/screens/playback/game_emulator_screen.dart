import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:server_core/server_core.dart';

import '../../widgets/adaptive/adaptive_glass.dart';
import '../../../l10n/app_localizations.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../util/game_cores.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/gamepad/gamepad_suppressor.dart';
import '../../../util/focus/gamepad/android_gamepad_channel.dart';
import '../../../util/insecure_certificates.dart';
import '../../../util/webview_environment.dart';
import '../../screensaver/screensaver_controller.dart';
import 'game_playback_ui.dart';
import 'game_audio_owner.dart';

/// Full-screen EmulatorJS host. Loads the Moonbase plugin's player shell in a WebView, streams
/// the ROM from the user's server, and syncs the save state on exit. Includes a native,
/// d-pad-navigable in-game overlay (Resume / Save / Load / Restart / Fast-forward / Exit)
/// reachable on every input device (see the input notes on `_handleGamepad`).
class GameEmulatorScreen extends StatefulWidget {
  const GameEmulatorScreen({
    super.key,
    required this.libraryId,
    required this.gameId,
    required this.core,
    this.romFileName,
    this.biosId,
    this.gameName,
    this.startFresh = false,
  });

  final String libraryId;
  final String gameId;
  final String core;
  final String? romFileName;
  final String? biosId;
  final String? gameName;

  /// Restart: boot without auto-loading the save state (the save is overwritten on exit
  /// as usual). Continue/Play leave this false and resume from any existing save.
  final bool startFresh;

  @override
  State<GameEmulatorScreen> createState() => _GameEmulatorScreenState();
}

class _GameEmulatorScreenState extends State<GameEmulatorScreen>
    with GameAudioOwner {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  InAppWebViewController? _controller;

  String? _playerUrl;
  String? _error;
  bool _emulatorReady = false;
  // Set once by _exit and never reset. Unlike a "saving in progress" flag that
  // is released when the persist step finishes, this must stay true for the
  // rest of the screen's life: a second _exit() call arriving after the
  // persist completes but before context.pop() runs (two platform-channel
  // round trips apart -- well within gamepad auto-repeat) would otherwise
  // re-enter and pop a second route.
  bool _exiting = false;
  RetroArtworkActivityGate? _artworkActivityGate;
  bool _holdsGameplayArtworkBlock = false;
  ScreensaverController? _screensaverController;
  bool _hasSave = false;

  // EmulatorJS settings (control remaps + options) sync per user, not per game, so they use a
  // fixed sentinel id + the "settings" save kind. Restored into localStorage at document start
  // (before EmulatorJS reads it) and saved back on exit.
  static const String _settingsId = 'moonfin-global';
  final List<UserScript> _userScripts = [];

  // Cached in build() so the gamepad-driven action list (built outside a build context) can
  // read localized labels.
  AppLocalizations? _l10n;

  bool _overlayOpen = false;
  int _selected = 0;
  bool _fastForward = false;

  // Native settings sub-view (core options via the JS bridge).
  bool _settingsOpen = false;
  int _settingsSelected = 0;
  List<_GameOption> _options = const [];
  final ScrollController _settingsScroll = ScrollController();
  final ScrollController _overlayScroll = ScrollController();
  static const double _rowExtent = 48;

  // Value picker for a single setting, shown over the settings list so its
  // choices can be seen and picked rather than cycled blind.
  int? _pickerOption;
  int _pickerSelected = 0;
  final ScrollController _pickerScroll = ScrollController();
  bool get _pickerOpen => _pickerOption != null;

  // True only while Android is driving EmulatorJS's own control-mapping dialog.
  bool _emulatorControlsOpen = false;
  bool _confirmingExit = false;

  // Open-overlay gesture: hold Start+Select for 5 seconds.
  bool _startHeld = false;
  bool _selectHeld = false;
  Timer? _comboTimer;

  // Android delivers hardware-gamepad events to the focused WebView (hybrid composition), not
  // to Flutter, and the System WebView does not expose the browser Gamepad API, so the native
  // Activity forwards buttons over the gamepad channel while the screen is active. iOS/desktop
  // WebViews DO expose the Gamepad API, so player.html forwards those buttons via the
  // moonfinPlayer handler instead. Both feed `_handleGamepad`.

  @override
  void initState() {
    super.initState();
    _acquireGameplayArtworkBlock();
    _enterImmersive();
    // A game owns every key from here; a stale IME binding from the browse
    // screen's search field would otherwise sit in front of the d-pad.
    detachTextInputForGameplay();
    _acquireScreensaverBlock();
    // Outside the Android guard on purpose, because the pad belongs to the
    // game on every platform. Either way UI navigation shouldn't also react.
    GamepadSuppressor.push();
    claimGameAudio();
    if (PlatformDetection.isAndroid) {
      // Routed rather than taking the channel outright, since stick navigation
      // listens on the same channel and only one handler is allowed.
      AndroidGamepadChannel.ensureInstalled();
      AndroidGamepadChannel.setEmulatorInputHandler(_onNativeGamepad);
      AndroidGamepadChannel.setGameActive(true);
    }
    unawaited(
      _prepare().catchError((Object error, StackTrace stackTrace) {
        _releaseGameplayArtworkBlock();
        if (mounted) {
          setState(() => _error = 'Could not start this game. ($error)');
        }
      }),
    );
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
    // decoded, and the WebView renderer this screen is about to start competes
    // for that memory from a separate process.
    releaseImageMemoryForGameplay();
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
  // running game -- with no way out, because the WebView consumes gameplay keys
  // before they can reach the dismiss handler in Flutter's key pipeline.
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

  Future<dynamic> _onNativeGamepad(MethodCall call) async {
    if (call.method == 'onKeyboard') {
      if (_emulatorControlsOpen) {
        final args = (call.arguments as Map).cast<String, dynamic>();
        final keyCode = args['keyCode'] as int?;
        if (keyCode != null) await _sendEmulatorKeyboardInput(keyCode);
      }
      return null;
    }
    if (call.method != 'onButton') return null;
    final args = (call.arguments as Map).cast<String, dynamic>();
    final label = args['label'] as String?;
    final pressed = args['pressed'] as bool;
    final device = (args['device'] as Map?)?.cast<String, dynamic>();
    if (label == null) return null;
    if (_emulatorControlsOpen) {
      // Do not hold the platform-channel handler open while waiting for a
      // WebView callback. That serialized quick d-pad taps behind each other
      // on Android TV. The player reports an actual menu close separately.
      _sendEmulatorControlInput(label, pressed, device);
      return null;
    }
    _handleGamepad(
      _semanticFromEmulatorLabel(label),
      pressed,
      emulatorLabel: label,
      emulatorDevice: device,
      canInject: true,
    );
    return null;
  }

  Future<void> _prepare() async {
    final games = _client.gamesApi;
    if (games == null) {
      _releaseGameplayArtworkBlock();
      setState(() => _error = 'This server does not support games.');
      return;
    }

    // On TV and desktop the on-screen touch gamepad is useless, and EmulatorJS wrongly enables
    // it on Android TV (which reports a mobile user agent). Disable it by default there.
    if (PlatformDetection.isTV || PlatformDetection.useDesktopUi) {
      _userScripts.add(
        UserScript(
          source:
              "window.EJS_defaultOptions = Object.assign({}, window.EJS_defaultOptions, {'virtual-gamepad': 'disabled'});",
          injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
        ),
      );
    }

    var hasSave = false;
    try {
      final existing = await loadGameStateWithMigration(
        games,
        widget.gameId,
        widget.core,
        forceEmulatorJs: true,
      );
      hasSave = existing != null && existing.isNotEmpty;
    } catch (_) {}
    _hasSave = hasSave;

    // Restore synced EmulatorJS settings into localStorage before the emulator initializes.
    try {
      final settings = await games.getSave(_settingsId, kind: 'settings');
      if (settings != null && settings.isNotEmpty) {
        final json = utf8.decode(settings);
        _userScripts.add(
          UserScript(
            source:
                "try { localStorage.setItem('ejs-settings', ${jsonEncode(json)}); } catch (e) {}",
            injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
          ),
        );
      }
    } catch (_) {}

    final url = games.playerUrl(
      libraryId: widget.libraryId,
      gameId: widget.gameId,
      core: widget.core,
      romFileName: widget.romFileName,
      biosId: widget.biosId,
      gameName: widget.gameName,
      // Auto-load only when resuming and a save exists (avoids a 404 fetch otherwise).
      includeSaveUrl: hasSave && !widget.startFresh,
      saveId: gameStateKey(widget.gameId, widget.core, forceEmulatorJs: true),
    );

    if (!mounted) return;
    setState(() => _playerUrl = url);
  }

  void _enterImmersive() {
    GamePlaybackSystemUi.enter(
      immersive: true,
      lockLandscape: !PlatformDetection.isTV,
    );
  }

  Future<void> _restoreSystemUi() =>
      GamePlaybackSystemUi.restore(immersive: true);

  void _onPlayerMessage(List<dynamic> args) {
    if (args.isEmpty) return;
    final message = args.first;
    if (message is! Map) return;
    switch (message['type']) {
      case 'moonfin-ready':
        if (mounted) setState(() => _emulatorReady = true);
        unawaited(_registerAndroidGamepads());
        break;
      case 'gamepad':
        // JS-forwarded (iOS/desktop): standard Gamepad API indices; gameplay is read natively
        // by EmulatorJS, so this drives only the overlay, never injection.
        final index = message['index'] as int;
        final pressed = message['pressed'] as bool;
        _handleGamepad(_semanticFromStandard(index), pressed, canInject: false);
        break;
      case 'moonfin-menu-request':
        // Escape reached the page instead of Flutter. The WebView owns focus
        // while a game runs, so a keyboard Escape is delivered to EmulatorJS,
        // which acts on it itself -- ending emulation without this screen ever
        // learning, so none of the save-on-exit work runs. The bridge now
        // swallows that key and asks for the overlay instead, which is the same
        // thing Back does on every other input device.
        _backOneLevel();
        break;
      case 'moonfin-controls-closed':
        final reason = message['reason'] as String? ?? 'close';
        unawaited(_onEmulatorControlsClosed(reason));
        break;
      case 'moonfin-emulator-contract-violation':
        // player.html's moonfinAssertEmulatorContract reports (but never throws for) each
        // EmulatorJS internal the native controller-menu adapter depends on that is missing at
        // ready-time -- e.g. after an EmulatorJS upstream upgrade renamed or removed one. This
        // has no user-visible effect on its own (the adapter's own per-access try/catch already
        // degrades to an unresponsive control row rather than crashing), so it is only logged
        // here for whoever investigates a "controller settings don't work" report.
        final missing = message['missing'] as String?;
        debugPrint(
          '[GameEmulatorScreen] EmulatorJS contract violation: missing $missing',
        );
        break;
    }
  }

  void _handleGamepad(
    _Gp sem,
    bool pressed, {
    String? emulatorLabel,
    Map<String, dynamic>? emulatorDevice,
    required bool canInject,
  }) {
    if (sem == _Gp.start || sem == _Gp.select) {
      if (sem == _Gp.start) _startHeld = pressed;
      if (sem == _Gp.select) _selectHeld = pressed;
      _updateCombo();
      if (mounted) setState(() {});
    }

    if (_pickerOpen) {
      if (!pressed) return;
      switch (sem) {
        case _Gp.up:
          _pickerMove(-1);
          break;
        case _Gp.down:
          _pickerMove(1);
          break;
        case _Gp.confirm:
          _applyPicker();
          break;
        case _Gp.cancel:
          setState(() => _pickerOption = null);
          break;
        default:
          break;
      }
      return;
    }

    if (_settingsOpen) {
      if (!pressed) return;
      switch (sem) {
        case _Gp.up:
          _settingsMove(-1);
          break;
        case _Gp.down:
          _settingsMove(1);
          break;
        case _Gp.left:
          _changeOption(-1);
          break;
        case _Gp.right:
          _changeOption(1);
          break;
        case _Gp.confirm:
          if (_settingsSelected < 0) {
            _closeSettings();
          } else {
            _openPicker(_settingsSelected);
          }
          break;
        case _Gp.cancel:
          _closeSettings();
          break;
        default:
          break;
      }
      return;
    }

    if (_overlayOpen) {
      if (!pressed) return;
      switch (sem) {
        case _Gp.up:
          _move(-1);
          break;
        case _Gp.down:
          _move(1);
          break;
        case _Gp.confirm:
          _activate();
          break;
        case _Gp.cancel:
          _closeOverlay();
          break;
        default:
          break;
      }
      return;
    }

    if (canInject && emulatorLabel != null) {
      // Suppress Start/Select while the open-combo is held so the game never sees a 5s Start.
      final suppress =
          _startHeld && _selectHeld && (sem == _Gp.start || sem == _Gp.select);
      if (!suppress) {
        _controller?.evaluateJavascript(
          source:
              'window.moonfinGamepadInput && '
              'window.moonfinGamepadInput(${jsonEncode(emulatorLabel)}, $pressed, '
              '${jsonEncode(emulatorDevice)});',
        );
      }
    }
  }

  bool get _menuOpen =>
      _overlayOpen || _settingsOpen || _pickerOpen || _emulatorControlsOpen;

  void _updateCombo() {
    if (_startHeld && _selectHeld && !_menuOpen) {
      _comboTimer ??= Timer(const Duration(seconds: 5), () {
        _comboTimer = null;
        if (_startHeld && _selectHeld && !_menuOpen) _openOverlay();
      });
    } else {
      _comboTimer?.cancel();
      _comboTimer = null;
    }
  }

  bool get _comboActive => _startHeld && _selectHeld && !_menuOpen;

  void _openOverlay() {
    if (_overlayOpen) return;
    _comboTimer?.cancel();
    _comboTimer = null;
    setState(() {
      _overlayOpen = true;
      _selected = 0;
    });
    _controller?.evaluateJavascript(
      source: 'window.moonfinPause && window.moonfinPause(true);',
    );
  }

  /// Walks out one overlay level. The single back behaviour for every input
  /// path: the system gesture and TV/gamepad Back through [PopScope], and a
  /// keyboard Escape relayed by the bridge, which the WebView would otherwise
  /// consume.
  ///
  /// A fatal error is the exception: there is no emulator left to walk back
  /// into, so Back leaves outright rather than opening an overlay over an error
  /// message. Matches the native player, which was made escapable after a
  /// mid-game fatal error for the same reason.
  void _backOneLevel() {
    if (_error != null) {
      unawaited(_exit());
    } else if (_confirmingExit) {
      // Cancel the confirmation before any other level, so a stray Back can
      // never fall through to something that ends the session.
      _cancelExitConfirmation();
    } else if (_pickerOpen) {
      setState(() => _pickerOption = null);
    } else if (_emulatorControlsOpen) {
      _sendEmulatorControlInput('BACK', true);
    } else if (_settingsOpen) {
      _closeSettings();
    } else if (_overlayOpen) {
      _closeOverlay();
    } else {
      _openOverlay();
    }
  }

  /// Asks before ending a running session. A failed load has nothing to lose,
  /// so it leaves straight away rather than making the user confirm their way
  /// off an error message.
  void _requestExit() {
    if (_error != null || _playerUrl == null) {
      unawaited(_exit());
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

  void _closeOverlay() {
    if (!_overlayOpen) return;
    setState(() {
      _overlayOpen = false;
      _confirmingExit = false;
    });
    _controller?.evaluateJavascript(
      source: 'window.moonfinPause && window.moonfinPause(false);',
    );
  }

  void _move(int dir) {
    final n = _actions().length;
    setState(
      () => _selected = wrapGamePlaybackMenuSelection(_selected, dir, n),
    );
    ensureGamePlaybackMenuSelectionVisible(
      _overlayScroll,
      _selected,
      rowExtent: _rowExtent,
    );
  }

  void _activate() {
    final items = _actions();
    if (_selected >= 0 && _selected < items.length) items[_selected].onSelect();
  }

  List<_OverlayItem> _actions() {
    final l = _l10n;
    // Exit ends the session, and it is one press away from several input
    // paths. Confirming it by swapping the action list -- rather than showing a
    // dialog -- keeps it navigable by remote, gamepad and keyboard alike, since
    // selection and wrapping are driven off this list. The safe choice is
    // first, so the default highlight cannot end the game.
    if (_confirmingExit) {
      return [
        _OverlayItem(
          Icons.play_arrow,
          l?.resume ?? 'Keep playing',
          null,
          _cancelExitConfirmation,
        ),
        _OverlayItem(Icons.close, l?.exit ?? 'Exit', null, _exit, danger: true),
      ];
    }
    return [
      _OverlayItem(
        Icons.play_arrow,
        l?.resume ?? 'Resume',
        null,
        _closeOverlay,
      ),
      _OverlayItem(
        Icons.save_outlined,
        l?.gameSaveState ?? 'Save state',
        null,
        _saveAction,
      ),
      if (_hasSave)
        _OverlayItem(
          Icons.download_outlined,
          l?.gameLoadState ?? 'Load state',
          null,
          _loadAction,
        ),
      _OverlayItem(
        Icons.refresh,
        l?.restart ?? 'Restart',
        null,
        _restartAction,
      ),
      _OverlayItem(
        Icons.fast_forward,
        l?.gameFastForward ?? 'Fast-forward',
        _fastForward ? 'On' : 'Off',
        _toggleFastForward,
      ),
      _OverlayItem(
        Icons.gamepad_outlined,
        'Controller settings',
        null,
        _openControllerSettings,
      ),
      _OverlayItem(
        Icons.tune,
        l?.gameEmulatorSettings ?? 'Emulator settings',
        null,
        _openSettings,
      ),
      _OverlayItem(
        Icons.close,
        l?.exit ?? 'Exit',
        null,
        _requestExit,
        danger: true,
      ),
    ];
  }

  Future<void> _openControllerSettings() async {
    // Android can report Bluetooth/USB controllers after the emulator page is
    // ready (or after a reconnect). Re-query immediately before opening the
    // upstream picker so its device list never depends on the initial page
    // load timing.
    await _registerAndroidGamepads();
    final controller = _controller;
    if (controller == null) return;
    var opened = false;
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody: '''
          if (window.moonfinControlsApiVersion !== 1 ||
              typeof window.moonfinOpenControls !== 'function') {
            return false;
          }
          return window.moonfinOpenControls() === true;
        ''',
      );
      opened = result?.value == true;
    } catch (_) {}
    if (!mounted) return;
    if (!opened) {
      _showTransientMessage(
        'Controller settings need a newer version of the server emulator player.',
      );
      return;
    }
    _closeOverlay();
    if (PlatformDetection.isAndroid) {
      setState(() => _emulatorControlsOpen = true);
      await AndroidGamepadChannel.setEmulatorControlsActive(true);
    }
  }

  void _sendEmulatorControlInput(
    String label,
    bool pressed, [
    Map<String, dynamic>? device,
  ]) {
    final controller = _controller;
    if (controller == null) return;
    controller.evaluateJavascript(
      source:
          'window.moonfinControlInput && window.moonfinControlInput('
          '${jsonEncode(label)}, $pressed, ${jsonEncode(device)});',
    );
  }

  Future<void> _onEmulatorControlsClosed(String reason) async {
    if (!mounted || !_emulatorControlsOpen) return;
    setState(() => _emulatorControlsOpen = false);
    await AndroidGamepadChannel.setEmulatorControlsActive(false);
    // A controller may have connected while the picker was open. Re-query it
    // before gameplay resumes instead of requiring a page reload.
    unawaited(_registerAndroidGamepads());
    // Back is the deliberate exit path to Moonfin's pause menu. The upstream
    // Close footer button resumes gameplay directly.
    if (reason == 'back') _openOverlay();
  }

  Future<void> _sendEmulatorKeyboardInput(int keyCode) async {
    // Matches the sibling _sendEmulatorControlInput: fire-and-forget
    // evaluateJavascript with an existence check, rather than
    // callAsyncJavaScript. Still async because the only caller (the
    // "onKeyboard" branch of _onNativeGamepad) awaits it.
    await _controller?.evaluateJavascript(
      source:
          'window.moonfinKeyboardInput && window.moonfinKeyboardInput($keyCode);',
    );
  }

  Future<void> _registerAndroidGamepads() async {
    if (!PlatformDetection.isAndroid || _controller == null) return;
    final devices = await AndroidGamepadChannel.getEmulatorGamepads();
    if (devices.isEmpty || !mounted) return;
    await _controller!.evaluateJavascript(
      source:
          'window.moonfinRegisterGamepads && '
          'window.moonfinRegisterGamepads(${jsonEncode(devices)});',
    );
  }

  Future<void> _openSettings() async {
    final controller = _controller;
    if (controller == null) return;
    var options = <_GameOption>[];
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody:
            'return window.moonfinGetOptions ? window.moonfinGetOptions() : "[]";',
      );
      final value = result?.value;
      if (value is String && value.isNotEmpty) {
        options = _parseOptions(value);
      }
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _options = options;
      _settingsSelected = options.isEmpty ? -1 : 0;
      _overlayOpen = false;
      _settingsOpen = true;
    });
  }

  void _closeSettings() {
    setState(() {
      _settingsOpen = false;
      _overlayOpen = true;
    });
  }

  void _settingsMove(int dir) {
    // The close control is selection -1, followed by every settings row.
    // Including it in this index-driven model makes the header reachable by a
    // d-pad without introducing a separate Flutter focus tree over the WebView.
    final count = _options.length + 1;
    final current = _settingsSelected + 1;
    final next = wrapGamePlaybackMenuSelection(current, dir, count);
    setState(() => _settingsSelected = next - 1);
    if (_settingsSelected >= 0) {
      ensureGamePlaybackMenuSelectionVisible(
        _settingsScroll,
        _settingsSelected,
        rowExtent: _rowExtent,
      );
    }
  }

  void _changeOption(int dir) {
    if (_options.isEmpty || _settingsSelected < 0) return;
    final option = _options[_settingsSelected];
    if (option.choices.isEmpty) return;
    final next = (option.currentIndex + dir).clamp(
      0,
      option.choices.length - 1,
    );
    if (next == option.currentIndex) return;
    _applyChoice(option, next);
  }

  void _applyChoice(_GameOption option, int choiceIndex) {
    setState(() => option.currentIndex = choiceIndex);
    final choice = option.choices[choiceIndex];
    _controller?.evaluateJavascript(
      source:
          "window.moonfinSetOption && window.moonfinSetOption("
          "${jsonEncode(option.id)}, ${jsonEncode(choice.value)});",
    );
  }

  void _openPicker(int index) {
    if (index < 0 || index >= _options.length) return;
    final option = _options[index];
    if (option.choices.length < 2) return;
    setState(() {
      _pickerOption = index;
      _pickerSelected = option.currentIndex;
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

  void _pickerMove(int dir) {
    final index = _pickerOption;
    if (index == null) return;
    final n = _options[index].choices.length;
    setState(
      () => _pickerSelected = wrapGamePlaybackMenuSelection(
        _pickerSelected,
        dir,
        n,
      ),
    );
    ensureGamePlaybackMenuSelectionVisible(
      _pickerScroll,
      _pickerSelected,
      rowExtent: _rowExtent,
    );
  }

  void _applyPicker() {
    final index = _pickerOption;
    if (index == null) return;
    _applyChoice(_options[index], _pickerSelected);
    setState(() => _pickerOption = null);
  }

  List<_GameOption> _parseOptions(String json) {
    final decoded = jsonDecode(json);
    if (decoded is! List) return const [];
    final result = <_GameOption>[];
    for (final entry in decoded) {
      if (entry is! Map) continue;
      final choices = <_GameChoice>[];
      for (final c in (entry['choices'] as List? ?? const [])) {
        if (c is Map) {
          choices.add(
            _GameChoice(
              (c['value'] as String?) ?? '',
              (c['label'] as String?) ?? '',
            ),
          );
        }
      }
      if (choices.isEmpty) continue;
      final current = entry['current'] as String?;
      var currentIndex = choices.indexWhere((c) => c.value == current);
      if (currentIndex < 0) currentIndex = 0;
      result.add(
        _GameOption(
          id: (entry['id'] as String?) ?? '',
          label: (entry['label'] as String?) ?? '',
          choices: choices,
          currentIndex: currentIndex,
        ),
      );
    }
    return result;
  }

  void _showTransientMessage(String message) {
    if (!mounted) return;
    showGamePlaybackMessage(context, message);
  }

  Future<void> _saveAction() async {
    try {
      await _saveState();
    } catch (_) {
      _showTransientMessage('Could not save state.');
    }
    _closeOverlay();
  }

  Future<void> _loadAction() async {
    final games = _client.gamesApi;
    if (games != null) {
      try {
        final bytes = await loadGameStateWithMigration(
          games,
          widget.gameId,
          widget.core,
          forceEmulatorJs: true,
        );
        if (bytes != null && bytes.isNotEmpty) {
          final b64 = base64.encode(bytes);
          await _controller?.evaluateJavascript(
            source:
                "window.moonfinLoadState && window.moonfinLoadState('$b64');",
          );
        }
      } catch (_) {
        _showTransientMessage('Could not load state.');
      }
    }
    _closeOverlay();
  }

  Future<void> _restartAction() async {
    try {
      // Awaited (unlike the other fire-and-forget evaluateJavascript calls in
      // this file) so a rejected WebView call is actually caught here instead
      // of surfacing as an unhandled async error.
      await _controller?.evaluateJavascript(
        source: 'window.moonfinRestart && window.moonfinRestart();',
      );
    } catch (_) {
      _showTransientMessage('Could not restart.');
    }
    _closeOverlay();
  }

  void _toggleFastForward() {
    setState(() => _fastForward = !_fastForward);
    _controller?.evaluateJavascript(
      source:
          'window.moonfinFastForward && window.moonfinFastForward($_fastForward);',
    );
  }

  /// Pulls the current save state out of EmulatorJS and PUTs it to the server.
  ///
  /// Errors are allowed to propagate: `_persistOnExit` (the exit-time caller)
  /// already wraps this in its own try/timeout, and `_saveAction` (the menu
  /// caller) needs to see failures so it can surface them instead of silently
  /// looking like a successful save.
  Future<void> _saveState() async {
    final controller = _controller;
    final games = _client.gamesApi;
    // Every one of these is a silent "no save happened", and the user is told
    // the opposite by the exit confirmation. Say which one it was: a save state
    // that never lands is invisible until someone goes looking for it on the
    // server, which is exactly how this went unnoticed.
    if (controller == null || games == null || !_emulatorReady) {
      debugPrint(
        '[GameEmulatorScreen] Save state skipped: '
        'controller=${controller != null}, api=${games != null}, '
        'emulatorReady=$_emulatorReady',
      );
      return;
    }

    Object? value;
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody:
            'return window.moonfinGetState ? window.moonfinGetState() : null;',
      );
      value = result?.value;
    } catch (error) {
      // callAsyncJavaScript is not supported on every platform this screen
      // runs on, and a throw here would otherwise be swallowed whole by
      // _persistOnExit's catch.
      debugPrint('[GameEmulatorScreen] Save state read failed: $error');
      return;
    }

    if (value is! String || value.isEmpty) {
      debugPrint(
        '[GameEmulatorScreen] Save state empty; nothing persisted '
        '(moonfinGetState returned ${value == null ? 'null' : value.runtimeType})',
      );
      return;
    }
    final bytes = base64.decode(value);
    await games.putSave(
      gameStateKey(widget.gameId, widget.core, forceEmulatorJs: true),
      bytes,
    );
    debugPrint('[GameEmulatorScreen] Save state persisted: ${bytes.length} B');
  }

  /// Reads EmulatorJS's settings out of the WebView and syncs them to the server (per user).
  Future<void> _saveSettings() async {
    final controller = _controller;
    final games = _client.gamesApi;
    if (controller == null || games == null) return;
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody:
            'return window.moonfinGetSettings ? window.moonfinGetSettings() : null;',
      );
      final value = result?.value;
      if (value is String && value.isNotEmpty) {
        await games.putSave(_settingsId, utf8.encode(value), kind: 'settings');
      }
    } catch (_) {}
  }

  /// Reports a failure that ends the session.
  ///
  /// Setting [_error] is what removes the WebView from the tree, so this is
  /// also how a dead or wedged emulator surface stops holding input focus.
  /// Only the first failure is kept: a renderer death tends to be followed by
  /// resource errors for the same cause, and the first one is the useful one.
  void _setFatalError(String message) {
    if (!mounted || _error != null) return;
    setState(() => _error = message);
  }

  Future<void> _exit() async {
    if (_exiting) return;
    _exiting = true;
    // The save reads state back out of the WebView, and on Windows and web that
    // round-trip can stall on a large PSP state. Give it a few seconds and leave
    // anyway, otherwise the WebView stays on screen and swallows every input.
    try {
      await _persistOnExit().timeout(const Duration(seconds: 3));
    } catch (_) {}
    await _restoreSystemUi();
    _releaseScreensaverBlock();
    if (mounted) context.pop();
  }

  Future<void> _persistOnExit() async {
    await _saveState();
    await _saveSettings();
  }

  @override
  Future<void> pauseForAudioClaim() async {
    await _controller?.evaluateJavascript(
        source: 'window.moonfinPause && window.moonfinPause(true);');
  }

  @override
  void dispose() {
    _releaseGameplayArtworkBlock();
    _releaseScreensaverBlock();
    releaseGameAudio();
    _comboTimer?.cancel();
    _settingsScroll.dispose();
    _overlayScroll.dispose();
    _pickerScroll.dispose();
    if (PlatformDetection.isAndroid) {
      AndroidGamepadChannel.setGameActive(false);
      AndroidGamepadChannel.setEmulatorControlsActive(false);
      AndroidGamepadChannel.setEmulatorInputHandler(null);
    }
    GamepadSuppressor.pop();
    // Best-effort restore if disposed without going through _exit (e.g. system pop).
    _restoreSystemUi();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _backOneLevel();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            if (_error != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (_playerUrl == null)
              const Center(child: CircularProgressIndicator())
            else
              // Inset the game surface from the side notches so EmulatorJS's
              // on-screen controls are not eaten by the cutout in landscape.
              Positioned.fill(
                child: SafeArea(
                  left: true,
                  right: true,
                  top: false,
                  bottom: false,
                  child: InAppWebView(
                    key: const ValueKey('game-emulator-webview'),
                    webViewEnvironment: gWebViewEnvironment,
                    initialUrlRequest: URLRequest(url: WebUri(_playerUrl!)),
                    initialUserScripts: _userScripts.isEmpty
                        ? null
                        : UnmodifiableListView(_userScripts),
                    initialSettings: InAppWebViewSettings(
                      javaScriptEnabled: true,
                      domStorageEnabled: true,
                      mediaPlaybackRequiresUserGesture: false,
                      allowsInlineMediaPlayback: true,
                      transparentBackground: true,
                      supportZoom: false,
                    ),
                    onWebViewCreated: (controller) {
                      _controller = controller;
                      controller.addJavaScriptHandler(
                        handlerName: 'moonfinPlayer',
                        callback: _onPlayerMessage,
                      );
                    },
                    // The renderer is a separate process and can be killed out
                    // from under us -- reliably so on memory-constrained TV
                    // boxes running a heavy core like N64. Nothing surfaced
                    // that before: the surface simply froze mid-load (a stuck
                    // "Download Game Data 33%"), kept input focus, and left no
                    // way out but killing the app. Reporting it swaps the dead
                    // WebView for the error branch above, which releases focus
                    // and makes the overlay reachable again.
                    onRenderProcessGone: (controller, detail) {
                      _setFatalError(
                        detail.didCrash == true
                            ? 'The emulator stopped unexpectedly. This game may '
                                  'be too demanding for this device.'
                            : 'The emulator ran out of memory on this device. '
                                  'Try a less demanding system, or close other '
                                  'apps and retry.',
                      );
                    },
                    onReceivedError: (controller, request, error) {
                      // Sub-resource failures are EmulatorJS's business; only a
                      // main-frame failure means the player itself never came up.
                      if (request.isForMainFrame == true) {
                        _setFatalError(
                          'Could not load the emulator. (${error.description})',
                        );
                      }
                    },
                    onReceivedHttpError: (controller, request, response) {
                      if (request.isForMainFrame == true) {
                        _setFatalError(
                          'Could not load the emulator. '
                          '(HTTP ${response.statusCode})',
                        );
                      }
                    },
                    onReceivedServerTrustAuthRequest:
                        gAllowSelfSignedCertificates
                        ? (controller, challenge) async =>
                              ServerTrustAuthResponse(
                                action: ServerTrustAuthResponseAction.PROCEED,
                              )
                        : null,
                  ),
                ),
              ),
            if (_comboActive) _buildHoldIndicator(),
            // Menu button for touch/mouse users (opens the same overlay).
            Positioned(
              top: 8,
              left: 8,
              child: SafeArea(
                // On Web the emulator is an iframe platform view, which would
                // otherwise swallow clicks intended for this Flutter control.
                child: PointerInterceptor(
                  child: Material(
                    color: Colors.black54,
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      tooltip: _l10n?.gameMenu ?? 'Menu',
                      onPressed: _openOverlay,
                    ),
                  ),
                ),
              ),
            ),
            if (_overlayOpen) _buildOverlay(),
            if (_settingsOpen && !_pickerOpen) _buildSettings(),
            if (_pickerOpen) _buildPicker(),
          ],
        ),
      ),
    );
  }

  /// A dimmed scrim with a centered glass panel; tapping the scrim dismisses. Shared by the
  /// action overlay and the settings sub-view.
  Widget _modalScrim({
    required double maxWidth,
    double? maxHeight,
    required VoidCallback onDismiss,
    required Widget child,
  }) {
    return Positioned.fill(
      // Intercept the platform view across the complete modal, not only its
      // buttons, so scrim taps and every nested control work on Web and iOS.
      child: PointerInterceptor(
        child: GestureDetector(
          onTap: onDismiss,
          child: ColoredBox(
            color: Colors.black.withValues(alpha: 0.58),
            child: SafeArea(
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Never taller than the viewport, so the panel's list scrolls instead of
                      // overflowing on short screens.
                      final available = constraints.maxHeight - 24;
                      final cap = (maxHeight == null || maxHeight > available)
                          ? available
                          : maxHeight;
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: maxWidth,
                          maxHeight: cap,
                        ),
                        child: adaptiveGlass(
                          context: context,
                          fallbackColor: const Color(0xE6141A22),
                          cornerRadius: 18,
                          child: child,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettings() {
    return _modalScrim(
      maxWidth: 420,
      maxHeight: 460,
      onDismiss: _closeSettings,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _l10n?.gameEmulatorSettings ?? 'Emulator settings',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _closeSettings,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _settingsSelected < 0
                          ? const Color(0xFF3F8CFF)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.close,
                      color: _settingsSelected < 0
                          ? Colors.white
                          : Colors.white54,
                      size: 22,
                      semanticLabel: _l10n?.close ?? 'Close',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white12),
          Flexible(
            child: _options.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _l10n?.gameNoCoreOptions ??
                          'This core has no adjustable options.',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    controller: _settingsScroll,
                    shrinkWrap: true,
                    itemExtent: _rowExtent,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    itemCount: _options.length,
                    itemBuilder: (context, i) =>
                        _settingsRow(_options[i], i == _settingsSelected, i),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicker() {
    final index = _pickerOption;
    if (index == null) return const SizedBox.shrink();
    final option = _options[index];
    return _modalScrim(
      maxWidth: 420,
      maxHeight: 460,
      onDismiss: () => setState(() => _pickerOption = null),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => _pickerOption = null),
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    option.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white12),
          Flexible(
            child: ListView.builder(
              controller: _pickerScroll,
              shrinkWrap: true,
              itemExtent: _rowExtent,
              padding: const EdgeInsets.symmetric(vertical: 6),
              itemCount: option.choices.length,
              itemBuilder: (context, i) => _pickerRow(option, i),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pickerRow(_GameOption option, int index) {
    final selected = index == _pickerSelected;
    final current = index == option.currentIndex;
    return GestureDetector(
      onTap: () {
        setState(() => _pickerSelected = index);
        _applyPicker();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0x333F8CFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? const Color(0xFF3F8CFF) : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.choices[index].label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            if (current)
              const Icon(Icons.check, size: 18, color: Color(0xFF3F8CFF)),
          ],
        ),
      ),
    );
  }

  Widget _settingsRow(_GameOption option, bool selected, int index) {
    final choice = option.choices[option.currentIndex];
    return GestureDetector(
      onTap: () {
        setState(() => _settingsSelected = index);
        _openPicker(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0x333F8CFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? const Color(0xFF3F8CFF) : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Icon(
              Icons.chevron_left,
              size: 18,
              color: option.currentIndex > 0 ? Colors.white54 : Colors.white12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                choice.label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 18,
              color: option.currentIndex < option.choices.length - 1
                  ? Colors.white54
                  : Colors.white12,
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
                  duration: const Duration(seconds: 5),
                  builder: (_, value, _) => CircularProgressIndicator(
                    value: value,
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _l10n?.gameHoldToOpenMenu ?? 'Hold to open menu',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    final items = _actions();
    final selected = _selected.clamp(0, items.length - 1);
    return _modalScrim(
      maxWidth: 340,
      onDismiss: _closeOverlay,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.gameName ?? 'Game',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _l10n?.gamePaused ?? 'Paused',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white12),
          Flexible(
            child: ListView.builder(
              controller: _overlayScroll,
              shrinkWrap: true,
              itemExtent: _rowExtent,
              padding: const EdgeInsets.symmetric(vertical: 6),
              itemCount: items.length,
              itemBuilder: (context, i) =>
                  _overlayRow(items[i], i == selected, i),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overlayRow(_OverlayItem item, bool selected, int index) {
    final color = item.danger ? const Color(0xFFFF9D9D) : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() => _selected = index);
        item.onSelect();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF3F8CFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(item.icon, size: 20, color: selected ? Colors.white : color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: TextStyle(
                  color: selected ? Colors.white : color,
                  fontSize: 15,
                ),
              ),
            ),
            if (item.trailing != null)
              Text(
                item.trailing!,
                style: TextStyle(
                  color: selected ? Colors.white70 : Colors.white38,
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _OverlayItem {
  const _OverlayItem(
    this.icon,
    this.label,
    this.trailing,
    this.onSelect, {
    this.danger = false,
  });

  final IconData icon;
  final String label;
  final String? trailing;
  final VoidCallback onSelect;
  final bool danger;
}

class _GameChoice {
  const _GameChoice(this.value, this.label);
  final String value;
  final String label;
}

class _GameOption {
  _GameOption({
    required this.id,
    required this.label,
    required this.choices,
    required this.currentIndex,
  });

  final String id;
  final String label;
  final List<_GameChoice> choices;
  int currentIndex;
}

enum _Gp { up, down, left, right, confirm, cancel, start, select, other }

_Gp _semanticFromEmulatorLabel(String label) => switch (label) {
  'DPAD_UP' => _Gp.up,
  'DPAD_DOWN' => _Gp.down,
  'DPAD_LEFT' => _Gp.left,
  'DPAD_RIGHT' => _Gp.right,
  'BUTTON_2' => _Gp.confirm,
  'BUTTON_1' => _Gp.cancel,
  'START' => _Gp.start,
  'SELECT' => _Gp.select,
  _ => _Gp.other,
};

/// JS-forwarded source: browser Gamepad API standard-mapping button indices.
_Gp _semanticFromStandard(int index) {
  switch (index) {
    case 12:
      return _Gp.up;
    case 13:
      return _Gp.down;
    case 14:
      return _Gp.left;
    case 15:
      return _Gp.right;
    case 0:
      return _Gp.confirm;
    case 1:
      return _Gp.cancel;
    case 9:
      return _Gp.start;
    case 8:
      return _Gp.select;
    default:
      return _Gp.other;
  }
}
