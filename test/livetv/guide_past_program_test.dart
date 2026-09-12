import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';

void main() {
  testWidgets('past programmes use reduced emphasis', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EpgProgramCell(
          title: 'Ended programme',
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
}
