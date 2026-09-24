import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  testWidgets('past programs use reduced emphasis', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EpgProgramCell(
          title: 'Ended program',
          genre: EpgGenre('Drama', Colors.blue),
          isLive: false,
          isPast: true,
          progress: 0,
          hasTimer: false,
          focused: false,
          apple: false,
        ),
      ),
    );

    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.55);
  });

  Future<({double arrow, double dot})> markSizes(
    WidgetTester tester,
    double textScale,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: const SizedBox(
          width: 400,
          child: EpgProgramCell(
            title: 'Carried over from before the window',
            genre: EpgGenre('Drama', Colors.blue),
            isLive: true,
            isPast: false,
            progress: 0.4,
            hasTimer: true,
            focused: false,
            apple: false,
            startsBeforeWindow: true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    double sizeOf(IconData icon) =>
        tester.widget<Icon>(find.byIcon(icon)).size!;

    return (
      arrow: sizeOf(Icons.keyboard_double_arrow_left_rounded),
      dot: sizeOf(Icons.fiber_manual_record),
    );
  }

  // A size pinned back to a constant passes every other test in here and only
  // shows up on a television, so the derivation is checked on its own.
  testWidgets('the marks on the title line are sized from it', (tester) async {
    final regular = await markSizes(tester, 1.0);
    final scaled = await markSizes(tester, 1.3);

    expect(
      regular.arrow,
      regular.dot,
      reason: 'one rule, and both marks sit on the same line',
    );
    expect(scaled.arrow, closeTo(regular.arrow * 1.3, 0.01));
    expect(scaled.dot, closeTo(regular.dot * 1.3, 0.01));
    expect(
      regular.arrow,
      inInclusiveRange(
        AppTypography.fontSizeLg * 0.6,
        AppTypography.fontSizeLg,
      ),
      reason: 'a mark reads with the title rather than over or under it',
    );
  });
}
