import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/carousel_panel.dart';

Widget _app(Widget child) => MaterialApp(
  home: Scaffold(
    body: Center(child: SizedBox(width: 1600, height: 320, child: child)),
  ),
);

AggregatedItem _episode() => const AggregatedItem(
  id: 'e1',
  serverId: 'srv',
  rawData: {
    'Name': 'Run Boy Run',
    'Type': 'Episode',
    'SeriesName': 'The Umbrella Academy',
    'ParentIndexNumber': 1,
    'IndexNumber': 2,
    'ProductionYear': 2019,
    'OfficialRating': 'TV-14',
    'RunTimeTicks': 34521920000,
    'Genres': ['Action', 'Adventure', 'Comedy', 'Drama'],
    'Overview': 'Five hunts for the owner of a fake eye.',
  },
);

BoxDecoration _panelDecoration(WidgetTester tester) =>
    tester
            .widget<Container>(
              find
                  .descendant(
                    of: find.byType(CarouselPanel),
                    matching: find.byType(Container),
                  )
                  .first,
            )
            .decoration!
        as BoxDecoration;

void main() {
  testWidgets('an episode shows its series, episode line, info and pills', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        CarouselPanel(
          item: _episode(),
          desktopScale: 1,
          mediaBadges: const ['1080p', 'H264', 'EAC3', '5.1'],
        ),
      ),
    );

    expect(find.text('The Umbrella Academy'), findsOneWidget);
    expect(find.text('S1:E2 - Run Boy Run'), findsOneWidget);
    expect(find.text('2019'), findsOneWidget);
    expect(find.text('TV-14'), findsOneWidget);
    expect(find.text('57m'), findsOneWidget);
    expect(find.text('Action, Adventure, Comedy'), findsOneWidget);
    for (final pill in ['1080p', 'H264', 'EAC3', '5.1']) {
      expect(find.text(pill), findsOneWidget);
    }
    expect(
      find.text('Five hunts for the owner of a fake eye.'),
      findsOneWidget,
    );
  });

  testWidgets('Hide Media Description drops the overview', (tester) async {
    await tester.pumpWidget(
      _app(
        CarouselPanel(item: _episode(), desktopScale: 1, showOverview: false),
      ),
    );

    expect(find.text('Five hunts for the owner of a fake eye.'), findsNothing);
  });

  testWidgets('with no backdrop the panel is empty and translucent', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(CarouselPanel(item: _episode(), desktopScale: 1)),
    );

    expect(find.byType(BoundedNetworkImage), findsNothing);
    final fill = _panelDecoration(tester).color!;
    expect(fill.a, lessThan(0.2));
  });

  testWidgets('a backdrop sits behind the details on a solid panel', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        CarouselPanel(
          item: _episode(),
          desktopScale: 1,
          backdropUrl: 'http://fake/backdrop.jpg',
        ),
      ),
    );

    expect(find.byType(BoundedNetworkImage), findsOneWidget);
    expect(_panelDecoration(tester).color!.a, 1);
  });
}
