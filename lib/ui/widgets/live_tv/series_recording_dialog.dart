import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/models/series_recording_episodes.dart';
import '../../../data/services/recording_owners_service.dart';
import '../../../l10n/app_localizations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../overlay_sheet.dart';
import '../track_selector_dialog.dart';
import 'recording_owner_line.dart';
import 'shared_recording_warning.dart';

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
/// the rule changed. API errors reach the caller. When other users share the
/// rule, they are warned first that a change applies to everyone.
Future<bool> changeSeriesRecordingEpisodes({
  required BuildContext context,
  required LiveTvApi liveTvApi,
  required String seriesTimerId,
}) async {
  if (supportedRecordingOwners() != null) {
    final others = await freshOtherOwners(OwnedKind.series, seriesTimerId);
    if (!context.mounted) return false;
    if (others.isNotEmpty && !await confirmSharedSeriesChange(context)) {
      return false;
    }
    if (!context.mounted) return false;
  }
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

enum SeriesTimerOption { changeSettings, join, cancel }

/// What to do with an existing series recording, from a list of rules. With
/// [seriesTimerId], and a plugin that keeps owners, it names the other users
/// who record the series, and someone not recording it gets Add Series to My
/// Recordings in place of Series Settings.
Future<SeriesTimerOption?> showSeriesTimerOptionsDialog({
  required BuildContext context,
  required String name,
  String? subtitle,
  String? seriesTimerId,
}) {
  final l10n = AppLocalizations.of(context);
  final owners = seriesTimerId == null || seriesTimerId.isEmpty
      ? null
      : supportedRecordingOwners();
  if (owners != null) {
    unawaited(owners.lookup(seriesTimerIds: [seriesTimerId!]));
  }
  return showFocusRestoringDialog<SeriesTimerOption>(
    context: context,
    builder: (ctx) {
      void choose(SeriesTimerOption? option) =>
          Navigator.of(ctx, rootNavigator: true).pop(option);
      Widget build() {
        final others = owners == null
            ? const <RecordingOwner>[]
            : owners.othersOf(OwnedKind.series, seriesTimerId!);
        // Today's buttons until the owners are known.
        final join = owners?.isMine(OwnedKind.series, seriesTimerId!) == false;
        return AlertDialog.adaptive(
          backgroundColor: AppColorScheme.surface,
          title: Text(name, style: TextStyle(color: AppColorScheme.onBackground)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null && subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(color: AppColorScheme.onBackground.withValues(alpha: 0.7)),
                ),
              if (others.isNotEmpty) ...[
                const SizedBox(height: 12),
                RecordingOwnerLine(others: others),
              ],
            ],
          ),
          actions: [
            adaptiveDialogAction(
              onPressed: () => choose(null),
              child: Text(l10n.close),
            ),
            adaptiveDialogAction(
              onPressed: () => choose(
                join
                    ? SeriesTimerOption.join
                    : SeriesTimerOption.changeSettings,
              ),
              child: Text(
                join ? l10n.addSeriesToMyRecordings : l10n.seriesRecordingSettings,
              ),
            ),
            TextButton(
              onPressed: () => choose(SeriesTimerOption.cancel),
              style: TextButton.styleFrom(foregroundColor: AppColorScheme.statusError),
              child: Text(l10n.cancelSeriesRecording),
            ),
          ],
        );
      }

      return owners == null
          ? build()
          : ListenableBuilder(listenable: owners, builder: (_, _) => build());
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
