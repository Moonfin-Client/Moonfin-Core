import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../preference/user_preferences.dart';
import '../../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../widgets/logo_view.dart';
import '../../../widgets/offline_aware_image.dart';
import '../../../widgets/rating_display.dart';
import '../detail_layout_metrics.dart';
import '../item_detail_screen.dart';
import '../modern/modern_detail_content.dart';
import '../spotlight/spotlight_detail_content.dart';
import 'minimalist_landscape_layout.dart';
import 'minimalist_portrait_layout.dart';
import 'widgets/minimalist_episodes_section.dart';

/// The item types Minimalist draws. A playlist goes to Modern, and everything
/// else falls through to Spotlight, which already knows how to render a person
/// or an album.
const _minimalistTypes = {
  'Movie',
  'Series',
  'Season',
  'Episode',
  'Video',
  'MusicVideo',
};

/// The smallest detail screen: artwork, the title, one play button and the
/// episodes. No cast, no chapters, no collection, no recommendations.
///
/// Kids Mode always shows this one. Outside Kids Mode it's an ordinary style,
/// for anyone who wants the screen to get out of the way.
class MinimalistDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final ValueListenable<String?> backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;

  const MinimalistDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.backdropUrl,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.initialFocusNode,
    this.autoPlay = false,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
  });

  @override
  State<MinimalistDetailContent> createState() =>
      _MinimalistDetailContentState();
}

