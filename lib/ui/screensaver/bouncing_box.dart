import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BouncingBox extends StatefulWidget {
  const BouncingBox({
    super.key,
    required this.childWidth,
    required this.childHeight,
    this.speedMultiplier = 1.0,
    this.child,
    this.builder,
  }) : assert(child != null || builder != null, 'Either child or builder must be provided');

  final double childWidth;
  final double childHeight;
  final double speedMultiplier;
  final Widget? child;
  final Widget Function(BuildContext context, bool movingLeft)? builder;

  @override
  State<BouncingBox> createState() => _BouncingBoxState();
}

class _BouncingBoxState extends State<BouncingBox>
    with SingleTickerProviderStateMixin {
  static const _speed = 30.0;
  static const _margin = 20.0;

  late final Ticker _ticker;
  Duration _lastElapsed = Duration.zero;
  double _x = 0;
  double _y = 0;
  double _dx = 1;
  double _dy = 1;
  bool _initialized = false;
  double _maxX = 0;
  double _maxY = 0;

  // The box moves every frame but only turns at a wall, so the two are
  // published apart. The child is the whole screensaver component, and driving
  // it off the position would rebuild it on every frame.
  late final ValueNotifier<Offset> _offset = ValueNotifier<Offset>(Offset.zero);
  late final ValueNotifier<bool> _movingLeft = ValueNotifier<bool>(_dx < 0);

  @override
  void initState() {
    super.initState();
    final random = Random();
    _dx = random.nextBool() ? 1 : -1;
    _dy = random.nextBool() ? 1 : -1;
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _offset.dispose();
    _movingLeft.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _lastElapsed).inMicroseconds / 1e6;
    _lastElapsed = elapsed;
    if (!_initialized || dt <= 0 || dt > 1) return;

    _x += _dx * _speed * widget.speedMultiplier * dt;
    _y += _dy * _speed * widget.speedMultiplier * dt;

    if (_x <= _margin) {
      _x = _margin;
      _dx = 1;
    } else if (_x >= _maxX) {
      _x = _maxX;
      _dx = -1;
    }
    if (_y <= _margin) {
      _y = _margin;
      _dy = 1;
    } else if (_y >= _maxY) {
      _y = _maxY;
      _dy = -1;
    }

    _offset.value = Offset(_x, _y);
    _movingLeft.value = _dx < 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxX = constraints.maxWidth - widget.childWidth - _margin;
        _maxY = constraints.maxHeight - widget.childHeight - _margin;

        final renderedChild = widget.builder == null
            ? widget.child!
            : ValueListenableBuilder<bool>(
                valueListenable: _movingLeft,
                builder: (context, movingLeft, _) =>
                    widget.builder!(context, movingLeft),
              );

        if (_maxX <= _margin || _maxY <= _margin) {
          return renderedChild;
        }
        if (!_initialized) {
          final random = Random();
          _x = _margin + random.nextDouble() * (_maxX - _margin);
          _y = _margin + random.nextDouble() * (_maxY - _margin);
          _initialized = true;
          // Nothing is listening on this first pass, so the box paints where it
          // starts rather than flashing in the corner for a frame.
          _offset.value = Offset(_x, _y);
        }

        return ValueListenableBuilder<Offset>(
          valueListenable: _offset,
          builder: (context, offset, child) => Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy,
                width: widget.childWidth,
                height: widget.childHeight,
                child: child!,
              ),
            ],
          ),
          child: renderedChild,
        );
      },
    );
  }
}
