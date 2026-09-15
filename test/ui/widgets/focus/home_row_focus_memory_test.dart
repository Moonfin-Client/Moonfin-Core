import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/focus/modern_row_navigation.dart';
import 'package:moonfin/ui/widgets/focus/modern_row_scroll_controller.dart';

Future<void> _right(WidgetTester tester, int count) async {
  for (var index = 0; index < count; index++) {
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
  }
}

Future<void> _vertical(WidgetTester tester, LogicalKeyboardKey key) async {
  await tester.sendKeyEvent(key);
  await tester.pumpAndSettle();
}

void main() {
  setUp(HubFocusMemory.clearAll);
  tearDown(HubFocusMemory.clearAll);

  testWidgets('Down and Up restore independent card and scroll positions', (
    tester,
  ) async {
    final rows = _HomeRowsFixture();
    addTearDown(rows.dispose);
    await tester.pumpWidget(rows.build());
    rows.rowA.currentState!.requestFocusFromMemory();
    await tester.pump();

    await _right(tester, 4);
    expect(rows.rowA.currentState!.focusedIndex, 4);
    expect(rows.horizontalA.offset, 400);

    await _vertical(tester, LogicalKeyboardKey.arrowDown);
    await _right(tester, 2);
    expect(rows.rowB.currentState!.focusedIndex, 2);
    expect(rows.horizontalB.offset, 200);

    await _vertical(tester, LogicalKeyboardKey.arrowUp);
    expect(rows.rowA.currentState!.hasFocusedItem, isTrue);
    expect(rows.rowA.currentState!.focusedIndex, 4);
    expect(rows.horizontalA.offset, 400);
    expect(rows.vertical.offset, 0);

    await _vertical(tester, LogicalKeyboardKey.arrowDown);
    expect(rows.rowB.currentState!.hasFocusedItem, isTrue);
    expect(rows.rowB.currentState!.focusedIndex, 2);
    expect(rows.horizontalB.offset, 200);
    expect(rows.vertical.offset, 200);
    expect(HubFocusMemory.peek('home-A'), 4);
    expect(HubFocusMemory.peek('home-B'), 2);
  });

  testWidgets('a quick return keeps the card selected during pending scrolls', (
    tester,
  ) async {
    final rows = _HomeRowsFixture();
    final downScroll = Completer<void>();
    final upScroll = Completer<void>();
    rows.scroll = (rowIndex) =>
        rowIndex == 1 ? downScroll.future : upScroll.future;
    addTearDown(rows.dispose);
    await tester.pumpWidget(rows.build());
    rows.rowA.currentState!.requestFocusFromMemory();
    await tester.pump();
    await _right(tester, 4);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    final downMove = rows.lastMove!;
    await _right(tester, 2);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    final upMove = rows.lastMove!;
    expect(rows.rowA.currentState!.focusedIndex, 4);
    await _right(tester, 1);

    downScroll.complete();
    await downMove;
    await tester.pump();
    expect(rows.navigation.targetKey, 'A');
    expect(rows.rowA.currentState!.hasFocusedItem, isTrue);
    expect(rows.rowA.currentState!.focusedIndex, 5);
    expect(rows.horizontalA.offset, 500);

    upScroll.complete();
    await upMove;
    await tester.pump();
    expect(rows.rowA.currentState!.focusedIndex, 5);
    expect(rows.horizontalA.offset, 500);
    expect(rows.rowB.currentState!.focusedIndex, 2);
    expect(rows.horizontalB.offset, 200);
    expect(HubFocusMemory.peek('home-A'), 5);
    expect(HubFocusMemory.peek('home-B'), 2);
    expect(rows.navigation.isActive, isFalse);
  });

  testWidgets('a remounted row restores memory and a shorter list clamps it', (
    tester,
  ) async {
    final rows = _HomeRowsFixture();
    addTearDown(rows.dispose);
    await tester.pumpWidget(rows.build());
    rows.rowA.currentState!.requestFocusFromMemory();
    await tester.pump();
    await _right(tester, 6);
    await _vertical(tester, LogicalKeyboardKey.arrowDown);
    await _right(tester, 3);

    // A lazily recycled row loses its State but retains its hub's position.
    rows.showA = false;
    await tester.pumpWidget(rows.build());
    expect(rows.rowA.currentState, isNull);
    expect(HubFocusMemory.peek('home-A'), 6);
    rows.showA = true;
    await tester.pumpWidget(rows.build());
    await _vertical(tester, LogicalKeyboardKey.arrowUp);
    expect(rows.rowA.currentState!.hasFocusedItem, isTrue);
    expect(rows.rowA.currentState!.focusedIndex, 6);
    expect(rows.horizontalA.offset, 600);

    rows.itemCountA = 3;
    await tester.pumpWidget(rows.build());
    await tester.pumpAndSettle();
    expect(rows.rowA.currentState!.focusedIndex, 2);
    expect(rows.horizontalA.offset, 0);
    expect(HubFocusMemory.peek('home-A'), 2);
    expect(tester.takeException(), isNull);

    await _vertical(tester, LogicalKeyboardKey.arrowDown);
    expect(rows.rowB.currentState!.focusedIndex, 3);
    expect(rows.horizontalB.offset, 300);
    await _vertical(tester, LogicalKeyboardKey.arrowUp);
    expect(rows.rowA.currentState!.focusedIndex, 2);
    expect(rows.rowA.currentState!.hasFocusedItem, isTrue);
    expect(tester.takeException(), isNull);
  });
}

