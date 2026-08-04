import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/viewmodels/folder_browse_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../../l10n/app_localizations.dart';

class FolderBrowseScreen extends StatefulWidget {
  final String folderId;
  final String? serverId;

  const FolderBrowseScreen({super.key, required this.folderId, this.serverId});

  @override
  State<FolderBrowseScreen> createState() => _FolderBrowseScreenState();
}

class _FolderBrowseScreenState extends State<FolderBrowseScreen> {
  late final FolderBrowseViewModel _vm;
  final _scrollController = ScrollController();
  final Map<int, FocusNode> _gridItemFocusNodes = {};
  DateTime? _lastItemTapAt;
  String? _lastTappedItemId;

  List<AggregatedItem>? _metricsSource;
  double _minAspectRatio = 16 / 9;
  bool _anySubtitles = false;

  @override
  void initState() {
    super.initState();
    final serverId = widget.serverId;
    final client = serverId != null && serverId.isNotEmpty
        ? GetIt.instance<MediaServerClientFactory>().getClientIfExists(
                serverId,
              ) ??
              GetIt.instance<MediaServerClient>()
        : GetIt.instance<MediaServerClient>();
    _vm = FolderBrowseViewModel(client, serverId: serverId);
    _vm.addListener(_onChanged);
    _scrollController.addListener(_onScroll);
    _vm.loadFolder(widget.folderId);
  }

