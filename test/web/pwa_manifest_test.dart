import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final manifest = jsonDecode(
    File('web/manifest.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  test('installed PWA is free to rotate for landscape playback', () {
    expect(manifest['orientation'], 'any');
  });

  test('desktop install does not opt into an unimplemented title-bar mode', () {
    expect(manifest, isNot(contains('display_override')));
  });

  test('manifest does not advertise placeholder screenshots', () {
    expect(manifest, isNot(contains('screenshots')));
  });

  test('maskable icons are distinct assets with a protected safe zone', () {
    for (final size in [192, 512]) {
      final regular = File('web/icons/Icon-$size.png').readAsBytesSync();
      final maskable = File('web/icons/Icon-maskable-$size.png')
          .readAsBytesSync();
      expect(maskable, isNot(orderedEquals(regular)));
    }
    expect(File('assets/icons/moonfin_maskable.svg').existsSync(), isTrue);
  });

  test('HLS playback is served by the PWA instead of a public CDN', () {
    final index = File('web/index.html').readAsStringSync();
    final hls = File('web/vendor/hls/hls.min.js');

    expect(index, contains('src="vendor/hls/hls.min.js"'));
    expect(index, isNot(contains('cdn.jsdelivr.net')));
    expect(hls.existsSync(), isTrue);
    expect(hls.lengthSync(), greaterThan(400000));
    expect(File('web/vendor/hls/LICENSE').existsSync(), isTrue);
  });
}
