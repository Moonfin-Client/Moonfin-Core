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

    test('keeps an explicit default port instead of assuming the scheme', () {
      // Uri.port hides an explicit :80 or :443 behind the scheme default, so a
      // parser that reads it loses the port the user typed.
      gServerProxyUrl = 'http://proxy.example:80';
      expect(serverProxyFindProxy, 'PROXY proxy.example:80');

      gServerProxyUrl = 'https://proxy.example:443';
      expect(serverProxyFindProxy, 'PROXY proxy.example:443');

      gServerProxyUrl = 'proxy.example:80';
      expect(serverProxyFindProxy, 'PROXY proxy.example:80');
    });

    test('keeps a non-default port under the other scheme too', () {
      gServerProxyUrl = 'http://proxy.example:443';
      expect(serverProxyFindProxy, 'PROXY proxy.example:443');
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

  group('serverRequestHeadersFor', () {
    test('is empty when nothing is saved', () {
      expect(
        serverRequestHeadersFor(Uri.parse('https://a.example/emby')),
        isEmpty,
      );
    });

    test('matches the request origin and nothing else', () {
      gServerRequestHeaders = [
        ServerRequestHeader.tryCreate(
          serverUrl: 'https://a.example',
          name: 'X-A',
          value: '1',
        )!,
        ServerRequestHeader.tryCreate(
          serverUrl: 'https://b.example:8443',
          name: 'X-B',
          value: '2',
        )!,
      ];

      expect(serverRequestHeadersFor(Uri.parse('https://a.example/x')), {
        'X-A': '1',
      });
      // An explicit default port normalizes to the same origin.
      expect(serverRequestHeadersFor(Uri.parse('https://a.example:443/x')), {
        'X-A': '1',
      });
      expect(serverRequestHeadersFor(Uri.parse('https://b.example:8443/x')), {
        'X-B': '2',
      });
      expect(serverRequestHeadersFor(Uri.parse('http://a.example/x')), isEmpty);
      expect(
        serverRequestHeadersFor(Uri.parse('https://b.example/x')),
        isEmpty,
      );
    });

    test('ignores requests that are not plain web URLs', () {
      gServerRequestHeaders = [
        ServerRequestHeader.tryCreate(
          serverUrl: 'https://a.example',
          name: 'X-A',
          value: '1',
        )!,
      ];
      expect(serverRequestHeadersFor(Uri.parse('file:///tmp/x')), isEmpty);
      expect(serverRequestHeadersFor(Uri.parse('https:///x')), isEmpty);
    });
  });
}
