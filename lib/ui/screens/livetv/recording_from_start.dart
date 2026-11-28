import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';
import '../../navigation/playback_launcher.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/overlay_sheet.dart';

/// The recording [timerId] is making, picked out of the in-progress ones.
Map<String, dynamic>? activeRecordingForTimer(
  Iterable<dynamic> recordings,
  String timerId,
) {
  for (final recording in recordings.whereType<Map<String, dynamic>>()) {
    if (sameLiveTvId(recording['TimerId'], timerId)) return recording;
  }
  return null;
}

/// Tuning to a channel whose current program is being recorded asks whether
/// to watch it live or from the start of the recording. Returns false to tune
/// live, true once the recording is playing, and null when the viewer backs
/// out of the question.
Future<bool?> offerRecordingFromStart(
  BuildContext context, {
  required String timerId,
}) async {
  final client = GetIt.instance<MediaServerClient>();
  Map<String, dynamic>? found;
  try {
    final response = await client.liveTvApi.getRecordings(
      isInProgress: true,
      fields: 'DateCreated',
    );
    found = activeRecordingForTimer(
      (response['Items'] as List?) ?? const [],
      timerId,
    );
  } catch (_) {}
  final recording = found;
  if (recording == null || !context.mounted) return false;

  final l10n = AppLocalizations.of(context);
  final fromStart = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog.adaptive(
      backgroundColor: AppColorScheme.surface,
      title: Text(
        recording['Name']?.toString() ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      content: Text(
        l10n.liveTvRecordingFromStartPrompt,
        style: const TextStyle(color: Colors.white70),
      ),
      actions: [
        adaptiveDialogAction(
          focusRingColor: AppColorScheme.accent,
          autofocus: true,
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(l10n.watchChannelLive),
        ),
        adaptiveDialogAction(
          focusRingColor: AppColorScheme.accent,
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(l10n.liveTvWatchFromStart),
        ),
      ],
    ),
  );
  if (fromStart != true) return fromStart;
  if (!context.mounted) return null;

  final manager = GetIt.instance<PlaybackManager>();
  final item = AggregatedItem(
    id: recording['Id'].toString(),
    serverId: GetIt.instance<MediaServerClientFactory>().serverIdOf(client),
    rawData: recording,
  );
  await launchPlayerWhilePreparing(
    context,
    manager: manager,
    destination: Destinations.videoPlayer,
    startPlayback: (session) async {
      await runPlaybackStart(session, () => manager.playItems([item]));
      return true;
    },
  );
  return true;
}
