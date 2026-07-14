import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../playback/native_game_player.dart';
import '../../../util/game_cores.dart';

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

  String get _stateKey => gameStateKey(widget.gameId);

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

  // Keyboard gameplay on Windows and Linux: keys map to RetroPad bits and the
  // combined mask is sent to the core.
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

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _events = _player.events.listen(_onEvent);
    _prepare();
  }

  @override
  void dispose() {
    _events?.cancel();
    WakelockPlus.disable();
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
        if (count == 0) {
          _player.pause();
        } else {
          _player.resume();
        }
      case 'menuPressed':
        _toggleOverlay();
      case 'remotePress':
        _onRemotePress(event['key']?.toString());
      case 'button':
        if (_overlayOpen && (event['pressed'] as bool? ?? false)) {
          _nav(_navForButton((event['index'] as num?)?.toInt() ?? -1));
        }
      case 'error':
        if (mounted) {
          setState(() => _error = event['message']?.toString() ?? 'Error');
        }
    }
  }

  // Mirrored RetroPad indices: 0=confirm (bottom face), 4=up, 5=down, 6=left, 7=right.
  String? _navForButton(int index) => const {
        4: 'up',
        5: 'down',
        6: 'left',
        7: 'right',
        0: 'confirm',
      }[index];

  void _onRemotePress(String? key) => _nav(key == 'select' ? 'confirm' : key);

  // Desktop keyboard: Escape opens the overlay, arrows and Enter drive it while
  // open, and everything else feeds the RetroPad mask to the core.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
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
    _player.setInput(0, _keyboardMask);
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
              'The core for this system is not installed. Add it in Settings, under Emulator Cores.');
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

      final cacheRoot = await getApplicationCacheDirectory();
      final gamesRoot = Directory('${cacheRoot.path}/games');
      final systemDir = Directory('${gamesRoot.path}/system');
      final saveDir = Directory('${gamesRoot.path}/saves');
      final cacheDir = Directory(
          '${gamesRoot.path}/cache/${widget.libraryId}/${widget.gameId}');
      for (final dir in [systemDir, saveDir, cacheDir]) {
        await dir.create(recursive: true);
      }

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
    if (_settingsOpen) {
      setState(() => _settingsOpen = false);
      return;
    }
    if (_overlayOpen) {
      _closeOverlay();
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
    });
    _player.resume();
  }

  void _moveSelection(int delta) {
    final count = _settingsOpen ? _options.length : _actions().length;
    if (count == 0) return;
    final next = ((_settingsOpen ? _settingsSelected : _selected) + delta) % count;
    setState(() {
      final wrapped = next < 0 ? next + count : next;
      if (_settingsOpen) {
        _settingsSelected = wrapped;
      } else {
        _selected = wrapped;
      }
    });
  }

  void _confirm() {
    if (_settingsOpen) return;
    _actions()[_selected].onSelect();
  }

  void _changeValue(int delta) {
    if (!_settingsOpen || _options.isEmpty) return;
    final opt = _options[_settingsSelected];
    if (opt.choices.length < 2) return;
    var idx = opt.choices.indexOf(opt.current) + delta;
    idx %= opt.choices.length;
    if (idx < 0) idx += opt.choices.length;
    final value = opt.choices[idx];
    _player.setOption(opt.id, value);
    setState(() {
      _options[_settingsSelected] = GameCoreOption(
        id: opt.id,
        label: opt.label,
        current: value,
        choices: opt.choices,
      );
    });
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
    if (mounted) context.pop();
  }

  // Leaves the loading or error screen without the save-on-exit that a running
  // game does.
  void _backOut() {
    unawaited(_player.stop());
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = _buildScaffold(context);
    if (!usesKeyboardInput) return scaffold;
    return Focus(autofocus: true, onKeyEvent: _onKey, child: scaffold);
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
          if (_textureId != null && _controllers == 0 && !_overlayOpen)
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
          if (_overlayOpen) _buildOverlay(),
        ],
      ),
    );
  }

  Widget _buildOverlay() {
    final title = _settingsOpen ? 'Emulator settings' : (widget.gameName ?? 'Paused');
    final rows = _settingsOpen
        ? _options
            .asMap()
            .entries
            .map((e) => _overlayRow(
                  '${e.value.label}:  ${e.value.current}',
                  e.key == _settingsSelected,
                ))
            .toList()
        : _actions()
            .asMap()
            .entries
            .map((e) => _overlayRow(e.value.label, e.key == _selected))
            .toList();

    return Container(
      color: Colors.black.withValues(alpha: 0.72),
      alignment: Alignment.center,
      child: Container(
        width: 520,
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
              padding: const EdgeInsets.only(bottom: 16, left: 12),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_settingsOpen && _options.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'This core has no adjustable options.',
                  style: TextStyle(color: Colors.white54, fontSize: 20),
                ),
              )
            else
              ...rows,
          ],
        ),
      ),
    );
  }

  Widget _overlayRow(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontSize: 22,
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
