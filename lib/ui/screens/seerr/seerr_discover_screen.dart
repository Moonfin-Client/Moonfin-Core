import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_discover_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_glass.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/horizontal_scroll_section.dart';

const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w300';
const _tmdbBackdropBase = 'https://image.tmdb.org/t/p/w1280';

class SeerrDiscoverScreen extends StatefulWidget {
  const SeerrDiscoverScreen({super.key});

  @override
  State<SeerrDiscoverScreen> createState() =>
      _SeerrDiscoverScreenState();
}

class _SeerrDiscoverScreenState extends State<SeerrDiscoverScreen> {
  SeerrDiscoverViewModel? _viewModel;
  final _prefs = GetIt.instance<UserPreferences>();
  final _scrollController = ScrollController();

  SeerrDiscoverItem? _selectedItem;
  Timer? _selectionDebounce;
  Timer? _backdropDebounce;
  String? _backdropUrl;
  final _initialFocusNode = FocusNode(debugLabel: 'seerrDiscoverInitial');
  final _loadingHoldFocusNode =
      FocusNode(debugLabel: 'seerrDiscoverLoadingHold', skipTraversal: true);
  final _requestsEntryFocusNode = FocusNode(debugLabel: 'seerrRequestsEntry');
  int _badgeCount = 0;
  bool _initialFocusResolved = false;
  bool _isFirstRowFocused = false;
  int _firstFocusableVisibleIndex = -1;
  final Map<int, GlobalKey<LockedFocusRowState>> _rowKeys = {};
  final Map<int, ScrollController> _rowScrollControllers = {};

  GlobalKey<LockedFocusRowState> _getRowKey(int index) {
    return _rowKeys.putIfAbsent(index, () => GlobalKey<LockedFocusRowState>());
  }

  ScrollController _getRowScroll(int index) {
    return _rowScrollControllers.putIfAbsent(index, () => ScrollController());
  }

  // Touch UIs should not force focus onto items, so the initial-focus
  // machinery only runs where dpad or keyboard navigation is used.
  bool get _wantsInitialFocus => !PlatformDetection.useMobileUi;

