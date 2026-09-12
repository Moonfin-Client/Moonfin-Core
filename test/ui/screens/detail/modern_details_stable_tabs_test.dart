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
import 'package:moonfin/ui/screens/detail/modern/modern_detail_content.dart';
import 'package:moonfin/ui/screens/detail/modern/widgets/details_tab_bar.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_home_row.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:playback_core/playback_core.dart';

class MockItemDetailViewModel extends Mock implements ItemDetailViewModel {}
class MockPluginSyncService extends Mock implements PluginSyncService {}
class MockSeerrPreferences extends Mock implements SeerrPreferences {}
class MockMediaServerClient extends Mock implements MediaServerClient {}
class MockImageApi extends Mock implements ImageApi {}
class MockUserRepository extends Mock implements UserRepository {}
class MockOfflineRepository extends Mock implements OfflineRepository {}
class MockPlaybackManager extends Mock implements PlaybackManager {}
class MockQueueService extends Mock implements QueueService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late MockItemDetailViewModel vm;
  late MockPluginSyncService pluginSyncService;
  late MockSeerrPreferences seerrPrefs;
  late MockMediaServerClient mediaClient;
  late MockImageApi imageApi;
  late MockUserRepository userRepo;
  late MockOfflineRepository offlineRepo;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.detailScreenStyle, DetailScreenStyle.modern);
    await prefs.set(UserPreferences.detailExpandedTabs, true);

    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    pluginSyncService = MockPluginSyncService();
    when(() => pluginSyncService.seerrAvailable).thenReturn(false);
    when(() => pluginSyncService.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSyncService);

    seerrPrefs = MockSeerrPreferences();
    when(() => seerrPrefs.labelOrDefault(any())).thenReturn('Discover');
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    mediaClient = MockMediaServerClient();
    when(() => mediaClient.serverType).thenReturn(ServerType.jellyfin);
    imageApi = MockImageApi();
    when(() => mediaClient.imageApi).thenReturn(imageApi);
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://server/img');
    GetIt.instance.registerSingleton<MediaServerClient>(mediaClient);

    userRepo = MockUserRepository();
    when(() => userRepo.currentUserStream).thenAnswer((_) => const Stream.empty());
    when(() => userRepo.currentUser).thenReturn(null);
    GetIt.instance.registerSingleton<UserRepository>(userRepo);

    offlineRepo = MockOfflineRepository();
    when(() => offlineRepo.getSeriesEpisodes(any())).thenAnswer((_) async => []);
    when(() => offlineRepo.getSeasonEpisodes(any())).thenAnswer((_) async => []);
    when(() => offlineRepo.getItem(any())).thenAnswer((_) async => null);
    GetIt.instance.registerSingleton<OfflineRepository>(offlineRepo);

    final playbackManager = MockPlaybackManager();
    final queueService = MockQueueService();
    when(() => playbackManager.queueService).thenReturn(queueService);
    when(() => queueService.currentItem).thenReturn(null);
    when(() => playbackManager.currentResolution).thenReturn(null);
    GetIt.instance.registerSingleton<PlaybackManager>(playbackManager);

    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    vm = MockItemDetailViewModel();
    when(() => vm.seasons).thenReturn([]);
    when(() => vm.episodes).thenReturn([]);
    when(() => vm.seriesEpisodes).thenReturn([]);
    when(() => vm.seasonsLoaded).thenReturn(false);
    when(() => vm.episodesLoaded).thenReturn(false);
    when(() => vm.seriesEpisodesLoaded).thenReturn(false);
    when(() => vm.similar).thenReturn([]);
    when(() => vm.collectionItems).thenReturn([]);
    when(() => vm.missingCollectionItems).thenReturn([]);
    when(() => vm.parentCollections).thenReturn([]);
    when(() => vm.parentCollectionItems).thenReturn([]);
    when(() => vm.parentCollectionName).thenReturn(null);
    when(() => vm.playlistItems).thenReturn([]);
    when(() => vm.playlistIndexBuilding).thenReturn(false);
    when(() => vm.tracks).thenReturn([]);
    when(() => vm.albums).thenReturn([]);
    when(() => vm.filmography).thenReturn([]);
    when(() => vm.features).thenReturn([]);
    when(() => vm.seerr).thenReturn(null);
    when(() => vm.state).thenReturn(ItemDetailState.ready);
    when(() => vm.errorMessage).thenReturn(null);
    when(() => vm.effectiveSeasonId).thenReturn(null);
    when(() => vm.selectedAudioIndex).thenReturn(null);
    when(() => vm.selectedSubtitleIndex).thenReturn(null);
    when(() => vm.actors).thenReturn([]);
    when(() => vm.directors).thenReturn([]);
    when(() => vm.writers).thenReturn([]);
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.localPersonId).thenReturn(null);
    when(() => vm.nextUp).thenReturn(null);
    when(() => vm.loadAllSeriesEpisodes()).thenAnswer((_) async {});
    when(() => vm.addListener(any())).thenReturn(null);
    when(() => vm.removeListener(any())).thenReturn(null);
    when(() => vm.ratings).thenReturn({});
    when(() => vm.imageApi).thenReturn(imageApi);
    when(() => vm.canManagePlaylistTracks).thenReturn(false);
    when(() => vm.playlistLoadingMore).thenReturn(false);
    when(() => vm.filmographyMovies).thenReturn([]);
    when(() => vm.filmographySeries).thenReturn([]);
    when(() => vm.supportsNumericUserRatings).thenReturn(false);
    when(() => vm.isRatingMutationInProgress).thenReturn(false);
    when(() => vm.contextSeasonId).thenReturn(null);
  });

  tearDown(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    return GetIt.instance.reset();
  });

  String selectedTabLabel(WidgetTester tester) {
    final bar = tester.widget<DetailsTabBar>(find.byType(DetailsTabBar));
    return bar.labels[bar.selectedIndex];
  }

  AggregatedItem seriesItem() => AggregatedItem(
        id: 'series-1',
        serverId: 'server-1',
        rawData: const {'Id': 'series-1', 'Name': 'Arcane', 'Type': 'Series'},
      );

  Widget buildTestWidget() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: ModernDetailContent(
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

  testWidgets('Series reserves Seasons tab at index 0 and renders SkeletonHomeRow while seasons are empty', (tester) async {
    when(() => vm.item).thenReturn(seriesItem());
    when(() => vm.seasons).thenReturn([]);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // The Seasons tab label should be present even though seasons is empty
    expect(find.text('Seasons'), findsOneWidget);

    // SkeletonHomeRow should be rendered in the tab body
    expect(find.byType(SkeletonHomeRow), findsOneWidget);
  });

  testWidgets('a tab arriving ahead of the selected one leaves the selection where it was', (tester) async {
    when(() => vm.item).thenReturn(seriesItem());
    when(() => vm.similar).thenReturn([
      AggregatedItem(
        id: 'similar-1',
        serverId: 'server-1',
        rawData: const {'Id': 'similar-1', 'Name': 'Vi', 'Type': 'Series'},
      ),
    ]);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump(const Duration(milliseconds: 100));

    // Seasons, Episodes, Similar. No Cast tab yet, the server has not sent one.
    expect(selectedTabLabel(tester), 'Seasons');
    await tester.tap(find.text('Similar'));
    await tester.pump(const Duration(milliseconds: 100));
    expect(selectedTabLabel(tester), 'Similar');

    // The cast lands, which puts a new tab in front of the selected one.
    when(() => vm.actors).thenReturn([
      <String, dynamic>{'Id': 'p1', 'Name': 'Hailee Steinfeld', 'Type': 'Actor'},
    ]);
    await tester.pumpWidget(buildTestWidget());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Cast'), findsOneWidget);
    expect(selectedTabLabel(tester), 'Similar');
  });

  testWidgets('a Series with no seasons says so once the fetch is done', (tester) async {
    when(() => vm.item).thenReturn(seriesItem());
    when(() => vm.seasons).thenReturn([]);
    when(() => vm.seasonsLoaded).thenReturn(true);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(SkeletonHomeRow), findsNothing);
    expect(find.text('No Seasons loaded'), findsOneWidget);
  });

  testWidgets('a Season with no episodes says so once the fetch is done', (tester) async {
    when(() => vm.item).thenReturn(
      AggregatedItem(
        id: 'season-1',
        serverId: 'server-1',
        rawData: const {'Id': 'season-1', 'Name': 'Season 1', 'Type': 'Season'},
      ),
    );
    when(() => vm.episodes).thenReturn([]);
    when(() => vm.episodesLoaded).thenReturn(true);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(SkeletonHomeRow), findsNothing);
    expect(find.text('No episodes loaded'), findsOneWidget);
  });

  testWidgets('Season reserves Episodes tab at index 0 and renders SkeletonHomeRow while episodes are empty', (tester) async {
    final seasonItem = AggregatedItem(
      id: 'season-1',
      serverId: 'server-1',
      rawData: const {
        'Id': 'season-1',
        'Name': 'Season 1',
        'Type': 'Season',
      },
    );

    when(() => vm.item).thenReturn(seasonItem);
    when(() => vm.episodes).thenReturn([]);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // The Episodes tab label should be present even though episodes is empty
    expect(find.text('Episodes'), findsOneWidget);

    // SkeletonHomeRow should be rendered in the tab body
    expect(find.byType(SkeletonHomeRow), findsOneWidget);
  });

  testWidgets('Episode reserves Episodes tab at index 0 and renders SkeletonHomeRow while episodes are empty', (tester) async {
    final episodeItem = AggregatedItem(
      id: 'episode-1',
      serverId: 'server-1',
      rawData: const {
        'Id': 'episode-1',
        'Name': 'Episode 1',
        'Type': 'Episode',
      },
    );

    when(() => vm.item).thenReturn(episodeItem);
    when(() => vm.episodes).thenReturn([]);

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // The Episodes tab label should be present even though episodes is empty
    expect(find.text('Episodes'), findsOneWidget);

    // SkeletonHomeRow should be rendered in the tab body
    expect(find.byType(SkeletonHomeRow), findsOneWidget);
  });
}
