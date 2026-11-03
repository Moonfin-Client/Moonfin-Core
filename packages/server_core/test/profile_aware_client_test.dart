import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

const _device = DeviceInfo(
  id: 'd',
  name: 'Phone',
  appName: 'Moonfin',
  appVersion: '1',
);

class _PlainClient implements MediaServerClient {
  _PlainClient(this.serverType);

  @override
  final ServerType serverType;

  @override
  DeviceInfo get deviceInfo => _device;

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

void main() {
  group('serverAuthHeaders', () {
    test('Jellyfin keeps its MediaBrowser header', () {
      expect(serverAuthHeaders(_PlainClient(ServerType.jellyfin)), {
        'Authorization': buildServerAuthorizationHeader(
          scheme: 'MediaBrowser',
          deviceInfo: _device,
          accessToken: 'tok',
        ),
      });
    });

    test('Emby keeps its Emby header', () {
      final headers = serverAuthHeaders(_PlainClient(ServerType.emby));
      expect(headers['Authorization'], startsWith('Emby '));
      expect(headers['Authorization'], contains('Token="tok"'));
    });

    test('Plex gets its token header', () {
      expect(serverAuthHeaders(_PlainClient(ServerType.plex)), {
        'X-Plex-Token': 'tok',
      });
    });

    test('a profile-aware client supplies its own headers', () {
      expect(serverAuthHeaders(_ProfileClient()), {
        'Authorization': 'Bearer tok',
      });
    });
  });

  test('clientProfileId is null on servers without profiles', () {
    expect(clientProfileId(_ProfileClient()), 'p1');
    expect(clientProfileId(_PlainClient(ServerType.jellyfin)), isNull);
  });
}
