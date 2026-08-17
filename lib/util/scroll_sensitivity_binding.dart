import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Scales mouse wheel scrolling app wide.
///
/// A wheel notch moves a fixed distance chosen by the platform, so a screen
/// built from tall rows crosses far less content per notch than a compact one.
/// Scaling the event before it reaches hit testing lets one setting cover every
/// scrollable rather than each one handling the wheel itself.
class ScrollSensitivityBinding extends WidgetsFlutterBinding {
  static ScrollSensitivityBinding ensureInitialized() {
    ScrollSensitivityBinding();
    return WidgetsBinding.instance as ScrollSensitivityBinding;
  }

  double _multiplier = 1.0;

  /// Values at or below zero would stall or invert scrolling, so they are
  /// ignored rather than stored.
  set multiplier(double value) {
    if (value <= 0) return;
    _multiplier = value;
  }

  double get multiplier => _multiplier;

  /// What the wheel is currently scaled by, for the handlers that count
  /// notches rather than pixels. One on the platforms and tests that never
  /// install this binding.
  static double get current {
    final binding = WidgetsBinding.instance;
    return binding is ScrollSensitivityBinding ? binding.multiplier : 1.0;
  }

  @override
  void handlePointerEvent(PointerEvent event) {
    if (_multiplier == 1.0 ||
        event is! PointerScrollEvent ||
        // Trackpads report their own momentum, and scaling that reads as the
        // page tearing away from the fingers.
        event.kind != PointerDeviceKind.mouse) {
      super.handlePointerEvent(event);
      return;
    }

    super.handlePointerEvent(
      PointerScrollEvent(
        viewId: event.viewId,
        timeStamp: event.timeStamp,
        kind: event.kind,
        device: event.device,
        position: event.position,
        scrollDelta: event.scrollDelta * _multiplier,
        embedderId: event.embedderId,
      ),
    );
  }
}