  void _onRowLeftEdge() {
    final prefs = GetIt.instance<UserPreferences>();
    final navbarIsLeft = prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    if (!navbarIsLeft) return;
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
    }
  }

  bool _onRowVerticalNavigation(int rowIndex, bool isUp) {
    final targetIndex = isUp ? rowIndex - 1 : rowIndex + 1;
    if (targetIndex >= 0 && targetIndex < _viewModel!.rows.length) {
      final targetKey = _getRowKey(targetIndex);
      final state = targetKey.currentState;
      if (state != null) {
        state.requestFocusAt(0);
        return true;
      }
    } else if (isUp && targetIndex == -1) {
      _restoreNavbarToNormalPosition();
      // The requests entry sits between the rows and the navbar.
      if (_requestsEntryFocusNode.context != null) {
        _requestsEntryFocusNode.requestFocus();
        return true;
      }
      final prefs = GetIt.instance<UserPreferences>();
      final navbarPosition = prefs.get(UserPreferences.navbarPosition);
      if (navbarPosition == NavbarPosition.top) {
        NavigationLayout.focusNavbarNotifier.value?.call();
      }
      return true;
    }
    return false;
  }

  static const _selectionDelay = Duration(milliseconds: 150);
  static const _backdropDelay = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
    _initialFocusNode.addListener(_onInitialFocusNodeChanged);
    _initViewModel();
    if (_wantsInitialFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _initialFocusResolved) return;
        if (_loadingHoldFocusNode.context == null) return;
        _loadingHoldFocusNode.requestFocus();
      });
    }
  }

  Future<void> _initViewModel() async {
    final vm = await GetIt.instance.getAsync<SeerrDiscoverViewModel>();
    if (!mounted) return;
    vm.addListener(_onChanged);
    setState(() => _viewModel = vm);
    vm.load();
    _loadBadgeCount();
  }

  Future<void> _loadBadgeCount({bool force = false}) async {
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      final count = await repo.getActionableBadgeCount(force: force);
      if (mounted && count != _badgeCount) {
        setState(() => _badgeCount = count);
      }
    } catch (_) {}
  }

  Future<void> _openRequests() async {
    await context.push(Destinations.seerrRequests);
    _loadBadgeCount(force: true);
  }

  // Focusing the navbar can miss on the first try, so retry a few times.
  void _focusNavbarFromEntry({int attempt = 0}) {
    if (!mounted) return;
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    focusNavbar?.call();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_requestsEntryFocusNode.hasFocus) return;
      if (attempt < 3) {
        _focusNavbarFromEntry(attempt: attempt + 1);
      } else {
        FocusScope.of(context).focusInDirection(TraversalDirection.up);
      }
    });
  }

  @override
  void dispose() {
    _selectionDebounce?.cancel();
    _backdropDebounce?.cancel();
    _scrollController.dispose();
    for (final controller in _rowScrollControllers.values) {
      controller.dispose();
    }
    _viewModel?.removeListener(_onChanged);
    _prefs.removeListener(_onPrefsChanged);
    _initialFocusNode.removeListener(_onInitialFocusNodeChanged);
    _initialFocusNode.dispose();
    _loadingHoldFocusNode.dispose();
    _requestsEntryFocusNode.dispose();
    super.dispose();
  }

  void _restoreNavbarToNormalPosition() {
    if (!_scrollController.hasClients || _scrollController.offset <= 0) return;
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOut,
    );
  }

  void _setFirstRowFocused(bool focused) {
    _isFirstRowFocused = focused;
  }

  void _onInitialFocusNodeChanged() {
    if (!_initialFocusNode.hasFocus) return;
    _initialFocusResolved = true;
    _initialFocusNode.removeListener(_onInitialFocusNodeChanged);
    final targetContext = _initialFocusNode.context;
    if (!mounted || targetContext == null) return;
    // The first focusable row is always the visual top (earlier empty rows
    // collapse), so keep the list at offset 0 rather than shifting the nav off.
    if (_firstFocusableVisibleIndex >= 0) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    } else {
      Scrollable.ensureVisible(
        targetContext,
        alignment: 0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  KeyEventResult _onContentKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (!_initialFocusResolved && _loadingHoldFocusNode.hasFocus) {
      final key = event.logicalKey;
      if (key == LogicalKeyboardKey.arrowUp ||
          key == LogicalKeyboardKey.arrowDown ||
          key == LogicalKeyboardKey.arrowLeft ||
          key == LogicalKeyboardKey.arrowRight) {
        return KeyEventResult.handled;
      }
    }
    if (!event.logicalKey.isUpKey) return KeyEventResult.ignored;
    if (!_isFirstRowFocused) return KeyEventResult.ignored;

    // The requests entry sits between the rows and the navbar.
    if (_requestsEntryFocusNode.context != null) {
      _restoreNavbarToNormalPosition();
      _requestsEntryFocusNode.requestFocus();
      return KeyEventResult.handled;
    }

    _restoreNavbarToNormalPosition();
    NavigationLayout.focusNavbarNotifier.value?.call();
    return KeyEventResult.handled;
  }

  void _onPrefsChanged() {
    _viewModel?.applyRowConfig();
  }

  void _onChanged() {
    if (!mounted) return;
    setState(() {});
    if (_initialFocusResolved || !_wantsInitialFocus) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _initialFocusResolved || _initialFocusNode.hasFocus) {
        return;
      }
      final targetContext = _initialFocusNode.context;
      if (targetContext == null) return;
      FocusScope.of(targetContext).requestFocus(_initialFocusNode);
    });
  }

  bool _rowHasFocusableContent(SeerrDiscoverRow row) {
    if (row.isGenreRow) return row.genres.isNotEmpty;
    if (row.isNetworkRow) return row.networks.isNotEmpty;
    if (row.isStudioRow) return row.studios.isNotEmpty;
    return row.items.isNotEmpty;
  }

  void _onItemSelected(SeerrDiscoverItem item) {
    _selectionDebounce?.cancel();
    _selectionDebounce = Timer(_selectionDelay, () {
      if (!mounted) return;
      setState(() => _selectedItem = item);

      _backdropDebounce?.cancel();
      _backdropDebounce = Timer(_backdropDelay, () {
        if (!mounted) return;
        final backdrop = item.backdropPath;
        setState(() {
          _backdropUrl = backdrop != null ? '$_tmdbBackdropBase$backdrop' : null;
        });
      });
    });
  }

  void _onItemTap(SeerrDiscoverItem item) {
    final mediaType = item.mediaType ?? 'movie';
    context.push(
      Destinations.seerrMedia(item.id.toString()),
      extra: {'mediaType': mediaType},
    );
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(
        // On mobile the target is never attached (no row autofocuses it), so
        // RequestInitialFocus simply finds nothing to focus and gives up.
        targetNode: _initialFocusNode,
        child: _buildScreenContent(context),
      );

  Widget _buildScreenContent(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    final prefs = GetIt.instance<UserPreferences>();
    final navbarPosition = prefs.get(UserPreferences.navbarPosition);
    final backdropEnabled = prefs.get(UserPreferences.backdropEnabled);
    final navbarHeight = navbarPosition == NavbarPosition.top
        ? (PlatformDetection.isTV ? 95.0 : PlatformDetection.useMobileUi ? 60.0 : 80.0)
        : 0.0;
    final navbarIsLeft = navbarPosition == NavbarPosition.left;
    final tvTopNavbarInset =
        navbarPosition == NavbarPosition.top && PlatformDetection.isTV && !PlatformDetection.useMobileUi
        ? 48.0
        : 0.0;
    final rowLeftInset =
        ((navbarIsLeft && !PlatformDetection.useMobileUi)
            ? 56.0
            : tvTopNavbarInset) +
        (!PlatformDetection.useMobileUi ? 16.0 : 0.0);
    final infoPanelLeft =
        ((navbarIsLeft && !PlatformDetection.useMobileUi) ? 80.0 : 48.0) +
        (!PlatformDetection.useMobileUi ? 16.0 : 0.0);
    final infoTopInset = topPad + (navbarHeight > 0 ? navbarHeight - 12.0 : 28.0);
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (backdropEnabled) _Backdrop(url: _backdropUrl),
            const _GradientScrim(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoPanel(item: _selectedItem, topInset: infoTopInset, leftInset: infoPanelLeft),
                Expanded(
                  child: Focus(
                    focusNode: _loadingHoldFocusNode,
                    canRequestFocus: !_initialFocusResolved,
                    skipTraversal: true,
                    onKeyEvent: _onContentKeyEvent,
                    child: _buildContent(rowLeftInset: rowLeftInset),
                  ),
                ),
              ],
            ),
            Positioned(
              // On phones the navbar pill and row titles crowd the top edge,
              // so the entry drops below them.
              top: PlatformDetection.useMobileUi
                  ? infoTopInset + 40.0
                  : infoTopInset,
              right: 24,
              child: _RequestsEntryButton(
                focusNode: _requestsEntryFocusNode,
                badgeCount: _badgeCount,
                onTap: _openRequests,
                onDown: () => _initialFocusNode.requestFocus(),
                onUp: _focusNavbarFromEntry,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent({double rowLeftInset = 0.0}) {
    final l10n = AppLocalizations.of(context);
    final vm = _viewModel;
    if (vm == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.error != null && vm.rows.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              vm.error!,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: vm.refresh,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    final rows = vm.rows;
    if (rows.isEmpty && vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    _firstFocusableVisibleIndex = -1;
    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      if (row.isLoading) {
        break;
      }
      if (_rowHasFocusableContent(row)) {
        _firstFocusableVisibleIndex = i;
        break;
      }
    }

    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(left: rowLeftInset, bottom: 32),
      itemCount: rows.length,
      scrollCacheExtent: const ScrollCacheExtent.pixels(600.0),
      itemBuilder: (context, index) {
        final row = rows[index];
        if (!row.isLoading && !_rowHasFocusableContent(row)) {
          return const SizedBox.shrink();
        }
        final isFirstFocusableRow = index == _firstFocusableVisibleIndex;
        final autofocusRow = isFirstFocusableRow && _wantsInitialFocus;
        final firstNode = autofocusRow ? _initialFocusNode : null;
        Widget rowWidget;
        if (row.isGenreRow) {
          rowWidget = _buildGenreRow(
            row,
            index,
            isFirstVisibleRow: isFirstFocusableRow,
            autofocusFirst: autofocusRow,
            firstFocusNode: firstNode,
          );
        } else if (row.isNetworkRow) {
          rowWidget = _buildNetworkRow(
            row,
            index,
            isFirstVisibleRow: isFirstFocusableRow,
            autofocusFirst: autofocusRow,
            firstFocusNode: firstNode,
          );
        } else if (row.isStudioRow) {
          rowWidget = _buildStudioRow(
            row,
            index,
            isFirstVisibleRow: isFirstFocusableRow,
            autofocusFirst: autofocusRow,
            firstFocusNode: firstNode,
          );
        } else {
          rowWidget = _buildMediaRow(
            row,
            index,
            isFirstVisibleRow: isFirstFocusableRow,
            autofocusFirst: autofocusRow,
            firstFocusNode: firstNode,
          );
        }
        return Builder(
          builder: (rowContext) => Focus(
            skipTraversal: true,
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                if (index == _firstFocusableVisibleIndex) {
                  if (_scrollController.hasClients) {
                    _scrollController.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 240),
                      curve: Curves.easeInOut,
                    );
                  }
                } else {
                  Scrollable.ensureVisible(
                    rowContext,
                    alignment: 0.0,
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeInOut,
                  );
                }
              }
            },
            child: rowWidget,
          ),
        );
      },
    );
  }

  Widget _buildRowContainer({
    required String title,
    required double rowHeight,
    required bool isLoading,
    required bool hasItems,
    required ScrollController scrollController,
    required Widget child,
  }) {
    final l10n = AppLocalizations.of(context);
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
    final showControls = hasItems && PlatformDetection.useDesktopUi;

    return HorizontalScrollSection(
      title: title,
      scrollController: scrollController,
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
      showControls: showControls,
      builder: (context, controller) {
        return SizedBox(
          height: (rowHeight + 10) * desktopScale,
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : hasItems
                  ? child
                  : Center(
                      child: Text(
                        l10n.noItems,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(128),
                            ),
                      ),
                    ),
        );
      },
    );
  }

  Widget _buildMediaRow(
    SeerrDiscoverRow row,
    int rowIndex, {
    bool isFirstVisibleRow = false,
    bool autofocusFirst = false,
    FocusNode? firstFocusNode,
  }) {
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final focusColor =
      Color(GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue);
    final cardExpansion =
      GetIt.instance<UserPreferences>().get(UserPreferences.cardFocusExpansion);
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;

    final focusKey = _getRowKey(rowIndex);
    final child = NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification &&
            notification.metrics.extentAfter < 300 &&
            row.hasMore &&
            !row.isLoading) {
          _viewModel?.loadMore(rowIndex);
        }
        return false;
      },
      child: LockedFocusRow<SeerrDiscoverItem>(
        key: focusKey,
        items: row.items,
        hubKey: 'seerr_discover_media_${rowIndex}_${row.title}',
        controller: _getRowScroll(rowIndex),
        itemExtent: 130,
        itemSpacing: 12 * desktopScale,
        height: 260 * desktopScale,
        clipBehavior: Clip.none,
        padding: EdgeInsets.fromLTRB(
          20 * desktopScale,
          5 * desktopScale,
          20 * desktopScale,
          5 * desktopScale,
        ),
        onLeftEdge: _onRowLeftEdge,
        onVerticalNavigation: (isUp) => _onRowVerticalNavigation(rowIndex, isUp),
        onTap: (index, item) => _onItemTap(item),
        onIndexChanged: (index, item) {
          _onItemSelected(item);
          if (rowIndex == 0) {
            _setFirstRowFocused(true);
            _restoreNavbarToNormalPosition();
          }
        },
        onFocusChange: (has) {
          if (rowIndex == 0) {
            _setFirstRowFocused(has);
          }
        },
        autofocus: autofocusFirst,
        focusNode: autofocusFirst ? firstFocusNode : null,
        itemBuilder: (context, item, index, isFocused) {
          return MediaCard(
            title: item.displayTitle,
            subtitle: _yearFromItem(item),
            imageUrl: item.posterPath != null
                ? '$_tmdbPosterBase${item.posterPath}'
                : null,
            width: 130,
            aspectRatio: 2 / 3,
            seerrMediaType: item.mediaType,
            seerrStatus: item.mediaInfo?.status,
            focusColor: focusColor,
            cardFocusExpansion: cardExpansion,
            suppressFocusGlow: suppressFocusGlow,
            externalIsFocused: isFocused,
            onTap: () => _onItemTap(item),
            onHoverStart: () => _onItemSelected(item),
          );
        },
      ),
    );

    return _buildRowContainer(
      title: row.title,
      rowHeight: 260,
      isLoading: row.isLoading && row.items.isEmpty,
      hasItems: row.items.isNotEmpty,
      scrollController: _getRowScroll(rowIndex),
      child: child,
    );
  }

  Widget _buildGenreRow(
    SeerrDiscoverRow row,
    int rowIndex, {
    bool isFirstVisibleRow = false,
    bool autofocusFirst = false,
    FocusNode? firstFocusNode,
  }) {
    final mediaType = row.type == SeerrRowType.movieGenres ? 'movie' : 'tv';
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;

    final focusKey = _getRowKey(rowIndex);
    final child = LockedFocusRow<SeerrGenre>(
      key: focusKey,
      items: row.genres,
      hubKey: 'seerr_discover_genres_${rowIndex}_${row.title}',
      controller: _getRowScroll(rowIndex),
      itemExtent: 180,
      itemSpacing: 12 * desktopScale,
      height: 90 * desktopScale,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(
        20 * desktopScale,
        5 * desktopScale,
        20 * desktopScale,
        5 * desktopScale,
      ),
      onLeftEdge: _onRowLeftEdge,
      onVerticalNavigation: (isUp) => _onRowVerticalNavigation(rowIndex, isUp),
      onTap: (index, genre) {
        final uri = Uri(
          path: Destinations.seerrBrowse,
          queryParameters: {
            'filterId': genre.id.toString(),
            'filterName': genre.name,
            'mediaType': mediaType,
            'filterType': 'genre',
          },
        );
        context.push(uri.toString());
      },
      onIndexChanged: (index, genre) {
        if (rowIndex == 0) {
          _setFirstRowFocused(true);
          _restoreNavbarToNormalPosition();
        }
      },
      onFocusChange: (has) {
        if (rowIndex == 0) {
          _setFirstRowFocused(has);
        }
      },
      autofocus: autofocusFirst,
      focusNode: autofocusFirst ? firstFocusNode : null,
      itemBuilder: (context, genre, index, isFocused) {
        final backdrop = genre.backdrops.isNotEmpty
            ? '$_tmdbBackdropBase${genre.backdrops.first}'
            : null;
        return _GenreCard(
          name: genre.name,
          imageUrl: backdrop,
          externalIsFocused: isFocused,
          onTap: () {
            final uri = Uri(
              path: Destinations.seerrBrowse,
              queryParameters: {
                'filterId': genre.id.toString(),
                'filterName': genre.name,
                'mediaType': mediaType,
                'filterType': 'genre',
              },
            );
            context.push(uri.toString());
          },
        );
      },
    );

    return _buildRowContainer(
      title: row.title,
      rowHeight: 90,
      isLoading: row.isLoading && row.genres.isEmpty,
      hasItems: row.genres.isNotEmpty,
      scrollController: _getRowScroll(rowIndex),
      child: child,
    );
  }

  Widget _buildNetworkRow(
    SeerrDiscoverRow row,
    int rowIndex, {
    bool isFirstVisibleRow = false,
    bool autofocusFirst = false,
    FocusNode? firstFocusNode,
  }) {
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;

    final focusKey = _getRowKey(rowIndex);
    final child = LockedFocusRow<SeerrNetwork>(
      key: focusKey,
      items: row.networks,
      hubKey: 'seerr_discover_networks_${rowIndex}_${row.title}',
      controller: _getRowScroll(rowIndex),
      itemExtent: 180,
      itemSpacing: 12 * desktopScale,
      height: 90 * desktopScale,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(
        20 * desktopScale,
        5 * desktopScale,
        20 * desktopScale,
        5 * desktopScale,
      ),
      onLeftEdge: _onRowLeftEdge,
      onVerticalNavigation: (isUp) => _onRowVerticalNavigation(rowIndex, isUp),
      onTap: (index, network) {
        final uri = Uri(
          path: Destinations.seerrBrowse,
          queryParameters: {
            'filterId': network.id.toString(),
            'filterName': network.name,
            'mediaType': 'tv',
            'filterType': 'network',
          },
        );
        context.push(uri.toString());
      },
      onIndexChanged: (index, network) {
        if (rowIndex == 0) {
          _setFirstRowFocused(true);
          _restoreNavbarToNormalPosition();
        }
      },
      onFocusChange: (has) {
        if (rowIndex == 0) {
          _setFirstRowFocused(has);
        }
      },
      autofocus: autofocusFirst,
      focusNode: autofocusFirst ? firstFocusNode : null,
      itemBuilder: (context, network, index, isFocused) {
        return _LogoCard(
          name: network.name,
          logoUrl: network.logoPath,
          externalIsFocused: isFocused,
          onTap: () {
            final uri = Uri(
              path: Destinations.seerrBrowse,
              queryParameters: {
                'filterId': network.id.toString(),
                'filterName': network.name,
                'mediaType': 'tv',
                'filterType': 'network',
              },
            );
            context.push(uri.toString());
          },
        );
      },
    );

    return _buildRowContainer(
      title: row.title,
      rowHeight: 90,
      isLoading: row.isLoading && row.networks.isEmpty,
      hasItems: row.networks.isNotEmpty,
      scrollController: _getRowScroll(rowIndex),
      child: child,
    );
  }

  Widget _buildStudioRow(
    SeerrDiscoverRow row,
    int rowIndex, {
    bool isFirstVisibleRow = false,
    bool autofocusFirst = false,
    FocusNode? firstFocusNode,
  }) {
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;

    final focusKey = _getRowKey(rowIndex);
    final child = LockedFocusRow<SeerrStudio>(
      key: focusKey,
      items: row.studios,
      hubKey: 'seerr_discover_studios_${rowIndex}_${row.title}',
      controller: _getRowScroll(rowIndex),
      itemExtent: 180,
      itemSpacing: 12 * desktopScale,
      height: 90 * desktopScale,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(
        20 * desktopScale,
        5 * desktopScale,
        20 * desktopScale,
        5 * desktopScale,
      ),
      onLeftEdge: _onRowLeftEdge,
      onVerticalNavigation: (isUp) => _onRowVerticalNavigation(rowIndex, isUp),
      onTap: (index, studio) {
        final uri = Uri(
          path: Destinations.seerrBrowse,
          queryParameters: {
            'filterId': studio.id.toString(),
            'filterName': studio.name,
            'mediaType': 'movie',
            'filterType': 'studio',
          },
        );
        context.push(uri.toString());
      },
      onIndexChanged: (index, studio) {
        if (rowIndex == 0) {
          _setFirstRowFocused(true);
          _restoreNavbarToNormalPosition();
        }
      },
      onFocusChange: (has) {
        if (rowIndex == 0) {
          _setFirstRowFocused(has);
        }
      },
      autofocus: autofocusFirst,
      focusNode: autofocusFirst ? firstFocusNode : null,
      itemBuilder: (context, studio, index, isFocused) {
        return _LogoCard(
          name: studio.name,
          logoUrl: studio.logoPath,
          externalIsFocused: isFocused,
          onTap: () {
            final uri = Uri(
              path: Destinations.seerrBrowse,
              queryParameters: {
                'filterId': studio.id.toString(),
                'filterName': studio.name,
                'mediaType': 'movie',
                'filterType': 'studio',
              },
            );
            context.push(uri.toString());
          },
        );
      },
    );

    return _buildRowContainer(
      title: row.title,
      rowHeight: 90,
      isLoading: row.isLoading && row.studios.isEmpty,
      hasItems: row.studios.isNotEmpty,
      scrollController: _getRowScroll(rowIndex),
      child: child,
    );
  }

  static String? _yearFromItem(SeerrDiscoverItem item) {
    final date = item.releaseDate ?? item.firstAirDate;
    if (date == null || date.length < 4) return null;
    return date.substring(0, 4);
  }
}
class _Backdrop extends StatelessWidget {
  final String? url;
  const _Backdrop({this.url});

