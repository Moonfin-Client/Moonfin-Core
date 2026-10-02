import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/epg_genre.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_layout_profile.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_now_next_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_program_cell.dart';

const matchup = 'South Alabama at Kentucky';

GuideProgram program(String? episodeTitle) => GuideProgram(
  id: 'p1',
  channelId: 'c1',
  name: 'College Football',
  startDate: DateTime(2026, 10, 1, 12),
  endDate: DateTime(2026, 10, 1, 15),
  episodeTitle: episodeTitle,
  rawData: const {},
);

void main() {
  test('program search subtitles prefer matchups and preserve fallback', () {
    for (final type in ['Program', 'LiveTvProgram']) {
      for (final title in [matchup, null, '   ']) {
        final item = AggregatedItem(
          id: 'p1',
          serverId: 's1',
          rawData: {
            'Type': type,
            'EpisodeTitle': title,
            'ProductionYear': 2026,
          },
        );
        expect(item.subtitle, title == matchup ? matchup : '2026');
      }
    }
  });

  test('Now/Next labels carry matchups without empty separators', () {
    expect(program(matchup).titleWithEpisode, 'College Football — $matchup');
    for (final title in [null, '', '   ']) {
      expect(program(title).titleWithEpisode, 'College Football');
    }
  });

  for (final apple in [false, true]) {
    testWidgets('search card displays matchup apple=$apple', (tester) async {
      final item = AggregatedItem(
        id: 'p1',
        serverId: 's1',
        rawData: const {
          'Type': 'Program',
          'Name': 'College Football',
          'EpisodeTitle': matchup,
        },
      );
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamilyFallback: const [
              'NotoSans',
              'Apple Color Emoji',
              'Segoe UI Emoji',
              'Noto Color Emoji',
            ],
            platform: apple ? TargetPlatform.iOS : TargetPlatform.android,
          ),
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
    for (final focused in [false, true]) {
      for (final title in [
        matchup,
        'Indiana Fever at Las Vegas Aces',
        null,
        '   ',
        '$matchup — $matchup — $matchup',
      ]) {
        testWidgets(
          'guide subtitle fits apple=$apple focused=$focused title=$title',
          (tester) async {
            await tester.pumpWidget(
              MaterialApp(
                theme: ThemeData(
                  brightness: Brightness.dark,
                  fontFamilyFallback: const [
                    'NotoSans',
                    'Apple Color Emoji',
                    'Segoe UI Emoji',
                    'Noto Color Emoji',
                  ],
                  platform: apple ? TargetPlatform.iOS : TargetPlatform.android,
                ),
                home: Center(
                  child: SizedBox(
                    width: title == 'Indiana Fever at Las Vegas Aces'
                        ? 80
                        : title == null || title.trim().isEmpty
                        ? 360
                        : 200,
                    height:
                        GuideLayoutProfile.fromAvailableArea(
                          availableWidth: 1100,
                          availableHeight: 320,
                        ).rowHeight -
                        4,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: ThemeRegistry.active.borders.cardBorder,
                        ),
                      ),
                      child: EpgProgramCell(
                        title: 'College Football',
                        episodeTitle: title,
                        genre: const EpgGenre('Sports', Colors.green),
                        tags: const ['Series', 'Sports'],
                        isLive: true,
                        progress: 0.5,
                        hasTimer: false,
                        focused: focused,
                        apple: apple,
                      ),
                    ),
                  ),
                ),
              ),
            );
            final expected = title == null || title.trim().isEmpty
                ? 'Series · Sports'
                : title;
            expect(find.text(expected), findsOneWidget);
            expect(tester.takeException(), isNull);
            if (expected != 'Series · Sports') {
              expect(find.text('Series · Sports'), findsNothing);
              expect(
                tester.widget<Text>(find.text(expected)).overflow,
                TextOverflow.ellipsis,
              );
            }
          },
        );
      }
    }
    testWidgets('Now/Next wraps long matchups apple=$apple', (tester) async {
      final now = program('$matchup — $matchup').titleWithEpisode;
      const next = 'Next: College Football — Wake Forest at Louisville';
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamilyFallback: const [
              'NotoSans',
              'Apple Color Emoji',
              'Segoe UI Emoji',
              'Noto Color Emoji',
            ],
            platform: apple ? TargetPlatform.iOS : TargetPlatform.android,
          ),
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
