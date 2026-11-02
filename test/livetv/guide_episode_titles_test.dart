import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_now_next_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';

const matchup = 'South Alabama at Kentucky';

GuideProgram program({
  String? episodeTitle,
  int? season,
  int? episode,
}) => GuideProgram(
  id: 'p1',
  channelId: 'c1',
  name: 'College Football',
  startDate: DateTime(2026, 10, 1, 12),
  endDate: DateTime(2026, 10, 1, 15),
  episodeTitle: episodeTitle,
  rawData: <String, dynamic>{
    'ParentIndexNumber': ?season,
    'IndexNumber': ?episode,
  },
);

AggregatedItem searchResult(String type, String? episodeTitle) =>
    AggregatedItem(
      id: 'p1',
      serverId: 's1',
      rawData: {
        'Type': type,
        'Name': 'College Football',
        'EpisodeTitle': episodeTitle,
        'ProductionYear': 2026,
      },
    );

ThemeData theme(bool apple) => ThemeData(
  brightness: Brightness.dark,
  platform: apple ? TargetPlatform.iOS : TargetPlatform.android,
);

Widget cell({
  required bool apple,
  required double width,
  String? episodeLine,
  bool focused = false,
}) => MaterialApp(
  theme: theme(apple),
  home: Center(
    child: SizedBox(
      width: width,
      height: 56,
      child: EpgProgramCell(
        title: 'College Football',
        episodeLine: episodeLine,
        genre: const EpgGenre('Sports', Colors.green),
        isLive: true,
        progress: 0.5,
        hasTimer: false,
        focused: focused,
        apple: apple,
      ),
    ),
  ),
);

