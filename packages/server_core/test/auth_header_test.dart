import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  const device = DeviceInfo(
    id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
    name: 'Brady’s Apple TV',
    appName: 'Moonfin for tvOS',
    appVersion: '2.7.0',
  );

  group('buildSiloRequestHeaders', () {
    test('carries bearer token, profile, device and client', () {
      final headers = buildSiloRequestHeaders(
        deviceInfo: device,
        platform: 'tvOS',
        accessToken: 'tok',
        profileId: 'p1',
        profileToken: 'pvt_proof',
      );
      expect(headers, {
        'Authorization': 'Bearer tok',
        'X-Profile-Id': 'p1',
        'X-Profile-Token': 'pvt_proof',
        'X-Silo-Device-Id': device.id,
        'X-Silo-Device-Name': 'Brady s Apple TV',
        'X-Silo-Device-Platform': 'tvOS',
        'X-Silo-Client': 'Moonfin for tvOS',
        'X-Silo-Client-Version': '2.7.0',
      });
    });

    test('leaves out what is not known yet', () {
      final headers = buildSiloRequestHeaders(deviceInfo: device);
      expect(headers.keys, isNot(contains('Authorization')));
      expect(headers.keys, isNot(contains('X-Profile-Id')));
      expect(headers.keys, isNot(contains('X-Profile-Token')));
      expect(headers.keys, isNot(contains('X-Silo-Device-Platform')));
      expect(headers['X-Silo-Device-Id'], device.id);
    });

    test('empty strings count as not known', () {
      final headers = buildSiloRequestHeaders(
        deviceInfo: device,
        platform: '  ',
        accessToken: '',
        profileId: '',
        profileToken: '',
      );
      expect(headers.keys, isNot(contains('Authorization')));
      expect(headers.keys, isNot(contains('X-Profile-Id')));
      expect(headers.keys, isNot(contains('X-Profile-Token')));
      expect(headers.keys, isNot(contains('X-Silo-Device-Platform')));
    });

    test('clamps name to 120 and platform to 40 characters', () {
      final headers = buildSiloRequestHeaders(
        deviceInfo: DeviceInfo(
          id: 'd',
          name: 'n' * 200,
          appName: 'Moonfin',
          appVersion: '1',
        ),
        platform: 'p' * 60,
      );
      expect(headers['X-Silo-Device-Name']!.length, 120);
      expect(headers['X-Silo-Device-Platform']!.length, 40);
    });
  });

  group('siloDeviceId', () {
    test('keeps a UUID as it is', () {
      expect(siloDeviceId(device.id), device.id);
    });

    test('drops characters Silo refuses with a 422', () {
      // Silo refuses the first two as they are with 422 validation_failed
      // on header.x-silo-device-id.
      expect(siloDeviceId('tv box/01 {x}'), 'tvbox01x');
      expect(siloDeviceId('Brady’s-tv'), 'Bradys-tv');
      expect(siloDeviceId('a.b_c:d-e'), 'a.b_c:d-e');
    });

    test('clamps to 128 characters', () {
      expect(siloDeviceId('a' * 200)!.length, 128);
    });

    test('is null when nothing usable is left', () {
      expect(siloDeviceId(''), isNull);
      expect(siloDeviceId('’ / {}'), isNull);
    });

    test('a device with no usable id sends no device id header', () {
      final headers = buildSiloRequestHeaders(
        deviceInfo: const DeviceInfo(
          id: '{}',
          name: 'TV',
          appName: 'Moonfin',
          appVersion: '1',
        ),
      );
      expect(headers.keys, isNot(contains('X-Silo-Device-Id')));
    });
  });

  test('the Jellyfin/Emby header builder is unchanged', () {
    final header = buildServerAuthorizationHeader(
      scheme: 'MediaBrowser',
      deviceInfo: device,
      accessToken: 'tok',
    );
    expect(
      header,
      'MediaBrowser Client="Moonfin for tvOS", Device="Brady s Apple TV", '
      'DeviceId="${device.id}", Version="2.7.0", Token="tok"',
    );
  });
}
