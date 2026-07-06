import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../widgets/adaptive/adaptive_glass.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';

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
    this.biosId,
    this.gameName,
    this.startFresh = false,
  });

  final String libraryId;
  final String gameId;
  final String core;
  final String? biosId;
  final String? gameName;

  /// Restart: boot without auto-loading the save state (the save is overwritten on exit
  /// as usual). Continue/Play leave this false and resume from any existing save.
  final bool startFresh;

  @override
  State<GameEmulatorScreen> createState() => _GameEmulatorScreenState();
}

class _GameEmulatorScreenState extends State<GameEmulatorScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  InAppWebViewController? _controller;

  String? _playerUrl;
  String? _error;
  bool _emulatorReady = false;
  bool _saving = false;
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

  // Open-overlay gesture: hold Start+Select for 5 seconds.
  bool _startHeld = false;
  bool _selectHeld = false;
  Timer? _comboTimer;

  // Android delivers hardware-gamepad events to the focused WebView (hybrid composition), not
  // to Flutter, and the System WebView does not expose the browser Gamepad API, so the native
  // Activity forwards buttons over this channel while the screen is active. iOS/desktop WebViews
  // DO expose the Gamepad API, so player.html forwards those buttons via the moonfinPlayer
  // handler instead. Both feed `_handleGamepad`.
  static const MethodChannel _gamepadChannel =
      MethodChannel('org.moonfin.androidtv/gamepad');

  @override
  void initState() {
    super.initState();
    _enterImmersive();
    WakelockPlus.enable();
    if (PlatformDetection.isAndroid) {
      _gamepadChannel.setMethodCallHandler(_onNativeGamepad);
      _gamepadChannel.invokeMethod('setActive', {'active': true});
    }
    _prepare();
  }

  Future<dynamic> _onNativeGamepad(MethodCall call) async {
    if (call.method != 'onButton') return null;
    final args = (call.arguments as Map).cast<String, dynamic>();
    final index = args['index'] as int;
    final pressed = args['pressed'] as bool;
    // Native source uses RetroPad indices, which double as the injection index in-game.
    _handleGamepad(_semanticFromRetroPad(index), pressed,
        injectIndex: index, canInject: true);
    return null;
  }

  Future<void> _prepare() async {
    final games = _client.gamesApi;
    if (games == null) {
      setState(() => _error = 'This server does not support games.');
      return;
    }

    // On TV and desktop the on-screen touch gamepad is useless, and EmulatorJS wrongly enables
    // it on Android TV (which reports a mobile user agent). Disable it by default there.
    if (PlatformDetection.isTV || PlatformDetection.useDesktopUi) {
      _userScripts.add(UserScript(
        source:
            "window.EJS_defaultOptions = Object.assign({}, window.EJS_defaultOptions, {'virtual-gamepad': 'disabled'});",
        injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
      ));
    }

    var hasSave = false;
    try {
      final existing = await games.getSave(widget.gameId);
      hasSave = existing != null && existing.isNotEmpty;
    } catch (_) {}
    _hasSave = hasSave;

    // Restore synced EmulatorJS settings into localStorage before the emulator initializes.
    try {
      final settings = await games.getSave(_settingsId, kind: 'settings');
      if (settings != null && settings.isNotEmpty) {
        final json = utf8.decode(settings);
        _userScripts.add(UserScript(
          source: "try { localStorage.setItem('ejs-settings', ${jsonEncode(json)}); } catch (e) {}",
          injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
        ));
      }
    } catch (_) {}

    final url = games.playerUrl(
      libraryId: widget.libraryId,
      gameId: widget.gameId,
      core: widget.core,
      biosId: widget.biosId,
      gameName: widget.gameName,
      // Auto-load only when resuming and a save exists (avoids a 404 fetch otherwise).
      includeSaveUrl: hasSave && !widget.startFresh,
    );

    if (!mounted) return;
    setState(() => _playerUrl = url);
  }

  void _enterImmersive() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (!PlatformDetection.isTV) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  Future<void> _restoreSystemUi() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  void _onPlayerMessage(List<dynamic> args) {
    if (args.isEmpty) return;
    final message = args.first;
    if (message is! Map) return;
    switch (message['type']) {
      case 'moonfin-ready':
        if (mounted) setState(() => _emulatorReady = true);
        break;
      case 'gamepad':
        // JS-forwarded (iOS/desktop): standard Gamepad API indices; gameplay is read natively
        // by EmulatorJS, so this drives only the overlay, never injection.
        final index = message['index'] as int;
        final pressed = message['pressed'] as bool;
        _handleGamepad(_semanticFromStandard(index), pressed, canInject: false);
        break;
    }
  }

  void _handleGamepad(_Gp sem, bool pressed, {int? injectIndex, required bool canInject}) {
    if (sem == _Gp.start || sem == _Gp.select) {
      if (sem == _Gp.start) _startHeld = pressed;
      if (sem == _Gp.select) _selectHeld = pressed;
      _updateCombo();
      if (mounted) setState(() {});
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
        case _Gp.confirm:
          _changeOption(1);
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

    if (canInject && injectIndex != null) {
      // Suppress Start/Select while the open-combo is held so the game never sees a 5s Start.
      final suppress =
          _startHeld && _selectHeld && (sem == _Gp.start || sem == _Gp.select);
      if (!suppress) {
        _controller?.evaluateJavascript(
          source: 'window.moonfinInput && window.moonfinInput($injectIndex, $pressed);',
        );
      }
    }
  }

  bool get _menuOpen => _overlayOpen || _settingsOpen;

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
        source: 'window.moonfinPause && window.moonfinPause(true);');
  }

  void _closeOverlay() {
    if (!_overlayOpen) return;
    setState(() => _overlayOpen = false);
    _controller?.evaluateJavascript(
        source: 'window.moonfinPause && window.moonfinPause(false);');
  }

  void _move(int dir) {
    final n = _actions().length;
    setState(() => _selected = (_selected + dir + n) % n);
    _ensureVisible(_overlayScroll, _selected);
  }

  void _activate() {
    final items = _actions();
    if (_selected >= 0 && _selected < items.length) items[_selected].onSelect();
  }

  List<_OverlayItem> _actions() {
    final l = _l10n;
    return [
      _OverlayItem(Icons.play_arrow, l?.resume ?? 'Resume', null, _closeOverlay),
      _OverlayItem(Icons.save_outlined, l?.gameSaveState ?? 'Save state', null, _saveAction),
      if (_hasSave)
        _OverlayItem(Icons.download_outlined, l?.gameLoadState ?? 'Load state', null, _loadAction),
      _OverlayItem(Icons.refresh, l?.restart ?? 'Restart', null, _restartAction),
      _OverlayItem(
        Icons.fast_forward,
        l?.gameFastForward ?? 'Fast-forward',
        _fastForward ? 'On' : 'Off',
        _toggleFastForward,
      ),
      _OverlayItem(Icons.tune, l?.gameEmulatorSettings ?? 'Emulator settings', null, _openSettings),
      _OverlayItem(Icons.close, l?.exit ?? 'Exit', null, _exit, danger: true),
    ];
  }

  Future<void> _openSettings() async {
    final controller = _controller;
    if (controller == null) return;
    var options = <_GameOption>[];
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody: 'return window.moonfinGetOptions ? window.moonfinGetOptions() : "[]";',
      );
      final value = result?.value;
      if (value is String && value.isNotEmpty) {
        options = _parseOptions(value);
      }
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _options = options;
      _settingsSelected = 0;
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
    if (_options.isEmpty) return;
    final n = _options.length;
    setState(() => _settingsSelected = (_settingsSelected + dir + n) % n);
    _ensureVisible(_settingsScroll, _settingsSelected);
  }

  /// Keeps the selected row on screen; these lists are index-driven (not Flutter focus), so
  /// they do not auto-scroll on their own.
  void _ensureVisible(ScrollController controller, int index) {
    if (!controller.hasClients) return;
    final pos = controller.position;
    final top = index * _rowExtent;
    final bottom = top + _rowExtent;
    double target = pos.pixels;
    if (top < pos.pixels) {
      target = top;
    } else if (bottom > pos.pixels + pos.viewportDimension) {
      target = bottom - pos.viewportDimension;
    }
    target = target.clamp(pos.minScrollExtent, pos.maxScrollExtent);
    if (target != pos.pixels) {
      controller.animateTo(
        target,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    }
  }

  void _changeOption(int dir) {
    if (_options.isEmpty) return;
    final option = _options[_settingsSelected];
    if (option.choices.isEmpty) return;
    final next = (option.currentIndex + dir).clamp(0, option.choices.length - 1);
    if (next == option.currentIndex) return;
    setState(() => option.currentIndex = next);
    final choice = option.choices[next];
    _controller?.evaluateJavascript(
      source: "window.moonfinSetOption && window.moonfinSetOption("
          "${jsonEncode(option.id)}, ${jsonEncode(choice.value)});",
    );
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
          choices.add(_GameChoice(
            (c['value'] as String?) ?? '',
            (c['label'] as String?) ?? '',
          ));
        }
      }
      if (choices.isEmpty) continue;
      final current = entry['current'] as String?;
      var currentIndex = choices.indexWhere((c) => c.value == current);
      if (currentIndex < 0) currentIndex = 0;
      result.add(_GameOption(
        id: (entry['id'] as String?) ?? '',
        label: (entry['label'] as String?) ?? '',
        choices: choices,
        currentIndex: currentIndex,
      ));
    }
    return result;
  }

  Future<void> _saveAction() async {
    await _saveState();
    _closeOverlay();
  }

  Future<void> _loadAction() async {
    final games = _client.gamesApi;
    if (games != null) {
      try {
        final bytes = await games.getSave(widget.gameId);
        if (bytes != null && bytes.isNotEmpty) {
          final b64 = base64.encode(bytes);
          await _controller?.evaluateJavascript(
            source: "window.moonfinLoadState && window.moonfinLoadState('$b64');",
          );
        }
      } catch (_) {}
    }
    _closeOverlay();
  }

  void _restartAction() {
    _controller?.evaluateJavascript(
        source: 'window.moonfinRestart && window.moonfinRestart();');
    _closeOverlay();
  }

  void _toggleFastForward() {
    setState(() => _fastForward = !_fastForward);
    _controller?.evaluateJavascript(
      source: 'window.moonfinFastForward && window.moonfinFastForward($_fastForward);',
    );
  }

  /// Pulls the current save state out of EmulatorJS and PUTs it to the server.
  Future<void> _saveState() async {
    final controller = _controller;
    final games = _client.gamesApi;
    if (controller == null || games == null || !_emulatorReady) return;

    try {
      final result = await controller.callAsyncJavaScript(
        functionBody: 'return window.moonfinGetState ? window.moonfinGetState() : null;',
      );
      final value = result?.value;
      if (value is String && value.isNotEmpty) {
        final bytes = base64.decode(value);
        await games.putSave(widget.gameId, bytes);
      }
    } catch (_) {}
  }

  /// Reads EmulatorJS's settings out of the WebView and syncs them to the server (per user).
  Future<void> _saveSettings() async {
    final controller = _controller;
    final games = _client.gamesApi;
    if (controller == null || games == null) return;
    try {
      final result = await controller.callAsyncJavaScript(
        functionBody: 'return window.moonfinGetSettings ? window.moonfinGetSettings() : null;',
      );
      final value = result?.value;
      if (value is String && value.isNotEmpty) {
        await games.putSave(_settingsId, utf8.encode(value), kind: 'settings');
      }
    } catch (_) {}
  }

  Future<void> _exit() async {
    if (_saving) return;
    _saving = true;
    await _saveState();
    await _saveSettings();
    await _restoreSystemUi();
    await WakelockPlus.disable();
    if (mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _comboTimer?.cancel();
    _settingsScroll.dispose();
    _overlayScroll.dispose();
    if (PlatformDetection.isAndroid) {
      _gamepadChannel.invokeMethod('setActive', {'active': false});
      _gamepadChannel.setMethodCallHandler(null);
    }
    // Best-effort restore if disposed without going through _exit (e.g. system pop).
    _restoreSystemUi();
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        // Back / Esc toggles the menu (a remote with no Start+Select reaches it this way).
        if (_overlayOpen) {
          _closeOverlay();
        } else {
          _openOverlay();
        }
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
              InAppWebView(
                key: const ValueKey('game-emulator-webview'),
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
              ),
            if (_comboActive) _buildHoldIndicator(),
            // Menu button for touch/mouse users (opens the same overlay).
            Positioned(
              top: 8,
              left: 8,
              child: SafeArea(
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
            if (_overlayOpen) _buildOverlay(),
            if (_settingsOpen) _buildSettings(),
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
                      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: cap),
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
                  onTap: _closeSettings,
                  child: const Icon(Icons.close, color: Colors.white54, size: 20),
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
                      _l10n?.gameNoCoreOptions ?? 'This core has no adjustable options.',
                      style: const TextStyle(color: Colors.white54, fontSize: 13),
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

  Widget _settingsRow(_GameOption option, bool selected, int index) {
    final choice = option.choices[option.currentIndex];
    return GestureDetector(
      onTap: () {
        setState(() => _settingsSelected = index);
        _changeOption(1);
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
            Icon(Icons.chevron_left,
                size: 18,
                color: option.currentIndex > 0 ? Colors.white54 : Colors.white12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                choice.label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            Icon(Icons.chevron_right,
                size: 18,
                color: option.currentIndex < option.choices.length - 1
                    ? Colors.white54
                    : Colors.white12),
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
                Text(_l10n?.gamePaused ?? 'Paused',
                    style: const TextStyle(color: Colors.white54, fontSize: 12)),
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
              itemBuilder: (context, i) => _overlayRow(items[i], i == selected, i),
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
  const _OverlayItem(this.icon, this.label, this.trailing, this.onSelect,
      {this.danger = false});

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

/// Native Android source: MainActivity forwards libretro RetroPad indices.
_Gp _semanticFromRetroPad(int index) {
  switch (index) {
    case 4:
      return _Gp.up;
    case 5:
      return _Gp.down;
    case 6:
      return _Gp.left;
    case 7:
      return _Gp.right;
    case 0:
      return _Gp.confirm;
    case 8:
      return _Gp.cancel;
    case 3:
      return _Gp.start;
    case 2:
      return _Gp.select;
    default:
      return _Gp.other;
  }
}

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
