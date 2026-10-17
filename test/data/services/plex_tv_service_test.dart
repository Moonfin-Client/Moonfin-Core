import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/plex_tv_service.dart';

void main() {
  group('PlexServer', () {
    Map<String, dynamic> connection(
      String address, {
      bool local = false,
      bool relay = false,
    }) => {
      'uri': 'https://${address.replaceAll('.', '-')}.hash.plex.direct:32400',
      'address': address,
      'port': 32400,
      'local': local,
      'relay': relay,
    };

    PlexServer server(List<Map<String, dynamic>> connections) =>
        PlexServer.fromJson({
          'clientIdentifier': 'machine',
          'name': 'Basement',
          'productVersion': '1.43.4',
          'accessToken': 'token',
          'connections': connections,
        });

    test('orders local connections first and relay last', () {
      final basement = server([
        connection('10.0.0.1', relay: true),
        connection('203.0.113.7'),
        connection('192.168.50.45', local: true),
      ]);
      expect(basement.id, 'machine');
      expect(basement.accessToken, 'token');
      expect(basement.connections.map((c) => c.address), [
        '192.168.50.45:32400',
        '203.0.113.7:32400',
        '10.0.0.1:32400',
      ]);
      expect(basement.address, '192.168.50.45:32400');
    });

    test('puts LAN addresses found by GDM ahead of plex.tv ones', () {
      final basement = server([
        connection('172.17.0.2', local: true),
      ]).withLanUris(['http://192.168.50.45:32400']);
      expect(basement.connections.first.uri, 'http://192.168.50.45:32400');
      expect(basement.address, '192.168.50.45:32400');
      expect(basement.connections, hasLength(2));
    });

    test('has no address without connections', () {
      expect(server(const []).address, isNull);
    });
  });

  group('plexNeedsVerificationCode', () {
    DioException refused(int code) {
      final request = RequestOptions(path: '/api/v2/users/signin');
      return DioException(
        requestOptions: request,
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: request,
          statusCode: 401,
          data: {
            'errors': [
              {'code': code, 'message': 'refused', 'status': 401},
            ],
          },
        ),
      );
    }

    test("asks for the code only when plex.tv says it's missing", () {
      expect(plexNeedsVerificationCode(refused(1029)), isTrue);
      expect(plexNeedsVerificationCode(refused(1001)), isFalse);
      expect(plexNeedsVerificationCode(StateError('offline')), isFalse);
    });
  });

  group('plexAddressCandidates', () {
    test('tries Plex port first over http when only a host is typed', () {
      expect(plexAddressCandidates('192.168.50.45'), [
        'http://192.168.50.45:32400',
        'http://192.168.50.45',
      ]);
    });

    test('keeps a typed port and scheme', () {
      expect(plexAddressCandidates('192.168.50.45:32400'), [
        'http://192.168.50.45:32400',
      ]);
      expect(plexAddressCandidates('https://plex.example.com/'), [
        'https://plex.example.com:32400',
        'https://plex.example.com',
      ]);
    });

    test('has nothing to try without a host', () {
      expect(plexAddressCandidates('http://'), isEmpty);
    });
  });
}
