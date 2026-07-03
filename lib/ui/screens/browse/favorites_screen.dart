import 'dart:async';

import 'package:flutter/material.dart';
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
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/media_card.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/rating_display.dart';
import '../../widgets/horizontal_scroll_section.dart';
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
  bool _topSnapScheduled = false;
  final Map<FavoriteTypeFilter, GlobalKey<LockedFocusRowState>> _rowKeys = {};

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
    disposeGridFocusNodes();
    super.dispose();
  }

  int _lastGridItemsLength = 0;
  Object? _lastGridFirstItemId;

  void _maybeBumpGridVersion() {
    if (_vm.viewStyle != FavoritesViewStyle.library) return;
    final length = _vm.gridItems.length;
    final firstId = length == 0 ? null : _vm.gridItems.first.id;
    if (length != _lastGridItemsLength || firstId != _lastGridFirstItemId) {
      _lastGridItemsLength = length;
      _lastGridFirstItemId = firstId;
      gridContentVersion++;
      cleanupGridFocusNodes(length);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) restoreGridFocusIfNeeded();
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
    if (_vm.viewStyle != FavoritesViewStyle.library) return;
    final pos = _scrollController.position;
    if (pos.pixels > pos.maxScrollExtent - 400) {
      _vm.loadMoreGrid();
    }
  }

  double _cardWidth() {
    final desktopScale = _desktopUiScaleFactor();
    final posterSize = _vm.posterSize;
    final baseWidth = switch (_vm.imageType) {
      ImageType.thumb => posterSize.landscapeHeight * (16 / 9),
      ImageType.banner => posterSize.landscapeHeight * (16 / 9),
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * desktopScale;
  }

  double _gridBaseAspectRatio() {
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => 16 / 9,
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
      ImageType.banner => 16 / 9,
      ImageType.poster => MediaCard.aspectRatioForType(item.type),
    };
  }

  void _snapRowsToTop() {
    if (_topSnapScheduled) return;
    _topSnapScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _topSnapScheduled = false;
      if (!mounted || !_scrollController.hasClients) return;
      if (_scrollController.offset <= 1) return;
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
      );
    });
  }

  bool _onRowVerticalNavigation(
    List<FavoriteTypeFilter> visibleTypes,
    FavoriteTypeFilter currentType,
    bool isUp,
  ) {
    final currentIndex = visibleTypes.indexOf(currentType);
    final targetIndex = currentIndex + (isUp ? -1 : 1);
    if (targetIndex >= 0 && targetIndex < visibleTypes.length) {
      final targetType = visibleTypes[targetIndex];
      final targetKey = _rowKeys[targetType];
      if (targetKey != null) {
        final state = targetKey.currentState;
        if (state != null) {
          state.requestFocusFromMemory();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _rowKeys[targetType]?.currentState?.requestFocusFromMemory();
          });
        }
        final ctx = targetKey.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 300),
            alignment: 0.5,
            curve: Curves.easeInOut,
          );
        }
      }
      return true;
    }
    return false;
  }

  double _imageHeight(double aspectRatio) {
    final base = aspectRatio >= 1
        ? _vm.posterSize.landscapeHeight.toDouble()
        : _vm.posterSize.portraitHeight.toDouble();
    return base * _desktopUiScaleFactor();
  }

  String? _imageUrl(
    AggregatedItem item, {
    int? maxWidth,
    int? maxHeight,
  }) {
    final api = _vm.imageApi;
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
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final hasBackdrop = !isMobile && _backdropUrl != null;
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
          ? _buildRows()
          : _buildGrid(),
    };
  }

  Widget _buildRows() {
    if (_vm.rowItems.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noFavoritesYet,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    final isMobile = _isCompact(context);
    final navbarIsLeft = _prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final rowLeftInset = (!isMobile && navbarIsLeft) ? 56.0 : 0.0;
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final watchedBehavior = _prefs.get(UserPreferences.watchedIndicatorBehavior);
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final desktopScale = _desktopUiScaleFactor();

    final visibleTypes = <FavoriteTypeFilter>[];
    for (final type in FavoritesViewModel.rowTypes) {
      final items = _vm.rowItems[type];
      if (items != null && items.isNotEmpty) {
        visibleTypes.add(type);
      }
    }

    final rows = <Widget>[];
    for (final type in visibleTypes) {
      final items = _vm.rowItems[type]!;
      final isTopRow = rows.isEmpty;

      final ar = MediaCard.aspectRatioForType(type.itemTypes?.first);
      final imageH = _imageHeight(ar);
      final rowHeight = imageH + 102;

      _rowKeys.putIfAbsent(type, () => GlobalKey<LockedFocusRowState>());

      rows.add(
        Padding(
          padding: EdgeInsets.only(
            left: rowLeftInset,
            top: 4,
          ),
          child: HorizontalScrollSection(
            title: type.displayName,
            titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
            headerPadding: EdgeInsets.fromLTRB(
              16 * desktopScale,
              16 * desktopScale,
              8 * desktopScale,
              8 * desktopScale,
            ),
            contentSpacing: 0,
            showControls: !isMobile && PlatformDetection.useDesktopUi,
            builder: (context, scrollController) => NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                // Page in more when a horizontal scroll gets within 600px of the end.
                if (notification.metrics.axis == Axis.horizontal &&
                    notification.metrics.maxScrollExtent -
                            notification.metrics.pixels <
                        600) {
                  _vm.loadMoreForType(type);
                }
                return false;
              },
              child: LockedFocusRow<AggregatedItem>(
                key: _rowKeys[type],
                items: items,
                hubKey: 'favorites_row_${type.name}',
                controller: scrollController,
                height: rowHeight,
                itemExtent: imageH * ar,
                itemSpacing: 12 * desktopScale,
                padding: EdgeInsets.fromLTRB(
                  20 * desktopScale,
                  5 * desktopScale,
                  20 * desktopScale,
                  5 * desktopScale,
                ),
                onIndexChanged: (index, item) {
                  _onItemFocused(item);
                  if (index >= items.length - 8) {
                    _vm.loadMoreForType(type);
                  }
                },
                onVerticalNavigation: (isUp) {
                  return _onRowVerticalNavigation(visibleTypes, type, isUp);
                },
                onLongPress: (index, item) => showContextMenu(
                  context,
                  item,
                  onChanged: () => setState(() {}),
                ),
                onTap: (index, item) => context.push(
                  Destinations.itemOrPhoto(
                    item.id,
                    serverId: item.serverId,
                    type: item.type,
                  ),
                ),
                itemBuilder: (context, item, index, isFocused) {
                  final width = imageH * ar;
                  return MediaCard(
                    title: item.name,
                    subtitle: _cardSubtitle(item),
                    imageUrl: _imageUrl(
                      item,
                      maxWidth: width.toInt(),
                      maxHeight: imageH.toInt(),
                    ),
                    width: width,
                    aspectRatio: ar,
                    isFavorite: item.isFavorite,
                    isPlayed: item.isPlayed,
                    unplayedCount: item.unplayedItemCount,
                    playedPercentage: item.playedPercentage,
                    watchedBehavior: watchedBehavior,
                    itemType: item.type,
                    focusColor: focusColor,
                    cardFocusExpansion: cardFocusExpansion,
                    suppressFocusGlow: suppressFocusGlow,
                    externalIsFocused: isFocused,
                    onFocus: isMobile
                        ? null
                        : () {
                            _onItemFocused(item);
                            if (isTopRow && PlatformDetection.isTV) {
                              _snapRowsToTop();
                            }
                          },
                    onHoverStart: isMobile ? null : () => _onItemFocused(item),
                    onHoverEnd: isMobile ? null : () => _vm.setFocusedItem(null),
                    onTap: () => context.push(
                      Destinations.itemOrPhoto(
                        item.id,
                        serverId: item.serverId,
                        type: item.type,
                      ),
                    ),
                  );
                },
              ), 
            ),
          ),
        ),
      );
    }

    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.only(
        top: isMobile ? 10 : 28,
        bottom: 32,
      ),
      children: rows,
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
        final crossAxisCount =
            ((constraints.maxWidth - gridPadding * 2 + spacing) /
                    (cardWidth + spacing))
                .floor()
                .clamp(2, 20);

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
            Divider(color: dividerColor),
            _sectionHeader(AppLocalizations.of(context).posterSize),
            for (final size in PosterSize.values)
              _posterSizeRadioTile(vm, size),
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
