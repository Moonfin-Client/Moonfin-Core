import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DetailScreenStyle;
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/screens/detail/nouveau/hero/nouveau_action_buttons.dart';
import 'package:moonfin/ui/screens/detail/nouveau/hero/nouveau_hero.dart';
import 'package:moonfin/ui/screens/detail/nouveau/nouveau_detail_content.dart';
import 'package:moonfin/ui/screens/detail/nouveau/person/nouveau_person_content.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
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
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    client = _Client();
    itemsApi = _ItemsApi();
    prefs = await _preferences();
    final userLibrary = _UserLibraryApi();
    when(() => userLibrary.supportsNumericUserRatings).thenReturn(false);

    final plugin = _PluginSync();
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

  ItemDetailViewModel viewModel(String type, {Map<String, dynamic>? data}) {
    final vm = ItemDetailViewModel(
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
      MediaQuery(
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
      ),
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
}
