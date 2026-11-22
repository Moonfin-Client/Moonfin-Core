import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/detail_section_layout.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';
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

/// The title centered over its backdrop, filling the first screen, with the
/// buttons and ratings under it. Every other part of the page is a section
/// further down, each its own stop for the D-pad, and an arrow at the foot of
/// the backdrop hints at them.
///
/// A title that's only in Seerr gets the same page with Request in place of
/// play, its seasons as request cards and Seerr's own sections.
class PremiereDetailContent extends StatefulWidget {
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

  const PremiereDetailContent({
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
  State<PremiereDetailContent> createState() => _PremiereDetailContentState();
}

class _PremiereDetailContentState extends State<PremiereDetailContent>
    with DetailPage<PremiereDetailContent> {
  // The sections' stops down the page. Rebuilt with the page, since which
  // sections exist depends on what loaded.
  List<FocusNode> _stops = const [];

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  ItemDetailViewModel get pageViewModel => widget.viewModel;

  @override
  UserPreferences get pagePrefs => widget.prefs;

  @override
  ValueChanged<bool>? get pageNavbarToggle => widget.onToggleNavbar;

  @override
  String sectionTitle(String title) => title.toUpperCase();

  @override
  TextStyle? get sectionTitleStyle =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
        color: AppColorScheme.onBackground.withValues(alpha: 0.75),
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      );

  @override
  void moveUp(FocusNode node) {
    final i = _stops.indexOf(node);
    if (i > 0) return _enter(_stops[i - 1]);
    _toActions();
  }

  @override
  void moveDown(FocusNode node) {
    final i = _stops.indexOf(node);
    if (i >= 0 && i + 1 < _stops.length) _enter(_stops[i + 1]);
  }

  void _enter(FocusNode? node) {
    final target = node == null ? null : entryFor(node);
    if (target?.context?.mounted == true) target!.requestFocus();
  }

  /// Back to whichever button was focused last, at the top of the page.
  void _toActions() {
    final last = lastActionFocus;
    _enter(last?.context?.mounted == true ? last : widget.initialFocusNode);
    if (pageScroll.hasClients) {
      pageScroll.animateTo(
        0,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    }
  }

  /// Up from the buttons goes to the toolbar when it runs along the top, and
  /// stays put beside a sidebar, which Left already opens.
  void _onUpProxyFocus(bool focused) {
    if (!focused) return;
    if (navbarIsTop && NavigationLayout.focusNavbarNotifier.value != null) {
      toNavbar();
    } else {
      final last = lastActionFocus;
      _enter(last?.context?.mounted == true ? last : widget.initialFocusNode);
    }
  }

  /// Puts a section near the top of the screen as D-pad focus arrives in it,
  /// so the page reads down one section at a time.
  void _bringToTop(BuildContext section) {
    if (FocusManager.instance.highlightMode != FocusHighlightMode.traditional) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !section.mounted || !pageScroll.hasClients) return;
      final page = pageScroll.position.context.storageContext
          .findRenderObject();
      final box = section.findRenderObject();
      if (page is! RenderBox || box is! RenderBox || !box.attached) return;
      final position = pageScroll.position;
      final y = box.localToGlobal(Offset.zero, ancestor: page).dy;
      final target = (position.pixels + y - 24).clamp(
        0.0,
        position.maxScrollExtent,
      );
      if ((target - position.pixels).abs() < 1) return;
      pageScroll.animateTo(
        target,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    });
  }