void main() {
  test('program search subtitles prefer the episode title', () {
    for (final type in ['Program', 'LiveTvProgram']) {
      for (final title in [matchup, null, '   ']) {
        expect(
          searchResult(type, title).subtitle,
          title == matchup ? matchup : '2026',
        );
      }
    }
  });

  test('program search subtitles unescape quotes like the guide does', () {
    expect(searchResult('Program', r'\"Raygun\"').subtitle, '"Raygun"');
  });

  test('program search subtitles skip a title that repeats the name', () {
    expect(searchResult('Program', 'College Football').subtitle, '2026');
  });

  test('the episode line leaves out a title that repeats the name', () {
    expect(program(episodeTitle: 'College Football').episodeLine, isEmpty);
    expect(
      program(episodeTitle: 'College Football', season: 2, episode: 9)
          .episodeLine,
      '(S2:E9)',
    );
  });

  test('Now/Next labels join the name and the episode line with a dot', () {
    expect(
      program(episodeTitle: matchup).titleWithEpisode,
      'College Football · $matchup',
    );
    expect(
      program(episodeTitle: matchup, season: 1, episode: 5).titleWithEpisode,
      'College Football · $matchup (S1:E5)',
    );
    expect(
      program(season: 2, episode: 9).titleWithEpisode,
      'College Football · (S2:E9)',
    );
    for (final title in [null, '', '   ', 'College Football']) {
      expect(program(episodeTitle: title).titleWithEpisode, 'College Football');
    }
  });

  for (final apple in [false, true]) {
    testWidgets('search card displays the matchup apple=$apple', (
      tester,
    ) async {
      final item = searchResult('Program', matchup);
      await tester.pumpWidget(
        MaterialApp(
          theme: theme(apple),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Center(
              child: MediaCard(
                title: item.name,
                subtitle: item.subtitle,
                itemType: item.type,
                width: 260,
                aspectRatio: 16 / 9,
                onTap: () {},
              ),
            ),
          ),
        ),
      );
      expect(find.text(matchup), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a wide cell shows just the episode line apple=$apple', (
      tester,
    ) async {
      await tester.pumpWidget(
        cell(apple: apple, width: 600, episodeLine: 'Game 5 (S1:E5)'),
      );
      expect(find.text('Game 5 (S1:E5)'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a cell without an episode line shows only the title apple=$apple', (
      tester,
    ) async {
      for (final line in [null, '   ']) {
        await tester.pumpWidget(cell(apple: apple, width: 600, episodeLine: line));
        expect(find.byType(Text), findsOneWidget);
        expect(find.text('College Football'), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });

    testWidgets('a focused cell keeps its episode line and scrolls it apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(
        cell(apple: apple, width: 200, episodeLine: line, focused: true),
      );
      await tester.pump();
      final marquee = find.byWidgetPredicate(
        (w) => w is MarqueeText && w.text == line,
      );
      expect(marquee, findsOneWidget);
      final scroller = find.descendant(
        of: marquee,
        matching: find.byType(Scrollable),
      );
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 500));
      expect(
        tester.state<ScrollableState>(scroller).position.pixels,
        greaterThan(0),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('a focused cell keeps a title that fits still apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(
        cell(apple: apple, width: 600, episodeLine: line, focused: true),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 700));
      final scrollers = find.descendant(
        of: find.byType(MarqueeText),
        matching: find.byType(Scrollable),
      );
      // Only the episode line scrolls; the title is plain text.
      expect(scrollers, findsOneWidget);
      expect(
        tester.state<ScrollableState>(scrollers).position.pixels,
        greaterThan(0),
      );
      expect(find.text('College Football'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a focused cell scrolls two long lines in step apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(
        cell(apple: apple, width: 120, episodeLine: line, focused: true),
      );
      await tester.pump();
      final scrollers = find.descendant(
        of: find.byType(MarqueeText),
        matching: find.byType(Scrollable),
      );
      expect(scrollers, findsNWidgets(2));
      List<double> offsets() => [
        for (final state in tester.stateList<ScrollableState>(scrollers))
          state.position.pixels,
      ];

      await tester.pump(const Duration(milliseconds: 1600));
      for (var i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 700));
        final o = offsets();
        expect(o[0], greaterThan(0));
        expect(o[0], closeTo(o[1], 0.01));
      }
      expect(tester.takeException(), isNull);
    });

    testWidgets('a cell losing focus while both lines scroll tears down cleanly apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(
        cell(apple: apple, width: 120, episodeLine: line, focused: true),
      );
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpWidget(
        cell(apple: apple, width: 120, episodeLine: line),
      );
      await tester.pump();
      expect(find.byType(MarqueeText), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a focused cell that loses its episode line keeps scrolling the title apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(
        cell(apple: apple, width: 120, episodeLine: line, focused: true),
      );
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpWidget(cell(apple: apple, width: 120, focused: true));
      expect(tester.takeException(), isNull);
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 500));
      final scroller = find.descendant(
        of: find.byType(MarqueeText),
        matching: find.byType(Scrollable),
      );
      expect(
        tester.state<ScrollableState>(scroller).position.pixels,
        greaterThan(0),
      );
    });

    testWidgets('a long episode line keeps its place and ellipsises apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(cell(apple: apple, width: 200, episodeLine: line));
      final meta = tester.widget<Text>(find.text(line));
      expect(meta.overflow, TextOverflow.ellipsis);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a narrow cell drops the second line apple=$apple', (
      tester,
    ) async {
      await tester.pumpWidget(cell(apple: apple, width: 80, episodeLine: matchup));
      expect(find.text('College Football'), findsOneWidget);
      expect(find.textContaining(matchup), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Now/Next wraps long matchups apple=$apple', (tester) async {
      final now = program(
        episodeTitle: '$matchup, $matchup',
        season: 1,
        episode: 5,
      ).titleWithEpisode;
      const next = 'Next: College Football · Wake Forest at Louisville';
      await tester.pumpWidget(
        MaterialApp(
          theme: theme(apple),
          home: Center(
            child: SizedBox(
              width: 360,
              child: EpgNowNextCard(
                logoUrl: null,
                channelName: 'SEC Network',
                channelNumber: '121',
                nowTitle: now,
                nowProgress: 0.5,
                remainingLabel: '30 min',
                nextLabel: next,
                isLive: true,
                apple: apple,
                onTap: () {},
              ),
            ),
          ),
        ),
      );
      expect(tester.widget<Text>(find.text(now)).maxLines, 2);
      expect(tester.widget<Text>(find.text(next)).maxLines, 2);
      expect(tester.takeException(), isNull);
    });
  }
}
