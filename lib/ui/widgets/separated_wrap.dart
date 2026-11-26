import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Lays [children] out in lines like a [Wrap], with [separator] between
/// neighbors on the same line. A separator never starts or ends a line.
class SeparatedWrap extends MultiChildRenderObjectWidget {
  SeparatedWrap({
    super.key,
    required List<Widget> children,
    required Widget separator,
    this.spacing = 0,
    this.runSpacing = 0,
  }) : super(
         children: [
           for (var i = 0; i < children.length; i++) ...[
             if (i > 0) separator,
             children[i],
           ],
         ],
       );

  final double spacing;
  final double runSpacing;

  @override
  RenderSeparatedWrap createRenderObject(BuildContext context) =>
      RenderSeparatedWrap(
        spacing: spacing,
        runSpacing: runSpacing,
        textDirection: Directionality.of(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSeparatedWrap renderObject,
  ) {
    renderObject
      ..spacing = spacing
      ..runSpacing = runSpacing
      ..textDirection = Directionality.of(context);
  }
}

class _SeparatedWrapParentData extends ContainerBoxParentData<RenderBox> {
  bool visible = false;
}

/// Children alternate item, separator, item. Each line centers its children
/// vertically on the tallest one.
class RenderSeparatedWrap extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _SeparatedWrapParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _SeparatedWrapParentData> {
  RenderSeparatedWrap({
    required this._spacing,
    required this._runSpacing,
    required this._textDirection,
  });

  double _spacing;
  set spacing(double value) {
    if (value == _spacing) return;
    _spacing = value;
    markNeedsLayout();
  }

  double _runSpacing;
  set runSpacing(double value) {
    if (value == _runSpacing) return;
    _runSpacing = value;
    markNeedsLayout();
  }

  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (value == _textDirection) return;
    _textDirection = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _SeparatedWrapParentData) {
      child.parentData = _SeparatedWrapParentData();
    }
  }

  Size _layout(
    BoxConstraints constraints,
    ChildLayouter layoutChild, {
    required bool place,
  }) {
    final children = getChildrenAsList();
    final loose = BoxConstraints(maxWidth: constraints.maxWidth);
    final sizes = [for (final child in children) layoutChild(child, loose)];

    final runs = <List<int>>[];
    final runWidths = <double>[];
    for (var i = 0; i < children.length; i += 2) {
      final width = sizes[i].width;
      if (runs.isNotEmpty) {
        final joined =
            runWidths.last + _spacing * 2 + sizes[i - 1].width + width;
        if (joined <= constraints.maxWidth) {
          runs.last.addAll([i - 1, i]);
          runWidths.last = joined;
          continue;
        }
      }
      runs.add([i]);
      runWidths.add(width);
    }

    final runHeights = [
      for (final run in runs) run.map((i) => sizes[i].height).reduce(math.max),
    ];
    final size = constraints.constrain(
      Size(
        runWidths.fold(0.0, math.max),
        runHeights.fold(0.0, (a, b) => a + b) +
            _runSpacing * math.max(0, runs.length - 1),
      ),
    );
    if (!place) return size;

    for (final child in children) {
      (child.parentData! as _SeparatedWrapParentData).visible = false;
    }
    var y = 0.0;
    for (var r = 0; r < runs.length; r++) {
      var x = 0.0;
      for (final i in runs[r]) {
        final data = children[i].parentData! as _SeparatedWrapParentData;
        final dx = _textDirection == TextDirection.rtl
            ? size.width - x - sizes[i].width
            : x;
        data
          ..visible = true
          ..offset = Offset(dx, y + (runHeights[r] - sizes[i].height) / 2);
        x += sizes[i].width + _spacing;
      }
      y += runHeights[r] + _runSpacing;
    }
    return size;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _layout(constraints, ChildLayoutHelper.dryLayoutChild, place: false);

  @override
  void performLayout() {
    size = _layout(constraints, ChildLayoutHelper.layoutChild, place: true);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var child = firstChild;
    while (child != null) {
      final data = child.parentData! as _SeparatedWrapParentData;
      if (data.visible) context.paintChild(child, data.offset + offset);
      child = data.nextSibling;
    }
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    visitChildren((child) {
      if ((child.parentData! as _SeparatedWrapParentData).visible) {
        visitor(child);
      }
    });
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    var child = lastChild;
    while (child != null) {
      final current = child;
      final data = current.parentData! as _SeparatedWrapParentData;
      if (data.visible &&
          result.addWithPaintOffset(
            offset: data.offset,
            position: position,
            hitTest: (result, transformed) =>
                current.hitTest(result, position: transformed),
          )) {
        return true;
      }
      child = data.previousSibling;
    }
    return false;
  }
}
