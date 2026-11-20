import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui/navigation/app_router.dart';
import '../../ui/widgets/floating_notification.dart';
import '../../util/platform_detection.dart';
import 'local_notification_bootstrap.dart';

class SeerrNotificationService {
  final Map<String, DateTime> _recentEvents = {};

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
    final target = route.trim();
    final asRequest = isRequest && requestId != null && requestId.isNotEmpty;

    final dedupeKey = '$title\x1f$body\x1f$target\x1f${requestId ?? ''}';
    final now = DateTime.now();
    _recentEvents.removeWhere((_, time) => now.difference(time).inSeconds > 10);
    if (_recentEvents.containsKey(dedupeKey)) {
      return;
    }
    _recentEvents[dedupeKey] = now;

    // Mobile shows the OS notification alongside the in-app banner; other
    // platforms only get the banner.
    if (PlatformDetection.isMobile) {
      _showLocal(title, body, target, requestId: asRequest ? requestId : null);
    }
    _showBanner(title, body, target);
  }

  @visibleForTesting
  void clearRecentEvents() => _recentEvents.clear();

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
