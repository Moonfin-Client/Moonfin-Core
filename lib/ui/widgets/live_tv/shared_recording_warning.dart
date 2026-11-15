import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/recording_owners_service.dart';
import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';

/// Warns that cancelling a recording other users also have stops it for all
/// of them. True when it is fine to go ahead: there are no [others], or the
/// user chose Cancel for Everyone.
Future<bool> confirmSharedCancel(
  BuildContext context,
  List<RecordingOwner> others,
) {
  if (others.isEmpty) return Future.value(true);
  final l10n = AppLocalizations.of(context);
  return _confirm(
    context,
    message: _capped(
      others,
      one: l10n.sharedCancelOne,
      two: l10n.sharedCancelTwo,
      many: l10n.sharedCancelMany,
    ),
    keepLabel: l10n.sharedKeep,
    goLabel: l10n.sharedCancelForEveryone,
  );
}

/// Asks before cancelling the [kind] recording [id]. When other users also own
/// it, only the shared warning shows; otherwise [confirm] runs (the screen's
/// own question, or none), so the user never answers two dialogs in a row.
/// A recording nobody owns (scheduled by another client, or made before the
/// plugin kept owners) never warns: unowned recordings are fair game, by the
/// owner's decision. True when it is fine to go ahead.
Future<bool> confirmRecordingCancel(
  BuildContext context,
  OwnedKind kind,
  String? id, {
  Future<bool> Function()? confirm,
}) async {
  final others = id == null || id.isEmpty
      ? const <RecordingOwner>[]
      : await freshOtherOwners(kind, id);
  if (!context.mounted) return false;
  if (others.isNotEmpty) return confirmSharedCancel(context, others);
  return confirm == null ? true : confirm();
}

/// Warns that deleting a recording other users also have removes it for all
/// of them. Callers ask only when other owners are known; a recording nobody
/// owns (made by another client or before the plugin kept owners) never
/// warns, by the owner's decision. True when it is fine to go ahead.
Future<bool> confirmSharedDelete(
  BuildContext context,
  List<RecordingOwner> others,
) {
  if (others.isEmpty) return Future.value(true);
  final l10n = AppLocalizations.of(context);
  return _confirm(
    context,
    message: _capped(
      others,
      one: l10n.sharedDeleteOne,
      two: l10n.sharedDeleteTwo,
      many: l10n.sharedDeleteMany,
    ),
    keepLabel: l10n.sharedKeep,
    goLabel: l10n.sharedDeleteForEveryone,
  );
}

/// Warns that changing a series recording other users share changes it for
/// all of them. The caller skips this when the rule has no other owners.
Future<bool> confirmSharedSeriesChange(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return _confirm(
    context,
    message: l10n.sharedSeriesChange,
    keepLabel: l10n.sharedKeepAsIs,
    goLabel: l10n.sharedChangeForEveryone,
  );
}

String _capped(
  List<RecordingOwner> others, {
  required String Function(String name) one,
  required String Function(String first, String second) two,
  required String Function(int count) many,
}) {
  switch (others.length) {
    case 1:
      return one(others[0].name);
    case 2:
      return two(others[0].name, others[1].name);
    default:
      return many(others.length);
  }
}

Future<bool> _confirm(
  BuildContext context, {
  required String message,
  required String keepLabel,
  required String goLabel,
}) async {
  final result = await showFocusRestoringDialog<bool>(
    context: context,
    closeKeys: {LogicalKeyboardKey.mediaRecord},
    builder: (dialogContext) => AlertDialog.adaptive(
      content: SingleChildScrollView(
        child: Text(message, style: TextStyle(color: AppColorScheme.onBackground)),
      ),
      actions: [
        // Keep comes first and holds the initial focus, so a stray Enter on a
        // remote never removes other people's recording.
        adaptiveDialogAction(
          focusRingColor: AppColorScheme.accent,
          autofocus: true,
          isDefault: true,
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(keepLabel),
        ),
        adaptiveDialogAction(
          focusRingColor: AppColorScheme.accent,
          isDestructive: true,
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(goLabel),
        ),
      ],
    ),
  );
  return result ?? false;
}
