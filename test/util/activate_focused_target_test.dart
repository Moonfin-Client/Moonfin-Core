import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/focus/key_event_utils.dart';

class _DisabledActivateAction extends Action<ActivateIntent> {
  @override
  bool get isActionEnabled => false;

  @override
  void invoke(ActivateIntent intent) {}
}

Widget _appWithScope({required Widget child}) {
  return MaterialApp(
    home: Builder(
      builder: (context) => Focus(
        onKeyEvent: (node, event) {
          if (event is! KeyDownEvent) return KeyEventResult.ignored;
          final key = event.logicalKey;
          if (key != LogicalKeyboardKey.enter &&
              key != LogicalKeyboardKey.select) {
            return KeyEventResult.ignored;
          }
          return activateFocusedTarget(context);
        },
        child: child,
      ),
    ),
  );
}

Future<BuildContext> _pumpFocused(WidgetTester tester, Widget child) async {
  late BuildContext scopeContext;
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (context) {
          scopeContext = context;
          return child;
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return scopeContext;
}

void main() {
  for (final key in [LogicalKeyboardKey.select, LogicalKeyboardKey.enter]) {
    testWidgets('a focused button activates once per ${key.keyLabel} press', (
      tester,
    ) async {
      var taps = 0;
      await tester.pumpWidget(
        _appWithScope(
          child: Center(
            child: ElevatedButton(
              autofocus: true,
              onPressed: () => taps++,
              child: const Text('step'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();

      expect(taps, 1);
    });
  }

  testWidgets('focus with no activate action leaves the key to others', (
    tester,
  ) async {
    final context = await _pumpFocused(
      tester,
      const Focus(autofocus: true, child: SizedBox()),
    );

    expect(activateFocusedTarget(context), KeyEventResult.ignored);
  });

  testWidgets('a disabled activate action leaves the key to others', (
    tester,
  ) async {
    final context = await _pumpFocused(
      tester,
      Actions(
        actions: {ActivateIntent: _DisabledActivateAction()},
        child: const Focus(autofocus: true, child: SizedBox()),
      ),
    );

    expect(activateFocusedTarget(context), KeyEventResult.ignored);
  });
}
