import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  const device = DeviceInfo(
    id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
    name: 'Brady’s Apple TV',
    appName: 'Moonfin',
    appVersion: '2.7.0',
  );

  test('Silo headers carry bearer, profile and device', () {
    final headers = buildSiloRequestHeaders(
      deviceInfo: device,
      accessToken: 'tok',
      profileId: 'p1',
      profileToken: 'pin-proof',
    );
    expect(headers['Authorization'], 'Bearer tok');
    expect(headers['X-Profile-Id'], 'p1');
    expect(headers['X-Profile-Token'], 'pin-proof');
    expect(headers['X-Silo-Device-Id'], device.id);
    expect(headers['X-Silo-Device-Name'], 'Brady s Apple TV');
    expect(headers['X-Silo-Client'], 'Moonfin');
    expect(headers['X-Silo-Client-Version'], '2.7.0');
  });

  test('Silo headers omit what is not known yet', () {
    final headers = buildSiloRequestHeaders(deviceInfo: device);
    expect(headers.containsKey('Authorization'), isFalse);
    expect(headers.containsKey('X-Profile-Id'), isFalse);
    expect(headers.containsKey('X-Profile-Token'), isFalse);
  });

  test('Silo device id drops characters v2 would refuse', () {
    final headers = buildSiloRequestHeaders(
      deviceInfo: const DeviceInfo(
        id: 'tv box/01 {x}',
        name: 'TV',
        appName: 'Moonfin',
        appVersion: '1',
      ),
    );
    expect(headers['X-Silo-Device-Id'], 'tvbox01x');
  });

  test('Silo device id is clamped to 128 characters', () {
    final headers = buildSiloRequestHeaders(
      deviceInfo: DeviceInfo(
        id: 'a' * 200,
        name: 'TV',
        appName: 'Moonfin',
        appVersion: '1',
      ),
    );
    expect(headers['X-Silo-Device-Id']!.length, 128);
  });

  group('serverAuthHeaders', () {
    test('keeps the MediaBrowser header for Jellyfin', () {
      final headers = serverAuthHeaders(_PlainClient(ServerType.jellyfin));
      expect(headers['Authorization'], startsWith('MediaBrowser '));
      expect(headers['Authorization'], contains('Token="tok"'));
    });

    test('keeps the Emby header for Emby', () {
      final headers = serverAuthHeaders(_PlainClient(ServerType.emby));
      expect(headers['Authorization'], startsWith('Emby '));
    });

    test('asks a profile-aware client for its own headers', () {
      final client = _ProfileClient();
      expect(serverAuthHeaders(client), {'Authorization': 'Bearer tok'});
      expect(clientProfileId(client), 'p1');
      expect(clientProfileId(_PlainClient(ServerType.jellyfin)), isNull);
    });
  });
}

class _PlainClient implements MediaServerClient {
  _PlainClient(this.serverType);

  @override
  final ServerType serverType;

  @override
  DeviceInfo get deviceInfo => const DeviceInfo(
    id: 'd',
    name: 'Phone',
    appName: 'Moonfin',
    appVersion: '1',
  );

  @override
  String? get accessToken => 'tok';

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _ProfileClient extends _PlainClient implements ProfileAwareClient {
  _ProfileClient() : super(ServerType.silo);

  @override
  String? profileId = 'p1';

  @override
  String? profileToken;

  @override
  Map<String, String> authHeaders() => {'Authorization': 'Bearer tok'};
}