class _MinimalistDetailContentState extends State<MinimalistDetailContent> {
  final _episodesFocusNode = FocusNode(debugLabel: 'MinimalistEpisodes');

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  void dispose() {
    _episodesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    if (!_minimalistTypes.contains(item.type)) {
      if (detailFallsBackToModern(item.type)) {
        return ModernDetailContent(
          viewModel: _vm,
          prefs: widget.prefs,
          backdropUrl: widget.backdropUrl,
          selectedMediaSourceId: widget.selectedMediaSourceId,
          onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
          initialFocusNode: widget.initialFocusNode,
          autoPlay: widget.autoPlay,
          actionsExpanded: widget.actionsExpanded,
          onActionsExpandedChanged: widget.onActionsExpandedChanged,
        );
      }
      return SpotlightDetailContent(
        viewModel: _vm,
        prefs: widget.prefs,
        backdropUrl: widget.backdropUrl,
        selectedMediaSourceId: widget.selectedMediaSourceId,
        onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
        initialFocusNode: widget.initialFocusNode,
        autoPlay: widget.autoPlay,
        actionsExpanded: widget.actionsExpanded,
        onActionsExpandedChanged: widget.onActionsExpandedChanged,
      );
    }

    final landscape = detailUsesLandscapeLayout(context);
    final branding = _buildBranding(context, item, landscape);
    final actions = _buildActions(landscape);
    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackdrop(landscape),
        if (landscape)
          MinimalistLandscapeLayout(
            branding: branding,
            actions: actions,
            ratings: ratings,
            episodes: _hasEpisodes(item)
                ? (maxHeight) =>
                      _buildEpisodes(item, landscape, maxHeight: maxHeight)!
                : null,
            aside: _buildEpisodeStill(context, item),
          )
        else
          MinimalistPortraitLayout(
            branding: branding,
            actions: actions,
            ratings: ratings,
            episodes: _buildEpisodes(item, landscape),
            compact: detailIsCompact(context),
          ),
      ],
    );
  }

  /// A flat knock-down over the artwork rather than a gradient.
  ///
  /// The other styles lay gradient scrims under their text and can fade the
  /// backdrop all the way out. Minimalist puts the title and buttons straight
  /// on the picture, so the darkening keeps a floor: at the bottom of the
  /// slider the screen is still readable rather than merely bright.
  Widget _buildBackdrop(bool landscape) {
    final item = _vm.item;
    final ownBackdrop = item != null && item.backdropImageTags.isNotEmpty
        ? _vm.imageApi.getBackdropImageUrl(
            item.id,
            maxWidth: 1920,
            tag: item.backdropImageTags.first,
          )
        : null;

    final amount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble()
        .clamp(0.0, 25.0);
    const minAlpha = 0.35;
    const maxAlpha = 0.85;
    final alpha = minAlpha + (amount / 25.0) * (maxAlpha - minAlpha);

    return RepaintBoundary(
      child: ValueListenableBuilder<String?>(
        valueListenable: widget.backdropUrl,
        builder: (context, value, _) {
          final url = value ?? ownBackdrop;
          return Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: AppColorScheme.background),
              if (url != null && url.isNotEmpty)
                FullscreenBackdropSwitcher(
                  imageUrl: url,
                  duration: const Duration(milliseconds: 350),
                  alignment: landscape
                      ? Alignment.centerRight
                      : Alignment.topCenter,
                ),
              ColoredBox(color: AppColors.black.withValues(alpha: alpha)),
            ],
          );
        },
      ),
    );
  }

  /// The show's own logo where the title would go, falling back to text when
  /// the server has no logo to give.
  ///
  /// On an episode the logo names the show and the episode's own name sits
  /// under it, so the artwork still says what you're in while the line below
  /// says which part of it.
  Widget _buildBranding(
    BuildContext context,
    AggregatedItem item,
    bool landscape,
  ) {
    final isEpisode = item.type == 'Episode';
    final isEpisodeOrSeason = isEpisode || item.type == 'Season';
    final logoTag =
        item.logoImageTag ??
        (isEpisodeOrSeason ? item.seriesLogoImageTag : null);
    final logoId = logoTag == null
        ? null
        : (item.logoImageTag != null ? item.id : item.seriesId);

    final maxWidth = landscape ? 340.0 : 220.0;
    // A share of the screen on a short canvas, where a flat 160 is nearly a
    // third of it and crowds out the rail below.
    final maxHeight = landscape
        ? math.min(160.0, MediaQuery.sizeOf(context).height * 0.21)
        : 110.0;

    final Widget showMark;
    if (logoTag != null && logoId != null && logoId.isNotEmpty) {
      showMark = LogoView(
        imageUrl: _vm.imageApi.getLogoImageUrl(
          logoId,
          maxWidth: 700,
          tag: logoTag,
        ),
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
    } else {
      showMark = Text(
        isEpisodeOrSeason ? (item.seriesName ?? item.name) : item.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: _titleStyle(landscape),
      );
    }

    if (!isEpisode) {
      return KeyedSubtree(
        key: const ValueKey('minimalist-branding'),
        child: showMark,
      );
    }

    return Column(
      key: const ValueKey('minimalist-branding'),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        showMark,
        SizedBox(height: landscape ? 14 : 10),
        Text(
          item.name,
          key: const ValueKey('minimalist-episode-name'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: _titleStyle(landscape).copyWith(
            fontSize: landscape ? 34 : 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  TextStyle _titleStyle(bool landscape) => TextStyle(
    color: AppColorScheme.onSurface,
    fontWeight: FontWeight.w700,
    fontSize: landscape ? 56 : 38,
    height: 1.05,
    shadows: const [Shadow(blurRadius: 14, color: Color(0x99000000))],
  );


  /// The episode's own still, opposite the title.
  ///
  /// Only ever the episode's own picture. Falling back to the show's artwork
  /// here would put a second copy of the backdrop on screen, and the series
  /// thumbnail preference exists precisely to keep stills out of sight, so
  /// with it on there's nothing to show.
  Widget? _buildEpisodeStill(BuildContext context, AggregatedItem item) {
    if (item.type != 'Episode') return null;
    if (widget.prefs.effectiveDetailUseSeriesThumbnails) return null;

    final tag = item.primaryImageTag;
    if (tag == null || tag.isEmpty) return null;

    final width = (MediaQuery.sizeOf(context).width * 0.30).clamp(240.0, 440.0);

    return SizedBox(
      key: const ValueKey('minimalist-episode-still'),
      width: width,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: AppRadius.circular(18),
          child: OfflineAwareImage(
            imageUrl: _vm.imageApi.getPrimaryImageUrl(
              item.id,
              maxWidth: (width * 2).round(),
              tag: tag,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildActions(bool landscape) {
    // Kids Mode offers Play and three others, and they always fit, so there's
    // nothing for an overflow menu to hold. Passing no limit at all would read
    // the user's own cap, which is one of the settings the mode turns off.
    if (widget.prefs.get(UserPreferences.kidsModeEnabled)) {
      return _actionButtons(landscape, maxVisible: 4, overflowAsMenu: false);
    }

    final prefLimit = widget.prefs.get(UserPreferences.detailButtonsMaxVisible);
    final int? maxVisibleOverride;
    final bool overflowAsMenu;
    if (prefLimit == -1) {
      maxVisibleOverride = null;
      overflowAsMenu = false;
    } else if (prefLimit > 0) {
      maxVisibleOverride = prefLimit + 1;
      overflowAsMenu = true;
    } else {
      maxVisibleOverride = landscape ? 5 : 4;
      overflowAsMenu = true;
    }

    return _actionButtons(
      landscape,
      maxVisible: maxVisibleOverride,
      overflowAsMenu: overflowAsMenu,
    );
  }

  Widget _actionButtons(
    bool landscape, {
    required int? maxVisible,
    required bool overflowAsMenu,
  }) {
    return DetailActionButtons(
      key: const ValueKey('minimalist-actions'),
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      downTarget: _episodesFocusNode,
      autoPlay: widget.autoPlay,
      modernStyle: true,
      fullWidthPrimary: !landscape,
      overflowAsMenu: overflowAsMenu,
      maxVisibleButtonsOverride: maxVisible,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
    );
  }

  /// An episode carries the pickers as well, so arriving on one still leaves
  /// the rest of the show a press away.
  static bool _hasEpisodes(AggregatedItem item) =>
      const {'Series', 'Season', 'Episode'}.contains(item.type);

  Widget? _buildEpisodes(
    AggregatedItem item,
    bool landscape, {
    double? maxHeight,
  }) {
    if (!_hasEpisodes(item)) return null;
    return MinimalistEpisodesSection(
      viewModel: _vm,
      prefs: widget.prefs,
      landscape: landscape,
      maxHeight: maxHeight,
      episodesFocusNode: _episodesFocusNode,
      onVerticalNavigation: (isUp) {
        if (isUp) {
          widget.initialFocusNode?.requestFocus();
          return true;
        }
        return false;
      },
    );
  }
}
