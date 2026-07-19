import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/mdblist_repository.dart';
import '../../../data/services/background_service.dart';
import '../../../data/viewmodels/favorites_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/rating_display.dart';
import '../../widgets/sliding_pill_tabs.dart';
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;

bool _isCompact(BuildContext context) =>
    PlatformDetection.useMobileUi ||
    MediaQuery.sizeOf(context).width < _kCompactBreakpoint;

double _desktopUiScaleFactor() {
  return GetIt.instance<UserPreferences>()
      .get(UserPreferences.desktopUiScale)
      .scaleFactor;
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with GridFocusNodeMixin<FavoritesScreen> {
  late final FavoritesViewModel _vm;
  final _scrollController = ScrollController();
  final _prefs = GetIt.instance<UserPreferences>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;
  int _selectedTab = 0;
  final _tabsFocusNode = FocusNode(debugLabel: 'favorites_tabs');

  /// D-pad focus navigation applies on TV and desktop. Mobile is touch.
  bool get _usesDpad =>
      PlatformDetection.isTV || PlatformDetection.useDesktopUi;

  @override
  void initState() {
    super.initState();
    _vm = FavoritesViewModel(
      client: GetIt.instance<MediaServerClient>(),
      prefs: _prefs,
      mdbListRepository: GetIt.instance<MdbListRepository>(),
    );
    _vm.addListener(_onChanged);
    _vm.load();
    _scrollController.addListener(_onScroll);
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _prefs.addListener(_onChanged);
  }

  @override
  void dispose() {
    _backgroundSub?.cancel();
    _scrollController.dispose();
    _vm.removeListener(_onChanged);
    _prefs.removeListener(_onChanged);
    _vm.dispose();
    _tabsFocusNode.dispose();
    disposeGridFocusNodes();
    super.dispose();
  }

  int _lastGridItemsLength = 0;
  Object? _lastGridFirstItemId;

  List<AggregatedItem> _currentTabItems() {
    final types = _visibleTypes();
    if (_selectedTab < 0 || _selectedTab >= types.length) return const [];
    return _vm.rowItems[types[_selectedTab]] ?? const [];
  }

  void _maybeBumpGridVersion() {
    final current = _vm.viewStyle == FavoritesViewStyle.library
        ? _vm.gridItems
        : _currentTabItems();
    final length = current.length;
    final firstId = length == 0 ? null : current.first.id;
    if (length != _lastGridItemsLength || firstId != _lastGridFirstItemId) {
      _lastGridItemsLength = length;
      _lastGridFirstItemId = firstId;
      gridContentVersion++;
      cleanupGridFocusNodes(length);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final primary = FocusManager.instance.primaryFocus;
        final inGrid =
            primary != null &&
            gridItemFocusNodes.values.any((n) => identical(n, primary));
        if (primary == null || inGrid) {
          restoreGridFocusIfNeeded();
        }
      });
    }
  }

  void _onChanged() {
    if (mounted) setState(() {});
    _maybeBumpGridVersion();
  }

  void _onItemFocused(AggregatedItem item) {
    _vm.setFocusedItem(item);
    _backgroundService.setBackground(item, context: BlurContext.browsing);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (pos.pixels <= pos.maxScrollExtent - 400) return;
    if (_vm.viewStyle == FavoritesViewStyle.library) {
      _vm.loadMoreGrid();
    } else {
      final types = _visibleTypes();
      if (_selectedTab >= 0 && _selectedTab < types.length) {
        _vm.loadMoreForType(types[_selectedTab]);
      }
    }
  }

  double _cardWidth() {
    final desktopScale = _desktopUiScaleFactor();
    final posterSize = _vm.posterSize;
    final baseWidth = switch (_vm.imageType) {
      ImageType.thumb => posterSize.landscapeHeight * (16 / 9),
      ImageType.banner => kBannerCardHeight * kBannerAspectRatio,
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * desktopScale;
  }

  double _gridBaseAspectRatio() {
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => kBannerAspectRatio,
      ImageType.poster => 2 / 3,
    };
  }

  double _itemAspectRatio(AggregatedItem item) {
    return switch (_vm.imageType) {
      ImageType.thumb => switch (item.type) {
        'MusicAlbum' ||
        'MusicArtist' ||
        'Audio' ||
        'Playlist' ||
        'Person' => 1.0,
        _ => 16 / 9,
      },
      ImageType.banner => kBannerAspectRatio,
      ImageType.poster => MediaCard.aspectRatioForType(item.type),
    };
  }

  List<FavoriteTypeFilter> _visibleTypes() {
    final result = <FavoriteTypeFilter>[];
    for (final type in FavoritesViewModel.rowTypes) {
      final items = _vm.rowItems[type];
      if (items != null && items.isNotEmpty) result.add(type);
    }
    return result;
  }

  void _selectTab(int index) {
    if (index == _selectedTab) return;
    setState(() => _selectedTab = index);
    final items = _currentTabItems();
    cleanupGridFocusNodes(items.length);
    gridContentVersion++;
    _lastGridItemsLength = items.length;
    _lastGridFirstItemId = items.isEmpty ? null : items.first.id;
    if (_scrollController.hasClients) _scrollController.jumpTo(0);
  }

  void _ensureVisibleNode(FocusNode node) {
    final nodeContext = node.context;
    if (nodeContext == null) return;
    Scrollable.ensureVisible(
      nodeContext,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      alignment: 0.2,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  }

  void _focusGridCell(int index) {
    final node = getGridItemFocusNode(index);
    if (node.context != null) {
      node.requestFocus();
      _ensureVisibleNode(node);
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final target = getGridItemFocusNode(index);
      if (target.canRequestFocus) {
        target.requestFocus();
        _ensureVisibleNode(target);
      }
    });
  }

  void _focusFirstGridCell() {
    if (!_usesDpad) return;
    _focusGridCell(0);
  }

  bool _tryFocusSidebar() {
    if (_prefs.get(UserPreferences.navbarPosition) != NavbarPosition.left) {
      return false;
    }
    return _tryFocusNavbar();
  }

  bool _tryFocusNavbar() {
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  KeyEventResult _onTabGridKey({
    required FavoriteTypeFilter type,
    required int index,
    required int columns,
    required int count,
    required KeyEvent event,
  }) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    final column = index % columns;

    if (key.isLeftKey) {
      if (column == 0) {
        if (event is KeyDownEvent) {
          return _tryFocusSidebar()
              ? KeyEventResult.handled
              : KeyEventResult.ignored;
        }
        return KeyEventResult.ignored;
      }
      _focusGridCell(index - 1);
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      if (column == columns - 1 || index >= count - 1) {
        return KeyEventResult.handled;
      }
      _focusGridCell(index + 1);
      return KeyEventResult.handled;
    }
    if (key.isUpKey) {
      if (index < columns) {
        _tabsFocusNode.requestFocus();
        return KeyEventResult.handled;
      }
      _focusGridCell(index - columns);
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      final target = index + columns;
      if (target >= count) {
        _vm.loadMoreForType(type);
        return KeyEventResult.handled;
      }
      _focusGridCell(target);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  String? _imageUrl(
    AggregatedItem item, {
    int? maxWidth,
    int? maxHeight,
  }) {
    final api = _vm.imageApi;
    if (_vm.imageType == ImageType.banner) {
      // Same order library browse uses. The portrait primary comes last
      // because a banner card crops it down to a sliver.
      final bannerTag = item.bannerImageTag;
      if (bannerTag != null) {
        return api.getBannerImageUrl(
          item.id,
          maxWidth: maxWidth,
          tag: bannerTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: maxWidth,
          tag: item.backdropImageTags.first,
        );
      }
      final thumbTag = item.thumbImageTag;
      if (thumbTag != null) {
        return api.getThumbImageUrl(item.id, maxWidth: maxWidth, tag: thumbTag);
      }
    }
    if (_vm.imageType == ImageType.thumb && item.backdropImageTags.isNotEmpty) {
      return api.getBackdropImageUrl(item.id, maxWidth: maxWidth);
    }
    return item.primaryImageTag != null
        ? api.getPrimaryImageUrl(
            item.id,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
    targetNode:
        _vm.viewStyle == FavoritesViewStyle.home ? _tabsFocusNode : null,
    child: _buildContent(context),
  );

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final hasBackdrop = !isMobile && !hideBackdrops && _backdropUrl != null;
    return Scaffold(
      backgroundColor: _navyBackground,
      body: Stack(
        children: [
          if (hasBackdrop)
            Positioned.fill(
              child: FullscreenBackdropSwitcher(
                imageUrl: _backdropUrl!,
                duration: BackgroundService.transitionDuration,
              ),
            ),
          Positioned.fill(
            child: Container(
              color: _navyBackground.withAlpha(hasBackdrop ? 115 : 191),
            ),
          ),
          Column(
            children: [
              _FavoritesHeader(
                totalCount: _vm.totalCount,
                focusedItem: _vm.focusedItem,
                focusedRatings: _vm.focusedRatings,
                enableAdditionalRatings: _prefs.get(
                  UserPreferences.enableAdditionalRatings,
                ),
                enabledRatings: _prefs.get(UserPreferences.enabledRatings),
                showLabels: _prefs.get(UserPreferences.showRatingLabels),
                showBadges: _prefs.get(UserPreferences.showRatingBadges),
                onHome: () => context.go(Destinations.home),
                onSort: () => _showSortDialog(context),
                onSettings: () => _showSettingsDialog(context),
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return switch (_vm.state) {
      FavoritesState.loading => Center(
        child: CircularProgressIndicator(color: AppColorScheme.accent),
      ),
      FavoritesState.error => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _vm.errorMessage ?? AppLocalizations.of(context).failedToLoadFavorites,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _vm.load,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      ),
      FavoritesState.ready => _vm.viewStyle == FavoritesViewStyle.home
          ? _buildTabs()
          : _buildGrid(),
    };
  }

  Widget _buildTabs() {
    final visibleTypes = _visibleTypes();
    if (visibleTypes.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noFavoritesYet,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    if (_selectedTab >= visibleTypes.length) {
      _selectedTab = visibleTypes.length - 1;
    }
    if (_selectedTab < 0) _selectedTab = 0;

    final isMobile = _isCompact(context);
    final horizontalPadding = isMobile ? 16.0 : _horizontalPadding;

    final labels = [
      for (final type in visibleTypes)
        '${type.displayName}: ${_vm.rowTotalCount(type)}',
    ];

    final selectedType = visibleTypes[_selectedTab];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            12,
            horizontalPadding,
            4,
          ),
          child: SlidingPillTabs(
            labels: labels,
            selectedIndex: _selectedTab,
            onChanged: _selectTab,
            focusNode: _tabsFocusNode,
            onExitLeft: _tryFocusSidebar,
            onVerticalNavigation: (isUp) {
              if (isUp) {
                // Let default directional focus reach the header toolbar,
                // falling back to the navbar when nothing sits above.
                if (FocusScope.of(
                  context,
                ).focusInDirection(TraversalDirection.up)) {
                  return true;
                }
                return _tryFocusNavbar();
              }
              _focusFirstGridCell();
              return true;
            },
          ),
        ),
        Expanded(child: _buildTabGrid(selectedType, horizontalPadding)),
      ],
    );
  }

  Widget _buildTabGrid(FavoriteTypeFilter type, double horizontalPadding) {
    final items = _vm.rowItems[type] ?? const <AggregatedItem>[];
    if (items.isEmpty) return const SizedBox.shrink();

    final isMobile = _isCompact(context);
    final cardWidth = _cardWidth();
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final focusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final available = constraints.maxWidth - horizontalPadding * 2;
        final minClamp = _vm.imageType == ImageType.banner
            ? (constraints.maxWidth < 600 ? 1 : 2)
            : 2;
        final columns = ((available + spacing) / (cardWidth + spacing))
            .floor()
            .clamp(minClamp, 20);
        final cellWidth = (available - (columns - 1) * spacing) / columns;
        final ar = _gridBaseAspectRatio();
        final hasSubtitles = items.any(
          (item) => (_cardSubtitle(item)?.isNotEmpty ?? false),
        );
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = (hasSubtitles ? 42.0 : 24.0) * desktopTextScale;
        final childAspectRatio = cellWidth / (cellWidth / ar + textHeight);

        return GridView.builder(
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            12,
            horizontalPadding,
            32,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: 8,
            crossAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => _buildTabGridCell(
            type: type,
            items: items,
            index: index,
            columns: columns,
            cellWidth: cellWidth,
            isMobile: isMobile,
            focusColor: focusColor,
            focusExpansion: focusExpansion,
            suppressFocusGlow: suppressFocusGlow,
            watchedBehavior: watchedBehavior,
          ),
        );
      },
    );
  }

  Widget _buildTabGridCell({
    required FavoriteTypeFilter type,
    required List<AggregatedItem> items,
    required int index,
    required int columns,
    required double cellWidth,
    required bool isMobile,
    required Color focusColor,
    required bool focusExpansion,
    required bool suppressFocusGlow,
    required WatchedIndicatorBehavior watchedBehavior,
  }) {
    final item = items[index];
    final itemAspectRatio = _itemAspectRatio(item);
    return MediaCard(
      title: item.name,
      subtitle: _cardSubtitle(item),
      imageUrl: _imageUrl(
        item,
        maxWidth: (cellWidth * 2).toInt(),
        maxHeight: (cellWidth * 2 / itemAspectRatio).toInt(),
      ),
      width: double.infinity,
      aspectRatio: itemAspectRatio,
      isBanner: _vm.imageType == ImageType.banner,
      focusColor: focusColor,
      focusNode: _usesDpad ? getGridItemFocusNode(index) : null,
      cardFocusExpansion: focusExpansion,
      suppressFocusGlow: suppressFocusGlow,
      isPlayed: item.isPlayed,
      isFavorite: item.isFavorite,
      unplayedCount: item.unplayedItemCount,
      playedPercentage: item.playedPercentage,
      watchedBehavior: watchedBehavior,
      itemType: item.type,
      onFocus: isMobile ? null : () => _onItemFocused(item),
      onHoverStart: isMobile ? null : () => _onItemFocused(item),
      onHoverEnd: isMobile ? null : () => _vm.setFocusedItem(null),
      onKeyEvent: _usesDpad
          ? (node, event) => _onTabGridKey(
              type: type,
              index: index,
              columns: columns,
              count: items.length,
              event: event,
            )
          : null,
      onLongPress: () => showContextMenu(
        context,
        item,
        onChanged: () => setState(() {}),
      ),
      onTap: () => context.push(
        Destinations.itemOrPhoto(
          item.id,
          serverId: item.serverId,
          type: item.type,
        ),
      ),
    );
  }

  Widget _buildGrid() {
    if (_vm.gridItems.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noFavoritesYet,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    final cardWidth = _cardWidth();
    final spacing = 12.0;
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = _isCompact(context);
        final gridPadding = isMobile ? 16.0 : _horizontalPadding;
        final minClamp = _vm.imageType == ImageType.banner
            ? (constraints.maxWidth < 600 ? 1 : 2)
            : 2;
        final crossAxisCount =
            ((constraints.maxWidth - gridPadding * 2 + spacing) /
                    (cardWidth + spacing))
                .floor()
                .clamp(minClamp, 20);

        final cellWidth =
            (constraints.maxWidth -
                gridPadding * 2 -
                (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        final ar = _gridBaseAspectRatio();
        final hasSubtitles = _vm.gridItems.any(
          (item) => (_cardSubtitle(item)?.isNotEmpty ?? false),
        );
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = (hasSubtitles ? 42.0 : 24.0) * desktopTextScale;
        final childAspectRatio = cellWidth / (cellWidth / ar + textHeight);
        final focusColor = Color(
          _prefs.get(UserPreferences.focusColor).colorValue,
        );
        final focusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
        final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(gridPadding, 8, gridPadding, 16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: spacing,
                  childAspectRatio: childAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = _vm.gridItems[index];
                  final itemAspectRatio = _itemAspectRatio(item);

                  Widget card = MediaCard(
                    title: item.name,
                    subtitle: _cardSubtitle(item),
                    imageUrl: _imageUrl(
                      item,
                      maxWidth: (cellWidth * 2).toInt(),
                      maxHeight: (cellWidth * 2 / itemAspectRatio).toInt(),
                    ),
                    width: double.infinity,
                    aspectRatio: itemAspectRatio,
                    isBanner: _vm.imageType == ImageType.banner,
                    focusColor: focusColor,
                    focusNode: getGridItemFocusNode(index),
                    cardFocusExpansion: focusExpansion,
                    suppressFocusGlow: suppressFocusGlow,
                    isPlayed: item.isPlayed,
                    isFavorite: item.isFavorite,
                    unplayedCount: item.unplayedItemCount,
                    playedPercentage: item.playedPercentage,
                    watchedBehavior: watchedBehavior,
                    itemType: item.type,
                    onFocus: isMobile
                      ? null
                      : () {
                          _onItemFocused(item);
                        },
                    onHoverStart: isMobile ? null : () => _onItemFocused(item),
                    onHoverEnd: isMobile
                        ? null
                        : () => _vm.setFocusedItem(null),
                    onKeyEvent: (_, event) {
                      if (event.isActionable && event.logicalKey.isRightKey) {
                        final isLastColumn =
                            (index % crossAxisCount) == crossAxisCount - 1;
                        final isLastItem = index == _vm.gridItems.length - 1;
                        if (isLastColumn || isLastItem) {
                          return KeyEventResult.handled;
                        }
                      }

                      if (!_vm.hasMoreGrid && !_vm.loadingMoreGrid) {
                        return KeyEventResult.ignored;
                      }
                      if (!event.isActionable ||
                          !event.logicalKey.isDownKey) {
                        return KeyEventResult.ignored;
                      }

                      final nextRowIndex = index + crossAxisCount;
                      final atBottomLoadedRow = nextRowIndex >= _vm.gridItems.length;
                      if (!atBottomLoadedRow) {
                        return KeyEventResult.ignored;
                      }

                      _vm.loadMoreGrid();
                      return KeyEventResult.handled;
                    },
                    onLongPress: () => showContextMenu(
                      context,
                      item,
                      onChanged: () => setState(() {}),
                    ),
                    onTap: () => context.push(
                      Destinations.itemOrPhoto(
                        item.id,
                        serverId: item.serverId,
                        type: item.type,
                      ),
                    ),
                  );
                  return card;
                }, childCount: _vm.gridItems.length),
              ),
            ),
            if (_vm.loadingMoreGrid)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColorScheme.accent,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  String? _cardSubtitle(AggregatedItem item) {
    final parts = <String>[];
    final useDetailed = _prefs.get(UserPreferences.useDetailedSubHeadings);
    if (!useDetailed) {
      return item.productionYear != null ? '${item.productionYear}' : null;
    }

    if (item.productionYear != null) parts.add('${item.productionYear}');
    if (item.officialRating != null) parts.add(item.officialRating!);
    final rt = item.runtime;
    if (rt != null) {
      final h = rt.inHours;
      final m = rt.inMinutes % 60;
      parts.add(h > 0 ? '${h}h ${m}m' : '${m}m');
    }
    if (item.communityRating != null) {
      parts.add('★ ${item.communityRating!.toStringAsFixed(1)}');
    }
    return parts.isEmpty ? null : parts.join('  ');
  }

  void _showSortDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      builder: (_) => _SortDialog(vm: _vm),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      builder: (_) => _DisplaySettingsDialog(vm: _vm),
    );
  }
}

