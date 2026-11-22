import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  tearDown(resetServerNetworkOverrides);

  group('serverProxyFindProxy', () {
    test('is null when nothing is configured', () {
      expect(serverProxyFindProxy, isNull);
      gServerProxyUrl = '   ';
      expect(serverProxyFindProxy, isNull);
    });

    test('takes a bare host:port as an HTTP proxy', () {
      gServerProxyUrl = '127.0.0.1:7897';
      expect(serverProxyFindProxy, 'PROXY 127.0.0.1:7897');
    });

    test('honours the scheme, always as an HTTP PROXY rule', () {
      gServerProxyUrl = 'http://127.0.0.1:7897';
      expect(serverProxyFindProxy, 'PROXY 127.0.0.1:7897');

      // dart:io only knows the `PROXY` and `DIRECT` keywords; anything else
      // has to go out as a CONNECT-capable HTTP proxy.
      gServerProxyUrl = 'https://proxy.example:8443';
      expect(serverProxyFindProxy, 'PROXY proxy.example:8443');

      gServerProxyUrl = 'socks5://127.0.0.1:1080';
      expect(serverProxyFindProxy, 'PROXY 127.0.0.1:1080');
    });

    test('fills in 8080 when no port is given', () {
      gServerProxyUrl = 'http://proxy.example';
      expect(serverProxyFindProxy, 'PROXY proxy.example:8080');
      gServerProxyUrl = '127.0.0.1';
      expect(serverProxyFindProxy, 'PROXY 127.0.0.1:8080');
    });

    test('fills in 443 for an https scheme with no port', () {
      gServerProxyUrl = 'https://proxy.example';
      expect(serverProxyFindProxy, 'PROXY proxy.example:443');
    });

    test('fills in 1080 for a socks scheme with no port', () {
      gServerProxyUrl = 'socks5://127.0.0.1';
      expect(serverProxyFindProxy, 'PROXY 127.0.0.1:1080');
    });

    test('is null when there is no host to reach', () {
      gServerProxyUrl = 'not a url';
      expect(serverProxyFindProxy, isNull);
      gServerProxyUrl = '://';
      expect(serverProxyFindProxy, isNull);
    });

    test('keeps the brackets around an IPv6 literal', () {
      gServerProxyUrl = 'http://[::1]:7897';
      expect(serverProxyFindProxy, 'PROXY [::1]:7897');
    });

    test('drops credentials, which the dart:io rule cannot carry', () {
      gServerProxyUrl = 'http://user:secretpw@proxy.example:7897';
      expect(serverProxyFindProxy, 'PROXY proxy.example:7897');
    });
  });

  group('serverUserAgent', () {
    test('is the built-in Moonfin agent by default', () {
      expect(serverUserAgent, 'Mozilla/5.0 (compatible; Moonfin/Flutter)');
    });

    test('an override wins, verbatim', () {
      gServerUserAgentOverride = 'SenPlayer/6.0.6';
      expect(serverUserAgent, 'SenPlayer/6.0.6');
    });

    test('whitespace-only override is ignored', () {
      gServerUserAgentOverride = '   ';
      expect(serverUserAgent, 'Mozilla/5.0 (compatible; Moonfin/Flutter)');
    });

    test('the built-in version still applies when the override is empty', () {
      setServerUserAgentVersion('2.3.2');
      addTearDown(() => setServerUserAgentVersion(''));
      expect(serverUserAgent, 'Mozilla/5.0 (compatible; Moonfin/2.3.2)');
    });

    test('serverImageHeaders follows the same agent', () {
      gServerUserAgentOverride = 'SenPlayer/6.0.6';
      expect(serverImageHeaders, {'User-Agent': 'SenPlayer/6.0.6'});
    });
  });

  group('serverClientName', () {
    test('falls back to what the app passed in', () {
      expect(serverClientName('Moonfin for macOS'), 'Moonfin for macOS');
    });

    test('an override replaces it', () {
      gServerClientNameOverride = 'Emby';
      expect(serverClientName('Moonfin for macOS'), 'Emby');
    });

    test('whitespace-only override is ignored', () {
      gServerClientNameOverride = '  ';
      expect(serverClientName('Moonfin for macOS'), 'Moonfin for macOS');
    });
  });

  group('identity headers use the overrides', () {
    const device = DeviceInfo(
      id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
      name: 'Living Room',
      appName: 'Moonfin for macOS',
      appVersion: '3.1.1',
    );

    test('the Jellyfin/Emby Client field honours the override', () {
      gServerClientNameOverride = 'Emby';
      final header = buildServerAuthorizationHeader(
        scheme: 'MediaBrowser',
        deviceInfo: device,
        accessToken: 'tok',
      );
      expect(header, contains('Client="Emby"'));
      expect(header, isNot(contains('Client="Moonfin for macOS"')));
    });

    test('Silo client header honours the override', () {
      gServerClientNameOverride = 'Emby';
      final headers = buildSiloRequestHeaders(deviceInfo: device);
      expect(headers['X-Silo-Client'], 'Emby');
    });
  });
}
