import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:server_core/server_core.dart';

import 'package:get_it/get_it.dart';

import '../data/services/download_notification_service.dart';
import '../di/injection.dart';
import '../di/modules/server_module.dart';
import '../playback/headless_session_bootstrap.dart';
import 'auto_download_background.dart';

/// Android: the auto-download worker's headless engine lands here when the
/// app process is not running. Brings up the downloads storage, restores
/// the saved sign-in and runs one budgeted check, then reports back so the
/// worker can finish and destroy the engine. Transfers queued by the check
/// keep running in background_downloader's foreground service.
Future<void> autoDownloadBackgroundMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('org.moonfin.androidtv/auto_download');

  var ok = false;
  // Nobody signed in: tells the worker to stop scheduling instead of
  // booting an engine every few hours for nothing.
  var permanent = false;
  try {
    final budgetSeconds = await channel.invokeMethod<int>('getBudget') ?? 0;
    await configureBackgroundDependencies(offline: true);

    // restoreClientOrThrow rather than ensureSession: the latter also wires
    // the playback resolver, which needs services this engine never
    // registers, and the throwing variant says why a restore failed.
    MediaServerClient? client;
    try {
      client = await HeadlessSessionBootstrap().restoreClientOrThrow(
        ignoreDisabledLoginBehavior: true,
      );
    } catch (e) {
      debugPrint('[AutoDownload] background: no session ($e)');
    }
    permanent = client == null;
    if (client != null) {
      setActiveServerClient(client, background: true);
      // Storage and failure notices come from Dart here; the plugin only
      // posts for transfers it runs.
      try {
        await GetIt.instance<DownloadNotificationService>().initialize();
      } catch (_) {}
      ok = await runAutoDownloadBackgroundRefresh(
        Duration(seconds: budgetSeconds),
      );
      debugPrint('[AutoDownload] background check finished, ok=$ok');
    }
  } catch (e, st) {
    debugPrint('[AutoDownload] background run failed: $e\n$st');
  }

  try {
    await channel.invokeMethod('backgroundComplete', {
      'ok': ok,
      'permanent': permanent,
    });
  } catch (_) {}
}