  /// Clicking the arrow brings the first section up, like Down on a remote.
  void _scrollPast(double heroHeight) {
    if (!pageScroll.hasClients) return;
    pageScroll.animateTo(
      math.min(heroHeight, pageScroll.position.maxScrollExtent),
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final landscape = detailUsesLandscapeLayout(context);
    final sections = DetailSectionVisibility.of(widget.prefs);
    final size = MediaQuery.sizeOf(context);

    // Built before the buttons, so Down from them knows where to land.
    final parts = _sections(item, sections, l10n, landscape, size);
    _stops = [for (final s in parts) s.node!];

    final heroHeight = premiereHeroHeight(size, landscape: landscape);
    final side = _sideInsets(landscape, size);
    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
      centered: true,
    );
    final moreBelow = landscape && parts.isNotEmpty;

    final hero = Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: heroHeight,
          child: _buildBackdrop(item),
        ),
        Padding(
          padding: landscape
              ? side
              : EdgeInsets.fromLTRB(20, heroHeight * 0.42, 20, 0),
          child: landscape
              ? SizedBox(
                  height: heroHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: _buildHeroText(item, sections, landscape, size),
                      ),
                      const SizedBox(height: 22),
                      _buildActions(landscape),
                      if (ratings != null) ...[
                        const SizedBox(height: 16),
                        ratings,
                      ],
                      if (moreBelow)
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: GestureDetector(
                            onTap: () => _scrollPast(heroHeight),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                                color: AppColorScheme.onBackground.withValues(
                                  alpha: 0.65,
                                ),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: moreBelow || PlatformDetection.isTV ? 12 : 40,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    _buildHeroText(item, sections, landscape, size),
                    const SizedBox(height: 18),
                    _buildActions(landscape),
                    if (ratings != null) ...[
                      const SizedBox(height: 16),
                      ratings,
                    ],
                    ..._portraitOverview(item),
                  ],
                ),
        ),
      ],
    );

    return ColoredBox(
      color: AppColorScheme.background,
      child: SingleChildScrollView(
        controller: pageScroll,
        padding: EdgeInsets.only(
          bottom: bottomNavContentPadding(context, landscape ? 64 : 32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            hero,
            for (final s in parts)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  side.left,
                  landscape ? 24 : 16,
                  side.right,
                  0,
                ),
                child: s.child,
              ),
          ],
        ),
      ),
    );
  }

  EdgeInsets _sideInsets(bool landscape, Size size) {
    if (!landscape) return const EdgeInsets.symmetric(horizontal: 16);
    final base = (size.width * 0.08).clamp(48.0, 140.0);
    // A left sidebar sits over the leading edge.
    final lead = navbarIsTop ? base : math.max(base, 120.0);
    return EdgeInsets.only(left: lead, right: base);
  }

  /// The backdrop fades into the page at its foot and darkens toward its
  /// edges, more so the further the blur slider goes, but the picture itself
  /// stays sharp, since it's the point of this style.
  Widget _buildBackdrop(AggregatedItem item) {
    final own = ownBackdropUrl(item);
    final amount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble()
        .clamp(0.0, 25.0);
    final dim = 0.6 + (amount / 25.0) * 0.4;
    final showImage = widget.prefs.get(UserPreferences.detailsBackdropEnabled);
    final base = AppColorScheme.background;

    return RepaintBoundary(
      child: ValueListenableBuilder<String?>(
        valueListenable: widget.backdropUrl,
        builder: (context, value, _) {
          final url = value ?? own;
          return Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: base),
              if (showImage && url != null && url.isNotEmpty)
                FullscreenBackdropSwitcher(
                  imageUrl: url,
                  duration: const Duration(milliseconds: 350),
                  alignment: Alignment.topCenter,
                ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.3),
                    radius: 1.1,
                    colors: [
                      base.withValues(alpha: 0),
                      base.withValues(alpha: 0.45 * dim),
                      base.withValues(alpha: 0.85 * dim),
                    ],
                    stops: const [0, 0.65, 1],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      base,
                      base.withValues(alpha: 0.8 * dim + 0.2),
                      base.withValues(alpha: 0),
                    ],
                    stops: const [0.06, 0.42, 0.7],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeroText(
    AggregatedItem item,
    DetailSectionVisibility sections,
    bool landscape,
    Size size,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onBackground.withValues(alpha: 0.82);
    final overview = landscape ? overviewText(item) : null;
    final overviewStyle = textTheme.bodyMedium?.copyWith(
      color: muted,
      height: 1.5,
    );
    final tagline = sections.shows(DetailSection.tagline) ? item.tagline : null;
    final downloads = seerrItemDownloads(_vm);

    return Column(
      key: const ValueKey('premiere-hero'),
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBranding(item, sections, landscape, size),
        const SizedBox(height: 12),
        DetailMetadataRow(
          item: item,
          selectedMediaSource: selectedMediaSourceForItem(
            item,
            widget.selectedMediaSourceId,
          ),
          upcomingEpisode: _vm.upcomingEpisode,
          seerrStatus: seerrItemStatus(_vm),
          centered: true,
        ),
        IncompleteRecordingDetailLine(
          itemId: item.id,
          textAlign: TextAlign.center,
        ),
        if (landscape && tagline != null && tagline.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            tagline,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: muted,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        if (overview != null) ...[
          const SizedBox(height: 10),
          // The whole overview, unless it would push the title off the top,
          // when it gives up the lines there's no room for.
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final line =
                      MediaQuery.textScalerOf(context)
                          .scale(overviewStyle?.fontSize ?? 14) *
                      (overviewStyle?.height ?? 1);
                  final lines = constraints.maxHeight.isFinite
                      ? (constraints.maxHeight / line).floor()
                      : null;
                  if (lines == 0) return const SizedBox.shrink();
                  return Text(
                    overview,
                    maxLines: lines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: overviewStyle,
                  );
                },
              ),
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

  /// A phone has the room to give the whole overview, under the buttons.
  List<Widget> _portraitOverview(AggregatedItem item) {
    final overview = overviewText(item);
    if (overview == null) return const [];
    return [
      const SizedBox(height: 16),
      Text(
        overview,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColorScheme.onBackground.withValues(alpha: 0.86),
          height: 1.55,
        ),
      ),
    ];
  }

  /// The logo, or the name set large in capitals when there's no logo. A
  /// season or an episode names its show and then itself.
  Widget _buildBranding(
    AggregatedItem item,
    DetailSectionVisibility sections,
    bool landscape,
    Size size,
  ) {
    final partOfShow = item.type == 'Episode' || item.type == 'Season';
    final logoTag = sections.shows(DetailSection.logo)
        ? item.logoImageTag ?? (partOfShow ? item.seriesLogoImageTag : null)
        : null;
    final logoId = logoTag == null
        ? null
        : (item.logoImageTag != null ? item.id : item.seriesId);
    final shadows = [
      Shadow(color: AppColors.black.withValues(alpha: 0.6), blurRadius: 24),
    ];

    final showName = partOfShow ? (item.seriesName ?? item.name) : item.name;
    final Widget mark = logoTag != null && logoId != null && logoId.isNotEmpty
        ? LogoView(
            imageUrl: _vm.imageApi.getLogoImageUrl(
              logoId,
              maxWidth: 800,
              tag: logoTag,
            ),
            maxWidth: landscape ? 520 : 280,
            maxHeight: landscape ? math.min(150.0, size.height * 0.22) : 110,
          )
        : Text(
            showName.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onBackground,
              fontSize: landscape ? (size.width * 0.052).clamp(40.0, 72.0) : 40,
              fontWeight: FontWeight.w700,
              letterSpacing: landscape ? 4 : 3,
              height: 1.05,
              shadows: shadows,
            ),
          );

    if (!partOfShow) return mark;

    final number = item.type == 'Episode' ? episodeNumber(item) : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        mark,
        const SizedBox(height: 10),
        Text(
          [?number, item.name].join(' · '),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColorScheme.onBackground,
            fontSize: landscape ? 24 : 20,
            fontWeight: FontWeight.w600,
            shadows: shadows,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(bool landscape) {
    final kidsMode = widget.prefs.get(UserPreferences.kidsModeEnabled);
    // Left on Auto, a TV would line up every button it has. Play, four
    // circles and the ellipsis keep the row the width of the title.
    final auto = widget.prefs.get(UserPreferences.detailButtonsMaxVisible) == 0;
    final buttons = DetailActionButtons(
      key: actionsKey,
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: actionsUpProxy,
      downTarget: _stops.firstOrNull,
      onRequestFocus: (target) {
        _enter(target);
        return KeyEventResult.handled;
      },
      autoPlay: widget.autoPlay,
      modernStyle: true,
      fullWidthPrimary: !landscape,
      centerRow: true,
      overflowAsMenu: !kidsMode,
      maxVisibleButtonsOverride: auto && landscape ? 6 : null,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
      omitTrackButtons: true,
      labelsUnderCircles: landscape,
    );

    return Column(
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

  /// Everything under the first screen, in reading order, each in its own
  /// frame with the node the D-pad enters it by.
  List<DetailPageSection> _sections(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
    bool landscape,
    Size size,
  ) {
    final out = <DetailPageSection>[];

    DetailPageSection framed(
      FocusNode node,
      Widget child, {
      String? title,
      bool whole = false,
    }) => DetailPageSection(
      node: node,
      child: _PremiereSection(
        title: title == null ? null : sectionTitle(title),
        titleStyle: sectionTitleStyle,
        wholeNode: whole ? node : null,
        filled: !landscape,
        onUp: () => moveUp(node),
        onDown: () => moveDown(node),
        onFocused: _bringToTop,
        child: child,
      ),
    );

    final isShow = const {'Series', 'Season', 'Episode'}.contains(item.type);
    if (_vm.isSeerrOnly) {
      final node = pageNode('seasons');
      final row = isShow ? seerrSeasonsRow(node, l10n) : null;
      if (row != null) out.add(framed(node, row));
    } else if (item.type == 'Series' ||
        item.type == 'Season' ||
        (item.type == 'Episode' &&
            sections.shows(DetailSection.moreEpisodes))) {
      final node = pageNode('episodes');
      out.add(
        framed(
          node,
          episodesRail(
            item,
            node,
            landscape: landscape,
            maxHeight: landscape ? size.height * 0.42 : null,
          ),
          title: l10n.episodes,
        ),
      );
    }

    for (final row in collectionRows(l10n)) {
      out.add(framed(row.node!, row.child));
    }

    final tracks = tracksSection(l10n);
    if (tracks != null) {
      out.add(
        framed(
          tracks.node!,
          tracks.child,
          title: l10n.settingsAudioAndSubtitlesSection,
        ),
      );
    }

    final facts = factsSection(item, sections, weighByText: true);
    if (facts != null) {
      out.add(framed(facts.node!, facts.child, title: l10n.details));
    }

    final rows = [
      ?castSection(item, sections, l10n),
      ...libraryRows(sections, l10n),
      ...seerrSections(sections, l10n),
    ];
    for (final (index, row) in rows.indexed) {
      // Seerr's numbers and streaming services have nothing to press, so
      // the section itself takes the stop.
      final node = row.node ?? pageNode('row-$index');
      out.add(framed(node, row.child, whole: row.node == null));
    }

    return out;
  }
}

/// One section down the page. It lights up while focus is inside it, and
/// when nothing in it takes focus it's the stop itself.
class _PremiereSection extends StatefulWidget {
  final String? title;
  final TextStyle? titleStyle;
  final FocusNode? wholeNode;

  /// A phone shows every section on a card, since there's no focus to frame.
  final bool filled;
  final VoidCallback onUp;
  final VoidCallback onDown;
  final ValueChanged<BuildContext> onFocused;
  final Widget child;

  const _PremiereSection({
    required this.title,
    required this.titleStyle,
    required this.wholeNode,
    required this.filled,
    required this.onUp,
    required this.onDown,
    required this.onFocused,
    required this.child,
  });

  @override
  State<_PremiereSection> createState() => _PremiereSectionState();
}

class _PremiereSectionState extends State<_PremiereSection> {
  bool _focused = false;

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      widget.onUp();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      widget.onDown();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight) {
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final whole = widget.wholeNode != null;
    final on = AppColorScheme.onBackground;
    final Color border;
    if (!_focused) {
      border = Colors.transparent;
    } else {
      border = whole ? on : on.withValues(alpha: 0.18);
    }
    final Color fill;
    if (whole && _focused) {
      fill = on.withValues(alpha: 0.07);
    } else {
      fill = widget.filled ? on.withValues(alpha: 0.04) : Colors.transparent;
    }

    return Focus(
      focusNode: widget.wholeNode,
      canRequestFocus: whole,
      skipTraversal: !whole,
      onKeyEvent: whole ? _onKey : null,
      onFocusChange: (has) {
        setState(() => _focused = has);
        if (has) widget.onFocused(context);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        // A row runs on past the frame's edge, so it's cut off there.
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: AppRadius.circular(14),
          border: Border.all(color: border, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null) ...[
              Text(widget.title!, style: widget.titleStyle),
              const SizedBox(height: 12),
            ],
            widget.child,
          ],
        ),
      ),
    );
  }
}
