import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_layout_metrics.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The inset the Minimalist landscape layout puts either side of the rail.
const _kInset = 56.0 * 2;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  });

  tearDown(() => GetIt.instance.reset());

  double landscapeCard(double canvasWidth) => minimalistEpisodeCardWidth(
    canvasWidth - _kInset,
    landscape: true,
    prefs: prefs,
  );

  group('the Minimalist rail card width', () {
    test('keeps the designed size on the TV canvas', () {
      // Every TV normalizes to 1324, where the rail is designed to sit at
      // 266. Landing anywhere else there would be a redesign, not a fix.
      expect(landscapeCard(1324), closeTo(266, 10));
    });

    test('shrinks rather than overflowing a narrower canvas', () {
      final narrow = landscapeCard(960);
      expect(narrow, lessThan(landscapeCard(1324)));

      final visible = (960 - _kInset) / (narrow + minimalistEpisodeRail.gap);
      expect(visible, greaterThan(3.0));
    });

    test('never narrows below what a still can carry', () {
      for (final width in [320.0, 480.0, 640.0]) {
        expect(
          landscapeCard(width),
          greaterThanOrEqualTo(minimalistEpisodeRail.minWidth),
        );
      }
    });

    test("doesn't run away on a very wide window", () {
      expect(
        landscapeCard(3440),
        lessThanOrEqualTo(minimalistEpisodeRail.maxWidth),
      );
      expect(landscapeCard(3440), closeTo(landscapeCard(1920), 40));
    });

    test('never narrows as the user scale goes up', () async {
      var previous = 0.0;
      for (final scale in DesktopUiScale.values) {
        await prefs.set(UserPreferences.desktopUiScale, scale);
        final width = landscapeCard(1920);
        expect(
          width,
          greaterThanOrEqualTo(previous),
          reason: 'scale ${scale.name} narrowed the card',
        );
        previous = width;
      }
    });

    test('answers in whole points at every scale', () async {
      // The focus row steps the rail by the width the caller declares, so a
      // card that paints a fraction wider walks the row out of step.
      for (final scale in DesktopUiScale.values) {
        await prefs.set(UserPreferences.desktopUiScale, scale);
        for (final canvas in [960.0, 1324.0, 1920.0, 3440.0]) {
          final width = landscapeCard(canvas);
          expect(width, width.roundToDouble());
        }
      }
    });

    test('is smaller in the compact rail than the landscape one', () {
      expect(
        minimalistEpisodeCardWidth(390, landscape: false, prefs: prefs),
        lessThan(landscapeCard(1324)),
      );
    });

    test('falls back to the designed size without a canvas to measure', () {
      // The skeleton can be built before anything has laid out.
      expect(
        minimalistEpisodeCardWidth(0, landscape: true, prefs: prefs),
        minimalistEpisodeRail.preferredWidth,
      );
      expect(
        minimalistEpisodeCardWidth(
          double.infinity,
          landscape: true,
          prefs: prefs,
        ),
        minimalistEpisodeRail.preferredWidth,
      );
    });
  });
}
