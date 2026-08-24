import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../firebase_options.dart';
import '../../ui/navigation/app_router.dart';
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
class PushMessagingService {
  Future<void>? _initFuture;
  String? _lastRegisteredToken;

  /// Set when a registration attempt was skipped or failed because the plugin
  /// was not reachable yet, so the availability listener can retry it.
  bool _pendingRegistration = false;

  /// Repeated and concurrent callers share one initialization. A failed
  /// initialization clears itself so a later call can retry.
  Future<void> initialize() => _initFuture ??= _doInitialize();

  Future<void> _doInitialize() async {
    if (!PlatformDetection.isMobile) return;

    try {
      await Firebase.initializeApp(
        options: PlatformDetection.isAndroid
            ? null
            : DefaultFirebaseOptions.currentPlatform,
      );
    } on FirebaseException catch (e) {
      // A duplicate-app error means Firebase was already initialized earlier in
      // startup, which is fine; anything else aborts push setup.
      if (e.code != 'duplicate-app') {
        _initFuture = null;
        return;
      }
    } catch (_) {
      _initFuture = null;
      return;
    }

    _attachAvailabilityListener();

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

    try {
      final token = await messaging.getToken();
      if (token == null) {
        debugPrint('PushMessagingService: getToken returned null');
      }
      await _registerToken(token);
    } catch (e) {
      debugPrint('PushMessagingService: getToken failed: $e');
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

  /// Re-registers the current FCM token after login. Waits for initialization
  /// instead of bailing: on a cold start with session restore this is reached
  /// before the deferred [initialize] call has run.
  Future<void> registerWithCurrentToken() async {
    if (!PlatformDetection.isMobile) return;
    try {
      await initialize();
      // A server switch reuses the same FCM token, so drop the dedupe and let
      // the new server get its own registration.
      _lastRegisteredToken = null;
      final token = await FirebaseMessaging.instance.getToken();
      await _registerToken(token);
    } catch (_) {
      _pendingRegistration = true;
    }
  }

  /// Retries enrollment once the Moonfin plugin becomes reachable, covering
  /// registrations that were skipped while its availability check was still
  /// in flight.
  void _attachAvailabilityListener() {
    if (!GetIt.instance.isRegistered<PluginSyncService>()) return;
    final sync = GetIt.instance<PluginSyncService>();
    sync.addListener(() {
      if (sync.pluginAvailable && _pendingRegistration) {
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

    appRouter.go(trimmed);
  }
}
