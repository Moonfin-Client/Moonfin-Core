import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/screensaver_settings_screen.dart';
import 'package:moonfin/ui/screensaver/bouncing_box.dart';
import 'package:moonfin/ui/screensaver/screensaver_gradient_backdrops.dart';
import 'package:moonfin/ui/screensaver/screensaver_view.dart';
import 'package:moonfin/ui/widgets/playback/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Screensaver Enums & Preferences', () {
    test('Default screensaver preferences have expected values', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(prefs.get(UserPreferences.screensaverEnabled), true);
      expect(
        prefs.get(UserPreferences.screensaverBackdrop),
        ScreensaverBackdrop.library,
      );
      expect(
        prefs.get(UserPreferences.screensaverComponent),
        ScreensaverComponent.moonfinLogo,
      );
      expect(
        prefs.get(UserPreferences.screensaverMovement),
        ScreensaverMovement.off,
      );
      expect(prefs.get(UserPreferences.screensaverContentType), 'both');
      expect(prefs.get(UserPreferences.screensaverLibraryIds), '');
      expect(prefs.get(UserPreferences.screensaverCollectionIds), '');
      expect(prefs.get(UserPreferences.screensaverExcludedGenres), '');
      expect(prefs.get(UserPreferences.screensaverTimeout), ScreensaverTimeout.m5);
      expect(prefs.get(UserPreferences.screensaverDimming), 0);
      expect(prefs.get(UserPreferences.screensaverMaxAgeRating), 'any');
      expect(prefs.get(UserPreferences.screensaverRequireRating), false);
    });

    test('Migrates legacy ScreensaverMode.logo to black backdrop and bouncing logo', () async {
      SharedPreferences.setMockInitialValues({
        'pref_screensaver_mode': 'logo',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(
        prefs.get(UserPreferences.screensaverBackdrop),
        ScreensaverBackdrop.black,
      );
      expect(
        prefs.get(UserPreferences.screensaverComponent),
        ScreensaverComponent.moonfinLogo,
      );
      expect(
        prefs.get(UserPreferences.screensaverMovement),
        ScreensaverMovement.bouncing,
      );
    });

    test('Migrates legacy ScreensaverClockMode.bouncing to clock component and bouncing movement', () async {
      SharedPreferences.setMockInitialValues({
        'pref_screensaver_mode': 'library',
        'pref_screensaver_clock_mode': 'bouncing',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(
        prefs.get(UserPreferences.screensaverBackdrop),
        ScreensaverBackdrop.library,
      );
      expect(
        prefs.get(UserPreferences.screensaverComponent),
        ScreensaverComponent.clock,
      );
      expect(
        prefs.get(UserPreferences.screensaverMovement),
        ScreensaverMovement.bouncing,
      );
    });

    test('Migrates legacy ScreensaverClockMode.staticCorner to clock component and staticCorner movement', () async {
      SharedPreferences.setMockInitialValues({
        'pref_screensaver_clock_mode': 'staticCorner',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(
        prefs.get(UserPreferences.screensaverComponent),
        ScreensaverComponent.clock,
      );
      expect(
        prefs.get(UserPreferences.screensaverMovement),
        ScreensaverMovement.staticCorner,
      );
    });
  });

  group('AnimatedGradientBackdrop Rendering', () {
    testWidgets('renders Synthwave backdrop with DecoratedBox', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackdrop(
              backdrop: ScreensaverBackdrop.synthwave,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('renders Calm backdrop', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackdrop(
              backdrop: ScreensaverBackdrop.calm,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
    });

    testWidgets('renders Neon Pulse backdrop', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackdrop(
              backdrop: ScreensaverBackdrop.neonPulse,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
    });

    testWidgets('renders Aurora backdrop', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedGradientBackdrop(
              backdrop: ScreensaverBackdrop.aurora,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
    });
  });

  group('ScreensaverSettingsScreen UI Rendering & Conditional Visibility', () {
    late PreferenceStore store;
    late UserPreferences prefs;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<PreferenceStore>(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    });

    tearDown(() async {
      await GetIt.instance.reset();
    });

    testWidgets('renders only General Settings toggle when inAppScreensaver is disabled', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      prefs.set(UserPreferences.screensaverEnabled, false);

      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ScreensaverSettingsScreen(),
        ),
      );
      await tester.pumpAndSettle();

      // General settings header and in-app screensaver toggle are present
      expect(find.text('General Settings'), findsOneWidget);
      expect(find.text('In-App Screensaver'), findsOneWidget);

      // Everything from timing down should NOT show up
      expect(find.text('Timeout'), findsNothing);
      expect(find.text('Dimming Level'), findsNothing);
      expect(find.text('Visual Components'), findsNothing);
      expect(find.text('Library Content'), findsNothing);
    });

    testWidgets('renders General Settings, Visual Components, and Library Content when enabled and backdrop is library', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      prefs.set(UserPreferences.screensaverEnabled, true);
      prefs.set(UserPreferences.screensaverBackdrop, ScreensaverBackdrop.library);

      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ScreensaverSettingsScreen(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(ListView), const Offset(0, 500));
      await tester.pumpAndSettle();

      expect(find.text('General Settings'), findsOneWidget);
      expect(find.text('In-App Screensaver'), findsOneWidget);
      expect(find.text('Timeout'), findsOneWidget);
      expect(find.text('Dimming Level'), findsOneWidget);

      expect(find.text('Visual Components'), findsOneWidget);
      expect(find.text('Backdrop'), findsOneWidget);
      expect(find.text('Additional Component'), findsOneWidget);
      expect(find.text('Component Movement'), findsOneWidget);

      expect(find.text('Library Content'), findsOneWidget);
      expect(find.text('Content Type'), findsOneWidget);
      expect(find.text('Source Libraries'), findsOneWidget);
      expect(find.text('Source Collections'), findsOneWidget);
      expect(find.text('Excluded Genres'), findsOneWidget);
      expect(find.text('Max Age Rating'), findsOneWidget);
      expect(find.text('Require Age Rating'), findsOneWidget);
    });

    testWidgets('hides Library Content section when backdrop is not Library Art', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      prefs.set(UserPreferences.screensaverEnabled, true);
      prefs.set(UserPreferences.screensaverBackdrop, ScreensaverBackdrop.synthwave);

      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ScreensaverSettingsScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('General Settings'), findsOneWidget);
      expect(find.text('Visual Components'), findsOneWidget);

      // Library Content section should be hidden for synthwave backdrop
      expect(find.text('Library Content'), findsNothing);
      expect(find.text('Source Libraries'), findsNothing);
    });
  });

  group('ScreensaverView Runtime Rendering', () {
    late PreferenceStore store;
    late UserPreferences prefs;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<PreferenceStore>(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    });

    tearDown(() async {
      await GetIt.instance.reset();
    });

    testWidgets('renders AnimatedGradientBackdrop and RunnerAnimation in static corner', (tester) async {
      prefs.set(UserPreferences.screensaverBackdrop, ScreensaverBackdrop.synthwave);
      prefs.set(UserPreferences.screensaverComponent, ScreensaverComponent.runner);
      prefs.set(UserPreferences.screensaverMovement, ScreensaverMovement.staticCorner);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ScreensaverView(),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
      expect(find.byType(RunnerAnimation), findsOneWidget);
      expect(find.byType(BouncingBox), findsNothing);
    });

    testWidgets('renders BouncingBox when movement is bouncing', (tester) async {
      prefs.set(UserPreferences.screensaverBackdrop, ScreensaverBackdrop.calm);
      prefs.set(UserPreferences.screensaverComponent, ScreensaverComponent.moonfinLogo);
      prefs.set(UserPreferences.screensaverMovement, ScreensaverMovement.bouncing);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ScreensaverView(),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsOneWidget);
      expect(find.byType(BouncingBox), findsOneWidget);
    });

    testWidgets('renders no additional component when movement is off', (tester) async {
      prefs.set(UserPreferences.screensaverBackdrop, ScreensaverBackdrop.black);
      prefs.set(UserPreferences.screensaverMovement, ScreensaverMovement.off);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ScreensaverView(),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackdrop), findsNothing);
      expect(find.byType(BouncingBox), findsNothing);
      expect(find.byType(RunnerAnimation), findsNothing);
    });
  });
}
