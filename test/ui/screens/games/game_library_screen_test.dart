import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/games/game_library_screen.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockGamesApi extends Mock implements GamesApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockGamesApi gamesApi;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    client = _MockMediaServerClient();
    gamesApi = _MockGamesApi();
    when(() => client.gamesApi).thenReturn(gamesApi);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('uses system metadata and never loads games for card previews', (
    tester,
  ) async {
    when(() => gamesApi.getSystems('retro')).thenAnswer(
      (_) async => const [
        GameSystem(
          id: 'nes',
          name: 'Nintendo Entertainment System',
          core: 'fceumm',
          gameCount: 12,
        ),
      ],
    );

    await tester.binding.setSurfaceSize(const Size(1280, 720));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const GameLibraryScreen(libraryId: 'retro'),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('12 items'), findsOneWidget);
    verify(() => gamesApi.getSystems('retro')).called(1);
    verifyNever(() => gamesApi.getGames(any(), system: any(named: 'system')));
  });
}
