import 'dart:async';

import '../../widgets/offline_aware_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:playback_core/playback_core.dart';
import '../../../data/services/media_server_client_factory.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/overlay_sheet.dart';

Color get _navyBackground => AppColorScheme.background;

double get _horizontalPadding => PlatformDetection.useMobileUi ? 20.0 : 60.0;
double get _cardSize => PlatformDetection.useMobileUi
    ? 112.0
    : (PlatformDetection.isTV ? 168.0 : 148.0);
const _cardSpacing = 12.0;

/// music library category shown in the chip bar (mobile/TV) and the desktop
/// rail, routing to the matching all-items screen.
class _MusicCategory {
  final IconData icon;
  final String label;
  final String route;
  const _MusicCategory(this.icon, this.label, this.route);
}

List<_MusicCategory> _musicCategories(BuildContext context, String libraryId) {
  final l10n = AppLocalizations.of(context);
  return [
    _MusicCategory(
      Icons.album,
      l10n.albums,
      Destinations.library(libraryId, includeItemTypes: const ['MusicAlbum']),
    ),
    _MusicCategory(
      Icons.person,
      l10n.artists,
      Destinations.library(libraryId, includeItemTypes: const ['AlbumArtist']),
    ),
    _MusicCategory(
      Icons.queue_music,
      l10n.playlists,
      Destinations.library(libraryId, includeItemTypes: const ['Playlist']),
    ),
    _MusicCategory(
      Icons.category,
      l10n.genres,
      Destinations.libraryGenresOf(libraryId),
    ),
    _MusicCategory(
      Icons.favorite,
      l10n.favorites,
      Destinations.musicFavoritesOf(libraryId),
    ),
  ];
}

class MusicBrowseScreen extends StatefulWidget {
  final String libraryId;

  const MusicBrowseScreen({super.key, required this.libraryId});

  @override
  State<MusicBrowseScreen> createState() => _MusicBrowseScreenState();
}

class _MusicBrowseScreenState extends State<MusicBrowseScreen> {
  late final MusicBrowseViewModel _vm;
  final _backgroundService = GetIt.instance<BackgroundService>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;

