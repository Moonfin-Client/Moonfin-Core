import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/util/season_queue_context.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/focus/scroll_utils.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../navigation/destinations.dart';
import '../../../../widgets/focus/context_menu_sheet.dart';
import '../../../../widgets/focus/hub_focus_memory.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/seerr/seerr_item_status.dart';
import '../../item_detail_screen.dart';
import '../shared/immersive_landscape_media_card.dart';
import '../shared/immersive_spacing.dart';
import 'immersive_season_selector.dart';

class ImmersiveEpisodesSection extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final GlobalKey<DetailActionButtonsState> actionButtonsKey;
  final UserPreferences prefs;
  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  const ImmersiveEpisodesSection({
    super.key,
    required this.viewModel,
    required this.actionButtonsKey,
    required this.prefs,
    this.onBackdropItemFocused,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveEpisodesSection> createState() =>
      ImmersiveEpisodesSectionState();
}

class ImmersiveEpisodesSectionState extends State<ImmersiveEpisodesSection> {
  static int _episodeHubSession = 0;

  ScrollController? _episodesScrollController;

  GlobalKey<LockedFocusRowState<AggregatedItem>> _episodeRowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  final GlobalKey<ImmersiveSeasonSelectorState> _seasonSelectorKey =
      GlobalKey<ImmersiveSeasonSelectorState>();

  final GlobalKey _artworkRailAnchorKey = GlobalKey();

  final Map<String, GlobalKey<ImmersiveLandscapeMediaCardState>>
  _episodeCardKeys = {};

  String? _focusedEpisodeDetailsId;

  int? _selectedSeasonNumber;
  int? _pendingSeasonEpisodeIndex;
  int? _lastScrollSyncedEpisodeIndex;

  bool _programmaticSeasonScroll = false;
  int? _programmaticSeasonTargetIndex;

  List<AggregatedItem> _scrollSyncEpisodes = const [];
  _EpisodeLayout? _scrollSyncLayout;
  bool _mobileScrollSyncEnabled = false;

  String? _lastPublishedBackdropKey;

  bool _initialBackdropSyncScheduled = false;
  bool _initialBackdropSyncComplete = false;
  bool _episodesInitialLoadComplete = false;

  late String _episodeHubKey;

  ItemDetailViewModel get _vm => widget.viewModel;

  GlobalKey get artworkRailAnchorKey => _artworkRailAnchorKey;

  bool get _isSeries => _vm.item?.type == 'Series';

  bool get _isSeason => _vm.item?.type == 'Season';

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  List<AggregatedItem> get _sourceEpisodes {
    if (_isSeason) {
      return _vm.episodes;
    }

    return _vm.seriesEpisodes;
  }

  List<AggregatedItem> get _sortedEpisodes {
    return [..._sourceEpisodes]..sort((a, b) {
      final seasonCompare = (a.parentIndexNumber ?? 0).compareTo(
        b.parentIndexNumber ?? 0,
      );

      if (seasonCompare != 0) {
        return seasonCompare;
      }

      return (a.indexNumber ?? 0).compareTo(b.indexNumber ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();

    _episodeHubKey = _createEpisodeHubKey();

    _beginEpisodesLoad();
  }

  @override
  void didUpdateWidget(covariant ImmersiveEpisodesSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (identical(oldWidget.viewModel, widget.viewModel)) {
      return;
    }

    _selectedSeasonNumber = null;
    _pendingSeasonEpisodeIndex = null;
    _lastScrollSyncedEpisodeIndex = null;

    _programmaticSeasonScroll = false;
    _programmaticSeasonTargetIndex = null;

    _scrollSyncEpisodes = const [];
    _scrollSyncLayout = null;
    _mobileScrollSyncEnabled = false;

    _lastPublishedBackdropKey = null;
    _initialBackdropSyncScheduled = false;
    _initialBackdropSyncComplete = false;

    _focusedEpisodeDetailsId = null;

    _episodeHubKey = _createEpisodeHubKey();

    _episodeRowKey = GlobalKey<LockedFocusRowState<AggregatedItem>>();

    _episodeCardKeys.clear();

    _episodesInitialLoadComplete = false;

    _resetEpisodesScrollController();

    _beginEpisodesLoad();
  }

  @override
  void dispose() {
    _episodesScrollController?.removeListener(_handleEpisodesScroll);
    _episodesScrollController?.dispose();

    super.dispose();
  }

  void _resetEpisodesScrollController() {
    final oldController = _episodesScrollController;

    _episodesScrollController = null;

    _lastScrollSyncedEpisodeIndex = null;

    _programmaticSeasonScroll = false;
    _programmaticSeasonTargetIndex = null;

    if (oldController == null) {
      return;
    }

    oldController.removeListener(_handleEpisodesScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      oldController.dispose();
    });
  }

  ScrollController _ensureEpisodesScrollController({
    required List<AggregatedItem> episodes,
    required AggregatedItem? nextUpEpisode,
    required _EpisodeLayout layout,
  }) {
    final existingController = _episodesScrollController;

    if (existingController != null) {
      return existingController;
    }

    var initialIndex = HubFocusMemory.peek(_episodeHubKey);

    if (initialIndex == null) {
      final nextUpIndex = nextUpEpisode == null
          ? 0
          : episodes.indexWhere((episode) => episode.id == nextUpEpisode.id);

      initialIndex = nextUpIndex < 0 ? 0 : nextUpIndex;

      HubFocusMemory.set(_episodeHubKey, initialIndex);
    }

    final clampedIndex = initialIndex.clamp(0, episodes.length - 1);

    final contentWidth =
        episodes.length * layout.cardWidth +
        (episodes.length - 1) * layout.cardSpacing;

    final maxScrollOffset = (contentWidth - layout.viewportWidth).clamp(
      0.0,
      double.infinity,
    );

    final initialOffset = (clampedIndex * layout.itemExtent).clamp(
      0.0,
      maxScrollOffset,
    );

    final controller = ScrollController(initialScrollOffset: initialOffset);

    controller.addListener(_handleEpisodesScroll);

    _episodesScrollController = controller;

    return controller;
  }

  void _handleEpisodesScroll() {
    if (!_mobileScrollSyncEnabled ||
        !_isSeries ||
        !mounted ||
        _scrollSyncEpisodes.isEmpty) {
      return;
    }

    final controller = _episodesScrollController;
    final layout = _scrollSyncLayout;

    if (controller == null || !controller.hasClients || layout == null) {
      return;
    }

    if (_programmaticSeasonScroll) {
      final targetIndex = _programmaticSeasonTargetIndex;

      if (targetIndex == null) {
        _programmaticSeasonScroll = false;
        return;
      }

      final targetOffset = (targetIndex * layout.itemExtent).clamp(
        0.0,
        controller.position.maxScrollExtent,
      );

      final reachedTarget = (controller.offset - targetOffset).abs() <= 2.0;

      if (!reachedTarget) {
        return;
      }

      _programmaticSeasonScroll = false;
      _programmaticSeasonTargetIndex = null;
      _lastScrollSyncedEpisodeIndex = targetIndex;

      return;
    }

    final index = (controller.offset / layout.itemExtent).round().clamp(
      0,
      _scrollSyncEpisodes.length - 1,
    );

    if (_lastScrollSyncedEpisodeIndex == index) {
      return;
    }

    _lastScrollSyncedEpisodeIndex = index;

    final episode = _scrollSyncEpisodes[index];

    final seasonNumber = episode.parentIndexNumber;

    if (seasonNumber == null) {
      return;
    }

    _setSelectedSeason(seasonNumber);
  }

  void _beginEpisodesLoad() {
    final viewModel = _vm;

    if (_isSeason) {
      _episodesInitialLoadComplete = true;
      return;
    }

    if (!_isSeries) {
      _episodesInitialLoadComplete = true;
      return;
    }

    if (viewModel.seriesEpisodes.isNotEmpty) {
      _episodesInitialLoadComplete = true;
      return;
    }

    unawaited(
      viewModel.loadAllSeriesEpisodes().whenComplete(() {
        if (!mounted || !identical(_vm, viewModel)) {
          return;
        }

        setState(() {
          _episodesInitialLoadComplete = true;
        });
      }),
    );
  }

  String _createEpisodeHubKey() {
    final session = _episodeHubSession++;

    return 'immersive-episodes-${_vm.item?.id}-$session';
  }

  GlobalKey<ImmersiveLandscapeMediaCardState> _episodeCardKey(
    AggregatedItem episode,
  ) {
    return _episodeCardKeys.putIfAbsent(
      episode.id,
      () => GlobalKey<ImmersiveLandscapeMediaCardState>(),
    );
  }

  void _pruneEpisodeCardKeys() {
    final episodeIds = _sourceEpisodes.map((episode) => episode.id).toSet();

    _episodeCardKeys.removeWhere((id, _) => !episodeIds.contains(id));
  }

  bool get canFocusTop {
    if (!mounted || _episodeRowKey.currentState == null) {
      return false;
    }

    return _sortedEpisodes.isNotEmpty;
  }

  bool focusTop() {
    if (!mounted) {
      return false;
    }

    final episodes = _sortedEpisodes;
    final row = _episodeRowKey.currentState;

    if (episodes.isEmpty || row == null) {
      return false;
    }

    if (!_isSeries) {
      final rememberedIndex = HubFocusMemory.peek(_episodeHubKey);

      final index = (rememberedIndex ?? row.focusedIndex).clamp(
        0,
        episodes.length - 1,
      );

      row.requestFocusAt(index);

      return true;
    }

    final seasonNumbers = _seasonNumbersFor(episodes);

    if (seasonNumbers.isEmpty) {
      final rememberedIndex = HubFocusMemory.peek(_episodeHubKey);

      final index = (rememberedIndex ?? row.focusedIndex).clamp(
        0,
        episodes.length - 1,
      );

      row.requestFocusAt(index);

      return true;
    }

    final selector = _seasonSelectorKey.currentState;

    if (selector != null &&
        selector.mounted &&
        selector.canFocusSelectedSeason) {
      selector.requestFocusAtSeason(_effectiveSelectedSeason(seasonNumbers));

      return true;
    }

    row.requestFocusAt(row.focusedIndex.clamp(0, episodes.length - 1));

    return true;
  }

  bool focusBottom() {
    final episodes = _sortedEpisodes;
    final row = _episodeRowKey.currentState;

    if (row == null || episodes.isEmpty) {
      return false;
    }

    final rememberedIndex = HubFocusMemory.peek(_episodeHubKey);

    final index = (rememberedIndex ?? row.focusedIndex).clamp(
      0,
      episodes.length - 1,
    );

    final episode = episodes[index];
    final card = _episodeCardKey(episode).currentState;

    if (card?.requestDetailsFocus() ?? false) {
      return true;
    }

    row.requestFocusAt(index);

    return true;
  }

  bool _handleSeasonNavigateUp() {
    return widget.onNavigateUp?.call() ?? false;
  }

  bool _handleSeasonNavigateDown(
    List<AggregatedItem> episodes,
    _EpisodeLayout layout,
  ) {
    if (episodes.isEmpty) {
      return true;
    }

    final pendingIndex = _pendingSeasonEpisodeIndex;

    if (pendingIndex != null) {
      _pendingSeasonEpisodeIndex = null;

      _episodeRowKey.currentState?.requestFocusAt(pendingIndex);

      return true;
    }

    var firstVisibleIndex = 0;

    final controller = _episodesScrollController;

    if (controller != null && controller.hasClients) {
      firstVisibleIndex = (controller.offset / layout.itemExtent).floor().clamp(
        0,
        episodes.length - 1,
      );
    }

    _episodeRowKey.currentState?.requestFocusAt(firstVisibleIndex);

    return true;
  }

  bool _handleEpisodeVerticalNavigation(
    bool isUp,
    List<AggregatedItem> episodes,
  ) {
    if (episodes.isEmpty) {
      return false;
    }

    final rowState = _episodeRowKey.currentState;

    if (rowState == null) {
      return false;
    }

    final index = rowState.focusedIndex.clamp(0, episodes.length - 1);

    final episode = episodes[index];

    if (isUp) {
      if (!_isSeries) {
        return widget.onNavigateUp?.call() ?? false;
      }

      final seasonNumbers = _seasonNumbersFor(episodes);

      if (seasonNumbers.isEmpty) {
        return widget.onNavigateUp?.call() ?? false;
      }

      final seasonNumber = episode.parentIndexNumber;

      if (seasonNumber == null) {
        return widget.onNavigateUp?.call() ?? false;
      }

      final selector = _seasonSelectorKey.currentState;

      if (selector == null || !selector.canFocusSelectedSeason) {
        return widget.onNavigateUp?.call() ?? false;
      }

      selector.requestFocusAtSeason(seasonNumber);

      return true;
    }

    final card = _episodeCardKey(episode).currentState;

    if (card == null) {
      return false;
    }

    return card.requestDetailsFocus();
  }

  void _focusEpisodeArtwork(int index) {
    _pendingSeasonEpisodeIndex = null;

    _episodeRowKey.currentState?.requestFocusAt(index);
  }

  void _openEpisodeDetails(BuildContext context, AggregatedItem episode) {
    context.push(
      Destinations.item(
        episode.id,
        serverId: episode.serverId,
        seasonContext: seasonContextParam(
          contextSeasonId: _isSeason ? _vm.item?.id : null,
          episodeSeasonId: episode.seasonId,
        ),
      ),
    );
  }

  void _handleEpisodeLeftEdge() {
    if (!_navbarIsLeft) {
      return;
    }

    FocusManager.instance.primaryFocus?.focusInDirection(
      TraversalDirection.left,
    );
  }

  void _handleEpisodeIndexChanged(int index, AggregatedItem episode) {
    _pendingSeasonEpisodeIndex = null;

    if (!_isSeries) {
      return;
    }

    final seasonNumber = episode.parentIndexNumber;

    if (seasonNumber != null) {
      _setSelectedSeason(seasonNumber);
    }
  }

  void _handleEpisodeDetailsFocusChange(AggregatedItem episode, bool hasFocus) {
    if (!mounted) {
      return;
    }

    if (hasFocus) {
      if (_focusedEpisodeDetailsId == episode.id) {
        return;
      }

      setState(() {
        _focusedEpisodeDetailsId = episode.id;
      });

      return;
    }

    if (_focusedEpisodeDetailsId != episode.id) {
      return;
    }

    setState(() {
      _focusedEpisodeDetailsId = null;
    });
  }

  List<int> _seasonNumbersFor(List<AggregatedItem> episodes) {
    return episodes
        .map((episode) => episode.parentIndexNumber)
        .whereType<int>()
        .toSet()
        .toList()
      ..sort();
  }

  int _effectiveSelectedSeason(List<int> seasonNumbers) {
    final selected = _selectedSeasonNumber;

    if (selected != null && seasonNumbers.contains(selected)) {
      return selected;
    }

    return seasonNumbers.first;
  }

  _EpisodeLayout _episodeLayoutFor(
    BuildContext context,
    double availableWidth,
    TextScaler textScaler,
  ) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactEpisodes;

      final cardWidth = metrics.itemWidth(availableWidth);

      final imageHeight = cardWidth * 9 / 16;

      final contentHeight = textScaler.scale(92).clamp(92.0, 124.0);

      final railHeight = imageHeight + 10 + contentHeight + 6;

      return _EpisodeLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        cardSpacing: metrics.gap,
        imageHeight: imageHeight,
        railHeight: railHeight,
        compact: true,
      );
    }

    final itemGap = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final visibleItemCount = PlatformDetection.isTV
        ? ImmersiveSpacing.tvEpisodeVisibleItemCount
        : ImmersiveSpacing.episodeVisibleItemCount;

    final cardWidth =
        (availableWidth - visibleItemCount.floor() * itemGap) /
        visibleItemCount;

    final imageHeight = cardWidth * 9 / 16;

    final contentHeight = textScaler.scale(82).clamp(82.0, 118.0);

    final railHeight = imageHeight + contentHeight + 16;

    return _EpisodeLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      cardSpacing: itemGap,
      imageHeight: imageHeight,
      railHeight: railHeight,
      compact: false,
    );
  }

  void _setSelectedSeason(int seasonNumber) {
    if (!_isSeries || !mounted || seasonNumber == _selectedSeasonNumber) {
      return;
    }

    setState(() {
      _selectedSeasonNumber = seasonNumber;
    });

    _publishSelectedSeasonBackdrop(seasonNumber);
  }

  bool _publishSelectedSeasonBackdrop(int seasonNumber) {
    if (!_isSeries) {
      return false;
    }

    AggregatedItem? season;

    for (final candidate in _vm.seasons) {
      if (candidate.indexNumber == seasonNumber) {
        season = candidate;
        break;
      }
    }

    final series = _vm.item;

    if (season == null || series == null) {
      return false;
    }

    final backdropItem = season.backdropImageTags.isNotEmpty ? season : series;

    final publishKey = '${season.id}:${backdropItem.id}';

    if (_lastPublishedBackdropKey == publishKey) {
      return true;
    }

    _lastPublishedBackdropKey = publishKey;

    widget.onBackdropItemFocused?.call(backdropItem);

    return true;
  }

  void _scheduleInitialBackdropSync(int seasonNumber) {
    if (!_isSeries ||
        _initialBackdropSyncComplete ||
        _initialBackdropSyncScheduled) {
      return;
    }

    _initialBackdropSyncScheduled = true;

    final scheduledHubKey = _episodeHubKey;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _episodeHubKey != scheduledHubKey) {
        return;
      }

      _initialBackdropSyncScheduled = false;

      if (_initialBackdropSyncComplete) {
        return;
      }

      final currentSeasonNumber = _selectedSeasonNumber ?? seasonNumber;

      if (_publishSelectedSeasonBackdrop(currentSeasonNumber)) {
        _initialBackdropSyncComplete = true;
      }
    });
  }

  bool restoreSelectedSeasonBackdrop() {
    if (!_isSeries) {
      return false;
    }

    final selectedSeasonNumber = _selectedSeasonNumber;

    if (selectedSeasonNumber == null) {
      return false;
    }

    _lastPublishedBackdropKey = null;

    return _publishSelectedSeasonBackdrop(selectedSeasonNumber);
  }

  void _selectSeason(
    int seasonNumber,
    List<AggregatedItem> episodes,
    _EpisodeLayout layout,
  ) {
    if (!_isSeries) {
      return;
    }

    final firstEpisodeIndex = episodes.indexWhere(
      (episode) => episode.parentIndexNumber == seasonNumber,
    );

    if (firstEpisodeIndex < 0 || !mounted) {
      return;
    }

    _setSelectedSeason(seasonNumber);

    _pendingSeasonEpisodeIndex = firstEpisodeIndex;

    _lastScrollSyncedEpisodeIndex = firstEpisodeIndex;

    HubFocusMemory.set(_episodeHubKey, firstEpisodeIndex);

    final controller = _episodesScrollController;

    if (controller == null) {
      return;
    }

    if (_mobileScrollSyncEnabled) {
      _programmaticSeasonScroll = true;
      _programmaticSeasonTargetIndex = firstEpisodeIndex;
    }

    scrollListToIndex(
      controller,
      firstEpisodeIndex,
      itemExtent: layout.itemExtent,
    );
  }

  void _playEpisode(BuildContext context, AggregatedItem episode) {
    final actionButtons = widget.actionButtonsKey.currentState;

    if (actionButtons == null) {
      return;
    }

    final playbackPosition = episode.playbackPosition?.inMilliseconds ?? 0;

    final percentage = episode.playedPercentage ?? 0;

    final hasProgress =
        playbackPosition > 0 || (percentage.isFinite && percentage > 0);

    unawaited(actionButtons.playItem(context, episode, resume: hasProgress));
  }

  void _showEpisodeContextMenu(BuildContext context, AggregatedItem episode) {
    showContextMenu(
      context,
      episode,
      onChanged: () {
        if (_isSeries) {
          unawaited(_vm.refreshSeriesEpisodes());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _pruneEpisodeCardKeys();

    final episodes = _sortedEpisodes;

    final reservingInitialLoad =
        _isSeries && episodes.isEmpty && !_episodesInitialLoadComplete;

    if (episodes.isEmpty && !reservingInitialLoad) {
      return const SizedBox.shrink();
    }

    final seasonNumbers = _seasonNumbersFor(episodes);

    if (_isSeries && seasonNumbers.isEmpty && !reservingInitialLoad) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final layout = _episodeLayoutFor(
          context,
          availableWidth,
          MediaQuery.textScalerOf(context),
        );

        final compact = _isCompactMobile(context);

        final selectorHeight = compact ? 44.0 : 40.0;

        final selectorToEpisodes = compact
            ? 18.0
            : ImmersiveSpacing.seasonSelectorToEpisodes;

        if (reservingInitialLoad) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            switchInCurve: Curves.linear,
            switchOutCurve: Curves.linear,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: ExcludeFocus(
              key: const ValueKey('immersive-episodes-reservation'),
              child: SizedBox(
                height: selectorHeight + selectorToEpisodes + layout.railHeight,
              ),
            ),
          );
        }

        final nextUpEpisode = _resolveNextUpEpisode(episodes);

        final showSeasonSelector = _isSeries && seasonNumbers.isNotEmpty;

        int? selectedSeasonNumber;

        if (showSeasonSelector) {
          selectedSeasonNumber = _effectiveSelectedSeason(seasonNumbers);

          _scheduleInitialBackdropSync(selectedSeasonNumber);
        }

        final seerrSeasonStatus = _isSeries
            ? seerrItemSeasonStatus(_vm)
            : const <int, int>{};

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          switchInCurve: Curves.linear,
          switchOutCurve: Curves.linear,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Column(
            key: ValueKey<String>(
              _isSeason
                  ? 'immersive-season-episodes-real'
                  : 'immersive-series-episodes-real',
            ),
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showSeasonSelector && selectedSeasonNumber != null) ...[
                ImmersiveSeasonSelector(
                  key: _seasonSelectorKey,
                  seasonNumbers: seasonNumbers,
                  selectedSeasonNumber: selectedSeasonNumber,
                  labelBuilder: (seasonNumber) {
                    return _seasonName(context, seasonNumber);
                  },
                  statusBuilder: (seasonNumber) {
                    return seerrSeasonStatus[seasonNumber];
                  },
                  visible: true,
                  allowLeftEdgeExit: _navbarIsLeft,
                  onNavigateUp: _handleSeasonNavigateUp,
                  onNavigateDown: () {
                    return _handleSeasonNavigateDown(episodes, layout);
                  },
                  onSeasonActivated: (seasonNumber) {
                    _selectSeason(seasonNumber, episodes, layout);
                  },
                ),
                SizedBox(height: selectorToEpisodes),
              ],

              _buildEpisodesRail(context, episodes, nextUpEpisode, layout),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEpisodesRail(
    BuildContext context,
    List<AggregatedItem> episodes,
    AggregatedItem? nextUpEpisode,
    _EpisodeLayout layout,
  ) {
    _scrollSyncEpisodes = episodes;
    _scrollSyncLayout = layout;

    _mobileScrollSyncEnabled = layout.compact;

    final scrollController = _ensureEpisodesScrollController(
      episodes: episodes,
      nextUpEpisode: nextUpEpisode,
      layout: layout,
    );

    return SizedBox(
      key: _artworkRailAnchorKey,
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
            key: _episodeRowKey,
            items: episodes,
            hubKey: _episodeHubKey,
            controller: scrollController,
            height: layout.railHeight,
            itemExtent: layout.itemExtent,
            clipBehavior: Clip.none,
            onTap: (_, episode) {
              _playEpisode(context, episode);
            },
            onLongPress: (_, episode) {
              _showEpisodeContextMenu(context, episode);
            },
            onIndexChanged: (index, episode) {
              _handleEpisodeIndexChanged(index, episode);
            },
            onVerticalNavigation: (isUp) {
              return _handleEpisodeVerticalNavigation(isUp, episodes);
            },
            onLeftEdge: _navbarIsLeft ? _handleEpisodeLeftEdge : null,
            itemBuilder: (context, episode, index, isFocused) {
              final hasPrevious = index > 0;

              final hasNext = index < episodes.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  right: hasNext ? layout.cardSpacing : 0,
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ImmersiveLandscapeMediaCard(
                    key: _episodeCardKey(episode),
                    item: episode,
                    imageUrl: _imageUrl(episode),
                    width: layout.cardWidth,
                    imageHeight: layout.imageHeight,
                    compactLayout: layout.compact,
                    isNextUp: episode.id == nextUpEpisode?.id,
                    isFocused: isFocused,
                    suppressArtworkFocus:
                        _focusedEpisodeDetailsId == episode.id,
                    onArtworkSelect: () {
                      _playEpisode(context, episode);
                    },
                    onContextAction: () {
                      _showEpisodeContextMenu(context, episode);
                    },
                    onDetailsFocusChange: (hasFocus) {
                      _handleEpisodeDetailsFocusChange(episode, hasFocus);
                    },
                    onDetailsNavigateUp: () {
                      _focusEpisodeArtwork(index);

                      return true;
                    },
                    onDetailsNavigateDown: widget.onNavigateDown,
                    onDetailsNavigateLeft: hasPrevious
                        ? () {
                            _focusEpisodeArtwork(index - 1);
                          }
                        : null,
                    onDetailsNavigateRight: hasNext
                        ? () {
                            _focusEpisodeArtwork(index + 1);
                          }
                        : null,
                    onDetailsSelect: () {
                      _openEpisodeDetails(context, episode);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AggregatedItem? _resolveNextUpEpisode(List<AggregatedItem> episodes) {
    for (final episode in episodes) {
      if (!episode.isPlayed) {
        return episode;
      }
    }

    return episodes.isNotEmpty ? episodes.first : null;
  }

  String _seasonName(BuildContext context, int seasonNumber) {
    for (final season in _vm.seasons) {
      if (season.indexNumber != seasonNumber) {
        continue;
      }

      final name = season.name.trim();

      if (name.isNotEmpty) {
        return name;
      }
    }

    return AppLocalizations.of(context).seasonNumber(seasonNumber);
  }

  String? _imageUrl(AggregatedItem item) {
    final tag = item.primaryImageTag;

    if (tag != null && !item.id.startsWith('tmdb:')) {
      return _vm.imageApi.getPrimaryImageUrl(item.id, maxHeight: 360, tag: tag);
    }

    final posterPath = item.rawData['PosterPath'] as String?;

    if (posterPath != null && posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w342$posterPath';
    }

    final profilePath = item.rawData['ProfilePath'] as String?;

    if (profilePath != null && profilePath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }

    return null;
  }
}

class _EpisodeLayout {
  final double viewportWidth;
  final double cardWidth;
  final double cardSpacing;
  final double imageHeight;
  final double railHeight;
  final bool compact;

  const _EpisodeLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.cardSpacing,
    required this.imageHeight,
    required this.railHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
