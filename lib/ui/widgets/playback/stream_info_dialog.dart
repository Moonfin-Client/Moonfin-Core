import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/focus/key_event_utils.dart';
import '../track_selector_dialog.dart';

Future<void> showStreamInfoDialog({
  required BuildContext context,
  required String title,
  required List<Map<String, dynamic>> streamInfoSections,
  double maxWidth = 560,

  /// Optional buttons under the sections, laid out in a row.
  List<({String label, IconData icon, VoidCallback onPressed})> actions =
      const [],
}) async {
  const headerStyle = TextStyle(
    color: Colors.white,
    fontSize: AppTypography.fontSizeMd,
    fontWeight: FontWeight.w600,
  );
  const labelStyle = TextStyle(color: Colors.white54, fontSize: 13);
  const valueStyle = TextStyle(color: Colors.white, fontSize: 13);
  const boldValueStyle = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  const noteStyle = TextStyle(color: Colors.white54, fontSize: 12);
  final actionStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    side: ThemeRegistry.active.borders.chipBorder,
  );

  Widget infoRow(Map<String, dynamic> row) {
    final note = row['note']?.toString();
    if (note != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.spaceLg,
          0,
          AppSpacing.spaceLg,
          4,
        ),
        child: Text(note, style: noteStyle),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceLg,
        vertical: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(row['label']?.toString() ?? '', style: labelStyle),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              row['value']?.toString() ?? '',
              style: row['bold'] == true ? boldValueStyle : valueStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionHeader(String sectionTitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceMd,
        AppSpacing.spaceLg,
        4,
      ),
      child: Text(sectionTitle, style: headerStyle),
    );
  }

  Widget body(BuildContext dialogContext, ScrollController controller) {
    final scroll = arrowScrollHandler(controller);
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        // OK closes like Back, unless a desktop button below has focus.
        if (node.hasPrimaryFocus) {
          final result = handleOneShotSelect(
            event,
            () => Navigator.of(dialogContext).pop(),
          );
          if (result != KeyEventResult.ignored) return result;
        }
        return scroll(node, event);
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(
          dialogContext,
        ).copyWith(scrollbars: false),
        child: RawScrollbar(
          controller: controller,
          thumbVisibility: true,
          thickness: 3,
          radius: const Radius.circular(2),
          thumbColor: Colors.white30,
          crossAxisMargin: 5,
          minThumbLength: 24,
          child: ListView(
            controller: controller,
            shrinkWrap: true,
            children: [
              for (final section in streamInfoSections)
                if (((section['rows'] as List?) ?? const <dynamic>[])
                        .whereType<Map>()
                        .toList()
                    case final rows when rows.isNotEmpty) ...[
                  sectionHeader(section['title']?.toString() ?? ''),
                  for (final row in rows) infoRow(row.cast<String, dynamic>()),
                ],
              if (actions.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.spaceLg,
                    AppSpacing.spaceMd,
                    AppSpacing.spaceLg,
                    0,
                  ),
                  child: Wrap(
                    spacing: AppSpacing.spaceMd,
                    runSpacing: AppSpacing.spaceSm,
                    children: [
                      for (final action in actions)
                        OutlinedButton.icon(
                          onPressed: action.onPressed,
                          icon: Icon(action.icon),
                          label: Text(action.label),
                          style: actionStyle,
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ),
    );
  }

  final controller = ScrollController();
  try {
    await showStyledPlayerDialog<void>(
      context,
      title: title,
      maxWidth: maxWidth,
      builder: (dialogContext) => body(dialogContext, controller),
    );
  } finally {
    controller.dispose();
  }
}
