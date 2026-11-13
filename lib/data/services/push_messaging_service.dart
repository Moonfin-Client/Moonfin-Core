import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../firebase_options.dart';
import '../../ui/navigation/app_router.dart';
import '../../ui/navigation/deep_link_navigator.dart';
import '../../ui/widgets/server_messages_dialog.dart';
import '../../util/platform_detection.dart';
import 'plugin_sync_service.dart';

/// Every push carries a notification block, so the OS draws background and
/// terminated notifications. Nothing to do here.
@pragma('vm:entry-point')
Future<void> pushBackgroundHandler(RemoteMessage message) async {}

/// Client side of the push notification path. The plugin sends FCM messages
/// carrying both a notification block (title/body) and a data route, so the OS
/// renders background/terminated notifications and this service only handles
/// token registration and taps. Foreground messages are ignored because the
/// SSE settings stream already shows the in-app notification.
///
/// Firebase stays untouched until a signed-in server's plugin can deliver
/// push, so a phone that never meets one never contacts Google.
class PushMessagingService {
  Future<void>? _startFuture;
  String? _lastRegisteredToken;
  bool _listenerAttached = false;

  /// Set when a registration attempt was skipped or failed because the plugin
  /// wasn't reachable or couldn't push yet, so the availability listener can
  /// retry it.
  bool _pendingRegistration = false;

  /// Repeated and concurrent callers share one start. A failed start clears
  /// itself so a later call can retry.
  Future<void> _start() => _startFuture ??= _doStart();

  Future<void> _doStart() async {
    try {
      await Firebase.initializeApp(
        options: PlatformDetection.isAndroid
            ? null
            : DefaultFirebaseOptions.currentPlatform,
      );
    } on FirebaseException catch (e) {
      // A duplicate-app error means Firebase was already initialized, which is
      // fine. Anything else stops push setup.
      if (e.code != 'duplicate-app') {
        _startFuture = null;
        return;
      }
    } catch (_) {
      _startFuture = null;
      return;
    }

    final messaging = FirebaseMessaging.instance;

    try {
      await messaging.requestPermission();
    } catch (_) {}

    // On iOS the APNs token must be present before FCM will hand out a token.
    if (PlatformDetection.isIOS) {
      try {
        final apns = await messaging.getAPNSToken();
        if (apns == null) {
          debugPrint('PushMessagingService: no APNs token; check the Push '
              'Notifications capability and the APNs key in Firebase');
        }
      } catch (e) {
        debugPrint('PushMessagingService: getAPNSToken failed: $e');
      }
    }

    messaging.onTokenRefresh.listen((token) {
      _registerToken(token);
    });

    // Foreground is handled by the SSE stream, so FCM onMessage is a no-op here
    // to avoid drawing the notification twice.
    FirebaseMessaging.onMessage.listen((_) {});

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _navigateFromMessage(message);
    });

    try {
      final initial = await messaging.getInitialMessage();
      if (initial != null) {
        _navigateFromMessage(initial);
      }
    } catch (_) {}
  }

  /// Registers the current FCM token after login, starting Firebase first if
  /// the plugin can deliver push. Otherwise it waits for the availability
  /// listener, which retries once a server can.
  Future<void> registerWithCurrentToken() async {
    if (!PlatformDetection.isMobile) return;
    _attachAvailabilityListener();
    final sync = GetIt.instance.isRegistered<PluginSyncService>()
        ? GetIt.instance<PluginSyncService>()
        : null;
    if (sync == null || !sync.pushSupported) {
      _pendingRegistration = true;
      return;
    }
    try {
      await _start();
      // A server switch reuses the same FCM token, so drop the dedupe and let
      // the new server get its own registration.
      _lastRegisteredToken = null;
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) {
        debugPrint('PushMessagingService: getToken returned null');
      }
      await _registerToken(token);
    } catch (e) {
      debugPrint('PushMessagingService: register failed: $e');
      _pendingRegistration = true;
    }
  }

  /// Retries enrollment once the plugin can deliver push, covering
  /// registrations that were skipped while its availability check was still
  /// in flight.
  void _attachAvailabilityListener() {
    if (_listenerAttached) return;
    if (!GetIt.instance.isRegistered<PluginSyncService>()) return;
    _listenerAttached = true;
    final sync = GetIt.instance<PluginSyncService>();
    sync.addListener(() {
      if (sync.pushSupported && _pendingRegistration) {
        _pendingRegistration = false;
        unawaited(registerWithCurrentToken());
      }
    });
  }

  Future<void> _registerToken(String? token) async {
    if (!PlatformDetection.isMobile) return;
    if (token == null || token.isEmpty) {
      debugPrint('PushMessagingService: skip register, no FCM token');
      return;
    }
    if (token == _lastRegisteredToken) return;

    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client == null ||
        client.accessToken == null ||
        client.accessToken!.isEmpty) {
      debugPrint('PushMessagingService: skip register, no active session');
      _pendingRegistration = true;
      return;
    }

    if (!GetIt.instance.isRegistered<PluginSyncService>()) {
      debugPrint('PushMessagingService: skip register, plugin sync unavailable');
      _pendingRegistration = true;
      return;
    }
    final sync = GetIt.instance<PluginSyncService>();

    final sent = await sync.registerPushDevice(
      client,
      token: token,
      platform: PlatformDetection.isIOS ? 'ios' : 'android',
      deviceId: _deviceId(token),
    );
    if (!sent) {
      _pendingRegistration = true;
      return;
    }
    _pendingRegistration = false;
    _lastRegisteredToken = token;
  }

  /// Unregister this device with the plugin, e.g. on logout. No-op off mobile
  /// or when there is no active client.
  Future<void> unregister() async {
    if (!PlatformDetection.isMobile) return;

    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client == null) return;
    if (!GetIt.instance.isRegistered<PluginSyncService>()) return;

    await GetIt.instance<PluginSyncService>().unregisterPushDevice(
      client,
      deviceId: _deviceId(_lastRegisteredToken),
    );
    _lastRegisteredToken = null;
  }

  /// Reuses the app's Jellyfin device id so the plugin can tie the push
  /// registration to the same session; falls back to the token hash if the id
  /// is unavailable.
  String _deviceId(String? token) {
    if (GetIt.instance.isRegistered<DeviceInfo>()) {
      final id = GetIt.instance<DeviceInfo>().id.trim();
      if (id.isNotEmpty) return id;
    }
    return (token ?? '').hashCode.toString();
  }

  void _navigateFromMessage(RemoteMessage message) {
    final route = message.data['route'];
    if (route is! String) return;

    final trimmed = route.trim();
    if (trimmed.isEmpty) return;

    // Messages open a window over whatever is on screen, so there is no page to
    // go to.
    if (trimmed == serverMessagesPushRoute) {
      openServerMessagesFromNotification();
      return;
    }

    unawaited(openLinkedRoute(appRouter, trimmed));
  }
}
