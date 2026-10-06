import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/minimalist/minimalist_portrait_layout.dart';
import 'package:moonfin/ui/screens/detail/modern/modern_portrait_layout.dart';
import 'package:moonfin/ui/screens/detail/nouveau/nouveau_portrait_layout.dart';
import 'package:moonfin/ui/screens/detail/spotlight/spotlight_portrait_layout.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_navbar.dart';

const _screen = Size(400, 800);
const _bar = 100.0;
const _end = Key('end');
const _tall = SizedBox(key: _end, height: 1200);

void main() {
  void usePhone(WidgetTester tester, {double systemInset = 0}) {
    tester.view.physicalSize = _screen;
    tester.view.devicePixelRatio = 1;
    tester.view.padding = FakeViewPadding(bottom: systemInset);
    addTearDown(tester.view.reset);
  }

  Future<void> pumpLayout(
    WidgetTester tester,
    Widget layout, {
    bool bar = true,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: bar ? BottomNavInsetScope(height: _bar, child: layout) : layout,
        ),
      ),
    );
  }

  Future<void> expectEndClears(WidgetTester tester, double inset) async {
    final position = tester
        .state<ScrollableState>(find.byType(Scrollable).first)
        .position;
    position.jumpTo(position.maxScrollExtent);
    await tester.pump();
    expect(
      tester.getRect(find.byKey(_end)).bottom,
      lessThanOrEqualTo(_screen.height - inset),
    );
  }

  ScrollController controller() {
    final c = ScrollController();
    addTearDown(c.dispose);
    return c;
  }

  group('the end of a details page scrolls clear of the bottom navbar', () {
    testWidgets('Modern', (tester) async {
      usePhone(tester);
      await pumpLayout(
        tester,
        ModernPortraitLayout(
          backdrop: const SizedBox.expand(),
          hero: const SizedBox(height: 200),
          tabBar: null,
          tabContent: _tall,
          topInset: 0,
          scrollController: controller(),
        ),
      );
      await expectEndClears(tester, _bar);
    });

    testWidgets('Spotlight', (tester) async {
      usePhone(tester);
      await pumpLayout(
        tester,
        SpotlightPortraitLayout(
          backdrop: const SizedBox.expand(),
          hero: const SizedBox(height: 200),
          cards: _tall,
          topInset: 0,
          scrollController: controller(),
        ),
      );
      await expectEndClears(tester, _bar);
    });

    testWidgets('Nouveau', (tester) async {
      usePhone(tester);
      await pumpLayout(
        tester,
        NouveauPortraitLayout(
          backdrop: const SizedBox.expand(),
          hero: const SizedBox(height: 200),
          sections: const [_tall],
          scrollController: controller(),
        ),
      );
      await expectEndClears(tester, _bar);
    });

    testWidgets('Minimalist lifts its buttons above the bar', (tester) async {
      usePhone(tester);
      await pumpLayout(
        tester,
        const MinimalistPortraitLayout(
          branding: SizedBox(height: 80),
          actions: SizedBox(key: _end, height: 48),
          compact: true,
        ),
      );
      expect(
        tester.getRect(find.byKey(_end)).bottom,
        lessThanOrEqualTo(_screen.height - _bar),
      );
    });
  });

  testWidgets('without a bar the page clears the system navigation', (
    tester,
  ) async {
    usePhone(tester, systemInset: 48);
    await pumpLayout(
      tester,
      NouveauPortraitLayout(
        backdrop: const SizedBox.expand(),
        hero: const SizedBox(height: 200),
        sections: const [_tall],
        scrollController: controller(),
      ),
      bar: false,
    );
    await expectEndClears(tester, 48);
  });
}
