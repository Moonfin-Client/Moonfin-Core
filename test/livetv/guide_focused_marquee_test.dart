import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_channel_cell.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';

void main() {
  testWidgets('only a focused channel name uses marquee overflow', (
    tester,
  ) async {
    Widget cell(bool focused) => MaterialApp(
      home: Center(
        child: SizedBox(
          width: 160,
          height: 56,
          child: EpgChannelCell(
            logoUrl: null,
            name: 'A deliberately long channel name',
            number: '25.3',
            focused: focused,
            apple: false,
          ),
        ),
      ),
    );

    await tester.pumpWidget(cell(false));
    expect(find.byType(MarqueeText), findsNothing);

    await tester.pumpWidget(cell(true));
    await tester.pump();
    expect(find.byType(MarqueeText), findsOneWidget);
    final channelScroller = find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(Scrollable),
    );
    expect(
      tester.state<ScrollableState>(channelScroller).position.pixels,
      greaterThan(0),
    );
  });

  testWidgets('only a focused single-line programme title uses marquee', (
    tester,
  ) async {
    Widget cell(bool focused) => MaterialApp(
      home: Center(
        child: SizedBox(
          width: 100,
          height: 56,
          child: EpgProgramCell(
            title: 'A deliberately long programme title',
            genre: const EpgGenre('Drama', Colors.blue),
            isLive: false,
            progress: 0,
            hasTimer: false,
            focused: focused,
            apple: false,
          ),
        ),
      ),
    );

    await tester.pumpWidget(cell(false));
    expect(find.byType(MarqueeText), findsNothing);

    await tester.pumpWidget(cell(true));
    await tester.pump();
    expect(find.byType(MarqueeText), findsOneWidget);

    final scroller = find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(Scrollable),
    );
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      tester.state<ScrollableState>(scroller).position.pixels,
      greaterThan(0),
    );
  });
}
