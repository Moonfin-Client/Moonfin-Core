import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/clock_format.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';

enum LiveTvRecordingAction {
  recordProgram,
  recordSeries,
  cancelProgram,
  cancelSeries,
}

Future<LiveTvRecordingAction?> showLiveTvRecordingDialog({
  required BuildContext context,
  required String programName,
  String? programTime,
  String? episodeLine,
  required bool isSeries,
  required LiveTvRecordingState recording,
  bool use24HourClock = false,
}) {
  final l10n = AppLocalizations.of(context);
  final canCancelProgram = recording.timerId != null;
  final canCancelSeries = recording.seriesTimerId != null;
  final nextRecording = recording.nextSeriesRecording?.toLocal();
  final locale = Localizations.localeOf(context).toString();
  final closeFocusNode = FocusNode(debugLabel: 'LiveTvRecordingDialogClose');
  var closeFocusRequested = false;

  return showFocusRestoringDialog<LiveTvRecordingAction>(
    context: context,
    builder: (dialogContext) {
      if (!closeFocusRequested) {
        closeFocusRequested = true;
        // On TV a navigator observer focuses a new route's first focusable
        // after autofocus resolves, so Close takes the focus back here.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (closeFocusNode.context?.mounted == true) {
            closeFocusNode.requestFocus();
          }
        });
      }
      void choose(LiveTvRecordingAction? action) =>
          Navigator.of(dialogContext).pop(action);

      return AlertDialog.adaptive(
        title: Text(programName, style: const TextStyle(color: Colors.white)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (programTime != null)
                Text(
                  programTime,
                  style: const TextStyle(color: Colors.white70),
                ),
              if (episodeLine != null && episodeLine.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  episodeLine,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
              if (canCancelSeries) ...[
                const SizedBox(height: 12),
                Text(
                  nextRecording == null
                      ? l10n.noUpcomingSeriesRecording
                      : l10n.nextSeriesRecording(
                          '${DateFormat.yMMMd(locale).format(nextRecording)} · '
                          '${formatClockTime(nextRecording, use24Hour: use24HourClock)}',
                        ),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          adaptiveDialogAction(
            focusRingColor: AppColorScheme.accent,
            onPressed: () => choose(
              canCancelProgram
                  ? LiveTvRecordingAction.cancelProgram
                  : LiveTvRecordingAction.recordProgram,
            ),
            child: Text(
              canCancelProgram
                  ? l10n.cancelCurrentRecording
                  : (isSeries
                        ? l10n.recordCurrentEpisode
                        : l10n.recordCurrentProgram),
            ),
          ),
          if (canCancelSeries || isSeries)
            adaptiveDialogAction(
              focusRingColor: AppColorScheme.accent,
              onPressed: () => choose(
                canCancelSeries
                    ? LiveTvRecordingAction.cancelSeries
                    : LiveTvRecordingAction.recordSeries,
              ),
              child: Text(
                canCancelSeries
                    ? l10n.cancelSeriesRecording
                    : l10n.recordSeries,
              ),
            ),
          adaptiveDialogAction(
            autofocus: true,
            focusNode: closeFocusNode,
            focusRingColor: AppColorScheme.accent,
            onPressed: () => choose(null),
            child: Text(l10n.close),
          ),
        ],
      );
    },
  ).whenComplete(closeFocusNode.dispose);
}
