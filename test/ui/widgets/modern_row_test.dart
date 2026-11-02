import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/modern_row.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  group('ModernCardExpansion', () {
    test('a focused card grows right away without the dwell', () {
      final expansion = ModernCardExpansion();
      expansion.settle('a', delayExpansion: false);

      expect(
        expansion.isExpanded('a', isFocused: true, isTouch: false, delayExpansion: false),
        isTrue,
      );
      expect(
        expansion.isExpanded('b', isFocused: false, isTouch: false, delayExpansion: false),
        isFalse,
      );
      expansion.dispose();
    });

    test('with the dwell a focused card waits before it grows', () {
      fakeAsync((async) {
        final expansion = ModernCardExpansion();
        bool grown() => expansion.isExpanded(
              'a',
              isFocused: true,
              isTouch: false,
              delayExpansion: true,
            );

        expansion.settle('a', delayExpansion: true);
        expect(grown(), isFalse);

        async.elapse(const Duration(milliseconds: 70));
        expect(grown(), isTrue);
        expansion.dispose();
      });
    });

    test('a card passed during the dwell never grows', () {
      fakeAsync((async) {
        final expansion = ModernCardExpansion();
        expansion.settle('a', delayExpansion: true);
        async.elapse(const Duration(milliseconds: 30));
        expansion.settle('b', delayExpansion: true);
        async.elapse(const Duration(milliseconds: 70));

        expect(expansion.settledKey.value, 'b');
        expansion.dispose();
      });
    });

    test('a hovered card grows without focus', () {
      final expansion = ModernCardExpansion();
      expansion.hoveredKey.value = 'a';

      expect(
        expansion.isExpanded('a', isFocused: false, isTouch: false, delayExpansion: true),
        isTrue,
      );
      expansion.dispose();
    });

    test('touch grows a card on the first tap and opens it on the second', () {
      final expansion = ModernCardExpansion();
      bool grown() => expansion.isExpanded(
            'a',
            isFocused: false,
            isTouch: true,
            delayExpansion: false,
          );

      expect(expansion.tapToOpen('a'), isFalse);
      expect(grown(), isTrue);
      expect(expansion.tapToOpen('a'), isTrue);
      expect(grown(), isFalse);
      expansion.dispose();
    });
  });

  group('modernDetailsWidth', () {
    // An 800px row (the test window) of 20 cards, 100px apart plus 10px spacing, growing to 300.
    Future<ScrollController> row(WidgetTester tester, {double offset = 0}) async {
      final controller = ScrollController(initialScrollOffset: offset);
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: SizedBox(
              width: 800,
              height: 100,
              child: ListView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: const [SizedBox(width: 5000)],
              ),
            ),
          ),
        ),
      );
      return controller;
    }

    double width(ScrollController controller, int index, {bool hovered = false}) =>
        modernDetailsWidth(
          controller: controller,
          index: index,
          itemCount: 20,
          itemExtent: 100,
          itemSpacing: 10,
          focusedWidth: 300,
          maxWidth: 2000,
          leadingInset: 0,
          trailingInset: 0,
          hovered: hovered,
        );

    testWidgets('stops at twice the card width', (tester) async {
      expect(width(await row(tester), 0), 600);
    });

    testWidgets('a card that cannot scroll to the edge gets the room left', (tester) async {
      expect(width(await row(tester), 19), 300);
    });

    testWidgets('a hovered card gets the room from where it sits', (tester) async {
      expect(width(await row(tester), 5, hovered: true), 250);
    });

    testWidgets('a hovered card in a scrolled row starts from the offset', (tester) async {
      expect(width(await row(tester, offset: 500), 9, hovered: true), 310);
    });

    testWidgets('a TV keeps the whole row', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic));
      expect(width(await row(tester), 0), 800);
    });
  });

  group('ModernHoverBuilder', () {
    late ModernCardExpansion expansion;
    late ScrollController controller;
    late List<bool> builds;

    Future<void> pump(WidgetTester tester) async {
      expansion = ModernCardExpansion();
      controller = ScrollController();
      addTearDown(expansion.dispose);
      addTearDown(controller.dispose);
      builds = [];
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: const [SizedBox(width: 5000)],
                ),
              ),
              ModernHoverBuilder(
                expansion: expansion,
                cardKey: 'a',
                controller: controller,
                builder: (context, hovered) {
                  builds.add(hovered);
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      );
    }

    testWidgets('rebuilds when the pointer lands on a card focus already grew', (tester) async {
      await pump(tester);
      expansion.hoveredKey.value = 'a';
      await tester.pump();
      expect(builds, [false, true]);
    });

    testWidgets('follows the row only while hovered', (tester) async {
      await pump(tester);
      controller.jumpTo(100);
      await tester.pump();
      expect(builds, [false]);

      expansion.hoveredKey.value = 'a';
      await tester.pump();
      controller.jumpTo(200);
      await tester.pump();
      expect(builds, [false, true, true]);
    });
  });
}
