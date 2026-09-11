import 'package:flutter/material.dart';

import 'skeleton_shimmer.dart';

/// Skeleton placeholder screen displayed while an item detail page is loading.
/// Supports both Modern and Classic layout structures.
class DetailScreenSkeleton extends StatelessWidget {
  final bool isModern;

  const DetailScreenSkeleton({
    super.key,
    required this.isModern,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonShimmer(
      child: isModern ? _buildModern(context) : _buildClassic(context),
    );
  }

  Widget _buildModern(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final topInset = 70.0;
    final leftPadding = 40.0;

    return Stack(
      children: [
        // Hero backdrop placeholder
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.height * 0.55,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withAlpha(25),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Content
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.fromLTRB(leftPadding, topInset + 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo placeholder (reserved space to eliminate layout shift)
                SkeletonBox(
                  width: 240,
                  height: 64,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(height: 10),
                // Title placeholder
                SkeletonBox(
                  width: size.width * 0.35,
                  height: 40,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(height: 12),
                // Metadata pills
                Row(
                  children: [
                    SkeletonBox(width: 56, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 72, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 48, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 60, height: 20, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 14),
                // Rating badge placeholder
                SkeletonBox(
                  width: 52,
                  height: 24,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 18),
                // Action buttons row (Play button pill + circular action buttons)
                Row(
                  children: [
                    SkeletonBox(width: 120, height: 46, borderRadius: BorderRadius.circular(23)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 46, height: 46, borderRadius: BorderRadius.circular(23)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 46, height: 46, borderRadius: BorderRadius.circular(23)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 46, height: 46, borderRadius: BorderRadius.circular(23)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 46, height: 46, borderRadius: BorderRadius.circular(23)),
                  ],
                ),
                const SizedBox(height: 28),
                // Bottom tabs row
                Row(
                  children: [
                    SkeletonBox(width: 90, height: 32, borderRadius: BorderRadius.circular(16)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 70, height: 32, borderRadius: BorderRadius.circular(16)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 70, height: 32, borderRadius: BorderRadius.circular(16)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 85, height: 32, borderRadius: BorderRadius.circular(16)),
                    const SizedBox(width: 14),
                    SkeletonBox(width: 75, height: 32, borderRadius: BorderRadius.circular(16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClassic(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Poster card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SkeletonBox(
                width: 240,
                height: 360,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: 20),
              SkeletonBox(
                width: 240,
                height: 48,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          ),
          const SizedBox(width: 48),
          // Right metadata
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Title
                SkeletonBox(
                  width: size.width * 0.45,
                  height: 40,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(height: 16),
                // Subtitle / tags
                Row(
                  children: [
                    SkeletonBox(width: 60, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 12),
                    SkeletonBox(width: 80, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 12),
                    SkeletonBox(width: 50, height: 20, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 28),
                // Overview paragraph
                SkeletonBox(width: double.infinity, height: 14, borderRadius: BorderRadius.circular(4)),
                const SizedBox(height: 10),
                SkeletonBox(width: double.infinity, height: 14, borderRadius: BorderRadius.circular(4)),
                const SizedBox(height: 10),
                SkeletonBox(width: size.width * 0.4, height: 14, borderRadius: BorderRadius.circular(4)),
                const SizedBox(height: 40),
                // People / Cast row placeholder
                SkeletonBox(width: 120, height: 24, borderRadius: BorderRadius.circular(6)),
                const SizedBox(height: 16),
                Row(
                  children: List.generate(
                    6,
                    (_) => Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SkeletonBox(
                            width: 72,
                            height: 72,
                            borderRadius: BorderRadius.circular(36),
                          ),
                          const SizedBox(height: 8),
                          SkeletonBox(
                            width: 60,
                            height: 12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
