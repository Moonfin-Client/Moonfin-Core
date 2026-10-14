import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/home_sections_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockSyncService extends Mock implements PluginSyncService {}

void main() {
  late _MockLiveTvApi liveTv;

  setUp(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      const HomeSectionConfig(type: HomeSectionType.liveTv, order: 0),
      const HomeSectionConfig(type: HomeSectionType.onNow, order: 1),
      for (final config in HomeSectionConfig.defaults())
        if (config.type != HomeSectionType.liveTv &&
            config.type != HomeSectionType.onNow)
          config.copyWith(enabled: false, order: config.order + 2),
    ]);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    liveTv = _MockLiveTvApi();
    when(() => liveTv.getChannels(userId: 'user', limit: 1)).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'channel'},
        ],
      },
    );
    final client = _MockClient();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://server.test');
    when(() => client.liveTvApi).thenReturn(liveTv);
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    final sync = _MockSyncService();
    when(() => sync.pluginAvailable).thenReturn(false);
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeSectionsScreen(),
      ),
    );
    await tester.pumpAndSettle();
  }

  ListTile tile(WidgetTester tester, String label) => tester.widget<ListTile>(
    find.ancestor(of: find.text(label), matching: find.byType(ListTile)),
  );

  testWidgets('channels without airing programs leave only Live TV available', (
    tester,
  ) async {
    when(() => liveTv.getRecommendedPrograms(limit: 1, isAiring: true))
        .thenAnswer((_) async => {'Items': <dynamic>[]});

    await pump(tester);

    expect(tile(tester, 'Live TV').onTap, isNotNull);
    expect(tile(tester, 'On Now').onTap, isNull);
  });

  testWidgets('airing programs make standalone On Now available', (
    tester,
  ) async {
    when(() => liveTv.getRecommendedPrograms(limit: 1, isAiring: true))
        .thenAnswer(
          (_) async => {
            'Items': [
              {'Id': 'program'},
            ],
          },
        );

    await pump(tester);

    expect(tile(tester, 'Live TV').onTap, isNotNull);
    expect(tile(tester, 'On Now').onTap, isNotNull);
  });
}
