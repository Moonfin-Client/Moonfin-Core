import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../track_selector_dialog.dart';

Future<void> showStreamInfoDialog({
  required BuildContext context,
  required String title,
  required List<Map<String, dynamic>> streamInfoSections,
  double maxWidth = 560,
}) async {
  final l10n = AppLocalizations.of(context);

  const headerStyle = TextStyle(
    color: Colors.white,
    fontSize: AppTypography.fontSizeMd,
    fontWeight: FontWeight.w600,
  );
  const labelStyle = TextStyle(color: Colors.white54, fontSize: 13);
  const valueStyle = TextStyle(color: Colors.white, fontSize: 13);
  const highlightValue = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  Widget infoRow(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceLg,
        vertical: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Flexible(
            child: Text(
              value,
              style: highlight ? highlightValue : valueStyle,
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

  Widget body(ScrollController controller) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }

        const step = 120.0;
        final key = event.logicalKey;
        if (key == LogicalKeyboardKey.arrowDown) {
          final max = controller.position.maxScrollExtent;
          final target = (controller.offset + step).clamp(0.0, max);
          unawaited(
            controller.animateTo(
              target,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
            ),
          );
          return KeyEventResult.handled;
        }
        if (key == LogicalKeyboardKey.arrowUp) {
          final max = controller.position.maxScrollExtent;
          final target = (controller.offset - step).clamp(0.0, max);
          unawaited(
            controller.animateTo(
              target,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
            ),
          );
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: ListView(
        controller: controller,
        children: [
          for (final section in streamInfoSections) ...[
            sectionHeader((section['title'] as String?) ?? l10n.unknown),
            ...(((section['rows'] as List?) ?? const <dynamic>[])
                .whereType<Map>()
                .map((rawRow) {
                  final row = rawRow.map(
                    (key, value) => MapEntry(key.toString(), value),
                  );
                  return infoRow(
                    row['label']?.toString() ?? l10n.unknown,
                    row['value']?.toString() ?? l10n.unknown,
                    highlight: row['highlight'] == true,
                  );
                })),
          ],
          const SizedBox(height: AppSpacing.spaceLg),
        ],
      ),
    );
  }

  final controller = ScrollController();
  try {
    await showStyledPlayerDialog<void>(
      context,
      title: title,
      maxWidth: maxWidth,
      builder: (_) => body(controller),
    );
  } finally {
    controller.dispose();
  }
}
