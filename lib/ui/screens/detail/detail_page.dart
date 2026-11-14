import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/item_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/detail_section_layout.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/overview_text.dart';
import '../../../util/playback_time_label.dart';
import '../../widgets/horizontal_scroll_section.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/seerr/seerr_image_urls.dart';
import '../../widgets/seerr/seerr_item_chips.dart';
import '../../widgets/seerr/seerr_item_status.dart';
import '../../widgets/seerr/seerr_request_dialog.dart';
import '../../widgets/seerr/seerr_stats_card.dart';
import '../../widgets/seerr/seerr_streaming_row.dart';
import 'detail_layout_metrics.dart';
import 'item_detail_screen.dart';
import 'minimalist/widgets/minimalist_episodes_section.dart';
import 'stage/stage_track_chips.dart';

/// One part of a detail page and the node D-pad focus enters it by, or none
/// when nothing in it takes focus.
class DetailPageSection {
  final FocusNode? node;
  final Widget child;

  const DetailPageSection({required this.node, required this.child});
}

/// The scrolling page, its button row and the rows of other titles that
/// Stage and Premiere share. Each one lays them out its own way and decides
/// where Up and Down go.
mixin DetailPage<T extends StatefulWidget> on State<T> {
  ItemDetailViewModel get pageViewModel;
  UserPreferences get pagePrefs;

  /// Hides the toolbar once the page scrolls past the top, so it never sits
  /// over the rows the viewer moved down to.
  ValueChanged<bool>? get pageNavbarToggle;

  void moveUp(FocusNode node);
  void moveDown(FocusNode node);

  /// A row's title as this page shows it.
  String sectionTitle(String title) => title;
  TextStyle? get sectionTitleStyle => null;

  final pageScroll = ScrollController();
  final _nodes = <String, FocusNode>{};
  bool _navbarShown = true;

  final actionsKey = GlobalKey<DetailActionButtonsState>();

  // Every button in the row sends Up here. Where it should go depends on
  // which button it came from, which the row doesn't say, so the page keeps
  // track of the last one focused.
  final actionsUpProxy = FocusNode(
    debugLabel: 'detail-actions-up',
    skipTraversal: true,
  );
  FocusNode? lastActionFocus;

  FocusNode pageNode(String id) =>
      _nodes.putIfAbsent(id, () => FocusNode(debugLabel: 'detail-$id'));

  @override
  void initState() {
    super.initState();
    pageScroll.addListener(_onScroll);
    FocusManager.instance.addListener(_trackActionFocus);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_trackActionFocus);
    actionsUpProxy.dispose();
    pageScroll.dispose();
    for (final node in _nodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  bool get navbarIsTop =>
      pagePrefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;

  void _onScroll() {
    final shown = pageScroll.offset < 24;
    if (shown == _navbarShown) return;
    _navbarShown = shown;
    pageNavbarToggle?.call(shown);
  }

  void _trackActionFocus() {
    final node = FocusManager.instance.primaryFocus;
    if (node == null || node == actionsUpProxy || !_focusIsInActions()) return;
    lastActionFocus = node;
  }

  bool _focusIsInActions() {
    final context = FocusManager.instance.primaryFocus?.context;
    if (context == null) return false;
    var inside = false;
    context.visitAncestorElements((element) {
      inside = identical(element.widget.key, actionsKey);
      return !inside;
    });
    return inside;
  }

  void toNavbar() {
    if (pageScroll.hasClients) pageScroll.jumpTo(0);
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  /// The audio, subtitle and version pickers. The button row holds their
  /// state, so they show up a frame after it does.
  DetailPageSection? tracksSection(
    AppLocalizations l10n, {
    VoidCallback? onLeftEdge,
    bool shareRow = false,
  }) {
    final choices = actionsKey.currentState?.trackChoices(l10n);
    if (choices == null && !pageViewModel.isSeerrOnly) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && actionsKey.currentState != null) setState(() {});
      });
    }
    if (choices == null || choices.isEmpty) return null;
    final node = pageNode('tracks');
    return DetailPageSection(
      node: node,
      child: StageTrackChips(
        choices: choices,
        firstFocusNode: node,
        onOpen: (kind) => actionsKey.currentState?.openTrackPicker(kind),
        onNavigateUp: () => moveUp(node),
        onNavigateDown: () => moveDown(node),
        onLeftEdge: onLeftEdge,
        shareRow: shareRow,
      ),
    );
  }

  /// The people and studios behind the title.
  DetailPageSection? factsSection(
    AggregatedItem item,
    DetailSectionVisibility sections, {
    bool weighByText = false,
  }) {
    final vm = pageViewModel;
    final hasCrew =
        sections.shows(DetailSection.crew) &&
        (vm.directors.isNotEmpty || vm.writers.isNotEmpty);
    final hasStudios =
        sections.shows(DetailSection.studios) && item.studios.isNotEmpty;
    if (!hasCrew && !hasStudios) return null;
    final node = pageNode('facts');
    // Stand-ins the section hands back through onRequestFocus, since the
    // stops around it aren't settled until every section is built.
    final up = pageNode('facts-up');
    final down = pageNode('facts-down');
    return DetailPageSection(
      node: node,
      child: DetailMetadataSection(
        viewModel: vm,
        showCrew: hasCrew,
        showStudios: hasStudios,
        weighByText: weighByText,
        firstItemFocusNode: node,
        upTarget: up,
        downTarget: down,
        onRequestFocus: (target) {
          if (target == up) moveUp(node);
          if (target == down) moveDown(node);
          return KeyEventResult.handled;
        },
      ),
    );
  }

  /// Which way [target] runs out of the page: -1 above it, 1 below it, and
  /// 0 when it's wholly on screen, in which case scrolling to it would only
  /// fight whatever it scrolls itself.
  int offScreen(BuildContext target) {
    if (!pageScroll.hasClients) return 0;
    final page = pageScroll.position.context.storageContext.findRenderObject();
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
  void reveal(BuildContext section) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !section.mounted) return;
      final side = offScreen(section);
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

  KeyEventResult Function(int index, KeyEvent event) rowKeys(
    FocusNode node,
    int length,
  ) => (index, event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      moveUp(node);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      moveDown(node);
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
  double rowSpacing(double imageHeight) =>
      12 +
      MediaCard.focusHeadroom(
        imageHeight,
        expansion: pagePrefs.get(UserPreferences.cardFocusExpansion),
      );

  /// The card width the season, similar, collection and Seerr rows share.
  double get posterCardWidth => detailIsCompact(context)
      ? 120.0
      : 150.0 * detailDesktopScale(prefs: pagePrefs);

  double get posterRowSpacing => rowSpacing(posterCardWidth * 1.5);

  /// The title's own backdrop, its show's for a season or an episode, or the
  /// TMDB one for a title that's only in Seerr.
  String? ownBackdropUrl(AggregatedItem item) {
    final api = pageViewModel.imageApi;
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

  /// The overview to show, or null when there's none or the viewer hid it.
  String? overviewText(AggregatedItem item) {
    final overview = cleanOverview(item.overview?.trim());
    final hidden = hidesMediaDescription(
      itemType: item.type,
      hideMediaDescription: pagePrefs.effectiveHideDetailsMediaDescription,
    );
    return overview.isEmpty || hidden ? null : overview;
  }

  /// How far into the title the viewer is, and the line beside the bar: the
  /// time left, after the episode for a show. Null when there's nowhere to
  /// resume.
  ({double fraction, String label})? resumeLine(
    AggregatedItem item,
    AppLocalizations l10n,
  ) {
    final show = item.type == 'Series';
    final target = show ? pageViewModel.nextUp : item;
    final runtime = target?.runtime;
    final position = target?.playbackPosition;
    if (target == null ||
        target.isPlayed ||
        runtime == null ||
        position == null ||
        position <= Duration.zero ||
        position >= runtime) {
      return null;
    }
    return (
      fraction: position.inMilliseconds / runtime.inMilliseconds,
      label: [
        if (show) ?episodeNumber(target),
        l10n.timeRemaining(formatRuntimeShort(runtime - position)),
      ].join(' · '),
    );
  }

  String? episodeNumber(AggregatedItem item) {
    final season = item.parentIndexNumber;
    final episode = item.indexNumber;
    if (season == null || episode == null) return null;
    return 'S$season:E$episode';
  }

  /// The season tabs over the episode rail.
  Widget episodesRail(
    AggregatedItem item,
    FocusNode node, {
    required bool landscape,
    double? maxHeight,
    VoidCallback? onLeftEdge,
  }) => MinimalistEpisodesSection(
    key: ValueKey('detail-episodes-${item.id}'),
    viewModel: pageViewModel,
    prefs: pagePrefs,
    landscape: landscape,
    maxHeight: maxHeight,
    episodesFocusNode: node,
    onVerticalNavigation: (isUp) {
      isUp ? moveUp(node) : moveDown(node);
      return true;
    },
    onLeftEdge: onLeftEdge,
  );

  /// A show that's only in Seerr, its seasons as cards that each open the
  /// request dialog.
  Widget? seerrSeasonsRow(FocusNode node, AppLocalizations l10n) {
    final seerr = pageViewModel.seerr;
    final seasons = pageViewModel.seasons;
    if (seasons.isEmpty || seerr == null) return null;
    return HorizontalScrollSection(
      title: sectionTitle(l10n.seasons),
      titleStyle: sectionTitleStyle,
      contentSpacing: posterRowSpacing,
      builder: (context, controller) => DetailSeasonsRow(
        seasons: seasons,
        imageApi: pageViewModel.imageApi,
        prefs: pagePrefs,
        scrollController: controller,
        firstItemFocusNode: node,
        seerrSeasonStatus: seerrItemSeasonStatus(pageViewModel),
        onSeasonTap: (number) => showSeerrRequestDialog(
          context: context,
          vm: seerr,
          is4k: false,
          qualityToggle: true,
          season: number > 0 ? number : null,
        ),
        onItemKeyEvent: rowKeys(node, seasons.length),
      ),
    );
  }

  DetailPageSection? castSection(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final people = pageViewModel.actors;
    if (!sections.shows(DetailSection.cast) || people.isEmpty) return null;
    final node = pageNode('cast');
    return DetailPageSection(
      node: node,
      child: HorizontalScrollSection(
        title: sectionTitle(l10n.detailSectionCast),
        titleStyle: sectionTitleStyle,
        builder: (context, controller) => DetailCastRow(
          people: people,
          imageApi: pageViewModel.imageApi,
          serverId: item.serverId,
          scrollController: controller,
          firstItemFocusNode: node,
          onItemKeyEvent: rowKeys(node, people.length),
        ),
      ),
    );
  }

  /// Extras, the collections the title belongs to and more like it.
  List<DetailPageSection> libraryRows(
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final vm = pageViewModel;
    final out = <DetailPageSection>[];

    if (sections.shows(DetailSection.extras) && vm.features.isNotEmpty) {
      final node = pageNode('extras');
      final items = vm.features;
      out.add(
        DetailPageSection(
          node: node,
          child: HorizontalScrollSection(
            title: sectionTitle(l10n.extras),
            titleStyle: sectionTitleStyle,
            contentSpacing: rowSpacing(
              (detailIsCompact(context)
                      ? 140.0
                      : 170.0 * detailDesktopScale(prefs: pagePrefs)) /
                  MediaCard.aspectRatioForType(items.first.type),
            ),
            builder: (context, controller) => DetailFeaturesRow(
              items: items,
              imageApi: vm.imageApi,
              prefs: pagePrefs,
              scrollController: controller,
              firstItemFocusNode: node,
              onItemKeyEvent: rowKeys(node, items.length),
            ),
          ),
        ),
      );
    }

    if (sections.shows(DetailSection.collections)) {
      for (final collection in vm.parentCollections) {
        if (collection.items.isEmpty) continue;
        final node = pageNode('collection-${collection.id}');
        out.add(
          DetailPageSection(
            node: node,
            child: HorizontalScrollSection(
              title: sectionTitle(collection.name),
              titleStyle: sectionTitleStyle,
              contentSpacing: posterRowSpacing,
              builder: (context, controller) => DetailSimilarRow(
                items: collection.items,
                imageApi: vm.imageApi,
                prefs: pagePrefs,
                scrollController: controller,
                firstItemFocusNode: node,
                onItemKeyEvent: rowKeys(node, collection.items.length),
              ),
            ),
          ),
        );
      }
    }

    if (sections.shows(DetailSection.moreLikeThis) && vm.similar.isNotEmpty) {
      final node = pageNode('similar');
      final items = vm.similar;
      out.add(
        DetailPageSection(
          node: node,
          child: HorizontalScrollSection(
            title: sectionTitle(l10n.moreLikeThis),
            titleStyle: sectionTitleStyle,
            contentSpacing: posterRowSpacing,
            builder: (context, controller) => DetailSimilarRow(
              items: items,
              imageApi: vm.imageApi,
              prefs: pagePrefs,
              scrollController: controller,
              firstItemFocusNode: node,
              onItemKeyEvent: rowKeys(node, items.length),
            ),
          ),
        ),
      );
    }

    return out;
  }

  /// What Seerr knows that the library doesn't: the tags, the numbers behind
  /// the title, where it streams and what it leads to.
  List<DetailPageSection> seerrSections(
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final state = seerrItemTabState(pageViewModel);
    final pieces = SeerrDetailPieces.resolve(state, sections, l10n);
    if (state == null || !pieces.hasAny) return const [];
    final label = GetIt.instance<SeerrPreferences>().labelOrDefault(l10n.seerr);

    DetailPageSection row(
      String id,
      String title,
      List<SeerrDiscoverItem> items,
    ) {
      final node = pageNode(id);
      return DetailPageSection(
        node: node,
        child: HorizontalScrollSection(
          title: sectionTitle('$label · $title'),
          titleStyle: sectionTitleStyle,
          contentSpacing: posterRowSpacing,
          builder: (context, controller) => SeerrAppearancesRow(
            items: items,
            prefs: pagePrefs,
            scrollController: controller,
            firstFocusNode: node,
            onItemKeyEvent: rowKeys(node, items.length),
            customCardWidth: posterCardWidth,
          ),
        ),
      );
    }

    final chipsNode = pageNode('seerr-chips');
    return [
      if (pieces.chips || pieces.stats || pieces.streaming)
        DetailPageSection(
          node: pieces.chips ? chipsNode : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                sectionTitle(label),
                style:
                    sectionTitleStyle ??
                    Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
              ),
              if (pieces.chips) ...[
                const SizedBox(height: 12),
                SeerrItemChips(
                  state: state,
                  firstFocusNode: chipsNode,
                  onNavigateUp: () => moveUp(chipsNode),
                  onNavigateDown: () => moveDown(chipsNode),
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
