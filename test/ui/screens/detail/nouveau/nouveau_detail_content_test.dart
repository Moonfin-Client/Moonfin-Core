import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DetailScreenStyle;
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/screens/detail/nouveau/chapters/nouveau_chapters_section.dart';
import 'package:moonfin/ui/screens/detail/nouveau/details/nouveau_details_section.dart';
import 'package:moonfin/ui/screens/detail/nouveau/discovery/nouveau_discovery_rail.dart';
import 'package:moonfin/ui/screens/detail/nouveau/hero/nouveau_action_buttons.dart';
import 'package:moonfin/ui/screens/detail/nouveau/hero/nouveau_hero.dart';
import 'package:moonfin/ui/screens/detail/nouveau/nouveau_detail_content.dart';
import 'package:moonfin/ui/screens/detail/nouveau/people/nouveau_people_section.dart';
import 'package:moonfin/ui/screens/detail/nouveau/person/nouveau_filmography_section.dart';
import 'package:moonfin/ui/screens/detail/nouveau/person/nouveau_person_content.dart';
import 'package:moonfin/ui/screens/detail/nouveau/shared/nouveau_segmented_selector.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_item_chips.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_stats_card.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_detail_screen.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_shimmer.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _ImageApi extends Mock implements ImageApi {}

class _PluginSync extends Mock implements PluginSyncService {}

class _SessionRepository extends Mock implements SessionRepository {}

class _PlaybackManager extends Mock implements PlaybackManager {}

class _OfflineRepository extends Mock implements OfflineRepository {}

class _QueueService extends Mock implements QueueService {}

class _SeerrViewModel extends Mock implements SeerrMediaDetailViewModel {}

/// A real view model with the lists that need a server, or a Seerr lookup, to
/// fill handed in directly.
class _StubbedViewModel extends ItemDetailViewModel {
  _StubbedViewModel({
    required super.itemId,
    required super.client,
    required super.mutations,
    required super.mdbListRepository,
    required super.tmdbRepository,
  });

  SeerrMediaDetailViewModel? seerrOverride;
  List<AggregatedItem>? similarOverride;
  List<AggregatedItem>? filmographyOverride;

  @override
  SeerrMediaDetailViewModel? get seerr => seerrOverride ?? super.seerr;

  @override
  List<AggregatedItem> get similar => similarOverride ?? super.similar;

  @override
  bool get similarInitialLoadComplete =>
      similarOverride != null || super.similarInitialLoadComplete;

  @override
  List<AggregatedItem> get filmography =>
      filmographyOverride ?? super.filmography;

  List<AggregatedItem> _filmographyOf(String type) => [
    for (final item in filmography)
      if (item.type == type) item,
  ];

  @override
  List<AggregatedItem> get filmographyMovies => _filmographyOf('Movie');

  @override
  List<AggregatedItem> get filmographySeries => _filmographyOf('Series');

  @override
  List<AggregatedItem> get filmographyMusicVideos =>
      _filmographyOf('MusicVideo');

  @override
  List<AggregatedItem> get filmographyEpisodes => _filmographyOf('Episode');
}

