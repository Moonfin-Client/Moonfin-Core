import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/rating_icon_provider.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
import 'package:moonfin/ui/widgets/simple_info_row.dart';

Widget _host(Widget child) => MaterialApp(
  home: Scaffold(
    body: Align(alignment: Alignment.topLeft, child: child),
  ),
);

AggregatedItem _item(Map<String, dynamic> raw) =>
    AggregatedItem(id: 'i', serverId: 's', rawData: raw);

void main() {
  group('classic home info row', () {
    testWidgets('an episode leads with its number and name', (tester) async {
      await tester.pumpWidget(
        _host(
          SimpleInfoRow(
            item: _item({
              'Type': 'Episode',
              'Name': 'Low Tide',
              'ParentIndexNumber': 2,
              'IndexNumber': 5,
              'ProductionYear': 2023,
              'OfficialRating': 'TV-14',
              'RunTimeTicks': 52 * 60 * 10000000,
              'Genres': ['Drama', 'Mystery', 'Crime', 'Thriller'],
            }),
          ),
        ),
      );

      final order = ['S2:E5 - Low Tide', '2023', 'TV-14', '52m', 'Drama, Mystery, Crime'];
      final xs = [for (final t in order) tester.getTopLeft(find.text(t)).dx];
      expect(xs, orderedEquals([...xs]..sort()));
      expect(find.text('S2:E5'), findsNothing);
    });

    testWidgets('a series shows no runtime', (tester) async {
      await tester.pumpWidget(
        _host(
          SimpleInfoRow(
            item: _item({
              'Type': 'Series',
              'Name': 'Harbor Lights',
              'ProductionYear': 2023,
              'RunTimeTicks': 45 * 60 * 10000000,
            }),
          ),
        ),
      );

      expect(find.text('2023'), findsOneWidget);
      expect(find.text('45m'), findsNothing);
    });

    testWidgets('a zero runtime is left out', (tester) async {
      await tester.pumpWidget(
        _host(
          SimpleInfoRow(
            item: _item({
              'Type': 'Book',
              'ProductionYear': 2013,
              'RunTimeTicks': 0,
            }),
          ),
        ),
      );

      expect(find.text('2013'), findsOneWidget);
      expect(find.text('0m'), findsNothing);
    });

    testWidgets('a long line is cut off rather than wrapped', (tester) async {
      await tester.pumpWidget(
        _host(
          SizedBox(
            width: 200,
            child: SimpleInfoRow(
              item: _item({
                'Type': 'Movie',
                'ProductionYear': 2024,
                'Genres': ['Science Fiction', 'Drama', 'Adventure'],
              }),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(
        tester.getTopLeft(find.text('2024')).dy,
        tester.getTopLeft(find.text('Science Fiction, Drama, Adventure')).dy,
      );
    });
  });

  group('ratings row', () {
    final label = RatingIconProvider.sourceDisplayName('stars');

    Future<void> pumpRow(WidgetTester tester, {required bool inline}) =>
        tester.pumpWidget(
          _host(
            RatingsRow(
              ratings: const {},
              communityRating: 7.8,
              enabledRatings: 'stars',
              inlineChips: inline,
            ),
          ),
        );

    testWidgets('home chips put the label beside the value', (tester) async {
      await pumpRow(tester, inline: true);
      expect(
        tester.getCenter(find.text(label)).dy,
        moreOrLessEquals(tester.getCenter(find.text('7.8')).dy, epsilon: 1),
      );
      expect(
        tester.getTopLeft(find.text(label)).dx,
        greaterThan(tester.getTopRight(find.text('7.8')).dx),
      );
    });

    testWidgets('everywhere else keeps the label under the value', (
      tester,
    ) async {
      await pumpRow(tester, inline: false);
      expect(
        tester.getTopLeft(find.text(label)).dy,
        greaterThan(tester.getBottomLeft(find.text('7.8')).dy - 1),
      );
    });
  });

  group('card label', () {
    Future<TextStyle?> titleStyle(
      WidgetTester tester, {
      required bool classic,
    }) async {
      await tester.pumpWidget(
        _host(
          SizedBox(
            width: 150,
            child: MediaCard(
              title: 'The Long Orbit',
              subtitle: '2024',
              width: 150,
              classicHomeLabel: classic,
            ),
          ),
        ),
      );
      return tester.widget<Text>(find.text('The Long Orbit')).style;
    }

    testWidgets('classic home cards use the canvas sizes', (tester) async {
      final style = await titleStyle(tester, classic: true);
      expect(style?.fontSize, moreOrLessEquals(22 / (1920 / 1150)));
      expect(style?.fontWeight, FontWeight.w600);
    });

    testWidgets('other cards keep their label', (tester) async {
      final style = await titleStyle(tester, classic: false);
      expect(style?.fontSize, 13);
      expect(style?.fontWeight, FontWeight.bold);
    });
  });
}
