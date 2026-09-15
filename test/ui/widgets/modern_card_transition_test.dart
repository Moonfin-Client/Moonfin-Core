import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/modern_card_transition.dart';

const _closedWidth = 200.0;
const _imageHeight = 300.0;
const _openWidth = _imageHeight * 16 / 9;
const _duration = Duration(milliseconds: 180);

class _MotionRow extends StatefulWidget {
  final Duration duration;
  final TextDirection textDirection;
  final bool immediateExpansion;
  const _MotionRow({
    super.key,
    this.duration = _duration,
    this.textDirection = TextDirection.ltr,
    this.immediateExpansion = false,
  });

  @override
  State<_MotionRow> createState() => _MotionRowState();
}

class _MotionRowState extends State<_MotionRow> {
  final scroll = ScrollController();
  final focus = FocusNode();
  int count = 15;
  final expansionStarts = <int>[];
  final cardBuilds = <int, int>{};
  late ModernCardRowController motion;

  void append() => setState(() => count += 5);

  @override
  void dispose() {
    scroll.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Directionality(
      textDirection: widget.textDirection,
      child: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: ModernCardRowTransition(
            duration: widget.duration,
            expansionDelay: modernCardExpansionDwell,
            builder: (context, controller) {
              motion = controller;
              return LockedFocusRow<int>(
                items: List.generate(count, (index) => index),
                itemKeyBuilder: (item) => item,
                hubKey: 'modern-motion-test',
                itemExtent: _closedWidth,
                itemExtentBuilder: (index) =>
                    _closedWidth +
                    (_openWidth - _closedWidth) * motion.progressOf(index),
                itemExtentListenable: motion,
                itemSpacing: 12,
                height: 420,
                autofocus: true,
                controller: scroll,
                focusNode: focus,
                scrollDuration: widget.duration,
                scrollCurve: modernCardMotionCurve,
                clipBehavior: Clip.none,
                onIndexChanged: (_, item) => motion.select(
                  item,
                  onSettled: () => expansionStarts.add(item),
                  immediateExpansion: widget.immediateExpansion,
                ),
                onFocusChange: (focused) {
                  if (!focused) motion.select(null);
                },
                itemBuilder: (context, item, index, focused) =>
                    ValueListenableBuilder<double>(
                      key: ValueKey('motion-$item'),
                      valueListenable: motion.progressFor(item),
                      builder: (context, progress, _) {
                        cardBuilds.update(
                          item,
                          (builds) => builds + 1,
                          ifAbsent: () => 1,
                        );
                        final width =
                            _closedWidth +
                            (_openWidth - _closedWidth) * progress;
                        return MediaCard(
                          key: ValueKey('card-$item'),
                          width: width,
                          aspectRatio: width / _imageHeight,
                          artworkBuilder: (_) =>
                              const ColoredBox(color: Colors.blue),
                          externalIsFocused: focused,
                          cardFocusExpansion: false,
                          onTap: () {},
                        );
                      },
                    ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

Finder _motion(int index) => find.byKey(ValueKey('motion-$index'));
Finder _card(int index) => find.byKey(ValueKey('card-$index'));
Finder _art(int index) =>
    find.descendant(of: _card(index), matching: find.byType(AspectRatio)).first;

double _width(WidgetTester tester, int index) =>
    tester.getSize(_art(index)).width;

double _contentX(WidgetTester tester, _MotionRowState state, int index) =>
    tester.getRect(_art(index)).left + state.scroll.offset;

void _expectOneExpandedSlot(_MotionRowState state) {
  final progress = List.generate(state.count, state.motion.progressOf);
  expect(progress.reduce((sum, value) => sum + value), closeTo(1, 0.00001));
}

void _expectSelection(WidgetTester tester, int index) {
  final selected = tester
      .widgetList<MediaCard>(find.byType(MediaCard))
      .where((card) => card.externalIsFocused == true)
      .toList();
  expect(selected, hasLength(1));
  expect(selected.single.key, ValueKey('card-$index'));
}

void _expectGeometry(WidgetTester tester) {
  final cards = tester.widgetList<MediaCard>(find.byType(MediaCard)).toList();
  for (final card in cards) {
    final index = int.parse(
      (card.key! as ValueKey<String>).value.split('-').last,
    );
    final image = tester.getRect(_art(index));
    expect(image.width, closeTo(tester.getSize(_motion(index)).width, 0.001));
    expect(image.height, closeTo(_imageHeight, 0.001));
    expect(
      image.width,
      inInclusiveRange(_closedWidth - 0.001, _openWidth + 0.001),
    );
    if (_card(index + 1).evaluate().isNotEmpty) {
      final nextImage = tester.getRect(_art(index + 1));
      final isRtl =
          Directionality.of(tester.element(_card(index))) == TextDirection.rtl;
      expect(
        isRtl ? image.left - nextImage.right : nextImage.left - image.right,
        closeTo(12, 0.001),
      );
    }
  }
}

Future<GlobalKey<_MotionRowState>> _mount(
  WidgetTester tester, {
  Duration duration = _duration,
  TextDirection textDirection = TextDirection.ltr,
  bool immediateExpansion = false,
}) async {
  await tester.binding.setSurfaceSize(const Size(1200, 800));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  final key = GlobalKey<_MotionRowState>();
  await tester.pumpWidget(
    _MotionRow(
      key: key,
      duration: duration,
      textDirection: textDirection,
      immediateExpansion: immediateExpansion,
    ),
  );
  await tester.pump();
  return key;
}

Future<void> _settleInitial(WidgetTester tester) async {
  await tester.pump(modernCardExpansionDwell);
  await tester.pumpAndSettle();
}

void main() {
  setUp(HubFocusMemory.clearAll);

  testWidgets(
    'focus is immediate and visible bounds expand with the row slot',
    (tester) async {
      await _mount(tester);
      _expectSelection(tester, 0);
      expect(_width(tester, 0), _closedWidth);
      await tester.pump(modernCardExpansionDwell);
      expect(_width(tester, 0), _closedWidth);
      await tester.pump(const Duration(milliseconds: 45));
      expect(_width(tester, 0), greaterThan(_closedWidth));
      expect(_width(tester, 0), lessThan(_openWidth));
      _expectGeometry(tester);
      await tester.pumpAndSettle();
      expect(_width(tester, 0), closeTo(_openWidth, 0.001));
    },
  );

  testWidgets('immediate entry expands before the settled callback runs', (
    tester,
  ) async {
    final key = await _mount(tester, immediateExpansion: true);
    _expectSelection(tester, 0);
    expect(key.currentState!.expansionStarts, isEmpty);
    await tester.pump(const Duration(milliseconds: 35));
    expect(_width(tester, 0), inExclusiveRange(_closedWidth, _openWidth));
    expect(key.currentState!.expansionStarts, isEmpty);
    _expectGeometry(tester);
    await tester.pump(const Duration(milliseconds: 35));
    expect(key.currentState!.expansionStarts, [0]);
    await tester.pumpAndSettle();
    expect(_width(tester, 0), closeTo(_openWidth, 0.001));
    expect(key.currentState!.expansionStarts, [0]);
  });

  testWidgets('leaving immediate entry cancels its settled callback', (
    tester,
  ) async {
    final key = await _mount(tester, immediateExpansion: true);
    await tester.pump(const Duration(milliseconds: 30));
    final beforeExit = _width(tester, 0);
    expect(beforeExit, inExclusiveRange(_closedWidth, _openWidth));
    key.currentState!.focus.unfocus();
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 45));
    expect(_width(tester, 0), inExclusiveRange(_closedWidth, beforeExit));
    expect(key.currentState!.expansionStarts, isEmpty);
    _expectGeometry(tester);
    await tester.pumpAndSettle();
    expect(_width(tester, 0), _closedWidth);
    expect(key.currentState!.expansionStarts, isEmpty);
    expect(tester.widget<MediaCard>(_card(0)).externalIsFocused, isFalse);
  });

  testWidgets(
    'remote handoff keeps one highlight and never overlaps neighbours',
    (tester) async {
      await _mount(tester);
      await _settleInitial(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      _expectSelection(tester, 1);
      expect(_width(tester, 0), closeTo(_openWidth, 0.001));
      expect(_width(tester, 1), _closedWidth);
      for (var frame = 0; frame < 18; frame++) {
        await tester.pump(const Duration(milliseconds: 16));
        _expectGeometry(tester);
        _expectSelection(tester, 1);
      }
      expect(_width(tester, 1), closeTo(_openWidth, 0.001));
      expect(tester.getRect(_art(1)).left, closeTo(0, 0.001));
    },
  );

  for (final direction in [
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.arrowLeft,
  ]) {
    testWidgets(
      'the tail stays in place during a ${direction.keyLabel} handoff',
      (tester) async {
        final key = await _mount(tester);
        await _settleInitial(tester);
        if (direction == LogicalKeyboardKey.arrowLeft) {
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
          await tester.pumpAndSettle();
        }
        final state = key.currentState!;
        final tailX = _contentX(tester, state, 3);
        await tester.sendKeyEvent(direction);
        await tester.pump();
        for (var frame = 0; frame < 18; frame++) {
          await tester.pump(const Duration(milliseconds: 16));
          expect(_contentX(tester, state, 3), closeTo(tailX, 0.001));
          _expectOneExpandedSlot(state);
          _expectGeometry(tester);
        }
      },
    );
  }

  testWidgets('direction reversal continues from the current card widths', (
    tester,
  ) async {
    await _mount(tester);
    await _settleInitial(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 30));
    final before = [_width(tester, 0), _width(tester, 1)];
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    _expectSelection(tester, 0);
    expect(_width(tester, 0), closeTo(before[0], 0.001));
    expect(_width(tester, 1), closeTo(before[1], 0.001));
    for (var frame = 0; frame < 18; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      _expectGeometry(tester);
    }
    expect(_width(tester, 0), closeTo(_openWidth, 0.001));
    expect(_width(tester, 1), _closedWidth);
  });

  testWidgets('partial A to B to C and reversal conserve the expanded width', (
    tester,
  ) async {
    final key = await _mount(tester);
    await _settleInitial(tester);
    final state = key.currentState!;
    final tailX = _contentX(tester, state, 3);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 45));
    _expectOneExpandedSlot(state);
    final beforeC = List.generate(3, state.motion.progressOf);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    for (var index = 0; index < 3; index++) {
      expect(state.motion.progressOf(index), closeTo(beforeC[index], 0.00001));
    }
    await tester.pump(const Duration(milliseconds: 45));
    _expectOneExpandedSlot(state);
    final beforeReverse = List.generate(3, state.motion.progressOf);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    for (var index = 0; index < 3; index++) {
      expect(
        state.motion.progressOf(index),
        closeTo(beforeReverse[index], 0.00001),
      );
    }
    for (var frame = 0; frame < 18; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      _expectOneExpandedSlot(state);
      expect(_contentX(tester, state, 3), closeTo(tailX, 0.001));
      _expectGeometry(tester);
    }
    _expectSelection(tester, 1);
    expect(_width(tester, 1), closeTo(_openWidth, 0.001));
    expect(state.motion.progressOf(0), 0);
    expect(state.motion.progressOf(2), 0);
  });

  for (final textDirection in TextDirection.values) {
    testWidgets(
      'held remote input returns through recycled cards in ${textDirection.name}',
      (tester) async {
        final key = await _mount(tester, textDirection: textDirection);
        final isRtl = textDirection == TextDirection.rtl;
        final forwardKey = isRtl
            ? LogicalKeyboardKey.arrowLeft
            : LogicalKeyboardKey.arrowRight;
        final backwardKey = isRtl
            ? LogicalKeyboardKey.arrowRight
            : LogicalKeyboardKey.arrowLeft;
        await _settleInitial(tester);
        await tester.sendKeyDownEvent(forwardKey);
        await tester.pump();
        for (var index = 1; index <= 9; index++) {
          _expectSelection(tester, index);
          _expectOneExpandedSlot(key.currentState!);
          await tester.pump(const Duration(milliseconds: 35));
          if (index < 9) {
            await tester.sendKeyRepeatEvent(forwardKey);
            await tester.pump();
          }
        }
        await tester.sendKeyUpEvent(forwardKey);
        await tester.pump(modernCardExpansionDwell);
        await tester.pumpAndSettle();
        _expectSelection(tester, 9);
        expect(_width(tester, 9), closeTo(_openWidth, 0.001));
        final selectedRect = tester.getRect(_art(9));
        expect(
          isRtl ? selectedRect.right : selectedRect.left,
          closeTo(isRtl ? 1200 : 0, 0.001),
        );
        expect(key.currentState!.expansionStarts, [0, 9]);
        _expectGeometry(tester);
        expect(_card(0), findsNothing);

        await tester.sendKeyDownEvent(backwardKey);
        await tester.pump();
        for (var index = 8; index >= 0; index--) {
          expect(
            tester
                .state<LockedFocusRowState<int>>(
                  find.byType(LockedFocusRow<int>),
                )
                .focusedIndex,
            index,
          );
          // Held input can outrun the scrolling viewport temporarily. The
          // shared widths must remain valid while that card is recycled.
          if (_card(index).evaluate().isNotEmpty) {
            _expectSelection(tester, index);
          }
          _expectOneExpandedSlot(key.currentState!);
          _expectGeometry(tester);
          await tester.pump(const Duration(milliseconds: 35));
          _expectOneExpandedSlot(key.currentState!);
          if (index > 0) {
            await tester.sendKeyRepeatEvent(backwardKey);
            await tester.pump();
          }
        }
        await tester.sendKeyUpEvent(backwardKey);
        await tester.pump(modernCardExpansionDwell);
        await tester.pumpAndSettle();
        _expectSelection(tester, 0);
        _expectOneExpandedSlot(key.currentState!);
        expect(_width(tester, 0), closeTo(_openWidth, 0.001));
        final returnedRect = tester.getRect(_art(0));
        expect(
          isRtl ? returnedRect.right : returnedRect.left,
          closeTo(isRtl ? 1200 : 0, 0.001),
        );
        expect(key.currentState!.scroll.offset, closeTo(0, 0.001));
        expect(key.currentState!.expansionStarts, [0, 9, 0]);
        _expectGeometry(tester);
      },
    );
  }

  testWidgets('geometry ticks do not rebuild unrelated card contents', (
    tester,
  ) async {
    final key = await _mount(tester);
    await _settleInitial(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    final before = key.currentState!.cardBuilds[3];
    expect(before, isNotNull);
    for (var frame = 0; frame < 8; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
      expect(key.currentState!.cardBuilds[3], before);
    }
  });

  testWidgets('leaving the row cancels a pending expansion', (tester) async {
    final key = await _mount(tester);
    await tester.pump(const Duration(milliseconds: 30));
    key.currentState!.focus.unfocus();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(_width(tester, 0), _closedWidth);
    expect(tester.widget<MediaCard>(_card(0)).externalIsFocused, isFalse);
    expect(key.currentState!.expansionStarts, isEmpty);
  });

  testWidgets('leaving an expanded row collapses smoothly', (tester) async {
    final key = await _mount(tester);
    await _settleInitial(tester);
    key.currentState!.focus.unfocus();
    await tester.pump();
    expect(_width(tester, 0), closeTo(_openWidth, 0.001));
    // FocusManager applies the blur in a microtask; start its animation ticker
    // before advancing the clock to inspect an intermediate frame.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 45));
    expect(_width(tester, 0), inExclusiveRange(_closedWidth, _openWidth));
    _expectGeometry(tester);
    await tester.pumpAndSettle();
    expect(_width(tester, 0), _closedWidth);
  });

  testWidgets('pagination preserves an expansion already in progress', (
    tester,
  ) async {
    final key = await _mount(tester);
    await tester.pump(modernCardExpansionDwell);
    await tester.pump(const Duration(milliseconds: 45));
    final state = tester.state(_motion(0));
    final before = _width(tester, 0);
    key.currentState!.append();
    await tester.pump();
    expect(tester.state(_motion(0)), same(state));
    expect(_width(tester, 0), closeTo(before, 0.001));
    await tester.pumpAndSettle();
    expect(_width(tester, 0), closeTo(_openWidth, 0.001));
  });

  testWidgets('motion off skips dwell and updates scroll immediately', (
    tester,
  ) async {
    final key = await _mount(tester, duration: Duration.zero);
    expect(_width(tester, 0), closeTo(_openWidth, 0.001));
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    _expectSelection(tester, 1);
    expect(_width(tester, 1), closeTo(_openWidth, 0.001));
    expect(key.currentState!.scroll.offset, 212);
    _expectGeometry(tester);
  });
}
