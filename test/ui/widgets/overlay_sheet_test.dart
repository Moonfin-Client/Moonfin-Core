import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';

void main() {
  testWidgets('a dialog keeps Record from the player', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => showFocusRestoringDialog<void>(
              context: context,
              builder: (_) => AlertDialog(
                actions: [
                  TextButton(
                    autofocus: true,
                    onPressed: () {},
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(await tester.sendKeyEvent(LogicalKeyboardKey.mediaRecord), isTrue);
    await tester.pumpAndSettle();
    expect(find.text('Close'), findsOneWidget);
  });
}
