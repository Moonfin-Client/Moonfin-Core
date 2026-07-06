import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_glass.dart';
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
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: adaptiveGlass(
          context: context,
          cornerRadius: 24,
          blur: 30,
          fallbackColor: AppColorScheme.surface.withValues(alpha: 0.62),
          tint: AppColorScheme.surface.withValues(alpha: 0.22),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorScheme.accent.withValues(alpha: 0.16),
                    border: Border.all(
                      color: AppColorScheme.accent.withValues(alpha: 0.4),
                      width: 0.5,
                    ),
                  ),
                  child: Icon(
                    Icons.visibility_outlined,
                    color: AppColorScheme.accent,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.stillWatching,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.stillWatchingContent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.62),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  autofocus: true,
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme.accent,
                    foregroundColor: AppColorScheme.onAccent,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(l10n.stillWatchingContinue),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onStop,
                  style: TextButton.styleFrom(
                    foregroundColor:
                        AppColorScheme.onSurface.withValues(alpha: 0.6),
                    padding: const EdgeInsets.symmetric(vertical: 11),
                  ),
                  child: Text(l10n.stillWatchingStop),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
