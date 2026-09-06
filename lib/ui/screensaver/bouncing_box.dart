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
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _lastElapsed).inMicroseconds / 1e6;
    _lastElapsed = elapsed;
    if (!_initialized || dt <= 0 || dt > 1) {
      setState(() {});
      return;
    }
    setState(() {
      _x += _dx * _speed * widget.speedMultiplier * dt;
      _y += _dy * _speed * widget.speedMultiplier * dt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minX = _margin;
        final minY = _margin;
        final maxX = constraints.maxWidth - widget.childWidth - _margin;
        final maxY = constraints.maxHeight - widget.childHeight - _margin;
        final renderedChild = widget.builder != null
            ? widget.builder!(context, _dx < 0)
            : widget.child!;
        if (maxX <= minX || maxY <= minY) {
          return renderedChild;
        }
        if (!_initialized) {
          final random = Random();
          _x = minX + random.nextDouble() * (maxX - minX);
          _y = minY + random.nextDouble() * (maxY - minY);
          _initialized = true;
        }
        if (_x <= minX) {
          _x = minX;
          _dx = 1;
        } else if (_x >= maxX) {
          _x = maxX;
          _dx = -1;
        }
        if (_y <= minY) {
          _y = minY;
          _dy = 1;
        } else if (_y >= maxY) {
          _y = maxY;
          _dy = -1;
        }
        return Stack(
          children: [
            Positioned(
              left: _x,
              top: _y,
              width: widget.childWidth,
              height: widget.childHeight,
              child: renderedChild,
            ),
          ],
        );
      },
    );
  }
}