  FocusNode _getGridItemFocusNode(int index) {
    return _gridItemFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'folder-card-$index'),
    );
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _vm.loadMore();
    }
  }

  @override
  void dispose() {
    for (final fn in _gridItemFocusNodes.values) {
      fn.dispose();
    }
    _gridItemFocusNodes.clear();
    _vm.removeListener(_onChanged);
    _vm.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String? _imageUrl(AggregatedItem item, {int? maxWidth}) {
    final api = _vm.imageApi;
    final isFolder = _vm.isNavigableFolder(item);

    final imageTags = item.rawData['ImageTags'];
    if (imageTags is Map) {
      if (isFolder) {
        final thumbTag = imageTags['Thumb'] as String?;
        if (thumbTag != null) {
          return api.getThumbImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: thumbTag,
          );
        }

        final primaryTag = imageTags['Primary'] as String?;
        if (primaryTag != null) {
          return api.getPrimaryImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: primaryTag,
          );
        }

        final backdropTag = imageTags['Backdrop'] as String?;
        if (backdropTag != null) {
          return api.getBackdropImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: backdropTag,
          );
        }
      } else {
        final primaryTag = imageTags['Primary'] as String?;
        if (primaryTag != null) {
          return api.getPrimaryImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: primaryTag,
          );
        }

        final thumbTag = imageTags['Thumb'] as String?;
        if (thumbTag != null) {
          return api.getThumbImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: thumbTag,
          );
        }

        final backdropTag = imageTags['Backdrop'] as String?;
        if (backdropTag != null) {
          return api.getBackdropImageUrl(
            item.id,
            maxWidth: maxWidth,
            tag: backdropTag,
          );
        }
      }
    }

    if (item.primaryImageTag != null) {
      return api.getPrimaryImageUrl(
        item.id,
        maxWidth: maxWidth,
        tag: item.primaryImageTag,
      );
    }

    if (item.seriesId != null && item.seriesPrimaryImageTag != null) {
      return api.getPrimaryImageUrl(
        item.seriesId!,
        maxWidth: maxWidth,
        tag: item.seriesPrimaryImageTag,
      );
    }

    if (item.backdropImageTags.isNotEmpty) {
      return api.getBackdropImageUrl(
        item.id,
        maxWidth: maxWidth,
        tag: item.backdropImageTags.first,
      );
    }

    final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
    if (parentThumbItemId != null && parentThumbTag != null) {
      return api.getThumbImageUrl(
        parentThumbItemId,
        maxWidth: maxWidth,
        tag: parentThumbTag,
      );
    }

    return null;
  }

  void _onItemTap(AggregatedItem item) {
    final now = DateTime.now();
    final isDuplicateTap =
        _lastTappedItemId == item.id &&
        _lastItemTapAt != null &&
        now.difference(_lastItemTapAt!) < const Duration(milliseconds: 500);
    if (isDuplicateTap) return;
    _lastTappedItemId = item.id;
    _lastItemTapAt = now;

    if (_vm.isNavigableFolder(item)) {
      context.push(
        Destinations.folder(item.id, serverId: item.serverId),
      );
    } else {
      context.push(
        Destinations.itemOrPhoto(
          item.id,
          serverId: item.serverId,
          type: item.type,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
        targetNode: _vm.items.isNotEmpty ? _getGridItemFocusNode(0) : null,
        child: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              if (_vm.breadcrumbs.isNotEmpty) _buildBreadcrumbs(),
              Divider(
                color: ThemeRegistry.active.borders.chipBorder.color,
                height: 1,
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreadcrumbs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      child: Row(
        children: [
          for (int i = 0; i < _vm.breadcrumbs.length; i++) ...[
            if (i > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.chevron_right,
                  color: AppColorScheme.onSurface,
                  size: 18,
                ),
              ),
            Builder(
              builder: (context) {
                final isLast = i == _vm.breadcrumbs.length - 1;
                final rawName = _vm.breadcrumbs[i].name;
                final isRoot = i == 0 &&
                    (_vm.breadcrumbs[i].id == 'root' ||
                        rawName.toLowerCase() == 'root');
                final displayName = isRoot
                    ? AppLocalizations.of(context).folders
                    : rawName;

                return _BreadcrumbChip(
                  label: displayName,
                  isLast: isLast,
                  onTap: !isLast
                      ? () {
                          if (i == 0) {
                            context.go(Destinations.folderView);
                          } else {
                            context.go(
                              Destinations.folder(
                                _vm.breadcrumbs[i].id,
                                serverId: widget.serverId,
                              ),
                            );
                          }
                        }
                      : null,
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_vm.state) {
      case FolderBrowseState.loading:
        return const Center(child: CircularProgressIndicator());
      case FolderBrowseState.error:
        return Center(
          child: Text(
            AppLocalizations.of(
              context,
            ).failedToLoadFolderError(_vm.errorMessage),
            style: TextStyle(color: AppColorScheme.onSurface.withAlpha(179)),
          ),
        );
      case FolderBrowseState.ready when _vm.items.isEmpty:
        return Center(
          child: Text(
            AppLocalizations.of(context).thisFolderIsEmpty,
            style: TextStyle(color: AppColorScheme.onSurface.withAlpha(179)),
          ),
        );
      case FolderBrowseState.ready:
        return _buildGrid();
    }
  }

  /// Rows are one height, so they are cut for the tallest card in the folder
  /// and shorter ones leave a gap. Walking every item to find it is only worth
  /// doing when the list itself changes, not on each rebuild.
  void _ensureGridMetrics() {
    if (identical(_metricsSource, _vm.items)) return;
    _metricsSource = _vm.items;

    var minAspectRatio = 16 / 9;
    var anySubtitles = false;
    for (final item in _vm.items) {
      final isFolder = _vm.isNavigableFolder(item);
      final ratio = isFolder ? 16 / 9 : MediaCard.aspectRatioForType(item.type);
      if (ratio < minAspectRatio) minAspectRatio = ratio;
      anySubtitles = anySubtitles || _subtitleText(item, isFolder) != null;
    }
    _minAspectRatio = minAspectRatio;
    _anySubtitles = anySubtitles;
  }

  Widget _buildGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPadding = 24.0;
        const spacing = 12.0;
        const targetCardWidth = 170.0;

        final crossAxisCount =
            ((constraints.maxWidth - horizontalPadding * 2 + spacing) /
                    (targetCardWidth + spacing))
                .floor()
                .clamp(2, 10);

        final cardWidth =
            (constraints.maxWidth -
                horizontalPadding * 2 -
                (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        _ensureGridMetrics();
        final textScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = (_anySubtitles ? 46.0 : 26.0) * textScale;
        final childAspectRatio =
            cardWidth / (cardWidth / _minAspectRatio + textHeight);

        final totalCount = _vm.items.length + (_vm.hasMore ? 1 : 0);

        // Read once for the whole grid rather than per card on every rebuild.
        final prefs = GetIt.instance<UserPreferences>();
        final focusColor = Color(
          prefs.get(UserPreferences.focusColor).colorValue,
        );
        final watchedBehavior = prefs.get(
          UserPreferences.watchedIndicatorBehavior,
        );
        final cardFocusExpansion = prefs.get(
          UserPreferences.cardFocusExpansion,
        );

        return GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.fromLTRB(
            horizontalPadding,
            16,
            horizontalPadding,
            32,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: totalCount,
          itemBuilder: (context, index) {
            if (index >= _vm.items.length - 8 && _vm.hasMore) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _vm.loadMore();
              });
            }
            if (index >= _vm.items.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final item = _vm.items[index];
            final isFolder = _vm.isNavigableFolder(item);
            final itemAr = isFolder
                ? 16 / 9
                : MediaCard.aspectRatioForType(item.type);

            return MediaCard(
              title: _vm.getItemDisplayName(item),
              subtitle: _subtitleText(item, isFolder),
              imageUrl: _imageUrl(item, maxWidth: cardWidth.toInt()),
              width: double.infinity,
              aspectRatio: itemAr,
              itemType: isFolder ? 'Folder' : item.type,
              focusColor: focusColor,
              focusNode: _getGridItemFocusNode(index),
              cardFocusExpansion: cardFocusExpansion,
              isPlayed: item.isPlayed,
              isFavorite: item.isFavorite,
              unplayedCount: item.unplayedItemCount,
              playedPercentage: item.playedPercentage,
              watchedBehavior: watchedBehavior,
              onTap: () => _onItemTap(item),
            );
          },
        );
      },
    );
  }

  String? _subtitleText(AggregatedItem item, bool isFolder) {
    final parts = <String>[];
    if (item.type != null) parts.add(item.type!);
    if (isFolder && item.childCount != null) {
      parts.add(AppLocalizations.of(context).itemCountLabel(item.childCount!));
    }
    if (item.productionYear != null) parts.add('${item.productionYear}');
    return parts.isEmpty ? null : parts.join(' · ');
  }
}

class _BreadcrumbChip extends StatefulWidget {
  final String label;
  final bool isLast;
  final VoidCallback? onTap;

  const _BreadcrumbChip({
    required this.label,
    required this.isLast,
    this.onTap,
  });

  @override
  State<_BreadcrumbChip> createState() => _BreadcrumbChipState();
}

class _BreadcrumbChipState extends State<_BreadcrumbChip> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return Focus(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      onKeyEvent: (_, event) {
        if (widget.onTap != null && isActivateKey(event)) {
          widget.onTap!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: InkWell(
        borderRadius: AppRadius.circular(8),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: _isFocused
                ? focusColor.withAlpha(70)
                : (widget.isLast
                    ? AppColorScheme.accent.withAlpha(35)
                    : AppColorScheme.onSurface.withAlpha(15)),
            borderRadius: AppRadius.circular(8),
            border: Border.all(
              color: _isFocused
                  ? focusColor
                  : (widget.isLast
                      ? ThemeRegistry.active.borders.chipBorder.color
                      : Colors.transparent),
              width: _isFocused ? 2 : 1,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isFocused
                  ? focusColor
                  : (widget.isLast
                      ? AppColorScheme.onSurface
                      : AppColorScheme.accent),
              fontSize: 14,
              fontWeight:
                  _isFocused || widget.isLast ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
