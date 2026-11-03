import 'package:flutter/material.dart';

import '../../auth/models/silo_native_offer.dart';
import '../../l10n/app_localizations.dart';
import 'adaptive/adaptive_dialog.dart';
import 'overlay_sheet.dart';

/// Asks whether to add Silo's native server instead of its
/// Jellyfin-compatible service. True adds the native server, and closing
/// the dialog keeps the Jellyfin address.
Future<bool> confirmSiloNativeServer(
  BuildContext context,
  SiloNativeOffer offer,
) async {
  final l10n = AppLocalizations.of(context);
  final useSilo = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(l10n.siloNativeOfferTitle),
      content: Text(
        l10n.siloNativeOfferMessage(offer.serverName, offer.siloAddress),
      ),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(l10n.siloNativeOfferKeep),
        ),
        adaptiveDialogAction(
          onPressed: () => Navigator.of(ctx).pop(true),
          isDefault: true,
          autofocus: true,
          child: Text(l10n.siloNativeOfferUse),
        ),
      ],
    ),
  );
  return useSilo == true;
}
