import 'package:flutter/material.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../shared/immersive_spacing.dart';

class ImmersiveDiscoveryRail extends StatelessWidget {
  final String title;
  final List<AggregatedItem> items;
  final bool showSkeleton;
  final Animation<double> opacity;

  final GlobalKey<LockedFocusRowState<AggregatedItem>> rowKey;

  final String hubKey;
  final ScrollController controller;

  final bool Function() onNavigateUp;
  final bool Function() onNavigateDown;

  final VoidCallback? onLeftEdge;

  final ValueChanged<AggregatedItem> onTap;

  final Widget Function(
    BuildContext context,
    AggregatedItem item,
    double width,
    bool isFocused,
  )
  itemBuilder;

  const ImmersiveDiscoveryRail({
    super.key,
    required this.title,
    required this.items,
    required this.showSkeleton,
    required this.opacity,
    required this.rowKey,
    required this.hubKey,
    required this.controller,
    required this.onNavigateUp,
    required this.onNavigateDown,
    this.onLeftEdge,
    required this.onTap,
    required this.itemBuilder,
  });

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final compact = _isCompactMobile(context);

        final layout = _layoutFor(availableWidth, compact: compact);

        final textTheme = Theme.of(context).textTheme;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: compact
                  ? textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )
                  : textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),

            SizedBox(
              height: compact
                  ? ImmersiveSpacing.mobileTitleToContent
                  : ImmersiveSpacing.titleToContent,
            ),

            SizedBox(
              width: double.infinity,
              height: layout.cardHeight,
              child: FadeTransition(
                opacity: opacity,
                child: items.isNotEmpty
                    ? _buildRail(context, layout)
                    : showSkeleton
                    ? IgnorePointer(child: _buildSkeletonRail(layout))
                    : const SizedBox.expand(),
              ),
            ),
          ],
        );
      },
    );
  }

  _DiscoveryRailLayout _layoutFor(
    double availableWidth, {
    required bool compact,
  }) {
    if (compact) {
      final metrics = ImmersiveSpacing.compactDiscovery;

      final cardWidth = metrics.itemWidth(availableWidth);

      final posterHeight = cardWidth * 3 / 2;

      const captionGap = 9.0;
      const captionHeight = 42.0;

      return _DiscoveryRailLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        cardSpacing: metrics.gap,
        posterHeight: posterHeight,
        cardHeight: posterHeight + captionGap + captionHeight,
        compact: true,
      );
    }

    final cardSpacing = ImmersiveSpacing.railItemGap;

    final visibleItemCount = ImmersiveSpacing.discoveryVisibleItemCount;

    final cardWidth =
        (availableWidth - visibleItemCount.floor() * cardSpacing) /
        visibleItemCount;

    final posterHeight = cardWidth * 3 / 2;

    return _DiscoveryRailLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      cardSpacing: cardSpacing,
      posterHeight: posterHeight,
      cardHeight: posterHeight,
      compact: false,
    );
  }

  Widget _buildRail(BuildContext context, _DiscoveryRailLayout layout) {
    return OverflowBox(
      alignment: Alignment.topLeft,
      minWidth: layout.viewportWidth,
      maxWidth: layout.viewportWidth,
      minHeight: layout.cardHeight,
      maxHeight: layout.cardHeight,
      child: SizedBox(
        width: layout.viewportWidth,
        height: layout.cardHeight,
        child: LockedFocusRow<AggregatedItem>(
          key: rowKey,
          items: items,
          hubKey: hubKey,
          controller: controller,
          height: layout.cardHeight,
          itemExtent: layout.itemExtent,
          clipBehavior: Clip.none,
          onLeftEdge: onLeftEdge,
          onVerticalNavigation: (isUp) {
            return isUp ? onNavigateUp() : onNavigateDown();
          },
          onTap: (_, item) {
            onTap(item);
          },
          itemBuilder: (context, item, index, isFocused) {
            final hasNext = index < items.length - 1;

            return Padding(
              padding: EdgeInsets.only(right: hasNext ? layout.cardSpacing : 0),
              child: itemBuilder(context, item, layout.cardWidth, isFocused),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSkeletonRail(_DiscoveryRailLayout layout) {
    final placeholderCount = layout.compact
        ? (layout.viewportWidth / layout.itemExtent).ceil() + 1
        : ImmersiveSpacing.discoveryVisibleItemCount.ceil() + 1;

    return OverflowBox(
      alignment: Alignment.topLeft,
      minWidth: layout.viewportWidth,
      maxWidth: layout.viewportWidth,
      minHeight: layout.cardHeight,
      maxHeight: layout.cardHeight,
      child: SizedBox(
        width: layout.viewportWidth,
        height: layout.cardHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          itemCount: placeholderCount,
          separatorBuilder: (_, _) {
            return SizedBox(width: layout.cardSpacing);
          },
          itemBuilder: (_, _) {
            return _DiscoveryPlaceholderCard(
              width: layout.cardWidth,
              posterHeight: layout.posterHeight,
              totalHeight: layout.cardHeight,
              showCaption: layout.compact,
            );
          },
        ),
      ),
    );
  }
}

class _DiscoveryPlaceholderCard extends StatelessWidget {
  final double width;
  final double posterHeight;
  final double totalHeight;
  final bool showCaption;

  const _DiscoveryPlaceholderCard({
    required this.width,
    required this.posterHeight,
    required this.totalHeight,
    required this.showCaption,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    if (!showCaption) {
      return Container(
        width: width,
        height: posterHeight,
        decoration: BoxDecoration(
          color: foreground.withValues(alpha: 0.035),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: foreground.withValues(alpha: 0.08)),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: totalHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: posterHeight,
            decoration: BoxDecoration(
              color: foreground.withValues(alpha: 0.035),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: foreground.withValues(alpha: 0.08)),
            ),
          ),

          const SizedBox(height: 9),

          Center(
            child: Container(
              width: width * 0.72,
              height: 12,
              decoration: BoxDecoration(
                color: foreground.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoveryRailLayout {
  final double viewportWidth;
  final double cardWidth;
  final double cardSpacing;
  final double posterHeight;
  final double cardHeight;
  final bool compact;

  const _DiscoveryRailLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.cardSpacing,
    required this.posterHeight,
    required this.cardHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
