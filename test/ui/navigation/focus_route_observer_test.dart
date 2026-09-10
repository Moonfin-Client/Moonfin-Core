import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/navigation/focus_route_observer.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/platform_detection.dart';

/// Mirrors the left navbar layout: content fills the stack and the rail sits
/// on the left edge. Passing [cardVisible] lets a test bring the content in
/// late, the way home rows arrive after the route lands.
Widget _appWithRail({
  required FocusNode rail,
  required FocusNode card,
  ValueListenable<bool>? cardVisible,
}) {
  final content = Focus(
    focusNode: card,
    child: const SizedBox(width: 200, height: 120),
  );
  return MaterialApp(
    navigatorObservers: [FocusRouteObserver()],
    home: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: cardVisible == null
                  ? content
                  : ValueListenableBuilder<bool>(
                      valueListenable: cardVisible,
                      builder: (_, visible, _) =>
                          visible ? content : const SizedBox.shrink(),
                    ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Focus(
              focusNode: rail,
              child: const SizedBox(width: 72),
            ),
          ),
        ],
      ),
    ),
  );
}

void main() {
  tearDown(() {
    PlatformDetection.setTvMode(false);
    NavigationLayout.chromeFocusRoots.clear();
  });

  testWidgets('leaves focus alone on desktop so the rail stays collapsed',
      (tester) async {
    final rail = FocusNode(debugLabel: 'Rail');
    final card = FocusNode(debugLabel: 'Card');
    addTearDown(rail.dispose);
    addTearDown(card.dispose);

    await tester.pumpWidget(_appWithRail(rail: rail, card: card));
    // Outlast the observer's full retry window.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    expect(rail.hasFocus, isFalse);
    expect(card.hasFocus, isFalse);
  }, variant: TargetPlatformVariant.only(TargetPlatform.linux));

  testWidgets('still hands the d-pad a starting point on TV', (tester) async {
    PlatformDetection.setTvMode(true);
    final rail = FocusNode(debugLabel: 'Rail');
    final card = FocusNode(debugLabel: 'Card');
    addTearDown(rail.dispose);
    addTearDown(card.dispose);

    await tester.pumpWidget(_appWithRail(rail: rail, card: card));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    expect(rail.hasFocus || card.hasFocus, isTrue);
  });

  testWidgets('prefers content over registered chrome on TV', (tester) async {
    PlatformDetection.setTvMode(true);
    final rail = FocusNode(debugLabel: 'Rail');
    final card = FocusNode(debugLabel: 'Card');
    addTearDown(rail.dispose);
    addTearDown(card.dispose);
    NavigationLayout.chromeFocusRoots.add(rail);

    await tester.pumpWidget(_appWithRail(rail: rail, card: card));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    expect(card.hasFocus, isTrue);
    expect(rail.hasFocus, isFalse);
  });

  testWidgets('focuses nothing when only chrome is available', (tester) async {
    PlatformDetection.setTvMode(true);
    final rail = FocusNode(debugLabel: 'Rail');
    final card = FocusNode(debugLabel: 'Card');
    final cardVisible = ValueNotifier<bool>(false);
    addTearDown(rail.dispose);
    addTearDown(card.dispose);
    addTearDown(cardVisible.dispose);
    NavigationLayout.chromeFocusRoots.add(rail);

    await tester.pumpWidget(
      _appWithRail(rail: rail, card: card, cardVisible: cardVisible),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    expect(rail.hasFocus, isFalse);
  });

  testWidgets('waits for late content instead of landing in the rail',
      (tester) async {
    PlatformDetection.setTvMode(true);
    final rail = FocusNode(debugLabel: 'Rail');
    final card = FocusNode(debugLabel: 'Card');
    final cardVisible = ValueNotifier<bool>(false);
    addTearDown(rail.dispose);
    addTearDown(card.dispose);
    addTearDown(cardVisible.dispose);
    NavigationLayout.chromeFocusRoots.add(rail);

    await tester.pumpWidget(
      _appWithRail(rail: rail, card: card, cardVisible: cardVisible),
    );
    await tester.pump();
    // A couple of retries pass with nothing to focus but the rail.
    await tester.pump(const Duration(milliseconds: 120));
    expect(rail.hasFocus, isFalse);

    cardVisible.value = true;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(card.hasFocus, isTrue);
    expect(rail.hasFocus, isFalse);
  });
}
