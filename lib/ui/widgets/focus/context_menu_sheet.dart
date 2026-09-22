import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../../util/platform_detection.dart';
import '../overlay_sheet.dart';
import 'context_action.dart';
import 'focus_theme.dart';
import 'focusable_button.dart';

Future<void> showContextMenu(
  BuildContext context,
  AggregatedItem item, {
  VoidCallback? onChanged,
  CollectionRemovalContext? collectionRemoval,
}) {
  final actions = contextActionsFor(
    context,
    item,
    onChanged: onChanged,
    collectionRemoval: collectionRemoval,
  );
  if (actions.isEmpty) return Future<void>.value();
  // A pointer opened this from a spot on screen, so put it there. A remote or
  // a touch has no such spot and keeps the centered menu.
  final anchor = PlatformDetection.useDesktopUi
      ? InputModeTracker.lastPointerDownPosition
      : null;
  return OverlaySheetController.show<void>(
    context,
    anchor: anchor,
    builder: (sheetContext) =>
        _ContextMenu(item: item, actions: actions),
  );
}

class _ContextMenu extends StatelessWidget {
  final AggregatedItem item;
  final List<ItemContextAction> actions;

  const _ContextMenu({required this.item, required this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = item.name;
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
                _ActionRow(
                  action: actions[i],
                  autofocus: i == 0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionRow extends StatefulWidget {
  final ItemContextAction action;
  final bool autofocus;

  const _ActionRow({required this.action, required this.autofocus});

  @override
  State<_ActionRow> createState() => _ActionRowState();
}

class _ActionRowState extends State<_ActionRow> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final action = widget.action;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      // Focus follows the pointer so the row under the mouse lights up the way
      // the row under the remote does, rather than the menu sitting inert.
      onEnter: (_) => _focusNode.requestFocus(),
      child: FocusableButton(
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        borderRadius: 6,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        onPressed: () async {
          await OverlaySheetController.closeAdaptive<void>(
            context,
            restoreFocus: true,
          );
          await action.onSelect();
        },
        child: Row(
          children: [
            Icon(action.icon, size: 22, color: theme.colorScheme.onSurface),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                action.label,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
