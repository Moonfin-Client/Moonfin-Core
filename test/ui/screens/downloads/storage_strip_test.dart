import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/downloads/widgets/storage_strip.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The bar went missing once already, so it is worth asserting that it paints
/// rather than trusting the layout to read correctly.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  Future<void> pumpStrip(
    WidgetTester tester, {
    Map<StorageBucket, int>? breakdown,
    int totalBytes = 64456000,
    int limitMb = 0,
    int itemCount = 1,
    bool expanded = false,
  }) async {
    final node = FocusNode(debugLabel: 'strip');
    addTearDown(node.dispose);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: StorageStrip(
            totalBytes: totalBytes,
            limitMb: limitMb,
            itemCount: itemCount,
            breakdown: breakdown,
            expanded: expanded,
            onToggle: () {},
            focusNode: node,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// The bar clips itself, so scoping to that keeps the Scaffold's own fill out
  /// of the count. What is left is one ColoredBox per painted slice.
  List<Color> barColors(WidgetTester tester) => tester
      .widgetList<ColoredBox>(
        find.descendant(
          of: find.byType(ClipRRect),
          matching: find.byType(ColoredBox),
        ),
      )
      .map((box) => box.color)
      .toList();

  testWidgets('every non-empty bucket paints a slice', (tester) async {
    await pumpStrip(
      tester,
      breakdown: const {
        StorageBucket.tvShows: 61600000,
        StorageBucket.images: 2800000,
        StorageBucket.database: 56000,
        StorageBucket.movies: 0,
      },
    );

    // Three slices, and the empty movies bucket is not one of them.
    expect(barColors(tester).length, 3);
  });

  testWidgets('the slices have real height, not just a place in the tree', (
    tester,
  ) async {
    await pumpStrip(
      tester,
      breakdown: const {
        StorageBucket.tvShows: 61600000,
        StorageBucket.images: 2800000,
      },
    );

    // An empty box in a row centres itself at zero height unless the row
    // stretches it, which draws nothing while still counting as a slice.
    final slices = find.descendant(
      of: find.byType(ClipRRect),
      matching: find.byType(ColoredBox),
    );
    for (var i = 0; i < tester.widgetList(slices).length; i++) {
      final rect = tester.getRect(slices.at(i));
      expect(rect.height, greaterThan(0), reason: 'slice $i is invisible');
      expect(rect.width, greaterThan(0), reason: 'slice $i is invisible');
    }
  });

  testWidgets('an unread breakdown still leaves an empty track', (
    tester,
  ) async {
    await pumpStrip(tester, breakdown: null);
    expect(barColors(tester).length, 1);
  });

  testWidgets('a storage limit adds the headroom that is still free', (
    tester,
  ) async {
    await pumpStrip(
      tester,
      breakdown: const {StorageBucket.tvShows: 1024 * 1024},
      limitMb: 100,
    );

    // One slice for the shows, one for the room left under the limit.
    expect(barColors(tester).length, 2);
  });

  testWidgets('the line reports the count and the size together', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpStrip(
      tester,
      breakdown: const {StorageBucket.tvShows: 61600000},
      itemCount: 3,
    );

    expect(find.textContaining(l10n.savedMediaCount(3)), findsOneWidget);
  });

  testWidgets('expanding names each bucket in the legend', (tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpStrip(
      tester,
      breakdown: const {
        StorageBucket.tvShows: 61600000,
        StorageBucket.images: 2800000,
      },
      expanded: true,
    );

    expect(find.textContaining(l10n.tvShows), findsOneWidget);
    expect(find.textContaining(l10n.images), findsOneWidget);
    expect(find.textContaining(l10n.movies), findsNothing);
  });
}
