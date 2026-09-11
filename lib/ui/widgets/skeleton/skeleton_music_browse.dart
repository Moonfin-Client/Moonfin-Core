import 'package:flutter/material.dart';

import '../../../util/platform_detection.dart';
import 'skeleton_shimmer.dart';

/// Skeleton placeholder screen for the music / audio browse landing page.
class SkeletonMusicBrowse extends StatelessWidget {
  const SkeletonMusicBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformDetection.useMobileUi;
    final isDesktop = PlatformDetection.useDesktopUi;
    final isTV = PlatformDetection.isTV;

    final horizontalPadding = isMobile ? 20.0 : 60.0;
    final cardSize = isMobile ? 112.0 : (isTV ? 168.0 : 148.0);
    const cardSpacing = 12.0;
    final heroHeight = isMobile ? 108.0 : (isTV ? 220.0 : 168.0);

    return SkeletonShimmer(
      child: ListView(
        padding: const EdgeInsets.only(top: 24, bottom: 120),
        physics: const NeverScrollableScrollPhysics(),
      children: [
        // 1. Hero banner placeholder
        Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            isMobile ? 4 : 8,
            horizontalPadding,
            isMobile ? 8 : 12,
          ),
          child: Container(
            height: heroHeight,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SkeletonBox(
                  width: heroHeight - 32,
                  height: heroHeight - 32,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkeletonBox(
                        width: 220,
                        height: 22,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 10),
                      SkeletonBox(
                        width: 140,
                        height: 14,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      SkeletonBox(
                        width: 80,
                        height: 12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2. Category chips bar (mobile/TV)
        if (!isDesktop)
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(horizontalPadding, 6, horizontalPadding, 8),
              itemCount: 5,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) => SkeletonBox(
                width: 96,
                height: 38,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

        // 3. Music rows (horizontal strips of square cards)
        for (int r = 0; r < 3; r++) ...[
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              16,
              horizontalPadding,
              8,
            ),
            child: SkeletonBox(
              width: 140.0 + (r * 20),
              height: 18,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: cardSize + 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(horizontalPadding, 6, horizontalPadding, 12),
              itemCount: 8,
              separatorBuilder: (_, _) => const SizedBox(width: cardSpacing),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SkeletonBox(
                    width: cardSize,
                    height: cardSize,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 8),
                  SkeletonBox(
                    width: cardSize * 0.75,
                    height: 14,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 6),
                  SkeletonBox(
                    width: cardSize * 0.5,
                    height: 11,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
}
