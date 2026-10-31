import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_metadata_layout.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_buttons.dart';
import 'package:moonfin/ui/screens/playback/osd_buttons.dart';
import 'package:moonfin/ui/screens/settings/live_preview/settings_live_preview.dart';
import 'package:moonfin/ui/screens/settings/subtitle_customization_screen.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_previews.dart';
import 'package:moonfin/ui/screensaver/screensaver_gradient_backdrops.dart';
import 'package:moonfin/ui/widgets/info_area.dart';
import 'package:moonfin/ui/widgets/playback/loading_animation_widget.dart';
import 'package:moonfin/ui/widgets/playback/playback_time_row.dart';
import 'package:moonfin/ui/widgets/playback/player_loading_overlay.dart';
import 'package:moonfin/ui/widgets/playback/trickplay.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/ui/widgets/settings/settings_panel.dart';
import 'package:moonfin/ui/widgets/settings/settings_preview_scope.dart';
import 'package:moonfin/ui/widgets/settings/settings_section_header.dart';
import 'package:moonfin/ui/widgets/user_avatar_image.dart';
import 'package:moonfin/util/overlay_color_palette.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart' show ImageApi, MediaServerClient;
import 'package:shared_preferences/shared_preferences.dart';

class _Users extends Mock implements UserRepository {}

class _Client extends Mock implements MediaServerClient {}

class _Images extends Mock implements ImageApi {}

/// Items with no artwork URLs, so images fall back to drawn placeholders and
/// nothing touches the network.
List<MediaBarSlideItem> _fakeItems() => [
  for (var i = 0; i < 4; i++)
    MediaBarSlideItem(
      itemId: 'item$i',
      serverId: 'server',
      title: 'Sample Title $i',
      overview: 'An overview long enough to wrap over a couple of lines.',
      officialRating: 'PG-13',
      year: 2020 + i,
      genres: const ['Action', 'Drama'],
      runtime: const Duration(hours: 1, minutes: 52),
      communityRating: 7.8,
    ),
];

