import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../util/focus/input_mode_tracker.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/focus/focus_theme.dart';
import '../../../widgets/focus/focusable_button.dart';
import '../../../widgets/overlay_sheet.dart';

/// One entry in a saved media row's action menu.
///
/// These are deliberately their own list rather than the shared item actions,
/// which talk to the server. A downloads list can't count on one being there.
class SavedMediaAction {
  const SavedMediaAction({
    required this.icon,
    required this.label,
    required this.onSelect,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final Future<void> Function() onSelect;
  final bool isDestructive;
}

/// Opens the row's action menu.
///
/// A pointer opened this from a spot on screen, so put it there. A remote has
/// no such spot and keeps the centered menu, matching the shared context sheet.
Future<void> showSavedMediaMenu(
  BuildContext context, {
  required String title,
  required List<SavedMediaAction> actions,
}) {
  if (actions.isEmpty) return Future<void>.value();
  return OverlaySheetController.show<void>(
    context,
    anchor: PlatformDetection.useDesktopUi
        ? InputModeTracker.lastPointerDownPosition
        : null,
    builder: (sheetContext) => _SavedMediaMenu(title: title, actions: actions),
  );
}

class _SavedMediaMenu extends StatelessWidget {
  const _SavedMediaMenu({required this.title, required this.actions});

  final String title;
  final List<SavedMediaAction> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: AppRadius.circular(FocusTheme.defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColorScheme.scrim.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: const Offset(0, 8),
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
                _ActionRow(action: actions[i], autofocus: i == 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionRow extends StatefulWidget {
  const _ActionRow({required this.action, required this.autofocus});

  final SavedMediaAction action;
  final bool autofocus;

  @override
  State<_ActionRow> createState() => _ActionRowState();
}

class _ActionRowState extends State<_ActionRow> {
  final FocusNode _focusNode = FocusNode(debugLabel: 'SavedMediaMenuAction');

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final action = widget.action;
    final color = action.isDestructive
        ? AppColorScheme.statusRequested
        : theme.colorScheme.onSurface;
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
            Icon(action.icon, size: 22, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                action.label,
                style: theme.textTheme.bodyLarge?.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
