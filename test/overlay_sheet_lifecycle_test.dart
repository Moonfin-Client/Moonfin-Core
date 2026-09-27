import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';

void main() {
  Future<BuildContext> host(WidgetTester tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (value) {
            context = value;
            return const Scaffold();
          },
        ),
      ),
    );
    return context;
  }

  testWidgets('repeated close settles once and preserves the first result', (
    tester,
  ) async {
    final context = await host(tester);
    late BuildContext sheetContext;
    var completions = 0;
    final result =
        OverlaySheetController.show<String>(
          context,
          builder: (value) {
            sheetContext = value;
            return const Material(child: Text('Sheet'));
          },
        ).then((value) {
          completions++;
          return value;
        });
    await tester.pumpAndSettle();
    final first = OverlaySheetController.closeAdaptive(
      sheetContext,
      result: 'done',
    );
    final again = OverlaySheetController.closeAdaptive(
      sheetContext,
      result: 'ignored',
    );
    final all = OverlaySheetController.closeAllSheets();
    await tester.pumpAndSettle();
    await Future.wait([first, again, all]);
    expect(await result, 'done');
    expect(completions, 1);
    expect(OverlaySheetController.hasOpenSheet, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'disposal during close settles both navigation and sheet result',
    (tester) async {
      final context = await host(tester);
      final result = OverlaySheetController.show<void>(
        context,
        builder: (_) => const Material(child: Text('Sheet')),
      );
      await tester.pumpAndSettle();
      var completed = false;
      final closed = OverlaySheetController.closeAllSheets().then(
        (_) => completed = true,
      );
      await tester.pump(const Duration(milliseconds: 20));
      await tester.pumpWidget(const SizedBox());
      await tester.pump();
      expect(completed, isTrue);
      await closed;
      await result;
      expect(OverlaySheetController.hasOpenSheet, isFalse);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('disposal without an explicit close settles the sheet result', (
    tester,
  ) async {
    final context = await host(tester);
    var completed = false;
    OverlaySheetController.show<void>(
      context,
      builder: (_) => const Material(child: Text('Sheet')),
    ).then((_) => completed = true);
    await tester.pumpAndSettle();
    await tester.pumpWidget(const SizedBox());
    await tester.pump();
    expect(completed, isTrue);
    expect(OverlaySheetController.hasOpenSheet, isFalse);
  });
}