/// Every source the ratings editor offers, for trying them all at once.
const _allRatingSources =
    'personal,tomatoes,tomatoes_audience,imdb,tmdb,metacritic,metacriticuser,'
    'trakt,letterboxd,myanimelist,rogerebert,stars';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'http://server',
      'pref_last_user_id': 'user',
    });
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    SetupPreviewData.debugOverride = null;
    SetupPreviewData.libraries.value = const [];
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
  });

  Widget host(SettingsPreviewController controller, Widget child) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SettingsPreviewScope(controller: controller, child: child),
      ),
    );
  }

  test('focus picks the scene a setting changes and keeps it for others', () {
    final controller = SettingsPreviewController();
    expect(controller.scene, SettingsPreviewScene.home);

    controller.focus(
      const SettingsPreviewEntry(title: 'Zoom', prefKey: 'player_zoom_mode'),
    );
    expect(controller.scene, SettingsPreviewScene.player);

    // Nothing on screen depends on this one, so the player stays up.
    controller.focus(
      const SettingsPreviewEntry(title: 'Auto Login', prefKey: 'auto_login'),
    );
    expect(controller.scene, SettingsPreviewScene.player);

    controller.showScene(SettingsPreviewScene.details);
    expect(controller.scene, SettingsPreviewScene.details);

    controller.focus(
      const SettingsPreviewEntry(
        title: 'Keyboard Style',
        prefKey: 'pref_keyboard_style',
      ),
    );
    expect(controller.scene, SettingsPreviewScene.search);
  });

  test('rating, details and button settings show on the scene they change', () {
    final expected = <String, SettingsPreviewScene>{
      for (final (settings, scene) in [
        (UserPreferences.detailsRatings, SettingsPreviewScene.details),
        (UserPreferences.homeRowsRatings, SettingsPreviewScene.home),
        (UserPreferences.mediaBarRatings, SettingsPreviewScene.home),
      ])
        for (final pref in settings.all)
          if (pref != settings.episodeRatings) pref.key: scene,
      for (final pref in [
        UserPreferences.navbarColor,
        UserPreferences.navbarOpacity,
        UserPreferences.mediaBarOverlayColor,
        UserPreferences.mediaBarOverlayOpacity,
      ])
        pref.key: SettingsPreviewScene.home,
      for (final pref in [
        UserPreferences.detailsBackdropEnabled,
        UserPreferences.detailsBackdropSize,
        UserPreferences.detailsBackgroundBlurAmount,
        UserPreferences.detailShowTechnicalDetails,
        UserPreferences.detailExpandedTabs,
        UserPreferences.detailButtonsMaxVisible,
        detailButtonLayout.orderTv!,
        detailButtonLayout.orderMobile!,
        detailButtonLayout.orderDesktop!,
        detailMetadataLayout.orderTv!,
        detailMetadataLayout.orderMobile!,
        detailMetadataLayout.orderDesktop!,
      ])
        pref.key: SettingsPreviewScene.details,
    };
    expected.forEach(
      (key, scene) => expect(
        SettingsPreviewController.sceneForKey(key),
        scene,
        reason: key,
      ),
    );
    // Episode ratings only change episodes, which no preview draws.
    for (final settings in [
      UserPreferences.detailsRatings,
      UserPreferences.homeRowsRatings,
    ]) {
      expect(
        SettingsPreviewController.sceneForKey(settings.episodeRatings!.key),
        isNull,
      );
    }
  });

  test('navbar, row, loading, trickplay and screensaver settings have a scene', () {
    for (final pref in [
      UserPreferences.showShuffleButton,
      UserPreferences.showGenresButton,
      UserPreferences.showFavoritesButton,
      UserPreferences.showLiveTvButton,
      UserPreferences.showSyncPlayButton,
      UserPreferences.showDownloadsButton,
      UserPreferences.showLibrariesInToolbar,
      UserPreferences.showLibrariesIndividually,
      UserPreferences.showSeerrButton,
      UserPreferences.showServerMessagesButton,
      UserPreferences.showFriendsButton,
      UserPreferences.fullScreenRows,
      UserPreferences.screensaverEnabled,
      UserPreferences.screensaverDimming,
      UserPreferences.screensaverLibraryIds,
      UserPreferences.screensaverRequireRating,
    ]) {
      expect(
        SettingsPreviewController.sceneForKey(pref.key),
        SettingsPreviewScene.home,
        reason: pref.key,
      );
    }
    for (final key in [
      UserPreferences.loadingAnimationImage.key,
      UserPreferences.loadingAnimationSize.key,
      UserPreferences.loadingAnimationPosition.key,
      UserPreferences.loadingAnimationSpeed.key,
      UserPreferences.showLoadingAnimationText.key,
      UserPreferences.trickPlayMode.key,
      UserPreferences.trickPlayPreviewScalePercent.key,
      UserPreferences.trickPlayVerticalPositionPercent.key,
      UserPreferences.trickPlayFollowScrubPosition.key,
      UserPreferences.trickPlayPauseWhileScrubbing.key,
    ]) {
      expect(
        SettingsPreviewController.sceneForKey(key),
        SettingsPreviewScene.player,
        reason: key,
      );
    }
  });

  group('the settings path', () {
    Widget screen(List<Widget> children) => Builder(
      builder: (context) => Scaffold(body: ListView(children: children)),
    );

    Widget link(String title, Widget Function() opens, {List<String>? path}) =>
        Builder(
          builder: (context) => SettingsPreviewReporter(
            describe: () => SettingsPreviewEntry(title: title),
            child: ListTile(
              title: Text(title),
              onTap: () => context.pushSettingsScreen(
                opens(),
                previewPath: path,
              ),
            ),
          ),
        );

    Widget setting(String title) => SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(title: title, prefKey: title),
      child: ListTile(title: Text(title), onTap: () {}),
    );

    Future<void> pumpCategory(
      WidgetTester tester,
      SettingsPreviewController controller,
      String category,
      Widget page,
    ) => tester.pumpWidget(
      host(
        controller,
        Navigator(
          onGenerateRoute: (_) => MaterialPageRoute<void>(
            builder: (_) => SettingsPreviewPath(path: [category], child: page),
          ),
        ),
      ),
    );

    testWidgets('names the category, the screens opened and the section', (
      tester,
    ) async {
      final controller = SettingsPreviewController();
      await pumpCategory(
        tester,
        controller,
        'Appearance',
        screen([
          link(
            'Home Screen',
            () => screen([
              const SettingsSectionHeader('Navbar'),
              setting('Show Shuffle Button'),
              const SettingsSectionHeader('Show Genres Button'),
              setting('Show Genres Button'),
            ]),
          ),
        ]),
      );

      await tester.tap(find.text('Home Screen'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Shuffle Button'));
      expect(controller.focusedPath, ['Appearance', 'Home Screen', 'Navbar']);

      // A header that only repeats the setting's name says nothing new.
      await tester.tap(find.text('Show Genres Button').last);
      expect(controller.focusedPath, ['Appearance', 'Home Screen']);
    });

    testWidgets('finds a header the list has scrolled out of memory', (
      tester,
    ) async {
      final controller = SettingsPreviewController();
      await pumpCategory(
        tester,
        controller,
        'General',
        screen([
          const SettingsSectionHeader('Clock'),
          for (var i = 0; i < 60; i++) setting('Setting $i'),
        ]),
      );
      await tester.scrollUntilVisible(find.text('Setting 59'), 400);
      expect(find.text('Clock'), findsNothing);

      await tester.tap(find.text('Setting 59'));
      expect(controller.focusedPath, ['General', 'Clock']);
    });

    testWidgets('a screen opened from search keeps its real place', (
      tester,
    ) async {
      final controller = SettingsPreviewController();
      await pumpCategory(
        tester,
        controller,
        'Account',
        screen([
          link(
            '24-Hour Clock',
            () => screen([
              const SettingsSectionHeader('Clock'),
              setting('Use 24-Hour Clock'),
            ]),
            path: const ['General'],
          ),
        ]),
      );

      await tester.tap(find.text('24-Hour Clock'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Use 24-Hour Clock'));
      expect(controller.focusedPath, ['General', 'Clock']);
    });

    testWidgets('the inspector shows the path in place of the description', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: '24-Hour Clock',
            prefKey: 'pref_use_24_hour_clock',
            description: 'Shows the time in 24-hour format',
          ),
          path: const ['General', 'Clock'],
        );
      await tester.pumpWidget(
        host(controller, const SettingsPreviewInspector()),
      );
      expect(find.text('General › Clock'), findsOneWidget);
      expect(find.text('Shows the time in 24-hour format'), findsNothing);

      // A category has no path, so it keeps its description.
      controller.focus(
        const SettingsPreviewEntry(
          title: 'General',
          description: 'Language, clock and startup',
        ),
      );
      await tester.pump();
      expect(find.text('Language, clock and startup'), findsOneWidget);
    });
  });

  group('the scene chips on a TV', () {
    late AppLocalizations l10n;

    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      l10n = lookupAppLocalizations(const Locale('en'));
    });

    Future<Map<SettingsPreviewScene, FocusNode>> pumpChips(
      WidgetTester tester,
      SettingsPreviewController controller, {
      required double width,
      required double scale,
    }) async {
      final nodes = {
        for (final scene in SettingsPreviewScene.values) scene: FocusNode(),
      };
      addTearDown(() {
        for (final node in nodes.values) {
          node.dispose();
        }
      });
      await tester.pumpWidget(
        host(
          controller,
          Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(scale)),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: width,
                  child: SettingsPreviewSceneChips(
                    controller: controller,
                    focusNodes: nodes,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
      return nodes;
    }

    Rect chip(WidgetTester tester, SettingsPreviewScene scene) =>
        tester.getRect(find.text(settingsPreviewSceneName(l10n, scene)));

    // 622 is what the TV layout leaves the preview column.
    for (final scale in DesktopUiScale.values) {
      testWidgets('the chips get their room first at UI scale ${scale.name}', (
        tester,
      ) async {
        await pumpChips(
          tester,
          SettingsPreviewController(),
          width: 622,
          scale: scale.scaleFactor,
        );
        final row = tester.getRect(find.byType(SingleChildScrollView));
        final label = tester.getSize(
          find.text(l10n.settingsLivePreview.toUpperCase()),
        );
        final first = chip(tester, SettingsPreviewScene.home);
        expect(first.left, greaterThanOrEqualTo(row.left));
        expect(first.right, lessThanOrEqualTo(row.right));
        // Either every chip fits, or the label gave up all of its room
        // before any chip went past the edge.
        final last = chip(tester, settingsPreviewScenes.last);
        expect(
          last.right <= row.right || label.width == 0,
          isTrue,
          reason: 'label ${label.width}, chips end ${last.right} of ${row.right}',
        );
        if (scale.scaleFactor <= DesktopUiScale.large.scaleFactor) {
          expect(last.right, lessThanOrEqualTo(row.right));
        }
        debugDefaultTargetPlatformOverride = null;
      });
    }

    testWidgets('chips too wide for the row scroll with the first in view', (
      tester,
    ) async {
      await pumpChips(
        tester,
        SettingsPreviewController(),
        width: 260,
        scale: DesktopUiScale.greatGrandparents.scaleFactor,
      );
      final row = tester.getRect(find.byType(SingleChildScrollView));
      final first = chip(tester, SettingsPreviewScene.home);
      expect(first.left, greaterThanOrEqualTo(row.left));
      expect(first.right, lessThanOrEqualTo(row.right));
      expect(
        chip(tester, SettingsPreviewScene.search).right,
        greaterThan(row.right),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('focusing a chip shows its scene', (tester) async {
      final controller = SettingsPreviewController();
      final nodes = await pumpChips(
        tester,
        controller,
        width: 622,
        scale: 1,
      );
      nodes[SettingsPreviewScene.player]!.requestFocus();
      await tester.pump();
      expect(controller.scene, SettingsPreviewScene.player);

      // Focus back on a setting hands the preview back to it.
      controller.focus(
        const SettingsPreviewEntry(title: 'Card Size', prefKey: 'poster_size'),
      );
      expect(controller.scene, SettingsPreviewScene.home);
      debugDefaultTargetPlatformOverride = null;
    });
  });

  testWidgets('a tried option stands in for the saved value', (tester) async {
    final controller = SettingsPreviewController();
    late BuildContext context;
    await tester.pumpWidget(
      host(
        controller,
        Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(
      previewValue(context, UserPreferences.navbarPosition),
      NavbarPosition.top,
    );
    controller.tryValue('pref_navbar_position', NavbarPosition.left);
    expect(
      previewValue(context, UserPreferences.navbarPosition),
      NavbarPosition.left,
    );
    controller.clearTry('pref_navbar_position');
    expect(
      previewValue(context, UserPreferences.navbarPosition),
      NavbarPosition.top,
    );
  });

  for (final layout in [
    InterfaceLayout.tv,
    InterfaceLayout.desktop,
    InterfaceLayout.phone,
  ]) {
    testWidgets('every scene lays out on $layout', (tester) async {
      debugDefaultTargetPlatformOverride = layout == InterfaceLayout.desktop
          ? TargetPlatform.linux
          : TargetPlatform.android;
      PlatformDetection.setInterfaceLayout(layout);
      SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
      final controller = SettingsPreviewController();

      Future<void> pump() async {
        await tester.pumpWidget(
          host(
            controller,
            const SizedBox(
              width: 480,
              height: 640,
              child: Column(
                children: [
                  Expanded(child: SettingsLivePreview()),
                  SettingsPreviewInspector(),
                ],
              ),
            ),
          ),
        );
        await tester.pump(const Duration(milliseconds: 300));
        expect(tester.takeException(), isNull);
      }

      for (final scene in settingsPreviewScenes) {
        controller.showScene(scene);
        await pump();
      }

      for (final position in NavbarPosition.values) {
        controller.tryValue('pref_navbar_position', position);
        controller.tryValue('pref_navbar_always_expanded', true);
        controller.tryValue('navbarColor', 'dark_red');
        controller.tryValue('navbarOpacity', 100);
        controller.showScene(SettingsPreviewScene.home);
        await pump();
      }
      for (final size in PosterSize.values) {
        controller.tryValue('poster_size', size);
        await pump();
      }
      controller.focus(
        const SettingsPreviewEntry(
          title: 'Labels',
          prefKey: 'mediaBarShowRatingLabels',
        ),
      );
      controller
        ..tryValue('mediaBarOverlayColor', 'dark_red')
        ..tryValue('mediaBarEnableAdditionalRatings', true)
        ..tryValue('mediaBarEnabledRatings', _allRatingSources)
        ..tryValue('mediaBarShowRatingLabels', true)
        ..tryValue('mediaBarShowRatingBadges', true);
      for (final mode in UserPreferences.mediaBarModeValues) {
        controller.tryValue('mediaBarMode', mode);
        await pump();
      }
      controller.focus(
        const SettingsPreviewEntry(
          title: 'Badges',
          prefKey: 'homeRowsShowRatingBadges',
        ),
      );
      controller
        ..tryValue('homeRowsEnableAdditionalRatings', true)
        ..tryValue('homeRowsEnabledRatings', _allRatingSources)
        ..tryValue('homeRowsShowRatingLabels', true);
      for (final style in HomeRowsStyle.values) {
        controller.tryValue('pref_home_rows_style', style);
        await pump();
      }
      for (final style in DetailScreenStyle.values) {
        controller.tryValue('pref_detail_screen_style', style);
        controller.tryValue('pref_hide_details_media_description', true);
        controller.showScene(SettingsPreviewScene.details);
        await pump();
      }
      controller
        ..tryValue('enableAdditionalRatings', true)
        ..tryValue('enabledRatings', _allRatingSources)
        ..tryValue('pref_detail_show_technical_details', true)
        ..tryValue('pref_detail_expanded_tabs', false)
        ..tryValue(
          'pref_details_backdrop_size',
          UserPreferences.detailsBackdropFit,
        );
      for (final style in DetailScreenStyle.values) {
        controller.tryValue('pref_detail_screen_style', style);
        for (final (limit, amount) in [(-1, 0), (1, 25), (4, 10), (0, 10)]) {
          controller
            ..tryValue('detailButtonsMaxVisible', limit)
            ..tryValue('detailsBackgroundBlurAmount', amount)
            ..tryValue('pref_show_details_backdrop', limit != 1)
            ..showScene(SettingsPreviewScene.details);
          await pump();
        }
      }
      for (final key in [
        'media_segment_actions',
        'next_up_behavior',
        'showDescriptionOnPause',
        null,
      ]) {
        controller.focus(SettingsPreviewEntry(title: 'Player', prefKey: key));
        for (final zoom in ZoomMode.values) {
          controller.tryValue('player_zoom_mode', zoom);
          controller.showScene(SettingsPreviewScene.player);
          await pump();
        }
      }
      for (final position in LoadingAnimationPosition.values) {
        controller
          ..focus(
            const SettingsPreviewEntry(
              title: 'Position',
              prefKey: 'loading_animation_position',
            ),
          )
          ..tryValue('loading_animation_position', position);
        await pump();
      }
      for (final mode in TrickplayMode.values) {
        controller
          ..focus(
            const SettingsPreviewEntry(
              title: 'Trick Play',
              prefKey: 'trickplay_mode',
            ),
          )
          ..tryValue('trickplay_mode', mode);
        await pump();
      }
      controller
        ..focus(
          const SettingsPreviewEntry(
            title: 'Component',
            prefKey: 'pref_screensaver_component',
          ),
        )
        ..tryValue('pref_screensaver_enabled', true)
        ..tryValue('pref_home_rows_fullscreen', true);
      for (final backdrop in ScreensaverBackdrop.values) {
        for (final component in ScreensaverComponent.values) {
          controller
            ..tryValue('pref_screensaver_backdrop', backdrop)
            ..tryValue('pref_screensaver_component', component)
            ..tryValue(
              'pref_screensaver_movement',
              component == ScreensaverComponent.clock
                  ? ScreensaverMovement.fast
                  : ScreensaverMovement.staticCorner,
            );
          await pump();
        }
      }
      if (layout == InterfaceLayout.tv) {
        for (final style in KeyboardStyle.values) {
          controller.tryValue('pref_keyboard_style', style);
          controller.showScene(SettingsPreviewScene.search);
          await pump();
        }
      }
      debugDefaultTargetPlatformOverride = null;
    });
  }

  testWidgets('a picker previews the option in focus until it closes', (
    tester,
  ) async {
    final controller = SettingsPreviewController();
    await tester.pumpWidget(
      host(
        controller,
        EnumPreferenceTile<NavbarPosition>(
          preference: UserPreferences.navbarPosition,
          title: 'Navigation Style',
          labelOf: (value) => value.name,
        ),
      ),
    );

    await tester.tap(find.text('Navigation Style'));
    await tester.pumpAndSettle();
    // The current option takes focus when the picker opens.
    expect(controller.tryingValue('pref_navbar_position'), NavbarPosition.top);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(controller.tryingValue('pref_navbar_position'), NavbarPosition.left);
    expect(controller.tryingIndex('pref_navbar_position'), 1);

    await tester.tap(find.text('left').last);
    await tester.pumpAndSettle();
    expect(controller.isTrying('pref_navbar_position'), isFalse);
    expect(
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition),
      NavbarPosition.left,
    );
  });

  testWidgets('focusing a tile tells the preview about it', (tester) async {
    final controller = SettingsPreviewController();
    await tester.pumpWidget(
      host(
        controller,
        SwitchPreferenceTile(
          preference: UserPreferences.showShuffleButton,
          title: 'Show Shuffle Button',
          subtitle: 'Shows shuffle in the navbar',
        ),
      ),
    );
    await tester.tap(find.text('Show Shuffle Button'));
    await tester.pump();
    expect(controller.focused?.title, 'Show Shuffle Button');
    expect(controller.focused?.prefKey, 'pref_show_shuffle_button');
  });

  testWidgets('the inspector marks the saved choice while another is tried', (
    tester,
  ) async {
    final controller = SettingsPreviewController();
    controller.focus(
      SettingsPreviewEntry(
        title: 'Card Size',
        prefKey: 'poster_size',
        description: 'How big posters are',
        options: const ['Small', 'Medium', 'Large'],
        currentIndex: () => 1,
      ),
    );
    controller.tryValue('poster_size', PosterSize.large, index: 2);
    await tester.pumpWidget(host(controller, const SettingsPreviewInspector()));

    expect(find.text('Card Size'), findsOneWidget);
    expect(find.text('Large'), findsOneWidget);
    expect(find.text('SAVED'), findsOneWidget);
    expect(find.text('Shows on the Home preview'), findsOneWidget);
  });

  group('on desktop', () {
    late AppLocalizations l10n;

    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
      l10n = lookupAppLocalizations(const Locale('en'));
    });

    Future<void> pumpPreview(
      WidgetTester tester,
      SettingsPreviewController controller,
    ) async {
      await tester.pumpWidget(
        host(
          controller,
          const SizedBox(width: 960, height: 600, child: SettingsLivePreview()),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);
    }

    testWidgets('a tried navbar color draws on the navbar', (tester) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(title: 'Color', prefKey: 'navbarColor'),
        )
        ..tryValue('pref_navbar_position', NavbarPosition.top)
        ..tryValue('navbarColor', 'dark_red')
        ..tryValue('navbarOpacity', 80);
      await pumpPreview(tester, controller);

      final tried = OverlayColorPalette.resolveColor(
        'dark_red',
      ).withValues(alpha: 0.8);
      bool paints(Widget widget) =>
          widget is Container &&
          (widget.decoration as BoxDecoration?)?.color == tried;
      expect(find.byWidgetPredicate(paints), findsOneWidget);

      controller.clearTry('navbarColor');
      await pumpPreview(tester, controller);
      expect(find.byWidgetPredicate(paints), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('each surface draws its own rating settings', (tester) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Labels',
            prefKey: 'mediaBarShowRatingLabels',
          ),
        )
        ..tryValue('mediaBarMode', UserPreferences.mediaBarModeMoonfin)
        ..tryValue('mediaBarEnableAdditionalRatings', true)
        ..tryValue('mediaBarEnabledRatings', 'letterboxd,imdb')
        ..tryValue('mediaBarShowRatingLabels', true);
      await pumpPreview(tester, controller);

      expect(find.byType(RatingsRow), findsOneWidget);
      expect(find.text('3.9/5'), findsOneWidget);
      expect(find.text('87%'), findsNothing);
      // The media bar never shows the viewer's own rating.
      expect(find.text('8.0'), findsNothing);
      expect(
        tester.getTopLeft(find.text(l10n.letterboxd)).dx,
        lessThan(tester.getTopLeft(find.text(l10n.imdb)).dx),
      );

      controller.tryValue('mediaBarShowRatingLabels', false);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.letterboxd), findsNothing);

      // With the extra ratings off only the server's own ones are left.
      controller.clearTry('mediaBarEnableAdditionalRatings');
      await pumpPreview(tester, controller);
      expect(find.text('87%'), findsOneWidget);
      expect(find.text('3.9/5'), findsNothing);

      controller
        ..focus(
          const SettingsPreviewEntry(
            title: 'Badges',
            prefKey: 'homeRowsShowRatingBadges',
          ),
        )
        ..tryValue('pref_home_rows_style', HomeRowsStyle.v2);
      await pumpPreview(tester, controller);
      expect(find.byType(RatingsRow), findsOneWidget);
      expect(find.text('8.0'), findsOneWidget);

      controller
        ..focus(
          const SettingsPreviewEntry(
            title: 'Sources',
            prefKey: 'enabledRatings',
          ),
        )
        ..tryValue('pref_detail_screen_style', DetailScreenStyle.modern);
      await pumpPreview(tester, controller);
      expect(controller.scene, SettingsPreviewScene.details);
      expect(find.byType(RatingsRow), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the details buttons follow their order, switches and count', (
      tester,
    ) async {
      final prefs = GetIt.instance<UserPreferences>();
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Buttons',
            prefKey: 'detailButtonsMaxVisible',
          ),
        )
        ..tryValue('pref_detail_screen_style', DetailScreenStyle.classic)
        ..tryValue('detailButtonsMaxVisible', 0);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.audio), findsOneWidget);
      expect(find.text(l10n.addToPlaylist), findsNothing);
      expect(find.text(l10n.more), findsOneWidget);

      controller.tryValue('detailButtonsMaxVisible', -1);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.addToPlaylist), findsOneWidget);
      expect(find.text(l10n.more), findsNothing);

      controller.tryValue('detailButtonsMaxVisible', 1);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.play), findsOneWidget);
      expect(find.text(l10n.audio), findsNothing);
      expect(find.text(l10n.more), findsOneWidget);

      await prefs.set(detailButtonLayout.orderPreference, 'favorite,audio');
      await prefs.set(detailButtonLayout.hiddenPreference, 'subtitles');
      controller.tryValue('detailButtonsMaxVisible', -1);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.subtitles), findsNothing);
      expect(
        tester.getTopLeft(find.text(l10n.favorite)).dx,
        lessThan(tester.getTopLeft(find.text(l10n.audio)).dx),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    Finder asset(String name) => find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == name,
    );

    testWidgets('the navbar draws every button its switches turn on', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Genres',
            prefKey: 'pref_show_genres_button',
          ),
        )
        ..tryValue('pref_navbar_position', NavbarPosition.top);
      await pumpPreview(tester, controller);
      expect(asset('assets/icons/genres.png'), findsOneWidget);
      expect(asset('assets/icons/clapperboard.png'), findsOneWidget);
      expect(find.byIcon(Icons.live_tv_rounded), findsNothing);
      expect(find.byIcon(Icons.groups_rounded), findsNothing);

      controller
        ..tryValue('pref_show_genres_button', false)
        ..tryValue('pref_show_live_tv_button', true)
        ..tryValue('pref_syncplay_enabled', true)
        ..tryValue('pref_show_syncplay_button', true)
        ..tryValue('pref_show_libraries_individually', true);
      await pumpPreview(tester, controller);
      expect(asset('assets/icons/genres.png'), findsNothing);
      expect(asset('assets/icons/clapperboard.png'), findsNothing);

      // Laid out in the real navbar's order.
      final order = [
        Icons.home_rounded,
        Icons.search_rounded,
        Icons.shuffle_rounded,
        Icons.favorite_rounded,
        Icons.live_tv_rounded,
        Icons.groups_rounded,
        Icons.movie_rounded,
        Icons.settings_rounded,
      ].map((icon) => tester.getCenter(find.byIcon(icon)).dx).toList();
      for (var i = 1; i < order.length; i++) {
        expect(order[i], greaterThan(order[i - 1]));
      }

      // Nothing saved, no messages and no friends feature on this server, so
      // those stay off whatever their switches say.
      controller
        ..tryValue('pref_show_downloads_button', true)
        ..tryValue('pref_show_server_messages_button', true)
        ..tryValue('pref_show_friends_button', true)
        ..tryValue('pref_show_libraries_in_toolbar', false);
      await pumpPreview(tester, controller);
      expect(find.byIcon(Icons.download_for_offline), findsNothing);
      expect(find.byIcon(Icons.info_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.people_alt_rounded), findsNothing);
      expect(find.byIcon(Icons.movie_rounded), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('Expanded Rows leaves nothing peeking below the first row', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Expanded Rows',
            prefKey: 'pref_home_rows_fullscreen',
          ),
        );
      await pumpPreview(tester, controller);
      expect(find.text(l10n.continueWatching), findsOneWidget);
      expect(find.text(l10n.recentlyAdded), findsOneWidget);

      controller.tryValue('pref_home_rows_fullscreen', true);
      await pumpPreview(tester, controller);
      expect(find.text(l10n.continueWatching), findsOneWidget);
      expect(find.text(l10n.recentlyAdded), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the navbar shows the user\'s own avatar', (tester) async {
      final users = _Users();
      when(() => users.currentUser).thenReturn(
        PrivateUser(
          id: 'user',
          name: 'moonfin',
          serverId: 'server',
          accessToken: 'token',
          lastUsed: DateTime(2026),
        ),
      );
      GetIt.instance.registerSingleton<UserRepository>(users);
      final controller = SettingsPreviewController()
        ..tryValue('pref_navbar_position', NavbarPosition.top);

      await pumpPreview(tester, controller);
      expect(tester.widget<UserAvatarImage>(find.byType(UserAvatarImage)).url,
          isNull);
      // With no picture to show, the letter stands in.
      expect(find.text('M'), findsOneWidget);

      final client = _Client();
      final images = _Images();
      when(() => client.imageApi).thenReturn(images);
      when(
        () => images.getUserImageUrl('user'),
      ).thenReturn('http://server/Users/user/Images/Primary');
      GetIt.instance.registerSingleton<MediaServerClient>(client);
      controller.showScene(SettingsPreviewScene.home);
      await pumpPreview(tester, controller);
      expect(
        tester.widget<UserAvatarImage>(find.byType(UserAvatarImage)).url,
        'http://server/Users/user/Images/Primary',
      );
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the loading animation settings show the player starting up', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Image',
            prefKey: 'loading_animation_image',
          ),
        )
        ..tryValue('loading_animation_image', LoadingAnimationImage.spinner)
        ..tryValue('loading_animation_size', LoadingAnimationSize.large);
      await pumpPreview(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);
      expect(find.byType(StockSpinnerAnimation), findsOneWidget);
      final overlay = tester.widget<PlayerLoadingOverlay>(
        find.byType(PlayerLoadingOverlay),
      );
      expect(overlay.customSize, LoadingAnimationSize.large);
      expect(find.text('LOADING STREAM...'), findsOneWidget);

      controller.tryValue('show_loading_animation_text', false);
      await pumpPreview(tester, controller);
      expect(find.text('LOADING STREAM...'), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the trickplay settings show the player mid-seek', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(title: 'Scale', prefKey: 'trickplay_mode'),
        )
        ..tryValue('trickplay_mode', TrickplayMode.single)
        ..tryValue('trickplay_preview_scale_percent', 20)
        ..tryValue('trickplay_vertical_position_percent', 0);
      await pumpPreview(tester, controller);
      expect(find.byType(Trickplay), findsOneWidget);
      final small = tester.getRect(find.byType(Trickplay));
      // It sits above the seek bar, which runs level with its time.
      expect(small.bottom, lessThan(tester.getCenter(find.text('2:31')).dy));

      controller.tryValue('trickplay_preview_scale_percent', 50);
      await pumpPreview(tester, controller);
      expect(
        tester.getSize(find.byType(Trickplay)).width,
        greaterThan(small.width),
      );

      controller.tryValue('trickplay_mode', TrickplayMode.disabled);
      await pumpPreview(tester, controller);
      expect(find.byType(Trickplay), findsNothing);

      controller.tryValue('trickplay_mode', TrickplayMode.full);
      await pumpPreview(tester, controller);
      expect(tester.widget<Trickplay>(find.byType(Trickplay)).fillFrame, true);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the screensaver settings show it over Home', (tester) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Backdrop',
            prefKey: 'pref_screensaver_backdrop',
          ),
        )
        ..tryValue('pref_screensaver_enabled', true)
        ..tryValue('pref_screensaver_backdrop', ScreensaverBackdrop.aurora);
      await pumpPreview(tester, controller);
      expect(controller.scene, SettingsPreviewScene.home);
      expect(find.byType(SettingsScreensaverPreview), findsOneWidget);
      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);

      // With the screensaver off nothing comes on over Home.
      controller.tryValue('pref_screensaver_enabled', false);
      await pumpPreview(tester, controller);
      expect(find.byType(SettingsScreensaverPreview), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('a saved switch or slider redraws the preview at once', (
      tester,
    ) async {
      final prefs = GetIt.instance<UserPreferences>();
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Show Text',
            prefKey: 'show_loading_animation_text',
          ),
        );
      addTearDown(controller.dispose);
      await pumpPreview(tester, controller);
      expect(find.text('LOADING STREAM...'), findsOneWidget);

      // Saved the way a switch saves it, with nothing tried and focus left
      // where it was.
      await prefs.set(UserPreferences.showLoadingAnimationText, false);
      await tester.pump();
      expect(find.text('LOADING STREAM...'), findsNothing);

      await prefs.set(UserPreferences.screensaverEnabled, true);
      controller.focus(
        const SettingsPreviewEntry(
          title: 'Dimming',
          prefKey: 'pref_screensaver_dimming',
        ),
      );
      await pumpPreview(tester, controller);
      final dimmed = find.byWidgetPredicate(
        (widget) =>
            widget is ColoredBox &&
            widget.color == Colors.black.withValues(alpha: 0.5),
      );
      expect(dimmed, findsNothing);

      await prefs.set(UserPreferences.screensaverDimming, 50);
      await tester.pump();
      expect(dimmed, findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the sidebar stays a rail whatever Always Expand says', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..tryValue('pref_navbar_position', NavbarPosition.left)
        ..tryValue('pref_navbar_always_expanded', true);
      await pumpPreview(tester, controller);
      expect(find.byIcon(Icons.shuffle_rounded), findsOneWidget);
      expect(find.text(l10n.shuffle), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('expanded labels and the user\'s libraries stay in the bar', (
      tester,
    ) async {
      SetupPreviewData.libraries.value = [
        for (final (name, type) in [
          ('Films', 'movies'),
          ('Series', 'tvshows'),
          ('Tunes', 'music'),
          ('Reading', 'books'),
          ('Home Videos', 'homevideos'),
          ('Playlists', 'playlists'),
        ])
          AggregatedLibrary(
            id: name,
            name: name,
            collectionType: type,
            serverId: 'server',
          ),
      ];
      final controller = SettingsPreviewController()
        ..tryValue('pref_navbar_position', NavbarPosition.top)
        ..tryValue('pref_clock_behavior', ClockBehavior.always)
        ..tryValue('pref_show_libraries_individually', true)
        ..tryValue('pref_navbar_always_expanded', true);
      await pumpPreview(tester, controller);

      // Every library, not one stand-in per kind of title.
      expect(find.text('Films'), findsOneWidget);
      expect(find.text('Tunes'), findsOneWidget);
      expect(find.byIcon(Icons.music_note_rounded), findsOneWidget);
      expect(find.text(l10n.movies), findsNothing);

      // Too many to fit, so the pill keeps clear of the avatar and the clock
      // and clips the rest, as the real bar scrolls them.
      final pill = tester.getRect(
        find
            .ancestor(
              of: find.byIcon(Icons.home_rounded),
              matching: find.byType(SingleChildScrollView),
            )
            .first,
      );
      final clock = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            RegExp(r'^\d{1,2}:\d{2}').hasMatch(widget.data ?? ''),
      );
      final avatar = tester.getRect(find.byType(UserAvatarImage));
      expect(pill.left, greaterThan(avatar.right));
      // The same room on both sides, as the real bar keeps it, so the pill
      // stays centered.
      expect(
        pill.left - avatar.left,
        closeTo(tester.getRect(clock).right - pill.right, 0.5),
      );
      expect(
        tester.getRect(find.text('Playlists')).right,
        greaterThan(pill.right),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('following the scrub moves the thumbnail off center', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Follow',
            prefKey: 'trickplay_follow_scrub_position',
          ),
        )
        ..tryValue('trickplay_mode', TrickplayMode.single)
        ..tryValue('trickplay_follow_scrub_position', true);
      await pumpPreview(tester, controller);
      final following = tester.getCenter(find.byType(Trickplay)).dx;

      controller.tryValue('trickplay_follow_scrub_position', false);
      await pumpPreview(tester, controller);
      expect(following, lessThan(tester.getCenter(find.byType(Trickplay)).dx));
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the details metadata line follows its settings', (
      tester,
    ) async {
      final prefs = GetIt.instance<UserPreferences>();
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Technical',
            prefKey: 'pref_detail_show_technical_details',
          ),
        )
        ..tryValue('pref_detail_screen_style', DetailScreenStyle.modern)
        ..tryValue('pref_detail_show_technical_details', true);
      await pumpPreview(tester, controller);
      expect(find.text('4K'), findsOneWidget);

      controller.tryValue('pref_detail_show_technical_details', false);
      await pumpPreview(tester, controller);
      expect(find.text('4K'), findsNothing);

      await prefs.set(detailMetadataLayout.orderPreference, 'genres,year');
      await pumpPreview(tester, controller);
      expect(
        tester.getTopLeft(find.text('Action · Drama')).dx,
        lessThan(tester.getTopLeft(find.text('2020')).dx),
      );

      await prefs.set(detailMetadataLayout.hiddenPreference, 'year');
      await pumpPreview(tester, controller);
      expect(find.text('2020'), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  });

  for (final scale in DesktopUiScale.values) {
    testWidgets('Home grows with the UI scale the way the real one does at '
        '${scale.name}', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(UserPreferences.desktopUiScale, scale);
      await prefs.set(UserPreferences.homeRowsStyle, HomeRowsStyle.v1);
      await tester.pumpWidget(
        host(
          SettingsPreviewController(),
          Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(scale.scaleFactor)),
              child: const SizedBox(
                width: 960,
                height: 600,
                child: SettingsLivePreview(),
              ),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);

      Finder sizedTo(double height) => find.byWidgetPredicate(
        (widget) => widget is SizedBox && widget.height == height,
      );
      // The classic info band and the poster cards under it.
      expect(
        sizedTo(
          InfoArea.fixedHeight(
            isMobile: false,
            desktopScale: scale.scaleFactor,
          ),
        ),
        findsOneWidget,
      );
      expect(sizedTo(150.0 * (0.8 * scale.scaleFactor)), findsWidgets);
      debugDefaultTargetPlatformOverride = null;
    });
  }

  testWidgets('the classic info band clips text still at an older scale', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.homeRowsStyle,
      HomeRowsStyle.v1,
    );
    // The saved scale is Medium while the text is still drawn far larger,
    // the way it is for a frame right after the scale is turned down.
    await tester.pumpWidget(
      host(
        SettingsPreviewController(),
        Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(2)),
            child: const SizedBox(
              width: 960,
              height: 600,
              child: SettingsLivePreview(),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('the bottom navbar takes its tabs from the button switches', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
    final controller = SettingsPreviewController()
      ..focus(
        const SettingsPreviewEntry(
          title: 'Favorites',
          prefKey: 'pref_show_favorites_button',
        ),
      )
      ..tryValue('pref_navbar_position', NavbarPosition.bottom);
    Future<void> pump() async {
      await tester.pumpWidget(
        host(
          controller,
          const SizedBox(width: 390, height: 844, child: SettingsLivePreview()),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);
    }

    Finder genres() => find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == 'assets/icons/genres.png',
    );

    await pump();
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    expect(genres(), findsNothing);

    // Favorites off frees its slot for the next tab in line.
    controller.tryValue('pref_show_favorites_button', false);
    await pump();
    expect(find.byIcon(Icons.favorite_border_rounded), findsNothing);
    expect(genres(), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('Expanded Rows is a TV and desktop setting', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
    final controller = SettingsPreviewController()
      ..tryValue('pref_navbar_position', NavbarPosition.top)
      ..tryValue('pref_home_rows_fullscreen', true);
    await tester.pumpWidget(
      host(
        controller,
        const SizedBox(width: 390, height: 844, child: SettingsLivePreview()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(
      find.text(lookupAppLocalizations(const Locale('en')).recentlyAdded),
      findsOneWidget,
    );
    debugDefaultTargetPlatformOverride = null;
  });

  test('player button, time slot and subtitle settings show on the player', () {
    for (final key in [
      osdButtonLayout.orderTv!.key,
      osdButtonLayout.orderMobile!.key,
      osdButtonLayout.orderDesktop!.key,
      osdButtonLayout.hiddenTv.key,
      osdButtonLayout.hiddenMobile.key,
      osdButtonLayout.hiddenDesktop.key,
      UserPreferences.playerTransportPosition.key,
      UserPreferences.playbackTimeAboveLeft.key,
      UserPreferences.playbackTimeAboveCenter.key,
      UserPreferences.playbackTimeAboveRight.key,
      UserPreferences.playbackTimeBelowLeft.key,
      UserPreferences.playbackTimeBelowCenter.key,
      UserPreferences.playbackTimeBelowRight.key,
      UserPreferences.subtitlesTextColor.key,
      UserPreferences.subtitleTextStrokeColor.key,
      UserPreferences.subtitlesBackgroundColor.key,
      UserPreferences.subtitlesTextSize.key,
      UserPreferences.subtitlesTextWeight.key,
      UserPreferences.subtitlesOffsetPosition.key,
      UserPreferences.secondarySubtitleSizeAdjustment.key,
      UserPreferences.secondarySubtitleOffsetPosition.key,
      UserPreferences.secondarySubtitleTextColor.key,
      UserPreferences.subtitlesHdrSeparate.key,
      UserPreferences.subtitlesHdrTextColor.key,
      UserPreferences.subtitlesHdrTextStrokeColor.key,
      UserPreferences.subtitlesHdrBackgroundColor.key,
      UserPreferences.subtitlesHdrTextSize.key,
      UserPreferences.subtitlesHdrTextWeight.key,
      UserPreferences.subtitlesHdrOffsetPosition.key,
      UserPreferences.subtitlesUseEmbeddedStyles.key,
      UserPreferences.subtitlesUseEmbeddedFontSizes.key,
    ]) {
      expect(
        SettingsPreviewController.sceneForKey(key),
        SettingsPreviewScene.player,
        reason: key,
      );
    }
    // The music player keeps its own label, which no preview draws.
    expect(
      SettingsPreviewController.sceneForKey(
        UserPreferences.musicPlaybackTimeDisplay.key,
      ),
      isNull,
    );
  });

  testWidgets('a TV lays every scene out on the canvas the TV app uses', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
    const canvas = Size(1150, 1150 * 1080 / 1920);
    final laidOutAt = find.byWidgetPredicate(
      (widget) =>
          widget is SizedBox &&
          widget.width == canvas.width &&
          widget.height == canvas.height,
    );
    final controller = SettingsPreviewController();
    Future<void> pump() async {
      await tester.pumpWidget(
        host(
          controller,
          const SizedBox(width: 960, height: 600, child: SettingsLivePreview()),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);
    }

    for (final scene in settingsPreviewScenes) {
      controller.showScene(scene);
      await pump();
      expect(laidOutAt, findsOneWidget, reason: '$scene');
    }
    // Home's variants, the screensaver over it and every details style too.
    for (final key in [
      'mediaBarMode',
      'homeRowsShowRatingBadges',
      'pref_bottom_navbar_style',
    ]) {
      controller.focus(SettingsPreviewEntry(title: key, prefKey: key));
      await pump();
      expect(laidOutAt, findsOneWidget, reason: key);
    }
    controller
      ..tryValue('pref_screensaver_enabled', true)
      ..focus(
        const SettingsPreviewEntry(
          title: 'Backdrop',
          prefKey: 'pref_screensaver_backdrop',
        ),
      );
    await pump();
    expect(find.byType(SettingsScreensaverPreview), findsOneWidget);
    expect(laidOutAt, findsOneWidget);
    for (final style in DetailScreenStyle.values) {
      controller
        ..tryValue('pref_detail_screen_style', style)
        ..showScene(SettingsPreviewScene.details);
      await pump();
      expect(laidOutAt, findsOneWidget, reason: '$style');
    }
    for (final style in KeyboardStyle.values) {
      controller
        ..tryValue('pref_keyboard_style', style)
        ..showScene(SettingsPreviewScene.search);
      await pump();
      expect(laidOutAt, findsOneWidget, reason: '$style');
    }
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('the sidebar floats over Home and Search keeps its field', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
    final l10n = lookupAppLocalizations(const Locale('en'));
    final controller = SettingsPreviewController();
    Future<void> pump() async {
      await tester.pumpWidget(
        host(
          controller,
          const SizedBox(width: 960, height: 600, child: SettingsLivePreview()),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);
    }

    double rowsLeft(NavbarPosition position) {
      controller
        ..tryValue('pref_navbar_position', position)
        ..showScene(SettingsPreviewScene.home);
      return tester.getTopLeft(find.text(l10n.continueWatching)).dx;
    }

    controller.tryValue('pref_navbar_position', NavbarPosition.top);
    await pump();
    final underTopBar = rowsLeft(NavbarPosition.top);
    await pump();
    rowsLeft(NavbarPosition.left);
    await pump();
    // Home's rows start 56 in beside the rail against 48 under a TV's top
    // bar, rather than after the rail's whole width.
    final scale =
        tester
            .getRect(
              find.byWidgetPredicate(
                (widget) => widget is SizedBox && widget.width == 1150,
              ),
            )
            .width /
        1150;
    expect(
      tester.getTopLeft(find.text(l10n.continueWatching)).dx - underTopBar,
      closeTo(8 * scale, 0.5),
    );

    // The docked keyboard opens under the field rather than in its place, and
    // its action key searches.
    controller
      ..tryValue('pref_keyboard_style', KeyboardStyle.docked)
      ..showScene(SettingsPreviewScene.search);
    await pump();
    expect(find.text('Spri'), findsOneWidget);
    expect(
      find.ancestor(
        of: find.text('Spri'),
        matching: find.byType(CustomKeyboard),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: find.byType(CustomKeyboard),
        matching: find.text(l10n.search),
      ),
      findsOneWidget,
    );
    debugDefaultTargetPlatformOverride = null;
  });

  group('the player scene', () {
    late AppLocalizations l10n;
    late UserPreferences prefs;

    /// The height of the canvas every TV lays out on.
    const tvHeight = 1150 * 1080 / 1920;

    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
      l10n = lookupAppLocalizations(const Locale('en'));
      prefs = GetIt.instance<UserPreferences>();
    });

    Future<void> pumpPlayer(
      WidgetTester tester,
      SettingsPreviewController controller,
    ) async {
      await tester.pumpWidget(
        host(
          controller,
          const SizedBox(width: 960, height: 600, child: SettingsLivePreview()),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.takeException(), isNull);
    }

    Finder line(String word) => find.byWidgetPredicate(
      (widget) => widget is RichText && widget.text.toPlainText().contains(word),
    );

    TextStyle lineStyle(WidgetTester tester, String word) =>
        tester.widget<RichText>(line(word)).text.style!;

    TextStyle? wordStyle(WidgetTester tester, String word) {
      TextStyle? found;
      tester.widget<RichText>(line(word)).text.visitChildren((span) {
        if (span is TextSpan && span.text == word) {
          found = span.style;
          return false;
        }
        return true;
      });
      return found;
    }

    testWidgets('a TV draws the buttons Player Buttons keeps, in its order', (
      tester,
    ) async {
      // A TV device, not just its layout, which a phone can pick too.
      PlatformDetection.setTvMode(true);
      addTearDown(() => PlatformDetection.setTvMode(false));
      final controller = SettingsPreviewController()
        ..focus(
          SettingsPreviewEntry(
            title: 'Player Buttons',
            prefKey: osdButtonLayout.orderPreference.key,
          ),
        );
      addTearDown(controller.dispose);
      await pumpPlayer(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);

      double x(Finder finder) => tester.getCenter(finder).dx;
      final row = [
        find.byIcon(Icons.favorite_border),
        find.text('1.0x'),
        find.byIcon(Icons.bookmark_outline_rounded),
        find.byIcon(Icons.video_library_outlined),
        find.byIcon(Icons.subtitles_outlined),
        find.byIcon(Icons.audiotrack_outlined),
        find.byIcon(Icons.people_outline_rounded),
        find.byIcon(Icons.video_settings_outlined),
        find.byIcon(Icons.fit_screen_rounded),
        find.byIcon(Icons.info_outline_rounded),
      ];
      for (var i = 1; i < row.length; i++) {
        expect(x(row[i]), greaterThan(x(row[i - 1])));
      }
      // SyncPlay waits for a group, and a TV has no back arrow and can't
      // cast, rotate, float or go fullscreen.
      for (final icon in [
        Icons.groups_rounded,
        Icons.cast,
        Icons.volume_up_rounded,
        Icons.screen_rotation_outlined,
        Icons.fullscreen_rounded,
        Icons.push_pin_outlined,
        Icons.arrow_back,
      ]) {
        expect(find.byIcon(icon), findsNothing, reason: '$icon');
      }
      // The transport docks at the start of the same row.
      final previous = find.byIcon(Icons.skip_previous_rounded);
      expect(previous, findsOneWidget);
      expect(x(previous), lessThan(x(row.first)));
      expect(
        tester.getCenter(previous).dy,
        closeTo(tester.getCenter(row.first).dy, 0.5),
      );

      // The editor saves each change as it's made, and the preview follows.
      await prefs.set(UserPreferences.hiddenOsdButtonsTv, 'audio,zoom');
      await prefs.set(UserPreferences.osdButtonOrderTv, 'info,favorite');
      await tester.pump();
      expect(find.byIcon(Icons.audiotrack_outlined), findsNothing);
      expect(find.byIcon(Icons.fit_screen_rounded), findsNothing);
      expect(
        x(find.byIcon(Icons.info_outline_rounded)),
        lessThan(x(find.byIcon(Icons.favorite_border))),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('a desktop transport sits on screen or docks in the row', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Transport',
            prefKey: 'pref_player_transport_position',
          ),
        );
      await pumpPlayer(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);
      final previous = find.byIcon(Icons.skip_previous_rounded);
      expect(
        tester.getCenter(previous).dy,
        lessThan(tester.getRect(find.byType(Slider)).top),
      );
      for (final icon in [
        Icons.arrow_back,
        Icons.picture_in_picture_alt_rounded,
        Icons.cast,
        Icons.volume_up_rounded,
        Icons.fullscreen_rounded,
        Icons.push_pin_outlined,
      ]) {
        expect(find.byIcon(icon), findsOneWidget, reason: '$icon');
      }

      controller.tryValue(
        'pref_player_transport_position',
        PlayerTransportPosition.docked,
      );
      await pumpPlayer(tester, controller);
      expect(
        tester.getCenter(previous).dy,
        greaterThan(tester.getRect(find.byType(Slider)).bottom),
      );
      expect(
        tester.getCenter(previous).dx,
        lessThan(tester.getCenter(find.byIcon(Icons.favorite_border)).dx),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the time slots sit around the seek bar where they\'re put', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Above Left',
            prefKey: 'playback_time_above_left',
          ),
        )
        ..tryValue('playback_time_above_left', PlaybackTimeSlot.elapsed)
        ..tryValue('playback_time_above_right', PlaybackTimeSlot.none)
        ..tryValue('playback_time_below_left', PlaybackTimeSlot.none)
        ..tryValue('playback_time_below_center', PlaybackTimeSlot.timeRemaining);
      await pumpPlayer(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);

      final bar = tester.getRect(find.byType(Slider));
      // 4:12 into the 10:04 sample, which leaves 5:52.
      final elapsed = tester.getRect(find.text('4:12'));
      expect(elapsed.bottom, lessThan(bar.center.dy));
      expect(elapsed.left, lessThan(bar.center.dx));
      expect(
        tester
            .widget<PlaybackTimeRow>(
              find.ancestor(
                of: find.text('4:12'),
                matching: find.byType(PlaybackTimeRow),
              ),
            )
            .bold,
        isTrue,
      );
      final remaining = tester.getRect(find.text('-5:52'));
      expect(remaining.top, greaterThan(bar.center.dy));
      expect(remaining.center.dx, closeTo(bar.center.dx, 1));
      expect(
        tester.getRect(find.text('10:04')).left,
        greaterThan(bar.center.dx),
      );

      // With every slot above the bar empty, its row goes too.
      controller.tryValue('playback_time_above_left', PlaybackTimeSlot.none);
      await pumpPlayer(tester, controller);
      expect(find.byType(PlaybackTimeRow), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the subtitle line wears the look being saved or tried', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..focus(
          const SettingsPreviewEntry(
            title: 'Size',
            prefKey: 'subtitles_text_size',
          ),
        )
        ..tryValue('playback_engine_preference', PlaybackEnginePreference.media3)
        ..tryValue('subtitles_text_size', 32.0)
        ..tryValue('subtitles_text_color', 0xFFFFFF00)
        ..tryValue('subtitles_background_color', 0x80000000)
        ..tryValue('subtitles_text_stroke_color', 0xFF0000FF)
        ..tryValue('subtitles_text_weight', 700)
        ..tryValue('subtitles_offset_position', 0.1);
      await pumpPlayer(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);
      // The controls stay down, so nothing covers the line.
      expect(find.byType(Slider), findsNothing);

      final style = lineStyle(tester, 'hear');
      expect(style.fontSize, closeTo(32 / 24 * 0.06 * tvHeight, 0.001));
      expect(style.color, const Color(0xFFFFFF00));
      expect(style.backgroundColor, const Color(0x80000000));
      expect(style.fontWeight, FontWeight.bold);
      expect(style.shadows, isNotEmpty);
      expect(style.shadows!.first.color, const Color(0xFF0000FF));
      expect(
        tester
            .widget<Positioned>(
              find
                  .ancestor(of: line('hear'), matching: find.byType(Positioned))
                  .first,
            )
            .bottom,
        closeTo(0.1 * tvHeight, 0.001),
      );

      // The sample's italics are its own styling, which Media3 drops when
      // embedded styles are off.
      expect(wordStyle(tester, 'hear')?.fontStyle, FontStyle.italic);
      controller.tryValue('subtitles_use_embedded_styles', false);
      await pumpPlayer(tester, controller);
      expect(wordStyle(tester, 'hear')?.fontStyle, isNull);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('an HDR setting shows the HDR look while it has focus', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..tryValue('playback_engine_preference', PlaybackEnginePreference.media3)
        ..tryValue('subtitles_hdr_separate', true)
        ..tryValue('subtitles_hdr_text_size', 36.0)
        ..focus(
          const SettingsPreviewEntry(
            title: 'Fill',
            prefKey: 'subtitles_hdr_text_color',
          ),
        );
      await pumpPlayer(tester, controller);
      // Grey unless changed, since white glares in HDR.
      expect(lineStyle(tester, 'hear').color, const Color(0xFF808080));
      expect(
        lineStyle(tester, 'hear').fontSize,
        closeTo(36 / 24 * 0.06 * tvHeight, 0.001),
      );

      controller.focus(
        const SettingsPreviewEntry(
          title: 'Fill',
          prefKey: 'subtitles_text_color',
        ),
      );
      await pumpPlayer(tester, controller);
      expect(lineStyle(tester, 'hear').color, const Color(0xFFFFFFFF));

      // With one look for both, HDR wears the normal one.
      controller
        ..tryValue('subtitles_hdr_separate', false)
        ..focus(
          const SettingsPreviewEntry(
            title: 'Separate',
            prefKey: 'subtitles_hdr_separate',
          ),
        );
      await pumpPlayer(tester, controller);
      expect(lineStyle(tester, 'hear').color, const Color(0xFFFFFFFF));
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the secondary line stacks above with its own adjustments', (
      tester,
    ) async {
      final controller = SettingsPreviewController()
        ..tryValue('playback_engine_preference', PlaybackEnginePreference.media3)
        ..tryValue('pref_secondary_subtitles_enabled', true)
        ..tryValue('pref_secondary_subtitle_language', 'spa')
        ..tryValue('secondary_subtitle_size_adjustment', -25.0)
        ..tryValue('secondary_subtitle_text_color', 0xFF00FFFF)
        ..focus(
          const SettingsPreviewEntry(
            title: 'Secondary',
            prefKey: 'pref_secondary_subtitles_enabled',
          ),
        );
      await pumpPlayer(tester, controller);
      expect(controller.scene, SettingsPreviewScene.player);
      final primary = lineStyle(tester, 'hear');
      final secondary = lineStyle(tester, 'oíste');
      expect(secondary.fontSize, closeTo(primary.fontSize! * 0.75, 0.001));
      expect(secondary.color, const Color(0xFF00FFFF));
      double gap() =>
          tester.getRect(line('hear')).top - tester.getRect(line('oíste')).bottom;
      final close = gap();
      expect(close, greaterThan(0));

      controller.tryValue('secondary_subtitle_offset_adjustment', 0.06);
      await pumpPlayer(tester, controller);
      expect(gap(), greaterThan(close));

      controller.tryValue('pref_secondary_subtitles_enabled', false);
      await pumpPlayer(tester, controller);
      expect(line('oíste'), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('the subtitle look screen reports its tiles and tries colors', (
      tester,
    ) async {
      final controller = SettingsPreviewController();
      await tester.pumpWidget(
        host(controller, const SubtitleCustomizationScreen()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(l10n.subtitleSize));
      await tester.pump();
      expect(controller.focused?.prefKey, 'subtitles_text_size');
      expect(controller.scene, SettingsPreviewScene.player);

      await tester.tap(find.text(l10n.textFillColor));
      await tester.pumpAndSettle();
      expect(controller.focused?.prefKey, 'subtitles_text_color');
      // The saved white takes focus as the picker opens.
      expect(controller.tryingValue('subtitles_text_color'), 0xFFFFFFFF);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(controller.tryingValue('subtitles_text_color'), 0xFFCCCCCC);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(controller.isTrying('subtitles_text_color'), isFalse);
      expect(prefs.get(UserPreferences.subtitlesTextColor), 0xFFFFFFFF);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
