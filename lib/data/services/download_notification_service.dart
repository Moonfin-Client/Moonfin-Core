import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../l10n/current_app_localizations.dart';
import '../../util/platform_detection.dart';
import 'local_notification_bootstrap.dart';

class DownloadNotificationService {
  static const _channelId = 'moonfin_downloads';
  static const _channelName = 'Downloads';
  static const _channelDesc = 'Shows download progress for offline media';
  static const _progressNotificationId = 1000;
  static const _completionNotificationId = 1001;
  static const _remoteMessageNotificationId = 1002;
  static const _storageNotificationId = 1003;

  FlutterLocalNotificationsPlugin get _plugin =>
      LocalNotificationBootstrap.instance.plugin;

  bool _initialized = false;
  DateTime _lastUpdate = DateTime.fromMillisecondsSinceEpoch(0);
  bool _foregroundServiceRunning = false;
  String? _lastProgressSignature;

  Future<void>? _pendingNotification;

  Future<void> initialize() async {
    if (_initialized) return;

    await LocalNotificationBootstrap.instance.initialize();
    _initialized = true;

    if (PlatformDetection.isAndroid) {
      try {
        await _plugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
      } catch (_) {}
    }
  }

  bool _permissionRequested = false;

  /// Asks iOS for notification permission the first time a download starts,
  /// so the prompt appears next to the action it explains. Android asks at
  /// start-up above. The plugin and this service both post through the
  /// notification center, so one grant covers every download notification.
  Future<void> requestPermissionIfNeeded() async {
    if (!_initialized || _permissionRequested) return;
    _permissionRequested = true;
    if (!PlatformDetection.isIOS) return;
    try {
      await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } catch (_) {}
  }

  Future<void> showProgress({
    required String itemName,
    required double progress,
    int batchTotal = 0,
    int batchCompleted = 0,
  }) async {
    if (!_initialized) return;

    final percent = progress >= 0 ? (progress * 100).round() : -1;
    final signature = '$itemName\n$batchCompleted/$batchTotal\n$percent';

    if (signature == _lastProgressSignature) {
      return;
    }

    final now = DateTime.now();
    if (now.difference(_lastUpdate).inMilliseconds < 1500) return;
    _lastUpdate = now;
    _lastProgressSignature = signature;

    final l10n = currentAppLocalizations();
    final title = batchTotal > 1
        ? l10n.downloadNotificationRunningBatch(batchCompleted + 1, batchTotal)
        : l10n.downloadNotificationRunning;
    final body = percent >= 0
        ? l10n.downloadNotificationProgress(itemName, percent)
        : l10n.downloadNotificationStarting(itemName);

    final previous = _pendingNotification;
    final completer = Completer<void>();
    _pendingNotification = completer.future;

    try {
      if (previous != null) await previous;

      if (PlatformDetection.isAndroid) {
        await _showAndroidForegroundProgress(title, body, percent);
      } else {
        await _showStandardProgress(title, body, percent);
      }
    } catch (_) {
    } finally {
      completer.complete();
    }
  }

  /// [batchSeries] names the show when every item of a finished batch
  /// belongs to it, so a season reads "Series: 8 episodes".
  Future<void> showComplete({
    required String itemName,
    int batchTotal = 0,
    String? batchSeries,
  }) async {
    if (!_initialized) return;
    _lastProgressSignature = null;
    await _stopForegroundService();

    final l10n = currentAppLocalizations();
    final title = l10n.downloadNotificationCompleteTitle(
      batchTotal > 1 ? batchTotal : 1,
    );
    final body = batchTotal > 1
        ? batchSeries != null
              ? l10n.downloadNotificationSeriesEpisodes(batchSeries, batchTotal)
              : l10n.downloadNotificationSavedCount(batchTotal)
        : l10n.downloadNotificationSaved(itemName);
    await _showSimple(_completionNotificationId, title, body);
  }

  Future<void> showError({
    required String itemName,
    required String error,
  }) async {
    if (!_initialized) return;
    _lastProgressSignature = null;
    await _stopForegroundService();
    final l10n = currentAppLocalizations();
    await _showSimple(
      _completionNotificationId,
      l10n.downloadNotificationFailedTitle,
      l10n.downloadNotificationFailedBody(itemName, error),
    );
  }

  /// The automatic check held new episodes back for lack of space.
  Future<void> showStorageFull({
    required int count,
    required String firstLabel,
    required String firstSize,
  }) async {
    if (!_initialized) return;
    final l10n = currentAppLocalizations();
    await _showSimple(
      _storageNotificationId,
      l10n.autoDownloadStorageFullTitle,
      l10n.autoDownloadStorageFullBody(count, firstLabel, firstSize),
    );
  }

  Future<void> showRemoteMessage({
    required String text,
    String? header,
  }) async {
    if (!_initialized) return;
    final l10n = currentAppLocalizations();
    final title = (header != null && header.trim().isNotEmpty)
        ? header.trim()
        : l10n.serverMessagesNotificationTitle;
    final body = text.trim().isNotEmpty
        ? text.trim()
        : l10n.serverMessagesNotificationReceived;
    await _showSimple(_remoteMessageNotificationId, title, body);
  }

  Future<void> dismiss() async {
    if (!_initialized) return;
    _lastProgressSignature = null;
    await _stopForegroundService();
    await _plugin.cancel(id: _progressNotificationId);
  }

  Future<void> _showAndroidForegroundProgress(
      String title, String body, int percent) async {
    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.low,
      priority: Priority.low,
      ongoing: true,
      autoCancel: false,
      showProgress: true,
      maxProgress: 100,
      progress: percent >= 0 ? percent : 0,
      indeterminate: percent < 0,
      category: AndroidNotificationCategory.progress,
    );

    final details = NotificationDetails(android: androidDetails);

    if (!_foregroundServiceRunning) {
      try {
        final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
        await androidPlugin?.startForegroundService(
          id: _progressNotificationId,
          title: title,
          body: body,
          notificationDetails: androidDetails,
          foregroundServiceTypes: {
            AndroidServiceForegroundType.foregroundServiceTypeDataSync,
          },
        );
        _foregroundServiceRunning = true;
      } catch (_) {
        await _plugin.show(id: _progressNotificationId, title: title, body: body, notificationDetails: details);
      }
    } else {
      await _plugin.show(id: _progressNotificationId, title: title, body: body, notificationDetails: details);
    }
  }

  Future<void> _showStandardProgress(
      String title, String body, int percent) async {
    await _plugin.show(
      id: _progressNotificationId,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        iOS: DarwinNotificationDetails(),
        macOS: DarwinNotificationDetails(),
        linux: LinuxNotificationDetails(),
      ),
    );
  }

  Future<void> _showSimple(int id, String title, String body) async {
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDesc,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          autoCancel: true,
        ),
        iOS: const DarwinNotificationDetails(),
        macOS: const DarwinNotificationDetails(),
        linux: const LinuxNotificationDetails(),
      ),
    );
  }

  Future<void> _stopForegroundService() async {
    if (!_foregroundServiceRunning) return;
    try {
      final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin
          ?.stopForegroundService()
          .timeout(const Duration(seconds: 5));
    } catch (_) {
    }
    _foregroundServiceRunning = false;
    try {
      await _plugin.cancel(id: _progressNotificationId)
          .timeout(const Duration(seconds: 5));
    } catch (_) {
    }
  }
}
