import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/platform_detection.dart';

import 'bottom_nav/bottom_nav_fakes.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = (await setUpBottomNav()).prefs;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.top);
  });

  tearDown(() async {
    NavigationLayout.trailerImmersiveNotifier.value = false;
    await tearDownBottomNav();
  });

  testWidgets('a trailer hides the chrome until the mouse moves', (
    tester,
  ) async {
    await tester.pumpWidget(bottomNavApp());
    NavigationLayout.trailerImmersiveNotifier.value = true;
    expect(NavigationLayout.trailerHidesChrome, isTrue);

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: const Offset(10, 10));
    await mouse.moveTo(const Offset(200, 200));
    await tester.pump();
    expect(NavigationLayout.trailerHidesChrome, isFalse);

    await tester.pump(const Duration(seconds: 3));
    expect(NavigationLayout.trailerHidesChrome, isTrue);
    await mouse.removePointer();
  });

  testWidgets('phones keep their chrome through a trailer', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    NavigationLayout.trailerImmersiveNotifier.value = true;
    expect(NavigationLayout.trailerHidesChrome, isFalse);
  });
}
