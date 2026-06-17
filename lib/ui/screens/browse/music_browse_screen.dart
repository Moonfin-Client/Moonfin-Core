import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/overlay_sheet.dart';

Color get _navyBackground => AppColorScheme.background;
const _cardSize = 140.0;
const _horizontalPadding = 60.0;
const _cardSpacing = 12.0;

class MusicBrowseScreen extends StatefulWidget {
  final String libraryId;

  const MusicBrowseScreen({super.key, required this.libraryId});

  @override
  State<MusicBrowseScreen> createState() => _MusicBrowseScreenState();
}

class _MusicBrowseScreenState extends State<MusicBrowseScreen> {
  late final MusicBrowseViewModel _vm;
  final _backgroundService = GetIt.instance<BackgroundService>();

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
  }

  @override
  void dispose() {
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
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  void _onRandomAlbum() async {
    try {
      final client = GetIt.instance<MediaServerClient>();
      final response = await client.itemsApi.getItems(
        parentId: widget.libraryId,
        includeItemTypes: ['MusicAlbum'],
        sortBy: 'Random',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 1,
      );
      final items = (response['Items'] as List?) ?? [];
      if (items.isNotEmpty && mounted) {
        final id = items.first['Id']?.toString() ?? '';
        context.push(Destinations.itemListOf(id));
      }
    } catch (_) {}
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

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _navyBackground,
      body: Stack(
        children: [
          Container(color: _navyBackground.withAlpha(191)),
          Column(
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
                                  return _MusicViewsRow(
                                    key: const ValueKey('views_row'),
                                    libraryId: widget.libraryId,
                                    onRandomAlbum: _onRandomAlbum,
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
                                );
                              },
                            );
                          },
                        ),
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

class _MusicViewsRow extends StatefulWidget {
  final String libraryId;
  final VoidCallback onRandomAlbum;

  const _MusicViewsRow({super.key, required this.libraryId, required this.onRandomAlbum});

  @override
  State<_MusicViewsRow> createState() => _MusicViewsRowState();
}

class _MusicViewsRowState extends State<_MusicViewsRow> with AutomaticKeepAliveClientMixin {
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

  void _onFocused(bool isFirst) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            _horizontalPadding,
            12,
            _horizontalPadding,
            8,
          ),
          child: Text(
            AppLocalizations.of(context).views,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(
          height: 104,
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.fromLTRB(
              _horizontalPadding,
              4,
              _horizontalPadding,
              6,
            ),
            children: [
              _ViewButton(
                icon: Icons.album,
                label: AppLocalizations.of(context).albums,
                isFirst: true,
                onFocused: () => _onFocused(true),
                onTap: () => context.push(
                  Destinations.library(
                    widget.libraryId,
                    includeItemTypes: ['MusicAlbum'],
                  ),
                ),
              ),
              const SizedBox(width: _cardSpacing),
              _ViewButton(
                icon: Icons.person,
                label: AppLocalizations.of(context).albumArtists,
                onFocused: () => _onFocused(false),
                onTap: () => context.push(
                  Destinations.library(
                    widget.libraryId,
                    includeItemTypes: ['AlbumArtist'],
                  ),
                ),
              ),
              const SizedBox(width: _cardSpacing),
              _ViewButton(
                icon: Icons.groups,
                label: AppLocalizations.of(context).artists,
                onFocused: () => _onFocused(false),
                onTap: () => context.push(
                  Destinations.library(
                    widget.libraryId,
                    includeItemTypes: ['MusicArtist'],
                  ),
                ),
              ),
              const SizedBox(width: _cardSpacing),
              _ViewButton(
                icon: Icons.album,
                label: AppLocalizations.of(context).genres,
                isLast: true,
                onFocused: () => _onFocused(false),
                onTap: () =>
                    context.push(Destinations.libraryGenresOf(widget.libraryId)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ViewButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final VoidCallback? onFocused;
  final bool isFirst;
  final bool isLast;

  const _ViewButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.onFocused,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<_ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<_ViewButton> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
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
          child: AnimatedScale(
            scale: cardExpansion && showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _cardSize,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColorScheme.onSurface.withAlpha(focused ? 51 : 20),
                borderRadius: BorderRadius.circular(8),
                border: showFocusBorder
                    ? Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: focusColor,
                          width: 2.4,
                        ),
                      )
                    : null,
                boxShadow: showFocusBorder
                    ? [
                        BoxShadow(
                          color: AppColorScheme.accent.withAlpha(140),
                          blurRadius: 14,
                          spreadRadius: 1.2,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 30,
                    color: AppColorScheme.onSurface.withAlpha(
                      focused ? 255 : 153,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: focused ? FontWeight.w600 : FontWeight.normal,
                      color: AppColorScheme.onSurface.withAlpha(
                        focused ? 255 : 179,
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
          padding: const EdgeInsets.fromLTRB(
            _horizontalPadding,
            16,
            _horizontalPadding,
            8,
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(
          height: _cardSize + 72,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.fromLTRB(_horizontalPadding, 6, _horizontalPadding, 12),
            itemCount: widget.items.length,
            separatorBuilder: (_, _) => const SizedBox(width: _cardSpacing),
            itemBuilder: (_, i) {
              final item = widget.items[i];
              final isFirst = i == 0;
              return _MusicSquareCard(
                title: item.name,
                subtitle: widget.getSubtitle(item),
                imageUrl: widget.getImageUrl(item),
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

  const _MusicSquareCard({
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.onFocus,
    this.onTap,
    this.isFirst = false,
    this.isLast = false,
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
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: showFocusBorder
                            ? Border.fromBorderSide(
                                ThemeRegistry.active.borders.focusBorder
                                    .copyWith(color: focusColor, width: 2.4),
                              )
                            : null,
                        boxShadow: showFocusBorder
                            ? [
                                BoxShadow(
                                  color: AppColorScheme.accent.withAlpha(150),
                                  blurRadius: 16,
                                  spreadRadius: 1.4,
                                ),
                              ]
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: _cardSize,
                          height: _cardSize,
                          color: AppColorScheme.onSurface.withAlpha(
                            focused ? 36 : 15,
                          ),
                          child: widget.imageUrl != null
                              ? CachedNetworkImage(
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
                    ),
                    const SizedBox(height: 4),
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
        borderRadius: BorderRadius.circular(20),
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
            borderRadius: BorderRadius.circular(8),
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
                  borderRadius: widget.isRadio ? null : BorderRadius.circular(4),
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
