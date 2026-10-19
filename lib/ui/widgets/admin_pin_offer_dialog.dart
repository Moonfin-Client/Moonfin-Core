import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import 'focus/focusable_wrapper.dart';
import 'overlay_sheet.dart';

/// Offers an administrator a PIN. Returns true to set one, and false for not
/// now, which includes backing out.
Future<bool> showAdminPinOfferDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final result = await showFocusRestoringDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: AppColorScheme.surface,
      title: Text(l10n.adminPinOfferTitle),
      content: Text(l10n.adminPinOfferBody),
      actions: [
        FocusableWrapper(
          borderRadius: 8,
          suppressFocusGlow: true,
          onSelect: () => Navigator.of(context).pop(false),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(l10n.adminPinOfferLater),
          ),
        ),
        FocusableWrapper(
          autofocus: true,
          borderRadius: 8,
          suppressFocusGlow: true,
          onSelect: () => Navigator.of(context).pop(true),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              l10n.adminPinOfferSet,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}

/// Tells an administrator that their PIN is kept on the server and now applies
/// here, instead of offering to set one.
Future<void> showAdminPinSyncedDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  await showFocusRestoringDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColorScheme.surface,
      title: Text(l10n.adminPinSyncedTitle),
      content: Text(l10n.adminPinSyncedBody),
      actions: [
        FocusableWrapper(
          autofocus: true,
          borderRadius: 8,
          suppressFocusGlow: true,
          onSelect: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              l10n.ok,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
