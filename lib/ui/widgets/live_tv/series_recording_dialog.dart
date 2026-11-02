import 'package:flutter/material.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/models/series_recording_episodes.dart';
import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';
import '../track_selector_dialog.dart';

/// Asks which episodes a series recording takes, in the same list picker as
/// audio and subtitle tracks. Back returns null. [current] is the rule's
/// present choice when changing an existing recording; a new recording starts
/// on Not Already Recorded.
Future<SeriesRecordingEpisodes?> showSeriesRecordingEpisodesDialog({
  required BuildContext context,
  SeriesRecordingEpisodes? current,
}) async {
  final l10n = AppLocalizations.of(context);
  const options = SeriesRecordingEpisodes.values;
  final index = await TrackSelectorDialog.show(
    context,
    title: l10n.seriesRecordingEpisodesQuestion,
    options: [
      for (final option in options)
        TrackOption(
          label: _label(l10n, option),
          subtitle: _description(l10n, option),
          subtitleMaxLines: 2,
        ),
    ],
    selectedIndex: options.indexOf(
      current ?? SeriesRecordingEpisodes.notRecorded,
    ),
  );
  return index == null ? null : options[index];
}

/// Shows an existing rule's choice and saves a different one. Returns whether
/// the rule changed. API errors reach the caller.
Future<bool> changeSeriesRecordingEpisodes({
  required BuildContext context,
  required LiveTvApi liveTvApi,
  required String seriesTimerId,
}) async {
  final timer = await liveTvApi.getSeriesTimer(seriesTimerId);
  if (!context.mounted) return false;
  final current = SeriesRecordingEpisodes.fromSeriesTimer(timer);
  final choice = await showSeriesRecordingEpisodesDialog(
    context: context,
    current: current,
  );
  if (choice == null || choice == current) return false;
  await liveTvApi.updateSeriesTimer(seriesTimerId, {
    ...timer,
    ...choice.settings,
  });
  notifyLiveTvRecordingsChanged();
  return true;
}

enum SeriesTimerOption { changeSettings, cancel }

/// What to do with an existing series recording, from a list of rules.
Future<SeriesTimerOption?> showSeriesTimerOptionsDialog({
  required BuildContext context,
  required String name,
  String? subtitle,
}) {
  final l10n = AppLocalizations.of(context);
  return showFocusRestoringDialog<SeriesTimerOption>(
    context: context,
    builder: (ctx) {
      void choose(SeriesTimerOption? option) =>
          Navigator.of(ctx, rootNavigator: true).pop(option);
      return AlertDialog.adaptive(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null && subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              ),
          ],
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => choose(null),
            child: Text(l10n.close),
          ),
          adaptiveDialogAction(
            onPressed: () => choose(SeriesTimerOption.changeSettings),
            child: Text(l10n.seriesRecordingSettings),
          ),
          TextButton(
            onPressed: () => choose(SeriesTimerOption.cancel),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.cancelSeriesRecording),
          ),
        ],
      );
    },
  );
}

String _label(AppLocalizations l10n, SeriesRecordingEpisodes option) =>
    switch (option) {
      SeriesRecordingEpisodes.all => l10n.seriesRecordingAllEpisodes,
      SeriesRecordingEpisodes.notRecorded =>
        l10n.seriesRecordingNotRecordedEpisodes,
      SeriesRecordingEpisodes.newOnly => l10n.seriesRecordingNewEpisodesOnly,
    };

String _description(AppLocalizations l10n, SeriesRecordingEpisodes option) =>
    switch (option) {
      SeriesRecordingEpisodes.all => l10n.seriesRecordingAllEpisodesDescription,
      SeriesRecordingEpisodes.notRecorded =>
        l10n.seriesRecordingNotRecordedEpisodesDescription,
      SeriesRecordingEpisodes.newOnly =>
        l10n.seriesRecordingNewEpisodesOnlyDescription,
    };
