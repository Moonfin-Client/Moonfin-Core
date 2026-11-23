import 'package:drift/drift.dart' show Value;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:server_iptv/server_iptv.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../l10n/current_app_localizations.dart';
import '../../../ui/navigation/destinations.dart';
import '../../../util/platform_detection.dart';
import '../local_notification_bootstrap.dart';

/// Schedules a local notification shortly before a guide program starts.
/// Reminders live in the IPTV catalog database, and pending notifications are
/// re-armed on session start in case the OS dropped them.
class IptvReminderService {
  static const _channelId = 'iptv_reminders';
  static const _lead = Duration(minutes: 5);

  /// Platforms where the notifications plugin can schedule ahead of time.
  static bool get supported =>
      !PlatformDetection.isAppleTV &&
      (PlatformDetection.isAndroid ||
          PlatformDetection.isIOS ||
          PlatformDetection.isMacOS);

  final IptvDatabase _db;
  late final RemindersRepository _reminders = RemindersRepository(_db);
  final LocalNotificationBootstrap _bootstrap =
      LocalNotificationBootstrap.instance;
  bool _ready = false;

  IptvReminderService(this._db);

  Future<void> _ensureReady() async {
    if (_ready) return;
    await _bootstrap.initialize();
    final android = _bootstrap.plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await android?.requestNotificationsPermission();
    final l10n = currentAppLocalizations();
    await android?.createNotificationChannel(
      AndroidNotificationChannel(
        _channelId,
        l10n.iptvReminderChannelName,
        description: l10n.iptvReminderChannelDescription,
        importance: Importance.high,
      ),
    );
    await _bootstrap.plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, sound: true);
    await _bootstrap.plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, sound: true);
    _ready = true;
  }

  /// Derives a stable notification id from the channel row and start time so
  /// the same program always maps to the same reminder.
  int _notificationIdFor(int channelRowId, DateTime start) {
    final base = start.toUtc().millisecondsSinceEpoch ~/ 1000;
    return (base ^ (channelRowId * 2654435761)).toUnsigned(31);
  }

  int? _idFor(String channelItemId, DateTime start) {
    final decoded = IptvId.tryParse(channelItemId);
    if (decoded is! IptvChannelId) return null;
    return _notificationIdFor(decoded.channelRowId, start);
  }

  Future<bool> isReminderSet({
    required String channelItemId,
    required DateTime start,
  }) async {
    final id = _idFor(channelItemId, start);
    if (id == null) return false;
    return _reminders.exists(id);
  }

  Future<void> addReminder({
    required String channelItemId,
    required String title,
    required DateTime start,
  }) async {
    final decoded = IptvId.tryParse(channelItemId);
    if (decoded is! IptvChannelId) return;
    await _ensureReady();
    final notifId = _notificationIdFor(decoded.channelRowId, start);
    await _schedule(notifId, title, start);
    await _reminders.add(
      RemindersCompanion.insert(
        title: title,
        programStart: start,
        notificationId: notifId,
        channelId: Value(decoded.channelRowId),
      ),
    );
  }

  Future<void> removeReminder({
    required String channelItemId,
    required DateTime start,
  }) async {
    final id = _idFor(channelItemId, start);
    if (id == null) return;
    await _bootstrap.plugin.cancel(id: id);
    await _reminders.removeByNotificationId(id);
  }

  Future<void> _schedule(int notifId, String title, DateTime start) async {
    final fireAt = start.subtract(_lead);
    final when = fireAt.isAfter(DateTime.now())
        ? fireAt
        : DateTime.now().add(const Duration(seconds: 2));
    final l10n = currentAppLocalizations();
    await _bootstrap.plugin.zonedSchedule(
      id: notifId,
      title: title,
      body: l10n.iptvReminderStartsAt(DateFormat.Hm().format(start.toLocal())),
      // An absolute UTC instant fires at the right moment without needing the
      // device timezone database.
      scheduledDate: tz.TZDateTime.from(when.toUtc(), tz.UTC),
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          l10n.iptvReminderChannelName,
          channelDescription: l10n.iptvReminderChannelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
        macOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: Destinations.liveTv,
    );
  }

  /// Prunes reminders that already aired and re-arms the rest.
  Future<void> rescheduleAll() async {
    if (!supported) return;
    try {
      final now = DateTime.now();
      await _reminders.removePast(now);
      final upcoming = await _reminders.getUpcoming(now);
      // Getting ready asks for notification permission, so skip it until a
      // reminder actually needs arming.
      if (upcoming.isEmpty) return;
      await _ensureReady();
      for (final reminder in upcoming) {
        if (reminder.programStart.subtract(_lead).isBefore(now)) continue;
        await _schedule(
          reminder.notificationId,
          reminder.title,
          reminder.programStart,
        );
      }
    } catch (_) {}
  }
}
