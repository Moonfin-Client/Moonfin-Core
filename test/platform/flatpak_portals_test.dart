import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/platform/flatpak_portals.dart';

const _path = '/org/freedesktop/portal/desktop';
const _networkMonitor = 'org.freedesktop.portal.NetworkMonitor';
const _notification = 'org.freedesktop.portal.Notification';

class _FakePortal extends DBusObject {
  _FakePortal() : super(DBusObjectPath(_path));

  Map<String, DBusValue>? status;
  final calls = <DBusMethodCall>[];

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    calls.add(methodCall);
    switch (methodCall.name) {
      case 'GetStatus':
        final status = this.status;
        if (status == null) return DBusMethodErrorResponse.unknownMethod();
        return DBusMethodSuccessResponse([DBusDict.stringVariant(status)]);
      case 'AddNotification':
      case 'RemoveNotification':
        return DBusMethodSuccessResponse();
    }
    return DBusMethodErrorResponse.unknownMethod();
  }
}

// The app's match rule lands a moment after it subscribes, so the signal is
// sent again until the listener has it.
Future<T> _emitUntil<T>(Future<T> received, void Function() emit) async {
  final timer = Timer.periodic(const Duration(milliseconds: 10), (_) => emit());
  try {
    return await received.timeout(const Duration(seconds: 5));
  } finally {
    timer.cancel();
  }
}

void main() {
  late DBusServer server;
  late DBusClient portalSide;
  late DBusClient appSide;
  late _FakePortal fake;
  late DBusRemoteObject portal;

  setUp(() async {
    server = DBusServer();
    final address = await server.listenAddress(
      DBusAddress.unix(dir: Directory.systemTemp),
    );
    portalSide = DBusClient(address);
    fake = _FakePortal();
    await portalSide.registerObject(fake);
    await portalSide.requestName('org.freedesktop.portal.Desktop');
    appSide = DBusClient(address);
    portal = DBusRemoteObject(
      appSide,
      name: 'org.freedesktop.portal.Desktop',
      path: DBusObjectPath(_path),
    );
  });

  tearDown(() async {
    await appSide.close();
    await portalSide.close();
    await server.close();
  });

  group('PortalConnectivity', () {
    Map<String, DBusValue> status({
      bool available = true,
      bool metered = false,
    }) => {
      'available': DBusBoolean(available),
      'metered': DBusBoolean(metered),
      'connectivity': const DBusUint32(4),
    };

    test('maps the portal status onto connectivity results', () async {
      final connectivity = PortalConnectivity(portal);

      fake.status = status();
      expect(await connectivity.checkConnectivity(), [ConnectivityResult.wifi]);

      fake.status = status(metered: true);
      expect(await connectivity.checkConnectivity(), [
        ConnectivityResult.mobile,
      ]);

      fake.status = status(available: false);
      expect(await connectivity.checkConnectivity(), [ConnectivityResult.none]);

      expect(
        fake.calls.map((c) => '${c.interface}.${c.name}'),
        everyElement('$_networkMonitor.GetStatus'),
      );
    });

    test('assumes a link when the portal has no answer', () async {
      fake.status = null;
      expect(await PortalConnectivity(portal).checkConnectivity(), [
        ConnectivityResult.wifi,
      ]);
    });

    test('reads the status again when the portal reports a change', () async {
      final connectivity = PortalConnectivity(portal);
      final next = connectivity.onConnectivityChanged.first;
      fake.status = status(available: false);

      final results = await _emitUntil(
        next,
        () => fake.emitSignal(_networkMonitor, 'changed'),
      );

      expect(results, [ConnectivityResult.none]);
    });
  });

  group('PortalNotifications', () {
    test('adds and removes notifications through the portal', () async {
      final notifications = PortalNotifications(portal);

      await notifications.show(
        id: 7,
        title: 'Download complete',
        body: 'Movie',
        payload: '/item/abc',
      );
      await notifications.show(id: 8, title: 'No payload');
      await notifications.cancel(id: 7);

      final add = fake.calls[0];
      expect('${add.interface}.${add.name}', '$_notification.AddNotification');
      expect(add.values[0], const DBusString('7'));
      expect(add.values[1].asStringVariantDict(), {
        'title': const DBusString('Download complete'),
        'body': const DBusString('Movie'),
        'default-action': const DBusString('open'),
        'default-action-target': const DBusString('/item/abc'),
      });

      expect(fake.calls[1].values[1].asStringVariantDict(), {
        'title': const DBusString('No payload'),
        'body': const DBusString(''),
        'default-action': const DBusString('open'),
      });

      final remove = fake.calls[2];
      expect(
        '${remove.interface}.${remove.name}',
        '$_notification.RemoveNotification',
      );
      expect(remove.values, [const DBusString('7')]);
    });

    test('hands a tapped notification and its payload to the app', () async {
      final notifications = PortalNotifications(portal);
      final tapped = Completer<NotificationResponse>();
      await notifications.initialize(
        settings: const LinuxInitializationSettings(defaultActionName: 'Open'),
        onDidReceiveNotificationResponse: (response) {
          if (!tapped.isCompleted) tapped.complete(response);
        },
      );

      final response = await _emitUntil(tapped.future, () {
        fake.emitSignal(_notification, 'ActionInvoked', [
          const DBusString('7'),
          const DBusString('something-else'),
          DBusArray.variant([const DBusString('/wrong')]),
        ]);
        fake.emitSignal(_notification, 'ActionInvoked', [
          const DBusString('7'),
          const DBusString('open'),
          DBusArray.variant([const DBusString('/item/abc')]),
        ]);
      });

      expect(response.id, 7);
      expect(response.payload, '/item/abc');
      expect(
        response.notificationResponseType,
        NotificationResponseType.selectedNotification,
      );
    });
  });
}
