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
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/spotlight/spotlight_detail_content.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Vm extends Mock implements ItemDetailViewModel {}

class _ImageApi extends Mock implements ImageApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

class _SeerrPreferences extends Mock implements SeerrPreferences {}

class _MediaServerClient extends Mock implements MediaServerClient {}

class _UserRepository extends Mock implements UserRepository {}

class _OfflineRepository extends Mock implements OfflineRepository {}

class _PlaybackManager extends Mock implements PlaybackManager {}

class _QueueService extends Mock implements QueueService {}

AggregatedItem _alien3() => AggregatedItem(
  id: 'movie-alien-3',
  serverId: 'server-1',
  rawData: {
    'Id': 'movie-alien-3',
    'Name': 'Alien 3',
    'Type': 'Movie',
    'MediaSources': [
      {'Id': 'src-theatrical', 'Name': 'Theatrical Cut'},
      {'Id': 'src-assembly', 'Name': 'Assembly Cut'},
    ],
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Vm vm;
  late _ImageApi imageApi;
  late _PluginSyncService pluginSyncService;
  late _SeerrPreferences seerrPrefs;
  late _MediaServerClient mediaClient;
  late _UserRepository userRepo;
  late _OfflineRepository offlineRepo;
  late _PlaybackManager playbackManager;
  late _QueueService queueService;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(
      UserPreferences.detailScreenStyle,
      DetailScreenStyle.spotlight,
    );

    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    pluginSyncService = _PluginSyncService();
    when(() => pluginSyncService.seerrAvailable).thenReturn(false);
    when(() => pluginSyncService.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSyncService);

    seerrPrefs = _SeerrPreferences();
    when(() => seerrPrefs.labelOrDefault(any())).thenReturn('Discover');
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    mediaClient = _MediaServerClient();
    when(() => mediaClient.serverType).thenReturn(ServerType.jellyfin);
    imageApi = _ImageApi();
    when(() => mediaClient.imageApi).thenReturn(imageApi);
    when(
      () => imageApi.getLogoImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://img/logo');
    when(
      () => imageApi.getBackdropImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        index: any(named: 'index'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://img/backdrop');
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://img/primary');
    GetIt.instance.registerSingleton<MediaServerClient>(mediaClient);

    userRepo = _UserRepository();
    when(
      () => userRepo.currentUserStream,
    ).thenAnswer((_) => const Stream.empty());
    when(() => userRepo.currentUser).thenReturn(null);
    GetIt.instance.registerSingleton<UserRepository>(userRepo);

    offlineRepo = _OfflineRepository();
    when(
      () => offlineRepo.getSeriesEpisodes(any()),
    ).thenAnswer((_) async => []);
    when(
      () => offlineRepo.getSeasonEpisodes(any()),
    ).thenAnswer((_) async => []);
    when(() => offlineRepo.getItem(any())).thenAnswer((_) async => null);
    GetIt.instance.registerSingleton<OfflineRepository>(offlineRepo);

    playbackManager = _PlaybackManager();
    queueService = _QueueService();
    when(() => playbackManager.queueService).thenReturn(queueService);
    when(() => queueService.currentItem).thenReturn(null);
    when(() => playbackManager.currentResolution).thenReturn(null);
    GetIt.instance.registerSingleton<PlaybackManager>(playbackManager);

    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    vm = _Vm();
    when(() => vm.imageApi).thenReturn(imageApi);
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.actors).thenReturn(const []);
    when(() => vm.directors).thenReturn(const []);
    when(() => vm.writers).thenReturn(const []);
    when(() => vm.features).thenReturn(const []);
    when(() => vm.similar).thenReturn(const []);
    when(() => vm.similarSource).thenReturn(SimilarSource.jellyfin);
    when(() => vm.seasons).thenReturn(const []);
    when(() => vm.episodes).thenReturn(const []);
    when(() => vm.seriesEpisodes).thenReturn(const []);
    when(() => vm.seasonsLoaded).thenReturn(true);
    when(() => vm.episodesLoaded).thenReturn(true);
    when(() => vm.seriesEpisodesLoaded).thenReturn(true);
    when(() => vm.loadAllSeriesEpisodes()).thenAnswer((_) async {});
    when(() => vm.nextUp).thenReturn(null);
    when(() => vm.tracks).thenReturn(const []);
    when(() => vm.albums).thenReturn(const []);
    when(() => vm.filmography).thenReturn(const []);
    when(() => vm.filmographyMovies).thenReturn(const []);
    when(() => vm.filmographySeries).thenReturn(const []);
    when(() => vm.collectionItems).thenReturn(const []);
    when(() => vm.missingCollectionItems).thenReturn(const []);
    when(() => vm.playlistItems).thenReturn(const []);
    when(() => vm.playlistIndexBuilding).thenReturn(false);
    when(() => vm.parentCollections).thenReturn(const []);
    when(() => vm.canManagePlaylistTracks).thenReturn(false);
    when(() => vm.playlistLoadingMore).thenReturn(false);
    when(() => vm.seerr).thenReturn(null);
    when(() => vm.state).thenReturn(ItemDetailState.ready);
    when(() => vm.error).thenReturn(null);
    when(() => vm.effectiveSeasonId).thenReturn(null);
    when(() => vm.selectedAudioIndex).thenReturn(null);
    when(() => vm.selectedSubtitleIndex).thenReturn(null);
    when(() => vm.localPersonId).thenReturn(null);
    when(() => vm.addListener(any())).thenReturn(null);
    when(() => vm.removeListener(any())).thenReturn(null);
    when(() => vm.ratings).thenReturn({});
    when(() => vm.supportsNumericUserRatings).thenReturn(false);
    when(() => vm.isRatingMutationInProgress).thenReturn(false);
    when(() => vm.contextSeasonId).thenReturn(null);
  });

  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    return GetIt.instance.reset();
  });

  Widget buildWidget({String? selectedMediaSourceId}) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SpotlightDetailContent(
          viewModel: vm,
          prefs: prefs,
          backdropUrl: ValueNotifier<String?>(null),
          selectedMediaSourceId: selectedMediaSourceId,
          onSelectedMediaSourceChanged: (_) {},
          actionsExpanded: false,
          onActionsExpandedChanged: (_) {},
        ),
      ),
    );
  }

  testWidgets('movie with multiple versions renders version badge', (
    tester,
  ) async {
    final movie = _alien3();
    when(() => vm.item).thenReturn(movie);

    await tester.pumpWidget(
      buildWidget(selectedMediaSourceId: 'src-assembly'),
    );
    await tester.pump();

    expect(find.text('Assembly Cut'), findsOneWidget);
  });

  testWidgets('a hidden version badge section leaves the badge out', (
    tester,
  ) async {
    final movie = _alien3();
    when(() => vm.item).thenReturn(movie);
    await prefs.set(detailSectionLayout.hiddenPreference, 'versionBadge');

    await tester.pumpWidget(
      buildWidget(selectedMediaSourceId: 'src-assembly'),
    );
    await tester.pump();

    expect(find.text('Assembly Cut'), findsNothing);
  });

  testWidgets('movie with single version does not render version badge', (
    tester,
  ) async {
    final movie = AggregatedItem(
      id: 'movie-alien-3',
      serverId: 'server-1',
      rawData: {
        'Id': 'movie-alien-3',
        'Name': 'Alien 3',
        'Type': 'Movie',
        'MediaSources': [
          {'Id': 'src-theatrical', 'Name': 'Theatrical Cut'},
        ],
      },
    );
    when(() => vm.item).thenReturn(movie);

    await tester.pumpWidget(
      buildWidget(selectedMediaSourceId: 'src-theatrical'),
    );
    await tester.pump();

    expect(find.text('Theatrical Cut'), findsNothing);
  });

  testWidgets('episode with multiple versions renders version badge', (
    tester,
  ) async {
    final ep = AggregatedItem(
      id: 'ep-1',
      serverId: 'server-1',
      rawData: {
        'Id': 'ep-1',
        'Name': 'Pilot',
        'Type': 'Episode',
        'SeriesName': 'Severance',
        'MediaSources': [
          {'Id': 'src-1', 'Name': 'Broadcast'},
          {'Id': 'src-2', 'Name': 'Extended Cut'},
        ],
      },
    );
    when(() => vm.item).thenReturn(ep);

    await tester.pumpWidget(buildWidget(selectedMediaSourceId: 'src-2'));
    await tester.pump();

    expect(find.text('Extended Cut'), findsOneWidget);
  });
}
