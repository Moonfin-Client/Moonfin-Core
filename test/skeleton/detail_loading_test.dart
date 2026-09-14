import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/loading_animation_widget.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_detail_screen.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_shimmer.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget loadingPage(DetailScreenStyle style, {UserPreferences? prefs}) =>
    MaterialApp(
      home: Scaffold(
        body: DetailScreenSkeleton(style: style, prefs: prefs),
      ),
    );

void main() {
  tearDown(() => PlatformDetection.setTvMode(false));

  for (final isTv in [true, false]) {
    for (final style in DetailScreenStyle.values) {
      testWidgets(
        'TV=$isTv $style waits 600 ms without placeholder controls',
        (tester) async {
          PlatformDetection.setTvMode(isTv);
          await tester.pumpWidget(loadingPage(style));
          expect(find.byType(SkeletonBox), findsNothing);
          expect(find.byType(SkeletonShimmer), findsNothing);
          expect(find.byType(LoadingAnimationWidget), findsNothing);
          await tester.pump(const Duration(milliseconds: 599));
          expect(find.byType(LoadingAnimationWidget), findsNothing);

          // Parent rebuilds must not restart the wait for a slow request.
          await tester.pumpWidget(loadingPage(style));
          await tester.pump(const Duration(milliseconds: 1));
          expect(find.byType(MoonfinLogoAnimation), findsOneWidget);
          await tester.pump(const Duration(milliseconds: 200));

          // Real details replace the animation immediately when ready.
          await tester.pumpWidget(
            const MaterialApp(home: Text('Details ready')),
          );
          await tester.pump(const Duration(seconds: 1));
          expect(find.text('Details ready'), findsOneWidget);
          expect(find.byType(LoadingAnimationWidget), findsNothing);
          expect(tester.takeException(), isNull);
        },
      );
    }
  }

  testWidgets('quick loads and leaving the page cancel the pending animation', (
    tester,
  ) async {
    await tester.pumpWidget(loadingPage(DetailScreenStyle.classic));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpWidget(const MaterialApp(home: Text('Details ready')));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Details ready'), findsOneWidget);
    expect(find.byType(LoadingAnimationWidget), findsNothing);
    expect(tester.takeException(), isNull);

    // A new page gets a fresh delay, with no callback after it is dismissed.
    await tester.pumpWidget(loadingPage(DetailScreenStyle.classic));
    await tester.pump(const Duration(milliseconds: 599));
    expect(find.byType(LoadingAnimationWidget), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 1));
    expect(tester.takeException(), isNull);
  });

  testWidgets('details honor loading appearance and position preferences', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(
      UserPreferences.loadingAnimationImage,
      LoadingAnimationImage.runner,
    );
    await prefs.set(
      UserPreferences.loadingAnimationSize,
      LoadingAnimationSize.small,
    );
    await prefs.set(
      UserPreferences.loadingAnimationSpeed,
      LoadingAnimationSpeed.slow,
    );
    await prefs.set(
      UserPreferences.loadingAnimationPosition,
      LoadingAnimationPosition.bottomRight,
    );

    await tester.pumpWidget(
      loadingPage(DetailScreenStyle.classic, prefs: prefs),
    );
    await tester.pump(const Duration(milliseconds: 600));
    final animation = tester.widget<LoadingAnimationWidget>(
      find.byType(LoadingAnimationWidget),
    );
    expect(animation.image, LoadingAnimationImage.runner);
    expect(animation.size, LoadingAnimationSize.small.pixelSize);
    expect(animation.speed, LoadingAnimationSpeed.slow);
    expect(animation.position, LoadingAnimationPosition.bottomRight);
    final rect = tester.getRect(find.byType(LoadingAnimationWidget));
    expect(rect.right, 760);
    expect(rect.bottom, 560);

    await prefs.set(
      UserPreferences.loadingAnimationPosition,
      LoadingAnimationPosition.bouncing,
    );
    await tester.pumpWidget(
      loadingPage(DetailScreenStyle.classic, prefs: prefs),
    );
    expect(find.byType(BouncingPositionWrapper), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 200));

    await prefs.set(
      UserPreferences.loadingAnimationImage,
      LoadingAnimationImage.none,
    );
    await tester.pumpWidget(
      loadingPage(DetailScreenStyle.classic, prefs: prefs),
    );
    expect(find.byType(LoadingAnimationWidget), findsNothing);
    expect(find.byType(BouncingPositionWrapper), findsNothing);
    expect(find.byType(SkeletonBox), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });
}
