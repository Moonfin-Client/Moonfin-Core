import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:moonfin/ui/screens/settings/home_row_toggles_screen.dart';
import 'package:moonfin/ui/widgets/settings/settings_preview_scope.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockHomeViewModel extends Mock implements HomeViewModel {}

class _MockSyncService extends Mock implements PluginSyncService {}

// Returning to Home from settings only refreshes Continue Watching and Next Up,
// so a setting that changes Home's rows has to reload Home itself, like the
// sort pickers do.
void main() {
  late UserPreferences prefs;
  late _MockHomeViewModel home;

  setUp(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final sync = _MockSyncService();
    when(() => sync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    home = _MockHomeViewModel();
    when(() => home.load(preserveExisting: any(named: 'preserveExisting')))
        .thenAnswer((_) async {});
    GetIt.instance.registerSingleton<HomeViewModel>(home);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 8000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeRowTogglesScreen(),
      ),
    );
    await tester.pumpAndSettle();
  }

  final toggles = {
    'Display Audio Rows': UserPreferences.displayAudioRows,
    'Display Collections Rows': UserPreferences.displayCollectionsRows,
    'Display Favorites Rows': UserPreferences.displayFavoritesRows,
    'Display Genres Rows': UserPreferences.displayGenresRows,
    'Display Playlist Rows': UserPreferences.displayPlaylistsRows,
  };

  for (final MapEntry(key: title, value: preference) in toggles.entries) {
    testWidgets('$title reloads Home when turned on and off', (tester) async {
      await prefs.set(preference, false);
      await pump(tester);

      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(prefs.get(preference), isTrue);
      verify(() => home.load(preserveExisting: false)).called(1);

      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(prefs.get(preference), isFalse);
      verify(() => home.load(preserveExisting: false)).called(1);
    });
  }

  testWidgets('Merge Recent Rows by Type reloads Home', (tester) async {
    await prefs.set(UserPreferences.mergeRecentRowsByType, false);
    await pump(tester);

    await tester.tap(find.text('Merge Recent Rows by Type'));
    await tester.pumpAndSettle();

    expect(prefs.get(UserPreferences.mergeRecentRowsByType), isTrue);
    verify(() => home.load(preserveExisting: false)).called(1);
  });

  testWidgets('Recently Released Series Sort By reloads Home', (tester) async {
    await prefs.set(
      UserPreferences.recentlyReleasedSeriesType,
      RecentlyReleasedSeriesType.series,
    );
    await pump(tester);

    await tester.tap(find.text('Recently Released Series Sort By'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Season').last);
    await tester.pumpAndSettle();

    expect(
      prefs.get(UserPreferences.recentlyReleasedSeriesType),
      RecentlyReleasedSeriesType.season,
    );
    verify(() => home.load(preserveExisting: false)).called(1);
  });

  // It isn't one of the preference tiles, which report themselves, so the
  // live preview only knows it has focus because the screen says so.
  testWidgets('Select Studios to Include tells the live preview it has focus', (
    tester,
  ) async {
    await prefs.set(UserPreferences.displayStudiosRows, true);
    final controller = SettingsPreviewController();
    addTearDown(controller.dispose);
    tester.view.physicalSize = const Size(1200, 8000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SettingsPreviewScope(
          controller: controller,
          child: const HomeRowTogglesScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: Offset.zero);
    addTearDown(mouse.removePointer);
    await mouse.moveTo(tester.getCenter(find.text('Select Studios to Include')));
    await tester.pump();

    expect(controller.focused?.prefKey, 'pref_studios_row_selected_ids');
    expect(controller.scene, SettingsPreviewScene.home);
  });
}
