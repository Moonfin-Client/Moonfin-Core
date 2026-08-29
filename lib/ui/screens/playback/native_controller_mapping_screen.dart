import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamepads/gamepads.dart';

import '../../../util/focus/gamepad/controller_diagnostics.dart';
import '../../../util/focus/gamepad/controller_diagnostics_source.dart';
import '../../../util/focus/gamepad/controller_mapping_capture.dart';
import '../../../util/core_input_descriptors.dart';
import '../../../util/native_controller_mapping.dart';
import '../../../util/native_controller_player_assignments.dart';
import 'controller_test_panel.dart';

/// A privacy-safe physical controller identifier. On Android it comes from the
/// gamepad channel and is stable across reconnects and never a raw descriptor;
/// on Windows and Linux it is a namespaced gamepads-package controller id (see
/// [desktopControllerDeviceId]).
class NativeControllerDevice {
  const NativeControllerDevice({
    required this.id,
    required this.name,
    this.connectionId,
    this.port,
    this.supported = true,
    this.deviceClass = NativeControllerDeviceClass.gamepad,
    this.assignable = true,
    this.pinned = false,
  });

  final String id;
  final String name;
  final String? connectionId;
  final int? port;
  final bool supported;
  final NativeControllerDeviceClass deviceClass;

  /// Whether the user may give this device a player slot. A remote may not.
  final bool assignable;

  /// True only while the device sits in the player slot the user chose, so a
  /// pad borrowing an absent pad's slot reads as unpinned, not silently
  /// repinned.
  final bool pinned;

  String get runtimeId => connectionId ?? id;

  String get portLabel {
    if (!supported || port == null || port! < 0) return 'Unassigned';
    return 'Player ${port! + 1}';
  }

  /// The device's live role, as shown to the user.
  String get playerLabel {
    if (!supported || port == null || port! < 0) {
      // A remote or unpinned keyboard holds no port but still drives menus.
      return deviceClass == NativeControllerDeviceClass.gamepad
          ? 'Unassigned'
          : 'Menu & navigation';
    }
    return pinned ? 'Player ${port! + 1} · pinned' : 'Player ${port! + 1}';
  }

  factory NativeControllerDevice.fromMap(Map<String, dynamic> map) {
    final deviceClass = switch (map['deviceClass']?.toString()) {
      'keyboard' => NativeControllerDeviceClass.keyboard,
      'remote' => NativeControllerDeviceClass.remote,
      _ => NativeControllerDeviceClass.gamepad,
    };
    return NativeControllerDevice(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? 'Android gamepad',
      connectionId: map['connectionId']?.toString(),
      port: (map['port'] as num?)?.toInt(),
      supported: map['supported'] is bool ? map['supported'] as bool : true,
      deviceClass: deviceClass,
      // Older native builds send neither key; default to "not a remote" to
      // preserve prior behaviour.
      assignable: map['assignable'] is bool
          ? map['assignable'] as bool
          : deviceClass != NativeControllerDeviceClass.remote,
      pinned: map['pinned'] is bool ? map['pinned'] as bool : false,
    );
  }
}

/// What kind of input device this is, as classified natively.
enum NativeControllerDeviceClass { gamepad, keyboard, remote }

/// D-pad-navigable native RetroPad remapping panel.
///
/// The surrounding native game overlay owns pause/resume and forwards its
/// libretro button events through [handleButton]. Android sends a separate raw
/// key event only while this widget is waiting to capture a binding.
class NativeControllerMappingScreen extends StatefulWidget {
  const NativeControllerMappingScreen({
    super.key,
    required this.devices,
    required this.mappings,
    required this.onMappingChanged,
    this.coreId = '',
    this.controllerTypesByPort = const {},
    this.onControllerTypeChanged,
    this.onCopyMapping,
    this.assignments = NativeControllerPlayerAssignments.empty,
    this.onAssignmentChanged,
    this.inputDescriptors = CoreInputDescriptors.empty,
    this.gameId = '',
    required this.onClose,
  });

  final List<NativeControllerDevice> devices;
  final Map<String, NativeControllerMapping> mappings;
  final Future<void> Function(String deviceId, NativeControllerMapping mapping)
  onMappingChanged;
  final String coreId;
  final Map<int, List<CoreControllerType>> controllerTypesByPort;
  final Future<void> Function(String deviceId, int deviceType)?
  onControllerTypeChanged;
  final Future<void> Function(String sourceDeviceId)? onCopyMapping;
  final NativeControllerPlayerAssignments assignments;
  final Future<void> Function(NativeControllerPlayerAssignments assignments)?
  onAssignmentChanged;

  /// What the running core calls each button, when it says so at all.
  final CoreInputDescriptors inputDescriptors;

  /// Keys the per-game stick snap setting.
  final String gameId;

  final VoidCallback onClose;

  @override
  State<NativeControllerMappingScreen> createState() =>
      NativeControllerMappingScreenState();
}

