import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/theme/app_theme.dart' as theme_pkg;
import 'package:moonfin/util/focus/scroll_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    GetIt.I.reset();
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('Animation Speed Preferences', () {
    test('default values match requirements', () async {
      final prefs = await _prefs();

      expect(prefs.get(UserPreferences.pageTransitionSpeed), PageTransitionSpeed.medium);
      expect(prefs.get(UserPreferences.navigationAnimationSpeed), NavigationAnimationSpeed.medium);
      expect(prefs.get(UserPreferences.modernCardTransitionSpeed), ModernCardTransitionSpeed.medium);
      expect(prefs.get(UserPreferences.delayCardExpansionOnRapidScroll), isTrue);
    });

    test('enum duration mappings match spec', () {
      expect(PageTransitionSpeed.slow.duration, const Duration(milliseconds: 450));
      expect(PageTransitionSpeed.medium.duration, const Duration(milliseconds: 300));
      expect(PageTransitionSpeed.fast.duration, const Duration(milliseconds: 150));
      expect(PageTransitionSpeed.off.duration, Duration.zero);

      expect(NavigationAnimationSpeed.extraSlow.duration, const Duration(milliseconds: 400));
      expect(NavigationAnimationSpeed.slow.duration, const Duration(milliseconds: 250));
      expect(NavigationAnimationSpeed.medium.duration, const Duration(milliseconds: 150));
      expect(NavigationAnimationSpeed.fast.duration, const Duration(milliseconds: 80));

      expect(ModernCardTransitionSpeed.extraSlow.duration, const Duration(milliseconds: 450));
      expect(ModernCardTransitionSpeed.slow.duration, const Duration(milliseconds: 300));
      expect(ModernCardTransitionSpeed.medium.duration, const Duration(milliseconds: 180));
      expect(ModernCardTransitionSpeed.fast.duration, const Duration(milliseconds: 90));
      expect(ModernCardTransitionSpeed.off.duration, Duration.zero);
    });

    test('values persist correctly in preferences', () async {
      final prefs = await _prefs();

      prefs.set(UserPreferences.pageTransitionSpeed, PageTransitionSpeed.fast);
      expect(prefs.get(UserPreferences.pageTransitionSpeed), PageTransitionSpeed.fast);

      prefs.set(UserPreferences.navigationAnimationSpeed, NavigationAnimationSpeed.extraSlow);
      expect(prefs.get(UserPreferences.navigationAnimationSpeed), NavigationAnimationSpeed.extraSlow);

      prefs.set(UserPreferences.navigationAnimationSpeed, NavigationAnimationSpeed.slow);
      expect(prefs.get(UserPreferences.navigationAnimationSpeed), NavigationAnimationSpeed.slow);

      prefs.set(UserPreferences.modernCardTransitionSpeed, ModernCardTransitionSpeed.extraSlow);
      expect(prefs.get(UserPreferences.modernCardTransitionSpeed), ModernCardTransitionSpeed.extraSlow);

      prefs.set(UserPreferences.modernCardTransitionSpeed, ModernCardTransitionSpeed.off);
      expect(prefs.get(UserPreferences.modernCardTransitionSpeed), ModernCardTransitionSpeed.off);

      prefs.set(UserPreferences.delayCardExpansionOnRapidScroll, false);
      expect(prefs.get(UserPreferences.delayCardExpansionOnRapidScroll), isFalse);
    });

    test('navigationAnimationDuration helper resolves from preferences', () async {
      final prefs = await _prefs();
      GetIt.I.registerSingleton<UserPreferences>(prefs);

      expect(navigationAnimationDuration, NavigationAnimationSpeed.medium.duration);

      prefs.set(UserPreferences.navigationAnimationSpeed, NavigationAnimationSpeed.extraSlow);
      expect(navigationAnimationDuration, const Duration(milliseconds: 400));

      prefs.set(UserPreferences.navigationAnimationSpeed, NavigationAnimationSpeed.fast);
      expect(navigationAnimationDuration, NavigationAnimationSpeed.fast.duration);
    });

    testWidgets('PageTransitionSpeed controls route transition behavior', (tester) async {
      final prefs = await _prefs();
      GetIt.I.registerSingleton<UserPreferences>(prefs);

      // When off:
      await prefs.set(UserPreferences.pageTransitionSpeed, PageTransitionSpeed.off);
      expect(prefs.get(UserPreferences.pageTransitionSpeed), PageTransitionSpeed.off);

      // When fast:
      await prefs.set(UserPreferences.pageTransitionSpeed, PageTransitionSpeed.fast);
      expect(prefs.get(UserPreferences.pageTransitionSpeed), PageTransitionSpeed.fast);

      // When slow:
      await prefs.set(UserPreferences.pageTransitionSpeed, PageTransitionSpeed.slow);
      expect(prefs.get(UserPreferences.pageTransitionSpeed), PageTransitionSpeed.slow);

      final key = GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: key,
          theme: theme_pkg.AppTheme.darkTheme,
          home: const Scaffold(body: Text('Home')),
        ),
      );

      // Push route with slow
      key.currentState!.push(
        MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text('Destination')),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      final fade = tester.widget<FadeTransition>(find.byType(FadeTransition).last);
      expect(fade.opacity.value, lessThan(0.1));
      await tester.pump(const Duration(milliseconds: 100));
      final fade2 = tester.widget<FadeTransition>(find.byType(FadeTransition).last);
      expect(fade2.opacity.value, lessThan(0.5));
      expect(find.text('Destination'), findsOneWidget);

      // Now set to OFF
      await prefs.set(UserPreferences.pageTransitionSpeed, PageTransitionSpeed.off);
      key.currentState!.push(
        MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text('DestinationOff')),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      expect(find.text('DestinationOff'), findsOneWidget);
    });
  });
}
