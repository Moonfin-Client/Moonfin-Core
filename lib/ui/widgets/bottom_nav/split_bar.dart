import 'package:flutter/material.dart';

import '../adaptive/sf_symbol.dart';
import 'bottom_nav_indicator.dart';
import 'bottom_nav_metrics.dart';
import 'bottom_nav_tab.dart';
import 'bottom_nav_theme.dart';

/// Split: the tabs in one capsule and Search as a button of its own. While
/// the user scrolls down it shrinks to the active tab and lets the mini
/// player take the middle.
class SplitBarView extends StatelessWidget {
  /// The capsule's items, which never include Search.
  final List<BottomNavItemView> items;
  final int? activeIndex;
  final BottomNavTheme theme;
  final ValueChanged<int>? onTap;
  final VoidCallback? onSearch;
  final String searchLabel;
  final bool searchActive;

  /// A capsule player, shown above the bar while it is expanded.
  final Widget? miniPlayer;

  /// An inline player, shown between the buttons while it is minimised.
  final Widget? inlinePlayer;
  final bool minimized;

  /// Tapping the minimised capsule brings the tabs back.
  final VoidCallback? onExpand;
  final double bottomInset;
  final double horizontalInset;
  final bool tabsVisible;

  const SplitBarView({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.theme,
    required this.bottomInset,
    required this.searchLabel,
    this.horizontalInset = 0,
    this.onTap,
    this.onSearch,
    this.searchActive = false,
    this.miniPlayer,
    this.inlinePlayer,
    this.minimized = false,
    this.onExpand,
    this.tabsVisible = true,
  });

  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.easeOutCubic;
  static const double _labelMinCell = 58;

  @override
  Widget build(BuildContext context) {
    final side = BottomNavMetrics.floatingInset + 4 + horizontalInset;
    final height = minimized
        ? BottomNavMetrics.splitMinimizedSize
        : BottomNavMetrics.splitHeight;
    final gap = BottomNavMetrics.splitGap;

    final bar = SizedBox(
      height: BottomNavMetrics.splitHeight,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final expandedCapsule = width - BottomNavMetrics.splitHeight - gap;
            return SizedBox(
              height: height,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: _duration,
                    curve: _curve,
                    width: minimized ? height : expandedCapsule,
                    height: height,
                    child: BottomNavSurface(
                      theme: theme,
                      radius: height / 2,
                      child: AnimatedSwitcher(
                        duration: _duration,
                        child: minimized
                            ? _collapsedTab()
                            : _capsuleTabs(key: const ValueKey('tabs')),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: _duration,
                    curve: _curve,
                    width: minimized ? gap : 0,
                  ),
                  Expanded(
                    child: AnimatedOpacity(
                      duration: _duration,
                      opacity: minimized && inlinePlayer != null ? 1 : 0,
                      child: minimized && inlinePlayer != null
                          ? BottomNavSurface(
                              theme: theme,
                              radius: height / 2,
                              child: inlinePlayer!,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: gap),
                  _searchButton(height),
                ],
              ),
            );
          },
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
              AnimatedSize(
                duration: _duration,
                curve: _curve,
                child: !minimized && miniPlayer != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          bottom: BottomNavMetrics.capsulePlayerGap,
                        ),
                        child: miniPlayer,
                      )
                    : const SizedBox(width: double.infinity),
              ),
              AnimatedOpacity(
                opacity: tabsVisible ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(ignoring: !tabsVisible, child: bar),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _capsuleTabs({Key? key}) {
    final active = activeIndex;
    final activeSlot = active == null ? 0 : items[active].slot;
    return LayoutBuilder(
      key: key,
      builder: (context, constraints) {
        final cell = items.isEmpty ? 0.0 : constraints.maxWidth / items.length;
        final showLabels = cell >= _labelMinCell;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Stack(
            children: [
              Positioned.fill(
                child: BottomNavSlidingMarker(
                  index: active,
                  count: items.length,
                  width: BottomNavMetrics.indicatorWidth + 2,
                  height: BottomNavMetrics.indicatorHeight,
                  top: (BottomNavMetrics.splitHeight -
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
                    Expanded(child: _cell(i, showLabel: showLabels)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // The minimised capsule keeps showing where the user is, and tapping it is
  // the way back to the tabs.
  Widget _collapsedTab() {
    final index = activeIndex ?? 0;
    final item = items[index];
    return BottomNavTabCell(
      key: const ValueKey('collapsed'),
      item: item,
      active: true,
      color: theme.activeColor(item.slot),
      labelStyle: theme.labelStyle,
      showLabel: false,
      onTap: onExpand,
    );
  }

  Widget _cell(int i, {required bool showLabel}) {
    final item = items[i];
    final active = i == activeIndex;
    final color = active
        ? theme.activeColor(item.slot)
        : theme.inactiveColor(item.slot, alpha: 0.72);
    return BottomNavTabCell(
      item: item,
      active: active,
      color: color,
      labelStyle: theme.label(active: active, color: color),
      showLabel: showLabel,
      onTap: onTap == null ? null : () => onTap!(i),
    );
  }

  Widget _searchButton(double size) {
    final color = searchActive
        ? theme.activeColor(0)
        : theme.onBar.withValues(alpha: 0.9);
    return AnimatedContainer(
      duration: _duration,
      curve: _curve,
      width: size,
      height: size,
      child: BottomNavSurface(
        theme: theme,
        radius: size / 2,
        child: Semantics(
          button: true,
          selected: searchActive,
          label: searchLabel,
          excludeSemantics: true,
          child: Tooltip(
            message: searchLabel,
            excludeFromSemantics: true,
            child: InkResponse(
              onTap: onSearch,
              containedInkWell: true,
              child: Center(
                child: AdaptiveIcon(
                  Icons.search_rounded,
                  size: BottomNavMetrics.iconSize,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
