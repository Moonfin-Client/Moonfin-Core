import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/clock_format.dart';
import '../../util/error_message.dart';
import '../adaptive/adaptive_dialog.dart';
import '../emby_premiere_dialog.dart';
import '../overlay_sheet.dart';
import 'incomplete_recording.dart';
import 'series_recording_dialog.dart';

enum LiveTvRecordingAction {
  recordProgram,
  recordSeries,
  changeSeries,
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
              if (canCancelSeries && !canCancelProgram) ...[
                const SizedBox(height: 12),
                Text(
                  l10n.seriesRecordingSkipsShowing,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
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
          if (canCancelSeries)
            adaptiveDialogAction(
              focusRingColor: AppColorScheme.accent,
              onPressed: () => choose(LiveTvRecordingAction.changeSeries),
              child: Text(l10n.seriesRecordingSettings),
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

/// Whether [program] is airing now, which is when a player can record it.
bool canRecordAiring(GuideProgram? program) {
  final now = DateTime.now();
  return program != null &&
      program.id.isNotEmpty &&
      !now.isBefore(program.startDate) &&
      now.isBefore(program.endDate);
}

/// Offers the recording choices for the airing a player is on and carries out
/// the one picked. Answers with what to tell the viewer, or null when there is
/// nothing to say. [stillOnProgram] says whether the player still shows
/// [program], which a dialog or a slow request can outlive.
Future<String?> runLiveTvRecordingFlow({
  required BuildContext context,
  required LiveTvApi liveTvApi,
  required GuideProgram program,
  required LiveTvRecordingState recording,
  required String programTime,
  required String channel,
  required bool use24HourClock,
  required bool Function() stillOnProgram,
}) async {
  final l10n = AppLocalizations.of(context);
  final action = await showLiveTvRecordingDialog(
    context: context,
    programName: program.name,
    programTime: programTime,
    episodeLine: program.episodeLine,
    isSeries: program.isSeries,
    recording: recording,
    use24HourClock: use24HourClock,
  );
  if (action == null || !context.mounted || !stillOnProgram()) return null;
  if (!canRecordAiring(program) &&
      (action == LiveTvRecordingAction.recordProgram ||
          action == LiveTvRecordingAction.recordSeries)) {
    return null;
  }

  try {
    final String? message;
    switch (action) {
      case LiveTvRecordingAction.recordProgram:
        final outcome = await recordAiring(
          context: context,
          programId: program.id,
          programName: program.name,
          programStart: program.startDate,
          rawProgram: program.rawData,
          createTimer: () => liveTvApi.createTimer(program.id),
          stillValid: () => context.mounted && stillOnProgram(),
          channel: channel,
        );
        if (outcome == RecordAiringOutcome.cancelled) return null;
        message = recordAiringMessage(l10n, outcome);
      case LiveTvRecordingAction.recordSeries:
        final episodes = await showSeriesRecordingEpisodesDialog(
          context: context,
        );
        if (episodes == null ||
            !context.mounted ||
            !stillOnProgram() ||
            !canRecordAiring(program)) {
          return null;
        }
        await liveTvApi.createSeriesTimer(
          program.id,
          settings: episodes.settings,
        );
        message = l10n.seriesSetToRecord;
      case LiveTvRecordingAction.changeSeries:
        final changed = await changeSeriesRecordingEpisodes(
          context: context,
          liveTvApi: liveTvApi,
          seriesTimerId: recording.seriesTimerId!,
        );
        if (!changed) return null;
        message = l10n.seriesRecordingUpdated;
      case LiveTvRecordingAction.cancelProgram:
        await liveTvApi.cancelTimer(recording.timerId!);
        message = l10n.recordingCancelled;
      case LiveTvRecordingAction.cancelSeries:
        await liveTvApi.cancelSeriesTimer(recording.seriesTimerId!);
        message = l10n.seriesRecordingCancelled;
    }
    // Changing a series rule already announced itself.
    if (action != LiveTvRecordingAction.changeSeries) {
      notifyLiveTvRecordingsChanged();
    }
    return message;
  } catch (e) {
    if (isPremiereError(e)) {
      if (context.mounted) await showPremiereRequiredDialog(context);
      return null;
    }
    return switch (action) {
      LiveTvRecordingAction.recordProgram => l10n.unableToCreateRecording,
      LiveTvRecordingAction.recordSeries => l10n.unableToCreateSeriesRecording,
      LiveTvRecordingAction.changeSeries => l10n.failedToUpdateSeriesRecording,
      LiveTvRecordingAction.cancelProgram => l10n.failedToCancelRecording,
      LiveTvRecordingAction.cancelSeries => l10n.failedToCancelSeriesRecording,
    };
  }
}
