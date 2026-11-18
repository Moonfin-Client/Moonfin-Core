import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/media_bar.dart';
import 'package:moonfin/ui/widgets/mediabar/makd_classic.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Backdrops extends Mock implements BackgroundService {}

class _ViewModel extends ChangeNotifier implements MediaBarViewModel {
  static const _items = [
    MediaBarSlideItem(itemId: 'a', serverId: 's', title: 'A', year: 2020),
    MediaBarSlideItem(itemId: 'b', serverId: 's', title: 'B', year: 2021),
    MediaBarSlideItem(itemId: 'c', serverId: 's', title: 'C', year: 2022),
  ];

  @override
  List<MediaBarSlideItem> get items => _items;

  @override
  MediaBarState get state => const MediaBarReady(_items);

  @override
  Map<String, double> ratingsFor(String itemId) => const {};

  @override
  Future<void> ensureRatings(String itemId) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  test('desktop sizes follow the original at 1920 by 1080', () {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    final m = MakdMetrics(const Size(1920, 1080), rowPeek: 190);
    expect(m.contentTop, 890);
    expect(m.contentBottom, closeTo(890 - 27, 0.01));
    expect(m.contentWidth, closeTo(46 * 14.88, 0.01));
    expect(m.logoHeight, closeTo(237.6, 0.01));
    expect(m.gutter, closeTo(76.8, 0.01));
    expect(MakdMetrics(const Size(1920, 1080)).classicPeek, closeTo(378, 0.01));
  });

  test(
    'without a peeking row the content sits as if rows began at the bottom',
    () {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      final m = MakdMetrics(const Size(1920, 1080));
      expect(m.contentTop, 1080);
      expect(m.contentBottom, closeTo(1080 - 27, 0.01));
      expect(m.dotsBottom, m.contentBottom);
    },
  );

  test('a TV canvas scales the original pixels down to its width', () {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    final m = MakdMetrics(const Size(1150, 647));
    expect(m.px, closeTo(1150 / 1920, 1e-9));
    expect(m.rem, closeTo(20 * 1150 / 1920, 1e-9));
    expect(m.touchPortrait, isFalse);
    expect(m.arrowSize, closeTo(3.5 * m.rem, 1e-9));
  });

  test('an upright phone centers the content above the dots', () {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    final size = const Size(400, 900);
    final m = MakdMetrics(size, rowPeek: MakdMetrics(size).classicPeek);
    expect(m.touchPortrait, isTrue);
    expect(m.plotLines, 0);
    expect(m.contentBottom, closeTo(900 * 0.58, 0.01));
    expect(m.dotsBottom, closeTo(900 * 0.635, 0.01));
  });

  testWidgets('a bright overlay color only tints the dark wash', (
    tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: MakdWash(flat: true, color: Color(0xFFFF2E92), opacity: 1),
      ),
    );
    final shade = tester
        .widgetList<ColoredBox>(find.byType(ColoredBox))
        .first
        .color;
    expect(shade.withValues(alpha: 1).computeLuminance(), lessThan(0.05));
    expect(shade.r, greaterThan(shade.g), reason: 'it keeps a hint of the hue');
  });

  test('a short landscape phone drops the plot line under a toolbar', () {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    const size = Size(851, 393);
    expect(MakdMetrics(size, topInset: 84).plotLines, 0);
    expect(MakdMetrics(size, topInset: 24).plotLines, 1);
  });

  test('past five titles each dot stands for a share of them', () {
    expect(makdActiveDot(2, 4), 2);
    expect(makdActiveDot(0, 12), 0);
    expect(makdActiveDot(6, 12), 2);
    expect(makdActiveDot(11, 12), 4);
  });

  test('outside titles only get Info', () {
    const external = MediaBarSlideItem(
      itemId: 'x',
      serverId: MediaBarSlideItem.externalServerId,
      title: 'X',
    );
    expect(makdButtonsFor(external), [MakdButton.info]);
    expect(makdButtonsFor(_ViewModel._items.first), MakdButton.values);
  });

  group('the remote', () {
    late UserPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      await prefs.set(UserPreferences.mediaBarAutoAdvance, false);
      await prefs.set(
        UserPreferences.mediaBarMode,
        UserPreferences.mediaBarModeMakd,
      );
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      final manager = PlaybackManager();
      GetIt.instance
        ..registerSingleton<BackgroundService>(_Backdrops())
        ..registerSingleton<PlaybackManager>(manager)
        ..registerSingleton<PlaybackArbiter>(PlaybackArbiter())
        ..registerSingleton<ScreensaverController>(
          ScreensaverController(prefs, manager),
        );
    });

    tearDown(() async {
      GetIt.instance<ScreensaverController>().dispose();
      GetIt.instance<PlaybackManager>().dispose();
      await GetIt.instance.reset();
    });

    testWidgets('walks the buttons before it changes the slide', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final focus = FocusNode();
      addTearDown(focus.dispose);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: MediaBar(
              viewModel: _ViewModel(),
              prefs: prefs,
              height: 1080,
              focusNode: focus,
            ),
          ),
        ),
      );
      focus.requestFocus();
      await tester.pump();

      int slide() => tester.widget<MakdDots>(find.byType(MakdDots)).current;
      Future<void> press(LogicalKeyboardKey key) async {
        await tester.sendKeyEvent(key);
        await tester.pump();
      }

      await press(LogicalKeyboardKey.arrowRight);
      await press(LogicalKeyboardKey.arrowRight);
      expect(slide(), 0, reason: 'Info to Play to Favorite');
      await press(LogicalKeyboardKey.arrowRight);
      expect(slide(), 1, reason: 'Right past Favorite turns the slide');
      await press(LogicalKeyboardKey.arrowLeft);
      await press(LogicalKeyboardKey.arrowLeft);
      expect(slide(), 1, reason: 'back to Info on the same slide');
      await press(LogicalKeyboardKey.arrowLeft);
      expect(slide(), 0, reason: 'Left past Info turns it back');
      await press(LogicalKeyboardKey.arrowLeft);
      expect(slide(), 2, reason: 'and from the first slide to the last');

      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('a left nav takes Left from Info on any slide', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final focus = FocusNode();
      addTearDown(focus.dispose);
      var toNav = 0;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: MediaBar(
              viewModel: _ViewModel(),
              prefs: prefs,
              height: 1080,
              focusNode: focus,
              onNavigateLeft: () => toNav++,
            ),
          ),
        ),
      );
      focus.requestFocus();
      await tester.pump();

      int slide() => tester.widget<MakdDots>(find.byType(MakdDots)).current;
      for (var i = 0; i < 3; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pump();
      }
      expect(slide(), 1);
      for (var i = 0; i < 3; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
        await tester.pump();
      }
      expect(toNav, 1, reason: 'Favorite, Play, Info, then the nav');
      expect(slide(), 1, reason: 'the slide stays put');

      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 2));
    });
  });
}