  @override
  Widget build(BuildContext context) {
    return FullscreenBackdropSwitcher(
      imageUrl: url,
      duration: const Duration(milliseconds: 600),
      fadeInDuration: Duration.zero,
    );
  }
}

class _GradientScrim extends StatelessWidget {
  const _GradientScrim();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColorScheme.scrim.withValues(alpha: 0.8),
            AppColorScheme.scrim.withValues(alpha: 0.33),
            AppColorScheme.scrim.withValues(alpha: 0.87),
          ],
          stops: [0.0, 0.25, 0.6],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  final SeerrDiscoverItem? item;
  final double topInset;
  final double leftInset;
  const _InfoPanel({this.item, required this.topInset, this.leftInset = 48.0});

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox(height: 120);

    final theme = Theme.of(context);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final shadows = [
      Shadow(
        blurRadius: 4,
        color: isNeon ? Colors.black : AppColorScheme.scrim.withValues(alpha: 0.54),
      ),
      if (isNeon)
        const Shadow(
          blurRadius: 10,
          color: Colors.black,
        ),
    ];
    final year = _SeerrDiscoverScreenState._yearFromItem(item!);
    final rating = item!.voteAverage;
    final l10n = AppLocalizations.of(context);
    final mediaType = item!.mediaType == 'tv' ? l10n.series : l10n.movie;

    final secondaryColor = isNeon
        ? AppColorScheme.onSurface
        : AppColorScheme.onSurface.withValues(alpha: 0.7);
    final tertiaryColor = isNeon
        ? AppColorScheme.onSurface
        : AppColorScheme.onSurface.withValues(alpha: 0.54);
    final overviewColor = isNeon
        ? AppColorScheme.onSurface
        : AppColorScheme.onSurface.withValues(alpha: 0.8);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        key: ValueKey(item!.id),
        padding: EdgeInsets.fromLTRB(leftInset, topInset, 48, 2),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item!.displayTitle,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  shadows: shadows,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  if (year != null)
                    Text(year,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: secondaryColor,
                          shadows: shadows,
                        )),
                  if (year != null && rating != null)
                    const SizedBox(width: 12),
                  if (rating != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 16, color: AppColors.orange500),
                        const SizedBox(width: 4),
                        Text(
                          rating.toStringAsFixed(1),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: secondaryColor,
                            shadows: shadows,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(width: 12),
                  Text(mediaType,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: tertiaryColor,
                        shadows: shadows,
                      )),
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: (theme.textTheme.bodySmall?.fontSize ?? 12) * 1.4 * 3 + 8.0,
                child: item!.overview != null && item!.overview!.isNotEmpty
                    ? Text(
                        item!.overview!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: overviewColor,
                          shadows: shadows,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenreCard extends StatefulWidget {
  final String name;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool? externalIsFocused;

  const _GenreCard({
    required this.name,
    this.imageUrl,
    this.onTap,
    this.externalIsFocused,
  });

  @override
  State<_GenreCard> createState() => _GenreCardState();
}

class _GenreCardState extends State<_GenreCard> with FocusStateMixin {

  @override
  Widget build(BuildContext context) {
    final focusColor =
        Color(GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue);
    final externallyDriven = widget.externalIsFocused != null;
    final effectiveFocused = widget.externalIsFocused ?? (focused || hovered);

    final inner = GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: AnimatedScale(
          scale: effectiveFocused ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: SizedBox(
            width: 180,
            height: 90,
            child: ClipRRect(
              borderRadius: AppRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (widget.imageUrl != null)
                    CachedNetworkImage(
                      imageUrl: widget.imageUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => Container(
                        color: AppColorScheme.surfaceVariant,
                      ),
                    )
                  else
                    Container(color: AppColorScheme.surfaceVariant),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColorScheme.scrim.withValues(alpha: 0),
                          AppColorScheme.scrim.withValues(alpha: 0.73),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: AppColorScheme.scrim,
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (effectiveFocused)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          ThemeRegistry.active.borders.focusBorder.copyWith(
                            color: focusColor,
                            width: 2,
                          ),
                        ),
                        borderRadius: AppRadius.circular(8),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (externallyDriven) return inner;

    return Focus(
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          widget.onTap?.call();
        }
        return KeyEventResult.handled;
      },
      onFocusChange: setFocused,
      child: inner,
    );
  }
}

class _LogoCard extends StatefulWidget {
  final String name;
  final String? logoUrl;
  final VoidCallback? onTap;
  final bool? externalIsFocused;

  const _LogoCard({
    required this.name,
    this.logoUrl,
    this.onTap,
    this.externalIsFocused,
  });

  @override
  State<_LogoCard> createState() => _LogoCardState();
}

class _LogoCardState extends State<_LogoCard> with FocusStateMixin {

  @override
  Widget build(BuildContext context) {
    final focusColor =
        Color(GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue);
    final externallyDriven = widget.externalIsFocused != null;
    final effectiveFocused = widget.externalIsFocused ?? (focused || hovered);

    final inner = GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: AnimatedScale(
          scale: effectiveFocused ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: SizedBox(
            width: 180,
            height: 90,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColorScheme.surface,
                borderRadius: AppRadius.circular(8),
                border: effectiveFocused
                    ? Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: focusColor,
                          width: 2,
                        ),
                      )
                    : null,
              ),
              child: widget.logoUrl != null
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.logoUrl!,
                        fit: BoxFit.contain,
                        errorWidget: (_, _, _) => Center(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );

    if (externallyDriven) return inner;

    return Focus(
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          widget.onTap?.call();
        }
        return KeyEventResult.handled;
      },
      onFocusChange: setFocused,
      child: inner,
    );
  }
}

