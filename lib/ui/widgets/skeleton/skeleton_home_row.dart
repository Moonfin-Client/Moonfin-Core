import 'package:flutter/material.dart';

import 'skeleton_shimmer.dart';

/// Renders a row of skeleton card placeholders while home sections are fetching.
class SkeletonHomeRow extends StatelessWidget {
  final double cardWidth;
  final double imageHeight;
  final double itemSpacing;
  final double leadingPadding;
  final bool isModern;
  final int count;

  const SkeletonHomeRow({
    super.key,
    required this.cardWidth,
    required this.imageHeight,
    this.itemSpacing = 16.0,
    this.leadingPadding = 16.0,
    this.isModern = false,
    this.count = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonShimmer(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: leadingPadding, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(count, (index) {
            return Padding(
              padding: EdgeInsets.only(right: itemSpacing),
              child: SizedBox(
                width: cardWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SkeletonBox(
                      width: cardWidth,
                      height: imageHeight,
                      borderRadius: BorderRadius.circular(isModern ? 12 : 8),
                    ),
                    const SizedBox(height: 8),
                    SkeletonBox(
                      width: cardWidth * 0.75,
                      height: 14,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    if (isModern) ...[
                      const SizedBox(height: 6),
                      SkeletonBox(
                        width: cardWidth * 0.5,
                        height: 11,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
