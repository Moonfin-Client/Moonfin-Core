import 'dart:async';

import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Routes network status and notifications through the desktop portals, so
/// a Flatpak needs no access to NetworkManager or the notification server.
void installFlatpakPortals() {
  final portal = _desktopPortal();
  ConnectivityPlatform.instance = PortalConnectivity(portal);
  FlutterLocalNotificationsPlatform.instance = PortalNotifications(portal);
}

/// A snap can reach the notification server, but NetworkManager sits behind a
/// plug that never connects by itself, so only network status uses the portal.
void installSnapPortals() {
  ConnectivityPlatform.instance = PortalConnectivity(_desktopPortal());
}

DBusRemoteObject _desktopPortal() => DBusRemoteObject(
  DBusClient.session(),
  name: 'org.freedesktop.portal.Desktop',
  path: DBusObjectPath('/org/freedesktop/portal/desktop'),
);

class PortalConnectivity extends ConnectivityPlatform {
  PortalConnectivity(this._portal);

  final DBusRemoteObject _portal;

  static const _interface = 'org.freedesktop.portal.NetworkMonitor';

  @override
  late final Stream<List<ConnectivityResult>> onConnectivityChanged =
      DBusRemoteObjectSignalStream(
        object: _portal,
        interface: _interface,
        name: 'changed',
      ).asyncMap((_) => checkConnectivity()).asBroadcastStream();

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async {
    final Map<String, DBusValue> status;
    try {
      final reply = await _portal.callMethod(
        _interface,
        'GetStatus',
        const [],
        replySignature: DBusSignature('a{sv}'),
      );
      status = reply.returnValues.single.asStringVariantDict();
    } on DBusMethodResponseException {
      // The app pings its server anyway, so without an answer it assumes a link.
      return const [ConnectivityResult.wifi];
    }
    if (status['available']?.asBoolean() == false) {
      return const [ConnectivityResult.none];
    }
    if (status['metered']?.asBoolean() == true) {
      return const [ConnectivityResult.mobile];
    }
    // The portal can't tell Wi-Fi from Ethernet, so an unmetered link counts
    // as Wi-Fi and Wi-Fi only downloads mean unmetered ones.
    return const [ConnectivityResult.wifi];
  }
}

class PortalNotifications extends LinuxFlutterLocalNotificationsPlugin {
  PortalNotifications(this._portal);

  final DBusRemoteObject _portal;
  StreamSubscription<DBusSignal>? _actions;

  static const _interface = 'org.freedesktop.portal.Notification';
  static const _openAction = 'open';

  @override
  Future<bool?> initialize({
    required LinuxInitializationSettings settings,
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
  }) async {
    _actions ??=
        DBusRemoteObjectSignalStream(
          object: _portal,
          interface: _interface,
          name: 'ActionInvoked',
        ).listen((signal) {
          if (signal.signature != DBusSignature('ssav')) return;
          final id = int.tryParse(signal.values[0].asString());
          if (id == null || signal.values[1].asString() != _openAction) return;
          final target = signal.values[2].asVariantArray();
          onDidReceiveNotificationResponse?.call(
            NotificationResponse(
              id: id,
              payload: target.isEmpty ? null : target.first.asString(),
              notificationResponseType:
                  NotificationResponseType.selectedNotification,
            ),
          );
        });
    return true;
  }

  @override
  Future<void> show({
    required int id,
    String? title,
    String? body,
    LinuxNotificationDetails? notificationDetails,
    String? payload,
  }) async {
    await _portal.callMethod(_interface, 'AddNotification', [
      DBusString('$id'),
      DBusDict.stringVariant({
        'title': DBusString(title ?? ''),
        'body': DBusString(body ?? ''),
        'default-action': const DBusString(_openAction),
        if (payload != null) 'default-action-target': DBusString(payload),
      }),
    ], replySignature: DBusSignature.empty);
  }

  @override
  Future<void> cancel({required int id}) async {
    await _portal.callMethod(_interface, 'RemoveNotification', [
      DBusString('$id'),
    ], replySignature: DBusSignature.empty);
  }
}
