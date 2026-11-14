import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/next_up_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const screen = Size(844, 390);

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<Rect> cardRect(WidgetTester tester) async {
    tester.view.physicalSize = screen;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            NextUpOverlay(
              nextItem: const AggregatedItem(
                id: 'next',
                serverId: 'server',
                rawData: {'Name': 'Next Episode', 'SeriesId': 'series'},
              ),
              timeoutMs: 15000,
              onPlayNext: () {},
              onDismiss: () {},
              focusNode: focusNode,
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    final rect = tester.getRect(
      find
          .descendant(
            of: find.byType(NextUpOverlay),
            matching: find.byType(Container),
          )
          .first,
    );
    await tester.pumpWidget(const SizedBox());
    return rect;
  }

  testWidgets('on a phone the card sits centered on the right', (tester) async {
    final rect = await cardRect(tester);

    expect(rect.right, screen.width - 24);
    expect(rect.center.dy, closeTo(screen.height / 2, 1));
  });

  testWidgets('on a desktop the card stays at the bottom right', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      final rect = await cardRect(tester);

      expect(rect.right, screen.width - 24);
      expect(rect.bottom, screen.height - 120);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('on a TV the card stays at the bottom right', (tester) async {
    PlatformDetection.setTvMode(true);
    final rect = await cardRect(tester);

    expect(rect.right, screen.width - 24);
    expect(rect.bottom, screen.height - 120);
  });
}
