import 'package:flutter/material.dart';

import 'bottom_nav_indicator.dart';
import 'bottom_nav_metrics.dart';
import 'bottom_nav_tab.dart';
import 'bottom_nav_theme.dart';

/// Strip: an edge to edge bar the content fades into, a glowing tick over the
/// active tab, and the mini player docked into the same surface.
class StripBarView extends StatelessWidget {
  final List<BottomNavItemView> items;
  final int? activeIndex;
  final BottomNavTheme theme;
  final ValueChanged<int>? onTap;

  /// A [BottomMiniPlayerVariant.row] player, drawn above the tabs.
  final Widget? miniPlayer;
  final double bottomInset;
  final double horizontalInset;
  final bool tabsVisible;

  const StripBarView({
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

  static const double _tickWidth = 22;
  static const double _tickHeight = 3;
  static const double _fadeHeight = 24;

  @override
  Widget build(BuildContext context) {
    final active = activeIndex;
    final activeSlot = active == null ? 0 : items[active].slot;

    final tabs = SizedBox(
      height: BottomNavMetrics.stripHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalInset),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: BottomNavMetrics.stripMaxWidth,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: BottomNavSlidingMarker(
                    index: active,
                    count: items.length,
                    width: _tickWidth,
                    height: _tickHeight,
                    top: 0,
                    child: BottomNavTick(
                      color: theme.indicatorColor(activeSlot),
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
      ),
    );

    // With the tabs hidden and nothing playing there is nothing left to show,
    // so the whole strip fades. With music it shrinks to the player.
    final hasPlayer = miniPlayer != null;
    final surface = BottomNavSurface(
      theme: theme,
      radius: 0,
      topOnly: true,
      shadow: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ?miniPlayer,
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: tabsVisible || !hasPlayer
                ? IgnorePointer(ignoring: !tabsVisible, child: tabs)
                : const SizedBox(width: double.infinity),
          ),
          SizedBox(height: bottomInset),
        ],
      ),
    );

    return AnimatedOpacity(
      opacity: tabsVisible || hasPlayer ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Blur already softens the edge under glass, a flat bar needs the
          // content to fade into it instead of stopping at a hard line.
          if (!theme.glass)
            IgnorePointer(
              child: Container(
                height: _fadeHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.surface.withValues(alpha: 0),
                      theme.surface.withValues(alpha: 0.6),
                    ],
                  ),
                ),
              ),
            ),
          surface,
        ],
      ),
    );
  }

  Widget _cell(int i) {
    final item = items[i];
    final active = i == activeIndex;
    final color = active
        ? theme.activeColor(item.slot, accentTinted: false)
        : theme.inactiveColor(item.slot, alpha: 0.55);
    return BottomNavTabCell(
      item: item,
      active: active,
      color: color,
      labelStyle: theme.label(active: active, color: color),
      onTap: onTap == null ? null : () => onTap!(i),
    );
  }
}
