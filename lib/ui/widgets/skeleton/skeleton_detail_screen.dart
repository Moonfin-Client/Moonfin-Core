import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../screens/detail/detail_layout_metrics.dart';
import '../../screens/detail/spotlight/spotlight_landscape_layout.dart';
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
        DetailScreenStyle.minimalist => _buildMinimalist(context),
      },
    );
  }

  Widget _buildModern(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final userPrefs = _effectivePrefs;
    final scale = userPrefs?.get(UserPreferences.desktopUiScale).scaleFactor ?? 1.0;
    final hasLeftSidebar =
        userPrefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final baseTopInset = TopToolbar.baseHeightFor(context);
    final isLandscape = detailUsesLandscapeLayout(context);

    // Portrait keeps the top of the page clear so the backdrop shows through,
    // where landscape starts the hero just under the toolbar.
    final leftPadding = isLandscape ? (hasLeftSidebar ? 120.0 : 40.0) : 20.0;
    final rightPadding = isLandscape ? 40.0 : 20.0;
    final topPadding =
        isLandscape ? (baseTopInset - 12) / scale + (10 / scale) : 0.0;
    final backdropGap =
        isLandscape ? 0.0 : detailPortraitBackdropGap(size, baseTopInset);

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
            padding: EdgeInsets.fromLTRB(
              leftPadding,
              topPadding,
              rightPadding,
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (backdropGap > 0) SizedBox(height: backdropGap),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
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
    final isLandscape = detailUsesLandscapeLayout(context);
    final userPrefs = _effectivePrefs;
    final scale = userPrefs?.get(UserPreferences.desktopUiScale).scaleFactor ?? 1.0;
    final hasLeftSidebar =
        userPrefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final leftPadding = isLandscape ? (hasLeftSidebar ? 120.0 : 40.0) : 20.0;
    final baseTopInset = TopToolbar.baseHeightFor(context);
    // Matches SpotlightLandscapeLayout padding calculations
    final topInset = isLandscape
        ? (baseTopInset - 12) / scale + (10 / scale)
        : detailPortraitBackdropGap(size, baseTopInset);

    final heroWidth = isLandscape
        ? SpotlightLandscapeLayout.heroWidthFor(size)
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



  Widget _clippedRow({required List<Widget> children}) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const NeverScrollableScrollPhysics(),
    child: Row(children: children),
  );

  /// Minimalist is anchored to the bottom, so its skeleton is too. Landing on
  /// a top-aligned placeholder and then snapping down reads as a glitch.
  Widget _buildMinimalist(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width >= size.height;
    final inset = isLandscape ? 56.0 : 20.0;
    // The same helper the real rail uses, so the placeholder keeps landing
    // where the content lands.
    final cardWidth = minimalistEpisodeCardWidth(
      size.width - inset * 2,
      landscape: isLandscape,
    );
    final cardGap = minimalistEpisodeRailGap(landscape: isLandscape);

    return Padding(
      padding: EdgeInsets.fromLTRB(inset, 40, inset, isLandscape ? 44 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          SkeletonBox(
            width: isLandscape ? 300 : 210,
            height: isLandscape ? 96 : 68,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 26),
          // Both rows run off the side of a narrow screen, the same way the
          // real ones do. A scroll view clips them instead of overflowing.
          _clippedRow(
            children: [
              SkeletonBox(
                width: isLandscape ? 210 : size.width - inset * 2,
                height: isLandscape ? 92 : 76,
                borderRadius: BorderRadius.circular(46),
              ),
              if (isLandscape) ...[
                const SizedBox(width: 22),
                for (var i = 0; i < 3; i++) ...[
                  const SkeletonBox(
                    width: 92,
                    height: 92,
                    borderRadius: BorderRadius.all(Radius.circular(46)),
                  ),
                  const SizedBox(width: 22),
                ],
              ],
            ],
          ),
          const SizedBox(height: 34),
          _clippedRow(
            children: [
              for (var i = 0; i < 4; i++) ...[
                SkeletonBox(
                  width: cardWidth,
                  height: cardWidth * 9 / 16,
                  borderRadius: BorderRadius.circular(16),
                ),
                SizedBox(width: cardGap),
              ],
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

    final safePadding = MediaQuery.paddingOf(context);
    final scale = nouveauHeroScale(size);

    final heroTop = nouveauHeroTop(context, prefs: userPrefs);

    final horizontalInset = nouveauHorizontalInset(size);

    final horizontalSafePadding = PlatformDetection.isTV
        ? EdgeInsets.zero
        : safePadding;

    final leftPadding = isLandscape
        ? (horizontalInset + horizontalSafePadding.left)
        : 20.0;
    final topPadding = isLandscape
        ? (heroTop + safePadding.top)
        : safePadding.top;

    // The hero block is the same either way. Only where it sits differs.
    final heroChildren = <Widget>[
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
    ];

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
                // Portrait pins the hero to the bottom of a tall box so the
                // backdrop fills everything above it.
                if (isLandscape)
                  ...heroChildren
                else
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: nouveauHeroMinHeight(size),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: heroChildren,
                      ),
                    ),
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
    final safeTop = MediaQuery.paddingOf(context).top;
    final desktop = useDesktopDetailLayout(context);
    final scale = detailDesktopScale(prefs: userPrefs);
    final poster = classicDetailPosterSize(context, prefs: userPrefs);
    final horizontalInset = desktop ? 48.0 : 16.0;

    // Classic buttons are icon tiles with the label underneath, all the same
    // size, rather than a wide play pill next to round icons.
    final tileWidth = desktop ? 108.0 * scale : 80.0;
    final iconSide = desktop ? 58.0 * scale : 44.0;
    final actionTile = SizedBox(
      width: tileWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SkeletonBox(
            width: iconSide,
            height: iconSide,
            borderRadius: BorderRadius.circular(desktop ? 15.0 * scale : 14.0),
          ),
          SizedBox(height: desktop ? 8.0 * scale : 6.0),
          SkeletonBox(
            width: tileWidth * 0.6,
            height: 11,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );

    final posterBox = SkeletonBox(
      width: poster.width,
      height: poster.height,
      borderRadius: BorderRadius.circular(12),
    );

    // The overview sits in the header beside the poster, not below the
    // buttons, and a phone centres the whole column under the poster.
    final info = Column(
      crossAxisAlignment: desktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SkeletonBox(
          width: size.width * (desktop ? 0.32 : 0.62),
          height: 34,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 14),
        Wrap(
          alignment: desktop ? WrapAlignment.start : WrapAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            SkeletonBox(
              width: 60,
              height: 20,
              borderRadius: BorderRadius.circular(4),
            ),
            SkeletonBox(
              width: 80,
              height: 20,
              borderRadius: BorderRadius.circular(4),
            ),
            SkeletonBox(
              width: 50,
              height: 20,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
        const SizedBox(height: 18),
        SkeletonBox(
          width: double.infinity,
          height: 14,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 10),
        SkeletonBox(
          width: double.infinity,
          height: 14,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 10),
        SkeletonBox(
          width: size.width * (desktop ? 0.2 : 0.4),
          height: 14,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );

    final header = desktop
        ? Padding(
            padding: EdgeInsets.fromLTRB(48, safeTop + 80, 48, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: info),
                const SizedBox(width: 32),
                posterBox,
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(16, safeTop + 60, 16, 12),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [posterBox, const SizedBox(height: 16), info],
              ),
            ),
          );

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.height * 0.45,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withAlpha(20), Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                // The buttons come after the header, centred as a group and
                // wrapping onto another line when they run out of room.
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalInset),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 12,
                    children: List.generate(5, (_) => actionTile),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalInset),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SkeletonBox(
                      width: 120,
                      height: 24,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: horizontalInset),
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
