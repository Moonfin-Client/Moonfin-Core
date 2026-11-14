import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

class _Offline extends Mock implements OfflineRepository {}

class _Playback extends Mock implements PlaybackManager {}

class _Queue extends Mock implements QueueService {}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final sync = _Sync();
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final seerrPrefs = _SeerrPrefs();
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    final users = _Users();
    when(() => users.currentUserStream).thenAnswer((_) => const Stream.empty());
    GetIt.instance.registerSingleton<UserRepository>(users);

    final offline = _Offline();
    when(() => offline.getItem(any())).thenAnswer((_) async => null);
    when(() => offline.getSeriesEpisodes(any())).thenAnswer((_) async => []);
    GetIt.instance.registerSingleton<OfflineRepository>(offline);

    final queue = _Queue();
    final playback = _Playback();
    when(() => playback.queueService).thenReturn(queue);
    GetIt.instance.registerSingleton<PlaybackManager>(playback);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpSeries(WidgetTester tester) async {
    final vm = _ViewModel();
    when(() => vm.item).thenReturn(
      AggregatedItem(
        id: 'series-1',
        serverId: 'server-1',
        rawData: const {'Id': 'series-1', 'Type': 'Series', 'Name': 'Show'},
      ),
    );
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.supportsPersonalRating).thenReturn(false);
    when(() => vm.actionsSettled).thenReturn(true);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);
    when(() => vm.seasons).thenReturn(const []);
    when(() => vm.episodes).thenReturn(const []);
    when(() => vm.nextUp).thenReturn(null);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: SingleChildScrollView(
            child: DetailActionButtons(
              viewModel: vm,
              itemId: 'series-1',
              onSelectedMediaSourceChanged: (_) {},
              maxVisibleButtonsOverride: 20,
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  // An anime that gets new episodes: the viewer sets it once on the series
  // and every episode, next up included, follows.
  testWidgets('a series offers Sub / Dub and remembers the pick', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pumpSeries(tester);
    final prefs = GetIt.instance<UserPreferences>();

    expect(find.byIcon(Icons.translate), findsOneWidget);
    await tester.tap(find.byIcon(Icons.translate));
    await tester.pumpAndSettle();

    expect(find.text('Audio and Subtitles for This Series'), findsOneWidget);
    await tester.tap(find.text('Subbed'));
    await tester.pumpAndSettle();

    expect(prefs.getSeriesTrackMode('series-1'), SeriesTrackMode.subbed);
    // The button now says which mode the series is on.
    expect(find.text('Subbed'), findsOneWidget);
  });
}