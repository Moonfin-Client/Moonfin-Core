import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'bottom_nav_metrics.dart';

/// Places [child] over cell [index] of a row of [count] equal cells and
/// springs it across when the index changes. Positioned from the start edge,
/// so it follows the row when the layout runs right to left.
class BottomNavSlidingMarker extends StatelessWidget {
  final int? index;
  final int count;
  final double width;
  final double height;
  final double top;
  final Widget child;

  const BottomNavSlidingMarker({
    super.key,
    required this.index,
    required this.count,
    required this.width,
    required this.height,
    required this.top,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (count == 0) return const SizedBox.shrink();
        final cell = constraints.maxWidth / count;
        final markerWidth = width > cell - 6 ? cell - 6 : width;
        final current = index ?? 0;
        final target = cell * current + (cell - markerWidth) / 2;
        final visible = index != null;

        Widget place(double start) => Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  start: start,
                  top: top,
                  width: markerWidth,
                  height: height,
                  child: AnimatedOpacity(
                    opacity: visible ? 1 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: child,
                  ),
                ),
              ],
            );

        if (MediaQuery.disableAnimationsOf(context)) return place(target);
        return SpringBuilder(
          value: target,
          spring: GlassSpring.snappy(
            duration: const Duration(milliseconds: 380),
            extraBounce: 0.08,
          ),
          builder: (context, start, _) => place(start),
        );
      },
    );
  }
}

/// The pill the floating styles slide behind the active tab.
class BottomNavPillIndicator extends StatelessWidget {
  final Color color;
  final Color highlight;

  const BottomNavPillIndicator({
    super.key,
    required this.color,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    final fill = color.withValues(alpha: 0.16);
    // A gradient replaces the fill colour when both are given, so the top
    // highlight is blended into the fill here.
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(BottomNavMetrics.indicatorRadius),
        border: Border.all(color: color.withValues(alpha: 0.24)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color.alphaBlend(highlight.withValues(alpha: 0.10), fill),
            fill,
          ],
        ),
      ),
    );
  }
}

/// Strip's glowing tick along the top edge of the active tab.
class BottomNavTick extends StatelessWidget {
  final Color color;

  const BottomNavTick({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppColorScheme.isPixel
            ? BorderRadius.zero
            : const BorderRadius.vertical(bottom: Radius.circular(3)),
        boxShadow: AppColorScheme.isPixel
            ? null
            : [
                BoxShadow(color: color.withValues(alpha: 0.7), blurRadius: 10),
                BoxShadow(
                  color: color.withValues(alpha: 0.35),
                  blurRadius: 18,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
    );
  }
}
