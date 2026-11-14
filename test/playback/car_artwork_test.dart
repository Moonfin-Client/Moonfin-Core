import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/car_artwork.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('keeps the server token out of the wrapped URI', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    PackageInfo.setMockInitialValues(
      appName: 'Moonfin',
      packageName: 'org.moonfin.androidtv',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
    SharedPreferences.setMockInitialValues({});
    await CarArtwork.instance.ensureReady();

    final jellyfin = CarArtwork.instance.wrap(
      'http://10.0.0.7:8096/Items/1/Images/Primary?tag=a&ApiKey=secret&quality=90',
    )!;
    final emby = CarArtwork.instance.wrap(
      'https://emby.example.com/Items/2/Images/Primary?api_key=other',
    )!;

    expect(
      jellyfin.queryParameters['u'],
      'http://10.0.0.7:8096/Items/1/Images/Primary?tag=a&quality=90',
    );
    expect(
      emby.queryParameters['u'],
      'https://emby.example.com/Items/2/Images/Primary',
    );

    await CarArtwork.instance.persistHosts();
    final prefs = await SharedPreferences.getInstance();
    expect(jsonDecode(prefs.getString('moonfin_art_tokens')!), {
      'http://10.0.0.7:8096': 'ApiKey=secret',
      'https://emby.example.com:443': 'api_key=other',
    });
  });
}
