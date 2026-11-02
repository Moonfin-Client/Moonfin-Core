import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/detail_section_layout.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/seerr_preferences.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/overview_text.dart';
import '../../../widgets/bottom_nav/bottom_navbar.dart';
import '../../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../widgets/horizontal_scroll_section.dart';
import '../../../widgets/live_tv/incomplete_recording.dart';
import '../../../widgets/logo_view.dart';
import '../../../widgets/media_card.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/seerr/seerr_image_urls.dart';
import '../../../widgets/seerr/seerr_item_chips.dart';
import '../../../widgets/seerr/seerr_item_status.dart';
import '../../../widgets/seerr/seerr_request_dialog.dart';
import '../../../widgets/seerr/seerr_stats_card.dart';
import '../../../widgets/seerr/seerr_streaming_row.dart';
import '../detail_layout_metrics.dart';
import '../item_detail_screen.dart';
import '../minimalist/widgets/minimalist_episodes_section.dart';
import '../modern/modern_detail_content.dart';
import 'stage_track_chips.dart';

/// The item types Stage draws. Everything else, a person, an album or a
/// playlist, goes to Modern, which already knows how to lay those out.
const _stageTypes = {
  'Movie',
  'Series',
  'Season',
  'Episode',
  'Video',
  'MusicVideo',
};

/// The poster-led detail screen. On a TV or desktop the poster stands on the
/// left with play and the other buttons under it, and the title, ratings,
/// tracks and episodes sit beside it. Extras and the rows of other titles run
/// full width underneath. A phone stacks the same parts down the page.
///
/// A title that is only in Seerr gets the same page with Request in place of
/// play, its seasons as request cards and Seerr's own rows underneath.
class StageDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final ValueListenable<String?> backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;

  /// Hides the toolbar once the page scrolls past the top, so it never sits
  /// over the rows the viewer moved down to.
  final ValueChanged<bool>? onToggleNavbar;

  const StageDetailContent({
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
    this.onToggleNavbar,
  });

  @override
  State<StageDetailContent> createState() => _StageDetailContentState();
}

class _StageDetailContentState extends State<StageDetailContent> {
  final _actionsKey = GlobalKey<DetailActionButtonsState>();
  final _scroll = ScrollController();
  final _nodes = <String, FocusNode>{};
  bool _navbarShown = true;

  // Every button in the row sends Up here. Where it should go depends on
  // which button it came from, which the row doesn't say, so the page keeps
  // track of the last one focused.
  final _upProxy = FocusNode(
    debugLabel: 'stage-actions-up',
    skipTraversal: true,
  );
  FocusNode? _lastActionFocus;

  // The D-pad stops in page order. The beside column comes first, then the
  // full width rows under it. Rebuilt with the page, since which sections
  // exist depends on what loaded.
  List<FocusNode> _beside = const [];
  List<FocusNode> _below = const [];
  bool _landscape = true;

  ItemDetailViewModel get _vm => widget.viewModel;

