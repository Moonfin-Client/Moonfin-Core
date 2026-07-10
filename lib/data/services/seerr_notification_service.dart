import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui/navigation/app_router.dart';
import '../../ui/widgets/floating_notification.dart';
import '../../util/platform_detection.dart';
import 'local_notification_bootstrap.dart';

class SeerrNotificationService {
  static const _channelId = 'seerr_notifications';
  static const _channelName = 'Requests';
  static const _channelDesc = 'Seerr request and library notifications';

  Future<void> initialize() async {
    await LocalNotificationBootstrap.instance.initialize();
    LocalNotificationBootstrap.instance.attachMainIsolateActionHandler();
  }

  void show(
    String title,
    String body,
    String route, {
    String? requestId,
    bool isRequest = false,
  }) {
    if (route.trim().isEmpty) return;

    final asRequest = isRequest && requestId != null && requestId.isNotEmpty;

    // Mobile shows the OS notification alongside the in-app banner; other
    // platforms only get the banner.
    if (PlatformDetection.isMobile) {
      _showLocal(
        title,
        body,
        route.trim(),
        requestId: asRequest ? requestId : null,
      );
    }
    _showBanner(title, body, route.trim());
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
        title: title.isNotEmpty ? title : _channelName,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDesc,
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
      () => appRouter.go(route),
    );
  }

  Future<void> handleColdStart() async {
    final route = await LocalNotificationBootstrap.instance.getLaunchRoute();
    if (route == null) return;
    appRouter.go(route);
  }
}
