import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
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
  String? rating = 'TV-14',
  List<String> tags = const ['Series', 'Sports'],
}) => MaterialApp(
  theme: theme(apple),
  home: Center(
    child: SizedBox(
      width: width,
      height: 56,
      child: EpgProgramCell(
        title: 'College Football',
        episodeLine: episodeLine,
        rating: rating,
        tags: tags,
        genre: const EpgGenre('Sports', Colors.green),
        isLive: true,
        progress: 0.5,
        hasTimer: false,
        focused: false,
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

    testWidgets('a wide cell shows the episode line, rating and tags apple=$apple', (
      tester,
    ) async {
      await tester.pumpWidget(
        cell(apple: apple, width: 600, episodeLine: 'Game 5 (S1:E5)'),
      );
      expect(find.text('Game 5 (S1:E5) · TV-14 · Series · Sports'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a cell without an episode line keeps rating and tags apple=$apple', (
      tester,
    ) async {
      for (final line in [null, '   ']) {
        await tester.pumpWidget(cell(apple: apple, width: 600, episodeLine: line));
        expect(find.text('TV-14 · Series · Sports'), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });

    testWidgets('a long episode line keeps its place and ellipsises apple=$apple', (
      tester,
    ) async {
      const line = '$matchup, $matchup, $matchup';
      await tester.pumpWidget(cell(apple: apple, width: 200, episodeLine: line));
      final meta = tester.widget<Text>(find.text(line));
      expect(meta.overflow, TextOverflow.ellipsis);
      expect(find.textContaining('TV-14'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a narrow cell drops the second line apple=$apple', (
      tester,
    ) async {
      await tester.pumpWidget(cell(apple: apple, width: 80, episodeLine: matchup));
      expect(find.text('College Football'), findsOneWidget);
      expect(find.textContaining(matchup), findsNothing);
      expect(find.textContaining('TV-14'), findsNothing);
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
