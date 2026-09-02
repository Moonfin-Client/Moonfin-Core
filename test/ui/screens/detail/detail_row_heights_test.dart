import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
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

  testWidgets('a 200px extras row has room for its cards at every scale', (
    tester,
  ) async {
    // What `_extrasTab` holds the row at. Change one and change the other.
    const rowHeight = 200.0;
    for (final scale in DesktopUiScale.values) {
      await prefs.set(UserPreferences.desktopUiScale, scale);
      await pump(
        tester,
        KeyedSubtree(
          key: ValueKey(scale),
          child: SizedBox(
            height: rowHeight,
            child: DetailFeaturesRow(
              items: [
                AggregatedItem(
                  id: 'v1',
                  serverId: 's1',
                  rawData: const {
                    'Id': 'v1',
                    'Name': 'Deleted Scene: The Rooftop',
                    'Type': 'Video',
                    'ImageTags': {'Primary': 'tag1'},
                  },
                ),
              ],
              imageApi: imageApi,
              prefs: prefs,
            ),
          ),
        ),
      );
      expect(
        tester.getSize(find.byType(DetailFeaturesRow)).height,
        rowHeight,
        reason: 'at ${scale.name}',
      );
      // Holding the row under the height it asks for only works while the
      // cards inside still fit.
      expect(tester.takeException(), isNull, reason: 'at ${scale.name}');
    }
  });
}
