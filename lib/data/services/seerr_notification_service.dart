import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui/navigation/app_router.dart';
import '../../ui/navigation/deep_link_navigator.dart';
import '../../ui/widgets/floating_notification.dart';
import '../../ui/widgets/server_messages_dialog.dart';
import '../../util/platform_detection.dart';
import 'local_notification_bootstrap.dart';

class _NotificationCacheEntry {
  final DateTime timestamp;
  final bool hasRequest;

  const _NotificationCacheEntry({
    required this.timestamp,
    required this.hasRequest,
  });
}

class SeerrNotificationService {
  final Map<String, _NotificationCacheEntry> _recentEvents = {};

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

    // Key excludes requestId so Android request pushes (which omit requestId)
    // match stream copies (which include it).
    final dedupeKey = '$title\x1f$body\x1f$target';
    final now = DateTime.now();
    _recentEvents.removeWhere(
      (_, entry) => now.difference(entry.timestamp).inSeconds > 15,
    );

    final previous = _recentEvents[dedupeKey];
    if (previous != null) {
      // If a matching copy arrives with richer request metadata (e.g. stream
      // copy carrying requestId while earlier Android FCM push omitted it),
      // upgrade the local OS notification to show Approve/Deny actions without
      // displaying a second banner.
      if (asRequest && !previous.hasRequest) {
        _recentEvents[dedupeKey] = _NotificationCacheEntry(
          timestamp: now,
          hasRequest: true,
        );
        if (PlatformDetection.isMobile) {
          unawaited(
            LocalNotificationBootstrap.instance.plugin
                .cancel(id: target.hashCode)
                .catchError((_) {}),
          );
          _showLocal(title, body, target, requestId: requestId);
        }
      }
      return;
    }

    _recentEvents[dedupeKey] = _NotificationCacheEntry(
      timestamp: now,
      hasRequest: asRequest,
    );

    // Mobile shows the OS notification alongside the in-app banner; other
    // platforms only get the banner.
    if (PlatformDetection.isMobile) {
      _showLocal(title, body, target, requestId: asRequest ? requestId : null);
    }
    _showBanner(title, body, target);
  }

  void clearRecentEvents() => _recentEvents.clear();

  @visibleForTesting
  int get recentEventsCount => _recentEvents.length;

  @visibleForTesting
  bool? hasRequestMetadata(String title, String body, String route) {
    final dedupeKey = '$title\x1f$body\x1f${route.trim()}';
    return _recentEvents[dedupeKey]?.hasRequest;
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
      route.isEmpty
          ? null
          : () {
              if (route == serverMessagesPushRoute) {
                openServerMessagesFromNotification();
              } else {
                unawaited(openLinkedRoute(appRouter, route));
              }
            },
    );
  }

  Future<void> handleColdStart() async {
    final route = await LocalNotificationBootstrap.instance.getLaunchRoute();
    if (route == null) return;
    appRouter.go(route);
  }
}
