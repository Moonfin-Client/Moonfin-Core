import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../widgets/focus/focusable_button.dart';
import '../detail_buttons.dart';
import '../item_detail_screen.dart';

/// The audio, subtitle and version pickers as a row of chips, each showing
/// what it's set to. Select opens the same picker the button row would.
class StageTrackChips extends StatelessWidget {
  final List<DetailTrackChoice> choices;
  final FocusNode firstFocusNode;
  final ValueChanged<DetailButton> onOpen;
  final VoidCallback onNavigateUp;
  final VoidCallback onNavigateDown;

  /// Left off the first chip, back to the buttons beside the poster.
  final VoidCallback? onLeftEdge;

  const StageTrackChips({
    super.key,
    required this.choices,
    required this.firstFocusNode,
    required this.onOpen,
    required this.onNavigateUp,
    required this.onNavigateDown,
    this.onLeftEdge,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onBackground.withValues(alpha: 0.62);

    return Wrap(
      key: const ValueKey('stage-track-chips'),
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final (index, choice) in choices.indexed)
          FocusableButton(
            focusNode: index == 0 ? firstFocusNode : null,
            onPressed: () => onOpen(choice.kind),
            onNavigateUp: onNavigateUp,
            onNavigateDown: onNavigateDown,
            onNavigateLeft: index == 0 ? onLeftEdge : null,
            borderRadius: 20,
            padding: EdgeInsets.zero,
            semanticLabel: '${choice.kind.label(l10n)}: ${choice.current}',
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                color: AppColorScheme.onBackground.withValues(alpha: 0.06),
                borderRadius: AppRadius.circular(20),
                border: Border.all(
                  color: AppColorScheme.onBackground.withValues(alpha: 0.22),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(choice.kind.icon, size: 18, color: muted),
                  const SizedBox(width: 8),
                  Text(
                    choice.kind.label(l10n),
                    style: textTheme.bodySmall?.copyWith(color: muted),
                  ),
                  const SizedBox(width: 8),
                  // Gives way on a screen too narrow for the whole name.
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 240),
                      child: Text(
                        choice.current,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
