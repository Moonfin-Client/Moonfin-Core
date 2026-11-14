import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    PlatformDetection.setTvMode(false);
    PlatformDetection.setSupportsTouchLayout(true);
    debugDefaultTargetPlatformOverride = null;
  });

  test('automatic follows runtime detection', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(PlatformDetection.isTV, isFalse);
    PlatformDetection.setTvMode(true);
    expect(PlatformDetection.isTV, isTrue);
  });

  test('phone pulls a misdetected Android device out of the TV UI', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    expect(PlatformDetection.isTV, isFalse);
    expect(PlatformDetection.useMobileUi, isTrue);
    expect(PlatformDetection.useLeanbackUi, isFalse);
  });

  test("phone is ignored on a remote-only TV, which couldn't get back", () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    PlatformDetection.setSupportsTouchLayout(false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    expect(PlatformDetection.isTV, isTrue);
    expect(PlatformDetection.useLeanbackUi, isTrue);
    expect(PlatformDetection.useMobileUi, isFalse);
    expect(PlatformDetection.canUsePhoneLayout, isFalse);
  });

  test('tv puts a desktop in the leanback UI', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    expect(PlatformDetection.isTV, isTrue);
    expect(PlatformDetection.useLeanbackUi, isTrue);
    expect(PlatformDetection.useDesktopUi, isFalse);
  });

  test('offline downloads are supported on Android TV', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);

    expect(PlatformDetection.isTV, isTrue);
    expect(PlatformDetection.supportsOfflineDownloads, isTrue);
  });

  test('offline downloads remain unavailable on other TV layouts', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);

    expect(PlatformDetection.isTV, isTrue);
    expect(PlatformDetection.supportsOfflineDownloads, isFalse);
  });

  test('desktop keeps a misdetected desktop out of the TV UI', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    PlatformDetection.setTvMode(true);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    expect(PlatformDetection.isTV, isFalse);
    expect(PlatformDetection.useDesktopUi, isTrue);
  });

  test('exactly one layout is active whatever is set', () {
    for (final platform in [TargetPlatform.android, TargetPlatform.linux]) {
      debugDefaultTargetPlatformOverride = platform;
      for (final layout in InterfaceLayout.values) {
        for (final detectedTv in [false, true]) {
          PlatformDetection.setTvMode(detectedTv);
          PlatformDetection.setInterfaceLayout(layout);
          final active = [
            PlatformDetection.useLeanbackUi,
            PlatformDetection.useDesktopUi,
            PlatformDetection.useMobileUi,
          ].where((v) => v).length;
          expect(active, 1, reason: '$platform $layout tv=$detectedTv');
        }
      }
    }
  });
}
