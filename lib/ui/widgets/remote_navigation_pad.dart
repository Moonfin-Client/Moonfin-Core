import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Five independent tap targets; ordinary taps do not start a repeat timer.
class RemoteNavigationPad extends StatelessWidget {
  const RemoteNavigationPad({
    super.key,
    required this.supports,
    required this.onCommand,
  });

  final bool Function(String) supports;
  final ValueChanged<String> onCommand;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    Widget direction(String command, String label, IconData icon) => IconButton(
      key: ValueKey('remote-$command'),
      tooltip: label,
      onPressed: supports(command) ? () => onCommand(command) : null,
      icon: Icon(icon, size: 32),
      style: IconButton.styleFrom(minimumSize: const Size(64, 64)),
    );

    return Center(
      child: Container(
        width: 240,
        height: 240,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.surfaceContainerLow,
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: direction('MoveUp', l10n.moveUp, Icons.keyboard_arrow_up),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: direction('MoveLeft', l10n.scrollLeft, Icons.chevron_left),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: direction(
                'MoveRight',
                l10n.scrollRight,
                Icons.chevron_right,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: direction(
                'MoveDown',
                l10n.moveDown,
                Icons.keyboard_arrow_down,
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: FilledButton.tonal(
                key: const ValueKey('remote-Select'),
                style: FilledButton.styleFrom(shape: const CircleBorder()),
                onPressed: supports('Select')
                    ? () => onCommand('Select')
                    : null,
                child: Text(l10n.ok),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
