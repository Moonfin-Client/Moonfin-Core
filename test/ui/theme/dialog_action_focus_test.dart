import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/adaptive/adaptive_dialog.dart';
import 'package:moonfin_design/moonfin_design.dart';

double contrast(Color a, Color b) {
  final first = a.computeLuminance();
  final second = b.computeLuminance();
  return ((first > second ? first : second) + 0.05) /
      ((first < second ? first : second) + 0.05);
}

void main() {
  tearDown(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  for (final themeId in ThemeRegistry.builtInIds) {
    testWidgets('dialog focus remains distinct and readable in $themeId', (
      tester,
    ) async {
      ThemeRegistry.setActiveById(themeId);
      final first = FocusNode();
      final second = FocusNode();
      addTearDown(first.dispose);
      addTearDown(second.dispose);
      final theme = AppTheme.buildTheme(ThemeRegistry.active);
      expect(theme.dialogTheme.backgroundColor!.a, closeTo(0.65, 0.01));
      expect(theme.dialogTheme.surfaceTintColor, Colors.transparent);
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: AlertDialog(
              title: const Text('Recording'),
              actions: [
                adaptiveDialogAction(
                  focusNode: first,
                  onPressed: () {},
                  child: const Text('Record Series'),
                ),
                adaptiveDialogAction(
                  focusNode: second,
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ),
      );

      Material buttonMaterial(String label) => tester.widget<Material>(
        find
            .ancestor(of: find.text(label), matching: find.byType(Material))
            .first,
      );

      first.requestFocus();
      await tester.pumpAndSettle();
      final fill = buttonMaterial('Record Series').color!;
      final label = tester.widget<RichText>(
        find.descendant(
          of: find.text('Record Series'),
          matching: find.byType(RichText),
        ),
      );
      final surface = Color.alphaBlend(AppColorScheme.surface, Colors.black);
      final visibleFill = Color.alphaBlend(fill, surface);
      expect(fill.a, closeTo(0.18, 0.01));
      expect(contrast(visibleFill, surface), greaterThan(1));
      final shape = buttonMaterial('Record Series').shape! as OutlinedBorder;
      expect(shape.side.width, 1);
      expect(contrast(shape.side.color, surface), greaterThanOrEqualTo(3));
      expect(
        contrast(visibleFill, label.text.style!.color!),
        greaterThanOrEqualTo(3),
      );

      second.requestFocus();
      await tester.pumpAndSettle();
      expect(buttonMaterial('Cancel').color, fill);
      expect(buttonMaterial('Record Series').color, isNot(fill));
    });
  }
}