Future<UserPreferences> _preferences() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late _PluginSync plugin;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    client = _Client();
    itemsApi = _ItemsApi();
    prefs = await _preferences();
    final userLibrary = _UserLibraryApi();
    when(() => userLibrary.supportsNumericUserRatings).thenReturn(false);

    plugin = _PluginSync();
    when(() => plugin.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(plugin);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    GetIt.instance.registerSingleton<PlaybackManager>(_PlaybackManager());
    GetIt.instance.registerSingleton<OfflineRepository>(_OfflineRepository());
    final playback = GetIt.instance<PlaybackManager>();
    when(() => playback.queueService).thenReturn(_QueueService());
    when(
      () => GetIt.instance<OfflineRepository>().getItem(any()),
    ).thenAnswer((_) async => null);
    when(
      () => GetIt.instance<OfflineRepository>().getSeriesEpisodes(any()),
    ).thenAnswer((_) async => const []);
    when(
      () => GetIt.instance<OfflineRepository>().getSeasonEpisodes(any()),
    ).thenAnswer((_) async => const []);
    final seerrStore = PreferenceStore();
    await seerrStore.init();
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(seerrStore, _SessionRepository()),
    );

    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibrary);
    when(() => client.imageApi).thenReturn(_ImageApi());
    when(() => client.baseUrl).thenReturn('http://test-server');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    GetIt.instance.registerSingleton<RowDataSource>(RowDataSource(client));
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() => GetIt.instance.reset());

  Map<String, dynamic> itemData(
    String type, {
    String id = 'item-1',
    List<Map<String, dynamic>> chapters = const [],
    List<Map<String, dynamic>> people = const [],
  }) => {
    'Id': id,
    'Name': '$type title',
    'Type': type,
    'Overview': 'A useful detail overview',
    'Chapters': chapters,
    'People': people,
    'ProviderIds': const {},
  };

  _StubbedViewModel viewModel(String type, {Map<String, dynamic>? data}) {
    final vm = _StubbedViewModel(
      itemId: 'item-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, TmdbRepository(client)),
      tmdbRepository: TmdbRepository(client),
    );
    final raw = data ?? itemData(type);
    when(() => itemsApi.getItem('item-1')).thenAnswer((_) async => raw);
    when(
      () => itemsApi.getItem(
        'item-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer((_) async => raw);
    return vm;
  }

  Widget content(
    ItemDetailViewModel vm, {
    FocusNode? initialFocusNode,
    Size size = const Size(1200, 2200),
  }) => MediaQuery(
    data: MediaQueryData(size: size),
    child: MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: NouveauDetailContent(
          viewModel: vm,
          prefs: prefs,
          backdropUrl: ValueNotifier<String?>(null),
          selectedMediaSourceId: null,
          initialFocusNode: initialFocusNode,
          onSelectedMediaSourceChanged: (_) {},
          actionsExpanded: false,
          onActionsExpandedChanged: (_) {},
        ),
      ),
    ),
  );

  Future<void> pumpContent(
    WidgetTester tester,
    ItemDetailViewModel vm, {
    FocusNode? initialFocusNode,
    Size size = const Size(1200, 2200),
  }) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    await vm.load();
    await tester.pumpWidget(
      content(vm, initialFocusNode: initialFocusNode, size: size),
    );
    await tester.pump(const Duration(milliseconds: 500));
  }

  Map<String, dynamic> ratedMovie({
    double? community,
    int? critic,
    double? personal,
  }) => {
    ...itemData('Movie'),
    'CommunityRating': community,
    'CriticRating': critic,
    'UserData': {'Rating': personal},
  };

  testWidgets('the hero hands its ratings to the shared row', (tester) async {
    final vm = viewModel(
      'Movie',
      data: ratedMovie(community: 7.8, critic: 91),
    );
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsOneWidget);
    expect(find.text('7.8'), findsOneWidget);
    expect(find.text('91%'), findsOneWidget);
  });

  testWidgets('the picker decides which sources the hero draws', (
    tester,
  ) async {
    await prefs.set(UserPreferences.enableAdditionalRatings, true);
    await prefs.set(UserPreferences.enabledRatings, 'tomatoes');

    final vm = viewModel(
      'Movie',
      data: ratedMovie(community: 7.8, critic: 91),
    );
    await pumpContent(tester, vm);

    // Community rides in as 'stars', which the picker left out.
    expect(find.text('91%'), findsOneWidget);
    expect(find.text('7.8'), findsNothing);
  });

  testWidgets('the label and badge switches reach the hero', (tester) async {
    await prefs.set(UserPreferences.showRatingLabels, false);

    final vm = viewModel('Movie', data: ratedMovie(community: 7.8));
    await pumpContent(tester, vm);

    final row = tester.widget<RatingsRow>(find.byType(RatingsRow));
    expect(row.showLabels, isFalse);
    expect(row.showBadges, isTrue);
  });

  testWidgets('the ratings run wider than the hero text measure', (
    tester,
  ) async {
    // Comfortably past the 680 the hero's text column caps at.
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1920, 1080);
    addTearDown(tester.view.reset);

    final vm = viewModel(
      'Movie',
      data: ratedMovie(community: 7.8, critic: 91),
    );
    await pumpContent(tester, vm, size: const Size(1920, 1080));

    final box = tester.renderObject(find.byType(RatingsRow)) as RenderBox;
    expect(box.constraints.maxWidth, greaterThan(1000));
  });

  testWidgets('a score the viewer set alone is enough to draw the row', (
    tester,
  ) async {
    final vm = viewModel('Movie', data: ratedMovie(personal: 9.0));
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsOneWidget);
  });

  testWidgets('an unrated item draws no row at all', (tester) async {
    final vm = viewModel('Movie');
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsNothing);
  });

  testWidgets('series and season expose episodes, movie and episode do not', (
    tester,
  ) async {
    for (final type in ['Series', 'Season']) {
      final vm = viewModel(type);
      await pumpContent(tester, vm);
      expect(
        find.byKey(const ValueKey('nouveau-section-episodes')),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    }

    for (final type in ['Movie', 'Episode']) {
      final vm = viewModel(type);
      await pumpContent(tester, vm);
      expect(
        find.byKey(const ValueKey('nouveau-section-episodes')),
        findsNothing,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    }
  });

  // Movie and Episode are the types that actually carry chapters, and every
  // other detail style shows them on the strength of the list alone.
  testWidgets('chapters show for any item that has them', (tester) async {
    final chapter = {'StartPositionTicks': 1000, 'Name': 'Chapter one'};
    for (final type in ['Movie', 'Episode', 'Video']) {
      await pumpContent(
        tester,
        viewModel(type, data: itemData(type, chapters: [chapter])),
      );
      expect(
        find.byKey(const ValueKey('nouveau-section-chapters')),
        findsOneWidget,
        reason: '$type carries chapters, so the section belongs on screen',
      );
    }

    await pumpContent(tester, viewModel('Video'));
    expect(
      find.byKey(const ValueKey('nouveau-section-chapters')),
      findsNothing,
    );
  });

  testWidgets('collection, extras, discovery and people use their gates', (
    tester,
  ) async {
    final people = [
      {'Name': 'Actor', 'Type': 'Actor', 'Id': 'person-1'},
    ];
    final boxSet = viewModel('BoxSet');
    await pumpContent(tester, boxSet);
    expect(
      find.byKey(const ValueKey('nouveau-section-collection')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('nouveau-section-people')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('nouveau-section-extras')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('nouveau-section-discovery')),
      findsNothing,
    );

    final movie = viewModel('Movie', data: itemData('Movie', people: people));
    await pumpContent(tester, movie);
    expect(
      find.byKey(const ValueKey('nouveau-section-people')),
      findsOneWidget,
    );
  });

  testWidgets(
    'details remain present for normal items and Person uses its own flow',
    (tester) async {
      await pumpContent(tester, viewModel('Movie'));
      expect(
        find.byKey(const ValueKey('nouveau-section-details')),
        findsOneWidget,
      );
      expect(find.text('A useful detail overview'), findsOneWidget);

      await pumpContent(tester, viewModel('Person'));
      expect(
        find.byKey(const ValueKey('nouveau-section-details')),
        findsNothing,
      );
      expect(find.byType(NouveauPersonContent), findsOneWidget);
    },
  );

  // A 1080p TV reports 960x540 logical pixels. The page pins itself to the
  // top whenever the hero has focus, so an action row below the fold is
  // unreachable rather than merely off screen.
  testWidgets('the TV hero keeps its action row on screen', (tester) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));

    const tvSize = Size(960, 540);
    tester.view.physicalSize = tvSize;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // The badge row is off by default, but it is the tallest optional piece
    // of the hero, so it is the case that has to fit.
    await prefs.set(UserPreferences.detailShowTechnicalDetails, true);

    final vm = viewModel(
      'Movie',
      data: {
        ...itemData('Movie'),
        'Genres': const ['Horror', 'Thriller', 'Science Fiction'],
        'RunTimeTicks': 65400000000,
        'ProductionYear': 2026,
        'Overview':
            'Dr. Kelson finds himself in a shocking new relationship with '
            'consequences that could change the world as they know it and '
            'Spike encounter with Jimmy Crystal becomes a nightmare he '
            'cannot wake up from, running well past three lines of text.',
        'MediaSources': const [
          {
            'Size': 4738224128,
            'MediaStreams': [
              {
                'Type': 'Video',
                'Height': 1080,
                'Width': 1920,
                'Codec': 'hevc',
              },
              {
                'Type': 'Audio',
                'Codec': 'eac3',
                'Profile': 'Dolby Atmos',
                'Channels': 6,
              },
            ],
          },
        ],
      },
    );
    await pumpContent(tester, vm, size: tvSize);

    final actions = tester.getRect(find.byType(NouveauActionButtons).first);
    expect(actions.bottom, lessThanOrEqualTo(tvSize.height));
  });

  // Both read the same hero inset helper, and this is what holds them to it.
  // A copy of the formula on either side shows up here as a jump on load.
  testWidgets('the TV skeleton and content start their hero at the same place', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));

    const tvSize = Size(960, 540);
    tester.view.physicalSize = tvSize;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final vm = viewModel('Movie');
    await pumpContent(tester, vm, size: tvSize);
    final contentHeroTop = tester.getRect(find.byType(NouveauHero)).top;

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: tvSize),
        child: MaterialApp(
          theme: AppTheme.buildTheme(ThemeRegistry.active),
          home: const Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.nouveau),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    final skeletonHeroTop = tester.getRect(find.byType(SkeletonBox).first).top;

    expect(skeletonHeroTop, closeTo(contentHeroTop, 2.0));
  });

  testWidgets('null metadata and empty rails render safely', (tester) async {
    final vm = viewModel(
      'Video',
      data: {'Id': 'item-1', 'Type': 'Video', 'Name': null, 'Chapters': null},
    );
    await pumpContent(tester, vm);
    expect(tester.takeException(), isNull);
    expect(
      find.byKey(const ValueKey('nouveau-section-details')),
      findsOneWidget,
    );
  });

  // The screen rebuilds its content when the hidden list changes, so these
  // flip the preference and rebuild in place.
  group('hidden sections', () {
    const tvSize = Size(1920, 1080);

    late FocusNode play;

    void useTv(WidgetTester tester) {
      PlatformDetection.setTvMode(true);
      addTearDown(() => PlatformDetection.setTvMode(false));
      tester.view.physicalSize = tvSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      play = FocusNode(debugLabel: 'play');
      addTearDown(play.dispose);
    }

    Future<void> hide(
      WidgetTester tester,
      ItemDetailViewModel vm,
      String ids,
    ) async {
      await prefs.set(detailSectionLayout.hiddenPreference, ids);
      await tester.pumpWidget(
        content(vm, initialFocusNode: play, size: tvSize),
      );
      await tester.pump(const Duration(milliseconds: 500));
    }

    Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
    }

    bool focusIn<T extends Widget>() {
      final context = FocusManager.instance.primaryFocus?.context;
      return context?.findAncestorWidgetOfExactType<T>() != null;
    }

    Future<void> focusPlay(WidgetTester tester) async {
      play.requestFocus();
      await tester.pump();
      expect(play.hasPrimaryFocus, isTrue);
    }

    // A lookup that landed with nothing the viewer can request or report.
    _SeerrViewModel seerrWith(SeerrMediaDetailState state) {
      final seerr = _SeerrViewModel();
      when(() => seerr.state).thenReturn(state);
      when(() => seerr.relatedLoadComplete).thenReturn(true);
      when(() => seerr.canRequest).thenReturn(false);
      when(() => seerr.canRequest4k).thenReturn(false);
      when(() => seerr.canRequestAdvanced).thenReturn(false);
      when(() => seerr.canManageRequests).thenReturn(false);
      when(() => seerr.canReportIssue).thenReturn(false);
      return seerr;
    }

    final actor = {'Name': 'Actor', 'Type': 'Actor', 'Id': 'person-1'};
    final chapter = {'StartPositionTicks': 1000, 'Name': 'Chapter one'};

    testWidgets('a hidden section leaves the chain and Down skips it', (
      tester,
    ) async {
      useTv(tester);
      final vm = viewModel(
        'Movie',
        data: {
          ...itemData('Movie', chapters: [chapter], people: [actor]),
          'Studios': const [
            {'Name': 'Studio One', 'Id': 'studio-1'},
          ],
        },
      );
      await pumpContent(tester, vm, initialFocusNode: play, size: tvSize);

      await focusPlay(tester);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauChaptersSection>(), isTrue);

      await hide(tester, vm, 'chapters');
      expect(
        find.byKey(const ValueKey('nouveau-section-chapters')),
        findsNothing,
      );

      await focusPlay(tester);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauPeopleSection>(), isTrue);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauDetailsSection>(), isTrue);

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focusIn<NouveauPeopleSection>(), isTrue);

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(play.hasPrimaryFocus, isTrue);

      // Cast was the only thing in the people rail, so it goes as a whole.
      await hide(tester, vm, 'chapters,cast');
      expect(
        find.byKey(const ValueKey('nouveau-section-people')),
        findsNothing,
      );

      await focusPlay(tester);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauDetailsSection>(), isTrue);
    });

    testWidgets('a details section with every group hidden leaves the chain', (
      tester,
    ) async {
      useTv(tester);
      final seerr = seerrWith(
        const SeerrMediaDetailState(
          movie: SeerrMovieDetails(
            id: 603,
            title: 'Movie title',
            status: 'Released',
            voteAverage: 8.1,
            genres: [SeerrGenre(id: 28, name: 'Action')],
          ),
          similar: [SeerrDiscoverItem(id: 604, title: 'Sequel')],
        ),
      );

      final vm = viewModel(
        'Movie',
        data: {
          ...itemData('Movie', people: [actor]),
          'Studios': const [
            {'Name': 'Studio One', 'Id': 'studio-1'},
          ],
          'MediaSources': const [
            {
              'Id': 'source-1',
              'Path': '/media/movie.mkv',
              'Container': 'mkv',
              'MediaStreams': [
                {'Type': 'Video', 'Codec': 'hevc'},
              ],
            },
          ],
        },
      )..seerrOverride = seerr;
      await pumpContent(tester, vm, initialFocusNode: play, size: tvSize);

      final details = tester.state<NouveauDetailsSectionState>(
        find.byType(NouveauDetailsSection),
      );
      expect(find.text('Studio One'), findsOneWidget);
      expect(find.byType(SeerrItemChips), findsOneWidget);
      expect(find.byType(SeerrStatsCard), findsOneWidget);
      expect(details.canFocusTop, isTrue);

      // The reading node was mounted for the stats and the file details, and
      // keeps its context after they go, which used to keep it in the chain.
      await hide(tester, vm, 'studios,seerrGenresTags,seerrStats,mediaInfo');
      expect(find.text('Studio One'), findsNothing);
      expect(find.byType(SeerrItemChips), findsNothing);
      expect(find.byType(SeerrStatsCard), findsNothing);
      expect(details.canFocusTop, isFalse);

      await focusPlay(tester);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauPeopleSection>(), isTrue);

      // The people rail is the last stop now, so Down stays put.
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusIn<NouveauPeopleSection>(), isTrue);
    });

    testWidgets('hidden Seerr recommendations stop stripping the related rail', (
      tester,
    ) async {
      when(() => plugin.seerrAvailable).thenReturn(true);

      AggregatedItem library(int index, {int? tmdb, String? name}) =>
          AggregatedItem(
            id: 'similar-$index',
            serverId: 'server',
            rawData: {
              'Id': 'similar-$index',
              'Name': name ?? 'Similar $index',
              'Type': 'Movie',
              'ProductionYear': 2000 + index,
              'ProviderIds': {'Tmdb': '${tmdb ?? 200 + index}'},
            },
          );

      // The first seven are the protected head of the rail. The two after it
      // are the tail, and one of them is also a Seerr recommendation.
      final similar = [
        for (var i = 0; i < 7; i++) library(i),
        library(7, tmdb: 900, name: 'Shared pick'),
        library(8),
      ];

      final seerr = seerrWith(
        const SeerrMediaDetailState(
          movie: SeerrMovieDetails(id: 100, title: 'Movie title'),
          recommendations: [
            SeerrDiscoverItem(id: 900, mediaType: 'movie', title: 'Shared'),
            SeerrDiscoverItem(id: 901, mediaType: 'movie', title: 'Both'),
          ],
          similar: [
            SeerrDiscoverItem(id: 901, mediaType: 'movie', title: 'Both'),
            SeerrDiscoverItem(id: 902, mediaType: 'movie', title: 'Only here'),
          ],
        ),
      );

      final vm =
          viewModel(
              'Movie',
              data: {
                ...itemData('Movie'),
                'ProviderIds': const {'Tmdb': '100'},
              },
            )
            ..similarOverride = similar
            ..seerrOverride = seerr;
      await pumpContent(tester, vm);

      List<List<String>> rails() => [
        for (final rail in tester.widgetList<NouveauDiscoveryRail>(
          find.byType(NouveauDiscoveryRail),
        ))
          [for (final item in rail.items) item.id],
      ];

      final head = [for (var i = 0; i < 7; i++) 'similar-$i'];

      expect(rails(), [
        [...head, 'similar-8', '902'],
        ['900', '901'],
      ]);

      await prefs.set(
        detailSectionLayout.hiddenPreference,
        'seerrRecommendations',
      );
      await tester.pumpWidget(content(vm));
      await tester.pump(const Duration(milliseconds: 500));

      expect(rails(), [
        [...head, 'similar-7', 'similar-8', '901', '902'],
      ]);
    });

    testWidgets('person tabs and the All fallback leave hidden credits out', (
      tester,
    ) async {
      AggregatedItem credit(String id, String type, {String? seriesId}) =>
          AggregatedItem(
            id: id,
            serverId: 'server',
            rawData: {
              'Id': id,
              'Name': 'Credit $id',
              'Type': type,
              'SeriesId': ?seriesId,
            },
          );

      List<String> tabs() {
        final selector = tester.widget<NouveauSegmentedSelector<Object?>>(
          find.byWidgetPredicate((w) => w is NouveauSegmentedSelector),
        );
        return [for (final tab in selector.values) (tab as Enum).name];
      }

      List<String> rail() => [
        for (final item in tester
            .widget<NouveauFilmographySection>(
              find.byType(NouveauFilmographySection),
            )
            .items)
          item.id,
      ];

      final vm = viewModel(
        'Person',
        data: {
          ...itemData('Person'),
          'ProductionLocations': const ['Springfield'],
        },
      )..filmographyOverride = [
          credit('movie-1', 'Movie'),
          credit('guest-1', 'Episode', seriesId: 'someone-elses-show'),
          credit('video-1', 'MusicVideo'),
        ];
      await pumpContent(tester, vm);

      expect(tabs(), ['movies', 'guestAppearances', 'musicVideos']);
      expect(find.text('A useful detail overview'), findsOneWidget);
      expect(find.text('Springfield'), findsOneWidget);

      await prefs.set(
        detailSectionLayout.hiddenPreference,
        'guestAppearances,musicVideos,biography,birthplace',
      );
      await tester.pumpWidget(content(vm));
      await tester.pump(const Duration(milliseconds: 500));

      expect(tabs(), ['movies']);
      expect(find.text('A useful detail overview'), findsNothing);
      expect(find.text('Springfield'), findsNothing);

      // Without the movie nothing visible is left, and the All tab used to
      // bring every credit back. It keeps only what no switch covers.
      vm.filmographyOverride = [
        credit('guest-1', 'Episode', seriesId: 'someone-elses-show'),
        credit('video-1', 'MusicVideo'),
        credit('trailer-1', 'Trailer'),
      ];
      await tester.pumpWidget(content(vm));
      await tester.pump(const Duration(milliseconds: 500));

      expect(tabs(), ['all']);
      expect(rail(), ['trailer-1']);

      vm.filmographyOverride = [
        credit('guest-1', 'Episode', seriesId: 'someone-elses-show'),
        credit('video-1', 'MusicVideo'),
      ];
      await tester.pumpWidget(content(vm));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byWidgetPredicate((w) => w is NouveauSegmentedSelector),
          findsNothing);
      expect(
        tester
            .state<NouveauPersonContentState>(
              find.byType(NouveauPersonContent),
            )
            .canFocusTop,
        isFalse,
      );
    });
  });
}
