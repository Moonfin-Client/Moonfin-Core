import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../top_toolbar.dart';
import 'skeleton_shimmer.dart';

/// Skeleton placeholder screen displayed while an item detail page is loading.
/// Respects active user preferences (detail style, desktop UI scale, navbar position,
/// and metadata display settings) so placeholders align with actual content.
class DetailScreenSkeleton extends StatelessWidget {
  final DetailScreenStyle style;
  final UserPreferences? prefs;

  const DetailScreenSkeleton({
    super.key,
    DetailScreenStyle? style,
    this.prefs,
    bool? isModern,
  }) : style = style ??
            (isModern != null
                ? (isModern ? DetailScreenStyle.modern : DetailScreenStyle.classic)
                : DetailScreenStyle.modern);

  bool get isModern => style == DetailScreenStyle.modern;

  UserPreferences? get _effectivePrefs =>
      prefs ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? GetIt.instance<UserPreferences>()
          : null);

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
    final userPrefs = _effectivePrefs;
    final scale = userPrefs?.get(UserPreferences.desktopUiScale).scaleFactor ?? 1.0;
    final hasLeftSidebar =
        userPrefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = hasLeftSidebar ? 120.0 : 40.0;
    final baseTopInset = TopToolbar.baseHeightFor(context);
    final topInset = (baseTopInset - 12) / scale + (10 / scale);

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
            padding: EdgeInsets.fromLTRB(leftPadding, topInset, 40, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo placeholder (reserved space to eliminate layout shift)
                SkeletonBox(
                  width: 240 * scale,
                  height: 64 * scale,
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: 10 * scale),
                // Title placeholder
                SkeletonBox(
                  width: size.width * 0.35,
                  height: 40 * scale,
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: 12 * scale),
                // Metadata pills
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: [
                      SkeletonBox(width: 56 * scale, height: 20 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 72 * scale, height: 20 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 48 * scale, height: 20 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 60 * scale, height: 20 * scale, borderRadius: BorderRadius.circular(4)),
                    ],
                  ),
                ),
                SizedBox(height: 14 * scale),
                // Rating badge placeholder
                SkeletonBox(
                  width: 52 * scale,
                  height: 24 * scale,
                  borderRadius: BorderRadius.circular(4),
                ),
                SizedBox(height: 18 * scale),
                // Action buttons row (Play button pill + circular action buttons)
                Row(
                  children: [
                    SkeletonBox(width: 120 * scale, height: 46 * scale, borderRadius: BorderRadius.circular(23 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 46 * scale, height: 46 * scale, borderRadius: BorderRadius.circular(23 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 46 * scale, height: 46 * scale, borderRadius: BorderRadius.circular(23 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 46 * scale, height: 46 * scale, borderRadius: BorderRadius.circular(23 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 46 * scale, height: 46 * scale, borderRadius: BorderRadius.circular(23 * scale)),
                  ],
                ),
                SizedBox(height: 28 * scale),
                // Bottom tabs row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: [
                      SkeletonBox(width: 90 * scale, height: 32 * scale, borderRadius: BorderRadius.circular(16 * scale)),
                      SizedBox(width: 14 * scale),
                      SkeletonBox(width: 70 * scale, height: 32 * scale, borderRadius: BorderRadius.circular(16 * scale)),
                      SizedBox(width: 14 * scale),
                      SkeletonBox(width: 70 * scale, height: 32 * scale, borderRadius: BorderRadius.circular(16 * scale)),
                      SizedBox(width: 14 * scale),
                      SkeletonBox(width: 85 * scale, height: 32 * scale, borderRadius: BorderRadius.circular(16 * scale)),
                      SizedBox(width: 14 * scale),
                      SkeletonBox(width: 75 * scale, height: 32 * scale, borderRadius: BorderRadius.circular(16 * scale)),
                    ],
                  ),
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
    final userPrefs = _effectivePrefs;
    final scale = userPrefs?.get(UserPreferences.desktopUiScale).scaleFactor ?? 1.0;
    final hasLeftSidebar =
        userPrefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = isLandscape ? (hasLeftSidebar ? 120.0 : 40.0) : 20.0;
    final baseTopInset = TopToolbar.baseHeightFor(context);
    // Matches SpotlightLandscapeLayout padding calculations
    final topInset = isLandscape
        ? (baseTopInset - 12) / scale + (10 / scale)
        : (size.height * 0.26 + baseTopInset);

    final heroWidth = isLandscape
        ? (size.width * 0.85).clamp(450.0, 1100.0)
        : double.infinity;
    final cardHeight = isLandscape
        ? math.min(
            200.0 * scale,
            math.max(120.0, size.height * 0.28),
          )
        : 140.0;

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
              leftPadding,
              topInset,
              isLandscape ? 40.0 : 20.0,
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
                      // Tagline placeholder (e.g. A DOUBLE FEATURE THAT'LL TEAR YOU IN TWO!)
                      SkeletonBox(
                        width: 240 * scale,
                        height: 12 * scale,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      SizedBox(height: 8 * scale),
                      // Title / Logo placeholder
                      SkeletonBox(
                        width: isLandscape ? 280 * scale : size.width * 0.65,
                        height: isLandscape ? 48 * scale : 40 * scale,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(height: 8 * scale),
                      // Metadata row (year · rating · runtime · genres)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        child: Row(
                          children: [
                            SkeletonBox(width: 40 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 24 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 54 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 140 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                          ],
                        ),
                      ),
                      SizedBox(height: 8 * scale),
                      // Ratings badges row (IMDb, TMDb, Community, Critic badges)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        child: Row(
                          children: [
                            SkeletonBox(width: 48 * scale, height: 22 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 44 * scale, height: 22 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 44 * scale, height: 22 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 58 * scale, height: 22 * scale, borderRadius: BorderRadius.circular(4)),
                            SizedBox(width: 8 * scale),
                            SkeletonBox(width: 44 * scale, height: 22 * scale, borderRadius: BorderRadius.circular(4)),
                          ],
                        ),
                      ),
                      SizedBox(height: 16 * scale),
                      // Action buttons: All 5 actions (including Play) are circular buttons in Spotlight
                      Row(
                        children: [
                          SkeletonBox(width: 52 * scale, height: 52 * scale, borderRadius: BorderRadius.circular(26 * scale)),
                          SizedBox(width: 12 * scale),
                          SkeletonBox(width: 52 * scale, height: 52 * scale, borderRadius: BorderRadius.circular(26 * scale)),
                          SizedBox(width: 12 * scale),
                          SkeletonBox(width: 52 * scale, height: 52 * scale, borderRadius: BorderRadius.circular(26 * scale)),
                          SizedBox(width: 12 * scale),
                          SkeletonBox(width: 52 * scale, height: 52 * scale, borderRadius: BorderRadius.circular(26 * scale)),
                          SizedBox(width: 12 * scale),
                          SkeletonBox(width: 52 * scale, height: 52 * scale, borderRadius: BorderRadius.circular(26 * scale)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20 / scale),
                // Bottom Spotlight summary cards band: 3 prominent cards matching Spotlight's layout
                if (isLandscape)
                  Row(
                    children: List.generate(3, (index) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: index < 2 ? 16.0 : 0.0),
                          child: _buildSpotlightSummaryCard(cardHeight, scale),
                        ),
                      );
                    }),
                  )
                else
                  SizedBox(
                    height: cardHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 3,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (_, _) => SizedBox(
                        width: 260,
                        child: _buildSpotlightSummaryCard(cardHeight, scale),
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

  Widget _buildSpotlightSummaryCard(double height, double scale) {
    return Container(
      height: height,
      padding: EdgeInsets.all(16 * scale),
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
          // Top icon placeholder
          SkeletonBox(
            width: 22 * scale,
            height: 22 * scale,
            borderRadius: BorderRadius.circular(6),
          ),
          // Bottom title, subtitle, and trailing arrow
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SkeletonBox(
                    width: 120 * scale,
                    height: 14 * scale,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  SizedBox(height: 6 * scale),
                  SkeletonBox(
                    width: 70 * scale,
                    height: 10 * scale,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
              SkeletonBox(
                width: 14 * scale,
                height: 14 * scale,
                borderRadius: BorderRadius.circular(4),
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
    final userPrefs = _effectivePrefs;
    final navbarIsTop =
        userPrefs?.get(UserPreferences.navbarPosition) != NavbarPosition.left;

    final safePadding = MediaQuery.paddingOf(context);
    final scale = (size.width / 1920.0).clamp(0.90, 1.08);

    // Exact formula from NouveauDetailContent._nouveauLandscapeContentInsets()
    final heroTop = navbarIsTop
        ? (212.0 * scale).clamp(190.0, 232.0)
        : (152.0 * scale).clamp(136.0, 166.0);

    final horizontalInset = PlatformDetection.isTV
        ? 56.0
        : (size.width * 0.046).clamp(56.0, 96.0);

    final horizontalSafePadding = PlatformDetection.isTV
        ? EdgeInsets.zero
        : safePadding;

    final leftPadding = isLandscape
        ? (horizontalInset + horizontalSafePadding.left)
        : 20.0;
    final topPadding = isLandscape
        ? (heroTop + safePadding.top)
        : (safePadding.top + 80);

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
              leftPadding,
              topPadding,
              isLandscape ? (horizontalInset + horizontalSafePadding.right) : 20.0,
              40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top genres text placeholder (e.g. THRILLER · ACTION & ADVENTURE · HORROR)
                SkeletonBox(
                  width: 200 * scale,
                  height: 12 * scale,
                  borderRadius: BorderRadius.circular(3),
                ),
                SizedBox(height: 16 * scale),
                // Title / Logo (e.g. GRINDHOUSE)
                SkeletonBox(
                  width: isLandscape ? 280 * scale : size.width * 0.7,
                  height: isLandscape ? 48 * scale : 40 * scale,
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: 14 * scale),
                // Metadata row (e.g. 2007 · R · 3h 11m · 7.0 · 84%)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: [
                      SkeletonBox(width: 42 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 24 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 56 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 48 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                      SizedBox(width: 8 * scale),
                      SkeletonBox(width: 42 * scale, height: 16 * scale, borderRadius: BorderRadius.circular(4)),
                    ],
                  ),
                ),
                SizedBox(height: 20 * scale),
                // Action buttons row: Play button pill + circular buttons
                Row(
                  children: [
                    SkeletonBox(width: 110 * scale, height: 48 * scale, borderRadius: BorderRadius.circular(24 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 48 * scale, height: 48 * scale, borderRadius: BorderRadius.circular(24 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 48 * scale, height: 48 * scale, borderRadius: BorderRadius.circular(24 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 48 * scale, height: 48 * scale, borderRadius: BorderRadius.circular(24 * scale)),
                    SizedBox(width: 14 * scale),
                    SkeletonBox(width: 48 * scale, height: 48 * scale, borderRadius: BorderRadius.circular(24 * scale)),
                  ],
                ),
                SizedBox(height: 36 * scale),
                // Stacked Section: Section header (e.g. "Chapters" / "Episodes")
                SkeletonBox(
                  width: 90 * scale,
                  height: 20 * scale,
                  borderRadius: BorderRadius.circular(4),
                ),
                SizedBox(height: 16 * scale),
                // Horizontal 16:9 chapter/episode thumbnail cards with title and timestamp underneath
                SizedBox(
                  height: 180 * scale,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (_, _) => SizedBox(width: 16 * scale),
                    itemBuilder: (_, _) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonBox(
                          width: 240 * scale,
                          height: 135 * scale,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SizedBox(height: 8 * scale),
                        SkeletonBox(
                          width: 140 * scale,
                          height: 12 * scale,
                          borderRadius: BorderRadius.circular(4),
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
    final userPrefs = _effectivePrefs;
    final hasLeftSidebar =
        userPrefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = hasLeftSidebar ? 120.0 : 48.0;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: leftPadding, vertical: 40.0),
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
