import 'dart:async';

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
}) {
  final service = ItemMembershipService.instance;
  final playlists = service.getCachedPlaylistsContaining(item);
  final collections = service.getCachedCollectionsContaining(item);
  final hasActions = contextActionsFor(
    context,
    item,
    onChanged: onChanged,
    collectionRemoval: collectionRemoval,
    isContinueWatchingOrNextUp: isContinueWatchingOrNextUp,
    playlistMemberships: playlists,
    collectionMemberships: collections,
  ).isNotEmpty;
  if (!hasActions) return Future<void>.value();

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
      initialPlaylists: playlists,
      initialCollections: collections,
    ),
  );
}

class _ContextMenu extends StatefulWidget {
  final BuildContext parentContext;
  final AggregatedItem item;
  final VoidCallback? onChanged;
  final CollectionRemovalContext? collectionRemoval;
  final bool isContinueWatchingOrNextUp;
  final List<ItemPlaylistMembership> initialPlaylists;
  final List<ItemCollectionMembership> initialCollections;

  const _ContextMenu({
    required this.parentContext,
    required this.item,
    this.onChanged,
    this.collectionRemoval,
    this.isContinueWatchingOrNextUp = false,
    required this.initialPlaylists,
    required this.initialCollections,
  });

  @override
  State<_ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<_ContextMenu> {
  late AggregatedItem _item;
  late List<ItemPlaylistMembership> _playlists;
  late List<ItemCollectionMembership> _collections;
  List<ItemContextAction> _actions = const [];

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _playlists = widget.initialPlaylists;
    _collections = widget.initialCollections;
    FocusManager.instance.addListener(_onFocusChanged);

    // Only these types get the remove actions, so nothing else starts a scan.
    if (isContextMediaType(_item.type)) _pollMemberships();
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    final focusContext = FocusManager.instance.primaryFocus?.context;
    if (focusContext == null || !focusContext.mounted) return;
    if (Scrollable.maybeOf(focusContext) == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && focusContext.mounted) {
        Scrollable.ensureVisible(
          focusContext,
          alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
          duration: FocusTheme.animationDuration,
        );
      }
    });
  }

  void _pollMemberships() {
    final service = ItemMembershipService.instance;
    unawaited(
      service.getPlaylistsContaining(_item).then((newPl) {
        if (!mounted) return;
        if (!listEquals(newPl, _playlists)) {
          setState(() => _playlists = newPl);
        }
      }).catchError((_) {}),
    );
    unawaited(
      service.getCollectionsContaining(_item).then((newCol) {
        if (!mounted) return;
        if (!listEquals(newCol, _collections)) {
          setState(() => _collections = newCol);
        }
      }).catchError((_) {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Actions are built on the opener's context so their dialogs outlive this
    // sheet. Once the opener is gone, keep the last rows instead of going blank.
    if (widget.parentContext.mounted) {
      _actions = contextActionsFor(
        widget.parentContext,
        _item,
        onChanged: widget.onChanged,
        collectionRemoval: widget.collectionRemoval,
        isContinueWatchingOrNextUp: widget.isContinueWatchingOrNextUp,
        playlistMemberships: _playlists,
        collectionMemberships: _collections,
      );
    }
    final actions = _actions;
    if (actions.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final title = _item.name;
    final maxHeight =
        (MediaQuery.sizeOf(context).height - 32).clamp(160.0, double.infinity);
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 360, maxHeight: maxHeight),
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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < actions.length; i++)
                        MenuActionRow(
                          key: ValueKey(
                            '${actions[i].icon.codePoint}:${actions[i].label}',
                          ),
                          icon: actions[i].icon,
                          label: actions[i].label,
                          autofocus: i == 0,
                          onPressed: () async {
                            await OverlaySheetController.closeAdaptive<void>(
                              context,
                            );
                            await actions[i].onSelect();
                          },
                        ),
                    ],
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
