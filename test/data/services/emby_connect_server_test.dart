import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/emby_connect_service.dart';

void main() {
  group('EmbyConnectServer.candidateAddresses', () {
    EmbyConnectServer server({String? url, String? localAddress}) {
      return EmbyConnectServer(
        accessKey: 'key',
        systemId: 'sys',
        name: 'Server',
        url: url,
        localAddress: localAddress,
      );
    }

    test('does not append a trailing "?#"', () {
      final addresses = server(
        url: 'https://media.example.com',
      ).candidateAddresses;
      expect(addresses, ['https://media.example.com']);
      for (final address in addresses) {
        expect(address, isNot(contains('?')));
        expect(address, isNot(contains('#')));
      }
    });

    test('keeps host, port and path while dropping query/fragment', () {
      expect(
        server(
          url: 'https://media.example.com:8920/emby/?x=1#frag',
        ).candidateAddresses,
        ['https://media.example.com:8920/emby'],
      );
    });

    test('strips a trailing slash', () {
      expect(server(url: 'https://media.example.com/').candidateAddresses, [
        'https://media.example.com',
      ]);
    });

    test('yields https then http for a scheme-less address', () {
      expect(server(url: 'media.example.com:8096').candidateAddresses, [
        'https://media.example.com:8096',
        'http://media.example.com:8096',
      ]);
    });

    test('includes both url and localAddress, de-duplicated', () {
      final addresses = server(
        url: 'https://media.example.com',
        localAddress: 'http://192.168.1.5:8096',
      ).candidateAddresses;
      expect(addresses, [
        'https://media.example.com',
        'http://192.168.1.5:8096',
      ]);
    });

    test('is empty when no addresses are provided', () {
      expect(server().candidateAddresses, isEmpty);
    });
  });
}