  FocusNode _node(String id) =>
      _nodes.putIfAbsent(id, () => FocusNode(debugLabel: 'stage-$id'));

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    FocusManager.instance.addListener(_trackActionFocus);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_trackActionFocus);
    _scroll.dispose();
    _upProxy.dispose();
    for (final node in _nodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  void _trackActionFocus() {
    final node = FocusManager.instance.primaryFocus;
    if (node == null || node == _upProxy || !_focusIsInActions()) return;
    _lastActionFocus = node;
  }

  /// Up from a circle goes to the button above it. Up from Play goes to the
  /// toolbar when it runs along the top, and stays put beside a sidebar,
  /// which Left already opens.
  void _onUpProxyFocus(bool focused) {
    if (!focused) return;
    final play = widget.initialFocusNode;
    final from = _lastActionFocus;
    if (from != null && from != play && from.context?.mounted == true) {
      (_actionNeighbour(from, down: false) ?? play)?.requestFocus();
      return;
    }
    if (_navbarIsTop && NavigationLayout.focusNavbarNotifier.value != null) {
      _toNavbar();
    } else {
      play?.requestFocus();
    }
  }

  bool get _navbarIsTop =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;

  void _onScroll() {
    final shown = _scroll.offset < 24;
    if (shown == _navbarShown) return;
    _navbarShown = shown;
    widget.onToggleNavbar?.call(shown);
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    if (!_stageTypes.contains(item.type)) {
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
        onToggleNavbar: widget.onToggleNavbar,
      );
    }

    final l10n = AppLocalizations.of(context);
    final landscape = detailUsesLandscapeLayout(context);
    _landscape = landscape;
    final sections = DetailSectionVisibility.of(widget.prefs);

    // Built before anything is wired, so every section knows which stop sits
    // above and below it.
    final beside = _besideSections(item, sections, l10n);
    final below = _belowSections(item, sections, l10n);
    _beside = [for (final s in beside) ?s.node];
    _below = [for (final s in below) ?s.node];

    final posterWidth = stagePosterWidth(
      MediaQuery.sizeOf(context),
      landscape: landscape,
    );
    final poster = _buildPoster(item, posterWidth);
    final actions = _buildActions(landscape, posterWidth);
    final header = _buildHeader(item, landscape, sections);
    final top = stageTopInset(context);
    final side = stageLeadingInset(
      context,
      landscape: landscape,
      prefs: widget.prefs,
    );

    final Widget page;
    if (landscape) {
      page = SingleChildScrollView(
        controller: _scroll,
        padding: EdgeInsets.fromLTRB(
          side,
          top,
          48,
          bottomNavContentPadding(context, 48),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: posterWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [poster, const SizedBox(height: 16), actions],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header,
                      for (final s in beside) ...[
                        const SizedBox(height: 18),
                        s.child,
                      ],
                    ],
                  ),
                ),
              ],
            ),
            for (final s in below) ...[const SizedBox(height: 28), s.child],
          ],
        ),
      );
    } else {
      page = SingleChildScrollView(
        controller: _scroll,
        padding: EdgeInsets.fromLTRB(
          side,
          top,
          side,
          bottomNavContentPadding(context, 32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: poster),
            const SizedBox(height: 20),
            header,
            const SizedBox(height: 20),
            actions,
            for (final s in [...beside, ...below]) ...[
              const SizedBox(height: 22),
              s.child,
            ],
          ],
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [_buildBackdrop(item, landscape), page],
    );
  }

  void _go(FocusNode? node) {
    if (node == null || node.context?.mounted != true) return;
    node.requestFocus();
    // The episodes bring their whole section into view as focus arrives.
    if (node == _nodes['episodes']) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = node.context;
      if (!mounted || ctx == null || !ctx.mounted || _offScreen(ctx) == 0) {
        return;
      }
      Scrollable.ensureVisible(
        ctx,
        alignment: 0.3,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  /// Which way [target] runs out of the page: -1 above it, 1 below it, and
  /// 0 when it's wholly on screen, in which case scrolling to it would only
  /// fight whatever it scrolls itself.
  int _offScreen(BuildContext target) {
    if (!_scroll.hasClients) return 0;
    final page = _scroll.position.context.storageContext.findRenderObject();
    final box = target.findRenderObject();
    if (page is! RenderBox || box is! RenderBox) return 0;
    if (!page.attached || !box.attached) return 0;
    // In the page's own units. The app draws at its own scale inside the
    // window, so screen positions don't compare with the page's height.
    final y = box.localToGlobal(Offset.zero, ancestor: page).dy;
    if (y < 0) return -1;
    if (y + box.size.height > page.size.height) return 1;
    return 0;
  }

  /// Brings the whole of a section into view, scrolling only as far as it
  /// takes, so the titles under a row aren't left below the screen.
  void _reveal(BuildContext section) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !section.mounted) return;
      final side = _offScreen(section);
      if (side == 0) return;
      Scrollable.ensureVisible(
        section,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        alignmentPolicy: side < 0
            ? ScrollPositionAlignmentPolicy.keepVisibleAtStart
            : ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    });
  }

  void _toActions() {
    widget.initialFocusNode?.requestFocus();
    if (_scroll.hasClients) {
      _scroll.animateTo(
        0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  void _toNavbar() {
    if (_scroll.hasClients) _scroll.jumpTo(0);
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  /// The button in the nearest row below or above [from]. Going down it's the
  /// first one in that row, the way a row is read. Going up it's the one most
  /// nearly over [from].
  FocusNode? _actionNeighbour(FocusNode from, {required bool down}) {
    final root = _actionsKey.currentContext;
    if (root == null || from.context?.mounted != true) return null;
    final nodes = <FocusNode>{};
    void visit(Element element) {
      final widget = element.widget;
      if (widget is Focus) {
        final node = widget.focusNode;
        if (node != null &&
            node.canRequestFocus &&
            !node.skipTraversal &&
            node.context?.mounted == true) {
          nodes.add(node);
        }
      }
      element.visitChildren(visit);
    }

    (root as Element).visitChildren(visit);
    final origin = from.rect;
    final candidates = [
      for (final node in nodes)
        if (node != from &&
            (down
                ? node.rect.top >= origin.bottom - 1
                : node.rect.bottom <= origin.top + 1))
          node,
    ];
    if (candidates.isEmpty) return null;
    double gap(FocusNode n) =>
        down ? n.rect.top - origin.bottom : origin.top - n.rect.bottom;
    final nearest = candidates.map(gap).reduce(math.min);
    final row = candidates.where((n) => gap(n) - nearest < 4).toList();
    row.sort(
      (a, b) => down
          ? a.rect.left.compareTo(b.rect.left)
          : (a.rect.center.dx - origin.center.dx).abs().compareTo(
              (b.rect.center.dx - origin.center.dx).abs(),
            ),
    );
    return row.first;
  }

  bool _focusIsInActions() {
    final context = FocusManager.instance.primaryFocus?.context;
    if (context == null) return false;
    var inside = false;
    context.visitAncestorElements((element) {
      inside = identical(element.widget.key, _actionsKey);
      return !inside;
    });
    return inside;
  }

  /// The stop under [node], or null at the bottom of the page.
  FocusNode? _stopBelow(FocusNode node) {
    final b = _beside.indexOf(node);
    if (b >= 0) {
      return b + 1 < _beside.length ? _beside[b + 1] : _below.firstOrNull;
    }
    final r = _below.indexOf(node);
    return r >= 0 && r + 1 < _below.length ? _below[r + 1] : null;
  }

  /// Up from [node]. The top of the beside column sits level with the poster,
  /// so on a TV with the toolbar along the top it goes up to the toolbar
  /// rather than back to the buttons.
  void _moveUp(FocusNode node) {
    final b = _beside.indexOf(node);
    if (b > 0) return _go(_beside[b - 1]);
    if (b == 0) return _landscape && _navbarIsTop ? _toNavbar() : _toActions();
    final r = _below.indexOf(node);
    if (r > 0) return _go(_below[r - 1]);
    if (r == 0) {
      if (_beside.isNotEmpty) return _go(_beside.last);
      _toActions();
    }
  }

  void _moveDown(FocusNode node) => _go(_stopBelow(node));

  KeyEventResult Function(int index, KeyEvent event) _rowKeys(
    FocusNode node,
    int length,
  ) => (index, event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      _moveUp(node);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      _moveDown(node);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight && index == length - 1) {
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  };

  /// The gap between a row's title and its cards, with room for a focused
  /// card to grow into when focus expansion is on, so it never covers the
  /// title.
  double _rowSpacing(double imageHeight) =>
      12 +
      MediaCard.focusHeadroom(
        imageHeight,
        expansion: widget.prefs.get(UserPreferences.cardFocusExpansion),
      );

  /// The card width the season, similar, collection and Seerr rows share.
  double get _posterCardWidth => detailIsCompact(context)
      ? 120.0
      : 150.0 * detailDesktopScale(prefs: widget.prefs);

  double get _posterRowSpacing => _rowSpacing(_posterCardWidth * 1.5);

  Widget _buildBackdrop(AggregatedItem item, bool landscape) {
    final own = _ownBackdropUrl(item);
    final amount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble()
        .clamp(0.0, 25.0);
    // The page sits on the picture rather than beside it, so the darkening
    // keeps a floor even with the slider at the bottom.
    final alpha = 0.55 + (amount / 25.0) * 0.3;
    final blur = GlassSettings.blursBackdrop && amount > 0;
    final showImage = widget.prefs.get(UserPreferences.detailsBackdropEnabled);

    return RepaintBoundary(
      child: ValueListenableBuilder<String?>(
        valueListenable: widget.backdropUrl,
        builder: (context, value, _) {
          final url = value ?? own;
          return Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: AppColorScheme.background),
              if (showImage && url != null && url.isNotEmpty)
                DetailBackdropFit(
                  prefs: widget.prefs,
                  child: ImageFiltered(
                    enabled: blur,
                    imageFilter: ImageFilter.blur(
                      sigmaX: GlassSettings.capSigma(amount),
                      sigmaY: GlassSettings.capSigma(amount),
                    ),
                    child: FullscreenBackdropSwitcher(
                      imageUrl: url,
                      duration: const Duration(milliseconds: 350),
                      alignment: landscape
                          ? Alignment.center
                          : Alignment.topCenter,
                    ),
                  ),
                ),
              ColoredBox(color: AppColors.black.withValues(alpha: alpha)),
            ],
          );
        },
      ),
    );
  }

  /// The title's own backdrop, its show's for a season or an episode, or the
  /// TMDB one for a title that is only in Seerr.
  String? _ownBackdropUrl(AggregatedItem item) {
    final api = _vm.imageApi;
    if (item.serverId != 'seerr' && item.backdropImageTags.isNotEmpty) {
      return api.getBackdropImageUrl(
        item.id,
        maxWidth: 1920,
        tag: item.backdropImageTags.first,
      );
    }
    final parentId = item.parentBackdropItemId;
    if (parentId != null && item.parentBackdropImageTags.isNotEmpty) {
      return api.getBackdropImageUrl(
        parentId,
        maxWidth: 1920,
        tag: item.parentBackdropImageTags.first,
      );
    }
    final path = item.rawData['BackdropPath'] as String?;
    return path == null || path.isEmpty ? null : '$seerrBackdropBase$path';
  }

  /// An episode's still is wide, so it keeps its own shape instead of being
  /// cropped into a poster.
  Widget _buildPoster(AggregatedItem item, double width) {
    // With series thumbnails on, an episode keeps its still out of sight and
    // shows its show's poster, with the episode's own progress on it.
    final seriesId = item.seriesId;
    final seriesTag = item.seriesPrimaryImageTag;
    final spoilerFree =
        item.type == 'Episode' &&
        widget.prefs.effectiveDetailUseSeriesThumbnails &&
        seriesId != null &&
        seriesTag != null;
    final shown = spoilerFree
        ? AggregatedItem(
            id: seriesId,
            serverId: item.serverId,
            rawData: {
              'Type': 'Series',
              'ImageTags': {'Primary': seriesTag},
              'UserData': item.rawData['UserData'],
            },
          )
        : item;
    final wide =
        !spoilerFree && (item.type == 'Episode' || item.type == 'Video');
    return DetailPosterImage(
      key: const ValueKey('stage-poster'),
      item: shown,
      imageApi: _vm.imageApi,
      size: Size(width, wide ? width * 9 / 16 : width * 1.5),
    );
  }

  Widget _buildActions(bool landscape, double columnWidth) {
    // Play, three circles and the ellipsis are what fit under the poster, so
    // that's the most this style shows whatever the button limit says.
    final kidsMode = widget.prefs.get(UserPreferences.kidsModeEnabled);
    final prefLimit = widget.prefs.get(UserPreferences.detailButtonsMaxVisible);
    final maxVisible = kidsMode
        ? 4
        : (prefLimit > 0 ? math.min(prefLimit + 1, 5) : 5);

    // Down from the buttons skips the column beside them on a TV, since that
    // column is reached by going right.
    final down = landscape
        ? (_below.firstOrNull ?? _beside.firstOrNull)
        : (_beside.firstOrNull ?? _below.firstOrNull);
    // The row treats Play and the circles as one line, but here the circles
    // sit under Play, so Down tries the button below before leaving the row.
    final downProxy = _node('actions-down');

    final buttons = DetailActionButtons(
      key: _actionsKey,
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: _upProxy,
      downTarget: downProxy,
      onRequestFocus: (target) {
        if (target != downProxy) {
          _go(target);
          return KeyEventResult.handled;
        }
        final from = FocusManager.instance.primaryFocus;
        final below = from == null ? null : _actionNeighbour(from, down: true);
        if (below != null) {
          below.requestFocus();
        } else {
          _go(down);
        }
        return KeyEventResult.handled;
      },
      onArrowRightAtEnd: landscape && _beside.isNotEmpty
          ? () => _go(_beside.first)
          : null,
      autoPlay: widget.autoPlay,
      modernStyle: true,
      fullWidthPrimary: true,
      rowMaxWidth: landscape ? columnWidth : null,
      overflowAsMenu: !kidsMode,
      maxVisibleButtonsOverride: maxVisible,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
      omitTrackButtons: true,
      labelsUnderCircles: landscape,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          focusNode: _upProxy,
          onFocusChange: _onUpProxyFocus,
          child: const SizedBox.shrink(),
        ),
        buttons,
      ],
    );
  }

  Widget _buildHeader(
    AggregatedItem item,
    bool landscape,
    DetailSectionVisibility sections,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onBackground.withValues(alpha: 0.82);
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
    );
    final overview = cleanOverview(item.overview?.trim());
    final showOverview =
        overview.isNotEmpty &&
        !hidesMediaDescription(
          itemType: item.type,
          hideMediaDescription:
              widget.prefs.effectiveHideDetailsMediaDescription,
        );
    final tagline = sections.shows(DetailSection.tagline) ? item.tagline : null;
    final downloads = seerrItemDownloads(_vm);

    return Column(
      key: const ValueKey('stage-header'),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBranding(item, landscape, sections),
        const SizedBox(height: 10),
        DetailMetadataRow(
          item: item,
          selectedMediaSource: selectedSource,
          upcomingEpisode: _vm.upcomingEpisode,
          seerrStatus: seerrItemStatus(_vm),
        ),
        IncompleteRecordingDetailLine(itemId: item.id),
        if (ratings != null) ...[const SizedBox(height: 10), ratings],
        if (tagline != null && tagline.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            tagline,
            style: textTheme.bodyLarge?.copyWith(
              color: muted,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        if (showOverview) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Text(
              overview,
              maxLines: landscape ? 4 : null,
              overflow: landscape ? TextOverflow.ellipsis : null,
              style: textTheme.bodyMedium?.copyWith(color: muted, height: 1.5),
            ),
          ),
        ],
        if (downloads != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SeerrItemDownloadBars(state: downloads),
          ),
        ],
      ],
    );
  }

  /// The logo where the title would go, or the name when there's no logo. A
  /// season or an episode names its show above its own title.
  Widget _buildBranding(
    AggregatedItem item,
    bool landscape,
    DetailSectionVisibility sections,
  ) {
    final partOfShow = item.type == 'Episode' || item.type == 'Season';
    final logoTag = sections.shows(DetailSection.logo)
        ? item.logoImageTag ?? (partOfShow ? item.seriesLogoImageTag : null)
        : null;
    final logoId = logoTag == null
        ? null
        : (item.logoImageTag != null ? item.id : item.seriesId);
    final size = MediaQuery.sizeOf(context);
    final titleStyle = TextStyle(
      color: AppColorScheme.onBackground,
      fontWeight: FontWeight.w700,
      fontSize: landscape ? 38 : 28,
      height: 1.1,
    );

    final showName = partOfShow ? (item.seriesName ?? item.name) : item.name;
    final Widget mark = logoTag != null && logoId != null && logoId.isNotEmpty
        ? LogoView(
            imageUrl: _vm.imageApi.getLogoImageUrl(
              logoId,
              maxWidth: 700,
              tag: logoTag,
            ),
            maxWidth: landscape ? 360 : 240,
            maxHeight: landscape ? math.min(110.0, size.height * 0.16) : 90,
          )
        : Text(
            showName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          );

    if (!partOfShow) return mark;

    final number = item.type == 'Episode' ? _episodeNumber(item) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        mark,
        const SizedBox(height: 8),
        Text(
          [?number, item.name].join(' · '),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: titleStyle.copyWith(
            fontSize: landscape ? 26 : 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  static String? _episodeNumber(AggregatedItem item) {
    final season = item.parentIndexNumber;
    final episode = item.indexNumber;
    if (season == null || episode == null) return null;
    return 'S$season:E$episode';
  }

  /// What sits beside the poster on a TV: the track pickers, the people and
  /// studios behind a film, and the seasons or episodes of a show.
  List<_StageSection> _besideSections(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final out = <_StageSection>[];
    final isShow = const {'Series', 'Season', 'Episode'}.contains(item.type);

    final choices = _actionsKey.currentState?.trackChoices(l10n);
    if (choices == null && !_vm.isSeerrOnly) {
      // The button row holds the pickers' state, so the chips show up a frame
      // after it does.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _actionsKey.currentState != null) setState(() {});
      });
    }
    if (choices != null && choices.isNotEmpty) {
      final node = _node('tracks');
      out.add(
        _StageSection(
          node: node,
          child: StageTrackChips(
            choices: choices,
            firstFocusNode: node,
            onOpen: (kind) => _actionsKey.currentState?.openTrackPicker(kind),
            onNavigateUp: () => _moveUp(node),
            onNavigateDown: () => _moveDown(node),
            onLeftEdge: _landscape ? _toActions : null,
          ),
        ),
      );
    }

    final hasCrew =
        sections.shows(DetailSection.crew) &&
        (_vm.directors.isNotEmpty || _vm.writers.isNotEmpty);
    final hasStudios =
        sections.shows(DetailSection.studios) && item.studios.isNotEmpty;
    if (!isShow && (hasCrew || hasStudios)) {
      final node = _node('facts');
      // Stand-ins the section hands back through onRequestFocus. The real
      // neighbours aren't known until every section is built.
      final up = _node('facts-up');
      final down = _node('facts-down');
      out.add(
        _StageSection(
          node: node,
          child: DetailMetadataSection(
            viewModel: _vm,
            showCrew: hasCrew,
            showStudios: hasStudios,
            firstItemFocusNode: node,
            upTarget: up,
            downTarget: down,
            onRequestFocus: (target) {
              if (target == up) _moveUp(node);
              if (target == down) _moveDown(node);
              return KeyEventResult.handled;
            },
          ),
        ),
      );
    }

    if (isShow && _vm.isSeerrOnly) {
      final seerr = _vm.seerr;
      if (_vm.seasons.isNotEmpty && seerr != null) {
        final node = _node('seasons');
        out.add(
          _StageSection(
            node: node,
            child: ClipRect(
              clipper: const _LeftEdgeClipper(),
              child: HorizontalScrollSection(
                title: l10n.seasons,
                contentSpacing: _posterRowSpacing,
                builder: (context, controller) => DetailSeasonsRow(
                  seasons: _vm.seasons,
                  imageApi: _vm.imageApi,
                  prefs: widget.prefs,
                  scrollController: controller,
                  firstItemFocusNode: node,
                  seerrSeasonStatus: seerrItemSeasonStatus(_vm),
                  onSeasonTap: (number) => showSeerrRequestDialog(
                    context: context,
                    vm: seerr,
                    is4k: false,
                    qualityToggle: true,
                    season: number > 0 ? number : null,
                  ),
                  onItemKeyEvent: _rowKeys(node, _vm.seasons.length),
                ),
              ),
            ),
          ),
        );
      }
    } else if (const {'Series', 'Season'}.contains(item.type)) {
      out.add(_episodesSection(item, besidePoster: true));
    }

    return out;
  }

  /// The full width rows under the poster: an episode's run of episodes, the
  /// cast, extras, the collections the title belongs to, more like it and
  /// Seerr's rows.
  List<_StageSection> _belowSections(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final out = <_StageSection>[];

    // An episode's still is short, so its show's episodes run full width
    // under it rather than squeezing in beside it.
    if (item.type == 'Episode' &&
        !_vm.isSeerrOnly &&
        sections.shows(DetailSection.moreEpisodes)) {
      out.add(_episodesSection(item, besidePoster: false));
    }

    final cast = _castSection(item, sections, l10n);
    if (cast != null) out.add(cast);

    if (sections.shows(DetailSection.extras) && _vm.features.isNotEmpty) {
      final node = _node('extras');
      final items = _vm.features;
      out.add(
        _StageSection(
          node: node,
          child: HorizontalScrollSection(
            title: l10n.extras,
            contentSpacing: _rowSpacing(
              (detailIsCompact(context)
                      ? 140.0
                      : 170.0 * detailDesktopScale(prefs: widget.prefs)) /
                  MediaCard.aspectRatioForType(items.first.type),
            ),
            builder: (context, controller) => DetailFeaturesRow(
              items: items,
              imageApi: _vm.imageApi,
              prefs: widget.prefs,
              scrollController: controller,
              firstItemFocusNode: node,
              onItemKeyEvent: _rowKeys(node, items.length),
            ),
          ),
        ),
      );
    }

    if (sections.shows(DetailSection.collections)) {
      for (final collection in _vm.parentCollections) {
        if (collection.items.isEmpty) continue;
        final node = _node('collection-${collection.id}');
        out.add(
          _StageSection(
            node: node,
            child: HorizontalScrollSection(
              title: collection.name,
              contentSpacing: _posterRowSpacing,
              builder: (context, controller) => DetailSimilarRow(
                items: collection.items,
                imageApi: _vm.imageApi,
                prefs: widget.prefs,
                scrollController: controller,
                firstItemFocusNode: node,
                onItemKeyEvent: _rowKeys(node, collection.items.length),
              ),
            ),
          ),
        );
      }
    }

    if (sections.shows(DetailSection.moreLikeThis) && _vm.similar.isNotEmpty) {
      final node = _node('similar');
      final items = _vm.similar;
      out.add(
        _StageSection(
          node: node,
          child: HorizontalScrollSection(
            title: l10n.moreLikeThis,
            contentSpacing: _posterRowSpacing,
            builder: (context, controller) => DetailSimilarRow(
              items: items,
              imageApi: _vm.imageApi,
              prefs: widget.prefs,
              scrollController: controller,
              firstItemFocusNode: node,
              onItemKeyEvent: _rowKeys(node, items.length),
            ),
          ),
        ),
      );
    }

    out.addAll(_seerrSections(sections, l10n));
    return out;
  }

  /// The season tabs over the episode rail. Beside the poster, Left off its
  /// first tab or episode goes back to the buttons.
  _StageSection _episodesSection(
    AggregatedItem item, {
    required bool besidePoster,
  }) {
    final node = _node('episodes');
    return _StageSection(
      node: node,
      child: Builder(
        builder: (section) => Focus(
          canRequestFocus: false,
          onFocusChange: (has) {
            if (has) _reveal(section);
          },
          child: ClipRect(
            clipper: const _LeftEdgeClipper(),
            child: MinimalistEpisodesSection(
              key: ValueKey('stage-episodes-${item.id}'),
              viewModel: _vm,
              prefs: widget.prefs,
              landscape: _landscape,
              // Held to a share of the screen's height rather than the
              // width a full screen rail would give the stills.
              maxHeight: _landscape
                  ? MediaQuery.sizeOf(context).height * 0.36
                  : null,
              episodesFocusNode: node,
              onVerticalNavigation: (isUp) {
                isUp ? _moveUp(node) : _moveDown(node);
                return true;
              },
              onLeftEdge: _landscape && besidePoster ? _toActions : null,
            ),
          ),
        ),
      ),
    );
  }

  _StageSection? _castSection(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final people = _vm.actors;
    if (!sections.shows(DetailSection.cast) || people.isEmpty) return null;
    final node = _node('cast');
    return _StageSection(
      node: node,
      child: HorizontalScrollSection(
        title: l10n.detailSectionCast,
        builder: (context, controller) => DetailCastRow(
          people: people,
          imageApi: _vm.imageApi,
          serverId: item.serverId,
          scrollController: controller,
          firstItemFocusNode: node,
          onItemKeyEvent: _rowKeys(node, people.length),
        ),
      ),
    );
  }

  /// What Seerr knows that the library doesn't: the tags, the numbers behind
  /// the title, where it streams and what it leads to.
  List<_StageSection> _seerrSections(
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final state = seerrItemTabState(_vm);
    final pieces = SeerrDetailPieces.resolve(state, sections, l10n);
    if (state == null || !pieces.hasAny) return const [];
    final label = GetIt.instance<SeerrPreferences>().labelOrDefault(l10n.seerr);
    final titleStyle = Theme.of(context).textTheme.titleMedium
        ?.copyWith(fontWeight: FontWeight.w600);

    _StageSection row(String id, String title, List<SeerrDiscoverItem> items) {
      final node = _node(id);
      return _StageSection(
        node: node,
        child: HorizontalScrollSection(
          title: '$label · $title',
          contentSpacing: _posterRowSpacing,
          builder: (context, controller) => SeerrAppearancesRow(
            items: items,
            prefs: widget.prefs,
            scrollController: controller,
            firstFocusNode: node,
            onItemKeyEvent: _rowKeys(node, items.length),
            customCardWidth: _posterCardWidth,
          ),
        ),
      );
    }

    final chipsNode = _node('seerr-chips');
    return [
      if (pieces.chips || pieces.stats || pieces.streaming)
        _StageSection(
          node: pieces.chips ? chipsNode : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: titleStyle),
              if (pieces.chips) ...[
                const SizedBox(height: 12),
                SeerrItemChips(
                  state: state,
                  firstFocusNode: chipsNode,
                  onNavigateUp: () => _moveUp(chipsNode),
                  onNavigateDown: () => _moveDown(chipsNode),
                ),
              ],
              if (pieces.stats) ...[
                const SizedBox(height: 14),
                SeerrStatsCard(state: state),
              ],
              if (pieces.streaming) ...[
                const SizedBox(height: 14),
                SeerrStreamingRow(providers: state.streamingProviders),
              ],
            ],
          ),
        ),
      if (pieces.recommendations)
        row(
          'seerr-recommendations',
          l10n.recommendations,
          state.recommendations,
        ),
      if (pieces.similar) row('seerr-similar', l10n.similar, state.similar),
    ];
  }
}

/// Cuts off what a row beside the poster scrolls past its left edge, so it
/// never slides over the poster and buttons. Every other side is left open,
/// with a little room on the left too, so a focused card can still grow.
class _LeftEdgeClipper extends CustomClipper<Rect> {
  const _LeftEdgeClipper();

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(-16, -size.height, size.width + 2000, size.height * 2);

  @override
  bool shouldReclip(_LeftEdgeClipper oldClipper) => false;
}

/// One part of the page and the node D-pad focus enters it by, or none when
/// nothing in it takes focus.
class _StageSection {
  final FocusNode? node;
  final Widget child;

  const _StageSection({required this.node, required this.child});
}
