import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../overlay_sheet.dart';
import 'context_action.dart';
import 'focus_theme.dart';
import 'focusable_button.dart';

Future<void> showContextMenu(
  BuildContext context,
  AggregatedItem item, {
  VoidCallback? onChanged,
}) {
  final actions = contextActionsFor(context, item, onChanged: onChanged);
  if (actions.isEmpty) return Future<void>.value();
  return OverlaySheetController.show<void>(
    context,
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

class _ActionRow extends StatelessWidget {
  final ItemContextAction action;
  final bool autofocus;

  const _ActionRow({required this.action, required this.autofocus});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FocusableButton(
      autofocus: autofocus,
      borderRadius: 6,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      onPressed: () async {
        await OverlaySheetController.closeAdaptive<void>(
          context,
          restoreFocus: false,
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
    );
  }
}
