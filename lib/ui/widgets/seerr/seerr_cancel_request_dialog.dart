import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_discover_view_model.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';

/// Confirms taking back the open requests on one quality track, then cancels
/// them.
///
/// Does nothing when the track has no request this viewer may cancel, so
/// callers can offer it without checking first.
Future<void> showSeerrCancelRequestDialog({
  required BuildContext context,
  required SeerrMediaDetailViewModel vm,
  required bool is4k,
}) async {
  final state = vm.state;
  final active = state.quality(is4k: is4k).cancelableRequests;
  if (active.isEmpty) return;

  final l10n = AppLocalizations.of(context);
  final title = state.displayTitle;
  final count = active.length;
  final message = count == 1
      ? l10n.cancelRequestForTitle(title)
      : l10n.cancelCountRequestsForTitle(count, title);
  final cancelLabel = is4k ? l10n.cancelRequest4k : l10n.cancelRequest;

  await showFocusRestoringDialog(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      backgroundColor: const Color(0xFF1A1A2E),
      title: Text(cancelLabel, style: const TextStyle(color: Colors.white)),
      content: Text(message, style: const TextStyle(color: Colors.white70)),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.keep),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            _cancel(vm, active);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red[300]),
          child: Text(cancelLabel),
        ),
      ],
    ),
  );
}

Future<void> _cancel(
  SeerrMediaDetailViewModel vm,
  List<SeerrRequest> requests,
) async {
  await vm.cancelRequests(requests.map((r) => r.id).toList());
  if (vm.state.requestError != null) return;

  // Discover caches the rows that still list this request, so drop them before
  // the viewer lands back on one.
  if (GetIt.instance.isRegistered<SeerrDiscoverViewModel>()) {
    GetIt.instance<SeerrDiscoverViewModel>().refresh();
  }
}
