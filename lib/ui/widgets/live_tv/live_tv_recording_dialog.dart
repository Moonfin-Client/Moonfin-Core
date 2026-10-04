import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final cancelFocusNode = FocusNode(debugLabel: 'LiveTvRecordingDialogCancel');
  var cancelFocusRequested = false;

  return showFocusRestoringDialog<LiveTvRecordingAction>(
    context: context,
    builder: (dialogContext) {
      if (!cancelFocusRequested) {
        cancelFocusRequested = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (cancelFocusNode.context?.mounted == true) {
            cancelFocusNode.requestFocus();
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
            focusNode: cancelFocusNode,
            onPressed: () => choose(null),
            child: Text(l10n.exit),
          ),
        ],
      );
    },
  ).whenComplete(cancelFocusNode.dispose);
}
