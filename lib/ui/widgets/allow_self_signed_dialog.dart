import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/insecure_certificates.dart';
import 'adaptive/adaptive_dialog.dart';
import 'overlay_sheet.dart';

/// Offers "Allow self-signed certificates" from a sign-in screen, where the
/// settings screen can't be reached yet. Returns true once it's turned on.
Future<bool> confirmAllowSelfSignedCertificates(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final confirmed = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(l10n.settingsAllowSelfSignedCerts),
      content: Text(l10n.settingsAllowSelfSignedCertsSubtitle),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(l10n.cancel),
        ),
        adaptiveDialogAction(
          onPressed: () => Navigator.of(ctx).pop(true),
          isDestructive: true,
          child: Text(l10n.enable),
        ),
      ],
    ),
  );
  if (confirmed != true) return false;
  gAllowSelfSignedCertificates = true;
  await GetIt.instance<UserPreferences>().set(
    UserPreferences.allowSelfSignedCerts,
    true,
  );
  return true;
}
