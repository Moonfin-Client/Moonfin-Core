import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/osd_buttons.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/fullscreen_helper.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/util/playback_back_policy.dart';

void main() {
  testWidgets('phone-sized web uses mobile PWA controls', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    expect(PlatformDetection.useMobileUi, isTrue);
    expect(PlatformDetection.useDesktopUi, isFalse);
    expect(NavigationLayout.allowBottomNavbar, isTrue);
    expect(FullscreenHelper.isSupported, isTrue);
    expect(OsdButton.fullscreen.isOffered, isTrue);
    expect(dismissPlaybackChromeBeforeBack(), isFalse);
  }, skip: !kIsWeb);

  test('native playback may dismiss chrome before popping', () {
    expect(dismissPlaybackChromeBeforeBack(), isTrue);
  }, skip: kIsWeb);
}
