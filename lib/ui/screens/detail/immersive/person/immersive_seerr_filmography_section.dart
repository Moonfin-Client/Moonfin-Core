import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../shared/immersive_spacing.dart';
import 'immersive_seerr_filmography_card.dart';

class ImmersiveSeerrFilmographySection extends StatefulWidget {
  final String title;
  final List<SeerrDiscoverItem> items;
  final bool isCrew;

  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  const ImmersiveSeerrFilmographySection({
    super.key,
    required this.title,
    required this.items,
    required this.isCrew,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveSeerrFilmographySection> createState() =>
      ImmersiveSeerrFilmographySectionState();
}

class ImmersiveSeerrFilmographySectionState
    extends State<ImmersiveSeerrFilmographySection> {
  static const int _fullVisibleCards = 6;

  static const double _compactCaptionGap = 9;
  static const double _compactCaptionHeight = 42;

  static int _hubSession = 0;

  late final String _hubKey;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<SeerrDiscoverItem>> _rowKey =
      GlobalKey<LockedFocusRowState<SeerrDiscoverItem>>();

  bool get _navbarIsLeft =>
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) ==
      NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  @override
  void initState() {
    super.initState();

    _hubKey = 'immersive-seerr-filmography-${_hubSession++}';
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  bool requestFocus() {
    final row = _rowKey.currentState;

    if (widget.items.isEmpty || row == null) {
      return false;
    }

    row.requestFocusFromMemory();

    return true;
  }

  GlobalKey get revealKey => _rowKey;

  _SeerrFilmographyLayout _layoutFor(
    BuildContext context,
    double availableWidth,
  ) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactFilmography;

      final cardWidth = metrics.itemWidth(availableWidth);

      final posterHeight = cardWidth * 3 / 2;

      final railHeight =
          posterHeight + _compactCaptionGap + _compactCaptionHeight;

      return _SeerrFilmographyLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        posterHeight: posterHeight,
        railHeight: railHeight,
        cardSpacing: metrics.gap,
        compact: true,
      );
    }

    final cardSpacing = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final cardWidth =
        (availableWidth - ((_fullVisibleCards - 1) * cardSpacing)) /
        _fullVisibleCards;

    final posterHeight = cardWidth * 3 / 2;

    return _SeerrFilmographyLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      posterHeight: posterHeight,
      railHeight: posterHeight,
      cardSpacing: cardSpacing,
      compact: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;

    final hasTitle = widget.title.trim().isNotEmpty;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final layout = _layoutFor(context, availableWidth);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasTitle) ...[
              Text(
                widget.title,
                style: layout.compact
                    ? textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      )
                    : textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
              ),

              SizedBox(
                height: layout.compact
                    ? ImmersiveSpacing.mobileTitleToContent
                    : ImmersiveSpacing.titleToContent,
              ),
            ],

            _buildRail(context, layout),
          ],
        );
      },
    );
  }

  Widget _buildRail(BuildContext context, _SeerrFilmographyLayout layout) {
    return SizedBox(
      width: double.infinity,
      height: layout.railHeight,
      child: OverflowBox(
        alignment: Alignment.topLeft,
        minWidth: layout.viewportWidth,
        maxWidth: layout.viewportWidth,
        minHeight: layout.railHeight,
        maxHeight: layout.railHeight,
        child: SizedBox(
          width: layout.viewportWidth,
          height: layout.railHeight,
          child: LockedFocusRow<SeerrDiscoverItem>(
            key: _rowKey,
            items: widget.items,
            hubKey: _hubKey,
            controller: _scrollController,
            height: layout.railHeight,
            itemExtent: layout.itemExtent,
            clipBehavior: Clip.none,
            onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
            onTap: (_, item) {
              ImmersiveSeerrFilmographyCard.openItem(context, item);
            },
            onVerticalNavigation: (isUp) {
              final callback = isUp
                  ? widget.onNavigateUp
                  : widget.onNavigateDown;

              if (callback == null) {
                return false;
              }

              callback();

              return true;
            },
            itemBuilder: (context, item, index, isFocused) {
              final hasNext = index < widget.items.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  right: hasNext ? layout.cardSpacing : 0,
                ),
                child: ImmersiveSeerrFilmographyCard(
                  item: item,
                  width: layout.cardWidth,
                  height: layout.posterHeight,
                  isFocused: isFocused,
                  isCrew: widget.isCrew,
                  showCaption: layout.compact,
                  captionGap: _compactCaptionGap,
                  captionHeight: _compactCaptionHeight,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SeerrFilmographyLayout {
  final double viewportWidth;
  final double cardWidth;
  final double posterHeight;
  final double railHeight;
  final double cardSpacing;
  final bool compact;

  const _SeerrFilmographyLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.posterHeight,
    required this.railHeight,
    required this.cardSpacing,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
