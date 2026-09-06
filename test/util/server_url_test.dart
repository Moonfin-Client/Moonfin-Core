import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/server_url.dart';

void main() {
  group('normalizeServerBaseUrl', () {
    test('ignores a trailing slash', () {
      expect(
        normalizeServerBaseUrl('https://media.example.com/'),
        normalizeServerBaseUrl('https://media.example.com'),
      );
    });

    test('ignores a web client path suffix', () {
      expect(
        normalizeServerBaseUrl('https://media.example.com/web/index.html'),
        normalizeServerBaseUrl('https://media.example.com'),
      );
      expect(
        normalizeServerBaseUrl('https://media.example.com/web'),
        normalizeServerBaseUrl('https://media.example.com'),
      );
    });

    test('ignores an explicit default port', () {
      expect(
        normalizeServerBaseUrl('https://media.example.com:443'),
        normalizeServerBaseUrl('https://media.example.com'),
      );
      expect(
        normalizeServerBaseUrl('http://media.example.com:80'),
        normalizeServerBaseUrl('http://media.example.com'),
      );
    });

    test('ignores host casing', () {
      expect(
        normalizeServerBaseUrl('https://Media.Example.COM'),
        normalizeServerBaseUrl('https://media.example.com'),
      );
    });

    test('converts internationalized hostnames to IDNA ASCII', () {
      expect(
        normalizeServerBaseUrl('https://éxâmplê.example'),
        'https://xn--xmpl-boa4bm.example',
      );
      expect(
        normalizeServerBaseUrl('éxâmplê.example'),
        'xn--xmpl-boa4bm.example',
      );
      expect(
        normalizeServerBaseUrl('https://media.éxâmplê.example:8443/jellyfin/'),
        'https://media.xn--xmpl-boa4bm.example:8443/jellyfin',
      );
      expect(
        normalizeServerBaseUrl('https://xn--xmpl-boa4bm.example'),
        'https://xn--xmpl-boa4bm.example',
      );
    });

    test('leaves a Punycode hostname encoded', () {
      expect(
        normalizeServerBaseUrl('https://xn--80ak6aa92e.com'),
        'https://xn--80ak6aa92e.com',
      );
    });

    test('keeps a reverse proxy path prefix', () {
      expect(
        normalizeServerBaseUrl('https://example.com/jellyfin/'),
        'https://example.com/jellyfin',
      );
    });

    test('keeps a non-default port', () {
      expect(
        normalizeServerBaseUrl('http://192.168.1.5:8096/'),
        'http://192.168.1.5:8096',
      );
    });

    test('still separates genuinely different servers', () {
      expect(
        normalizeServerBaseUrl('https://media.example.com'),
        isNot(normalizeServerBaseUrl('http://192.168.1.5:8096')),
      );
    });
  });

  group('serverDisplayAddress', () {
    test('preserves a Unicode hostname entered by the user', () {
      expect(
        serverDisplayAddress(
          enteredAddress: 'https://bücher.de',
          resolvedAddress: 'https://xn--bcher-kva.de',
        ),
        'https://bücher.de',
      );
      expect(
        serverDisplayAddress(
          enteredAddress: 'media.bücher.de',
          resolvedAddress: 'https://media.xn--bcher-kva.de:8443/jellyfin',
        ),
        'https://media.bücher.de:8443/jellyfin',
      );
    });

    test('does not decode explicitly entered Punycode', () {
      expect(
        serverDisplayAddress(
          enteredAddress: 'https://xn--80ak6aa92e.com',
          resolvedAddress: 'https://xn--80ak6aa92e.com',
        ),
        'https://xn--80ak6aa92e.com',
      );
    });

    test('does not carry an entered hostname across a redirect', () {
      expect(
        serverDisplayAddress(
          enteredAddress: 'https://bücher.de',
          resolvedAddress: 'https://example.com',
        ),
        'https://example.com',
      );
    });
  });
}
