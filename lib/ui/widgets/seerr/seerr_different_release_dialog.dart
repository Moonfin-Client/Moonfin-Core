import 'package:flutter/material.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';

/// Confirms swapping the title's stuck download for another release, then has
/// Moonbase remove it and blocklist the release so the arr searches again.
///
/// Does nothing when there is no stuck download this viewer may remove, so
/// callers can offer it without checking first.
Future<void> showSeerrDifferentReleaseDialog({
  required BuildContext context,
  required SeerrMediaDetailViewModel vm,
}) async {
  final state = vm.state;
  final queue = state.arrQueue;
  final stuck = state.hd.replaceableDownload;
  final queueId = stuck?.stuckItemId;
  if (queue == null || stuck == null || queueId == null) return;

  final l10n = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.maybeOf(context);
  final service = queue.serviceName;
  final label = l10n.seerrGetDifferentRelease;

  await showFocusRestoringDialog(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      backgroundColor: const Color(0xFF1A1A2E),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      content: Text(
        l10n.seerrGetDifferentReleaseConfirm(
          service,
          stuck.stuckRelease ?? state.displayTitle,
        ),
        style: const TextStyle(color: Colors.white70),
      ),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(ctx);
            final done = await vm.getDifferentRelease(queueId: queueId);
            messenger?.showSnackBar(
              SnackBar(
                content: Text(
                  done
                      ? l10n.seerrGetDifferentReleaseDone(service)
                      : l10n.seerrGetDifferentReleaseFailed,
                ),
              ),
            );
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red[300]),
          child: Text(label),
        ),
      ],
    ),
  );
}
