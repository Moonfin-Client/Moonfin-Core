import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int minDurationMs;
  final int maxDurationMs;
  final double millisPerPixel;
  final double gap;
  final int pauseDurationMs;

  const MarqueeText({
    super.key,
    required this.text,
    required this.style,
    this.minDurationMs = 2200,
    this.maxDurationMs = 12000,
    this.millisPerPixel = 50,
    this.gap = 30.0,
    this.pauseDurationMs = 1500,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller;
  late final AnimationController _anim;
  double _lastTextWidth = 0.0;
  double _lastParentWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _anim = AnimationController(vsync: this);
    _anim.addListener(_onTick);
  }

  @override
  void dispose() {
    _anim.removeListener(_onTick);
    _anim.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text || oldWidget.style != widget.style) {
      if (_controller.hasClients) {
        _controller.jumpTo(0);
      }
      _anim.stop();
      _anim.value = 0.0;
    }
  }

  void _onTick() {
    if (_controller.hasClients && _anim.duration != null) {
      final scrollDistance = _lastTextWidth + widget.gap;
      final totalMs = _anim.duration!.inMilliseconds.toDouble();
      if (totalMs > 0) {
        final pauseFraction = widget.pauseDurationMs / totalMs;
        final v = _anim.value;
        if (v < pauseFraction) {
          _controller.jumpTo(0.0);
        } else {
          final t = (v - pauseFraction) / (1.0 - pauseFraction);
          _controller.jumpTo(t * scrollDistance);
        }
      }
    }
  }

  void _updateAnimation(double textWidth, double parentWidth) {
    if (!mounted) return;

    _lastTextWidth = textWidth;
    _lastParentWidth = parentWidth;

    final overflows = textWidth > parentWidth;
    if (!overflows) {
      if (_anim.isAnimating) {
        _anim.stop();
      }
      if (_controller.hasClients && _controller.offset != 0) {
        _controller.jumpTo(0);
      }
      return;
    }

    final scrollDistance = textWidth + widget.gap;
    final scrollDurationMs = (scrollDistance * widget.millisPerPixel).toInt();
    final totalDurationMs = scrollDurationMs + widget.pauseDurationMs;
    final newDuration = Duration(milliseconds: totalDurationMs);

    if (_anim.duration != newDuration) {
      _anim.duration = newDuration;
      if (_anim.isAnimating) {
        _anim.repeat();
      }
    }

    if (!_anim.isAnimating) {
      _anim.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: Directionality.maybeOf(context) ?? TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final textWidth = textPainter.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateAnimation(textWidth, parentWidth);
        });

        final overflows = textWidth > parentWidth;

        if (!overflows) {
          return Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.style,
          );
        }

        return SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              Text(widget.text, maxLines: 1, style: widget.style),
              SizedBox(width: widget.gap),
              Text(widget.text, maxLines: 1, style: widget.style),
            ],
          ),
        );
      },
    );
  }
}

