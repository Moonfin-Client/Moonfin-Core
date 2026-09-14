import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Shared by the card bounds and the row scroll that accompanies a focus move.
const modernCardMotionCurve = Curves.easeOutCubic;
const modernCardExpansionDwell = Duration(milliseconds: 70);

/// Owns the expansion space for a row, independently of its lazy card widgets.
///
/// A focus handoff interpolates every current width toward the new selection on
/// one clock. Once a row is expanded, the weights always sum to one: shrinking
/// cards give exactly as much space as the incoming card takes, even when a
/// second focus move interrupts the first. Only row entry/exit changes the total.
class ModernCardRowController extends ChangeNotifier {
  ModernCardRowController({
    required TickerProvider vsync,
    required Duration duration,
    this._expansionDelay = Duration.zero,
  }) : _duration = duration,
       _animation = AnimationController(vsync: vsync, duration: duration) {
    _animation.addListener(_tick);
  }

  final AnimationController _animation;
  final Map<Object, ValueNotifier<double>> _progress = {};
  Map<Object, double> _weights = {};
  Map<Object, double> _starts = {};
  Object? _selected;
  Object? _target;
  Duration _duration;
  Duration _expansionDelay;
  Timer? _dwell;
  VoidCallback? _onSettled;

  double progressOf(Object itemKey) => _weights[itemKey] ?? 0;

  ValueListenable<double> progressFor(Object itemKey) =>
      _progress.putIfAbsent(itemKey, () => ValueNotifier(progressOf(itemKey)));

  void configure({
    required Duration duration,
    required Duration expansionDelay,
  }) {
    _expansionDelay = expansionDelay;
    if (_duration == duration) return;
    _duration = duration;
    _animation.duration = duration;
    if (duration == Duration.zero) {
      _dwell?.cancel();
      _dwell = null;
      _animateTo(_selected);
      _notifySettled();
    } else if (_animation.isAnimating) {
      _animateTo(_target);
    }
  }

  /// The dwell delays initial expansion and expensive artwork lookups, but
  /// never delays a width transfer in an already expanded row.
  /// [immediateExpansion] also starts row-entry geometry immediately, while
  /// keeping the settled callback debounced for expensive artwork lookups.
  void select(
    Object? itemKey, {
    VoidCallback? onSettled,
    Duration? delay,
    bool immediateExpansion = false,
  }) {
    if (_selected == itemKey) return;
    _selected = itemKey;
    _dwell?.cancel();
    _dwell = null;
    _onSettled = onSettled;
    final dwell = _duration == Duration.zero
        ? Duration.zero
        : (delay ?? _expansionDelay);
    if (itemKey == null) {
      _onSettled = null;
      _animateTo(null);
      return;
    }
    final waitForEntry =
        !immediateExpansion && _weights.isEmpty && dwell > Duration.zero;
    if (waitForEntry) {
      _animation.stop();
    } else {
      _animateTo(itemKey);
    }
    if (dwell == Duration.zero) {
      _notifySettled();
    } else {
      _dwell = Timer(dwell, () {
        _dwell = null;
        if (waitForEntry) _animateTo(itemKey);
        _notifySettled();
      });
    }
  }

  void _notifySettled() {
    final callback = _onSettled;
    _onSettled = null;
    callback?.call();
  }

  void _animateTo(Object? target) {
    _animation.stop();
    _starts = Map.of(_weights);
    _target = target;
    if (_duration == Duration.zero) {
      _publish({?target: 1});
    } else {
      _animation.forward(from: 0);
    }
  }

  void _tick() {
    final t = modernCardMotionCurve.transform(_animation.value);
    final target = _target;
    _publish({
      if (t < 1)
        for (final entry in _starts.entries) entry.key: entry.value * (1 - t),
      ?target: (_starts[target] ?? 0) * (1 - t) + t,
    });
  }

