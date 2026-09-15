import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';

Widget _row({
  required List<String> items,
  Object Function(String item)? itemKeyBuilder,
  FocusNode? focusNode,
  ScrollController? controller,
  Duration? scrollDuration,
  Curve scrollCurve = Curves.easeOut,
  void Function(int index, String item)? onIndexChanged,
  double Function(int index)? itemExtentBuilder,
  Listenable? itemExtentListenable,
  double itemSpacing = 0,
  void Function(String item)? onItemBuild,
}) {
  return MaterialApp(
    home: Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 400,
        child: LockedFocusRow<String>(
          hubKey: 'stateful-row',
          items: items,
          itemKeyBuilder: itemKeyBuilder,
          itemExtent: 100,
          itemExtentBuilder: itemExtentBuilder,
          itemExtentListenable: itemExtentListenable,
          itemSpacing: itemSpacing,
          height: 100,
          focusNode: focusNode,
          controller: controller,
          scrollDuration: scrollDuration,
          scrollCurve: scrollCurve,
          onIndexChanged: onIndexChanged,
          itemBuilder: (context, item, index, isFocused) {
            onItemBuild?.call(item);
            return _StatefulTile(item: item, isFocused: isFocused);
          },
        ),
      ),
    ),
  );
}

Finder _tile(String item) => find.byWidgetPredicate(
  (widget) => widget is _StatefulTile && widget.item == item,
);

