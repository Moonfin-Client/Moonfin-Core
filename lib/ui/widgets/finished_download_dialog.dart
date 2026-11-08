import 'package:flutter/material.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/remove_watched_service.dart';
import '../../l10n/app_localizations.dart';
import '../navigation/app_router.dart';
import 'adaptive/adaptive_dialog.dart';
import 'overlay_sheet.dart';

/// Null is Not now, also when there is no screen to ask on.
Future<FinishedDownloadChoice?> askToDeleteFinishedDownload(
  AggregatedItem item,
) async {
  final context = appRouter.routerDelegate.navigatorKey.currentContext;
  if (context == null || !context.mounted) return null;
  final l10n = AppLocalizations.of(context);
  return showFocusRestoringDialog<FinishedDownloadChoice>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(l10n.deleteFinishedDownloadTitle),
      content: Text(l10n.deleteFinishedDownloadMessage(item.displayTitle)),
      actions: [
        adaptiveDialogAction(
          autofocus: true,
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.notNow),
        ),
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(ctx, FinishedDownloadChoice.keep),
          child: Text(l10n.keep),
        ),
        adaptiveDialogAction(
          isDestructive: true,
          onPressed: () => Navigator.pop(ctx, FinishedDownloadChoice.delete),
          child: Text(l10n.delete),
        ),
      ],
    ),
  );
}
