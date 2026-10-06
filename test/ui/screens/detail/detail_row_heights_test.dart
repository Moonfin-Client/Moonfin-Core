import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ImageApi extends Mock implements ImageApi {}

void main() {
  late UserPreferences prefs;
  late _ImageApi imageApi;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    imageApi = _ImageApi();
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://server/img');
  });

  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    return GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester, Widget child) => tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [child]),
      ),
    ),
  );

  testWidgets('the cast row takes its own height at every desktop scale', (
    tester,
  ) async {
    for (final scale in DesktopUiScale.values) {
      await prefs.set(UserPreferences.desktopUiScale, scale);
      // A fresh instance each pass, or Flutter reuses the previous layout.
      await pump(
        tester,
        KeyedSubtree(
          key: ValueKey(scale),
          child: DetailCastRow(
            people: const [
              {'Id': 'p1', 'Name': 'Hailee Steinfeld', 'Role': 'Vi'},
            ],
            imageApi: imageApi,
            serverId: 's1',
          ),
        ),
      );
      expect(
        tester.getSize(find.byType(DetailCastRow)).height,
        closeTo(196 * scale.scaleFactor, 0.01),
        reason: 'at ${scale.name}',
      );
      // A 200px box was clipping this row at the largest scale.
      expect(tester.takeException(), isNull, reason: 'at ${scale.name}');
    }
  });

  testWidgets('every row starts its cards the same distance under its top', (
    tester,
  ) async {
    AggregatedItem item(String id, String type) => AggregatedItem(
      id: id,
      serverId: 's1',
      rawData: {
        'Id': id,
        'Name': 'Item $id',
        'Type': type,
        'ImageTags': const {'Primary': 'tag1'},
      },
    );

    Future<double> cardInset(Widget row, Finder card) async {
      await pump(tester, KeyedSubtree(key: UniqueKey(), child: row));
      return tester.getTopLeft(card.first).dy -
          tester.getTopLeft(find.byWidget(row)).dy;
    }

    final insets = <String, double>{
      'cast': await cardInset(
        DetailCastRow(
          people: const [
            {'Id': 'p1', 'Name': 'Hailee Steinfeld', 'Role': 'Vi'},
          ],
          imageApi: imageApi,
          serverId: 's1',
        ),
        find.byType(CircleAvatar),
      ),
      'similar': await cardInset(
        DetailSimilarRow(
          items: [item('m1', 'Movie')],
          imageApi: imageApi,
          prefs: prefs,
        ),
        find.byType(MediaCard),
      ),
      'seasons': await cardInset(
        DetailSeasonsRow(
          seasons: [item('s1', 'Season')],
          imageApi: imageApi,
          prefs: prefs,
        ),
        find.byType(MediaCard),
      ),
      'filmography': await cardInset(
        FilmographyRow(
          items: [item('m2', 'Movie')],
          imageApi: imageApi,
          prefs: prefs,
        ),
        find.byType(MediaCard),
      ),
    };

    expect(insets.values.toSet(), {4.0}, reason: '$insets');
  });

  AggregatedItem extra(String id, String type, {bool withSubtitle = true}) =>
      AggregatedItem(
        id: id,
        serverId: 's1',
        rawData: {
          'Id': id,
          'Name': 'Extra $id',
          'Type': type,
          if (withSubtitle) 'ProductionYear': 2012,
          'ImageTags': const {'Primary': 'tag1'},
        },
      );

  /// Pumps an extras row and returns the gap between its lowest label line and
  /// its bottom edge, which should be just the list's 4px bottom padding.
  Future<double> extrasRowSlack(
    WidgetTester tester,
    List<AggregatedItem> items, {
    required double textScale,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DetailFeaturesRow(items: items, imageApi: imageApi, prefs: prefs),
            ],
          ),
        ),
      ),
    );
    final row = find.byType(DetailFeaturesRow);
    final lowestLabel = find
        .descendant(of: row, matching: find.byType(Text))
        .evaluate()
        .map((e) {
          final box = e.renderObject! as RenderBox;
          return box.localToGlobal(Offset(0, box.size.height)).dy;
        })
        .reduce((a, b) => a > b ? a : b);
    return tester.getBottomLeft(row).dy - lowestLabel;
  }

  testWidgets('a featurette row ends under its labels at every scale', (
    tester,
  ) async {
    for (final scale in DesktopUiScale.values) {
      await prefs.set(UserPreferences.desktopUiScale, scale);
      final slack = await extrasRowSlack(
        tester,
        [extra('v1', 'Video')],
        // The app scales text by the UI scale too.
        textScale: scale.scaleFactor,
      );
      expect(slack, closeTo(4, 0.01), reason: 'at ${scale.name}');
      expect(tester.takeException(), isNull, reason: 'at ${scale.name}');
    }
  });

  testWidgets('an extras row fits a poster card next to a 16:9 one', (
    tester,
  ) async {
    final slack = await extrasRowSlack(tester, [
      extra('v1', 'Video'),
      extra('t1', 'Trailer'),
    ], textScale: 1.0);
    expect(slack, closeTo(4, 0.01));
    expect(tester.takeException(), isNull);
  });

  testWidgets('a phone extras row with no subtitles ends under its titles', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    final slack = await extrasRowSlack(tester, [
      extra('v1', 'Video', withSubtitle: false),
    ], textScale: 1.3);
    expect(slack, closeTo(4, 0.01));
    expect(tester.takeException(), isNull);
  });
}
