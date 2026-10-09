import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/dpad_list_tile.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    PlatformDetection.setTvMode(true);
  });

  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    PlatformDetection.setTvMode(false);
  });

  testWidgets('non-TV platforms retain native list controls', (tester) async {
    PlatformDetection.setTvMode(false);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DpadRadioGroup<int>(
            groupValue: 1,
            onChanged: (_) {},
            child: Column(
              children: [
                DpadListTile(title: const Text('Action'), onTap: () {}),
                DpadSwitchListTile(
                  title: const Text('Switch'),
                  value: false,
                  onChanged: (_) {},
                ),
                const DpadRadioListTile<int>(
                  autofocus: true,
                  title: Text('Radio'),
                  value: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(
      find.descendant(
        of: find.byType(DpadListTile),
        matching: find.byType(ListTile),
      ),
      findsOneWidget,
    );
    expect(find.byType(SwitchListTile), findsOneWidget);
    expect(find.byType(RadioGroup<int>), findsOneWidget);
    expect(find.byType(RadioListTile<int>), findsOneWidget);
    expect(
      tester
          .widget<RadioListTile<int>>(find.byType(RadioListTile<int>))
          .autofocus,
      isFalse,
    );
    expect(find.byType(TvFocusHighlight), findsNothing);
  });

  testWidgets('outerPadding overrides the shared tile margins on TV only', (
    tester,
  ) async {
    Future<EdgeInsets> tileOuterPadding() async {
      final ancestor = find.ancestor(
        of: find.byType(AnimatedContainer),
        matching: find.byType(Padding),
      );
      expect(ancestor, findsOneWidget);
      final widget = tester.widget<Padding>(ancestor);
      return widget.padding.resolve(TextDirection.ltr);
    }

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DpadListTile(
            outerPadding: EdgeInsets.symmetric(vertical: 4),
            title: Text('Row'),
          ),
        ),
      ),
    );

    expect(
      await tileOuterPadding(),
      const EdgeInsets.symmetric(vertical: 4),
      reason: 'an explicit outerPadding must replace the default margins',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DpadListTile(title: Text('Row'))),
      ),
    );

    expect(
      await tileOuterPadding(),
      const EdgeInsets.fromLTRB(12, 4, 12, 4),
      reason: 'without an override the shared settings margins apply',
    );

    PlatformDetection.setTvMode(false);
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DpadListTile(
            outerPadding: EdgeInsets.symmetric(vertical: 4),
            title: Text('Row'),
          ),
        ),
      ),
    );

    expect(find.byType(TvFocusHighlight), findsNothing);
  });

  testWidgets('tile subtitle palette inverts with focus on TV', (
    tester,
  ) async {
    final firstFocus = FocusNode();
    final secondFocus = FocusNode();
    addTearDown(firstFocus.dispose);
    addTearDown(secondFocus.dispose);

    Widget subtitleProbe(List<Color?> observed) => Builder(
      builder: (context) {
        observed.add(DefaultTextStyle.of(context).style.color);
        return const SizedBox.shrink();
      },
    );

    final firstColors = <Color?>[];
    final secondColors = <Color?>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DpadListTile(
                focusNode: firstFocus,
                autofocus: true,
                title: const Text('First'),
                subtitle: subtitleProbe(firstColors),
                onTap: () {},
              ),
              DpadListTile(
                focusNode: secondFocus,
                title: const Text('Second'),
                subtitle: subtitleProbe(secondColors),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(firstFocus.hasFocus, isTrue);
    expect(firstColors.last!.computeLuminance(), lessThan(0.5));
    expect(secondColors.last!.computeLuminance(), greaterThan(0.5));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();

    expect(secondFocus.hasFocus, isTrue);
    expect(
      firstColors.last!.computeLuminance(),
      greaterThan(0.5),
      reason: 'the blurred tile returns to the light palette',
    );
    expect(secondColors.last!.computeLuminance(), lessThan(0.5));
  });

  testWidgets('D-pad select activates a focused list tile once', (
    tester,
  ) async {
    final firstFocus = FocusNode();
    final secondFocus = FocusNode();
    addTearDown(firstFocus.dispose);
    addTearDown(secondFocus.dispose);
    var activations = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DpadListTile(
                focusNode: firstFocus,
                autofocus: true,
                title: const Text('First'),
                onTap: () => activations++,
              ),
              DpadListTile(
                focusNode: secondFocus,
                title: const Text('Second'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(firstFocus.hasFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    expect(activations, 1);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(secondFocus.hasFocus, isTrue);
  });

  testWidgets('focused D-pad rows scroll into view', (tester) async {
    final controller = ScrollController();
    final focusNodes = List.generate(8, (_) => FocusNode());
    addTearDown(controller.dispose);
    for (final node in focusNodes) {
      addTearDown(node.dispose);
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 160,
            child: ListView(
              controller: controller,
              children: [
                for (var i = 0; i < focusNodes.length; i++)
                  DpadListTile(
                    focusNode: focusNodes[i],
                    autofocus: i == 0,
                    title: Text('Quality $i'),
                    subtitle: const Text('Estimated download size'),
                    onTap: () {},
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(focusNodes.first.hasFocus, isTrue);
    expect(controller.offset, 0);

    for (var i = 1; i < focusNodes.length; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
    }

    expect(focusNodes.last.hasFocus, isTrue);
    expect(controller.offset, greaterThan(0));
  });

  testWidgets('settings icons use the shared shell on every platform', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DpadListTile(
                useSettingsIconShell: true,
                leading: Icon(Icons.download),
                title: Text('Download'),
              ),
              DpadSwitchListTile(
                useSettingsIconShell: true,
                secondary: Icon(Icons.wifi),
                title: Text('Wi-Fi only'),
                value: true,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Container && widget.constraints?.maxWidth == 44,
      ),
      findsNWidgets(2),
    );

    PlatformDetection.setTvMode(false);
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DpadListTile(
                useSettingsIconShell: true,
                leading: Icon(Icons.download),
                title: Text('Download'),
              ),
              DpadSwitchListTile(
                useSettingsIconShell: true,
                secondary: Icon(Icons.wifi),
                title: Text('Wi-Fi only'),
                value: true,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Container && widget.constraints?.maxWidth == 44,
      ),
      findsNWidgets(2),
    );
  });

  testWidgets('D-pad select toggles a focused switch tile once', (
    tester,
  ) async {
    var value = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => DpadSwitchListTile(
              autofocus: true,
              title: const Text('Wi-Fi only'),
              value: value,
              onChanged: (next) => setState(() => value = next),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump();
    expect(value, isTrue);
  });

  testWidgets('radio tiles can be traversed and selected with a D-pad', (
    tester,
  ) async {
    var selected = 1;
    final firstFocus = FocusNode();
    final secondFocus = FocusNode();
    addTearDown(firstFocus.dispose);
    addTearDown(secondFocus.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => DpadRadioGroup<int>(
              groupValue: selected,
              onChanged: (value) {
                if (value != null) setState(() => selected = value);
              },
              child: Column(
                children: [
                  DpadRadioListTile<int>(
                    focusNode: firstFocus,
                    autofocus: true,
                    title: const Text('One'),
                    value: 1,
                  ),
                  DpadRadioListTile<int>(
                    focusNode: secondFocus,
                    title: const Text('Two'),
                    value: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(RadioGroup<int>), findsNothing);
    expect(find.byType(RadioListTile<int>), findsNothing);
    expect(firstFocus.hasFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(selected, 1);
    expect(secondFocus.hasFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump();
    expect(selected, 2);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    expect(selected, 2);
    expect(firstFocus.hasFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump();
    expect(selected, 1);
  });
}