class _FavoritesHeader extends StatelessWidget {
  final int totalCount;
  final AggregatedItem? focusedItem;
  final Map<String, double> focusedRatings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;
  final VoidCallback onHome;
  final VoidCallback onSort;
  final VoidCallback onSettings;

  const _FavoritesHeader({
    required this.totalCount,
    this.focusedItem,
    this.focusedRatings = const {},
    this.enableAdditionalRatings = false,
    this.enabledRatings = 'tomatoes,stars',
    this.showLabels = true,
    this.showBadges = true,
    required this.onHome,
    required this.onSort,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final topPad = isMobile ? MediaQuery.of(context).padding.top + 8 : 12.0;
    final hPad = isMobile ? 16.0 : _horizontalPadding;

    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, topPad, hPad, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).favorites,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              if (totalCount > 0) ...[
                const SizedBox(width: 12),
                Text(
                  AppLocalizations.of(context).totalCountItems(totalCount),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withAlpha(102),
                  ),
                ),
              ],
            ],
          ),
          if (!isMobile) ...[
            const SizedBox(height: 6),
            _FocusedItemHud(
              item: focusedItem,
              ratings: focusedRatings,
              enableAdditionalRatings: enableAdditionalRatings,
              enabledRatings: enabledRatings,
              showLabels: showLabels,
              showBadges: showBadges,
            ),
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              FocusableToolbarButton(
                icon: Icons.home,
                size: 34,
                iconSize: 22,
                unfocusedIconAlpha: 128,
                onTap: onHome,
              ),
              const SizedBox(width: 4),
              FocusableToolbarButton(
                icon: Icons.sort,
                size: 34,
                iconSize: 22,
                unfocusedIconAlpha: 128,
                onTap: onSort,
              ),
              if (!isMobile) ...[
                const SizedBox(width: 4),
                FocusableToolbarButton(
                  icon: Icons.settings,
                  size: 34,
                  iconSize: 22,
                  unfocusedIconAlpha: 128,
                  onTap: onSettings,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _FocusedItemHud extends StatelessWidget {
  final AggregatedItem? item;
  final Map<String, double> ratings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;

  const _FocusedItemHud({
    this.item,
    this.ratings = const {},
    this.enableAdditionalRatings = false,
    this.enabledRatings = 'tomatoes,stars',
    this.showLabels = true,
    this.showBadges = true,
  });

  @override
  Widget build(BuildContext context) {
    final hudHeight =
        (showLabels ? 105.0 : 86.0) * _desktopUiScaleFactor();
    return SizedBox(
      height: hudHeight,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: item == null
            ? const SizedBox.shrink(key: ValueKey('empty'))
            : Column(
                key: ValueKey(item!.id),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item!.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  _MetadataRow(item: item!),
                  const SizedBox(height: 4),
                  RatingsRow(
                    ratings: ratings,
                    communityRating: item!.communityRating,
                    criticRating: item!.criticRating,
                    enableAdditionalRatings: enableAdditionalRatings,
                    enabledRatings: enabledRatings,
                    showLabels: showLabels,
                    showBadges: showBadges,
                  ),
                  const SizedBox(height: 2),
                ],
              ),
      ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  final AggregatedItem item;

  const _MetadataRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (item.productionYear != null) {
      children.add(_infoText('${item.productionYear}'));
    }

    if (item.type != 'Series') {
      final rt = item.runtime;
      if (rt != null) {
        final h = rt.inHours;
        final m = rt.inMinutes % 60;
        final timeStr = h > 0 ? '${h}h ${m}m' : '${m}m';
        children.add(_infoText(timeStr));
      }
    }

    if (item.type == 'Series' && item.status != null) {
      final continuing = item.status == 'Continuing';
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: continuing
                ? const Color(0xFF22C55E)
                : const Color(0xFFEF4444),
            borderRadius: AppRadius.circular(4),
          ),
          child: Text(
            continuing ? AppLocalizations.of(context).continuing : AppLocalizations.of(context).ended,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (item.officialRating != null) {
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(38),
            borderRadius: AppRadius.circular(4),
          ),
          child: Text(
            item.officialRating!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    final resolution = item.videoResolution;
    if (resolution != null) {
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(38),
            borderRadius: AppRadius.circular(4),
          ),
          child: Text(
            resolution,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }

  Widget _infoText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white.withAlpha(179),
      ),
    );
  }
}

Widget _sectionHeader(String title) {
  final onSurface = AppColorScheme.onSurface;
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: onSurface.withValues(alpha: 0.72),
      ),
    ),
  );
}

