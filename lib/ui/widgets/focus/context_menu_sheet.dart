import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/item_membership_service.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../../util/platform_detection.dart';
import '../overlay_sheet.dart';
import 'context_action.dart';
import 'focus_theme.dart';
import 'menu_action_row.dart';

Future<void> showContextMenu(
  BuildContext context,
  AggregatedItem item, {
  VoidCallback? onChanged,
  CollectionRemovalContext? collectionRemoval,
  bool isContinueWatchingOrNextUp = false,
  List<ItemPlaylistMembership>? playlistMemberships,
  List<ItemCollectionMembership>? collectionMemberships,
}) async {
  final isExternalItem = item.serverId == 'seerr' || item.id.startsWith('tt');
  List<ItemPlaylistMembership>? resolvedPlaylists =
      isExternalItem ? const [] : playlistMemberships;
  List<ItemCollectionMembership>? resolvedCollections =
      isExternalItem ? const [] : collectionMemberships;

  if (!isExternalItem) {
    final service = ItemMembershipService.instance;
    resolvedPlaylists ??= service.getCachedPlaylistsContaining(item);
    resolvedCollections ??= service.getCachedCollectionsContaining(item);
  }

  if (!context.mounted) return;
  final hasActions = contextActionsFor(
    context,
    item,
    onChanged: onChanged,
    collectionRemoval: collectionRemoval,
    isContinueWatchingOrNextUp: isContinueWatchingOrNextUp,
    playlistMemberships: resolvedPlaylists,
    collectionMemberships: resolvedCollections,
  ).isNotEmpty;
  if (!hasActions) return;

  final anchor = PlatformDetection.useDesktopUi
      ? InputModeTracker.lastPointerDownPosition
      : null;
  return OverlaySheetController.show<void>(
    context,
    anchor: anchor,
    builder: (sheetContext) => _ContextMenu(
      parentContext: context,
      item: item,
      onChanged: onChanged,
      collectionRemoval: collectionRemoval,
      isContinueWatchingOrNextUp: isContinueWatchingOrNextUp,
      initialPlaylists: resolvedPlaylists,
      initialCollections: resolvedCollections,
    ),
  );
}

class _ContextMenu extends StatefulWidget {
  final BuildContext parentContext;
  final AggregatedItem item;
  final VoidCallback? onChanged;
  final CollectionRemovalContext? collectionRemoval;
  final bool isContinueWatchingOrNextUp;
  final List<ItemPlaylistMembership>? initialPlaylists;
  final List<ItemCollectionMembership>? initialCollections;

  const _ContextMenu({
    required this.parentContext,
    required this.item,
    this.onChanged,
    this.collectionRemoval,
    this.isContinueWatchingOrNextUp = false,
    this.initialPlaylists,
    this.initialCollections,
  });

  @override
  State<_ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<_ContextMenu> {
  late AggregatedItem _item;
  late List<ItemPlaylistMembership>? _playlists;
  late List<ItemCollectionMembership>? _collections;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _playlists = widget.initialPlaylists;
    _collections = widget.initialCollections;

    if (!(_item.serverId == 'seerr' || _item.id.startsWith('tt'))) {
      _pollMemberships();
    }
  }

  Future<void> _pollMemberships() async {
    final result = await ItemMembershipService.instance.getMemberships(
      _item,
      timeout: const Duration(seconds: 4),
    );
    if (!mounted) return;
    final newPl = result.playlists;
    final newCol = result.collections;
    if (!listEquals(newPl, _playlists ?? const []) ||
        !listEquals(newCol, _collections ?? const [])) {
      setState(() {
        _playlists = newPl;
        _collections = newCol;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pass widget.parentContext so action dialogs (such as RemoveFromPlaylistDialog)
    // stay mounted when this sheet closes.
    if (!widget.parentContext.mounted) return const SizedBox.shrink();
    final actions = contextActionsFor(
      widget.parentContext,
      _item,
      onChanged: widget.onChanged,
      collectionRemoval: widget.collectionRemoval,
      isContinueWatchingOrNextUp: widget.isContinueWatchingOrNextUp,
      playlistMemberships: _playlists,
      collectionMemberships: _collections,
    );
    if (actions.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final title = _item.name;
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: AppRadius.circular(FocusTheme.defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColorScheme.scrim.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              for (var i = 0; i < actions.length; i++)
                MenuActionRow(
                  icon: actions[i].icon,
                  label: actions[i].label,
                  autofocus: i == 0,
                  onPressed: () async {
                    await OverlaySheetController.closeAdaptive<void>(context);
                    await actions[i].onSelect();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
