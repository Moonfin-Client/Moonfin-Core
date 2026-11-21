import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/util/platform_detection.dart';

String? _hwdec({required bool applied, required bool enabled}) =>
    MediaKitPlayerBackend.hwdecForToggle(applied: applied, enabled: enabled);

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    PlatformDetection.setTvMode(false);
  });

  test('an unchanged toggle leaves hwdec alone', () {
    expect(_hwdec(applied: true, enabled: true), isNull);
    expect(_hwdec(applied: false, enabled: false), isNull);
  });

  test('turning it off switches every platform to software', () {
    for (final platform in [
      TargetPlatform.windows,
      TargetPlatform.linux,
      TargetPlatform.android,
    ]) {
      debugDefaultTargetPlatformOverride = platform;
      expect(_hwdec(applied: true, enabled: false), 'no', reason: '$platform');
    }
  });

  test('turning it on picks what a fresh start would use', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    expect(_hwdec(applied: false, enabled: true), 'auto');

    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    expect(_hwdec(applied: false, enabled: true), 'auto-safe');

    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(_hwdec(applied: false, enabled: true), 'auto-safe');

    PlatformDetection.setTvMode(true);
    expect(_hwdec(applied: false, enabled: true), 'auto-copy');
  });
}
