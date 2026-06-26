import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';

class StillWatchingDialog extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onStop;

  const StillWatchingDialog({
    super.key,
    required this.onContinue,
    required this.onStop,
  });

  static Future<bool?> show(BuildContext context) {
    return showFocusRestoringDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => StillWatchingDialog(
        onContinue: () => Navigator.of(context).pop(true),
        onStop: () => Navigator.of(context).pop(false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      backgroundColor: AppColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        l10n.stillWatching,
        style: TextStyle(
          color: AppColorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        l10n.stillWatchingContent,
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        adaptiveDialogAction(
          onPressed: onStop,
          child: Text(
            l10n.stillWatchingStop,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.54),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorScheme.accent,
            foregroundColor: AppColorScheme.onAccent,
          ),
          child: Text(l10n.stillWatchingContinue),
        ),
      ],
    );
  }
}