class _RequestsEntryButton extends StatefulWidget {
  final FocusNode focusNode;
  final int badgeCount;
  final VoidCallback onTap;
  final VoidCallback onDown;
  final VoidCallback onUp;

  const _RequestsEntryButton({
    required this.focusNode,
    required this.badgeCount,
    required this.onTap,
    required this.onDown,
    required this.onUp,
  });

  @override
  State<_RequestsEntryButton> createState() => _RequestsEntryButtonState();
}

class _RequestsEntryButtonState extends State<_RequestsEntryButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        final key = event.logicalKey;
        if (key.isSelectKey) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        if (key.isDownKey) {
          widget.onDown();
          return KeyEventResult.handled;
        }
        if (key.isUpKey) {
          widget.onUp();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(999),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder
                        ? focusColor
                        : AppColorScheme.onSurface.withValues(alpha: 0.24),
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
                boxShadow: showFocusBorder
                    ? ThemeRegistry.active.borders.focusGlow
                    : null,
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circular(999),
                child: adaptiveGlass(
                  context: context,
                  fallbackColor: AppColorScheme.surface.withValues(alpha: 0.8),
                  cornerRadius: 999,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.move_to_inbox_outlined,
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.seerrRequestsTitle,
                          style: TextStyle(
                            color: AppColorScheme.onSurface,
                            fontSize: 13.5,
                          ),
                        ),
                        if (widget.badgeCount > 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: AppColorScheme.accent,
                              borderRadius: AppRadius.circular(10),
                            ),
                            child: Text(
                              '${widget.badgeCount}',
                              style: TextStyle(
                                color: AppColorScheme.onAccent,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
