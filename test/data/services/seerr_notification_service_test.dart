import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr_notification_service.dart';

class _RecordedNotification {
  final int id;
  final String title;
  final String body;
  final NotificationDetails details;
  final String? payload;

  _RecordedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.details,
    required this.payload,
  });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SeerrNotificationService service;

  setUp(() {
    service = SeerrNotificationService();
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test('show deduplicates identical notifications within window and clears properly', () {
    expect(service.recentEventsCount, equals(0));

    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));

    // Second identical call within window is ignored
    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));

    // A different notification is accepted
    service.show('Title 2', 'Body 2', '/route/2');
    expect(service.recentEventsCount, equals(2));

    service.clearRecentEvents();
    expect(service.recentEventsCount, equals(0));

    // After clearing, Title 1 is accepted again
    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));
  });

  test('distinct notifications sharing a route get distinct IDs and do not collide', () {
    final recorded = <_RecordedNotification>[];
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    service.localNotificationPresenter = ({
      required id,
      required title,
      required body,
      required notificationDetails,
      payload,
    }) async {
      recorded.add(
        _RecordedNotification(
          id: id,
          title: title,
          body: body,
          details: notificationDetails,
          payload: payload,
        ),
      );
    };

    service.show('Movie A', 'Added Movie A', '/library');
    service.show('Movie B', 'Added Movie B', '/library');

    expect(recorded.length, equals(2));
    expect(recorded[0].id, isNot(equals(recorded[1].id)));
  });

  test('show upgrades local notification with request metadata, actions, cancellation, and silent alert', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    final presentedNotifications = <_RecordedNotification>[];
    final cancelledIds = <int>[];
    final presentedBanners = <String>[];

    service.localNotificationPresenter = ({
      required id,
      required title,
      required body,
      required notificationDetails,
      payload,
    }) async {
      presentedNotifications.add(
        _RecordedNotification(
          id: id,
          title: title,
          body: body,
          details: notificationDetails,
          payload: payload,
        ),
      );
    };

    service.notificationCanceler = (id) async {
      cancelledIds.add(id);
    };

    service.bannerPresenter = (title, body, onTap) {
      presentedBanners.add('$title: $body');
    };

    // 1. Android FCM push arrives first without requestId
    service.show(
      'Movie Requested',
      'User requested Inception',
      '/requests/99',
      requestId: null,
      isRequest: false,
    );

    expect(service.recentEventsCount, equals(1));
    expect(
      service.hasRequestMetadata('Movie Requested', 'User requested Inception', '/requests/99'),
      isFalse,
    );
    expect(presentedBanners.length, equals(1));
    expect(presentedNotifications.length, equals(1));
    expect(cancelledIds, isEmpty);

    // Initial non-request notification has no actions
    final initial = presentedNotifications.first;
    final expectedNonRequestId = 'Movie Requested\x1fUser requested Inception\x1f/requests/99'.hashCode;
    expect(initial.id, equals(expectedNonRequestId));
    expect(initial.payload, equals('/requests/99'));
    expect(initial.details.android?.actions, isEmpty);
    expect(initial.details.android?.playSound, isTrue);
    expect(initial.details.android?.onlyAlertOnce, isFalse);
    expect(initial.details.android?.silent, isFalse);
    expect(initial.details.iOS?.presentBanner, isTrue);

    // 2. Stream event arrives with requestId populated
    service.show(
      'Movie Requested',
      'User requested Inception',
      '/requests/99',
      requestId: '99',
      isRequest: true,
    );

    // Deduplication key matches, so metadata upgraded
    expect(service.recentEventsCount, equals(1));
    expect(
      service.hasRequestMetadata('Movie Requested', 'User requested Inception', '/requests/99'),
      isTrue,
    );

    // Banner is suppressed on upgrade
    expect(presentedBanners.length, equals(1));

    // Old non-request notification was cancelled
    expect(cancelledIds, contains(expectedNonRequestId));

    // Upgraded notification was posted with request actions and silent alert
    expect(presentedNotifications.length, equals(2));
    final upgraded = presentedNotifications[1];
    expect(upgraded.id, equals('99'.hashCode));
    expect(
      upgraded.payload,
      equals(jsonEncode({'route': '/requests/99', 'requestId': '99', 'kind': 'request'})),
    );

    final actions = upgraded.details.android?.actions ?? [];
    expect(actions.length, equals(2));
    expect(actions.map((a) => a.id).toList(), equals(['approve', 'decline']));

    // Silent upgrade options are applied to avoid alerting twice
    expect(upgraded.details.android?.onlyAlertOnce, isTrue);
    expect(upgraded.details.android?.playSound, isFalse);
    expect(upgraded.details.android?.enableVibration, isFalse);
    expect(upgraded.details.android?.silent, isTrue);
    expect(upgraded.details.android?.importance, equals(Importance.low));
    expect(upgraded.details.iOS?.presentSound, isFalse);
    expect(upgraded.details.iOS?.presentBanner, isFalse);

    // 3. Identical duplicate repeats remain completely suppressed
    service.show(
      'Movie Requested',
      'User requested Inception',
      '/requests/99',
      requestId: '99',
      isRequest: true,
    );
    expect(presentedNotifications.length, equals(2));
    expect(presentedBanners.length, equals(1));
  });

  group('handleColdStart', () {
    test('routes serverMessagesPushRoute to serverMessagesOpener', () async {
      var messagesOpened = false;
      String? routedPath;

      service.launchRouteResolver = () async => 'messages';
      service.serverMessagesOpener = () => messagesOpened = true;
      service.routeNavigator = (route) => routedPath = route;

      await service.handleColdStart();

      expect(messagesOpened, isTrue);
      expect(routedPath, isNull);
    });

    test('waits for navigator to mount before opening server messages dialog', () async {
      var checkCount = 0;
      var messagesOpened = false;

      service.launchRouteResolver = () async => 'messages';
      service.serverMessagesOpener = () => messagesOpened = true;
      service.isNavigatorMounted = () {
        checkCount++;
        return checkCount >= 3;
      };

      await service.handleColdStart();

      expect(checkCount, equals(3));
      expect(messagesOpened, isTrue);
    });

    test('routes standard launch routes to routeNavigator', () async {
      var messagesOpened = false;
      String? routedPath;

      service.launchRouteResolver = () async => ' /movie/42 ';
      service.serverMessagesOpener = () => messagesOpened = true;
      service.routeNavigator = (route) => routedPath = route;

      await service.handleColdStart();

      expect(messagesOpened, isFalse);
      expect(routedPath, equals('/movie/42'));
    });

    test('handles null and empty launch routes gracefully', () async {
      var messagesOpened = false;
      String? routedPath;

      service.serverMessagesOpener = () => messagesOpened = true;
      service.routeNavigator = (route) => routedPath = route;

      service.launchRouteResolver = () async => null;
      await service.handleColdStart();
      expect(messagesOpened, isFalse);
      expect(routedPath, isNull);

      service.launchRouteResolver = () async => '   ';
      await service.handleColdStart();
      expect(messagesOpened, isFalse);
      expect(routedPath, isNull);
    });
  });
}
