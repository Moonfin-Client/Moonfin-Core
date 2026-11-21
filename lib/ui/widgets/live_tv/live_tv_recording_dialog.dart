import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/services/recording_owners_service.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/clock_format.dart';
import '../../util/error_message.dart';
import '../adaptive/adaptive_dialog.dart';
import '../emby_premiere_dialog.dart';
import '../overlay_sheet.dart';
import 'incomplete_recording.dart';
import 'recording_owner_line.dart';
import 'series_recording_dialog.dart';
import 'shared_recording_warning.dart';

enum LiveTvRecordingAction {
  recordProgram,
  recordSeries,
  changeSeries,
  cancelProgram,
  cancelSeries,

  /// Add to My Recordings: join the owners of the airing's timer.
  joinProgram,

  /// Add Series to My Recordings: join the owners of the series rule.
  joinSeries,
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
  final timerId = recording.timerId;
  final seriesTimerId = recording.seriesTimerId;
  // Who owns the timer and the rule, when the plugin keeps owners. Until the
  // lookup answers, the dialog shows today's buttons.
  final owners = canCancelProgram || canCancelSeries
      ? supportedRecordingOwners()
      : null;
  if (owners != null) {
    unawaited(
      owners.lookup(
        timerIds: [?timerId],
        seriesTimerIds: [?seriesTimerId],
      ),
    );
  }

  return showFocusRestoringDialog<LiveTvRecordingAction>(
    context: context,
    closeKeys: {LogicalKeyboardKey.mediaRecord},
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

      if (owners == null) {
        return _recordingDialog(
          l10n: l10n,
          programName: programName,
          programTime: programTime,
          episodeLine: episodeLine,
          isSeries: isSeries,
          canCancelProgram: canCancelProgram,
          canCancelSeries: canCancelSeries,
          nextRecording: nextRecording,
          locale: locale,
          use24HourClock: use24HourClock,
          closeFocusNode: closeFocusNode,
          choose: choose,
        );
      }
      return ListenableBuilder(
        listenable: owners,
        builder: (_, _) {
          final timerOthers = timerId == null
              ? const <RecordingOwner>[]
              : owners.othersOf(OwnedKind.timer, timerId);
          final seriesOthers = seriesTimerId == null
              ? const <RecordingOwner>[]
              : owners.othersOf(OwnedKind.series, seriesTimerId);
          return _recordingDialog(
            l10n: l10n,
            programName: programName,
            programTime: programTime,
            episodeLine: episodeLine,
            isSeries: isSeries,
            canCancelProgram: canCancelProgram,
            canCancelSeries: canCancelSeries,
            nextRecording: nextRecording,
            locale: locale,
            use24HourClock: use24HourClock,
            closeFocusNode: closeFocusNode,
            choose: choose,
            keyed: true,
            others: _mergeOwners(timerOthers, seriesOthers),
            // A series episode is joined through its series, so only a
            // one-off recording offers Add to My Recordings.
            joinProgram:
                timerId != null &&
                seriesTimerId == null &&
                owners.isMine(OwnedKind.timer, timerId) == false,
            joinSeries:
                seriesTimerId != null &&
                owners.isMine(OwnedKind.series, seriesTimerId) == false,
          );
        },
      );
    },
  ).whenComplete(closeFocusNode.dispose);
}

/// The owners in [a] and [b], each once.
List<RecordingOwner> _mergeOwners(
  List<RecordingOwner> a,
  List<RecordingOwner> b,
) {
  if (b.isEmpty) return a;
  if (a.isEmpty) return b;
  final seen = {for (final owner in a) owner.userId};
  return [...a, ...b.where((owner) => seen.add(owner.userId))];
}

