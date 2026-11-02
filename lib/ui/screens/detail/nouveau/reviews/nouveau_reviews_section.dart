import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../data/repositories/tmdb_repository.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/detail_reviews.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/navigation_layout.dart';
import '../shared/nouveau_spacing.dart';

class NouveauReviewsSection extends StatefulWidget {
  const NouveauReviewsSection({
    super.key,
    required this.reviews,
    required this.prefs,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  final List<TmdbReview> reviews;
  final UserPreferences prefs;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  @override
  State<NouveauReviewsSection> createState() => NouveauReviewsSectionState();
}

class NouveauReviewsSectionState extends State<NouveauReviewsSection> {
  static const Duration _motionDuration = Duration(milliseconds: 180);

  static const NouveauRailMetrics _wideRail = NouveauRailMetrics(
    gap: NouveauSpacing.railItemGap,
    preferredWidth: 380,
    minWidth: 300,
    maxWidth: 440,
  );

  static int _hubSession = 0;

  late final String _hubKey = 'nouveau-reviews-${_hubSession++}';

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<TmdbReview>> _rowKey =
      GlobalKey<LockedFocusRowState<TmdbReview>>();

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  bool get canFocusTop =>
      mounted && widget.reviews.isNotEmpty && _rowKey.currentState != null;

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  bool focusTop() {
    if (!canFocusTop) {
      return false;
    }

    _rowKey.currentState!.requestFocusFromMemory();

    return true;
  }

  bool focusBottom() => focusTop();

  @override
  Widget build(BuildContext context) {
    final reviews = widget.reviews;

    if (reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    final compact = _isCompactMobile(context);

    final metrics = compact ? NouveauSpacing.compactEpisodes : _wideRail;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final cardWidth = metrics.itemWidth(availableWidth);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).reviews,
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
                  ? NouveauSpacing.mobileTitleToContent
                  : NouveauSpacing.titleToContent,
            ),

            SizedBox(
              width: double.infinity,
              height: reviewCardHeight,
              child: LockedFocusRow<TmdbReview>(
                key: _rowKey,
                items: reviews,
                hubKey: _hubKey,
                controller: _scrollController,
                height: reviewCardHeight,
                itemExtent: cardWidth + metrics.gap,
                clipBehavior: Clip.none,
                onVerticalNavigation: (isUp) =>
                    (isUp ? widget.onNavigateUp : widget.onNavigateDown)
                        ?.call() ??
                    false,
                onTap: (_, review) {
                  showReviewDialog(context, review);
                },
                onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
                itemBuilder: (context, review, index, isFocused) {
                  final hasNext = index < reviews.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(right: hasNext ? metrics.gap : 0),
                    child: AnimatedScale(
                      scale: isFocused ? 1.015 : 1,
                      duration: _motionDuration,
                      curve: Curves.easeOutCubic,
                      child: Stack(
                        children: [
                          // The row holds focus, so the card itself only
                          // answers taps and the outline shows the row's pick.
                          ExcludeFocus(
                            child: ReviewCard(review: review, width: cardWidth),
                          ),

                          Positioned.fill(
                            child: IgnorePointer(
                              child: AnimatedContainer(
                                duration: _motionDuration,
                                curve: Curves.easeOutCubic,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isFocused
                                        ? foreground.withValues(alpha: 0.96)
                                        : foreground.withValues(alpha: 0.08),
                                    width: isFocused ? 2 : 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
