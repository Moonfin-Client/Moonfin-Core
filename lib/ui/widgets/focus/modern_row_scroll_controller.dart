import 'package:flutter/widgets.dart';

/// Keeps ordinary scrolling unchanged and adds continuous row-to-row motion.
class ModernRowScrollController extends ScrollController {
  Future<void> animateToRow(double offset, {required Duration duration}) async {
    if (!hasClients) return;
    await Future.wait([
      for (final position in positions)
        (position as _ModernRowScrollPosition).animateToRow(offset, duration),
    ]);
  }

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) => _ModernRowScrollPosition(
    physics: physics,
    context: context,
    initialPixels: initialScrollOffset,
    keepScrollOffset: keepScrollOffset,
    oldPosition: oldPosition,
  );
}

class _ModernRowScrollPosition extends ScrollPositionWithSingleContext {
  _ModernRowScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
  });

  Future<void> animateToRow(double offset, Duration duration) {
    final target = offset.clamp(minScrollExtent, maxScrollExtent);
    if (duration == Duration.zero || (target - pixels).abs() < 0.01) {
      jumpTo(target);
      return Future.value();
    }
    final motion = _RowScrollActivity(
      this,
      _RowScrollSimulation(
        from: pixels,
        to: target,
        velocity: activity?.velocity ?? 0,
        duration: duration,
      ),
      vsync: context.vsync,
    );
    beginActivity(motion);
    return motion.done;
  }
}

class _RowScrollActivity extends DrivenScrollActivity {
  _RowScrollActivity(
    ScrollPositionWithSingleContext super.position,
    super.simulation, {
    required super.vsync,
  }) : super.simulation();

  @override
  bool applyMoveTo(double value) {
    final position = delegate as ScrollPosition;
    // Clamp against bounds that may change while rows load or disappear.
    return super.applyMoveTo(
      value.clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  @override
  double get velocity {
    final position = delegate as ScrollPosition;
    final speed = super.velocity;
    if ((position.pixels <= position.minScrollExtent && speed < 0) ||
        (position.pixels >= position.maxScrollExtent && speed > 0)) {
      return 0;
    }
    return speed;
  }
}

/// A direct, monotonic shift that eases into its destination.
/// Keeps forward momentum on repeats, but follows a reversal immediately.
class _RowScrollSimulation extends Simulation {
  _RowScrollSimulation({
    required double from,
    required double to,
    required double velocity,
    required Duration duration,
  }) : _from = from,
       _to = to,
       _seconds = duration.inMicroseconds / Duration.microsecondsPerSecond {
    final distance = to - from;
    final incomingSlope = distance == 0 ? 0.0 : velocity * _seconds / distance;
    // At rest (or on reversal), start with easeOutCubic's prompt response.
    // A same-direction handoff preserves speed unless that would overshoot
    // a nearer destination. Slopes in [0, 3] make this Hermite curve monotonic.
    final slope = incomingSlope > 0 ? incomingSlope.clamp(0.0, 3.0) : 3.0;
    _initial = slope * distance;
    _quadratic = 3 * distance - 2 * _initial;
    _cubic = _initial - 2 * distance;
  }

  final double _from;
  final double _to;
  final double _seconds;
  late final double _initial;
  late final double _quadratic;
  late final double _cubic;

  @override
  double x(double time) {
    if (time >= _seconds) return _to;
    final t = (time / _seconds).clamp(0.0, 1.0);
    return _from + t * (_initial + t * (_quadratic + t * _cubic));
  }

  @override
  double dx(double time) {
    if (time >= _seconds) return 0;
    final t = (time / _seconds).clamp(0.0, 1.0);
    return (_initial + t * (2 * _quadratic + t * 3 * _cubic)) / _seconds;
  }

  @override
  bool isDone(double time) => time >= _seconds;
}
