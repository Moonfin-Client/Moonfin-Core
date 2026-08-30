import 'dart:async';

import 'package:flutter/material.dart';

class ImmersiveOverflowText extends StatefulWidget {
  final String text;
  final bool active;
  final TextStyle? style;

  final double horizontalPadding;
  final double pixelsPerSecond;

  const ImmersiveOverflowText({
    super.key,
    required this.text,
    required this.active,
    required this.style,
    this.horizontalPadding = 10.0,
    this.pixelsPerSecond = 42.0,
  });

  @override
  State<ImmersiveOverflowText> createState() => _ImmersiveOverflowTextState();
}

class _ImmersiveOverflowTextState extends State<ImmersiveOverflowText>
    with SingleTickerProviderStateMixin {
  static const double _overflowTolerance = 4.0;
  static const String _separator = '      •      ';
  static const Duration _startPause = Duration(milliseconds: 900);
  static const Duration _loopPause = Duration(milliseconds: 900);

  late final AnimationController _controller;

  Timer? _pauseTimer;

  double _travelDistance = 0;

  bool _configuredOverflowing = false;

  String? _configuredText;
  double? _configuredAvailableWidth;
  double? _configuredTextWidth;
  double? _configuredSeparatorWidth;
  double? _configuredTextScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener(_handleAnimationStatus);
  }

  @override
  void didUpdateWidget(covariant ImmersiveOverflowText oldWidget) {
    super.didUpdateWidget(oldWidget);

    final contentChanged =
        oldWidget.text != widget.text ||
        oldWidget.style != widget.style ||
        oldWidget.horizontalPadding != widget.horizontalPadding ||
        oldWidget.pixelsPerSecond != widget.pixelsPerSecond;

    if (contentChanged) {
      _clearConfiguration();
      _stopAndReset();
      return;
    }

    if (oldWidget.active && !widget.active) {
      _stopAndReset();
      return;
    }

    if (!oldWidget.active && widget.active && _configuredOverflowing) {
      _scheduleStart(_startPause);
    }
  }

  void _clearConfiguration() {
    _configuredText = null;
    _configuredAvailableWidth = null;
    _configuredTextWidth = null;
    _configuredSeparatorWidth = null;
    _configuredTextScale = null;

    _configuredOverflowing = false;
    _travelDistance = 0;
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) {
      return;
    }

    if (!widget.active || !_configuredOverflowing) {
      _stopAndReset();
      return;
    }

    _controller.value = 0;

    _pauseTimer?.cancel();

    _pauseTimer = Timer(_loopPause, () {
      if (!mounted || !widget.active || !_configuredOverflowing) {
        return;
      }

      _startAnimation();
    });
  }

  void _scheduleStart(Duration delay) {
    _pauseTimer?.cancel();

    if (!widget.active || !_configuredOverflowing) {
      return;
    }

    _pauseTimer = Timer(delay, () {
      if (!mounted || !widget.active || !_configuredOverflowing) {
        return;
      }

      _startAnimation();
    });
  }

  void _startAnimation() {
    if (_travelDistance <= 0 || !widget.active || !_configuredOverflowing) {
      return;
    }

    final milliseconds = ((_travelDistance / widget.pixelsPerSecond) * 1000)
        .round()
        .clamp(1200, 30000);

    _controller.duration = Duration(milliseconds: milliseconds);

    _controller.forward(from: 0);
  }

  void _stopAndReset() {
    _pauseTimer?.cancel();
    _pauseTimer = null;

    _controller.stop();

    if (_controller.value != 0) {
      _controller.value = 0;
    }
  }

  double _measureTextWidth(BuildContext context, String text) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: widget.style),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return painter.width;
  }

  void _configureIfNeeded({
    required double availableWidth,
    required double textWidth,
    required double separatorWidth,
    required double textScale,
    required bool overflowing,
  }) {
    final unchanged =
        _configuredText == widget.text &&
        _configuredAvailableWidth == availableWidth &&
        _configuredTextWidth == textWidth &&
        _configuredSeparatorWidth == separatorWidth &&
        _configuredTextScale == textScale &&
        _configuredOverflowing == overflowing;

    if (unchanged) {
      return;
    }

    _configuredText = widget.text;
    _configuredAvailableWidth = availableWidth;
    _configuredTextWidth = textWidth;
    _configuredSeparatorWidth = separatorWidth;
    _configuredTextScale = textScale;
    _configuredOverflowing = overflowing;

    _travelDistance = overflowing ? textWidth + separatorWidth : 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _stopAndReset();

      if (widget.active && _configuredOverflowing) {
        _scheduleStart(_startPause);
      }
    });
  }

  @override
  void dispose() {
    _pauseTimer?.cancel();

    _controller.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        if (!availableWidth.isFinite || availableWidth <= 0) {
          return const SizedBox.shrink();
        }

        final textScale = MediaQuery.textScalerOf(context).scale(1);

        final contentWidth = (availableWidth - widget.horizontalPadding * 2)
            .clamp(0.0, double.infinity)
            .toDouble();

        final textWidth = _measureTextWidth(context, widget.text);

        final separatorWidth = _measureTextWidth(context, _separator);

        final overflowing = textWidth > contentWidth + _overflowTolerance;

        _configureIfNeeded(
          availableWidth: availableWidth,
          textWidth: textWidth,
          separatorWidth: separatorWidth,
          textScale: textScale,
          overflowing: overflowing,
        );

        if (!overflowing) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: Center(
              child: Text(
                widget.text,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: widget.style,
              ),
            ),
          );
        }

        if (!widget.active) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: Text(
              widget.text,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: widget.style,
            ),
          );
        }

        final scrollingText = '${widget.text}$_separator${widget.text}';

        return ClipRect(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final offset = -_travelDistance * _controller.value;

              return Transform.translate(
                offset: Offset(offset, 0),
                child: child,
              );
            },
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              minWidth: 0,
              maxWidth: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: widget.horizontalPadding),
                child: Text(
                  scrollingText,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: widget.style,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
