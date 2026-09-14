import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_channel_cell.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_hero_preview.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';

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

  testWidgets('only a focused single-line program title uses marquee', (
    tester,
  ) async {
    Widget cell(bool focused) => MaterialApp(
      home: Center(
        child: SizedBox(
          width: 100,
          height: 56,
          child: EpgProgramCell(
            title: 'A deliberately long program title',
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

    final title = tester.widget<Text>(
      find.text('A deliberately long program title'),
    );
    expect(title.style?.fontSize, 14);

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

  testWidgets('hero keeps three description lines and scrolls overflow', (
    tester,
  ) async {
    const synopsis =
        'This is a deliberately long program description that '
        'needs more than three full lines on a television screen so the viewer '
        'can read the remaining details.';

    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: SizedBox(
            width: 420,
            child: EpgHeroPreview(
              title: 'FOX',
              programTitle: 'Evening Series',
              timeLabel: '2:00 PM - 3:00 PM',
              genreLabel: 'Series',
              synopsis: synopsis,
              isLive: true,
              apple: false,
              compact: true,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final marquee = find.byType(MarqueeText);
    expect(marquee, findsOneWidget);
    expect(tester.getSize(marquee).height, greaterThan(45));
    expect(
      find.descendant(of: marquee, matching: find.byType(Scrollable)),
      findsOneWidget,
    );

    final channel = tester.getRect(find.text('FOX'));
    final meta = tester.getRect(
      find.text('Live  ·  2:00 PM - 3:00 PM  ·  Series'),
    );
    expect(meta.top, closeTo(channel.top, 3));

    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pump(const Duration(milliseconds: 500));
    final scroller = find.descendant(
      of: marquee,
      matching: find.byType(Scrollable),
    );
    expect(
      tester.state<ScrollableState>(scroller).position.pixels,
      greaterThan(0),
    );
  });

  testWidgets('guide channel logo uses the zero-fade bounded image', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: SizedBox(
            width: 180,
            height: 56,
            child: EpgChannelCell(
              logoUrl: 'https://example.invalid/fox.png',
              name: 'FOX',
              number: '25',
              focused: false,
              apple: false,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(BoundedNetworkImage), findsOneWidget);
    expect(
      tester
          .widget<BoundedNetworkImage>(find.byType(BoundedNetworkImage))
          .fadeInDuration,
      Duration.zero,
    );
  });
}
