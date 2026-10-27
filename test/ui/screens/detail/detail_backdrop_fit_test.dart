import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_layout_metrics.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<UserPreferences> prefsWith(String size) async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'server1',
      'pref_last_user_id': 'user1',
      'pref_details_backdrop_size_server1_user1': size,
    });
    final store = PreferenceStore();
    await store.init();
    return UserPreferences(store);
  }

  Future<Rect> backdropRect(WidgetTester tester, String size, Size screen) async {
    tester.view.physicalSize = screen;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final prefs = await prefsWith(size);
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DetailBackdropFit(
              prefs: prefs,
              child: const ColoredBox(key: Key('image'), color: Colors.red),
            ),
          ],
        ),
      ),
    );
    return tester.getRect(find.byKey(const Key('image')));
  }

  testWidgets('Fit puts the whole picture under the toolbar of an upright phone', (tester) async {
    final rect = await backdropRect(tester, UserPreferences.detailsBackdropFit, const Size(400, 860));
    final toolbar = TopToolbar.baseHeightFor(tester.element(find.byKey(const Key('image'))));
    expect(rect, Rect.fromLTWH(0, toolbar, 400, 225));
    expect(find.byType(ShaderMask), findsOneWidget);
  });

  testWidgets('Full Screen keeps filling the screen', (tester) async {
    expect(
      await backdropRect(tester, UserPreferences.detailsBackdropFullScreen, const Size(400, 860)),
      Offset.zero & const Size(400, 860),
    );
    expect(find.byType(ShaderMask), findsNothing);
  });

  testWidgets('a phone held sideways fills the screen whatever the setting', (tester) async {
    expect(
      await backdropRect(tester, UserPreferences.detailsBackdropFit, const Size(860, 400)),
      Offset.zero & const Size(860, 400),
    );
  });
}
