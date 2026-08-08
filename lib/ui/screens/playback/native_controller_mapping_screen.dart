import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamepads/gamepads.dart';

import '../../../util/focus/gamepad/controller_mapping_capture.dart';
import '../../../util/native_controller_mapping.dart';

/// A privacy-safe physical controller identifier. On Android it comes from the
/// gamepad channel and is stable across reconnects and never a raw descriptor;
/// on Windows and Linux it is a namespaced gamepads-package controller id (see
/// [desktopControllerDeviceId]).
class NativeControllerDevice {
  const NativeControllerDevice({required this.id, required this.name});

  final String id;
  final String name;

  factory NativeControllerDevice.fromMap(Map<String, dynamic> map) {
    return NativeControllerDevice(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? 'Android gamepad',
    );
  }
}

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
    required this.onClose,
  });

  final List<NativeControllerDevice> devices;
  final Map<String, NativeControllerMapping> mappings;
  final Future<void> Function(String deviceId, NativeControllerMapping mapping)
  onMappingChanged;
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
  RetroPadButton? _capturing;
  late NativeControllerMapping _mapping;
  final ControllerMappingCapture? _capture =
      ControllerMappingCapture.forPlatform();

  NativeControllerDevice? get _device =>
      widget.devices.isEmpty ? null : widget.devices[_deviceIndex];
  int get _rowCount => 1 + RetroPadButton.values.length + 1;

  @override
  void initState() {
    super.initState();
    _loadSelectedDevice();
    _capture?.attach(_onCaptured);
  }

  @override
  void dispose() {
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
    if (identical(oldWidget.devices, widget.devices)) return;

    final previousDevice = _deviceIndex < oldWidget.devices.length
        ? oldWidget.devices[_deviceIndex]
        : null;
    final matchedIndex = previousDevice == null
        ? -1
        : widget.devices.indexWhere((d) => d.id == previousDevice.id);
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

  /// Called by the native player screen for standard RetroPad overlay input.
  void handleButton(int index, bool pressed) {
    if (!pressed || _capturing != null) return;
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
    // The device can be switched, or the panel closed, between arming capture
    // and the press arriving; binding to whatever is selected now would attach
    // the press to a controller the user never touched.
    if (capturing == null || deviceId != _device?.id) return;

    final mapping = _mapping.withBinding(code, capturing);
    setState(() {
      _mapping = mapping;
      _capturing = null;
    });
    await _capture?.end();
    await widget.onMappingChanged(deviceId, mapping);
  }

  void _move(int delta) {
    final next = ((_selected + delta) % _rowCount + _rowCount) % _rowCount;
    setState(() => _selected = next);
    if (!_scroll.hasClients) return;
    final target = (next * _rowExtent)
        .clamp(0.0, _scroll.position.maxScrollExtent)
        .toDouble();
    _scroll.animateTo(
      target,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
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
    if (_selected == _rowCount - 1) {
      _reset();
      return;
    }
    final device = _device;
    final capture = _capture;
    if (device == null || capture == null) return;
    final button = RetroPadButton.values[_selected - 1];
    setState(() => _capturing = button);
    unawaited(capture.begin(device.id));
  }

  void _reset() {
    final device = _device;
    if (device == null) return;
    setState(() => _mapping = NativeControllerMapping.empty);
    unawaited(
      widget.onMappingChanged(device.id, NativeControllerMapping.empty),
    );
  }

  /// How a stored binding is described back to the user.
  ///
  /// A bare "Key code 97" is the best that can be said of an Android keycode,
  /// but a desktop binding was captured as a known button and deserves its
  /// name. [desktopGamepadButtonsByCode] returning null is what distinguishes
  /// the two, so no platform check is needed here.
  String _bindingLabel(int? code) {
    if (code == null) return 'Default layout';
    final button = desktopGamepadButtonsByCode[code];
    if (button != null) return _desktopButtonLabel(button);
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

  int? _keycodeFor(RetroPadButton button) {
    for (final entry in _mapping.keycodeToButton.entries) {
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

    if (_capturing case final button?) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Press the physical button to bind to ${button.label}.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 20),
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
            return _row(
              'Controller: ${_device!.name}',
              index,
              trailing: Icons.swap_horiz,
              onTap: () {
                setState(() => _selected = index);
                _changeDevice(1);
              },
            );
          }
          if (index == _rowCount - 1) {
            return _row(
              'Reset to defaults',
              index,
              trailing: Icons.restart_alt,
              onTap: () {
                setState(() => _selected = index);
                _reset();
              },
            );
          }
          final button = RetroPadButton.values[index - 1];
          final keycode = _keycodeFor(button);
          return _row(
            button.label,
            index,
            subtitle: _bindingLabel(keycode),
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

  Widget _row(
    String label,
    int index, {
    String? subtitle,
    IconData? trailing,
    required VoidCallback onTap,
  }) {
    final selected = index == _selected;
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
                  Text(
                    label,
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
