import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/media_bar_settings_screen.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockPluginSyncService extends Mock implements PluginSyncService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    final sync = _MockPluginSyncService();
    when(() => sync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() => GetIt.instance.reset());

  test('only the styles that draw ratings get the section', () {
    expect(
      {
        for (final mode in UserPreferences.mediaBarModeValues)
          if (UserPreferences.mediaBarModeDrawsRatings(mode)) mode,
      },
      {
        UserPreferences.mediaBarModeMoonfin,
        UserPreferences.mediaBarModeMakd,
        UserPreferences.mediaBarModeGallery,
        UserPreferences.mediaBarModeBanner,
      },
    );
  });

  Future<AppLocalizations> pumpFor(WidgetTester tester, String mode) async {
    await prefs.set(UserPreferences.mediaBarMode, mode);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const MediaBarSettingsScreen(),
      ),
    );
    await tester.pumpAndSettle();
    return AppLocalizations.delegate.load(const Locale('en'));
  }

  testWidgets('Moonfin shows all four ratings settings', (tester) async {
    final l10n = await pumpFor(tester, UserPreferences.mediaBarModeMoonfin);
    expect(find.text(l10n.additionalRatings), findsOneWidget);
    expect(find.text(l10n.ratingSources), findsOneWidget);
    expect(find.text(l10n.ratingLabels), findsOneWidget);
    expect(find.text(l10n.ratingBadges), findsOneWidget);
    expect(find.text(l10n.episodeRatings), findsNothing);
  });

  testWidgets('Banner hides the switches it ignores', (tester) async {
    final l10n = await pumpFor(tester, UserPreferences.mediaBarModeBanner);
    expect(find.text(l10n.ratingSources), findsOneWidget);
    expect(find.text(l10n.ratingLabels), findsNothing);
    expect(find.text(l10n.ratingBadges), findsNothing);
  });

  testWidgets('Aya has no ratings section', (tester) async {
    final l10n = await pumpFor(tester, UserPreferences.mediaBarModeAya);
    expect(find.text(l10n.ratingSources), findsNothing);
    expect(find.text(l10n.additionalRatings), findsNothing);
  });
}
