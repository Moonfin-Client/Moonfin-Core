import 'package:flutter/material.dart';

import 'bottom_nav_indicator.dart';
import 'bottom_nav_metrics.dart';
import 'bottom_nav_tab.dart';
import 'bottom_nav_theme.dart';

/// Dock: a floating pill with a label under every tab and a pill that springs
/// behind the active one. The mini player floats just above it as a pane of
/// its own.
class DockBarView extends StatelessWidget {
  final List<BottomNavItemView> items;
  final int? activeIndex;
  final BottomNavTheme theme;
  final ValueChanged<int>? onTap;
  final Widget? miniPlayer;
  final double bottomInset;
  final double horizontalInset;

  /// False while a screen hides the navigation chrome. The mini player stays.
  final bool tabsVisible;

  const DockBarView({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.theme,
    required this.bottomInset,
    this.horizontalInset = 0,
    this.onTap,
    this.miniPlayer,
    this.tabsVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    final side = BottomNavMetrics.floatingInset + horizontalInset;
    final active = activeIndex;
    final activeSlot = active == null ? 0 : items[active].slot;

    final tabs = SizedBox(
      height: BottomNavMetrics.dockHeight,
      child: BottomNavSurface(
        theme: theme,
        radius: BottomNavMetrics.dockRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Stack(
            children: [
              Positioned.fill(
                child: BottomNavSlidingMarker(
                  index: active,
                  count: items.length,
                  width: BottomNavMetrics.indicatorWidth,
                  height: BottomNavMetrics.indicatorHeight,
                  top: (BottomNavMetrics.dockHeight -
                          BottomNavMetrics.indicatorHeight) /
                      2,
                  child: BottomNavPillIndicator(
                    color: theme.indicatorColor(activeSlot),
                    highlight: theme.onBar,
                  ),
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i < items.length; i++)
                    Expanded(child: _cell(i)),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        side,
        0,
        side,
        BottomNavMetrics.floatingBottomGap(bottomInset),
      ),
      child: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: BottomNavMetrics.dockMaxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (miniPlayer != null) ...[
                miniPlayer!,
                const SizedBox(height: BottomNavMetrics.capsulePlayerGap),
              ],
              AnimatedOpacity(
                opacity: tabsVisible ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(ignoring: !tabsVisible, child: tabs),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cell(int i) {
    final item = items[i];
    final active = i == activeIndex;
    final color = active
        ? theme.activeColor(item.slot)
        : theme.inactiveColor(item.slot);
    return BottomNavTabCell(
      item: item,
      active: active,
      color: color,
      labelStyle: theme.label(active: active, color: color),
      onTap: onTap == null ? null : () => onTap!(i),
    );
  }
}
