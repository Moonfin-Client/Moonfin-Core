import 'package:flutter/material.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../shared/immersive_spacing.dart';
import 'immersive_filmography_card.dart';

class ImmersiveFilmographySection extends StatefulWidget {
  final String title;
  final List<AggregatedItem> items;

  final ImageApi imageApi;
  final UserPreferences prefs;

  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final ValueChanged<AggregatedItem>? onLongPress;

  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  const ImmersiveFilmographySection({
    super.key,
    required this.title,
    required this.items,
    required this.imageApi,
    required this.prefs,
    this.onBackdropItemFocused,
    this.onLongPress,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveFilmographySection> createState() =>
      ImmersiveFilmographySectionState();
}

class ImmersiveFilmographySectionState
    extends State<ImmersiveFilmographySection> {
  static const int _fullVisibleEpisodeCards = 4;
  static const int _fullVisiblePosterCards = 6;

  static const double _compactCaptionGap = 9;
  static const double _compactCaptionHeight = 42;

  static int _hubSession = 0;

  late final String _hubKey;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _rowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  bool get _isEpisodeRow =>
      widget.items.isNotEmpty && widget.items.first.type == 'Episode';

  double get _aspectRatio => _isEpisodeRow ? 16 / 9 : 2 / 3;

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  @override
  void initState() {
    super.initState();

    _hubKey = 'immersive-filmography-${_hubSession++}';
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

  _FilmographyLayout _layoutFor(BuildContext context, double availableWidth) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = _isEpisodeRow
          ? ImmersiveSpacing.compactEpisodes
          : ImmersiveSpacing.compactFilmography;

      final cardWidth = metrics.itemWidth(availableWidth);
      final posterHeight = cardWidth / _aspectRatio;

      final showCaption = !_isEpisodeRow;

      final railHeight = showCaption
          ? posterHeight + _compactCaptionGap + _compactCaptionHeight
          : posterHeight;

      return _FilmographyLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        posterHeight: posterHeight,
        railHeight: railHeight,
        cardSpacing: metrics.gap,
        compact: true,
        showCaption: showCaption,
      );
    }

    final cardSpacing = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final visibleCards = _isEpisodeRow
        ? _fullVisibleEpisodeCards
        : _fullVisiblePosterCards;

    final cardWidth =
        (availableWidth - ((visibleCards - 1) * cardSpacing)) / visibleCards;

    final posterHeight = cardWidth / _aspectRatio;

    return _FilmographyLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      posterHeight: posterHeight,
      railHeight: posterHeight,
      cardSpacing: cardSpacing,
      compact: false,
      showCaption: false,
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

  Widget _buildRail(BuildContext context, _FilmographyLayout layout) {
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
          child: LockedFocusRow<AggregatedItem>(
            key: _rowKey,
            items: widget.items,
            hubKey: _hubKey,
            controller: _scrollController,
            height: layout.railHeight,
            itemExtent: layout.itemExtent,
            clipBehavior: Clip.none,
            onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
            onTap: (_, item) {
              ImmersiveFilmographyCard.openItem(context, item);
            },
            onIndexChanged: (_, item) {
              widget.onBackdropItemFocused?.call(item);
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
                child: ImmersiveFilmographyCard(
                  item: item,
                  imageApi: widget.imageApi,
                  prefs: widget.prefs,
                  width: layout.cardWidth,
                  height: layout.posterHeight,
                  isFocused: isFocused,
                  showCaption: layout.showCaption,
                  captionGap: _compactCaptionGap,
                  captionHeight: _compactCaptionHeight,
                  onLongPress: widget.onLongPress,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FilmographyLayout {
  final double viewportWidth;
  final double cardWidth;
  final double posterHeight;
  final double railHeight;
  final double cardSpacing;
  final bool compact;
  final bool showCaption;

  const _FilmographyLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.posterHeight,
    required this.railHeight,
    required this.cardSpacing,
    required this.compact,
    required this.showCaption,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
