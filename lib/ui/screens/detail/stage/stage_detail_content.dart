import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/detail_section_layout.dart';
import '../../../../preference/user_preferences.dart';
import '../../../widgets/bottom_nav/bottom_navbar.dart';
import '../../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../widgets/live_tv/incomplete_recording.dart';
import '../../../widgets/logo_view.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/seerr/seerr_item_status.dart';
import '../detail_layout_metrics.dart';
import '../detail_page.dart';
import '../item_detail_screen.dart';

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
  final ValueChanged<bool>? onToggleNavbar;
  final VoidCallback? onCollapseBiography;

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
    this.onCollapseBiography,
  });

  @override
  State<StageDetailContent> createState() => _StageDetailContentState();
}

class _StageDetailContentState extends State<StageDetailContent>
    with DetailPage<StageDetailContent> {
  // The D-pad stops in page order. The beside column comes first, then the
  // full width rows under it. Rebuilt with the page, since which sections
  // exist depends on what loaded.
  List<FocusNode> _beside = const [];
  List<FocusNode> _below = const [];
  bool _landscape = true;

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  ItemDetailViewModel get pageViewModel => widget.viewModel;

  @override
  UserPreferences get pagePrefs => widget.prefs;

  @override
  ValueChanged<bool>? get pageNavbarToggle => widget.onToggleNavbar;

  /// Up from a circle goes to the button above it. Up from Play goes to the
  /// toolbar when it runs along the top, and stays put beside a sidebar,
  /// which Left already opens.
  void _onUpProxyFocus(bool focused) {
    if (!focused) return;
    final play = widget.initialFocusNode;
    final from = lastActionFocus;
    if (from != null && from != play && from.context?.mounted == true) {
      (_actionNeighbour(from, down: false) ?? play)?.requestFocus();
      return;
    }
    if (navbarIsTop && NavigationLayout.focusNavbarNotifier.value != null) {
      toNavbar();
    } else {
      play?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final landscape = detailUsesLandscapeLayout(context);
    _landscape = landscape;
    final sections = DetailSectionVisibility.of(widget.prefs);

    // Built before anything is wired, so every section knows which stop sits
    // above and below it.
    final overview = overviewText(item);
    final beside = _besideSections(item, sections, l10n);
    final below = _belowSections(item, sections, l10n);
    _beside = [
      if (landscape && overview != null) pageNode('overview'),
      for (final s in beside) ?s.node,
    ];
    _below = [for (final s in below) ?s.node];

    final posterWidth = stagePosterWidth(
      MediaQuery.sizeOf(context),
      landscape: landscape,
    );
    final poster = _buildPoster(item, posterWidth);
    final actions = _buildActions(landscape, posterWidth);
    final header = _buildHeader(item, landscape, sections, overview);
    final top = stageTopInset(context);
    final side = stageLeadingInset(
      context,
      landscape: landscape,
      prefs: widget.prefs,
    );

    final Widget page;
    if (landscape) {
      page = SingleChildScrollView(
        controller: pageScroll,
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
        controller: pageScroll,
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

  void _go(FocusNode? section) {
    if (section == null) return;
    final node = entryFor(section);
    if (node.context?.mounted != true) return;
    node.requestFocus();
    // The episodes bring their whole section into view as focus arrives.
    if (node == pageNode('episodes')) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = node.context;
      if (!mounted || ctx == null || !ctx.mounted || offScreen(ctx) == 0) {
        return;
      }
      if (node == section) {
        Scrollable.ensureVisible(
          ctx,
          alignment: 0.3,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        );
        return;
      }
      // Only the page scrolls, so a card back in the middle of its row
      // doesn't pull the row sideways.
      final box = ctx.findRenderObject();
      if (box == null || !pageScroll.hasClients) return;
      pageScroll.position.ensureVisible(
        box,
        alignment: 0.3,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  void _toActions() {
    widget.initialFocusNode?.requestFocus();
    if (pageScroll.hasClients) {
      pageScroll.animateTo(
        0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  /// The button in the nearest row below or above [from]. Going down it's the
  /// first one in that row, the way a row is read. Going up it's the one most
  /// nearly over [from].
  FocusNode? _actionNeighbour(FocusNode from, {required bool down}) {
    final root = actionsKey.currentContext;
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

  /// The stops beside the poster that can take focus. The overview only has
  /// one once its text runs long enough to open up, and a row only while the
  /// card it's entered by is built.
  List<FocusNode> get _besideStops => [
    for (final node in _beside)
      if (entryFor(node).context?.mounted == true) node,
  ];

  /// The stop under [node], or null at the bottom of the page.
  FocusNode? _stopBelow(FocusNode node) {
    final beside = _besideStops;
    final b = beside.indexOf(node);
    if (b >= 0) {
      return b + 1 < beside.length ? beside[b + 1] : _below.firstOrNull;
    }
    final r = _below.indexOf(node);
    return r >= 0 && r + 1 < _below.length ? _below[r + 1] : null;
  }

  /// Up from [node]. The top of the beside column sits level with the poster,
  /// so on a TV with the toolbar along the top it goes up to the toolbar
  /// rather than back to the buttons.
  @override
  void moveUp(FocusNode node) {
    final beside = _besideStops;
    final b = beside.indexOf(node);
    if (b > 0) return _go(beside[b - 1]);
    if (b == 0) return _landscape && navbarIsTop ? toNavbar() : _toActions();
    final r = _below.indexOf(node);
    if (r > 0) return _go(_below[r - 1]);
    if (r == 0) {
      if (beside.isNotEmpty) return _go(beside.last);
      _toActions();
    }
  }

  @override
  void moveDown(FocusNode node) => _go(_stopBelow(node));

  Widget _buildBackdrop(AggregatedItem item, bool landscape) {
    final own = ownBackdropUrl(item);
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
    FocusNode? down() => landscape
        ? (_below.firstOrNull ?? _besideStops.firstOrNull)
        : (_besideStops.firstOrNull ?? _below.firstOrNull);
    // The row treats Play and the circles as one line, but here the circles
    // sit under Play, so Down tries the button below before leaving the row.
    final downProxy = pageNode('actions-down');

    final buttons = DetailActionButtons(
      key: actionsKey,
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: actionsUpProxy,
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
          _go(down());
        }
        return KeyEventResult.handled;
      },
      onArrowRightAtEnd: landscape && _beside.isNotEmpty
          ? () => _go(_besideStops.firstOrNull)
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
          focusNode: actionsUpProxy,
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
    String? overview,
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
    final overviewStyle = textTheme.bodyMedium?.copyWith(
      color: muted,
      height: 1.5,
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
        if (overview != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: landscape
                ? ExpandableBiography(
                    text: overview,
                    toggleFocusNode: pageNode('overview'),
                    onArrowUp: () => moveUp(pageNode('overview')),
                    onArrowDown: () => moveDown(pageNode('overview')),
                    onArrowLeft: _toActions,
                    onCollapse: widget.onCollapseBiography,
                    style: overviewStyle,
                  )
                : Text(overview, style: overviewStyle),
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

    final number = item.type == 'Episode' ? episodeNumber(item) : null;
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

  /// What sits beside the poster on a TV: the track pickers, the people and
  /// studios behind a film, and the seasons or episodes of a show.
  List<DetailPageSection> _besideSections(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final isShow = const {'Series', 'Season', 'Episode'}.contains(item.type);
    final out = <DetailPageSection>[
      ?tracksSection(l10n, onLeftEdge: _landscape ? _toActions : null),
      if (!isShow) ?factsSection(item, sections),
    ];

    if (isShow && _vm.isSeerrOnly) {
      final node = pageNode('seasons');
      final row = seerrSeasonsRow(node, l10n);
      if (row != null) {
        out.add(
          DetailPageSection(
            node: node,
            child: ClipRect(clipper: const _LeftEdgeClipper(), child: row),
          ),
        );
      }
    } else if (const {'Series', 'Season'}.contains(item.type)) {
      out.add(_episodesSection(item, besidePoster: true));
    }

    return out;
  }

  /// The full width rows under the poster: an episode's run of episodes, a
  /// collection's own titles, the cast, extras, the collections the title
  /// belongs to, more like it and Seerr's rows.
  List<DetailPageSection> _belowSections(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final out = <DetailPageSection>[];

    // An episode's still is short, so its show's episodes run full width
    // under it rather than squeezing in beside it.
    if (item.type == 'Episode' &&
        !_vm.isSeerrOnly &&
        sections.shows(DetailSection.moreEpisodes)) {
      out.add(_episodesSection(item, besidePoster: false));
    }

    out.addAll(collectionRows(l10n));

    final cast = castSection(item, sections, l10n);
    if (cast != null) out.add(cast);

    out.addAll(libraryRows(sections, l10n));
    out.addAll(seerrSections(sections, l10n));
    return out;
  }

  /// The season tabs over the episode rail. Beside the poster, Left off its
  /// first tab or episode goes back to the buttons.
  DetailPageSection _episodesSection(
    AggregatedItem item, {
    required bool besidePoster,
  }) {
    final node = pageNode('episodes');
    return DetailPageSection(
      node: node,
      child: Builder(
        builder: (section) => Focus(
          canRequestFocus: false,
          onFocusChange: (has) {
            if (has) reveal(section);
          },
          child: ClipRect(
            clipper: const _LeftEdgeClipper(),
            child: episodesRail(
              item,
              node,
              landscape: _landscape,
              // Held to a share of the screen's height rather than the
              // width a full screen rail would give the stills.
              maxHeight: _landscape
                  ? MediaQuery.sizeOf(context).height * 0.36
                  : null,
              onLeftEdge: _landscape && besidePoster ? _toActions : null,
            ),
          ),
        ),
      ),
    );
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
