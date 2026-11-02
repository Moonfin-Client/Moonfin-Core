import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
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

AggregatedItem _movieWithCards() => AggregatedItem(
  id: 'movie-test-1',
  serverId: 'server-1',
  rawData: {
    'Id': 'movie-test-1',
    'Name': 'Test Movie',
    'Type': 'Movie',
    'MediaSources': [
      {'Id': 'src-1', 'Size': 5000000000, 'Container': 'mkv'},
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
    when(() => vm.actors).thenReturn([
      {'Id': 'actor-1', 'Name': 'Actor One', 'Type': 'Person'},
    ]);
    when(() => vm.directors).thenReturn(const []);
    when(() => vm.writers).thenReturn(const []);
    when(() => vm.features).thenReturn([
      AggregatedItem(
        id: 'feat-1',
        serverId: 'server-1',
        rawData: {'Id': 'feat-1', 'Name': 'Feature 1', 'Type': 'SpecialFeature'},
      ),
    ]);
    when(() => vm.similar).thenReturn([
      AggregatedItem(
        id: 'sim-1',
        serverId: 'server-1',
        rawData: {'Id': 'sim-1', 'Name': 'Similar 1', 'Type': 'Movie'},
      ),
    ]);
    when(() => vm.reviews).thenReturn(const []);
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
    when(() => vm.supportsPersonalRating).thenReturn(true);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.isRatingMutationInProgress).thenReturn(false);
    when(() => vm.contextSeasonId).thenReturn(null);
    when(() => vm.item).thenReturn(_movieWithCards());
  });

  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    return GetIt.instance.reset();
  });

  Widget buildWidget() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SpotlightDetailContent(
          viewModel: vm,
          prefs: prefs,
          backdropUrl: ValueNotifier<String?>(null),
          onSelectedMediaSourceChanged: (_) {},
          actionsExpanded: false,
          onActionsExpandedChanged: (_) {},
        ),
      ),
    );
  }

  testWidgets('renders navigation chevrons on Desktop when cards > 1', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await tester.pumpWidget(buildWidget());
    await tester.pump();

    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('clicking chevron_right scrolls the horizontal cards row', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    tester.view.physicalSize = const Size(500, 350);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(buildWidget());
    await tester.pump();

    final horizontalScrollView = find
        .byWidgetPredicate(
          (widget) =>
              widget is SingleChildScrollView &&
              widget.scrollDirection == Axis.horizontal,
        )
        .last;

    final scrollController = tester
        .widget<SingleChildScrollView>(horizontalScrollView)
        .controller!;
    expect(scrollController.offset, 0.0);
    expect(scrollController.position.maxScrollExtent, greaterThan(0));

    final rightChevron = find.byIcon(Icons.chevron_right);
    expect(rightChevron, findsOneWidget);

    await tester.tap(rightChevron);
    await tester.pumpAndSettle();

    expect(scrollController.offset, greaterThan(0.0));
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
  });

  testWidgets('does not render navigation chevrons on phone layout', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await tester.pumpWidget(buildWidget());
    await tester.pump();

    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });

  testWidgets('does not render navigation chevrons on TV layout', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await tester.pumpWidget(buildWidget());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });
}
