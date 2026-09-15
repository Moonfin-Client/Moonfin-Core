import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/modern_row_navigation.dart';

Widget _list({
  required ScrollController controller,
  FocusNode? targetFocusNode,
}) => MaterialApp(
  home: Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      width: 300,
      height: 400,
      child: ListView.builder(
        controller: controller,
        itemExtent: 100,
        itemCount: 40,
        itemBuilder: (context, index) => index == 20
            ? Focus(focusNode: targetFocusNode, child: const Text('target'))
            : Text('row $index'),
      ),
    ),
  ),
);

void main() {
  testWidgets('starts scrolling in the same turn as focus on an idle screen', (
    tester,
  ) async {
    await tester.pumpWidget(const SizedBox());
    expect(tester.binding.hasScheduledFrame, isFalse);
    final navigation = ModernRowNavigation();
    addTearDown(navigation.dispose);
    final events = <String>[];

    final move = navigation.move(
      targetKey: 'next',
      requestFocus: () {
        events.add('focus');
        return true;
      },
      scroll: () async => events.add('scroll'),
    );

    expect(events, ['focus', 'scroll']);
    expect(navigation.targetKey, 'next');
    expect(navigation.isActive, isTrue);
    expect(tester.binding.hasScheduledFrame, isTrue);
    await tester.pump();
    await move;
    expect(events, ['focus', 'scroll']);
    expect(navigation.isActive, isFalse);
    expect(navigation.targetKey, isNull);
  });

  testWidgets('a newer move supersedes pending work before the first frame', (
    tester,
  ) async {
    final navigation = ModernRowNavigation();
    addTearDown(navigation.dispose);
    final secondScroll = Completer<void>();
    final scrolls = <String>[];
    final first = navigation.move(
      targetKey: 'first',
      requestFocus: () => true,
      scroll: () async => scrolls.add('first'),
    );
    final second = navigation.move(
      targetKey: 'second',
      requestFocus: () => true,
      scroll: () {
        scrolls.add('second');
        return secondScroll.future;
      },
    );

    await tester.pump();
    await first;
    expect(scrolls, ['first', 'second']);
    expect(navigation.targetKey, 'second');
    expect(navigation.isActive, isTrue);
    secondScroll.complete();
    await second;
    expect(navigation.isActive, isFalse);
  });

  testWidgets('a running list scroll retargets from its current position', (
    tester,
  ) async {
    final controller = ScrollController();
    final navigation = ModernRowNavigation();
    addTearDown(controller.dispose);
    addTearDown(navigation.dispose);
    await tester.pumpWidget(_list(controller: controller));
    Future<void> move(int rowIndex) => navigation.move(
      targetKey: rowIndex,
      requestFocus: () => true,
      scroll: () => controller.animateTo(
        rowIndex * 100.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      ),
    );

    final first = move(10);
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(controller.offset, closeTo(250, 0.01));

    final second = move(20);
    await tester.pump();
    await first;
    expect(controller.offset, closeTo(250, 0.01));
    expect(navigation.targetKey, 20);
    expect(navigation.isActive, isTrue);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(controller.offset, closeTo(687.5, 0.01));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 1));
    await second;
    expect(controller.offset, 2000);
    expect(navigation.isActive, isFalse);
  });

  testWidgets('stale scroll completion cannot refocus or clear a newer move', (
    tester,
  ) async {
    final navigation = ModernRowNavigation();
    addTearDown(navigation.dispose);
    final firstScroll = Completer<void>();
    final secondScroll = Completer<void>();
    final focuses = <String>[];
    Future<void> move(String key, Completer<void> scroll) => navigation.move(
      targetKey: key,
      requestFocus: () {
        focuses.add(key);
        return false;
      },
      scroll: () => scroll.future,
    );
    final first = move('first', firstScroll);
    await tester.pump();
    final second = move('second', secondScroll);
    await tester.pump();

    firstScroll.complete();
    await first;
    expect(focuses, ['first', 'second']);
    expect(navigation.targetKey, 'second');
    expect(navigation.isActive, isTrue);

    secondScroll.complete();
    await tester.pump();
    await tester.pump();
    await second;
    expect(focuses, ['first', 'second', 'second']);
    expect(navigation.targetKey, isNull);
  });

  testWidgets(
    'a newer move cancels a lazy focus retry already awaiting layout',
    (tester) async {
      final navigation = ModernRowNavigation();
      addTearDown(navigation.dispose);
      final firstScroll = Completer<void>();
      final secondScroll = Completer<void>();
      var firstFocusCount = 0;
      final first = navigation.move(
        targetKey: 'first',
        requestFocus: () {
          firstFocusCount++;
          return false;
        },
        scroll: () => firstScroll.future,
      );
      await tester.pump();
      firstScroll.complete();
      await tester.idle();
      final second = navigation.move(
        targetKey: 'second',
        requestFocus: () => true,
        scroll: () => secondScroll.future,
      );

      await tester.pump();
      await first;
      expect(firstFocusCount, 1);
      expect(navigation.targetKey, 'second');
      secondScroll.complete();
      await second;
      expect(navigation.isActive, isFalse);
    },
  );

  for (final dispose in [false, true]) {
    final operation = dispose ? 'dispose' : 'cancel';
    testWidgets('$operation retires a move started before the first frame', (
      tester,
    ) async {
      final navigation = ModernRowNavigation();
      addTearDown(navigation.dispose);
      var scrollCount = 0;
      final move = navigation.move(
        targetKey: 'next',
        requestFocus: () => false,
        scroll: () async => scrollCount++,
      );
      if (dispose) {
        navigation.dispose();
      } else {
        navigation.cancel();
      }
      await tester.pump();
      await move;
      expect(scrollCount, 1);
      expect(navigation.isActive, isFalse);
    });

    testWidgets('$operation prevents focus retry after a running scroll', (
      tester,
    ) async {
      final navigation = ModernRowNavigation();
      addTearDown(navigation.dispose);
      final scroll = Completer<void>();
      var focusCount = 0;
      final move = navigation.move(
        targetKey: 'next',
        requestFocus: () {
          focusCount++;
          return false;
        },
        scroll: () => scroll.future,
      );
      await tester.pump();
      if (dispose) {
        navigation.dispose();
      } else {
        navigation.cancel();
      }
      scroll.complete();
      await move;
      await tester.pump();
      expect(focusCount, 1);
      expect(navigation.targetKey, isNull);
    });
  }

  testWidgets('disposed navigation ignores new focus and scroll requests', (
    tester,
  ) async {
    final navigation = ModernRowNavigation()..dispose();
    var focusCount = 0;
    var scrollCount = 0;
    await navigation.move(
      targetKey: 'next',
      requestFocus: () {
        focusCount++;
        return true;
      },
      scroll: () async => scrollCount++,
    );
    expect(focusCount, 0);
    expect(scrollCount, 0);
    expect(navigation.isActive, isFalse);
  });

  testWidgets(
    'retries focus after scrolling a lazy destination into the tree',
    (tester) async {
      final controller = ScrollController();
      final node = FocusNode();
      final navigation = ModernRowNavigation();
      addTearDown(controller.dispose);
      addTearDown(node.dispose);
      addTearDown(navigation.dispose);
      final activeOnFocus = <bool>[];
      node.addListener(() {
        if (node.hasFocus) activeOnFocus.add(navigation.isActive);
      });
      await tester.pumpWidget(
        _list(controller: controller, targetFocusNode: node),
      );
      expect(node.context, isNull);
      var focusCount = 0;
      final move = navigation.move(
        targetKey: 20,
        requestFocus: () {
          focusCount++;
          if (node.context == null) return false;
          node.requestFocus();
          return true;
        },
        scroll: () async => controller.jumpTo(2000),
      );

      await tester.pump();
      expect(focusCount, 1);
      expect(controller.offset, 2000);
      await tester.pump();
      expect(focusCount, 2);
      expect(node.hasFocus, isTrue);
      expect(activeOnFocus, [true]);
      expect(navigation.isActive, isTrue);
      await tester.pump();
      await move;
      expect(navigation.isActive, isFalse);
    },
  );

  testWidgets(
    'successful initial focus is never restored on scroll completion',
    (tester) async {
      final navigation = ModernRowNavigation();
      addTearDown(navigation.dispose);
      final scroll = Completer<void>();
      var focusedCard = 0;
      var focusCount = 0;
      final move = navigation.move(
        targetKey: 'next',
        requestFocus: () {
          focusCount++;
          focusedCard = 0;
          return true;
        },
        scroll: () => scroll.future,
      );
      await tester.pump();
      focusedCard = 3;
      scroll.complete();
      await move;
      await tester.pump();
      expect(focusCount, 1);
      expect(focusedCard, 3);
    },
  );
}
