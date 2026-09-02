import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../navigation/destinations.dart';
import '../../../../widgets/focus/context_menu_sheet.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';
import '../../../../widgets/focus/hub_focus_memory.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../item_detail_screen.dart';
import '../shared/immersive_landscape_media_card.dart';
import '../shared/immersive_poster_card.dart';
import '../shared/immersive_spacing.dart';

class ImmersiveCollectionSection extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final GlobalKey<DetailActionButtonsState> actionButtonsKey;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;
  final ValueChanged<GlobalKey>? onRevealRequested;

  const ImmersiveCollectionSection({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.actionButtonsKey,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onRevealRequested,
  });

  static bool shouldInclude(ItemDetailViewModel viewModel) {
    return viewModel.item?.type == 'BoxSet';
  }

  @override
  State<ImmersiveCollectionSection> createState() =>
      ImmersiveCollectionSectionState();
}

class ImmersiveCollectionSectionState
    extends State<ImmersiveCollectionSection> {
  static int _hubSession = 0;

  static const int _paginationThreshold = 8;

  final ScrollController _collectionScrollController = ScrollController();
  final ScrollController _playlistScrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _collectionRowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _playlistRowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  final GlobalKey _collectionRailRevealKey = GlobalKey();
  final GlobalKey _playlistSectionRevealKey = GlobalKey();

  final FocusNode _sortFocusNode = FocusNode(
    debugLabel: 'immersiveCollectionSort',
  );

  final Map<String, GlobalKey<ImmersiveLandscapeMediaCardState>>
  _playlistCardKeys = {};

  late String _collectionHubKey;
  late String _playlistHubKey;

  List<AggregatedItem> _stableCollectionItems = const [];
  List<AggregatedItem> _stablePlaylistItems = const [];

  String? _focusedPlaylistDetailsId;

  bool _sortFocused = false;
  bool _sortInProgress = false;

  ItemDetailViewModel get _vm => widget.viewModel;

  List<AggregatedItem> get _collectionItems {
    final live = _vm.collectionItems;

    if (live.isNotEmpty) {
      return live;
    }

    return _stableCollectionItems;
  }

  List<AggregatedItem> get _playlistItems {
    final live = _vm.playlistItems;

    if (live.isNotEmpty) {
      return live;
    }

    return _stablePlaylistItems;
  }

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  GlobalKey? get topRevealKey {
    if (_collectionItems.isNotEmpty) {
      return _collectionRailRevealKey;
    }

    if (_playlistItems.isNotEmpty) {
      return _playlistSectionRevealKey;
    }

    return null;
  }

  GlobalKey? get bottomRevealKey {
    if (_playlistItems.isNotEmpty) {
      return _playlistSectionRevealKey;
    }

    if (_collectionItems.isNotEmpty) {
      return _collectionRailRevealKey;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _createHubKeys();
    _captureStableItems();

    _vm.addListener(_handleViewModelChanged);
  }

  @override
  void didUpdateWidget(covariant ImmersiveCollectionSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (identical(oldWidget.viewModel, widget.viewModel)) {
      return;
    }

    oldWidget.viewModel.removeListener(_handleViewModelChanged);

    widget.viewModel.addListener(_handleViewModelChanged);

    _focusedPlaylistDetailsId = null;

    _playlistCardKeys.clear();

    _createHubKeys();

    _stableCollectionItems = List<AggregatedItem>.from(_vm.collectionItems);

    _stablePlaylistItems = List<AggregatedItem>.from(_vm.playlistItems);

    _sortInProgress = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      if (_collectionScrollController.hasClients) {
        _collectionScrollController.jumpTo(
          _collectionScrollController.position.minScrollExtent,
        );
      }

      if (_playlistScrollController.hasClients) {
        _playlistScrollController.jumpTo(
          _playlistScrollController.position.minScrollExtent,
        );
      }
    });
  }

  @override
  void dispose() {
    _vm.removeListener(_handleViewModelChanged);

    _sortFocusNode.dispose();

    _collectionScrollController.dispose();
    _playlistScrollController.dispose();

    super.dispose();
  }

  void _captureStableItems() {
    if (_vm.collectionItems.isNotEmpty) {
      _stableCollectionItems = List<AggregatedItem>.from(_vm.collectionItems);
    }

    if (_vm.playlistItems.isNotEmpty) {
      _stablePlaylistItems = List<AggregatedItem>.from(_vm.playlistItems);
    }
  }

  void _handleViewModelChanged() {
    if (!mounted) {
      return;
    }

    if (_vm.collectionItems.isNotEmpty) {
      _stableCollectionItems = List<AggregatedItem>.from(_vm.collectionItems);
    }

    if (_vm.playlistItems.isNotEmpty) {
      _stablePlaylistItems = List<AggregatedItem>.from(_vm.playlistItems);
    }

    setState(() {});
  }

  void _createHubKeys() {
    final session = _hubSession++;
    final itemId = _vm.item?.id;

    _collectionHubKey = 'immersive-collection-$itemId-$session';
    _playlistHubKey = 'immersive-collection-playlist-$itemId-$session';
  }

  void _revealCollectionRail() {
    widget.onRevealRequested?.call(_collectionRailRevealKey);
  }

  void _revealPlaylistSection() {
    widget.onRevealRequested?.call(_playlistSectionRevealKey);
  }

  GlobalKey<ImmersiveLandscapeMediaCardState> _playlistCardKey(
    AggregatedItem item,
  ) {
    return _playlistCardKeys.putIfAbsent(
      item.id,
      () => GlobalKey<ImmersiveLandscapeMediaCardState>(),
    );
  }

  void _prunePlaylistCardKeys() {
    final ids = _playlistItems.map((item) => item.id).toSet();

    _playlistCardKeys.removeWhere((id, _) => !ids.contains(id));
  }

  bool get canFocusTop {
    if (!mounted) {
      return false;
    }

    if (_collectionItems.isNotEmpty && _collectionRowKey.currentState != null) {
      return true;
    }

    if (_playlistItems.isNotEmpty && _sortFocusNode.canRequestFocus) {
      return true;
    }

    return _playlistItems.isNotEmpty && _playlistRowKey.currentState != null;
  }

  bool focusTop() {
    if (!mounted) {
      return false;
    }

    if (_collectionItems.isNotEmpty && _focusCollectionFromMemory()) {
      _revealCollectionRail();

      return true;
    }

    if (_playlistItems.isNotEmpty && _sortFocusNode.canRequestFocus) {
      _sortFocusNode.requestFocus();

      _revealPlaylistSection();

      return true;
    }

    final moved = _focusPlaylistArtworkFromMemory();

    if (moved) {
      _revealPlaylistSection();
    }

    return moved;
  }

  bool focusBottom() {
    if (!mounted) {
      return false;
    }

    if (_playlistItems.isNotEmpty) {
      final row = _playlistRowKey.currentState;

      if (row != null) {
        final remembered = HubFocusMemory.peek(_playlistHubKey);

        final index = (remembered ?? row.focusedIndex).clamp(
          0,
          _playlistItems.length - 1,
        );

        final card = _playlistCardKey(_playlistItems[index]).currentState;

        if (card?.requestDetailsFocus() ?? false) {
          _revealPlaylistSection();

          return true;
        }

        row.requestFocusAt(index);

        _revealPlaylistSection();

        return true;
      }
    }

    final moved = _focusCollectionFromMemory();

    if (moved) {
      _revealCollectionRail();
    }

    return moved;
  }

  bool _focusCollectionFromMemory() {
    final items = _collectionItems;
    final row = _collectionRowKey.currentState;

    if (items.isEmpty || row == null) {
      return false;
    }

    final remembered = HubFocusMemory.peek(_collectionHubKey);

    final index = (remembered ?? row.focusedIndex).clamp(0, items.length - 1);

    row.requestFocusAt(index);

    return true;
  }

  bool _focusPlaylistArtworkFromMemory() {
    final items = _playlistItems;
    final row = _playlistRowKey.currentState;

    if (items.isEmpty || row == null) {
      return false;
    }

    final remembered = HubFocusMemory.peek(_playlistHubKey);

    final index = (remembered ?? row.focusedIndex).clamp(0, items.length - 1);

    row.requestFocusAt(index);

    return true;
  }

  bool _handleCollectionVerticalNavigation(bool isUp) {
    if (isUp) {
      return widget.onNavigateUp?.call() ?? false;
    }

    if (_playlistItems.isNotEmpty && _sortFocusNode.canRequestFocus) {
      _sortFocusNode.requestFocus();

      _revealPlaylistSection();

      return true;
    }

    if (_playlistItems.isNotEmpty) {
      final moved = _focusPlaylistArtworkFromMemory();

      if (moved) {
        _revealPlaylistSection();
      }

      return moved;
    }

    return widget.onNavigateDown?.call() ?? false;
  }

  bool _handlePlaylistArtworkVerticalNavigation(bool isUp) {
    if (isUp) {
      if (_sortFocusNode.canRequestFocus) {
        _sortFocusNode.requestFocus();

        _revealPlaylistSection();

        return true;
      }

      if (_collectionItems.isNotEmpty) {
        final moved = _focusCollectionFromMemory();

        if (moved) {
          _revealCollectionRail();
        }

        return moved;
      }

      return widget.onNavigateUp?.call() ?? false;
    }

    final items = _playlistItems;
    final row = _playlistRowKey.currentState;

    if (items.isEmpty || row == null) {
      return widget.onNavigateDown?.call() ?? false;
    }

    final index = row.focusedIndex.clamp(0, items.length - 1);

    final card = _playlistCardKey(items[index]).currentState;

    if (card?.requestDetailsFocus() ?? false) {
      _revealPlaylistSection();

      return true;
    }

    return widget.onNavigateDown?.call() ?? false;
  }

  void _handleCollectionIndexChanged(int index, AggregatedItem item) {
    _maybeLoadMoreCollection(index);
  }

  void _handlePlaylistIndexChanged(int index, AggregatedItem item) {
    _maybeLoadMorePlaylist(index);
  }

  void _maybeLoadMoreCollection(int index) {
    final items = _collectionItems;

    if (items.isEmpty) {
      return;
    }

    final triggerIndex = (items.length - _paginationThreshold).clamp(
      0,
      items.length - 1,
    );

    if (index < triggerIndex) {
      return;
    }

    unawaited(_vm.loadMoreCollectionItems());
  }

  void _maybeLoadMorePlaylist(int index) {
    final items = _playlistItems;

    if (items.isEmpty || _sortInProgress) {
      return;
    }

    final triggerIndex = (items.length - _paginationThreshold).clamp(
      0,
      items.length - 1,
    );

    if (index < triggerIndex) {
      return;
    }

    unawaited(_vm.loadMorePlaylistItems());
  }

  void _focusPlaylistArtwork(int index) {
    final items = _playlistItems;

    if (index < 0 || index >= items.length) {
      return;
    }

    _playlistRowKey.currentState?.requestFocusAt(index);

    _revealPlaylistSection();
  }

  void _handlePlaylistDetailsFocusChange(AggregatedItem item, bool hasFocus) {
    if (!mounted) {
      return;
    }

    if (hasFocus) {
      if (_focusedPlaylistDetailsId == item.id) {
        return;
      }

      setState(() {
        _focusedPlaylistDetailsId = item.id;
      });

      _revealPlaylistSection();

      return;
    }

    if (_focusedPlaylistDetailsId != item.id) {
      return;
    }

    setState(() {
      _focusedPlaylistDetailsId = null;
    });
  }

  void _openItem(BuildContext context, AggregatedItem item) {
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  void _playItem(BuildContext context, AggregatedItem item) {
    final actionButtons = widget.actionButtonsKey.currentState;

    if (actionButtons == null) {
      return;
    }

    final playbackPosition = item.playbackPosition?.inMilliseconds ?? 0;

    final percentage = item.playedPercentage ?? 0;

    final hasProgress =
        playbackPosition > 0 || (percentage.isFinite && percentage > 0);

    unawaited(actionButtons.playItem(context, item, resume: hasProgress));
  }

  void _showItemContextMenu(BuildContext context, AggregatedItem item) {
    showContextMenu(
      context,
      item,
      onChanged: () {
        unawaited(_refreshCollectionAfterMutation());
      },
    );
  }

  Future<void> _refreshCollectionAfterMutation() async {
    await Future.wait([
      _vm.refreshCollectionItems(),
      _vm.refreshPlaylistItems(),
    ]);

    if (!mounted) {
      return;
    }

    _captureStableItems();
  }

  void _handleLeftEdge() {
    if (!_navbarIsLeft) {
      return;
    }

    FocusManager.instance.primaryFocus?.focusInDirection(
      TraversalDirection.left,
    );
  }

  void _handleSortLeftEdge() {
    if (!_navbarIsLeft) {
      return;
    }

    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;

    if (focusNavbar != null) {
      focusNavbar();
    }
  }

  Future<void> _openSortDialog(BuildContext context) async {
    if (_sortInProgress) {
      return;
    }

    final option = await showDialog<CollectionSortOption>(
      context: context,
      builder: (dialogContext) {
        return _ImmersiveCollectionSortDialog(selected: _vm.collectionSort);
      },
    );

    if (!mounted || option == null) {
      return;
    }

    await _setSort(option);
  }

  Future<void> _setSort(CollectionSortOption option) async {
    if (_sortInProgress || _vm.collectionSort == option) {
      return;
    }

    _captureStableItems();

    setState(() {
      _sortInProgress = true;
    });

    try {
      await _vm.setCollectionSort(option);

      if (!mounted) {
        return;
      }

      _captureStableItems();

      HubFocusMemory.set(_playlistHubKey, 0);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }

        if (_playlistScrollController.hasClients) {
          _playlistScrollController.jumpTo(
            _playlistScrollController.position.minScrollExtent,
          );
        }

        _sortFocusNode.requestFocus();

        _revealPlaylistSection();
      });
    } finally {
      if (mounted) {
        setState(() {
          _sortInProgress = false;
        });
      }
    }
  }

  String _sortLabel(AppLocalizations l10n, CollectionSortOption option) {
    return switch (option) {
      CollectionSortOption.alphabetical => l10n.sortAlphabetical,

      CollectionSortOption.releaseAscending => l10n.sortReleaseAscending,

      CollectionSortOption.releaseDescending => l10n.sortReleaseDescending,

      CollectionSortOption.custom => l10n.sortCustomDragDrop,
    };
  }

  _CollectionPosterLayout _collectionLayoutFor(
    BuildContext context,
    double availableWidth,
  ) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactDiscovery;

      final cardWidth = metrics.itemWidth(availableWidth);

      return _CollectionPosterLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        cardSpacing: metrics.gap,
        cardHeight: cardWidth * 3 / 2,
        compact: true,
      );
    }

    final cardSpacing = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final visibleItemCount = PlatformDetection.isTV ? 5.5 : 4.5;

    final cardWidth =
        (availableWidth - visibleItemCount.floor() * cardSpacing) /
        visibleItemCount;

    return _CollectionPosterLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      cardSpacing: cardSpacing,
      cardHeight: cardWidth * 3 / 2,
      compact: false,
    );
  }

  _PlaylistLayout _playlistLayoutFor(
    BuildContext context,
    double availableWidth,
    TextScaler textScaler,
  ) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactEpisodes;

      final cardWidth = metrics.itemWidth(availableWidth);

      final imageHeight = cardWidth * 9 / 16;

      final detailsHeight = textScaler.scale(92).clamp(92.0, 124.0);

      return _PlaylistLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        cardSpacing: metrics.gap,
        imageHeight: imageHeight,
        railHeight: imageHeight + 10 + detailsHeight + 6,
        compact: true,
      );
    }

    final cardSpacing = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final visibleItemCount = PlatformDetection.isTV
        ? ImmersiveSpacing.tvEpisodeVisibleItemCount
        : ImmersiveSpacing.episodeVisibleItemCount;

    final cardWidth =
        (availableWidth - visibleItemCount.floor() * cardSpacing) /
        visibleItemCount;

    final imageHeight = cardWidth * 9 / 16;

    final detailsHeight = textScaler.scale(82).clamp(82.0, 118.0);

    return _PlaylistLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      cardSpacing: cardSpacing,
      imageHeight: imageHeight,
      railHeight: imageHeight + detailsHeight + 16,
      compact: false,
    );
  }

  String? _primaryImageUrl(AggregatedItem item) {
    final tag = item.primaryImageTag;

    if (tag != null && !item.id.startsWith('tmdb:')) {
      return _vm.imageApi.getPrimaryImageUrl(item.id, maxHeight: 600, tag: tag);
    }

    final posterPath = item.rawData['PosterPath'] as String?;

    if (posterPath != null && posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

    return null;
  }

  String? _playlistImageUrl(AggregatedItem item) {
    final tag = item.primaryImageTag;

    if (tag != null && !item.id.startsWith('tmdb:')) {
      return _vm.imageApi.getPrimaryImageUrl(item.id, maxHeight: 360, tag: tag);
    }

    final backdropPath = item.rawData['BackdropPath'] as String?;

    if (backdropPath != null && backdropPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w780$backdropPath';
    }

    final posterPath = item.rawData['PosterPath'] as String?;

    if (posterPath != null && posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

    return null;
  }

  String? _collectionSubtitle(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);

    final year = item.productionYear;

    final type = switch (item.type) {
      'Movie' => l10n.movie,
      'Series' => l10n.series,
      'BoxSet' => l10n.collection,
      _ => null,
    };

    if (type == null && year == null) {
      return null;
    }

    if (type == null) {
      return year?.toString();
    }

    if (year == null) {
      return type;
    }

    return '$type · $year';
  }

  double _progressFor(AggregatedItem item) {
    final percentage = item.playedPercentage ?? 0;

    if (!percentage.isFinite || percentage <= 0) {
      return 0;
    }

    return (percentage / 100).clamp(0.0, 1.0).toDouble();
  }

  AggregatedItem? _resolvePlaylistNextUp(List<AggregatedItem> items) {
    final nextUp = _vm.nextUp;

    if (nextUp != null) {
      for (final item in items) {
        if (item.id == nextUp.id) {
          return item;
        }
      }
    }

    for (final item in items) {
      if (!item.isPlayed) {
        return item;
      }
    }

    return items.isNotEmpty ? items.first : null;
  }

  @override
  Widget build(BuildContext context) {
    _prunePlaylistCardKeys();

    if (_vm.collectionItems.isNotEmpty) {
      _stableCollectionItems = List<AggregatedItem>.from(_vm.collectionItems);
    }

    if (_vm.playlistItems.isNotEmpty) {
      _stablePlaylistItems = List<AggregatedItem>.from(_vm.playlistItems);
    }

    final collectionItems = _collectionItems;

    final playlistItems = _playlistItems;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final collectionLayout = _collectionLayoutFor(context, availableWidth);

        final playlistLayout = _playlistLayoutFor(
          context,
          availableWidth,
          MediaQuery.textScalerOf(context),
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCollectionRail(context, collectionItems, collectionLayout),

            if (playlistItems.isNotEmpty) ...[
              SizedBox(
                height: collectionLayout.compact
                    ? ImmersiveSpacing.mobileSectionGap
                    : ImmersiveSpacing.sectionGap,
              ),

              KeyedSubtree(
                key: _playlistSectionRevealKey,
                child: _buildPlaylistRail(
                  context,
                  playlistItems,
                  playlistLayout,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildCollectionRail(
    BuildContext context,
    List<AggregatedItem> items,
    _CollectionPosterLayout layout,
  ) {
    final l10n = AppLocalizations.of(context);

    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.collection,
          style: layout.compact
              ? textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                )
              : textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),

        SizedBox(
          height: layout.compact
              ? ImmersiveSpacing.mobileTitleToContent
              : ImmersiveSpacing.titleToContent,
        ),

        SizedBox(
          key: _collectionRailRevealKey,
          width: double.infinity,
          height: layout.cardHeight,
          child: items.isEmpty
              ? ExcludeFocus(
                  child: _CollectionPosterReservation(layout: layout),
                )
              : OverflowBox(
                  alignment: Alignment.topLeft,
                  minWidth: layout.viewportWidth,
                  maxWidth: layout.viewportWidth,
                  minHeight: layout.cardHeight,
                  maxHeight: layout.cardHeight,
                  child: SizedBox(
                    width: layout.viewportWidth,
                    height: layout.cardHeight,
                    child: LockedFocusRow<AggregatedItem>(
                      key: _collectionRowKey,
                      items: items,
                      hubKey: _collectionHubKey,
                      controller: _collectionScrollController,
                      height: layout.cardHeight,
                      itemExtent: layout.itemExtent,
                      clipBehavior: Clip.none,
                      onTap: (_, item) {
                        _openItem(context, item);
                      },
                      onLongPress: (_, item) {
                        _showItemContextMenu(context, item);
                      },
                      onIndexChanged: _handleCollectionIndexChanged,
                      onVerticalNavigation: _handleCollectionVerticalNavigation,
                      onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
                      itemBuilder: (context, item, index, isFocused) {
                        final hasNext = index < items.length - 1;

                        return Padding(
                          padding: EdgeInsets.only(
                            right: hasNext ? layout.cardSpacing : 0,
                          ),
                          child: ImmersivePosterCard(
                            imageUrl: _primaryImageUrl(item),
                            title: item.name,
                            subtitle: _collectionSubtitle(context, item),
                            width: layout.cardWidth,
                            height: layout.cardHeight,
                            isFocused: isFocused,
                            isFavorite: item.isFavorite,
                            isPlayed: item.isPlayed,
                            progress: _progressFor(item),
                            placeholderIcon: _placeholderIconFor(item),
                            onTap: () {
                              _openItem(context, item);
                            },
                            onLongPress: () {
                              _showItemContextMenu(context, item);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildPlaylistRail(
    BuildContext context,
    List<AggregatedItem> items,
    _PlaylistLayout layout,
  ) {
    final l10n = AppLocalizations.of(context);

    final theme = Theme.of(context);

    final foreground = AppColorScheme.onSurface;

    final nextUp = _resolvePlaylistNextUp(items);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                l10n.playlist,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: layout.compact
                    ? theme.textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      )
                    : theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ),

            const SizedBox(width: 12),

            FocusableWrapper(
              focusNode: _sortFocusNode,
              suppressFocusGlow: true,
              disableScale: true,
              borderRadius: 999,
              onFocusChange: (focused) {
                if (!mounted || _sortFocused == focused) {
                  return;
                }

                setState(() {
                  _sortFocused = focused;
                });

                if (focused) {
                  _revealPlaylistSection();
                }
              },
              onSelect: () {
                unawaited(_openSortDialog(context));
              },
              onNavigateLeft: _navbarIsLeft ? _handleSortLeftEdge : null,
              onNavigateRight: () {},
              onNavigateUp: () {
                if (_collectionItems.isNotEmpty) {
                  if (_focusCollectionFromMemory()) {
                    _revealCollectionRail();
                  }

                  return;
                }

                widget.onNavigateUp?.call();
              },
              onNavigateDown: () {
                if (_focusPlaylistArtworkFromMemory()) {
                  _revealPlaylistSection();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOutCubic,
                width: layout.compact ? 42 : null,
                height: 42,
                padding: layout.compact
                    ? EdgeInsets.zero
                    : const EdgeInsets.fromLTRB(14, 0, 12, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _sortFocused
                      ? foreground.withValues(alpha: 0.12)
                      : foreground.withValues(alpha: 0.045),
                  borderRadius: AppRadius.circular(999),
                  border: Border.all(
                    color: _sortFocused
                        ? foreground.withValues(alpha: 0.72)
                        : foreground.withValues(alpha: 0.10),
                    width: _sortFocused ? 1.5 : 1,
                  ),
                  boxShadow: _sortFocused
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.24),
                            blurRadius: 18,
                            offset: const Offset(0, 5),
                          ),
                        ]
                      : null,
                ),
                child: layout.compact
                    ? AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: _sortInProgress
                            ? SizedBox(
                                key: const ValueKey(
                                  'immersive-sort-loading-compact',
                                ),
                                width: 17,
                                height: 17,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.8,
                                  color: foreground.withValues(alpha: 0.82),
                                ),
                              )
                            : Icon(
                                key: const ValueKey(
                                  'immersive-sort-icon-compact',
                                ),
                                Icons.sort_rounded,
                                size: 20,
                                color: _sortFocused
                                    ? foreground
                                    : foreground.withValues(alpha: 0.72),
                              ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 150),
                            child: _sortInProgress
                                ? SizedBox(
                                    key: const ValueKey(
                                      'immersive-sort-loading',
                                    ),
                                    width: 17,
                                    height: 17,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.8,
                                      color: foreground.withValues(alpha: 0.82),
                                    ),
                                  )
                                : Icon(
                                    key: const ValueKey('immersive-sort-icon'),
                                    Icons.sort_rounded,
                                    size: 18,
                                    color: _sortFocused
                                        ? foreground
                                        : foreground.withValues(alpha: 0.68),
                                  ),
                          ),

                          const SizedBox(width: 9),

                          Text(
                            _sortLabel(l10n, _vm.collectionSort),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: _sortFocused
                                  ? foreground
                                  : foreground.withValues(alpha: 0.78),
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                          ),

                          const SizedBox(width: 7),

                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: foreground.withValues(
                              alpha: _sortFocused ? 0.90 : 0.52,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: layout.compact
              ? ImmersiveSpacing.mobileTitleToContent
              : ImmersiveSpacing.titleToContent,
        ),

        SizedBox(
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
                key: _playlistRowKey,
                items: items,
                hubKey: _playlistHubKey,
                controller: _playlistScrollController,
                height: layout.railHeight,
                itemExtent: layout.itemExtent,
                clipBehavior: Clip.none,
                onTap: (_, item) {
                  _playItem(context, item);
                },
                onLongPress: (_, item) {
                  _showItemContextMenu(context, item);
                },
                onIndexChanged: (index, item) {
                  _handlePlaylistIndexChanged(index, item);

                  _revealPlaylistSection();
                },
                onVerticalNavigation: _handlePlaylistArtworkVerticalNavigation,
                onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
                itemBuilder: (context, item, index, isFocused) {
                  final hasPrevious = index > 0;

                  final hasNext = index < items.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(
                      right: hasNext ? layout.cardSpacing : 0,
                    ),
                    child: ImmersiveLandscapeMediaCard(
                      key: _playlistCardKey(item),
                      item: item,
                      imageUrl: _playlistImageUrl(item),
                      width: layout.cardWidth,
                      imageHeight: layout.imageHeight,
                      compactLayout: layout.compact,
                      isFocused: isFocused,
                      isNextUp: item.id == nextUp?.id,
                      suppressArtworkFocus:
                          _focusedPlaylistDetailsId == item.id,
                      onArtworkSelect: () {
                        _playItem(context, item);
                      },
                      onContextAction: () {
                        _showItemContextMenu(context, item);
                      },
                      onDetailsSelect: () {
                        _openItem(context, item);
                      },
                      onDetailsFocusChange: (hasFocus) {
                        _handlePlaylistDetailsFocusChange(item, hasFocus);
                      },
                      onDetailsNavigateUp: () {
                        _focusPlaylistArtwork(index);

                        return true;
                      },
                      onDetailsNavigateDown: widget.onNavigateDown,
                      onDetailsNavigateLeft: hasPrevious
                          ? () {
                              _focusPlaylistArtwork(index - 1);
                            }
                          : null,
                      onDetailsNavigateRight: hasNext
                          ? () {
                              _focusPlaylistArtwork(index + 1);
                            }
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _placeholderIconFor(AggregatedItem item) {
    return switch (item.type) {
      'Series' => Icons.tv_rounded,
      'Season' => Icons.video_library_outlined,
      'Episode' => Icons.movie_outlined,
      'BoxSet' => Icons.collections_bookmark_outlined,
      _ => Icons.movie_outlined,
    };
  }
}

class _ImmersiveCollectionSortDialog extends StatefulWidget {
  final CollectionSortOption selected;

  const _ImmersiveCollectionSortDialog({required this.selected});

  @override
  State<_ImmersiveCollectionSortDialog> createState() =>
      _ImmersiveCollectionSortDialogState();
}

class _ImmersiveCollectionSortDialogState
    extends State<_ImmersiveCollectionSortDialog> {
  late final Map<CollectionSortOption, FocusNode> _focusNodes = {
    for (final option in CollectionSortOption.values)
      option: FocusNode(debugLabel: 'immersiveCollectionSort-$option'),
  };

  CollectionSortOption? _focusedOption;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _focusNodes[widget.selected]?.requestFocus();
    });
  }

  @override
  void dispose() {
    for (final node in _focusNodes.values) {
      node.dispose();
    }

    super.dispose();
  }

  String _label(AppLocalizations l10n, CollectionSortOption option) {
    return switch (option) {
      CollectionSortOption.alphabetical => l10n.sortAlphabetical,

      CollectionSortOption.releaseAscending => l10n.sortReleaseAscending,

      CollectionSortOption.releaseDescending => l10n.sortReleaseDescending,

      CollectionSortOption.custom => l10n.sortCustomDragDrop,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final l10n = AppLocalizations.of(context);

    final foreground = AppColorScheme.onSurface;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Container(
        width: 470,
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor.withValues(alpha: 0.98),
          borderRadius: AppRadius.circular(22),
          border: Border.all(color: foreground.withValues(alpha: 0.13)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.42),
              blurRadius: 38,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 2, 12, 15),
              child: Text(
                l10n.playlistSortOptions,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
            ),

            for (final option in CollectionSortOption.values) ...[
              Builder(
                builder: (context) {
                  final active = widget.selected == option;

                  final focused = _focusedOption == option;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FocusableWrapper(
                      focusNode: _focusNodes[option],
                      suppressFocusGlow: true,
                      disableScale: true,
                      borderRadius: 12,
                      onFocusChange: (hasFocus) {
                        if (!mounted) {
                          return;
                        }

                        setState(() {
                          if (hasFocus) {
                            _focusedOption = option;
                          } else if (_focusedOption == option) {
                            _focusedOption = null;
                          }
                        });
                      },
                      onSelect: () {
                        Navigator.of(context).pop(option);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        curve: Curves.easeOutCubic,
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: focused
                              ? foreground.withValues(alpha: 0.11)
                              : Colors.transparent,
                          borderRadius: AppRadius.circular(12),
                          border: Border.all(
                            color: focused
                                ? foreground.withValues(alpha: 0.28)
                                : Colors.transparent,
                          ),
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 140),
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: active
                                    ? theme.colorScheme.primary
                                    : Colors.transparent,
                                border: Border.all(
                                  color: active
                                      ? theme.colorScheme.primary
                                      : foreground.withValues(alpha: 0.32),
                                  width: 1.5,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: active
                                  ? Icon(
                                      Icons.check_rounded,
                                      size: 15,
                                      color: theme.colorScheme.onPrimary,
                                    )
                                  : null,
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Text(
                                _label(l10n, option),
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: foreground.withValues(
                                    alpha: focused || active ? 1.0 : 0.78,
                                  ),
                                  fontWeight: active
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CollectionPosterReservation extends StatelessWidget {
  final _CollectionPosterLayout layout;

  const _CollectionPosterReservation({required this.layout});

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    final placeholderCount = layout.compact
        ? (layout.viewportWidth / layout.itemExtent).ceil() + 1
        : PlatformDetection.isTV
        ? 7
        : 6;

    return OverflowBox(
      alignment: Alignment.topLeft,
      minWidth: layout.viewportWidth,
      maxWidth: layout.viewportWidth,
      minHeight: layout.cardHeight,
      maxHeight: layout.cardHeight,
      child: SizedBox(
        width: layout.viewportWidth,
        height: layout.cardHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          clipBehavior: Clip.none,
          itemCount: placeholderCount,
          separatorBuilder: (_, _) {
            return SizedBox(width: layout.cardSpacing);
          },
          itemBuilder: (_, _) {
            return Container(
              width: layout.cardWidth,
              height: layout.cardHeight,
              decoration: BoxDecoration(
                color: foreground.withValues(alpha: 0.035),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: foreground.withValues(alpha: 0.07)),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CollectionPosterLayout {
  final double viewportWidth;
  final double cardWidth;
  final double cardSpacing;
  final double cardHeight;
  final bool compact;

  const _CollectionPosterLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.cardSpacing,
    required this.cardHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}

class _PlaylistLayout {
  final double viewportWidth;
  final double cardWidth;
  final double cardSpacing;
  final double imageHeight;
  final double railHeight;
  final bool compact;

  const _PlaylistLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.cardSpacing,
    required this.imageHeight,
    required this.railHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
