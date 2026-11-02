import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';
import 'clean_settings_typography.dart';
import 'preference_tiles.dart';

/// A checklist of [items] (key to label) that starts from [selected] and
/// returns the ticked keys on Save, or null on Cancel. Save and the ticked
/// rows sit at the top so a long list never buries them. With [maxSelected]
/// set, Select All goes away, and once that many are ticked the other rows dim
/// and ignore a tick but stay focusable so the D-pad keeps its place.
Future<Set<String>?> showMultiSelectDialog({
  required BuildContext context,
  required String title,
  required Map<String, String> items,
  required Set<String> selected,
  bool sortByLabel = true,
  int? maxSelected,
}) {
  final l10n = AppLocalizations.of(context);
  final entries = items.entries.toList();
  if (sortByLabel) {
    entries.sort(
      (a, b) => a.value.toLowerCase().compareTo(b.value.toLowerCase()),
    );
  }
  // Ordered once on open, so a tick never moves the row under the D-pad.
  final orderedEntries = [
    ...entries.where((e) => selected.contains(e.key)),
    ...entries.where((e) => !selected.contains(e.key)),
  ];
  final working = Set<String>.from(selected);
  return showFocusRestoringDialog<Set<String>>(
    context: context,
    useRootNavigator: false,
    builder: (dialogContext) {
      var popped = false;
      final closeOnce = createDialogBackCloseHandler(dialogContext);
      return Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (_, event) {
          if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
          if (event is KeyDownEvent || event is KeyUpEvent) {
            closeOnce();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: FocusScope(
          autofocus: true,
          child: StatefulBuilder(
            builder: (builderContext, setDialogState) {
              final full =
                  maxSelected != null && working.length >= maxSelected;
              return withCleanSettingsTypography(
                builderContext,
                AlertDialog.adaptive(
                  title: Text(title),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Wraps so longer translations fit a phone's width.
                        Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: [
                            if (maxSelected == null)
                              TextButton(
                                onPressed: () {
                                  setDialogState(
                                    () => working.addAll(items.keys),
                                  );
                                },
                                child: Text(l10n.selectAll),
                              ),
                            TextButton(
                              onPressed: () {
                                setDialogState(() => working.clear());
                              },
                              child: Text(l10n.clear),
                            ),
                            FilledButton(
                              onPressed: () {
                                if (popped) return;
                                popped = true;
                                Navigator.pop(dialogContext, working);
                              },
                              child: Text(l10n.save),
                            ),
                          ],
                        ),
                        // The Apple alert sizes its content by its intrinsic
                        // height, which a ListView can't report, so the rows
                        // sit in a Column.
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: orderedEntries.asMap().entries.map((
                                entry,
                              ) {
                                final i = entry.key;
                                final e = entry.value;
                                final ticked = working.contains(e.key);
                                final locked = full && !ticked;
                                return TvFocusHighlight(
                                  builder: (ctx, focused) => CheckboxListTile(
                                    autofocus: i == 0,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Opacity(
                                      opacity: locked ? 0.4 : 1,
                                      child: Text(e.value),
                                    ),
                                    value: ticked,
                                    onChanged: (checked) {
                                      if (checked == true && locked) return;
                                      setDialogState(() {
                                        if (checked == true) {
                                          working.add(e.key);
                                        } else {
                                          working.remove(e.key);
                                        }
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    adaptiveDialogAction(
                      onPressed: () {
                        if (popped) return;
                        popped = true;
                        Navigator.pop(dialogContext);
                      },
                      child: Text(l10n.cancel),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
