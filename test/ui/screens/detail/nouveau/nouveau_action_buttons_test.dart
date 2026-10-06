import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DesktopUiScale;
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/nouveau/hero/nouveau_action_buttons.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('primary action responds to tap and select keys', (tester) async {
    var activations = 0;
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(
            label: 'Play',
            icon: Icons.play_arrow,
            focusNode: focusNode,
            onPressed: () => activations++,
          ),
          secondaryActions: const [],
        ),
      ),
    );

    await tester.tap(find.text('Play'));
    expect(activations, 1);
    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.select,
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.space,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(activations, 4);
  });

  testWidgets('secondary action responds to select, enter and space', (
    tester,
  ) async {
    var activations = 0;
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: null,
          secondaryActions: [
            NouveauAction(
              label: 'Favorite',
              icon: Icons.favorite,
              focusNode: focusNode,
              onPressed: () => activations++,
            ),
          ],
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.select,
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.space,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(activations, 3);
  });

  testWidgets('directional callbacks and optional callbacks are safe', (
    tester,
  ) async {
    final calls = <String>[];
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(
            label: 'Action',
            focusNode: focusNode,
            onPressed: () {},
            onArrowUp: () => calls.add('up'),
            onArrowDown: () => calls.add('down'),
            onArrowLeft: () => calls.add('left'),
            onArrowRight: () => calls.add('right'),
          ),
          secondaryActions: const [],
        ),
      ),
    );
    focusNode.requestFocus();
    await tester.pump();
    for (final key in [
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowRight,
    ]) {
      await tester.sendKeyEvent(key);
    }
    expect(calls, ['up', 'down', 'left', 'right']);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(
            label: 'No optional callbacks',
            onPressed: () {},
          ),
          secondaryActions: const [],
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('overflow opens a dialog and selecting an action invokes it', (
    tester,
  ) async {
    var selected = 0;
    final actions = [
      for (var i = 0; i < 4; i++)
        NouveauAction(
          label: 'Action $i',
          icon: Icons.star,
          onPressed: i == 3 ? () => selected++ : () {},
        ),
    ];

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: null,
          secondaryActions: actions,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.more_horiz_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Action 3'), findsOneWidget);
    await tester.tap(find.text('Action 3'));
    await tester.pumpAndSettle();
    expect(selected, 1);
    expect(find.byType(Dialog), findsNothing);
  });

  testWidgets('secondary tooltip appears on focus and disappears on loss', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: null,
          secondaryActions: [
            NouveauAction(
              label: 'Favorite',
              icon: Icons.favorite,
              focusNode: focusNode,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Favorite'), findsWidgets);
    focusNode.unfocus();
    await tester.pump();
    expect(find.text('Favorite'), findsNothing);
  });

  // Past three secondaries the row collapses into a More button, and the
  // action carrying the right-edge hand-off is always one of the ones it
  // hides. The More button has to carry those directions or they are lost.
  testWidgets('the More button carries the hidden actions directions', (
    tester,
  ) async {
    final calls = <String>[];

    NouveauAction secondary(String label, {bool last = false}) => NouveauAction(
      label: label,
      icon: Icons.star,
      onPressed: () {},
      onArrowUp: () => calls.add('up'),
      onArrowDown: () => calls.add('down'),
      onArrowRight: last ? () => calls.add('rightAtEnd') : null,
    );

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(label: 'Play', onPressed: () {}),
          secondaryActions: [
            secondary('One'),
            secondary('Two'),
            secondary('Three'),
            secondary('Four', last: true),
          ],
        ),
      ),
    );

    // The More button owns focus once overflow kicks in, so drive it directly.
    final moreFocus = tester
        .widgetList<Focus>(find.byType(Focus))
        .firstWhere((f) => f.focusNode?.debugLabel == 'nouveau-actions-overflow')
        .focusNode!;

    moreFocus.requestFocus();
    await tester.pump();

    for (final key in [
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowRight,
    ]) {
      await tester.sendKeyEvent(key);
    }

    expect(calls, ['up', 'down', 'rightAtEnd']);
  });

  testWidgets('a long primary label scrolls once the button is focused', (
    tester,
  ) async {
    final node = FocusNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(
            label: 'Resume from 21m',
            icon: Icons.play_arrow,
            focusNode: node,
            trailingLabel: '21m remaining',
            onPressed: () {},
          ),
          secondaryActions: const [],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MarqueeText), findsNothing);

    node.requestFocus();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final marquee = find.byType(MarqueeText);
    expect(marquee, findsOneWidget);
    // MarqueeText only builds its scroller when the text overflows, which is
    // what makes the whole label readable.
    expect(
      find.descendant(
        of: marquee,
        matching: find.byType(SingleChildScrollView),
      ),
      findsOneWidget,
    );
  });

  testWidgets('a short primary label never scrolls', (tester) async {
    final node = FocusNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _TestApp(
        child: NouveauActionButtons(
          primaryAction: NouveauAction(
            label: 'Play',
            icon: Icons.play_arrow,
            focusNode: node,
            onPressed: () {},
          ),
          secondaryActions: const [],
        ),
      ),
    );
    await tester.pumpAndSettle();

    node.requestFocus();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(
      find.descendant(
        of: find.byType(MarqueeText),
        matching: find.byType(SingleChildScrollView),
      ),
      findsNothing,
    );
  });

  group('UI scale', () {
    late UserPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    });

    tearDown(() async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
      await GetIt.instance.reset();
    });

    testWidgets('the buttons grow with it but the text leaves it to the '
        'text scaler', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      Future<void> pumpRow() => tester.pumpWidget(
        _TestApp(
          child: NouveauActionButtons(
            primaryAction: NouveauAction(
              label: 'Play',
              icon: Icons.play_arrow,
              onPressed: () {},
            ),
            secondaryActions: [
              NouveauAction(
                label: 'Favorite',
                icon: Icons.favorite,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
      final circle = find.byWidgetPredicate(
        (widget) =>
            widget.runtimeType.toString() == '_NouveauCircleActionButton',
      );
      double playFontSize() =>
          tester.widget<Text>(find.text('Play')).style!.fontSize!;

      await pumpRow();
      expect(tester.getSize(circle), const Size(64, 64));
      expect(playFontSize(), 16.5);

      await prefs.set(
        UserPreferences.desktopUiScale,
        DesktopUiScale.extraLarge,
      );
      await pumpRow();
      expect(tester.getSize(circle).width, closeTo(64 * 1.3, 0.001));
      expect(playFontSize(), 16.5);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: Scaffold(body: Center(child: child)),
    );
  }
}