/// The recording dialog itself. With no [others] and no join it is exactly
/// the dialog from before owners existed.
Widget _recordingDialog({
  required AppLocalizations l10n,
  required String programName,
  required String? programTime,
  required String? episodeLine,
  required bool isSeries,
  required bool canCancelProgram,
  required bool canCancelSeries,
  required DateTime? nextRecording,
  required String locale,
  required bool use24HourClock,
  required FocusNode closeFocusNode,
  required void Function(LiveTvRecordingAction? action) choose,
  List<RecordingOwner> others = const [],
  bool joinProgram = false,
  bool joinSeries = false,
  bool keyed = false,
}) {
  // With owners in play the buttons are [keyed], so the focused one keeps its
  // element when Add to My Recordings appears in front of it.
  Widget slot(String key, Widget child) =>
      keyed ? KeyedSubtree(key: ValueKey(key), child: child) : child;
  return AlertDialog.adaptive(
    title: Text(programName, style: TextStyle(color: AppColorScheme.onBackground)),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (others.isNotEmpty) ...[
            RecordingOwnerLine(others: others),
            const SizedBox(height: 8),
          ],
          if (programTime != null)
            Text(
              programTime,
              style: TextStyle(color: AppColorScheme.onBackground.withValues(alpha: 0.7)),
            ),
          if (episodeLine != null && episodeLine.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              episodeLine,
              style: TextStyle(color: AppColorScheme.onBackground.withValues(alpha: 0.7)),
            ),
          ],
          if (canCancelSeries && !canCancelProgram) ...[
            const SizedBox(height: 12),
            Text(
              l10n.seriesRecordingSkipsShowing,
              style: TextStyle(
                color: AppColorScheme.onBackground.withValues(alpha: 0.7),
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
              style: TextStyle(
                color: AppColorScheme.onBackground.withValues(alpha: 0.7),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    ),
    actions: [
      if (joinProgram)
        slot(
          'join',
          adaptiveDialogAction(
            focusRingColor: AppColorScheme.accent,
            onPressed: () => choose(LiveTvRecordingAction.joinProgram),
            child: Text(l10n.addToMyRecordings),
          ),
        ),
      slot(
        'program',
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
      ),
      if (canCancelSeries)
        slot(
          'seriesSettings',
          adaptiveDialogAction(
            focusRingColor: AppColorScheme.accent,
            onPressed: () => choose(
              joinSeries
                  ? LiveTvRecordingAction.joinSeries
                  : LiveTvRecordingAction.changeSeries,
            ),
            child: Text(
              joinSeries
                  ? l10n.addSeriesToMyRecordings
                  : l10n.seriesRecordingSettings,
            ),
          ),
        ),
      if (canCancelSeries || isSeries)
        slot(
          'series',
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
        ),
      slot(
        'close',
        adaptiveDialogAction(
          autofocus: true,
          focusNode: closeFocusNode,
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(null),
          child: Text(l10n.close),
        ),
      ),
    ],
  );
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
          createTimer: () => createTimerWithOwner(liveTvApi, program.id),
          stillValid: () => context.mounted && stillOnProgram(),
          channel: channel,
        );
        if (outcome == RecordAiringOutcome.cancelled) return null;
        message = recordAiringMessage(l10n, outcome, programId: program.id);
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
        await createSeriesTimerWithOwner(
          liveTvApi,
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
        // Other owners are warned first; nothing asked before owners existed.
        if (!await confirmRecordingCancel(
              context,
              OwnedKind.timer,
              recording.timerId,
            ) ||
            !context.mounted ||
            !stillOnProgram()) {
          return null;
        }
        await liveTvApi.cancelTimer(recording.timerId!);
        message = l10n.recordingCancelled;
      case LiveTvRecordingAction.cancelSeries:
        if (!await confirmRecordingCancel(
              context,
              OwnedKind.series,
              recording.seriesTimerId,
            ) ||
            !context.mounted ||
            !stillOnProgram()) {
          return null;
        }
        await liveTvApi.cancelSeriesTimer(recording.seriesTimerId!);
        message = l10n.seriesRecordingCancelled;
      case LiveTvRecordingAction.joinProgram:
        await joinRecording(OwnedKind.timer, recording.timerId!);
        message = l10n.programSetToRecord;
      case LiveTvRecordingAction.joinSeries:
        await joinRecording(OwnedKind.series, recording.seriesTimerId!);
        message = l10n.seriesSetToRecord;
    }
    // Changing a series rule and joining already announced themselves.
    if (action != LiveTvRecordingAction.changeSeries &&
        action != LiveTvRecordingAction.joinProgram &&
        action != LiveTvRecordingAction.joinSeries) {
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
      LiveTvRecordingAction.joinProgram => l10n.unableToCreateRecording,
      LiveTvRecordingAction.joinSeries => l10n.unableToCreateSeriesRecording,
    };
  }
}
