import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void revealInNearestScrollable(
  BuildContext context, {
  required double alignment,
  Duration duration = const Duration(milliseconds: 200),
  Curve curve = Curves.easeOut,
}) {
  final scrollable = Scrollable.maybeOf(context);
  final renderObject = context.findRenderObject();
  if (scrollable == null || renderObject is! RenderBox) return;
  final position = scrollable.position;
  final target = RenderAbstractViewport.of(renderObject)
      .getOffsetToReveal(renderObject, alignment)
      .offset
      .clamp(position.minScrollExtent, position.maxScrollExtent)
      .toDouble();
  unawaited(position.animateTo(target, duration: duration, curve: curve));
}

bool stepScrollWithinContextBounds(
  BuildContext context, {
  required bool down,
  double step = 64.0,
  Duration duration = const Duration(milliseconds: 160),
}) {
  final scrollable = Scrollable.maybeOf(context);
  if (scrollable == null) return false;

  final position = scrollable.position;
  final renderObject = context.findRenderObject();
  if (renderObject is! RenderBox || !renderObject.attached) {
    return false;
  }

  final viewport = RenderAbstractViewport.of(renderObject);
  final lowerBound = viewport
      .getOffsetToReveal(renderObject, 0.0)
      .offset
      .clamp(position.minScrollExtent, position.maxScrollExtent)
      .toDouble();
  final upperBound = viewport
      .getOffsetToReveal(renderObject, 1.0)
      .offset
      .clamp(position.minScrollExtent, position.maxScrollExtent)
      .toDouble();
  if (upperBound - lowerBound < 0.5) {
    return false;
  }

  final delta = down ? step : -step;
  final target = (position.pixels + delta)
      .clamp(lowerBound, upperBound)
      .toDouble();
  if ((target - position.pixels).abs() < 0.5) {
    return false;
  }

  unawaited(
    position.animateTo(target, duration: duration, curve: Curves.easeOut),
  );
  return true;
}
