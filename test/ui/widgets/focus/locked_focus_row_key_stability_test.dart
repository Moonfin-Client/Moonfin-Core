import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';

/// Counts how often it is created, so a test can tell a kept element from a
/// fresh one.
class _Probe extends StatefulWidget {
  const _Probe({super.key, required this.label, required this.focused});
  final String label;
  final bool focused;

  @override
  State<_Probe> createState() => _ProbeState();
}

class _ProbeState extends State<_Probe> {
  static int inits = 0;

  @override
  void initState() {
    super.initState();
    inits++;
  }

  @override
  Widget build(BuildContext context) =>
      Text('${widget.label}${widget.focused ? '*' : ''}');
}

void main() {
  late FocusNode node;
  late List<int> builds;

  setUp(() {
    node = FocusNode();
    builds = <int>[];
    _ProbeState.inits = 0;
    HubFocusMemory.set('stability', 0);
  });

  tearDown(() => node.dispose());

  /// Fifteen 40 pixel cards fit a 1200 pixel row with room to spare, so
  /// every card is laid out and has an element to compare.
  void widen(WidgetTester tester) {
    tester.view.physicalSize = const Size(1200, 400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  Widget row(List<String> items, {LockedFocusItemKey<String>? itemKey}) =>
      MaterialApp(
        home: LockedFocusRow<String>(
          items: items,
          hubKey: 'stability',
          itemExtent: 40,
          itemSpacing: 0,
          height: 40,
          focusNode: node,
          itemKey: itemKey,
          itemBuilder: (context, item, index, isFocused) {
            builds.add(index);
            return SizedBox(
              width: 40,
              child: _Probe(
                key: ValueKey('probe-$item'),
                label: item,
                focused: isFocused,
              ),
            );
          },
        ),
      );

  List<String> names(int from, int to) => [
    for (var i = from; i < to; i++) 'i$i',
  ];

  testWidgets('appending a page keeps the existing elements', (tester) async {
    widen(tester);
    await tester.pumpWidget(row(names(0, 10)));
    final before = [
      for (var i = 0; i < 10; i++)
        tester.state<_ProbeState>(find.byKey(ValueKey('probe-i$i'))),
    ];
    expect(_ProbeState.inits, 10);

    await tester.pumpWidget(row(names(0, 15)));
    for (var i = 0; i < 10; i++) {
      expect(
        identical(
          tester.state<_ProbeState>(find.byKey(ValueKey('probe-i$i'))),
          before[i],
        ),
        isTrue,
        reason: 'card $i was re-inflated',
      );
    }
    expect(find.byType(_Probe), findsNWidgets(15));
    expect(_ProbeState.inits, 15, reason: 'only the new page inflates');
  });

  testWidgets('with an identity a prepend keeps the old elements', (
    tester,
  ) async {
    widen(tester);
    Object identity(String item, int index) => item;
    await tester.pumpWidget(row(names(5, 12), itemKey: identity));
    final kept = tester.state<_ProbeState>(
      find.byKey(const ValueKey('probe-i5')),
    );
    final inits = _ProbeState.inits;

    await tester.pumpWidget(row(names(0, 12), itemKey: identity));
    expect(
      identical(
        tester.state<_ProbeState>(find.byKey(const ValueKey('probe-i5'))),
        kept,
      ),
      isTrue,
    );
    expect(_ProbeState.inits, inits + 5);
  });

  testWidgets('duplicate identities do not throw', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LockedFocusRow<String>(
          items: const ['same', 'same', 'other'],
          hubKey: 'dupes',
          itemExtent: 40,
          height: 40,
          itemKey: (item, _) => item,
          itemBuilder: (context, item, index, isFocused) => Text('$item$index'),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('same0'), findsOneWidget);
    expect(find.text('same1'), findsOneWidget);
  });

  testWidgets('a D-pad step rebuilds only the two cards that changed', (
    tester,
  ) async {
    widen(tester);
    await tester.pumpWidget(row(names(0, 10)));
    node.requestFocus();
    await tester.pump();
    builds.clear();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(builds.toSet(), {0, 1});
    expect(find.text('i1*'), findsOneWidget);
    expect(find.text('i0*'), findsNothing);
  });

  testWidgets('focus memory and index reporting still work', (tester) async {
    final reported = <int>[];
    await tester.pumpWidget(
      MaterialApp(
        home: LockedFocusRow<String>(
          items: names(0, 5),
          hubKey: 'memory',
          itemExtent: 40,
          height: 40,
          focusNode: node,
          onIndexChanged: (index, item) => reported.add(index),
          itemBuilder: (context, item, index, isFocused) =>
              Text('$item${isFocused ? '*' : ''}'),
        ),
      ),
    );
    node.requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(reported, [0, 1, 2]);
    expect(HubFocusMemory.getForHub('memory', 5), 2);
    expect(find.text('i2*'), findsOneWidget);
  });
}
