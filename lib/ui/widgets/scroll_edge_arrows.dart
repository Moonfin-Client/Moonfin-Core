import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/platform_detection.dart';

/// Buttons over the ends of a sideways row on desktop, since a mouse wheel
/// only scrolls up and down. Each one shows while there's more that way, and
/// a press moves the row most of a screen's worth.
class ScrollEdgeArrows extends StatefulWidget {
  final ScrollController controller;
  final double size;
  final Widget child;

  const ScrollEdgeArrows({
    super.key,
    required this.controller,
    this.size = 44,
    required this.child,
  });

  @override
  State<ScrollEdgeArrows> createState() => _ScrollEdgeArrowsState();
}

class _ScrollEdgeArrowsState extends State<ScrollEdgeArrows> {
  bool _back = false;
  bool _forward = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_refresh);
  }

  @override
  void didUpdateWidget(covariant ScrollEdgeArrows oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) return;
    oldWidget.controller.removeListener(_refresh);
    widget.controller.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    final position = widget.controller.positions.singleOrNull;
    final measured = position != null && position.hasContentDimensions;
    final back = measured && position.extentBefore > 1;
    final forward = measured && position.extentAfter > 1;
    if (!mounted || (back == _back && forward == _forward)) return;
    setState(() {
      _back = back;
      _forward = forward;
    });
  }

  void _page(int direction) {
    final position = widget.controller.positions.singleOrNull;
    position?.animateTo(
      (position.pixels + direction * position.viewportDimension * 0.8).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeInOut,
    );
  }

  Widget _arrow(IconData icon, int direction) => Center(
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _page(direction),
        canRequestFocus: false,
        customBorder: const CircleBorder(),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorScheme.scrim.withValues(alpha: 0.6),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder,
            ),
          ),
          child: Icon(
            icon,
            color: AppColorScheme.onSurface.withValues(alpha: 0.9),
            size: widget.size * 0.6,
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetection.useDesktopUi) return widget.child;
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (_) {
        _refresh();
        return false;
      },
      child: Stack(
        fit: StackFit.passthrough,
        // Some rows draw past their box on purpose, out to the screen's edge.
        clipBehavior: Clip.none,
        children: [
          widget.child,
          if (_back)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: _arrow(Icons.chevron_left, -1),
            ),
          if (_forward)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: _arrow(Icons.chevron_right, 1),
            ),
        ],
      ),
    );
  }
}
