import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/plugin_settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSyncService extends Mock implements PluginSyncService {}

void main() {
  late _MockSyncService sync;
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    sync = _MockSyncService();
    when(() => sync.pluginAvailable).thenReturn(true);
    when(() => sync.pluginVersion).thenReturn('2.4.0');
    when(() => sync.mdblistAvailable).thenReturn(true);
    when(() => sync.tmdbAvailable).thenReturn(true);
    when(() => sync.seerrEnabled).thenReturn(false);
    when(() => sync.currentDeviceProfile).thenReturn('tv');
    when(() => sync.syncProfile).thenReturn('tv');
    when(() => sync.setSyncProfile(any())).thenAnswer((_) async {});
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: SingleChildScrollView(child: PluginSettingsSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows the status and every profile', (tester) async {
    await pump(tester);

    expect(find.text('Moonbase'), findsOneWidget);
    expect(find.text('Connected, version 2.4.0'), findsOneWidget);
    expect(find.text('MDBList'), findsOneWidget);
    expect(find.text('Seerr'), findsNothing);
    for (final label in ['Global', 'Desktop', 'Mobile', 'TV']) {
      expect(find.text(label), findsOneWidget);
    }
    expect(find.text('Applies everywhere'), findsOneWidget);
    expect(find.text('Overrides Global'), findsNWidgets(2));
    expect(find.text('This device'), findsOneWidget);
    expect(find.text('Reset TV Profile'), findsOneWidget);
  });

  testWidgets('picking a card sets the sync profile', (tester) async {
    await pump(tester);

    await tester.tap(find.text('Global'));
    await tester.pumpAndSettle();

    verify(() => sync.setSyncProfile('global')).called(1);
  });

  testWidgets('the profiles stay hidden while sync is off', (tester) async {
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await pump(tester);

    expect(find.text('Sync off'), findsOneWidget);
    expect(find.text('Global'), findsNothing);
    expect(find.text('Reset TV Profile'), findsNothing);

    when(() => sync.setSyncEnabled(true)).thenAnswer((_) async {});
    await tester.tap(find.byType(Switch));
    verify(() => sync.setSyncEnabled(true)).called(1);
  });
}
