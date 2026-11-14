import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/util/season_queue_context.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/artwork_request_size.dart';
import '../../../../navigation/destinations.dart';
import '../../../../widgets/focus/context_menu_sheet.dart';
import '../../../../widgets/focus/hub_focus_memory.dart';
import '../../../../../util/focus/scroll_utils.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/scroll_edge_arrows.dart';
import '../../../../widgets/sliding_pill_tabs.dart';
import '../../detail_episode_images.dart';
import '../../detail_layout_metrics.dart';
import '../../play_item_on_screen.dart';
import 'minimalist_episode_card.dart';

/// The gap between the season tabs and the rail under them.
const double _kTabsToRail = 18;

/// Season tabs over a rail of episodes, and nothing else.
///
/// The flow is one way on purpose: a tab picks the season and the rail follows.
class MinimalistEpisodesSection extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;

  /// Which shape of rail to draw. The layout around it has already decided,
  /// so the section takes the answer rather than asking again.
  final bool landscape;

  /// The most the whole section may take, when whatever holds it has a fixed
  /// amount to give. The still is what shrinks, since the title and the
  /// buttons above it aren't negotiable.
  final double? maxHeight;

  /// Whatever sits at the top of this section, which is the season tabs when
  /// there are seasons to choose between and the episode rail when there are
  /// not. Coming down from the play button aims at this, so it has to belong
  /// to a widget that's actually on screen.
  final FocusNode? episodesFocusNode;

  /// Up out of the section, usually back to the play button.
  final bool Function(bool isUp)? onVerticalNavigation;

  /// Left off the first tab or the first episode, for a layout that has
  /// something to its left.
  final VoidCallback? onLeftEdge;

  const MinimalistEpisodesSection({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.landscape,
    this.maxHeight,
    this.episodesFocusNode,
    this.onVerticalNavigation,
    this.onLeftEdge,
  });

  @override
  State<MinimalistEpisodesSection> createState() =>
      _MinimalistEpisodesSectionState();
}

class _MinimalistEpisodesSectionState extends State<MinimalistEpisodesSection> {
  final _railKey = GlobalKey<LockedFocusRowState<AggregatedItem>>();
  final _railController = ScrollController();
  int? _selectedSeason;
  bool _loadStarted = false;
  bool _startedOnEpisode = false;

  /// One card and the gap after it, from the last layout.
  double _railStride = 0;

  ItemDetailViewModel get _vm => widget.viewModel;
  bool get _isSeries => _vm.item?.type == 'Series';
  bool get _isSeason => _vm.item?.type == 'Season';
  bool get _isEpisode => _vm.item?.type == 'Episode';

  @override
  void initState() {
    super.initState();
    _beginEpisodesLoad();
  }

  @override
  void dispose() {
    _railController.dispose();
    super.dispose();
  }

  /// A Season already carries its own episodes. A Series, or one episode of
  /// one, has to ask for every season's worth, once, so the tabs can filter a
  /// list that's already here.
  void _beginEpisodesLoad() {
    if (_loadStarted || !(_isSeries || _isEpisode)) return;
    _loadStarted = true;
    final viewModel = _vm;
    if (viewModel.seriesEpisodes.isNotEmpty) return;
    unawaited(
      viewModel.loadAllSeriesEpisodes().whenComplete(() {
        if (!mounted || !identical(_vm, viewModel)) return;
        setState(() {});
      }),
    );
  }

  List<AggregatedItem> get _allEpisodes =>
      _isSeason ? _vm.episodes : _vm.seriesEpisodes;

  List<int> _seasonNumbers(List<AggregatedItem> episodes) => episodes
      .map((episode) => episode.parentIndexNumber)
      .whereType<int>()
      .toSet()
      .toList()
    ..sort();

  String _seasonLabel(AppLocalizations l10n, int number) =>
      number == 0 ? l10n.specials : l10n.seasonNumber(number);

  /// Each season's rail remembers its own place.
  String _hubKey(int? season) =>
      'minimalist-episodes-${_vm.item?.id ?? ''}-$season';

  void _selectSeason(int number) {
    if (_selectedSeason == number) return;
    setState(() => _selectedSeason = number);
    // The rail shows where Down from the tabs will land, its start unless the
    // viewer left that season's rail somewhere else, but the tabs keep focus.
    // Left and right change the season as you pass over it, so pulling focus
    // down here would strand you on the first season you touched.
    _showRememberedEpisode(number);
  }