Widget _radioCircle(bool selected) {
  final onSurface = AppColorScheme.onSurface;
  return Container(
    width: 18,
    height: 18,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.fromBorderSide(
        selected
            ? ThemeRegistry.active.borders.focusBorder
            : ThemeRegistry.active.borders.chipBorder,
      ),
      color: selected ? AppColorScheme.accent : Colors.transparent,
    ),
    child: selected
        ? Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: onSurface,
              ),
            ),
          )
        : null,
  );
}

class _SortDialog extends StatefulWidget {
  final FavoritesViewModel vm;

  const _SortDialog({required this.vm});

  @override
  State<_SortDialog> createState() => _SortDialogState();
}

class _SortDialogState extends State<_SortDialog> {
  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      380.0,
    );
    return Dialog(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder,
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                AppLocalizations.of(context).sortAndFilter,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            _sectionHeader(AppLocalizations.of(context).sortBy),
            for (final option in LibrarySortBy.values)
              _radioTile(
                label: option.displayName,
                selected: vm.sortBy == option,
                trailing: vm.sortBy == option
                    ? IconButton(
                        icon: Icon(
                          vm.sortDirection == SortDirection.ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: AppColorScheme.accent,
                          size: 18,
                        ),
                        onPressed: () => vm.toggleSortDirection(),
                      )
                    : null,
                onTap: () {
                  if (vm.sortBy == option) {
                    vm.toggleSortDirection();
                  } else {
                    vm.setSortBy(option);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _radioTile({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    final onSurface = AppColorScheme.onSurface;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: selected
                      ? onSurface
                      : onSurface.withValues(alpha: 0.72),
                ),
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}

class _DisplaySettingsDialog extends StatefulWidget {
  final FavoritesViewModel vm;

  const _DisplaySettingsDialog({required this.vm});

  @override
  State<_DisplaySettingsDialog> createState() => _DisplaySettingsDialogState();
}

class _DisplaySettingsDialogState extends State<_DisplaySettingsDialog> {
  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      340.0,
    );
    return Dialog(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder,
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                AppLocalizations.of(context).display,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            _sectionHeader('Switch View'),
            _viewStyleRadioTile(vm, FavoritesViewStyle.home, 'Home View'),
            _viewStyleRadioTile(vm, FavoritesViewStyle.library, 'Library View'),
            Divider(color: dividerColor),
            _sectionHeader(AppLocalizations.of(context).imageType),
            for (final type in ImageType.values) _imageTypeRadioTile(vm, type),
            if (vm.imageType != ImageType.banner) ...[
              Divider(color: dividerColor),
              _sectionHeader(AppLocalizations.of(context).posterSize),
              for (final size in PosterSize.values)
                _posterSizeRadioTile(vm, size),
            ],
          ],
        ),
      ),
    );
  }

  Widget _viewStyleRadioTile(FavoritesViewModel vm, FavoritesViewStyle style, String label) {
    final selected = vm.viewStyle == style;
    final onSurface = AppColorScheme.onSurface;
    return InkWell(
      onTap: () => vm.setViewStyle(style),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: selected
                    ? onSurface
                    : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageTypeRadioTile(FavoritesViewModel vm, ImageType type) {
    final selected = vm.imageType == type;
    final onSurface = AppColorScheme.onSurface;
    return InkWell(
      onTap: () => vm.setImageType(type),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Text(
              type.name[0].toUpperCase() + type.name.substring(1),
              style: TextStyle(
                fontSize: 15,
                color: selected
                    ? onSurface
                    : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterSizeRadioTile(FavoritesViewModel vm, PosterSize size) {
    final selected = vm.posterSize == size;
    final onSurface = AppColorScheme.onSurface;
    final l10n = AppLocalizations.of(context);
    final label = switch (size) {
      PosterSize.small => l10n.small,
      PosterSize.medium => l10n.medium,
      PosterSize.large => l10n.large,
      PosterSize.extraLarge => l10n.extraLarge,
    };
    return InkWell(
      onTap: () => vm.setPosterSize(size),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: selected
                    ? onSurface
                    : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