  void _publish(Map<Object, double> next) {
    // Store all widths before notifying either the cards or the row layout.
    // Offscreen cards keep their progress without needing a mounted widget.
    next.removeWhere((_, value) => value == 0);
    final previous = _weights;
    _weights = next;
    var changed = false;
    for (final key in {...previous.keys, ...next.keys}) {
      final value = next[key] ?? 0;
      if (value == (previous[key] ?? 0)) continue;
      changed = true;
      _progress[key]?.value = value;
    }
    if (changed) notifyListeners();
  }

  @override
  void dispose() {
    _dwell?.cancel();
    _animation.dispose();
    for (final progress in _progress.values) {
      progress.dispose();
    }
    super.dispose();
  }
}

/// Keeps the shared clock alive while individual cards enter/leave the viewport.
class ModernCardRowTransition extends StatefulWidget {
  final Duration duration;
  final Duration expansionDelay;
  final Widget Function(BuildContext context, ModernCardRowController motion)
  builder;

  const ModernCardRowTransition({
    super.key,
    required this.duration,
    required this.builder,
    this.expansionDelay = Duration.zero,
  });

  @override
  State<ModernCardRowTransition> createState() =>
      _ModernCardRowTransitionState();
}

class _ModernCardRowTransitionState extends State<ModernCardRowTransition>
    with SingleTickerProviderStateMixin {
  late final _motion = ModernCardRowController(
    vsync: this,
    duration: widget.duration,
    expansionDelay: widget.expansionDelay,
  );

  @override
  void didUpdateWidget(covariant ModernCardRowTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    _motion.configure(
      duration: widget.duration,
      expansionDelay: widget.expansionDelay,
    );
  }

  @override
  void dispose() {
    _motion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _motion);
}

/// Animates actual card geometry, rather than just the space around a card.
///
/// Selection feedback belongs to the caller and is immediate. Only expansion
/// waits for focus to settle; losing focus starts collapse immediately. Each
/// retarget starts from the current visible progress, including quick reversals.
class ModernCardTransition extends StatefulWidget {
  final bool expanded;
  final Duration duration;
  final Duration expansionDelay;
  final VoidCallback? onExpansionStarted;
  final Widget Function(BuildContext context, double progress) builder;

  const ModernCardTransition({
    super.key,
    required this.expanded,
    required this.duration,
    required this.builder,
    this.expansionDelay = Duration.zero,
    this.onExpansionStarted,
  });

  @override
  State<ModernCardTransition> createState() => _ModernCardTransitionState();
}

class _ModernCardTransitionState extends State<ModernCardTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _dwell;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _retarget();
  }

  @override
  void didUpdateWidget(covariant ModernCardTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expanded != widget.expanded ||
        oldWidget.duration != widget.duration ||
        oldWidget.expansionDelay != widget.expansionDelay) {
      _controller.duration = widget.duration;
      _retarget();
    }
  }

  void _retarget() {
    _dwell?.cancel();
    _dwell = null;
    if (widget.duration == Duration.zero) {
      if (widget.expanded && _controller.value < 1) {
        widget.onExpansionStarted?.call();
      }
      _controller.value = widget.expanded ? 1 : 0;
      return;
    }
    if (widget.expanded && widget.expansionDelay > Duration.zero) {
      // A reversal must not keep collapsing during the new dwell interval.
      _controller.stop();
      _dwell = Timer(widget.expansionDelay, () {
        _dwell = null;
        if (mounted && widget.expanded) _animateTo(1);
      });
    } else {
      _animateTo(widget.expanded ? 1 : 0);
    }
  }

  void _animateTo(double target) {
    if (target == 1 && _controller.value < 1) {
      widget.onExpansionStarted?.call();
    }
    _controller.animateTo(
      target,
      duration: widget.duration,
      curve: modernCardMotionCurve,
    );
  }

  @override
  void dispose() {
    _dwell?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, _) => widget.builder(context, _controller.value),
  );
}