void main() {
  setUp(HubFocusMemory.clearAll);

  testWidgets('appending items preserves the existing card states', (
    tester,
  ) async {
    await tester.pumpWidget(_row(items: const ['a', 'b', 'c']));
    final states = {
      for (final item in ['a', 'b', 'c']) item: tester.state(_tile(item)),
    };

    await tester.pumpWidget(_row(items: const ['a', 'b', 'c', 'd']));

    for (final item in states.keys) {
      expect(tester.state(_tile(item)), same(states[item]));
    }
    expect(_tile('d'), findsOneWidget);
  });

  testWidgets('item identities preserve state and selection after reorder', (
    tester,
  ) async {
    final node = FocusNode();
    addTearDown(node.dispose);
    final changes = <(int, String)>[];
    Widget build(List<String> items) => _row(
      items: items,
      focusNode: node,
      itemKeyBuilder: (item) => item,
      onIndexChanged: (index, item) => changes.add((index, item)),
    );

    await tester.pumpWidget(build(const ['a', 'b', 'c']));
    node.requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    final states = {
      for (final item in ['a', 'b', 'c']) item: tester.state(_tile(item)),
    };
    changes.clear();

    await tester.pumpWidget(build(const ['b', 'c', 'a']));
    await tester.pumpAndSettle();

    for (final item in states.keys) {
      expect(tester.state(_tile(item)), same(states[item]));
    }
    expect(tester.widget<_StatefulTile>(_tile('b')).isFocused, isTrue);
    expect(tester.widget<_StatefulTile>(_tile('c')).isFocused, isFalse);
    expect(changes, [(0, 'b')]);
    expect(HubFocusMemory.peek('stateful-row'), 0);
  });

  testWidgets('remote scrolling follows the supplied duration and curve', (
    tester,
  ) async {
    final node = FocusNode();
    final controller = ScrollController();
    addTearDown(node.dispose);
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      _row(
        items: List.generate(12, (index) => '$index'),
        focusNode: node,
        controller: controller,
        scrollDuration: const Duration(milliseconds: 600),
        scrollCurve: Curves.linear,
      ),
    );
    node.requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(controller.offset, closeTo(50, 0.01));

    await tester.pump(const Duration(milliseconds: 300));
    expect(controller.offset, closeTo(100, 0.01));
  });

  testWidgets(
    'replacing an identity starts fresh while neighbours keep state',
    (tester) async {
      Widget build(List<String> items) =>
          _row(items: items, itemKeyBuilder: (item) => item);
      await tester.pumpWidget(build(const ['a', 'b', 'c']));
      final aState = tester.state(_tile('a'));
      final bState = tester.state(_tile('b'));
      final cState = tester.state(_tile('c'));

      await tester.pumpWidget(build(const ['a', 'replacement', 'c']));

      expect(tester.state(_tile('a')), same(aState));
      expect(tester.state(_tile('c')), same(cState));
      expect(bState.mounted, isFalse);
      expect(tester.state(_tile('replacement')), isNot(same(bState)));
    },
  );

  testWidgets('zero scroll duration moves immediately without an animation', (
    tester,
  ) async {
    final node = FocusNode();
    final controller = ScrollController();
    addTearDown(node.dispose);
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      _row(
        items: List.generate(12, (index) => '$index'),
        focusNode: node,
        controller: controller,
        scrollDuration: Duration.zero,
      ),
    );
    node.requestFocus();
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(controller.offset, 100);
    expect(tester.takeException(), isNull);
  });

  testWidgets('extent ticks update widths without rebuilding existing cards', (
    tester,
  ) async {
    final geometry = _GeometryNotifier();
    addTearDown(geometry.dispose);
    final widths = [100.0, 100.0, 100.0];
    final builds = <String, int>{};
    await tester.pumpWidget(
      _row(
        items: const ['a', 'b', 'c'],
        itemExtentBuilder: (index) => widths[index],
        itemExtentListenable: geometry,
        itemSpacing: 10,
        onItemBuild: (item) =>
            builds.update(item, (count) => count + 1, ifAbsent: () => 1),
      ),
    );
    final originalBuilds = Map<String, int>.of(builds);
    final aState = tester.state(_tile('a'));
    expect(tester.getTopLeft(_tile('b')).dx, 110);

    widths[0] = 150;
    geometry.tick();
    await tester.pump();

    expect(tester.getSize(_tile('a')).width, 150);
    expect(tester.getTopLeft(_tile('b')).dx, 160);
    expect(tester.getTopLeft(_tile('c')).dx, 270);
    expect(tester.state(_tile('a')), same(aState));
    expect(builds, originalBuilds);
  });

  testWidgets('offscreen prefix width changes correct visible card positions', (
    tester,
  ) async {
    final geometry = _GeometryNotifier();
    final controller = ScrollController();
    addTearDown(geometry.dispose);
    addTearDown(controller.dispose);
    final widths = List<double>.filled(30, 100);
    widths[0] = 300;
    final builds = <String, int>{};
    await tester.pumpWidget(
      _row(
        items: List.generate(widths.length, (index) => '$index'),
        controller: controller,
        itemExtentBuilder: (index) => widths[index],
        itemExtentListenable: geometry,
        itemSpacing: 10,
        onItemBuild: (item) =>
            builds.update(item, (count) => count + 1, ifAbsent: () => 1),
      ),
    );
    controller.jumpTo(1200);
    await tester.pumpAndSettle();
    expect(_tile('0'), findsNothing);
    expect(tester.getTopLeft(_tile('10')).dx, 100);
    final visibleBuilds = builds['10'];
    final visibleState = tester.state(_tile('10'));

    widths[0] = 200;
    geometry.tick();
    await tester.pump();

    expect(controller.offset, 1200);
    expect(tester.getTopLeft(_tile('10')).dx, 0);
    expect(tester.state(_tile('10')), same(visibleState));
    expect(builds['10'], visibleBuilds);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'extent listeners can be swapped and removed without state loss',
    (tester) async {
      final firstGeometry = _GeometryNotifier();
      final secondGeometry = _GeometryNotifier();
      addTearDown(firstGeometry.dispose);
      addTearDown(secondGeometry.dispose);
      final widths = [100.0, 100.0];
      Widget build(Listenable? geometry) => _row(
        items: const ['a', 'b'],
        itemExtentBuilder: (index) => widths[index],
        itemExtentListenable: geometry,
      );
      await tester.pumpWidget(build(firstGeometry));
      final cardState = tester.state(_tile('a'));
      expect(firstGeometry.isListenedTo, isTrue);

      await tester.pumpWidget(build(secondGeometry));
      expect(firstGeometry.isListenedTo, isFalse);
      expect(secondGeometry.isListenedTo, isTrue);
      expect(tester.state(_tile('a')), same(cardState));
      widths[0] = 150;
      firstGeometry.tick();
      await tester.pump();
      expect(tester.getSize(_tile('a')).width, 100);
      secondGeometry.tick();
      await tester.pump();
      expect(tester.getSize(_tile('a')).width, 150);

      await tester.pumpWidget(build(null));
      expect(secondGeometry.isListenedTo, isFalse);
      expect(tester.state(_tile('a')), same(cardState));
      widths[0] = 200;
      secondGeometry.tick();
      await tester.pump();
      expect(tester.getSize(_tile('a')).width, 150);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('exact extents preserve item identities through reorder', (
    tester,
  ) async {
    final widths = {'a': 100.0, 'b': 120.0, 'c': 80.0};
    Widget build(List<String> items) => _row(
      items: items,
      itemKeyBuilder: (item) => item,
      itemExtentBuilder: (index) => widths[items[index]]!,
      itemSpacing: 10,
    );
    await tester.pumpWidget(build(const ['a', 'b', 'c']));
    final states = {
      for (final item in widths.keys) item: tester.state(_tile(item)),
    };

    await tester.pumpWidget(build(const ['c', 'a', 'b']));

    for (final item in states.keys) {
      expect(tester.state(_tile(item)), same(states[item]));
      expect(tester.getSize(_tile(item)).width, widths[item]);
    }
    expect(tester.getTopLeft(_tile('a')).dx, 90);
    expect(tester.getTopLeft(_tile('b')).dx, 200);
  });
}

class _GeometryNotifier extends ChangeNotifier {
  bool get isListenedTo => hasListeners;

  void tick() => notifyListeners();
}

class _StatefulTile extends StatefulWidget {
  const _StatefulTile({required this.item, required this.isFocused});

  final String item;
  final bool isFocused;

  @override
  State<_StatefulTile> createState() => _StatefulTileState();
}

class _StatefulTileState extends State<_StatefulTile> {
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: 100, child: Text(widget.item));
}
