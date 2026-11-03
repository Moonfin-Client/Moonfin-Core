import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/trickplay_headers.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_silo/server_silo.dart';

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test Mac',
  appName: 'Moonfin',
  appVersion: '1.9.0',
);

void main() {
  test('Jellyfin and Emby: their own authorization', () {
    final jellyfin = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'tok';
    final headers = trickplayImageHeaders(jellyfin);
    expect(headers['User-Agent'], isNotEmpty);
    expect(headers['Authorization'], startsWith('MediaBrowser '));
    expect(headers['Authorization'], contains('Token="tok"'));
    expect(trickplayImageHeaders(jellyfin, withUserAgent: false).keys, [
      'Authorization',
    ]);

    final emby = EmbyMediaServerClient(
      baseUrl: 'https://emby.example',
      deviceInfo: _device,
    )..accessToken = 'tok';
    expect(trickplayImageHeaders(emby)['Authorization'], startsWith('Emby '));
  });

  test('Silo: none, its sheets are signed', () {
    final silo = SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: _device,
    )..accessToken = 'tok';
    expect(trickplayImageHeaders(silo).keys, ['User-Agent']);
    expect(trickplayImageHeaders(silo, withUserAgent: false), isEmpty);
  });
}
