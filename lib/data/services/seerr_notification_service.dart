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

typedef LocalNotificationPresenter = Future<void> Function({
  required int id,
  required String title,
  required String body,
  required NotificationDetails notificationDetails,
  String? payload,
});

typedef NotificationCanceler = Future<void> Function(int id);

typedef BannerPresenter = void Function(
  String title,
  String body,
  VoidCallback? onTap,
);

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

  @visibleForTesting
  LocalNotificationPresenter? localNotificationPresenter;

  @visibleForTesting
  NotificationCanceler? notificationCanceler;

  @visibleForTesting
  BannerPresenter? bannerPresenter;

  @visibleForTesting
  Future<String?> Function()? launchRouteResolver;

  @visibleForTesting
  void Function(String route)? routeNavigator;

  @visibleForTesting
  VoidCallback? serverMessagesOpener;

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
      (_, entry) => now.difference(entry.timestamp) > const Duration(seconds: 15),
    );

    final nonRequestId = '$title\x1f$body\x1f$target'.hashCode;
    final previous = _recentEvents[dedupeKey];
    if (previous != null) {
      // If a matching copy arrives with richer request metadata (e.g. stream
      // copy carrying requestId while earlier Android FCM push omitted it),
      // upgrade the local OS notification silently so Approve/Deny actions
      // appear without re-alerting or displaying a second banner.
      if (asRequest && !previous.hasRequest) {
        _recentEvents[dedupeKey] = _NotificationCacheEntry(
          timestamp: now,
          hasRequest: true,
        );
        if (PlatformDetection.isMobile) {
          unawaited(
            _cancelLocal(nonRequestId).catchError((_) {}),
          );
          _showLocal(title, body, target, requestId: requestId, silent: true);
        }
      } else {
        // Refresh the sliding window timestamp on every matching copy while
        // preserving existing request metadata.
        _recentEvents[dedupeKey] = _NotificationCacheEntry(
          timestamp: now,
          hasRequest: previous.hasRequest,
        );
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

  Future<void> _cancelLocal(int id) async {
    try {
      final canceler = notificationCanceler;
      if (canceler != null) {
        await canceler(id);
      } else {
        await LocalNotificationBootstrap.instance.plugin.cancel(id: id);
      }
    } catch (_) {}
  }

  Future<void> _showLocal(
    String title,
    String body,
    String route, {
    String? requestId,
    bool silent = false,
  }) async {
    final isRequest = requestId != null && requestId.isNotEmpty;
    // Non-request notifications use an event-specific ID so distinct events
    // sharing a route do not collide or cancel each other.
    final nonRequestId = '$title\x1f$body\x1f$route'.hashCode;
    final id = isRequest ? requestId.hashCode : nonRequestId;
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

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        seerrNotificationChannelId,
        seerrNotificationChannelName,
        channelDescription: seerrNotificationChannelDesc,
        importance: silent ? Importance.low : Importance.defaultImportance,
        priority: silent ? Priority.low : Priority.defaultPriority,
        onlyAlertOnce: silent,
        playSound: !silent,
        enableVibration: !silent,
        silent: silent,
        autoCancel: true,
        actions: androidActions,
      ),
      iOS: DarwinNotificationDetails(
        // Without these, iOS shows nothing while the app is foreground.
        presentAlert: !silent,
        presentBanner: !silent,
        presentBadge: !silent,
        presentSound: !silent,
        categoryIdentifier:
            isRequest ? seerrRequestCategoryId : null,
      ),
      macOS: DarwinNotificationDetails(
        presentAlert: !silent,
        presentBanner: !silent,
        presentBadge: !silent,
        presentSound: !silent,
        categoryIdentifier:
            isRequest ? seerrRequestCategoryId : null,
      ),
      linux: const LinuxNotificationDetails(),
    );

    try {
      final presenter = localNotificationPresenter;
      if (presenter != null) {
        await presenter(
          id: id,
          title: title.isNotEmpty ? title : seerrNotificationChannelName,
          body: body,
          notificationDetails: details,
          payload: payload,
        );
      } else {
        await LocalNotificationBootstrap.instance.plugin.show(
          id: id,
          title: title.isNotEmpty ? title : seerrNotificationChannelName,
          body: body,
          notificationDetails: details,
          payload: payload,
        );
      }
    } catch (_) {}
  }

  void _showBanner(String title, String body, String route) {
    final VoidCallback? onTap = route.isEmpty
        ? null
        : () {
            if (route == serverMessagesPushRoute) {
              openServerMessagesFromNotification();
            } else {
              unawaited(openLinkedRoute(appRouter, route));
            }
          };

    final presenter = bannerPresenter;
    if (presenter != null) {
      presenter(title, body, onTap);
      return;
    }

    final context = appRouter.routerDelegate.navigatorKey.currentContext;
    if (context == null || !context.mounted) return;
    FloatingNotification.show(
      context,
      title,
      body,
      onTap,
    );
  }

  Future<void> handleColdStart() async {
    final route = launchRouteResolver != null
        ? await launchRouteResolver!()
        : await LocalNotificationBootstrap.instance.getLaunchRoute();
    if (route == null || route.trim().isEmpty) return;
    final trimmed = route.trim();
    if (trimmed == serverMessagesPushRoute) {
      if (serverMessagesOpener != null) {
        serverMessagesOpener!();
      } else {
        openServerMessagesFromNotification();
      }
      return;
    }
    if (routeNavigator != null) {
      routeNavigator!(trimmed);
    } else {
      appRouter.go(trimmed);
    }
  }
}
