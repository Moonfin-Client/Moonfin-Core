import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/settings/settings_panel.dart';

void main() {
  late FocusNode backNode;

  setUp(() => backNode = FocusNode(debugLabel: 'PushedBack'));
  tearDown(() => backNode.dispose());

  Future<void> push(WidgetTester tester, {bool? autofocus}) async {
    final screen = Scaffold(
      body: Column(
        children: [
          IconButton(
            focusNode: backNode,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ],
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            autofocus: true,
            onPressed: () => autofocus == null
                ? context.pushSettingsScreen(screen)
                : context.pushSettingsScreen(screen, autofocus: autofocus),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('a pushed screen focuses its first control by default', (
    tester,
  ) async {
    await push(tester);

    expect(backNode.hasPrimaryFocus, isTrue);
  });

  testWidgets('a pushed screen can opt out of focusing its first control', (
    tester,
  ) async {
    await push(tester, autofocus: false);

    // Off TV the first control is usually the back arrow, and a focused
    // back arrow looks stuck under a mouse.
    expect(backNode.hasFocus, isFalse);
  });
}
