import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/skip_segment_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const segment = MediaSegment(
    id: 'seg-1',
    itemId: 'item-1',
    type: MediaSegmentType.intro,
    start: Duration(seconds: 10),
    end: Duration(seconds: 130),
  );

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<void> pumpOverlay(
    WidgetTester tester, {
    required VoidCallback onSkip,
    required VoidCallback onDismiss,
    Duration position = const Duration(seconds: 20),
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            SkipSegmentOverlay(
              segment: segment,
              onSkip: onSkip,
              onDismiss: onDismiss,
              initialPosition: position,
            ),
          ],
        ),
      ),
    );
    await tester.pump();
  }

  final closeChip = find.byIcon(Icons.close_rounded);

  testWidgets('off TV the close chip dismisses without skipping', (
    tester,
  ) async {
    var skipped = 0;
    var dismissed = 0;

    await pumpOverlay(
      tester,
      onSkip: () => skipped++,
      onDismiss: () => dismissed++,
    );

    expect(closeChip, findsOneWidget);

    await tester.tap(closeChip);
    await tester.pump();

    expect(dismissed, 1);
    expect(skipped, 0, reason: 'tapping the chip leaves the capsule alone');
  });

  testWidgets('off TV the capsule still skips', (tester) async {
    var skipped = 0;
    var dismissed = 0;

    await pumpOverlay(
      tester,
      onSkip: () => skipped++,
      onDismiss: () => dismissed++,
    );

    await tester.tap(find.textContaining('Skip'));
    await tester.pump();

    expect(skipped, 1);
    expect(dismissed, 0);
  });

  testWidgets('TV leaves the chip out and keeps the skip button', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);

    await pumpOverlay(tester, onSkip: () {}, onDismiss: () {});

    expect(closeChip, findsNothing, reason: 'back already dismisses on TV');
    expect(find.textContaining('Skip'), findsOneWidget);
  });

  testWidgets('the chip stays centered as the capsule changes width', (
    tester,
  ) async {
    final capsule = find.ancestor(
      of: find.textContaining('Skip'),
      matching: find.byType(InkWell),
    );

    // Over a minute left, so the capsule carries the inline countdown.
    await pumpOverlay(
      tester,
      onSkip: () {},
      onDismiss: () {},
      position: const Duration(seconds: 20),
    );
    final wide = tester.getSize(capsule).width;
    expect(
      tester.getCenter(closeChip).dx,
      closeTo(tester.getCenter(capsule).dx, 0.5),
    );

    // Under a minute the number moves into the ring and the capsule shrinks.
    await pumpOverlay(
      tester,
      onSkip: () {},
      onDismiss: () {},
      position: const Duration(seconds: 100),
    );
    final narrow = tester.getSize(capsule).width;
    expect(
      tester.getCenter(closeChip).dx,
      closeTo(tester.getCenter(capsule).dx, 0.5),
    );

    expect(narrow, lessThan(wide), reason: 'the two variants differ in width');
  });

  testWidgets('bottomInset lifts the capsule off the bottom edge', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            SkipSegmentOverlay(
              segment: segment,
              onSkip: () {},
              onDismiss: () {},
              bottomInset: 220,
            ),
          ],
        ),
      ),
    );
    await tester.pump();

    final positioned = tester.widget<Positioned>(
      find.ancestor(
        of: find.textContaining('Skip'),
        matching: find.byType(Positioned),
      ),
    );
    expect(positioned.bottom, 220);
  });
}
