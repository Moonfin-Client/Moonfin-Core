import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:ui' show IsolateNameServer;

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../di/injection.dart';
import '../../playback/headless_session_bootstrap.dart';
import '../../ui/navigation/app_router.dart';
import '../repositories/seerr_repository.dart';
import 'seerr/seerr_http_client.dart';
import 'seerr/seerr_models.dart';

/// iOS category tying the approve/decline buttons to request notifications.
const String seerrRequestCategoryId = 'seerr_request';

/// Action ids shared with the plugin's push payloads.
const String seerrApproveActionId = 'approve';
const String seerrDeclineActionId = 'decline';

/// IsolateNameServer name for forwarding request actions from the
/// notification background isolate to the running app's main isolate.
const String seerrActionPortName = 'moonfin.seerr.request_action';

/// Notification tapped or actioned while the app is backgrounded/terminated.
/// Runs in its own isolate, so it re-resolves everything it needs.
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  _handleNotificationResponse(response);
}

/// Routes a notification response: an approve/decline action runs the silent
/// request flow, anything else navigates to the payload's route.
void _handleNotificationResponse(NotificationResponse response) {
  final actionId = response.actionId;
  if (actionId == seerrApproveActionId || actionId == seerrDeclineActionId) {
    final requestId = _requestIdFromPayload(response.payload);
    if (requestId != null) {
      unawaited(_runRequestAction(
        approve: actionId == seerrApproveActionId,
        requestId: requestId,
        notificationId: response.id,
      ));
      return;
    }
  }
  _navigate(_routeFromPayload(response.payload));
}

/// Reads the route from a payload that may be a JSON map or a bare route
/// string. Non-request notifications keep sending the raw route.
String? _routeFromPayload(String? payload) {
  if (payload == null || payload.trim().isEmpty) return null;
  final raw = payload.trim();
  try {
    final decoded = jsonDecode(raw);
    if (decoded is Map && decoded['route'] is String) {
      return (decoded['route'] as String).trim();
    }
  } catch (_) {}
  return raw;
}

String? _requestIdFromPayload(String? payload) {
  if (payload == null || payload.trim().isEmpty) return null;
  try {
    final decoded = jsonDecode(payload.trim());
    if (decoded is Map && decoded['requestId'] is String) {
      final id = (decoded['requestId'] as String).trim();
      return id.isNotEmpty ? id : null;
    }
  } catch (_) {}
  return null;
}

void _navigate(String? route) {
  if (route == null || route.trim().isEmpty) return;
  appRouter.go(route.trim());
}

/// Approves or declines a request without any UI. Prefers the running app's
/// live session (directly, or handed off to the main isolate), and only
/// rebuilds a session headlessly when the process hosting the app is gone.
Future<void> _runRequestAction({
  required bool approve,
  required String requestId,
  required int? notificationId,
}) async {
  final parsedId = int.tryParse(requestId);
  if (parsedId == null) return;

  SeerrHttpClient? seerr;
  try {
    WidgetsFlutterBinding.ensureInitialized();

    if (getIt.isRegistered<SeerrRepository>()) {
      await _submitViaLiveRepo(
        approve: approve,
        requestId: parsedId,
        notificationId: notificationId,
      );
      return;
    }

    if (await _forwardToMainIsolate(
      approve: approve,
      requestId: parsedId,
      notificationId: notificationId,
    )) {
      // The running app claimed the action; it owns cancel and error
      // reporting from here.
      return;
    }

    // No live app, so rebuild a session from storage. The action is explicit
    // user intent, so restoring past a disabled auto sign-in is safe.
    await configureBackgroundDependencies();
    final client = await HeadlessSessionBootstrap()
        .restoreClientOrThrow(ignoreDisabledLoginBehavior: true);
    final token = client.accessToken;
    if (token == null || token.isEmpty) {
      throw StateError('no stored access token');
    }
    seerr = SeerrHttpClient(
      proxyConfig: MoonfinProxyConfig(
        jellyfinBaseUrl: client.baseUrl,
        jellyfinToken: token,
      ),
    );
    if (approve) {
      await seerr.approveRequest(parsedId);
    } else {
      await seerr.declineRequest(parsedId);
    }

    if (notificationId != null) {
      await LocalNotificationBootstrap.instance.plugin.cancel(
        id: notificationId,
      );
    }
  } catch (e) {
    debugPrint('Seerr notification action failed: $e');
    await showSeerrActionFailure(
      approve: approve,
      requestId: requestId,
      reason: e,
    );
  } finally {
    seerr?.close();
  }
}

