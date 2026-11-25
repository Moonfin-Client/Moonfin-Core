import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui/navigation/app_router.dart';
import '../../ui/navigation/destinations.dart';
import '../../ui/widgets/floating_notification.dart';
import '../../util/platform_detection.dart';
import 'local_notification_bootstrap.dart';

class SeerrNotificationService {
  /// How long a push that arrives while the app is open waits for the stream's
  /// copy of the same alert. The server sends the stream copy first.
  static const pushWait = Duration(seconds: 3);

  /// Either copy of an alert can arrive well after the other, so the one that
  /// showed keeps the other quiet for this long.
  static const copyWindow = Duration(minutes: 1);

  final Map<String, DateTime> _streamShown = {};
  final Map<String, DateTime> _pushShown = {};

  Future<void> initialize() async {
    await LocalNotificationBootstrap.instance.initialize();
    LocalNotificationBootstrap.instance.attachMainIsolateActionHandler();
  }

  /// Shows an alert from the plugin's live event stream.
  void show(
    String title,
    String body,
    String route, {
    String? requestId,
    bool isRequest = false,
  }) {
    final key = _alertKey(title, route);
    _forgetOld();
    // A push that showed while the stream lagged already covered this one.
    if (_pushShown.remove(key) != null) return;
    _streamShown[key] = clock.now();
    present(title, body, route, requestId: requestId, isRequest: isRequest);
  }

  /// Shows a push that arrived while the app was open, which Android and iOS
  /// leave undrawn. The stream usually brings the same alert, so the push only
  /// shows when that copy never came, like when the stream is down.
  Future<void> showPush(
    String title,
    String body,
    String route, {
    String? requestId,
    bool isRequest = false,
  }) async {
    final target = route.trim();
    // Watch parties raise their own alert in the app.
    if (target.startsWith(Destinations.watchParty)) return;
    if (title.isEmpty && body.isEmpty) return;

    await Future<void>.delayed(pushWait);
    final key = _alertKey(title, target);
    _forgetOld();
    if (_streamShown.containsKey(key)) return;
    _pushShown[key] = clock.now();
    present(title, body, target, requestId: requestId, isRequest: isRequest);
  }

  // A push can have a shorter body than its stream copy and no request id, so
  // only the title and route match them.
  static String _alertKey(String title, String route) =>
      '$title\n${route.trim()}';

  void _forgetOld() {
    final now = clock.now();
    bool old(String _, DateTime shownAt) =>
        now.difference(shownAt) > copyWindow;
    _streamShown.removeWhere(old);
    _pushShown.removeWhere(old);
  }

  @visibleForTesting
  void present(
    String title,
    String body,
    String route, {
    String? requestId,
    bool isRequest = false,
  }) {
    final target = route.trim();
    final asRequest = isRequest && requestId != null && requestId.isNotEmpty;

    // Mobile shows the OS notification alongside the in-app banner; other
    // platforms only get the banner.
    if (PlatformDetection.isMobile) {
      _showLocal(title, body, target, requestId: asRequest ? requestId : null);
    }
    _showBanner(title, body, target);
  }

  Future<void> _showLocal(
    String title,
    String body,
    String route, {
    String? requestId,
  }) async {
    final isRequest = requestId != null && requestId.isNotEmpty;
    // Request notifications get a stable id from the request so an approve/deny
    // action can later cancel the exact notification.
    final id = isRequest ? requestId.hashCode : route.hashCode;
    final payload = isRequest
        ? jsonEncode({'route': route, 'requestId': requestId, 'kind': 'request'})
        : route;

    final androidActions = isRequest
        ? const <AndroidNotificationAction>[
            AndroidNotificationAction(
              'approve',
              'Approve',
              showsUserInterface: false,
              cancelNotification: true,
            ),
            AndroidNotificationAction(
              'decline',
              'Deny',
              showsUserInterface: false,
              cancelNotification: true,
            ),
          ]
        : const <AndroidNotificationAction>[];

    try {
      await LocalNotificationBootstrap.instance.plugin.show(
        id: id,
        title: title.isNotEmpty ? title : seerrNotificationChannelName,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            seerrNotificationChannelId,
            seerrNotificationChannelName,
            channelDescription: seerrNotificationChannelDesc,
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
            autoCancel: true,
            actions: androidActions,
          ),
          iOS: DarwinNotificationDetails(
            // Without these, iOS shows nothing while the app is foreground.
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            categoryIdentifier:
                isRequest ? seerrRequestCategoryId : null,
          ),
          macOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            categoryIdentifier:
                isRequest ? seerrRequestCategoryId : null,
          ),
          linux: const LinuxNotificationDetails(),
        ),
        payload: payload,
      );
    } catch (_) {}
  }

  void _showBanner(String title, String body, String route) {
    final context = appRouter.routerDelegate.navigatorKey.currentContext;
    if (context == null || !context.mounted) return;
    FloatingNotification.show(
      context,
      title,
      body,
      route.isEmpty ? null : () => appRouter.go(route),
    );
  }

  Future<void> handleColdStart() async {
    final route = await LocalNotificationBootstrap.instance.getLaunchRoute();
    if (route == null) return;
    appRouter.go(route);
  }
}
