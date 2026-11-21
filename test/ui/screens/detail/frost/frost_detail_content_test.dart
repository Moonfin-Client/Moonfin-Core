import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DesktopUiScale, RecommendationSystemSource;
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/detail/frost/frost_detail_content.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_navbar.dart';
import 'package:moonfin/ui/widgets/offline_aware_image.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_image_urls.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
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

/// Answers every recommendation lookup with [items], the way the TMDb
/// Similarity source hands back titles from Seerr.
class _Recommendations extends RowDataSource {
  _Recommendations(super.client, this.items);

  final List<AggregatedItem> items;

  @override
  Future<List<AggregatedItem>> getRecommendations({
    required String serverId,
    required AggregatedItem baseItem,
    required bool isLocal,
    List<String>? candidateItemTypes,
    int limit = 15,
    bool? includeWatched,
  }) async => items;
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
    when(() => plugin.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(plugin);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    GetIt.instance.registerSingleton<PlaybackManager>(_PlaybackManager());
    GetIt.instance.registerSingleton<OfflineRepository>(_OfflineRepository());
    final playback = GetIt.instance<PlaybackManager>();
    when(() => playback.queueService).thenReturn(_QueueService());
    when(() => GetIt.instance<OfflineRepository>().getItem(any()))
        .thenAnswer((_) async => null);
    when(() => GetIt.instance<OfflineRepository>().getSeriesEpisodes(any()))
        .thenAnswer((_) async => const []);
    when(() => GetIt.instance<OfflineRepository>().getSeasonEpisodes(any()))
        .thenAnswer((_) async => const []);
    final seerrStore = PreferenceStore();
    await seerrStore.init();
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(seerrStore, _SessionRepository()),
    );

    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibrary);
    final imageApi = _ImageApi();
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://test-server/primary');
    when(
      () => imageApi.getLogoImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://test-server/logo');
    when(
      () => imageApi.getBackdropImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        index: any(named: 'index'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://test-server/backdrop');
    when(() => client.imageApi).thenReturn(imageApi);
    when(() => client.baseUrl).thenReturn('http://test-server');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    GetIt.instance.registerSingleton<RowDataSource>(RowDataSource(client));
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() => GetIt.instance.reset());

  Map<String, dynamic> itemData(String type) => {
    'Id': 'item-1',
    'Name': '$type title',
    'Type': type,
    'Overview': 'A useful detail overview',
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
    Size size = const Size(1920, 1080),
    FocusNode? playNode,
    double? bottomBar,
    List<String>? seerrPushes,
  }) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = size;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    await vm.load();
    Widget content(BuildContext context) => FrostDetailContent(
      viewModel: vm,
      prefs: prefs,
      onSelectedMediaSourceChanged: (_) {},
      initialFocusNode: playNode,
      actionsExpanded: false,
      onActionsExpandedChanged: (_) {},
    );
    final home = Scaffold(
      body: ListenableBuilder(
        listenable: Listenable.merge([vm, prefs]),
        builder: (context, _) => bottomBar == null
            ? content(context)
            : BottomNavInsetScope(
                height: bottomBar,
                child: Builder(builder: content),
              ),
      ),
    );
    final theme = AppTheme.buildTheme(ThemeRegistry.active);
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: size),
        // With [seerrPushes] the page sits under a router that records every
        // Seerr page it is asked to open.
        child: seerrPushes == null
            ? MaterialApp(
                theme: theme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: home,
              )
            : MaterialApp.router(
                theme: theme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: GoRouter(
                  routes: [
                    GoRoute(path: '/', builder: (_, _) => home),
                    GoRoute(
                      path: '/seerr/media/:id',
                      builder: (_, state) {
                        seerrPushes.add(state.uri.toString());
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 500));
  }

  bool hasFocus(WidgetTester tester, Finder finder) =>
      Focus.of(tester.element(finder)).hasFocus;

  Map<String, dynamic> movieWithTracks() {
    const streams = [
      {'Type': 'Video', 'Index': 0, 'Codec': 'hevc'},
      {
        'Type': 'Audio',
        'Index': 1,
        'DisplayTitle': 'English TrueHD 7.1',
        'Language': 'eng',
        'IsDefault': true,
      },
      {
        'Type': 'Audio',
        'Index': 2,
        'DisplayTitle': 'Spanish EAC3 5.1',
        'Language': 'spa',
      },
      {
        'Type': 'Subtitle',
        'Index': 3,
        'DisplayTitle': 'English SDH',
        'Language': 'eng',
      },
    ];
    return {
      ...itemData('Movie'),
      'MediaStreams': streams,
      'MediaSources': [
        {
          'Id': 'source-1',
          'Name': '4K',
          'Path': '/media/movies/Movie (2024)/Movie (2024) - 4K.mkv',
          'MediaStreams': streams,
        },
      ],
    };
  }

  testWidgets('a TV draws the title in its window with the tabs under it', (
    tester,
  ) async {
    await pumpContent(tester, viewModel('Movie', data: movieWithTracks()));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text('Movie title'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Details'), findsOneWidget);
    expect(find.text('English TrueHD 7.1'), findsOneWidget);
  });

  testWidgets('a TV draws its toolbar with every action button on screen', (
    tester,
  ) async {
    await prefs.set(UserPreferences.detailButtonsMaxVisible, -1);
    await pumpContent(tester, viewModel('Movie', data: movieWithTracks()));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(DetailActionButtons), findsOneWidget);
  });

  testWidgets('up from the toolbar enters the tab, down from it reaches the '
      'tab bar and right along the bar changes tab', (tester) async {
    final play = FocusNode(debugLabel: 'play');
    addTearDown(play.dispose);
    await pumpContent(
      tester,
      viewModel('Movie', data: movieWithTracks()),
      playNode: play,
    );
    await tester.pump();

    play.requestFocus();
    await tester.pump();
    expect(play.hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    expect(hasFocus(tester, find.text('A useful detail overview')), isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(play.hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(hasFocus(tester, find.text('Overview')), isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('A useful detail overview'), findsNothing);
    expect(find.text('MOVIE TITLE'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    expect(play.hasPrimaryFocus, isTrue);
  });

  testWidgets('a click on a tab opens it', (tester) async {
    await pumpContent(tester, viewModel('Movie', data: movieWithTracks()));
    await tester.pump();

    await tester.tap(find.text('Details'));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('A useful detail overview'), findsNothing);
    expect(find.text('MOVIE TITLE'), findsOneWidget);
  });

  testWidgets('the Details tab names the file', (tester) async {
    await pumpContent(tester, viewModel('Movie', data: movieWithTracks()));
    await tester.pump();

    await tester.tap(find.text('Details'));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Movie (2024) - 4K.mkv'), findsOneWidget);
  });

  testWidgets('a phone gets the sheet with its tabs across the top', (
    tester,
  ) async {
    await pumpContent(
      tester,
      viewModel('Movie', data: movieWithTracks()),
      size: const Size(390, 844),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text('Movie title'), findsOneWidget);
    expect(find.byType(DraggableScrollableSheet), findsOneWidget);
  });

  testWidgets('a Seerr title on the Similar tab shows its TMDb poster and '
      'request status, and opens its Seerr page', (tester) async {
    await prefs.set(
      UserPreferences.recommendationSystemSource,
      RecommendationSystemSource.online,
    );
    GetIt.instance.unregister<RowDataSource>();
    GetIt.instance.registerSingleton<RowDataSource>(
      _Recommendations(client, [
        AggregatedItem(
          id: '603',
          serverId: 'seerr',
          rawData: {
            'Name': 'Seerr title',
            'Type': 'Movie',
            'PosterPath': '/poster.jpg',
            'SeerrMediaType': 'movie',
            'SeerrStatus': SeerrMediaStatus.available,
          },
        ),
        AggregatedItem(
          id: '1399',
          serverId: 'seerr',
          rawData: {
            'Name': 'Seerr series',
            'Type': 'Series',
            'SeerrMediaType': 'tv',
          },
        ),
      ]),
    );
    final pushes = <String>[];
    await pumpContent(
      tester,
      viewModel('Movie', data: movieWithTracks()),
      size: const Size(390, 844),
      seerrPushes: pushes,
    );
    await tester.pump();

    await tester.tap(find.text('Similar'));
    await tester.pump(const Duration(milliseconds: 600));

    expect(tester.takeException(), isNull);
    expect(find.text('Seerr title'), findsOneWidget);
    expect(find.text('Available'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is OfflineAwareImage &&
            widget.imageUrl == '$seerrPosterBase/poster.jpg',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Seerr series'));
    await tester.pumpAndSettle();
    expect(pushes, [
      Destinations.seerrMedia('1399', mediaType: 'tv', title: 'Seerr series'),
    ]);
  });

  testWidgets('a phone keeps its buttons above the bottom navbar', (
    tester,
  ) async {
    await pumpContent(
      tester,
      viewModel('Movie', data: movieWithTracks()),
      size: const Size(390, 844),
      bottomBar: 96,
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(
      tester.getRect(find.byType(DetailActionButtons)).bottom,
      lessThanOrEqualTo(844 - 96),
    );
  });

  testWidgets('the stage sits above a bottom navbar and clear of its back '
      'button', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1280, 720);
    addTearDown(tester.view.reset);
    const stage = Key('stage');
    await tester.pumpWidget(
      const MaterialApp(
        home: BottomNavInsetScope(
          height: 100,
          child: FrostStage(navbarTop: false, child: SizedBox(key: stage)),
        ),
      ),
    );

    final rect = tester.getRect(find.byKey(stage));
    expect(rect.left, closeTo(72, 0.01));
    expect(rect.bottom, closeTo(620, 0.01));
  });

  test('the stage is 1280 by 720 at the least, in the room\'s own shape', () {
    expect(
      frostStageSize(const BoxConstraints.tightFor(width: 1920, height: 1080)),
      const Size(1280, 720),
    );
    final wide = frostStageSize(
      const BoxConstraints.tightFor(width: 1920, height: 900),
    );
    expect(wide.width, closeTo(1536, 0.01));
    expect(wide.height, closeTo(720, 0.01));
    final narrow = frostStageSize(
      const BoxConstraints.tightFor(width: 1800, height: 1080),
    );
    expect(narrow.width, closeTo(1280, 0.01));
    expect(narrow.height, closeTo(768, 0.01));
  });

  test('a window draws the stage at the UI scale while it fits', () {
    Size stage(double width, double height, double uiScale) => frostStageSize(
      BoxConstraints.tightFor(width: width, height: height),
      uiScale: uiScale,
      fill: false,
    );

    expect(stage(3840, 2160, 1), const Size(3840, 2160));
    final big = stage(3840, 2160, 1.6);
    expect(big.width, closeTo(2400, 0.01));
    expect(big.height, closeTo(1350, 0.01));
    final small = stage(3840, 2160, 0.9);
    expect(small.width, closeTo(4266.67, 0.01));
    expect(small.height, closeTo(2400, 0.01));
    // 1280 by 720 at 1.6 doesn't fit 1920 by 1080, so it fills the room.
    expect(stage(1920, 1080, 1.6), const Size(1280, 720));
    expect(stage(800, 600, 1).width, closeTo(1280, 0.01));
  });

  test('a TV fills its room at the default UI scale and only shrinks from '
      'there', () {
    Size stage(double uiScale) => frostStageSize(
      const BoxConstraints.tightFor(width: 1920, height: 1080),
      uiScale: uiScale,
    );

    expect(stage(1), const Size(1280, 720));
    expect(stage(1.6), const Size(1280, 720));
    final small = stage(0.9);
    expect(small.width, closeTo(1422.22, 0.01));
    expect(small.height, closeTo(800, 0.01));
  });

  group('text gives back the part of the UI scale the stage carries', () {
    const box = Key('box');
    late double textScale;

    Future<void> pumpStage(WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize = const Size(3840, 2160);
      addTearDown(tester.view.reset);
      await prefs.set(
        UserPreferences.desktopUiScale,
        DesktopUiScale.greatGrandparents,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(1.6)),
            child: FrostStage(
              navbarTop: false,
              child: Builder(
                builder: (context) {
                  textScale = MediaQuery.textScalerOf(context).scale(1);
                  return const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(key: box, width: 100, height: 100),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    group('on a desktop', () {
      setUp(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop),
      );
      tearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );

      testWidgets('the stage carries all of it', (tester) async {
        await pumpStage(tester);

        expect(textScale, closeTo(1, 0.001));
        expect(tester.getRect(find.byKey(box)).width, closeTo(160, 0.01));
      });
    });

    group('on a TV', () {
      setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.tv));
      tearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );

      testWidgets('the stage fills the room and the text keeps it', (
        tester,
      ) async {
        await pumpStage(tester);

        expect(textScale, closeTo(1.6, 0.001));
        expect(
          tester.getRect(find.byKey(box)).width,
          closeTo(100 * (3840 - 72) / 1280, 0.01),
        );
      });
    });
  });

  testWidgets('the ratings strip shares a width or keeps each column to its '
      'text', (tester) async {
    Widget strip() => RatingsRow(
      ratings: const {'imdb': 7.9},
      communityRating: 7.6,
      enableAdditionalRatings: true,
      enabledRatings: 'stars,imdb',
      columns: true,
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            SizedBox(width: 600, height: 80, child: strip()),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: strip(),
            ),
          ],
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('IMDB'), findsNWidgets(2));
    expect(find.text('7.9'), findsNWidgets(2));
  });
}