  @override
  void initState() {
    super.initState();
    _vm = MusicBrowseViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
    );
    _vm.addListener(_onChanged);
    _vm.load();
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
  }

  @override
  void dispose() {
    _backgroundSub?.cancel();
    _vm.removeListener(_onChanged);
    _vm.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onItemFocused(AggregatedItem item) {
    _vm.setFocusedItem(item);
    _backgroundService.setBackground(item);
  }

  void _onItemTap(AggregatedItem item) {
    if (item.type == 'Audio') {
      unawaited(_playTrackDirectly(context, item));
      return;
    }
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  void _showFilterDialog(BuildContext context) {
    OverlaySheetController.show<void>(
      context,
      builder: (sheetContext) => _MusicRowVisibilityDialog(
        libraryName: _vm.libraryName,
        onChanged: () => _vm.load(),
      ),
    );
  }

  VoidCallback? _seeAllForRow(String rowId) {
    String? route;
    if (rowId.startsWith('musicalbum_')) {
      route = Destinations.library(
        widget.libraryId,
        includeItemTypes: const ['MusicAlbum'],
      );
    } else if (rowId.startsWith('albumartist_')) {
      route = Destinations.library(
        widget.libraryId,
        includeItemTypes: const ['AlbumArtist'],
      );
    } else if (rowId.startsWith('musicartist_')) {
      route = Destinations.library(
        widget.libraryId,
        includeItemTypes: const ['MusicArtist'],
      );
    } else if (rowId == 'playlists') {
      route = Destinations.library(
        widget.libraryId,
        includeItemTypes: const ['Playlist'],
      );
    } else if (rowId.startsWith('favorites_')) {
      route = Destinations.musicFavoritesOf(widget.libraryId);
    }
    if (route == null) return null;
    final target = route;
    return () => context.push(target);
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isMobile = PlatformDetection.useMobileUi;
    final isDesktop = PlatformDetection.useDesktopUi;
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
              color: _navyBackground.withAlpha(hasBackdrop ? 140 : 191),
            ),
          ),
          Row(
            children: [
              if (isDesktop)
                _MusicCategoryRail(
                  libraryId: widget.libraryId,
                  libraryName: _vm.libraryName,
                ),
              Expanded(
                child: Column(
            children: [
              _MusicHeader(
                libraryName: _vm.libraryName,
                focusedItem: _vm.focusedItem,
                vm: _vm,
                onFilterTap: () => _showFilterDialog(context),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _vm.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColorScheme.accent,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: _vm.refresh,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final screenHeight = MediaQuery.of(context).size.height;
                            final bottomPadding = screenHeight > 0 ? screenHeight / 2 : 400.0;
                            return ListView.builder(
                              padding: EdgeInsets.only(top: 24, bottom: bottomPadding),
                              itemCount: _vm.rows.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  final featured = _vm.featuredItem;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (featured != null)
                                        _MusicHero(
                                          key: ValueKey('hero_${featured.id}'),
                                          item: featured,
                                          imageUrl: _vm.getMusicImageUrl(featured),
                                          subtitle: _vm.getMusicSubtitle(featured),
                                          onFocused: () => _onItemFocused(featured),
                                        ),
                                      if (!isDesktop)
                                        _MusicCategoryBar(
                                          key: const ValueKey('category_bar'),
                                          libraryId: widget.libraryId,
                                        ),
                                    ],
                                  );
                                }
                                final row = _vm.rows[index - 1];
                                return _MusicItemRow(
                                  key: ValueKey(row.id),
                                  title: localizeHomeRowTitle(
                                    row: row,
                                    l10n: l10n,
                                  ),
                                  items: row.items,
                                  imageApi: _vm.imageApi,
                                  getSubtitle: _vm.getMusicSubtitle,
                                  getImageUrl: _vm.getMusicImageUrl,
                                  onFocused: _onItemFocused,
                                  onTap: _onItemTap,
                                  onLoadMore: () => _vm.loadMoreForRow(index - 1),
                                  onSeeAll: _seeAllForRow(row.id),
                                );
                              },
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MusicHeader extends StatelessWidget {
  final String libraryName;
  final AggregatedItem? focusedItem;
  final MusicBrowseViewModel vm;
  final VoidCallback onFilterTap;

  const _MusicHeader({
    required this.libraryName,
    this.focusedItem,
    required this.vm,
    required this.onFilterTap,
  });

  String? _getHeaderSubtitle(AggregatedItem item, MusicBrowseViewModel vm) {
    final sub = vm.getMusicSubtitle(item);
    final year = item.productionYear;
    if (item.type == 'MusicAlbum' || item.type == 'Audio') {
      if (sub.isNotEmpty && year != null) {
        return '$sub ($year)';
      } else if (sub.isNotEmpty) {
        return sub;
      } else if (year != null) {
        return '$year';
      }
      return null;
    }
    if (sub.isNotEmpty) return sub;
    if (year != null) return '$year';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        _horizontalPadding,
        topPad + 8,
        _horizontalPadding,
        4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // The desktop rail already shows the library title.
          if (!PlatformDetection.useDesktopUi) ...[
            Center(
              child: Text(
                libraryName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
          Row(
            children: [
              FocusableToolbarButton(
                icon: Icons.home,
                size: 52,
                iconSize: 28,
                variant: ToolbarButtonVariant.translucent,
                scaleOnFocus:
                    GetIt.instance<UserPreferences>().get(
                      UserPreferences.cardFocusExpansion,
                    )
                    ? 1.05
                    : 1.0,
                onTap: () => context.go(Destinations.home),
              ),
              const SizedBox(width: 12),
              FocusableToolbarButton(
                icon: Icons.filter_alt,
                size: 52,
                iconSize: 28,
                variant: ToolbarButtonVariant.translucent,
                scaleOnFocus:
                    GetIt.instance<UserPreferences>().get(
                      UserPreferences.cardFocusExpansion,
                    )
                    ? 1.05
                    : 1.0,
                onTap: onFilterTap,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: focusedItem != null
                      ? Builder(
                          builder: (context) {
                            final subtitle = _getHeaderSubtitle(focusedItem!, vm);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  focusedItem!.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                    color: AppColorScheme.onSurface,
                                  ),
                                ),
                                if (subtitle != null)
                                  Text(
                                    subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.1,
                                      color: AppColorScheme.onSurface.withAlpha(179),
                                    ),
                                  ),
                              ],
                            );
                          }
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Featured/resume hero at the top of the library: large album art, name and
/// subtitle, with a Play affordance. Focusable for D-pad; tapping (or Play)
/// opens the item detail, which already owns playback.
class _MusicHero extends StatefulWidget {
  final AggregatedItem item;
  final String? imageUrl;
  final String subtitle;
  final VoidCallback onFocused;

  const _MusicHero({
    super.key,
    required this.item,
    required this.imageUrl,
    required this.subtitle,
    required this.onFocused,
  });

  @override
  State<_MusicHero> createState() => _MusicHeroState();
}

class _MusicHeroState extends State<_MusicHero> with FocusStateMixin {
  void _open({bool play = true}) {
    if (widget.item.type == 'Audio') {
      unawaited(_playTrackDirectly(context, widget.item));
      return;
    }
    context.push(
      Destinations.item(
        widget.item.id,
        serverId: widget.item.serverId,
        autoPlay: play,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformDetection.useMobileUi;
    final height = isMobile ? 108.0 : (PlatformDetection.isTV ? 220.0 : 168.0);
    final activeTheme = ThemeRegistry.active;
    final isNeon = activeTheme.id == ThemeRegistry.neonPulseId;
    final focusColor = this.focusColor;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        _horizontalPadding,
        isMobile ? 4 : 8,
        _horizontalPadding,
        isMobile ? 8 : 12,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: Focus(
          onFocusChange: (hasFocus) {
            setFocused(hasFocus);
            if (hasFocus) widget.onFocused();
          },
          onKeyEvent: (_, event) {
            if (isActivateKey(event)) {
              _open();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: () => _open(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(16),
                color: AppColorScheme.onSurface.withAlpha(showFocusBorder ? 38 : 18),
                border: showFocusBorder
                    ? Border.fromBorderSide(
                        activeTheme.borders.focusBorder.copyWith(
                          color: focusColor,
                          width: 2.4,
                        ),
                      )
                    : null,
                boxShadow: showFocusBorder && !isNeon
                    ? [
                        BoxShadow(
                          color: AppColorScheme.accent.withAlpha(120),
                          blurRadius: 18,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: widget.imageUrl != null
                        ? OfflineAwareImage(
                            imageUrl: widget.imageUrl!,
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => _heroArtPlaceholder(),
                          )
                        : _heroArtPlaceholder(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 14 : 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'JUMP BACK IN',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                              color: AppColorScheme.accent,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 24,
                              fontWeight: FontWeight.w800,
                              color: AppColorScheme.onSurface,
                            ),
                          ),
                          if (widget.subtitle.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Text(
                              widget.subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: isMobile ? 13 : 15,
                                color: AppColorScheme.onSurface.withAlpha(179),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: isMobile ? 14 : 24),
                    child: GestureDetector(
                      onTap: () => _open(play: true),
                      child: Container(
                        width: isMobile ? 40 : 52,
                        height: isMobile ? 40 : 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorScheme.accent,
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: AppColorScheme.onAccent,
                          size: isMobile ? 26 : 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _heroArtPlaceholder() => Container(
    color: AppColorScheme.onSurface.withAlpha(20),
    child: Center(
      child: Icon(
        Icons.album,
        size: 40,
        color: AppColorScheme.onSurface.withAlpha(51),
      ),
    ),
  );
}

/// Horizontal category chips (mobile / TV) under the hero.
class _MusicCategoryBar extends StatefulWidget {
  final String libraryId;
  const _MusicCategoryBar({super.key, required this.libraryId});

  @override
  State<_MusicCategoryBar> createState() => _MusicCategoryBarState();
}

class _MusicCategoryBarState extends State<_MusicCategoryBar>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void _ensureVisible(bool isFirst) {
    if (!mounted) return;
    Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeInOut,
    );
    if (isFirst && _scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final categories = _musicCategories(context, widget.libraryId);
    return SizedBox(
      height: 56,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: EdgeInsets.fromLTRB(_horizontalPadding, 6, _horizontalPadding, 8),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final c = categories[i];
          return _CategoryButton(
            icon: c.icon,
            label: c.label,
            isFirst: i == 0,
            isLast: i == categories.length - 1,
            onFocused: () => _ensureVisible(i == 0),
            onTap: () => context.push(c.route),
          );
        },
      ),
    );
  }
}

/// Vertical category rail shown on the left of the desktop layout.
class _MusicCategoryRail extends StatelessWidget {
  final String libraryId;
  final String libraryName;
  const _MusicCategoryRail({
    required this.libraryId,
    required this.libraryName,
  });

  @override
  Widget build(BuildContext context) {
    final categories = _musicCategories(context, libraryId);
    final title = libraryName.isEmpty
        ? AppLocalizations.of(context).music
        : libraryName;
    return Container(
      width: 244,
      color: AppColorScheme.onSurface.withAlpha(12),
      child: SafeArea(
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 24, 20, 18),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categories.length,
                separatorBuilder: (_, _) => const SizedBox(height: 4),
                itemBuilder: (context, i) {
                  final c = categories[i];
                  return _CategoryButton(
                    icon: c.icon,
                    label: c.label,
                    vertical: true,
                    onTap: () => context.push(c.route),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A focusable category control rendered either as a horizontal pill (chip
/// bar) or a full-width tile (desktop rail)
class _CategoryButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final VoidCallback? onFocused;
  final bool isFirst;
  final bool isLast;
  final bool vertical;

  const _CategoryButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.onFocused,
    this.isFirst = false,
    this.isLast = false,
    this.vertical = false,
  });

  @override
  State<_CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<_CategoryButton> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final active = showFocusBorder;
    final fg = active
        ? AppColorScheme.onAccent
        : AppColorScheme.onSurface.withAlpha(220);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        onFocusChange: (hasFocus) {
          setFocused(hasFocus);
          if (hasFocus) widget.onFocused?.call();
        },
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          if (event.isActionable && !widget.vertical) {
            if (widget.isFirst && event.logicalKey.isLeftKey) {
              return KeyEventResult.handled;
            }
            if (widget.isLast && event.logicalKey.isRightKey) {
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(
              horizontal: widget.vertical ? 16 : 18,
              vertical: widget.vertical ? 12 : 10,
            ),
            decoration: BoxDecoration(
              color: active
                  ? AppColorScheme.accent
                  : (widget.vertical
                        ? Colors.transparent
                        : AppColorScheme.onSurface.withAlpha(22)),
              borderRadius: AppRadius.circular(widget.vertical ? 12 : 22),
              boxShadow: active && !isNeon
                  ? [
                      BoxShadow(
                        color: AppColorScheme.accent.withAlpha(120),
                        blurRadius: 14,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: widget.vertical ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Icon(widget.icon, size: 20, color: fg),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: fg,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MusicItemRow extends StatefulWidget {
  final String title;
  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final String Function(AggregatedItem) getSubtitle;
  final String? Function(AggregatedItem) getImageUrl;
  final ValueChanged<AggregatedItem> onFocused;
  final ValueChanged<AggregatedItem> onTap;
  final VoidCallback? onLoadMore;
  final VoidCallback? onSeeAll;

  const _MusicItemRow({
    super.key,
    required this.title,
    required this.items,
    required this.imageApi,
    required this.getSubtitle,
    required this.getImageUrl,
    required this.onFocused,
    required this.onTap,
    this.onLoadMore,
    this.onSeeAll,
  });

  @override
  State<_MusicItemRow> createState() => _MusicItemRowState();
}

class _MusicItemRowState extends State<_MusicItemRow> with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void _onCardFocused(AggregatedItem item, bool isFirst) {
    widget.onFocused(item);
    if (mounted) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeInOut,
      );
      if (isFirst && _scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            _horizontalPadding,
            16,
            _horizontalPadding,
            8,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ),
              if (widget.onSeeAll != null)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onSeeAll,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        '${AppLocalizations.of(context).seeAll} ›',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColorScheme.accent,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: _cardSize + 72,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: EdgeInsets.fromLTRB(_horizontalPadding, 6, _horizontalPadding, 12),
            itemCount: widget.items.length,
            separatorBuilder: (_, _) => const SizedBox(width: _cardSpacing),
            itemBuilder: (_, i) {
              final item = widget.items[i];
              final isFirst = i == 0;
              return _MusicSquareCard(
                title: item.name,
                subtitle: widget.getSubtitle(item),
                imageUrl: widget.getImageUrl(item),
                isCircular:
                    item.type == 'MusicArtist' || item.type == 'AlbumArtist',
                onFocus: () {
                  _onCardFocused(item, isFirst);
                  if (i >= widget.items.length - 8) {
                    widget.onLoadMore?.call();
                  }
                },
                onTap: () => widget.onTap(item),
                isFirst: isFirst,
                isLast: i == widget.items.length - 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MusicSquareCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final VoidCallback? onFocus;
  final VoidCallback? onTap;
  final bool isFirst;
  final bool isLast;
  final bool isCircular;

  const _MusicSquareCard({
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.onFocus,
    this.onTap,
    this.isFirst = false,
    this.isLast = false,
    this.isCircular = false,
  });

  @override
  State<_MusicSquareCard> createState() => _MusicSquareCardState();
}

class _MusicSquareCardState extends State<_MusicSquareCard>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final activeTheme = ThemeRegistry.active;
    final isNeon = activeTheme.id == ThemeRegistry.neonPulseId;
    final focusColor = isNeon
        ? activeTheme.borders.focusBorder.color
        : Color(
            GetIt.instance<UserPreferences>()
                .get(UserPreferences.focusColor)
                .colorValue,
          );

    final showGlow = showFocusBorder && !isNeon;
    final imgRadius = widget.isCircular ? _cardSize / 2 : 12.0;
    final ringRadius = widget.isCircular ? _cardSize / 2 : 15.0;

    return SizedBox(
      width: _cardSize,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: Focus(
          onFocusChange: (hasFocus) {
            setFocused(hasFocus);
            if (hasFocus) widget.onFocus?.call();
          },
          onKeyEvent: (_, event) {
            if (isActivateKey(event)) {
              widget.onTap?.call();
              return KeyEventResult.handled;
            }
            if (event.isActionable) {
              if (widget.isFirst && event.logicalKey.isLeftKey) {
                return KeyEventResult.handled;
              }
              if (widget.isLast && event.logicalKey.isRightKey) {
                return KeyEventResult.handled;
              }
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: AnimatedScale(
                scale: cardExpansion && showFocusBorder ? 1.08 : 1.0,
                duration: const Duration(milliseconds: 150),
                child: Column(
                  crossAxisAlignment: widget.isCircular
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (showGlow)
                          Positioned(
                            top: -3.5,
                            bottom: -3.5,
                            left: -3.5,
                            right: -3.5,
                            child: IgnorePointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.circular(ringRadius),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColorScheme.accent.withAlpha(150),
                                      blurRadius: 16,
                                      spreadRadius: 1.4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ClipRRect(
                          borderRadius: AppRadius.circular(imgRadius),
                          child: Container(
                            width: _cardSize,
                            height: _cardSize,
                            color: AppColorScheme.onSurface.withAlpha(
                              focused ? 36 : 15,
                            ),
                            child: widget.imageUrl != null
                                ? OfflineAwareImage(
                                    imageUrl: widget.imageUrl!,
                                    fit: BoxFit.cover,
                                    fadeInDuration: const Duration(
                                      milliseconds: 200,
                                    ),
                                    errorWidget: (_, _, _) => _albumPlaceholder(),
                                  )
                                : _albumPlaceholder(),
                          ),
                        ),
                        if (showFocusBorder)
                          Positioned(
                            top: -3.5,
                            bottom: -3.5,
                            left: -3.5,
                            right: -3.5,
                            child: IgnorePointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.circular(ringRadius),
                                  border: Border.fromBorderSide(
                                    activeTheme.borders.focusBorder.copyWith(
                                      color: focusColor,
                                      width: isNeon ? 3.0 : 2.4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                        color: AppColorScheme.onSurface,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.1,
                        color: AppColorScheme.onSurface.withAlpha(128),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _albumPlaceholder() {
    return Center(
      child: Icon(
        Icons.album,
        size: 48,
        color: AppColorScheme.onSurface.withAlpha(51),
      ),
    );
  }
}

class _MusicRowVisibilityDialog extends StatefulWidget {
  final String libraryName;
  final VoidCallback onChanged;

  const _MusicRowVisibilityDialog({
    required this.libraryName,
    required this.onChanged,
  });

  @override
  State<_MusicRowVisibilityDialog> createState() => _MusicRowVisibilityDialogState();
}

class _MusicRowVisibilityDialogState extends State<_MusicRowVisibilityDialog> {
  final _prefs = GetIt.instance<UserPreferences>();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(alpha: 0.92);
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(280.0, 380.0);

    final sortOpt = _prefs.get(UserPreferences.audioSortOption);

    final showLatest = _prefs.get(UserPreferences.displayAudioLatest);
    final showLastPlayed = _prefs.get(UserPreferences.displayAudioLastPlayed);
    final showFavorites = _prefs.get(UserPreferences.displayAudioFavorites);
    final showPlaylists = _prefs.get(UserPreferences.displayAudioPlaylists);
    final showAlbumArtists = _prefs.get(UserPreferences.displayAudioAlbumArtists);
    final showArtists = _prefs.get(UserPreferences.displayAudioArtists);
    final showAlbums = _prefs.get(UserPreferences.displayAudioAlbums);

    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.sortAndFilter,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: accent,
                ),
              ),
            ),
            _DialogCheckboxTile(
              label: 'Name',
              checked: sortOpt == 'name',
              isRadio: true,
              autofocus: true,
              onFocused: () {
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeOut,
                  );
                }
              },
              onChanged: (val) async {
                if (val) {
                  await _prefs.set(UserPreferences.audioSortOption, 'name');
                  setState(() {});
                  widget.onChanged();
                }
              },
            ),
            _DialogCheckboxTile(
              label: 'Release Year',
              checked: sortOpt == 'release_year',
              isRadio: true,
              onChanged: (val) async {
                if (val) {
                  await _prefs.set(UserPreferences.audioSortOption, 'release_year');
                  setState(() {});
                  widget.onChanged();
                }
              },
            ),
            _DialogCheckboxTile(
              label: 'Date Added to Library',
              checked: sortOpt == 'date_added',
              isRadio: true,
              onChanged: (val) async {
                if (val) {
                  await _prefs.set(UserPreferences.audioSortOption, 'date_added');
                  setState(() {});
                  widget.onChanged();
                }
              },
            ),
            Divider(color: dividerColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Row Visibility',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: accent,
                ),
              ),
            ),
            _DialogCheckboxTile(
              label: l10n.latestLibraryName(widget.libraryName),
              checked: showLatest,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioLatest, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.lastPlayed,
              checked: showLastPlayed,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioLastPlayed, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.favorites,
              checked: showFavorites,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioFavorites, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.playlists,
              checked: showPlaylists,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioPlaylists, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.albumArtists,
              checked: showAlbumArtists,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioAlbumArtists, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.artists,
              checked: showArtists,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioArtists, val);
                setState(() {});
                widget.onChanged();
              },
            ),
            _DialogCheckboxTile(
              label: l10n.albums,
              checked: showAlbums,
              onChanged: (val) async {
                await _prefs.set(UserPreferences.displayAudioAlbums, val);
                setState(() {});
                widget.onChanged();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogCheckboxTile extends StatefulWidget {
  final String label;
  final bool checked;
  final ValueChanged<bool> onChanged;
  final bool autofocus;
  final bool isRadio;
  final VoidCallback? onFocused;

  const _DialogCheckboxTile({
    required this.label,
    required this.checked,
    required this.onChanged,
    this.autofocus = false,
    this.isRadio = false,
    this.onFocused,
  });

  @override
  State<_DialogCheckboxTile> createState() => _DialogCheckboxTileState();
}

class _DialogCheckboxTileState extends State<_DialogCheckboxTile> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return Focus(
      autofocus: widget.autofocus,
      onFocusChange: (f) {
        setState(() => _focused = f);
        if (f && widget.onFocused != null) {
          widget.onFocused!();
        }
      },
      onKeyEvent: (node, event) {
        if (isActivateKey(event)) {
          widget.onChanged(!widget.checked);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: () => widget.onChanged(!widget.checked),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _focused ? onSurface.withAlpha(36) : Colors.transparent,
            borderRadius: AppRadius.circular(8),
            border: _focused
                ? Border.fromBorderSide(
                    ThemeRegistry.active.borders.focusBorder.copyWith(
                      color: focusColor,
                      width: 1.8,
                    ),
                  )
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: widget.isRadio ? BoxShape.circle : BoxShape.rectangle,
                  borderRadius: widget.isRadio ? null : AppRadius.circular(4),
                  border: Border.fromBorderSide(
                    ThemeRegistry.active.borders.chipBorder.copyWith(
                      color: widget.checked ? accent : onSurface.withAlpha(128),
                      width: 2,
                    ),
                  ),
                  color: widget.checked ? accent : Colors.transparent,
                ),
                child: widget.checked
                    ? Center(
                        child: widget.isRadio
                            ? Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              )
                            : const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.black,
                              ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: _focused ? FontWeight.w600 : FontWeight.normal,
                    color: widget.checked ? onSurface : onSurface.withAlpha(179),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _playTrackDirectly(BuildContext context, AggregatedItem item) async {
  final navigator = Navigator.of(context, rootNavigator: true);
  final manager = GetIt.instance<PlaybackManager>();
  var loadingVisible = true;
  void dismissLoading() {
    if (loadingVisible) {
      loadingVisible = false;
      navigator.pop();
    }
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  final albumId =
      item.albumId?.isNotEmpty == true ? item.albumId : item.parentId;

  try {
    var tracks = <AggregatedItem>[item];
    var startIndex = 0;

    if (albumId != null && albumId.isNotEmpty) {
      final factory = GetIt.instance<MediaServerClientFactory>();
      final client = item.serverId != null
          ? factory.getClientIfExists(item.serverId!) ??
                GetIt.instance<MediaServerClient>()
          : GetIt.instance<MediaServerClient>();

      final data = await client.itemsApi.getItems(
        parentId: albumId,
        includeItemTypes: const ['Audio'],
        sortBy: 'ParentIndexNumber,IndexNumber,SortName',
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
      );

      final loadedTracks = (data['Items'] as List?)
              ?.whereType<Map>()
              .map((raw) => raw.cast<String, dynamic>())
              .where((raw) => raw['Id']?.toString().isNotEmpty == true)
              .map((raw) => AggregatedItem(
                    id: raw['Id'].toString(),
                    serverId: item.serverId,
                    rawData: raw,
                  ))
              .toList() ??
          const <AggregatedItem>[];

      if (loadedTracks.isNotEmpty) {
        tracks = loadedTracks;
        final idx = tracks.indexWhere((t) => t.id == item.id);
        if (idx >= 0) {
          startIndex = idx;
        }
      }
    }

    await manager.playItems(tracks, startIndex: startIndex);
    dismissLoading();
    if (context.mounted) {
      context.push(Destinations.audioPlayer);
    }
  } catch (_) {
    dismissLoading();
    await manager.playItems([item]);
    if (context.mounted) {
      context.push(Destinations.audioPlayer);
    }
  }
}