/// Runs an approve/deny through the live authenticated repository and clears
/// the notification. Used whenever the app is alive, in this isolate or handed
/// off to the main one.
Future<void> _submitViaLiveRepo({
  required bool approve,
  required int requestId,
  required int? notificationId,
}) async {
  final repo = await getIt.getAsync<SeerrRepository>();
  if (approve) {
    await repo.approveRequest(requestId);
  } else {
    await repo.declineRequest(requestId);
  }
  if (notificationId != null) {
    await LocalNotificationBootstrap.instance.plugin.cancel(id: notificationId);
  }
}

/// Background isolate: try to hand the action to the running app's main
/// isolate, which has the live session. Returns true once the main isolate
/// acks that it claimed the action; a short timeout covers a stale port
/// mapping or a wedged main isolate, falling back to the headless path.
Future<bool> _forwardToMainIsolate({
  required bool approve,
  required int requestId,
  required int? notificationId,
}) async {
  final mainPort = IsolateNameServer.lookupPortByName(seerrActionPortName);
  if (mainPort == null) return false;
  final ack = ReceivePort();
  try {
    mainPort.send({
      'approve': approve,
      'requestId': requestId,
      'notificationId': notificationId,
      'ack': ack.sendPort,
    });
    final claimed = await ack.first
        .timeout(const Duration(seconds: 3), onTimeout: () => false);
    return claimed == true;
  } catch (_) {
    return false;
  } finally {
    ack.close();
  }
}

Future<void> showSeerrActionFailure({
  required bool approve,
  required String requestId,
  required Object reason,
}) async {
  final detail = reason
      .toString()
      .replaceFirst(RegExp(r'^(Bad state|Exception|Error):\s*'), '')
      .trim();
  final body = detail.isEmpty
      ? 'Unknown error'
      : (detail.length > 140 ? '${detail.substring(0, 140)}...' : detail);
  try {
    await LocalNotificationBootstrap.instance.initialize();
    await LocalNotificationBootstrap.instance.plugin.show(
      id: requestId.hashCode ^ 0x5eec,
      title: approve ? "Couldn't approve" : "Couldn't deny",
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'seerr_notifications',
          'Requests',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          autoCancel: true,
        ),
        iOS: DarwinNotificationDetails(),
        macOS: DarwinNotificationDetails(),
        linux: LinuxNotificationDetails(),
      ),
    );
  } catch (_) {}
}

class LocalNotificationBootstrap {
  LocalNotificationBootstrap._();

  static final LocalNotificationBootstrap instance =
      LocalNotificationBootstrap._();

  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool get isInitialized => _initialized;

  ReceivePort? _actionPort;

  /// Main isolate only. Registers the port that lets the Android
  /// notification-action background isolate hand approve/deny off to the
  /// live session. Safe to call repeatedly (hot restart re-registers).
  ///
  /// Deliberately not part of [initialize]: that also runs in the background
  /// isolate, which must never claim this mapping.
  void attachMainIsolateActionHandler() {
    _actionPort?.close();
    IsolateNameServer.removePortNameMapping(seerrActionPortName);
    final port = ReceivePort();
    _actionPort = port;
    IsolateNameServer.registerPortWithName(port.sendPort, seerrActionPortName);
    port.listen(_onForwardedRequestAction);
  }

  Future<void> _onForwardedRequestAction(dynamic message) async {
    if (message is! Map) return;
    final ack = message['ack'];
    final reply = ack is SendPort ? ack : null;
    final requestId = message['requestId'];
    final approve = message['approve'] == true;
    final notificationId = message['notificationId'];
    if (requestId is! int || !getIt.isRegistered<SeerrRepository>()) {
      reply?.send(false);
      return;
    }
    // Claim before executing so the background isolate never double-runs the
    // action while a slow network call is in flight.
    reply?.send(true);
    try {
      await _submitViaLiveRepo(
        approve: approve,
        requestId: requestId,
        notificationId: notificationId is int ? notificationId : null,
      );
    } catch (e) {
      debugPrint('Seerr forwarded action failed: $e');
      await showSeerrActionFailure(
        approve: approve,
        requestId: '$requestId',
        reason: e,
      );
    }
  }

  Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // The request category adds Approve/Deny buttons. Leaving the action
    // options empty (no `foreground`) lets iOS run them without opening the app.
    final darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: [
        DarwinNotificationCategory(
          seerrRequestCategoryId,
          actions: [
            DarwinNotificationAction.plain(seerrApproveActionId, 'Approve'),
            DarwinNotificationAction.plain(seerrDeclineActionId, 'Deny'),
          ],
          options: {
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        ),
      ],
    );
    const linuxSettings =
        LinuxInitializationSettings(defaultActionName: 'Open');

    final initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
      linux: linuxSettings,
    );

    await plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    _initialized = true;
  }

  Future<String?> getLaunchRoute() async {
    final details = await plugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp != true) return null;
    return _routeFromPayload(details?.notificationResponse?.payload);
  }
}