  /// Scrolls the rail, once it's laid out, to the episode [season]'s rail
  /// will focus.
  void _showRememberedEpisode(int? season) {
    final index = HubFocusMemory.peek(_hubKey(season)) ?? 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      scrollListToIndex(
        _railController,
        index,
        itemExtent: _railStride,
        animate: false,
      );
    });
  }

  /// On an episode, the rail opens on it rather than on the season's first,
  /// both where it's scrolled to and where focus lands coming down into it.
  /// Once only, and not over a place the viewer already left the rail at.
  void _startOnEpisode(List<AggregatedItem> episodes, int? season) {
    if (_startedOnEpisode || !_isEpisode) return;
    final current = episodes.indexWhere((e) => e.id == _vm.item?.id);
    // Not in this list yet, while the series' episodes are still arriving.
    if (current < 0) return;
    _startedOnEpisode = true;
    final hubKey = _hubKey(season);
    if (current > 0 && HubFocusMemory.peek(hubKey) == null) {
      HubFocusMemory.set(hubKey, current);
    }
    _showRememberedEpisode(season);
  }

  void _showEpisodeMenu(BuildContext context, AggregatedItem episode) {
    showContextMenu(context, episode, onChanged: () => setState(() {}));
  }

  // From an episode the one picked takes its page, so Back leaves the run of
  // episodes in one press.
  void _openEpisode(BuildContext context, AggregatedItem episode) {
    if (episode.id == _vm.item?.id) {
      playItemOnScreen(context);
      return;
    }
    final location = Destinations.item(
      episode.id,
      serverId: episode.serverId,
      seasonContext: seasonContextParam(
        contextSeasonId: _isSeason ? _vm.item?.id : null,
        episodeSeasonId: episode.seasonId,
      ),
    );
    _isEpisode ? context.pushReplacement(location) : context.push(location);
  }

  /// The room under the still. Measured rather than guessed, or a larger user
  /// scale clips the second line of the title.
  double _titleBlockHeight(BuildContext context, double cardWidth) {
    final line =
        MediaQuery.textScalerOf(context)
            .scale(MinimalistEpisodeCard.titleFontSize(cardWidth)) *
        MinimalistEpisodeCard.titleLineHeight;
    return MinimalistEpisodeCard.titleGap +
        line * MinimalistEpisodeCard.titleMaxLines;
  }

  double _railHeight(BuildContext context, double cardWidth) =>
      cardWidth * 9 / 16 + _titleBlockHeight(context, cardWidth);

  /// How tall the still may be, once the tabs and the title have taken their
  /// share of whatever the layout allowed.
  ///
  /// The title is reserved at the larger of the two faces, since the width it
  /// will be drawn at is the thing this is working out. Reserving the smaller
  /// one would leave the second line nowhere to go on any card wide enough to
  /// step up.
  double? _stillBudget(BuildContext context, bool showTabs) {
    final budget = widget.maxHeight;
    if (budget == null || !budget.isFinite) return null;
    final chrome = showTabs ? SlidingPillTabs.height + _kTabsToRail : 0.0;
    return budget - chrome - _titleBlockHeight(context, double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final all = _allEpisodes;
    if (all.isEmpty) return const SizedBox.shrink();

    final seasons = _seasonNumbers(all);
    // Landing on an episode opens its own season rather than the first one.
    final arrivedIn = _isEpisode ? _vm.item?.parentIndexNumber : null;
    final fallback = arrivedIn != null && seasons.contains(arrivedIn)
        ? arrivedIn
        : (seasons.isEmpty ? null : seasons.first);
    final selected = _selectedSeason != null && seasons.contains(_selectedSeason)
        ? _selectedSeason!
        : fallback;

    // The server lists specials where they aired among the seasons, so the
    // Specials tab would come out of number order without this.
    final episodes = selected == null
        ? all
        : (all.where((e) => e.parentIndexNumber == selected).toList()
            ..sort(ItemDetailViewModel.compareEpisodes));
    final hubKey = _hubKey(selected);

    // One season is no choice at all, so the strip only earns its space when
    // there's somewhere else to go, and the rail takes over as the way in.
    final showTabs = seasons.length > 1;

    // Sized from the width the rail actually has, after whatever insets the
    // layout put either side of it, rather than the width of the screen.
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = minimalistEpisodeCardWidth(
          constraints.maxWidth,
          landscape: widget.landscape,
          maxStillHeight: _stillBudget(context, showTabs),
          prefs: widget.prefs,
        );
        final railHeight = _railHeight(context, cardWidth);
        _railStride =
            cardWidth + minimalistEpisodeRailGap(landscape: widget.landscape);
        _startOnEpisode(episodes, selected);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTabs) ...[
              SlidingPillTabs(
                key: const ValueKey('minimalist-season-tabs'),
                labels: [for (final n in seasons) _seasonLabel(l10n, n)],
                selectedIndex: selected == null ? 0 : seasons.indexOf(selected),
                onChanged: (index) => _selectSeason(seasons[index]),
                focusNode: widget.episodesFocusNode,
                onExitLeft: widget.onLeftEdge,
                onVerticalNavigation: (isUp) {
                  if (!isUp) {
                    _railKey.currentState?.requestFocusFromMemory();
                    return true;
                  }
                  return widget.onVerticalNavigation?.call(true) ?? false;
                },
              ),
              const SizedBox(height: _kTabsToRail),
            ],
            SizedBox(
              key: const ValueKey('minimalist-episode-rail'),
              height: railHeight,
              child: ScrollEdgeArrows(
                controller: _railController,
                child: LockedFocusRow<AggregatedItem>(
                  key: _railKey,
                  items: episodes,
                  itemKey: (item, _) => '${item.serverId}|${item.id}',
                  hubKey: hubKey,
                  itemExtent: cardWidth,
                  itemSpacing: minimalistEpisodeRailGap(
                    landscape: widget.landscape,
                  ),
                  height: railHeight,
                  controller: _railController,
                  focusNode: showTabs ? null : widget.episodesFocusNode,
                  onLeftEdge: widget.onLeftEdge,
                  clipBehavior: Clip.none,
                  // The row handles the remote's select and hold. The card
                  // below handles the pointer, so both have to agree.
                  onTap: (_, episode) => _openEpisode(context, episode),
                  onLongPress: (_, episode) =>
                      _showEpisodeMenu(context, episode),
                  onVerticalNavigation: (isUp) {
                    if (isUp && showTabs) {
                      widget.episodesFocusNode?.requestFocus();
                      return true;
                    }
                    return widget.onVerticalNavigation?.call(isUp) ?? false;
                  },
                  itemBuilder: (context, episode, index, isFocused) {
                    return MinimalistEpisodeCard(
                      episode: episode,
                      width: cardWidth,
                      isFocused: isFocused,
                      isCurrent: _isEpisode && episode.id == _vm.item?.id,
                      imageUrl: minimalistEpisodeImageUrl(
                        episode,
                        _vm,
                        prefs: widget.prefs,
                        cardWidth: cardWidth,
                        devicePixelRatio: MediaQuery.devicePixelRatioOf(
                          context,
                        ),
                      ),
                      onTap: () => _openEpisode(context, episode),
                      onLongPress: () => _showEpisodeMenu(context, episode),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// The picture for one episode card.
///
/// Specials are the case worth knowing about: an episode outside a numbered
/// season often has no still of its own, so the series thumb is all there is.
String? minimalistEpisodeImageUrl(
  AggregatedItem episode,
  ItemDetailViewModel viewModel, {
  required UserPreferences prefs,
  required double cardWidth,
  required double devicePixelRatio,
}) {
  final imageApi = viewModel.imageApi;
  // Stepped rather than doubled. The card width is a share of the screen, so
  // a bare multiple would mint a fresh server encode and cache file for every
  // window size the rail is ever drawn at.
  final maxWidth = artworkRequestWidth(
    cardWidth,
    devicePixelRatio,
    ArtworkShape.landscape,
  );

  if (prefs.effectiveDetailUseSeriesThumbnails) {
    final series = resolveSeriesLandscapeThumbnailUrl(
      episode,
      imageApi,
      maxWidth: maxWidth,
    );
    if (series != null) return series;
  }

  final ownTag = episode.primaryImageTag;
  if (ownTag != null && ownTag.isNotEmpty) {
    return imageApi.getPrimaryImageUrl(
      episode.id,
      maxWidth: maxWidth,
      tag: ownTag,
    );
  }

  return resolveSeriesLandscapeThumbnailUrl(
    episode,
    imageApi,
    maxWidth: maxWidth,
  );
}
