import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show kTouchSlop;
import 'package:flutter/services.dart';

import 'platform_detection.dart';

/// Gives Flutter real touch pointers on a touchscreen Mac.
///
/// Flutter's macOS embedder has no path for a finger on the screen, so AppKit
/// stands in with mouse events that cannot scroll, hold a press or pinch
/// (flutter/flutter#190217). The runner's DirectTouchBridge takes the touches
/// instead and reports them here, where they enter the framework the way the
/// engine's own pointers do.
///
/// TODO(flutter/flutter#190217): remove this and DirectTouchBridge once the
/// embedder handles direct touches, or every touch will arrive twice.
class MacosTouchInput {
  MacosTouchInput._();

  // Keep in step with DirectTouchBridge in MainFlutterWindow.swift.
  static const _channel = BasicMessageChannel<Object?>(
    'moonfin/macos_touch',
    StandardMessageCodec(),
  );

  // Clear of the embedder's own devices and pointers, which count from zero.
  static const _touchDevice = 0x4D4F0000;
  static const _hoverDevice = 0x4D4FFFFF;
  static int _nextPointer = 0x40000000;

  static final _fingers = <int, _Finger>{};

  /// The finger the desktop layout's hover effects follow once it slides,
  /// since a touch pointer never hovers on its own. A tap must not hover:
  /// menus that close when the pointer leaves would shut as the finger lifts.
  static int? _hoverSlot;
  static ui.Offset _hoverOrigin = ui.Offset.zero;
  static bool _hovering = false;

  static void install() {
    if (!PlatformDetection.isMacOS) return;
    _channel.setMessageHandler(handleMessage);
  }

  @visibleForTesting
  static void reset() {
    _fingers.clear();
    _hoverSlot = null;
    _hovering = false;
  }

  /// Takes a list of `[phase, slot, x, y, seconds]`, one per finger that
  /// changed, with the position in logical pixels from the top left.
  @visibleForTesting
  static Future<Object?> handleMessage(Object? message) async {
    if (message is! List) return null;
    final view = ui.PlatformDispatcher.instance.implicitView;
    if (view == null) return null;
    final viewId = view.viewId;
    final scale = view.devicePixelRatio;

    final data = <ui.PointerData>[];
    for (final touch in message) {
      if (touch
          case [
            final String phase,
            final int slot,
            final num x,
            final num y,
            final num seconds,
          ]
          when x.isFinite && y.isFinite && seconds.isFinite) {
        _expand(
          data,
          phase: phase,
          slot: slot,
          position: ui.Offset(x * scale, y * scale),
          timeStamp: Duration(
            microseconds: (seconds * Duration.microsecondsPerSecond).round(),
          ),
          viewId: viewId,
          slop: kTouchSlop * scale,
        );
      }
    }
    if (data.isNotEmpty) {
      ui.PlatformDispatcher.instance.onPointerDataPacket?.call(
        ui.PointerDataPacket(data: data),
      );
    }
    return null;
  }

  static void _expand(
    List<ui.PointerData> data, {
    required String phase,
    required int slot,
    required ui.Offset position,
    required Duration timeStamp,
    required int viewId,
    required double slop,
  }) {
    ui.PointerData touch(
      ui.PointerChange change,
      _Finger finger, {
      ui.Offset delta = ui.Offset.zero,
    }) {
      final down =
          change == ui.PointerChange.down || change == ui.PointerChange.move;
      return ui.PointerData(
        viewId: viewId,
        timeStamp: timeStamp,
        change: change,
        kind: ui.PointerDeviceKind.touch,
        device: _touchDevice + slot,
        pointerIdentifier: finger.pointer,
        physicalX: finger.position.dx,
        physicalY: finger.position.dy,
        physicalDeltaX: delta.dx,
        physicalDeltaY: delta.dy,
        pressure: down ? 1.0 : 0.0,
        pressureMax: 1.0,
      );
    }

    ui.PointerData hover(ui.PointerChange change) => ui.PointerData(
      viewId: viewId,
      timeStamp: timeStamp,
      change: change,
      kind: ui.PointerDeviceKind.mouse,
      device: _hoverDevice,
      physicalX: position.dx,
      physicalY: position.dy,
    );

    void move(_Finger finger) {
      final delta = position - finger.position;
      finger.position = position;
      if (_hoverSlot == slot) {
        if (!_hovering && (position - _hoverOrigin).distance > slop) {
          _hovering = true;
          data.add(hover(ui.PointerChange.add));
        }
        if (_hovering) data.add(hover(ui.PointerChange.hover));
      }
      data.add(touch(ui.PointerChange.move, finger, delta: delta));
    }

    void lift(ui.PointerChange change) {
      final finger = _fingers.remove(slot);
      if (finger == null) return;
      // The engine never lifts a pointer anywhere but where it last was.
      if (change == ui.PointerChange.up && position != finger.position) {
        move(finger);
      }
      data
        ..add(touch(change, finger))
        ..add(touch(ui.PointerChange.remove, finger));
      if (_hoverSlot == slot) {
        _hoverSlot = null;
        if (_hovering) data.add(hover(ui.PointerChange.remove));
        _hovering = false;
      }
    }

    switch (phase) {
      case 'down':
        // A finger that never reported lifting was lost on the way.
        lift(ui.PointerChange.cancel);
        if (_fingers.isEmpty) {
          _hoverSlot = slot;
          _hoverOrigin = position;
        }
        final finger = _fingers[slot] = _Finger(_nextPointer++, position);
        data
          ..add(touch(ui.PointerChange.add, finger))
          ..add(touch(ui.PointerChange.down, finger));
      case 'move':
        final finger = _fingers[slot];
        if (finger != null) move(finger);
      case 'up':
        lift(ui.PointerChange.up);
      case 'cancel':
        lift(ui.PointerChange.cancel);
    }
  }
}

class _Finger {
  _Finger(this.pointer, this.position);

  final int pointer;

  /// In physical pixels, as the engine reports pointers.
  ui.Offset position;
}