class NativeControllerMappingScreenState
    extends State<NativeControllerMappingScreen> {
  static const _rowExtent = 58.0;

  final ScrollController _scroll = ScrollController();
  int _selected = 0;
  int _deviceIndex = 0;
  bool _confirmingCopy = false;
  int _copySelected = 0;
  bool _confirmingReset = false;
  int _resetSelected = 0;
  bool _choosingControllerType = false;
  int _controllerTypeSelected = 0;
  bool _choosingPlayer = false;
  int _playerSelected = 0;
  RetroPadButton? _capturing;
  late NativeControllerMapping _mapping;
  final ControllerMappingCapture? _capture =
      ControllerMappingCapture.forPlatform();
  final ControllerDiagnosticsSource? _diagnostics =
      ControllerDiagnosticsSource.forPlatform();
  bool _testingController = false;
  ControllerDiagnosticsSnapshot? _diagnosticsSnapshot;
  Timer? _testExitTimer;
  final Stopwatch _testExitElapsed = Stopwatch();
  double _testExitProgress = 0;

  /// Long enough that it cannot be hit by accident while testing the B button,
  /// which is the whole point of the gesture. The panel shows a countdown ring
  /// so the wait is visible rather than a guess.
  static const Duration _testExitHold = Duration(seconds: 4);
  static const Duration _testExitTick = Duration(milliseconds: 50);

  NativeControllerDevice? get _device =>
      widget.devices.isEmpty ? null : widget.devices[_deviceIndex];
  List<CoreControllerType> get _supportedControllerTypes {
    final port = _device?.port;
    if (port == null) return const [];
    final seenIds = <int>{};
    return (widget.controllerTypesByPort[port] ?? const [])
        .where((type) => type.isSupportedForCore(widget.coreId))
        .where((type) => seenIds.add(type.id))
        .toList(growable: false);
  }

  List<CoreControllerType> get _alternateControllerTypes =>
      _supportedControllerTypes
          .where((type) => !type.isCoreDefault)
          .toList(growable: false);

  bool get _showsControllerTypeSelector => _alternateControllerTypes.isNotEmpty;

  /// A remote gets no selector, rather than one that always refuses.
  bool get _showsPlayerSelector =>
      _device?.assignable == true && widget.onAssignmentChanged != null;

  int get _playerRow => 1;
  int get _controllerTypeRow => 1 + (_showsPlayerSelector ? 1 : 0);
  int get _snapRow =>
      _controllerTypeRow + (_showsControllerTypeSelector ? 1 : 0);
  int get _buttonStartRow => _snapRow + 1;
  int get _copyRow => _buttonStartRow + RetroPadButton.values.length;

  /// Hidden entirely rather than shown disabled when no platform source
  /// exists (Android for now, Apple permanently) -- a dead row invites the
  /// user to wonder why it does nothing.
  bool get _showsTestRow => _diagnostics != null;
  int get _testRow => _copyRow + 1;
  int get _resetRow => _testRow + (_showsTestRow ? 1 : 0);
  int get _rowCount => _resetRow + 1;
  int get _copyConfirmRow => 0;
  int get _copyCancelRow => 1;
  int get _resetConfirmRow => 0;
  int get _resetCancelRow => 1;

  List<String> get _copyTargets => widget.devices
      .where((device) => device.supported && device.port != null)
      .map((device) => device.id)
      .where((id) => id != _device?.id)
      .toSet()
      .toList(growable: false);

  bool get _canCopy =>
      _device?.supported == true &&
      _device?.port != null &&
      _copyTargets.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadSelectedDevice();
    _capture?.attach(_onCaptured);
    _diagnostics?.attach(_onDiagnosticsSnapshot);
  }

  @override
  void dispose() {
    // Nothing may stream while the panel is closed -- end() before dispose(),
    // mirroring the design's lifecycle requirement.
    _cancelTestExitHold();
    unawaited(_diagnostics?.end());
    _diagnostics?.dispose();
    _capture?.dispose();
    _scroll.dispose();
    super.dispose();
  }

  /// The device list can now change while this panel is open: Android's
  /// InputDeviceListener invalidates it on connect/disconnect, and a
  /// controller can drop mid-remap. Keep [_deviceIndex] valid, and if the
  /// device the user had selected is still present (just moved), follow it
  /// rather than resetting to whatever is now first. If it's gone, clamp to
  /// a neighbouring index — the row 0 label re-renders with the new device's
  /// name, so the switch is visible rather than silent.
  @override
  void didUpdateWidget(covariant NativeControllerMappingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.devices, widget.devices)) {
      final device = _device;
      if (_capturing == null &&
          device != null &&
          oldWidget.mappings[device.id] != widget.mappings[device.id]) {
        _loadSelectedDevice();
      }
      return;
    }

    final previousDevice = _deviceIndex < oldWidget.devices.length
        ? oldWidget.devices[_deviceIndex]
        : null;
    final matchedIndex = previousDevice == null
        ? -1
        : widget.devices.indexWhere(
            (d) => d.runtimeId == previousDevice.runtimeId,
          );
    if (matchedIndex != -1) {
      _deviceIndex = matchedIndex;
    } else if (widget.devices.isEmpty) {
      _deviceIndex = 0;
    } else {
      _deviceIndex = _deviceIndex.clamp(0, widget.devices.length - 1);
    }
    _loadSelectedDevice();
  }

  void _loadSelectedDevice() {
    _mapping = _device == null
        ? NativeControllerMapping.empty
        : widget.mappings[_device!.id] ?? NativeControllerMapping.empty;
  }

  /// Steps back one level *inside* this screen, returning true when it consumed
  /// the Back press.
  ///
  /// The host overlay treats this whole screen as one level, so without this,
  /// Back from the capture prompt would close the screen entirely instead of
  /// returning to the button list. It's also the only way out of an armed
  /// capture, since a pad press while armed binds rather than cancels.
  bool handleBack() {
    if (_testingController) {
      _closeTestPanel();
      return true;
    }
    if (_capturing != null) {
      setState(() => _capturing = null);
      unawaited(_capture?.end());
      return true;
    }
    if (_choosingPlayer) {
      setState(() => _choosingPlayer = false);
      _revealRow(_selected);
      return true;
    }
    if (_choosingControllerType) {
      setState(() => _choosingControllerType = false);
      _revealRow(_selected);
      return true;
    }
    if (_confirmingCopy) {
      setState(() => _confirmingCopy = false);
      return true;
    }
    if (_confirmingReset) {
      _cancelReset();
      return true;
    }
    return false;
  }

  /// Called by the native player screen for standard RetroPad overlay input.
  void handleButton(int index, bool pressed) {
    // Checked before the `!pressed` guard below: the panel needs the RELEASE
    // edge too, to cancel a hold that did not run long enough.
    if (_testingController) {
      // This is a controller TEST screen, so every button must be reportable --
      // including B. A short B press is therefore shown like any other button
      // and only a hold leaves, mirroring the Start-hold gesture used during
      // gameplay. Everything else is swallowed rather than reaching the core,
      // per the design's second invariant.
      if (index == 8) {
        if (pressed) {
          _beginTestExitHold();
        } else {
          _cancelTestExitHold();
        }
      }
      return;
    }
    if (!pressed || _capturing != null) return;
    if (_choosingControllerType) {
      switch (index) {
        case 4:
          _moveControllerType(-1);
        case 5:
          _moveControllerType(1);
        case 0:
          _applyControllerType();
        case 8:
          setState(() => _choosingControllerType = false);
      }
      return;
    }
    if (_choosingPlayer) {
      switch (index) {
        case 4:
          _movePlayer(-1);
        case 5:
          _movePlayer(1);
        case 0:
          _applyPlayer();
        case 8:
          setState(() => _choosingPlayer = false);
      }
      return;
    }
    if (_confirmingCopy) {
      switch (index) {
        case 4:
        case 5:
          setState(() {
            _copySelected = _copySelected == _copyConfirmRow
                ? _copyCancelRow
                : _copyConfirmRow;
          });
        case 0:
          if (_copySelected == _copyConfirmRow) {
            _confirmCopy();
          } else {
            setState(() => _confirmingCopy = false);
          }
        case 8:
          setState(() => _confirmingCopy = false);
      }
      return;
    }
    if (_confirmingReset) {
      switch (index) {
        case 4:
        case 5:
          setState(() {
            _resetSelected = _resetSelected == _resetConfirmRow
                ? _resetCancelRow
                : _resetConfirmRow;
          });
        case 0:
          if (_resetSelected == _resetConfirmRow) {
            _confirmReset();
          } else {
            _cancelReset();
          }
        case 8:
          _cancelReset();
      }
      return;
    }
    switch (index) {
      case 4:
        _move(-1);
      case 5:
        _move(1);
      case 6:
        _changeDevice(-1);
      case 7:
        _changeDevice(1);
      case 0:
        _activateSelected();
      case 8:
        widget.onClose();
    }
  }

  Future<void> _onCaptured(String deviceId, int code) async {
    final capturing = _capturing;
    final selectedDevice = _device;
    // The device can be switched, or the panel closed, between arming capture
    // and the press arriving; binding to whatever is selected now would attach
    // the press to a controller the user never touched.
    if (capturing == null ||
        selectedDevice == null ||
        deviceId != selectedDevice.runtimeId) {
      return;
    }

    // Scoped to this game, so this does not rewrite every other game.
    final mapping = _mapping.withBindingForGame(widget.gameId, code, capturing);
    if (!mounted) return;
    setState(() {
      _mapping = mapping;
      _capturing = null;
    });
    await _capture?.end();
    await widget.onMappingChanged(selectedDevice.id, mapping);
  }

  void _move(int delta) {
    final next = ((_selected + delta) % _rowCount + _rowCount) % _rowCount;
    setState(() => _selected = next);
    _revealRow(next);
  }

  /// Brings a cursor row into view after the current list has attached.
  ///
  /// Every list shares [_scroll], so a sub-list can inherit an offset that made
  /// sense for the main list (and vice versa). Scheduling this after [setState]
  /// makes the calculation against the list now on screen, rather than the one
  /// it replaced.
  void _revealRow(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scroll.hasClients) return;
      final position = _scroll.position;
      final rowStart = index * _rowExtent;
      final rowEnd = rowStart + _rowExtent;
      final viewportEnd = position.pixels + position.viewportDimension;
      final target = rowStart < position.pixels
          ? rowStart
          : rowEnd > viewportEnd
          ? rowEnd - position.viewportDimension
          : position.pixels;
      final clampedTarget = target
          .clamp(0.0, position.maxScrollExtent)
          .toDouble();
      if ((clampedTarget - position.pixels).abs() < 0.5) return;
      _scroll.animateTo(
        clampedTarget,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    });
  }

  void _changeDevice(int delta) {
    if (widget.devices.length < 2) return;
    final next =
        ((_deviceIndex + delta) % widget.devices.length +
            widget.devices.length) %
        widget.devices.length;
    setState(() {
      _deviceIndex = next;
      _loadSelectedDevice();
    });
  }

  void _activateSelected() {
    if (_selected == 0) {
      _changeDevice(1);
      return;
    }
    if (_showsPlayerSelector && _selected == _playerRow) {
      _beginPlayerSelection();
      return;
    }
    if (_showsControllerTypeSelector && _selected == _controllerTypeRow) {
      _beginControllerTypeSelection();
      return;
    }
    if (_selected == _copyRow) {
      _beginCopy();
      return;
    }
    if (_selected == _snapRow) {
      _cycleSnap();
      return;
    }
    if (_showsTestRow && _selected == _testRow) {
      _beginTestController();
      return;
    }
    if (_selected == _rowCount - 1) {
      _beginReset();
      return;
    }
    final device = _device;
    final capture = _capture;
    if (device == null || capture == null) return;
    final button = RetroPadButton.values[_selected - _buttonStartRow];
    setState(() => _capturing = button);
    unawaited(capture.begin(device.runtimeId));
  }

  void _beginReset() {
    if (_device == null) return;
    setState(() {
      _confirmingReset = true;
      // Cancel is the safe default: a reset cannot be undone.
      _resetSelected = _resetCancelRow;
    });
  }

  void _cancelReset() {
    setState(() => _confirmingReset = false);
    _revealRow(_selected);
  }

  /// Returns this game's buttons to the built-in layout for this controller.
  ///
  /// An empty table is not the same as no entry: no entry inherits the saved
  /// bindings, an empty one says this game deliberately uses none.
  void _confirmReset() {
    final device = _device;
    if (device == null) return;
    final mapping = _mapping.withBindingsForGame(widget.gameId, const {});
    setState(() {
      _mapping = mapping;
      _confirmingReset = false;
    });
    _revealRow(_selected);
    unawaited(widget.onMappingChanged(device.id, mapping));
  }

  void _onDiagnosticsSnapshot(ControllerDiagnosticsSnapshot snapshot) {
    if (!mounted) return;
    setState(() => _diagnosticsSnapshot = _withButtonNames(snapshot));
  }

  /// Completes the naming chain the source cannot: a raw keycode alone is
  /// useless to a player. Only this screen knows the device's bindings and the
  /// core's descriptions, so it resolves them here rather than in the source.
  ///
  /// Any link that cannot be resolved stays null and simply is not rendered.
  ControllerDiagnosticsSnapshot _withButtonNames(
    ControllerDiagnosticsSnapshot snapshot,
  ) {
    return ControllerDiagnosticsSnapshot(
      connectionId: snapshot.connectionId,
      port: snapshot.port ?? _device?.port,
      channels: [
        for (final channel in snapshot.channels)
          if (channel is ButtonChannel && channel.rawCode != null)
            _namedButton(channel)
          else
            channel,
      ],
    );
  }

  ButtonChannel _namedButton(ButtonChannel button) {
    // Prefer the index the platform resolved (it consulted the device's own
    // table, custom binding or default); fall back to this screen's custom
    // bindings when the platform could not say.
    RetroPadButton? retroPad;
    final index = button.retroPadIndex;
    if (index != null) {
      for (final candidate in RetroPadButton.values) {
        if (candidate.retroPadIndex == index) {
          retroPad = candidate;
          break;
        }
      }
    }
    retroPad ??= _mapping.bindingsForGame(widget.gameId)[button.rawCode];
    return ButtonChannel(
      rawCode: button.rawCode,
      rawName: button.rawName,
      retroPadIndex: index,
      retroPad: retroPad?.label,
      label: retroPad == null ? null : _buttonDescription(retroPad),
      pressed: button.pressed,
    );
  }

  /// Drives the hold-to-exit countdown, ticking so the panel can render how
  /// much longer the user has to hold.
  void _beginTestExitHold() {
    if (_testExitTimer != null) return;
    _testExitElapsed
      ..reset()
      ..start();
    _testExitTimer = Timer.periodic(_testExitTick, (_) {
      if (!mounted || !_testingController) {
        _cancelTestExitHold();
        return;
      }
      final progress =
          _testExitElapsed.elapsedMilliseconds / _testExitHold.inMilliseconds;
      if (progress >= 1) {
        _closeTestPanel();
        return;
      }
      setState(() => _testExitProgress = progress);
    });
  }

  /// Cancels a pending hold-to-exit. Called on release and on teardown so a
  /// timer can never outlive the panel.
  void _cancelTestExitHold() {
    _testExitTimer?.cancel();
    _testExitTimer = null;
    _testExitElapsed
      ..stop()
      ..reset();
    if (_testExitProgress != 0 && mounted) {
      setState(() => _testExitProgress = 0);
    } else {
      _testExitProgress = 0;
    }
  }

  void _beginTestController() {
    final device = _device;
    final diagnostics = _diagnostics;
    if (device == null || diagnostics == null) return;
    setState(() {
      _testingController = true;
      _diagnosticsSnapshot = null;
    });
    unawaited(diagnostics.begin(device.runtimeId));
  }

  void _closeTestPanel() {
    _cancelTestExitHold();
    setState(() {
      _testingController = false;
      _diagnosticsSnapshot = null;
    });
    unawaited(_diagnostics?.end());
  }

  void _beginCopy() {
    if (widget.onCopyMapping == null || !_canCopy) return;
    setState(() {
      _confirmingCopy = true;
      _copySelected = _copyConfirmRow;
    });
  }

  void _confirmCopy() {
    final device = _device;
    final callback = widget.onCopyMapping;
    if (device == null || callback == null) return;
    setState(() => _confirmingCopy = false);
    unawaited(callback(device.id));
  }

  /// Null is "no player slot", which for a keyboard means it keeps driving menu
  /// and Player 1 navigation rather than becoming idle.
  List<int?> get _playerChoices => [
    null,
    for (
      var player = 1;
      player <= NativeControllerPlayerAssignments.maxPlayers;
      player++
    )
      player,
  ];

  String _playerChoiceLabel(int? player) {
    if (player != null) return 'Player $player';
    return _device?.deviceClass == NativeControllerDeviceClass.gamepad
        ? 'Unassigned'
        : 'Menu & navigation';
  }

  void _beginPlayerSelection() {
    final device = _device;
    if (!_showsPlayerSelector || device == null) return;
    final current = widget.assignments.playerFor(device.id);
    _playerSelected = _playerChoices.indexOf(current);
    if (_playerSelected < 0) _playerSelected = 0;
    setState(() => _choosingPlayer = true);
    _revealRow(_playerSelected);
  }

  void _movePlayer(int delta) {
    final count = _playerChoices.length;
    final next = ((_playerSelected + delta) % count + count) % count;
    setState(() => _playerSelected = next);
    _revealRow(next);
  }

  void _applyPlayer() {
    final device = _device;
    final callback = widget.onAssignmentChanged;
    if (device == null || callback == null) return;
    final assignments = widget.assignments.withPlayer(
      device.id,
      _playerChoices[_playerSelected],
    );
    setState(() => _choosingPlayer = false);
    _revealRow(_selected);
    unawaited(callback(assignments));
  }

  List<CoreControllerType?> get _controllerTypeChoices => [
    null,
    ..._alternateControllerTypes,
  ];

  String get _controllerTypeLabel {
    final selected = _mapping.controllerTypeForCore(widget.coreId);
    return _alternateControllerTypes
            .where((type) => type.id == selected)
            .firstOrNull
            ?.label ??
        'Auto (Core default)';
  }

  void _beginControllerTypeSelection() {
    if (!_showsControllerTypeSelector) return;
    final selected = _mapping.controllerTypeForCore(widget.coreId);
    final choices = _controllerTypeChoices;
    _controllerTypeSelected = choices.indexWhere(
      (type) => type?.id == selected,
    );
    if (_controllerTypeSelected < 0) _controllerTypeSelected = 0;
    setState(() => _choosingControllerType = true);
    _revealRow(_controllerTypeSelected);
  }

  void _moveControllerType(int delta) {
    final count = _controllerTypeChoices.length;
    if (count == 0) return;
    final next = ((_controllerTypeSelected + delta) % count + count) % count;
    setState(() => _controllerTypeSelected = next);
    _revealRow(next);
  }

  static const _snapLabels = {
    StickSnapMode.off: 'Off (analog)',
    StickSnapMode.eightWay: '8-way',
    StickSnapMode.fourWay: '4-way',
  };

  String get _snapSubtitle {
    final mode = _mapping.snapForGame(widget.gameId);
    final label = _snapLabels[mode] ?? 'Off (analog)';
    return mode == StickSnapMode.off
        ? '$label - this game only'
        : '$label - this game and controller';
  }

  /// Whether these buttons are the built-in layout or something the user
  /// changed. Reads the bindings in effect, because a reset stores an empty
  /// table, which is still an entry.
  String get _bindingScopeSubtitle =>
      _mapping.bindingsForGame(widget.gameId).isEmpty
      ? 'Default layout'
      : 'Customised for this game';

  void _cycleSnap() {
    final device = _device;
    if (device == null || widget.gameId.isEmpty) return;
    const order = StickSnapMode.values;
    final current = _mapping.snapForGame(widget.gameId);
    final next = order[(order.indexOf(current) + 1) % order.length];
    final mapping = _mapping.withSnap(widget.gameId, next);
    setState(() => _mapping = mapping);
    unawaited(widget.onMappingChanged(device.id, mapping));
  }

  void _applyControllerType() {
    final device = _device;
    final callback = widget.onControllerTypeChanged;
    if (device == null || callback == null) return;
    final type = _controllerTypeChoices[_controllerTypeSelected];
    final deviceType = type?.id ?? retroDeviceJoypad;
    setState(() {
      _mapping = _mapping.withControllerType(widget.coreId, deviceType);
      _choosingControllerType = false;
    });
    _revealRow(_selected);
    unawaited(callback(device.id, deviceType));
  }

  /// How a stored binding is described back to the user.
  ///
  /// A bare "Key code 97" is the best that can be said of an Android keycode,
  /// but a desktop binding was captured as a known button and deserves its
  /// name. [desktopGamepadButtonsByCode] returning null is what distinguishes
  /// the two, so no platform check is needed here.
  /// Synthetic codes for the analog triggers, which arrive as axes rather than
  /// key events and so could not be bound at all before. Kept well clear of the
  /// real Android keycode range; see NativePadInput's SYNTHETIC_KEYCODE_*.
  static const int _syntheticL2 = 0x10012;
  static const int _syntheticR2 = 0x10013;

  /// TV-remote media keys are now bindable alongside gamepad buttons, and a
  /// bare "Key code 85" means nothing to a user holding a remote.
  static const Map<int, String> _androidKeycodeNames = {
    19: 'D-pad up',
    20: 'D-pad down',
    21: 'D-pad left',
    22: 'D-pad right',
    23: 'D-pad centre',
    66: 'Enter',
    111: 'Escape',
    82: 'Menu',
    85: 'Play/Pause',
    86: 'Stop',
    87: 'Next',
    88: 'Previous',
    89: 'Rewind',
    90: 'Fast forward',
    126: 'Play',
    127: 'Pause',
    130: 'Record',
    165: 'Info',
    166: 'Channel up',
    167: 'Channel down',
    170: 'TV',
    172: 'Guide',
    173: 'DVR',
    174: 'Bookmark',
    175: 'Captions',
    176: 'Settings',
    // Prefixed, because the row above already carries the bare RetroPad name
    // and "A / A" reads as a mistake.
    96: 'Button A',
    97: 'Button B',
    99: 'Button X',
    100: 'Button Y',
    102: 'Button L1',
    103: 'Button R1',
    104: 'Button L2',
    105: 'Button R2',
    106: 'Button L3',
    107: 'Button R3',
    108: 'Button Start',
    109: 'Button Select',
  };

  String _bindingLabel(int? code) {
    if (code == null) return 'Default layout';
    if (code == _syntheticL2) return 'Left trigger (L2)';
    if (code == _syntheticR2) return 'Right trigger (R2)';
    final button = desktopGamepadButtonsByCode[code];
    if (button != null) return _desktopButtonLabel(button);
    final keycodeName = _androidKeycodeNames[code];
    if (keycodeName != null) return keycodeName;
    return 'Key code $code';
  }

  String _desktopButtonLabel(GamepadButton button) => switch (button) {
    GamepadButton.a => 'A / Cross',
    GamepadButton.b => 'B / Circle',
    GamepadButton.x => 'X / Square',
    GamepadButton.y => 'Y / Triangle',
    GamepadButton.leftBumper => 'Left bumper',
    GamepadButton.rightBumper => 'Right bumper',
    GamepadButton.leftTrigger => 'Left trigger',
    GamepadButton.rightTrigger => 'Right trigger',
    GamepadButton.back => 'Back / Select',
    GamepadButton.start => 'Start / Menu',
    GamepadButton.home => 'Guide',
    GamepadButton.leftStick => 'Left stick click',
    GamepadButton.rightStick => 'Right stick click',
    GamepadButton.dpadUp => 'D-pad Up',
    GamepadButton.dpadDown => 'D-pad Down',
    GamepadButton.dpadLeft => 'D-pad Left',
    GamepadButton.dpadRight => 'D-pad Right',
    GamepadButton.touchpad => 'Touchpad',
  };

  /// What the running core calls this button, or null if it says nothing
  /// useful. Keys on [RetroPadButton.retroPadIndex] (the libretro id);
  /// libretro names id 0 "B" and id 8 "A" (SNES positional) while
  /// [RetroPadButton] uses Xbox naming for the same integers, so this lookup
  /// is correct as-is -- do not "fix" the indices.
  ///
  /// A description that merely restates the button name counts as saying
  /// nothing, compared loosely so casing/punctuation differences still count.
  String? _buttonDescription(RetroPadButton button) {
    final port = _device?.port;
    if (port == null) return null;
    final description = widget.inputDescriptors.describe(
      port,
      button.retroPadIndex,
      // Descriptions are per controller type: a core can name the same id
      // differently for its alternate layouts, so ask for the one in effect.
      device: _mapping.controllerTypeForCore(widget.coreId),
    );
    if (description == null) return null;
    if (_squashed(description) == _squashed(button.label)) return null;
    return description;
  }

  /// What the button does in-game takes the title, and the key that does it
  /// takes the subtitle. Where the core offers no word for a button, its
  /// RetroPad letter is the best title available and becomes the title itself.
  String _buttonTitle(RetroPadButton button) =>
      _buttonDescription(button) ?? button.label;

  /// Just the key that triggers this row. "A · Button B" read as a
  /// contradiction, and naming the RetroPad button traded one piece of jargon
  /// for another: what the row does is the title, so the subtitle only has to
  /// answer "what do I press".
  String _buttonSubtitle(RetroPadButton button, int? keycode) =>
      _bindingLabel(keycode);

  String _squashed(String value) =>
      value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  /// Names a profile id for the swap warning. A profile with a pin but nothing
  /// connected is still a real assignment, so it is described rather than
  /// hidden.
  String _nameForProfile(String profileId) =>
      widget.devices
          .where((device) => device.id == profileId)
          .firstOrNull
          ?.name ??
      'a disconnected controller';

  int? _keycodeFor(RetroPadButton button) {
    for (final entry in _mapping.bindingsForGame(widget.gameId).entries) {
      if (entry.value == button) return entry.key;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.devices.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Connect a physical controller to change its mapping.',
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      );
    }

    if (_testingController) {
      final device = _device;
      // Scaled to fit rather than scrolled: the panel's height varies with what
      // the pad reports (a snap line, a two-line last button, the exit ring),
      // and nothing in it is focusable, so on a remote there is no way to
      // scroll to anything that overflows.
      return Flexible(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 520,
            child: ControllerTestPanel(
              snapshot: _diagnosticsSnapshot,
              deviceName: device?.name ?? 'Controller',
              port: device?.port,
              exitHoldProgress: _testExitProgress,
            ),
          ),
        ),
      );
    }

    if (_confirmingCopy) {
      final source = _device;
      return Flexible(
        child: ListView(
          controller: _scroll,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Copy ${source?.portLabel ?? 'selected controller'} mapping and core controller type to ${_copyTargets.length} other controller profile${_copyTargets.length == 1 ? '' : 's'}?\n\nThis copies Android button keycodes and this core\'s selected layout. Use only with compatible controller layouts; analog axes are not copied.',
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            _row(
              'Copy mappings',
              _copyConfirmRow,
              trailing: Icons.check,
              onTap: _confirmCopy,
            ),
            _row(
              'Cancel',
              _copyCancelRow,
              trailing: Icons.close,
              onTap: () => setState(() => _confirmingCopy = false),
            ),
          ],
        ),
      );
    }

    if (_confirmingReset) {
      final device = _device;
      return Flexible(
        child: ListView(
          controller: _scroll,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Reset ${device?.name ?? 'this controller'} to the default '
                'button layout for this game?\n\n'
                'Only this game and this controller change. Your other '
                'games keep their buttons, and this core\'s controller '
                'type and stick snap are not touched.',
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            _row(
              'Reset buttons',
              _resetConfirmRow,
              trailing: Icons.restart_alt,
              onTap: _confirmReset,
            ),
            _row(
              'Cancel',
              _resetCancelRow,
              trailing: Icons.close,
              onTap: _cancelReset,
            ),
          ],
        ),
      );
    }

    if (_capturing case final button?) {
      final description = _buttonDescription(button);
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          description == null
              ? 'Press the physical button to bind to ${button.label}.'
              : 'Press the physical button to bind to $description (${button.label}).',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }

    if (_choosingPlayer) {
      final choices = _playerChoices;
      final assigned = _device == null
          ? null
          : widget.assignments.playerFor(_device!.id);
      return Flexible(
        child: ListView.builder(
          controller: _scroll,
          shrinkWrap: true,
          itemExtent: _rowExtent,
          itemCount: choices.length,
          itemBuilder: (context, index) {
            final player = choices[index];
            final occupant = player == null
                ? null
                : widget.assignments.profileIdByPlayer[player];
            return _row(
              _playerChoiceLabel(player),
              index,
              subtitle: occupant != null && occupant != _device?.id
                  ? 'Currently ${_nameForProfile(occupant)} — they will swap'
                  : null,
              trailing: player == assigned ? Icons.check : null,
              onTap: () {
                setState(() => _playerSelected = index);
                _applyPlayer();
              },
            );
          },
        ),
      );
    }

    if (_choosingControllerType) {
      final choices = _controllerTypeChoices;
      return Flexible(
        child: ListView.builder(
          controller: _scroll,
          shrinkWrap: true,
          itemExtent: _rowExtent,
          itemCount: choices.length,
          itemBuilder: (context, index) {
            final type = choices[index];
            return _row(
              type?.label ?? 'Auto (Core default)',
              index,
              subtitle: type == null
                  ? 'Let the core choose its default layout'
                  : null,
              trailing: index == _controllerTypeSelected ? Icons.check : null,
              onTap: () {
                setState(() => _controllerTypeSelected = index);
                _applyControllerType();
              },
            );
          },
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        controller: _scroll,
        shrinkWrap: true,
        itemExtent: _rowExtent,
        itemCount: _rowCount,
        itemBuilder: (context, index) {
          if (index == 0) {
            final device = _device!;
            final assignment = device.playerLabel.replaceFirst(
              ' · pinned',
              ', pinned',
            );
            return _row(
              '${device.name} - ($assignment)',
              index,
              labelSpan: TextSpan(
                children: [
                  TextSpan(text: '${device.name} - '),
                  TextSpan(
                    text: '($assignment)',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              trailing: Icons.swap_horiz,
              onTap: () {
                setState(() => _selected = index);
                _changeDevice(1);
              },
            );
          }
          if (_showsPlayerSelector && index == _playerRow) {
            return _row(
              'Player assignment',
              index,
              subtitle: _device!.playerLabel,
              trailing: Icons.chevron_right,
              onTap: () {
                setState(() => _selected = index);
                _beginPlayerSelection();
              },
            );
          }
          if (_showsControllerTypeSelector && index == _controllerTypeRow) {
            return _row(
              'Core controller type',
              index,
              subtitle: _controllerTypeLabel,
              trailing: Icons.chevron_right,
              onTap: () {
                setState(() => _selected = index);
                _beginControllerTypeSelection();
              },
            );
          }
          if (index == _copyRow) {
            final targets = _copyTargets.length;
            final canCopy = _canCopy;
            return _row(
              !canCopy
                  ? 'Copy mapping to all controllers (none)'
                  : 'Copy mapping to all controllers',
              index,
              subtitle: !canCopy
                  ? 'Select a controller that holds a player slot'
                  : '$targets other profile${targets == 1 ? '' : 's'}',
              trailing: Icons.copy,
              onTap: () {
                setState(() => _selected = index);
                _beginCopy();
              },
            );
          }
          if (_showsTestRow && index == _testRow) {
            return _row(
              'Test controller',
              index,
              subtitle: 'Live axis and button readout',
              trailing: Icons.chevron_right,
              onTap: () {
                setState(() => _selected = index);
                _beginTestController();
              },
            );
          }
          if (index == _snapRow) {
            return _row(
              'Stick snap',
              index,
              subtitle: _snapSubtitle,
              trailing: Icons.swap_horiz,
              onTap: () {
                setState(() => _selected = index);
                _cycleSnap();
              },
            );
          }
          if (index == _resetRow) {
            return _row(
              'Reset this game to defaults',
              index,
              subtitle: _bindingScopeSubtitle,
              trailing: Icons.restart_alt,
              onTap: () {
                setState(() => _selected = index);
                _beginReset();
              },
            );
          }
          final button = RetroPadButton.values[index - _buttonStartRow];
          final keycode = _keycodeFor(button);
          return _row(
            _buttonTitle(button),
            index,
            subtitle: _buttonSubtitle(button, keycode),
            italicLabel: _buttonDescription(button) != null,
            trailing: Icons.chevron_right,
            onTap: () {
              setState(() => _selected = index);
              _activateSelected();
            },
          );
        },
      ),
    );
  }

  /// Each sub-list keeps its own cursor so backing out never moves this one.
  int get _cursor {
    if (_choosingPlayer) return _playerSelected;
    if (_choosingControllerType) return _controllerTypeSelected;
    if (_confirmingCopy) return _copySelected;
    if (_confirmingReset) return _resetSelected;
    return _selected;
  }

  Widget _row(
    String label,
    int index, {
    String? subtitle,
    IconData? trailing,
    TextSpan? labelSpan,
    // Set when the label is text the core supplied rather than one of this
    // app's own names, so a game's vocabulary reads as a quotation.
    bool italicLabel = false,
    required VoidCallback onTap,
  }) {
    final selected = index == _cursor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (labelSpan == null)
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: italicLabel
                            ? FontStyle.italic
                            : FontStyle.normal,
                      ),
                    )
                  else
                    Text.rich(
                      labelSpan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) Icon(trailing, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}
