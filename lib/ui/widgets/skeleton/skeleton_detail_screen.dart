import 'package:flutter/material.dart';

import '../../../preference/preference_constants.dart';
import 'skeleton_shimmer.dart';

/// Skeleton placeholder screen displayed while an item detail page is loading.
/// Supports Classic, Modern, Spotlight, and Nouveau layout structures.
class DetailScreenSkeleton extends StatelessWidget {
  final DetailScreenStyle style;

  const DetailScreenSkeleton({
    super.key,
    DetailScreenStyle? style,
    bool? isModern,
  }) : style = style ??
            (isModern != null
                ? (isModern ? DetailScreenStyle.modern : DetailScreenStyle.classic)
                : DetailScreenStyle.modern);

  bool get isModern => style == DetailScreenStyle.modern;

  @override
  Widget build(BuildContext context) {
    return SkeletonShimmer(
      child: switch (style) {
        DetailScreenStyle.classic => _buildClassic(context),
        DetailScreenStyle.modern => _buildModern(context),
        DetailScreenStyle.spotlight => _buildSpotlight(context),
        DetailScreenStyle.nouveau => _buildNouveau(context),
      },
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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(leftPadding, topInset + 10, 40, 20),
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

  Widget _buildSpotlight(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width >= size.height;
    final topInset = isLandscape ? 60.0 : 40.0;
    final horizontalPadding = isLandscape ? 40.0 : 20.0;
    final heroWidth = isLandscape
        ? (size.width * 0.85).clamp(450.0, 1100.0)
        : double.infinity;

    return Stack(
      children: [
        // Cinematic backdrop gradient
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: isLandscape ? Alignment.centerRight : Alignment.topCenter,
                end: isLandscape ? Alignment.centerLeft : Alignment.bottomCenter,
                colors: [
                  Colors.white.withAlpha(25),
                  Colors.white.withAlpha(8),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ),
        // Content
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              topInset,
              horizontalPadding,
              30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: heroWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tagline placeholder
                      SkeletonBox(
                        width: 140,
                        height: 14,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 10),
                      // Title / Logo placeholder
                      SkeletonBox(
                        width: isLandscape ? 320 : size.width * 0.65,
                        height: isLandscape ? 64 : 48,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      const SizedBox(height: 12),
                      // Metadata dot-separated row
                      Row(
                        children: [
                          SkeletonBox(width: 50, height: 18, borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          SkeletonBox(width: 42, height: 18, borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          SkeletonBox(width: 60, height: 18, borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          SkeletonBox(width: 75, height: 18, borderRadius: BorderRadius.circular(4)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Tech badges row
                      Row(
                        children: [
                          SkeletonBox(width: 48, height: 20, borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          SkeletonBox(width: 44, height: 20, borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          SkeletonBox(width: 44, height: 20, borderRadius: BorderRadius.circular(4)),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Overview lines
                      SkeletonBox(
                        width: isLandscape ? 680 : double.infinity,
                        height: 14,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      SkeletonBox(
                        width: isLandscape ? 620 : size.width * 0.85,
                        height: 14,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      SkeletonBox(
                        width: isLandscape ? 450 : size.width * 0.55,
                        height: 14,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 20),
                      // Action buttons row (Play pill + circular action buttons)
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
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                // Bottom Spotlight summary cards band
                if (isLandscape)
                  Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: index < 3 ? 16.0 : 0.0),
                          child: _buildSpotlightSummaryCard(),
                        ),
                      );
                    }),
                  )
                else
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (_, _) => SizedBox(
                        width: 220,
                        child: _buildSpotlightSummaryCard(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpotlightSummaryCard() {
    return Container(
      height: 135,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withAlpha(20),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SkeletonBox(
              width: 22,
              height: 22,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBox(
                width: 80,
                height: 14,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 6),
              SkeletonBox(
                width: 50,
                height: 10,
                borderRadius: BorderRadius.circular(3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNouveau(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width >= size.height;
    final topInset = isLandscape ? 60.0 : 40.0;
    final horizontalPadding = isLandscape ? 56.0 : 20.0;

    return Stack(
      children: [
        // Backdrop placeholder
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.height * 0.60,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withAlpha(30),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Content with stacked sections
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              topInset,
              horizontalPadding,
              40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top genres text placeholder
                SkeletonBox(
                  width: 160,
                  height: 13,
                  borderRadius: BorderRadius.circular(3),
                ),
                const SizedBox(height: 14),
                // Title / Logo
                SkeletonBox(
                  width: isLandscape ? 320 : size.width * 0.7,
                  height: isLandscape ? 64 : 48,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(height: 16),
                // Badges row: Status badge + Seerr pill
                Row(
                  children: [
                    SkeletonBox(width: 64, height: 22, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 76, height: 22, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 12),
                // Metadata row
                Row(
                  children: [
                    SkeletonBox(width: 52, height: 18, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 44, height: 18, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 64, height: 18, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 70, height: 18, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 12),
                // Technical details badges
                Row(
                  children: [
                    SkeletonBox(width: 48, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 44, height: 20, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    SkeletonBox(width: 44, height: 20, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 16),
                // Overview description (3 lines)
                SkeletonBox(
                  width: isLandscape ? 700 : double.infinity,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                SkeletonBox(
                  width: isLandscape ? 640 : size.width * 0.85,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                SkeletonBox(
                  width: isLandscape ? 460 : size.width * 0.55,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 22),
                // Action buttons row (Play pill + circular buttons)
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
                const SizedBox(height: 36),
                // Stacked Section 1: Episodes / Media row
                SkeletonBox(
                  width: 140,
                  height: 22,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 6,
                    separatorBuilder: (_, _) => const SizedBox(width: 14),
                    itemBuilder: (_, _) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonBox(
                          width: 200,
                          height: 116,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(height: 8),
                        SkeletonBox(
                          width: 120,
                          height: 12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                // Stacked Section 2: Cast & Crew
                SkeletonBox(
                  width: 120,
                  height: 22,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 96,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 8,
                    separatorBuilder: (_, _) => const SizedBox(width: 18),
                    itemBuilder: (_, _) => Column(
                      children: [
                        SkeletonBox(
                          width: 64,
                          height: 64,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        const SizedBox(height: 8),
                        SkeletonBox(
                          width: 54,
                          height: 10,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                  ),
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
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
