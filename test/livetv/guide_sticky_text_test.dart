import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';

void main() {
  testWidgets('left-clipped cell receives a bounded title inset', (
    tester,
  ) async {
    final controller = ScrollController(initialScrollOffset: 80);
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 240,
          child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 480,
              child: EpgProgramCell(
                title: 'A readable title',
                genre: EpgGenre('Drama', Colors.blue),
                isLive: false,
                progress: 0,
                hasTimer: false,
                focused: false,
                apple: false,
                textLeftPadding: 80,
              ),
            ),
          ),
        ),
      ),
    );

    expect(
      tester
          .widget<EpgProgramCell>(find.byType(EpgProgramCell))
          .textLeftPadding,
      80,
    );
  });
}
