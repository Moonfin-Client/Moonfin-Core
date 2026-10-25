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
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/sliding_pill_tabs.dart';
import '../../detail_episode_images.dart';
import '../../detail_layout_metrics.dart';
import '../../modern/modern_detail_content.dart'
    show extraCategoriesOrder, getExtraCategory, getExtraCategoryLabel;
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

  const MinimalistEpisodesSection({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.landscape,
    this.maxHeight,
    this.episodesFocusNode,
    this.onVerticalNavigation,
  });

  @override
  State<MinimalistEpisodesSection> createState() =>
      _MinimalistEpisodesSectionState();
}

class _MinimalistEpisodesSectionState extends State<MinimalistEpisodesSection> {
  final _railKey = GlobalKey<LockedFocusRowState<AggregatedItem>>();
  final _railController = ScrollController();
  int? _selectedSeason;
  String? _selectedCategory;
  bool _loadStarted = false;

  ItemDetailViewModel get _vm => widget.viewModel;
  bool get _isSeries => _vm.item?.type == 'Series';
  bool get _isSeason => _vm.item?.type == 'Season';
  bool get _isEpisode => _vm.item?.type == 'Episode';
  bool get _isMovieLike => !_isSeries && !_isSeason && !_isEpisode;

  @override
  void initState() {
    super.initState();
    _beginEpisodesLoad();
    widget.viewModel.addListener(_onVmChanged);
  }

  @override
  void didUpdateWidget(MinimalistEpisodesSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.removeListener(_onVmChanged);
      widget.viewModel.addListener(_onVmChanged);
      _beginEpisodesLoad();
    }
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onVmChanged);
    _railController.dispose();
    super.dispose();
  }

  void _onVmChanged() {
    if (mounted) setState(() {});
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

  List<AggregatedItem> get _allEpisodes {
    if (_isSeason) return _vm.episodes;
    if (_isSeries || _isEpisode) return _vm.seriesEpisodes;
    return _vm.features;
  }

  List<int> _seasonNumbers(List<AggregatedItem> episodes) => episodes
      .map((episode) => episode.parentIndexNumber)
      .whereType<int>()
      .toSet()
      .toList()
    ..sort();

  List<String> _featureCategories(List<AggregatedItem> features) {
    final present = features.map(getExtraCategory).toSet();
    final ordered = extraCategoriesOrder.where(present.contains).toList();
    for (final cat in present) {
      if (!ordered.contains(cat)) ordered.add(cat);
    }
    return ordered;
  }

  String _seasonLabel(AppLocalizations l10n, int number) =>
      number == 0 ? l10n.specials : l10n.seasonNumber(number);

  void _selectSeason(int number) {
    if (_selectedSeason == number) return;
    setState(() => _selectedSeason = number);
    // Back to the start of the rail, but the tabs keep focus. Left and right
    // change the season as you pass over it, so pulling focus down here would
    // strand you on the first season you touched.
    if (_railController.hasClients) _railController.jumpTo(0);
  }

  void _selectCategory(String category) {
    if (_selectedCategory == category) return;
    setState(() => _selectedCategory = category);
    if (_railController.hasClients) _railController.jumpTo(0);
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

    final isMovie = _isMovieLike;
    final List<String> categories = isMovie ? _featureCategories(all) : const [];
    final selectedCategory = isMovie
        ? (_selectedCategory != null && categories.contains(_selectedCategory)
            ? _selectedCategory!
            : (categories.isEmpty ? null : categories.first))
        : null;

    final seasons = isMovie ? const <int>[] : _seasonNumbers(all);
    final arrivedIn = _isEpisode ? _vm.item?.parentIndexNumber : null;
    final fallbackSeason = arrivedIn != null && seasons.contains(arrivedIn)
        ? arrivedIn
        : (seasons.isEmpty ? null : seasons.first);
    final selectedSeason = !isMovie && _selectedSeason != null && seasons.contains(_selectedSeason)
        ? _selectedSeason!
        : fallbackSeason;

    final episodes = isMovie
        ? (selectedCategory == null
            ? (List<AggregatedItem>.from(all)
              ..sort(ItemDetailViewModel.compareEpisodes))
            : (all.where((e) => getExtraCategory(e) == selectedCategory).toList()
              ..sort(ItemDetailViewModel.compareEpisodes)))
        : (selectedSeason == null
            ? (List<AggregatedItem>.from(all)
              ..sort(ItemDetailViewModel.compareEpisodes))
            : (all.where((e) => e.parentIndexNumber == selectedSeason).toList()
              ..sort(ItemDetailViewModel.compareEpisodes)));

    final showTabs = isMovie ? categories.isNotEmpty : seasons.length > 1;

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTabs) ...[
              SlidingPillTabs(
                key: const ValueKey('minimalist-season-tabs'),
                labels: isMovie
                    ? [for (final c in categories) getExtraCategoryLabel(c, l10n)]
                    : [for (final n in seasons) _seasonLabel(l10n, n)],
                selectedIndex: isMovie
                    ? (selectedCategory == null ? 0 : categories.indexOf(selectedCategory))
                    : (selectedSeason == null ? 0 : seasons.indexOf(selectedSeason)),
                onChanged: (index) => isMovie
                    ? _selectCategory(categories[index])
                    : _selectSeason(seasons[index]),
                focusNode: widget.episodesFocusNode,
                onVerticalNavigation: (isUp) {
                  if (!isUp) {
                    _railKey.currentState?.requestFocusAt(0);
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
              child: LockedFocusRow<AggregatedItem>(
                key: _railKey,
                items: episodes,
                itemKey: (item, _) => '${item.serverId}|${item.id}',
                hubKey:
                    'minimalist-episodes-${_vm.item?.id ?? ''}-${isMovie ? selectedCategory : selectedSeason}',
                itemExtent: cardWidth,
                itemSpacing: minimalistEpisodeRailGap(
                  landscape: widget.landscape,
                ),
                height: railHeight,
                controller: _railController,
                focusNode: showTabs ? null : widget.episodesFocusNode,
                clipBehavior: Clip.none,
                // The row handles the remote's select and hold. The card below
                // handles the pointer, so both have to agree.
                onTap: (_, episode) => _openEpisode(context, episode),
                onLongPress: (_, episode) => _showEpisodeMenu(context, episode),
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
                      devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
                    ),
                    onTap: () => _openEpisode(context, episode),
                    onLongPress: () => _showEpisodeMenu(context, episode),
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

  final parentBackdrop = viewModel.item?.backdropImageTags.firstOrNull;
  if (parentBackdrop != null && parentBackdrop.isNotEmpty) {
    return imageApi.getBackdropImageUrl(
      viewModel.item!.id,
      maxWidth: maxWidth,
      tag: parentBackdrop,
    );
  }

  return resolveSeriesLandscapeThumbnailUrl(
    episode,
    imageApi,
    maxWidth: maxWidth,
  );
}
