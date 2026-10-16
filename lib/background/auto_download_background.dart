import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../data/repositories/offline_repository.dart';
import '../data/services/auto_download_service.dart';
import '../data/services/pending_rating_store.dart';
import '../data/services/sync_service.dart';
import '../preference/user_preferences.dart';
import '../playback/headless_session_bootstrap.dart';

/// The work behind a background refresh, on any platform that can wake the
/// app: restore the session when the wake-up launched the app cold (no
/// window scene, so the startup screen never signs in), then run one
/// budgeted check. Returns whether the wake-up is done with, which
/// includes having had nothing to do.
///
/// Nobody signed in answers true rather than false, because this bool is
/// all the live-engine path reports, and a scheduler that hears a run
/// failed retries it. No amount of retrying finds a session.
Future<bool> runAutoDownloadBackgroundRefresh(Duration budget) async {
  final started = DateTime.now();
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<AutoDownloadService>()) {
    // Restoring the session registers the service as a side effect of
    // setActiveServerClient; nothing registered afterwards means nobody
    // is signed in.
    if (!getIt.isRegistered<HeadlessSessionBootstrap>()) return true;
    // Following a series with background checks on is the user's consent
    // to use the last account, even with auto sign-in off.
    await getIt<HeadlessSessionBootstrap>().ensureSession(
      ignoreDisabledLoginBehavior: true,
    );
    if (!getIt.isRegistered<AutoDownloadService>()) return true;
  }
  Duration remaining() {
    final left = budget - DateTime.now().difference(started);
    return left.isNegative ? Duration.zero : left;
  }

  final service = getIt<AutoDownloadService>();
  // Capped so a slow push leaves the check most of the budget.
  await _pushOfflineProgress(service.serverId)
      .timeout(budget ~/ 3, onTimeout: () {});
  final summary = await service.runCheck(
    trigger: AutoDownloadTrigger.backgroundRefresh,
    deadline: remaining(),
  );
  // The engine may be suspended or destroyed the moment this returns;
  // queued items must be in the native engine's hands by then.
  await service.downloader.waitForNativeHandoff(timeout: remaining());
  return summary.error == null;
}

/// Smart downloads swaps what the server says was watched, so an episode
/// watched offline is reported before the check, or a phone left on Wi-Fi
/// overnight would wait for the app to be opened. The headless Android
/// engine never registers the sync service, so one is built for the run.
Future<void> _pushOfflineProgress(String serverId) async {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<UserPreferences>() ||
      !getIt.isRegistered<MediaServerClient>() ||
      !getIt<UserPreferences>().get(UserPreferences.smartDownloadsEnabled)) {
    return;
  }
  final sync = getIt.isRegistered<SyncService>()
      ? getIt<SyncService>()
      : SyncService(getIt<OfflineRepository>(), getIt<PendingRatingStore>());
  try {
    await sync.syncPlaybackProgress(
      getIt<MediaServerClient>(),
      serverId: serverId,
    );
  } catch (e) {
    debugPrint('[AutoDownload] background: progress sync failed ($e)');
  }
}
