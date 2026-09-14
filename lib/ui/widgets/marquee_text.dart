import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;

  /// The number of lines visible before an overflowing value scrolls. The
  /// default is the original horizontal one-line marquee. Values above one
  /// use the same pause/repeat timing to scroll vertically through wrapped
  /// text, keeping the full visible line budget available to the caller.
  final int maxLines;

  /// Optional rich content rendered in place of [text], so one scrolling line
  /// can mix styles, such as a bold title followed by a dimmer subtitle.
  /// [style] still applies as the root, and [text] stays as the plain text
  /// equivalent used to spot content changes.
  final List<InlineSpan>? spans;

  final int minDurationMs;
  final int maxDurationMs;
  final double millisPerPixel;
  final double gap;
  final int pauseDurationMs;
  final bool showDotSeparator;
  final double dotSize;
  final TextAlign textAlign;
  final bool startAtEnd;

  const MarqueeText({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 1,
    this.spans,
    this.minDurationMs = 2200,
    this.maxDurationMs = 12000,
    this.millisPerPixel = 50,
    this.gap = 16.0,
    this.pauseDurationMs = 1500,
    this.showDotSeparator = true,
    this.dotSize = 4.0,
    this.textAlign = TextAlign.start,
    this.startAtEnd = false,
  }) : assert(maxLines > 0);

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller;
  late final AnimationController _anim;
  Timer? _pauseTimer;
  double _lastTextWidth = 0.0;
  double _lastParentWidth = 0.0;
  bool _overflows = false;

  double get _startOffset =>
      widget.startAtEnd ? math.max(0, _lastTextWidth - _lastParentWidth) : 0;

  double get _endOffset => widget.maxLines > 1
      ? _lastTextWidth
      : widget.startAtEnd
      ? 0
      : _lastTextWidth + widget.gap;

  /// What gets painted and measured, the spans when given, otherwise [text].
  TextSpan get _span => widget.spans != null
      ? TextSpan(style: widget.style, children: widget.spans)
      : TextSpan(text: widget.text, style: widget.style);

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _anim = AnimationController(vsync: this);
    _anim.addListener(_onTick);
    _anim.addStatusListener(_onAnimationStatus);
  }

  @override
  void dispose() {
    _pauseTimer?.cancel();
    _anim.removeListener(_onTick);
    _anim.removeStatusListener(_onAnimationStatus);
    _anim.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text ||
        oldWidget.style != widget.style ||
        oldWidget.maxLines != widget.maxLines) {
      if (_controller.hasClients) {
        _controller.jumpTo(0);
      }
      _pauseTimer?.cancel();
      _pauseTimer = null;
      _anim.stop();
      _anim.value = 0.0;
    }
  }

  void _onTick() {
    if (_controller.hasClients) {
      final offset = _startOffset + _anim.value * (_endOffset - _startOffset);
      _controller.jumpTo(offset);
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    if (_controller.hasClients) _controller.jumpTo(_startOffset);
    _anim.value = 0;
    _scheduleScroll();
  }

  void _scheduleScroll() {
    if (!_overflows || _pauseTimer != null || _anim.isAnimating) return;
    _pauseTimer = Timer(Duration(milliseconds: widget.pauseDurationMs), () {
      _pauseTimer = null;
      if (mounted && _overflows) _anim.forward(from: 0);
    });
  }

  void _updateAnimation(double textWidth, double parentWidth) {
    if (!mounted) return;

    _lastTextWidth = textWidth;
    _lastParentWidth = parentWidth;

    _overflows = textWidth > parentWidth;
    if (!_overflows) {
      _pauseTimer?.cancel();
      _pauseTimer = null;
      if (_anim.isAnimating) {
        _anim.stop();
      }
      if (_controller.hasClients && _controller.offset != 0) {
        _controller.jumpTo(0);
      }
      return;
    }

    if (!_anim.isAnimating && _controller.hasClients) {
      _controller.jumpTo(_startOffset);
    }
    final scrollDistance = (_endOffset - _startOffset).abs();
    final scrollDurationMs = (scrollDistance * widget.millisPerPixel).toInt();
    final newDuration = Duration(milliseconds: scrollDurationMs);

    if (_anim.duration != newDuration) {
      _anim.duration = newDuration;
    }
    _scheduleScroll();
  }

  @override
  Widget build(BuildContext context) {
    final span = _span;

    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;

        if (widget.maxLines > 1) {
          final scaler = MediaQuery.textScalerOf(context);
          final direction =
              Directionality.maybeOf(context) ?? TextDirection.ltr;
          final linePainter = TextPainter(
            text: TextSpan(text: 'Ag', style: widget.style),
            textDirection: direction,
            maxLines: 1,
            textScaler: scaler,
          )..layout();
          final lineHeight = linePainter.height;
          linePainter.dispose();
          final parentHeight = constraints.maxHeight.isFinite
              ? constraints.maxHeight
              : lineHeight * widget.maxLines;
          final textPainter =
              TextPainter(
                text: span,
                textDirection: direction,
                textScaler: scaler,
              )..layout(
                maxWidth: parentWidth.isFinite ? parentWidth : double.infinity,
              );
          final textHeight = textPainter.height;
          textPainter.dispose();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updateAnimation(textHeight, parentHeight);
          });

          if (textHeight <= parentHeight + 0.5) {
            return SizedBox(
              width: parentWidth.isFinite ? parentWidth : null,
              height: parentHeight,
              child: widget.spans == null
                  ? Text(
                      widget.text,
                      style: widget.style,
                      maxLines: widget.maxLines,
                      overflow: TextOverflow.ellipsis,
                      textAlign: widget.textAlign,
                    )
                  : Text.rich(
                      span,
                      maxLines: widget.maxLines,
                      overflow: TextOverflow.ellipsis,
                      textAlign: widget.textAlign,
                    ),
            );
          }

          return SizedBox(
            width: parentWidth.isFinite ? parentWidth : null,
            height: parentHeight,
            child: SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                width: parentWidth.isFinite ? parentWidth : null,
                child: Text.rich(span, textAlign: widget.textAlign),
              ),
            ),
          );
        }

        final textPainter = TextPainter(
          text: span,
          textDirection: Directionality.maybeOf(context) ?? TextDirection.ltr,
          maxLines: 1,
          textScaler: MediaQuery.textScalerOf(context),
        )..layout();
        final textWidth = textPainter.width;
        textPainter.dispose();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateAnimation(textWidth, parentWidth);
        });

        final overflows = textWidth > parentWidth;

        if (!overflows) {
          return widget.spans == null
              ? Text(
                  widget.text,
                  style: widget.style,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: widget.textAlign,
                )
              : Text.rich(
                  span,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: widget.textAlign,
                );
        }

        final Widget separatorWidget;
        if (widget.showDotSeparator) {
          final pad = ((widget.gap - widget.dotSize) / 2).clamp(
            0.0,
            widget.gap,
          );
          final dotColor =
              widget.style.color?.withValues(alpha: 0.7) ?? Colors.white70;
          separatorWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: pad),
              Center(
                child: Container(
                  width: widget.dotSize,
                  height: widget.dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor,
                  ),
                ),
              ),
              SizedBox(width: pad),
            ],
          );
        } else {
          separatorWidget = SizedBox(width: widget.gap);
        }

        final scrollView = SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              Text.rich(span, maxLines: 1),
              separatorWidget,
              Text.rich(span, maxLines: 1),
            ],
          ),
        );

        return parentWidth.isFinite
            ? SizedBox(width: parentWidth, child: scrollView)
            : scrollView;
      },
    );
  }
}