class _HomeRowsFixture {
  final rowA = GlobalKey<LockedFocusRowState<int>>();
  final rowB = GlobalKey<LockedFocusRowState<int>>();
  final horizontalA = ScrollController();
  final horizontalB = ScrollController();
  final vertical = ModernRowScrollController();
  final navigation = ModernRowNavigation();
  Future<void> Function(int rowIndex)? scroll;
  Future<void>? lastMove;
  bool showA = true;
  int itemCountA = 12;

  void _move(int rowIndex) {
    final targetKey = rowIndex == 0 ? rowA : rowB;
    lastMove = navigation.move(
      targetKey: rowIndex == 0 ? 'A' : 'B',
      requestFocus: () {
        final state = targetKey.currentState;
        if (state == null) return false;
        state.requestFocusFromMemory();
        return true;
      },
      scroll: () =>
          scroll?.call(rowIndex) ??
          vertical.animateToRow(
            rowIndex * 200.0,
            duration: const Duration(milliseconds: 220),
          ),
    );
  }

  Widget _row(String id) {
    final isA = id == 'A';
    return LockedFocusRow<int>(
      key: isA ? rowA : rowB,
      hubKey: 'home-$id',
      items: List.generate(isA ? itemCountA : 12, (index) => index),
      itemKeyBuilder: (item) => item,
      itemExtent: 100,
      height: 100,
      controller: isA ? horizontalA : horizontalB,
      scrollDuration: Duration.zero,
      onVerticalNavigation: (isUp) {
        if (isA && !isUp) _move(1);
        if (!isA && isUp) _move(0);
        return true;
      },
      itemBuilder: (context, item, index, isFocused) => SizedBox(
        width: 100,
        child: Text('$id-$item${isFocused ? ' focused' : ''}'),
      ),
    );
  }

  Widget build() => MaterialApp(
    home: Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 400,
        height: 300,
        child: ListView(
          controller: vertical,
          children: [
            SizedBox(height: 200, child: showA ? _row('A') : null),
            SizedBox(height: 200, child: _row('B')),
            const SizedBox(height: 400),
          ],
        ),
      ),
    ),
  );

  void dispose() {
    navigation.dispose();
    horizontalA.dispose();
    horizontalB.dispose();
    vertical.dispose();
  }
}
