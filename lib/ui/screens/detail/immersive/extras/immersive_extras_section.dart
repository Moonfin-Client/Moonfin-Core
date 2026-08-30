import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../navigation/destinations.dart';
import '../../../../widgets/focus/hub_focus_memory.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../shared/immersive_media_rail_card.dart';
import '../shared/immersive_spacing.dart';

class ImmersiveExtrasSection extends StatefulWidget {
  const ImmersiveExtrasSection({
    super.key,
    required this.items,
    required this.imageApi,
    required this.prefs,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  @override
  State<ImmersiveExtrasSection> createState() => ImmersiveExtrasSectionState();
}

class ImmersiveExtrasSectionState extends State<ImmersiveExtrasSection> {
  static int _hubSession = 0;

  late final String _hubKey = 'immersive-extras-${_hubSession++}';

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _rowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  void _openItem(AggregatedItem item) {
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  bool get canFocusTop =>
      mounted && widget.items.isNotEmpty && _rowKey.currentState != null;

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  bool focusTop() {
    if (!canFocusTop) {
      return false;
    }

    final row = _rowKey.currentState!;
    final remembered = HubFocusMemory.peek(_hubKey);

    row.requestFocusAt(
      remembered != null && remembered < widget.items.length ? remembered : 0,
    );

    return true;
  }

  bool focusBottom() => focusTop();

  String? _imageUrl(AggregatedItem item) {
    final tag = item.primaryImageTag;

    if (tag == null || tag.isEmpty) {
      return null;
    }

    return widget.imageApi.getPrimaryImageUrl(
      item.id,
      maxHeight: 500,
      tag: tag,
    );
  }

  double _progress(AggregatedItem item) {
    final percentage = item.playedPercentage;

    if (percentage == null || !percentage.isFinite) {
      return 0;
    }

    return (percentage / 100).clamp(0.0, 1.0).toDouble();
  }

  _ExtrasLayout _layoutFor(BuildContext context, double availableWidth) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactEpisodes;

      final cardWidth = metrics.itemWidth(availableWidth);

      final artworkHeight = cardWidth * 9 / 16;

      final cardHeight = artworkHeight + 98;

      return _ExtrasLayout(
        cardWidth: cardWidth,
        artworkHeight: artworkHeight,
        cardHeight: cardHeight,
        cardSpacing: metrics.gap,
        compact: true,
      );
    }

    final cardWidth = ImmersiveMediaRailMetrics.cardWidth(availableWidth);

    final artworkHeight = ImmersiveMediaRailMetrics.artworkHeight(cardWidth);

    return _ExtrasLayout(
      cardWidth: cardWidth,
      artworkHeight: artworkHeight,
      cardHeight: ImmersiveMediaRailMetrics.cardHeight(cardWidth),
      cardSpacing: ImmersiveMediaRailMetrics.itemGap,
      compact: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    final foreground = AppColorScheme.onSurface;

    final l10n = AppLocalizations.of(context);

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
            Text(
              l10n.extras,
              style: layout.compact
                  ? theme.textTheme.titleLarge?.copyWith(
                      color: foreground,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )
                  : theme.textTheme.titleLarge?.copyWith(
                      color: foreground,
                      fontWeight: FontWeight.w700,
                    ),
            ),

            SizedBox(
              height: layout.compact
                  ? ImmersiveSpacing.mobileTitleToContent
                  : ImmersiveSpacing.titleToContent,
            ),

            SizedBox(
              width: double.infinity,
              height: layout.cardHeight,
              child: OverflowBox(
                alignment: Alignment.topLeft,
                minWidth: availableWidth,
                maxWidth: availableWidth,
                minHeight: layout.cardHeight,
                maxHeight: layout.cardHeight,
                child: SizedBox(
                  width: availableWidth,
                  height: layout.cardHeight,
                  child: LockedFocusRow<AggregatedItem>(
                    key: _rowKey,
                    items: widget.items,
                    hubKey: _hubKey,
                    controller: _scrollController,
                    height: layout.cardHeight,
                    itemExtent: layout.itemExtent,
                    clipBehavior: Clip.none,
                    onVerticalNavigation: (isUp) =>
                        (isUp ? widget.onNavigateUp : widget.onNavigateDown)
                            ?.call() ??
                        false,
                    onTap: (_, item) {
                      _openItem(item);
                    },
                    onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
                    itemBuilder: (context, item, index, isFocused) {
                      final title = item.name.trim();

                      final hasNext = index < widget.items.length - 1;

                      return SizedBox(
                        width: layout.itemExtent,
                        height: layout.cardHeight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: hasNext ? layout.cardSpacing : 0,
                          ),
                          child: ImmersiveMediaRailCard(
                            imageUrl: _imageUrl(item),
                            title: title,
                            subtitle: item.subtitle,
                            placeholderLabel: title,
                            width: layout.cardWidth,
                            artworkHeight: layout.artworkHeight,
                            isFocused: isFocused,
                            isPlayed: item.isPlayed,
                            progress: _progress(item),
                            onTap: () {
                              _openItem(item);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ExtrasLayout {
  final double cardWidth;
  final double artworkHeight;
  final double cardHeight;
  final double cardSpacing;
  final bool compact;

  const _ExtrasLayout({
    required this.cardWidth,
    required this.artworkHeight,
    required this.cardHeight,
    required this.cardSpacing,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
