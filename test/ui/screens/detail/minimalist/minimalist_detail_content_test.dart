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
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DesktopUiScale;
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/screens/detail/minimalist/minimalist_detail_content.dart';
import 'package:moonfin/ui/screens/detail/modern/modern_detail_content.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';
import 'package:moonfin/ui/widgets/sliding_pill_tabs.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
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
    // Minimalist hands non-video types to Spotlight, which asks for this.
    when(() => plugin.pluginAvailable).thenReturn(false);
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
    Size size = const Size(1200, 2200),
  }) async {
    // The surface as well as the MediaQuery. A faked MediaQuery alone steers
    // which layout the screen picks but leaves it laying out against the
    // default view, so anything sized from its own constraints gets measured
    // at a size no test asked for.
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = size;
    addTearDown(tester.view.reset);

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
            body: MinimalistDetailContent(
              viewModel: vm,
              prefs: prefs,
              backdropUrl: ValueNotifier<String?>(null),
              selectedMediaSourceId: null,
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

  Map<String, dynamic> ratedMovie() => {
    ...itemData('Movie'),
    'CommunityRating': 7.8,
    'CriticRating': 91,
  };

  testWidgets('a rated item gets a ratings row', (tester) async {
    final vm = viewModel('Movie', data: ratedMovie());
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsOneWidget);
    expect(find.text('7.8'), findsOneWidget);
  });

  testWidgets('the ratings run wider than the title measure', (tester) async {
    // Comfortably past the 760 the title and buttons cap at.
    final vm = viewModel('Movie', data: ratedMovie());
    await pumpContent(tester, vm, size: const Size(1920, 1080));

    final box = tester.renderObject(find.byType(RatingsRow)) as RenderBox;
    expect(box.constraints.maxWidth, greaterThan(1000));
  });

  testWidgets('Kids Mode takes the ratings away', (tester) async {
    await prefs.set(UserPreferences.kidsModeEnabled, true);

    final vm = viewModel('Movie', data: ratedMovie());
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsNothing);
  });

  testWidgets('an unrated item draws no row at all', (tester) async {
    final vm = viewModel('Movie');
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsNothing);
  });

  // A BoxSet falls through to Spotlight, which is the only route a test has to
  // that screen without standing a second harness up.
  testWidgets('Spotlight draws a row for a score the viewer set alone', (
    tester,
  ) async {
    final vm = viewModel('BoxSet', data: {
      ...itemData('BoxSet'),
      'UserData': {'Rating': 9.0},
    });
    await pumpContent(tester, vm);

    expect(find.byType(RatingsRow), findsOneWidget);
  });

  testWidgets('the screen is artwork, a title and the buttons', (tester) async {
    await pumpContent(tester, viewModel('Movie'));

    expect(find.byKey(const ValueKey('minimalist-branding')), findsOneWidget);
    expect(find.byKey(const ValueKey('minimalist-actions')), findsOneWidget);
  });

  testWidgets('a movie gets no episode rail and no season tabs', (tester) async {
    await pumpContent(tester, viewModel('Movie'));

    expect(find.byKey(const ValueKey('minimalist-episode-rail')), findsNothing);
    expect(find.byType(SlidingPillTabs), findsNothing);
  });

  testWidgets('what it leaves out, it leaves out for good', (tester) async {
    // The whole point of the style. A movie carrying people, chapters and
    // studios still renders none of them, so this fails the day someone adds
    // a cast row back in because the data was sitting right there.
    final data = itemData(
      'Movie',
      chapters: [
        {'Name': 'Chapter one', 'StartPositionTicks': 0},
        {'Name': 'Chapter two', 'StartPositionTicks': 6000000000},
      ],
      people: [
        {'Id': 'p1', 'Name': 'An actor', 'Type': 'Actor'},
        {'Id': 'p2', 'Name': 'A director', 'Type': 'Director'},
      ],
    );
    await pumpContent(tester, viewModel('Movie', data: data));

    expect(find.text('An actor'), findsNothing);
    expect(find.text('A director'), findsNothing);
    expect(find.text('Chapter one'), findsNothing);
    expect(find.text('A useful detail overview'), findsNothing);
  });

  testWidgets('a person falls through to a style that can draw one', (
    tester,
  ) async {
    // Minimalist covers video. Anything else would render as a blank screen
    // rather than an incomplete one, so it hands over instead.
    await pumpContent(tester, viewModel('Person'));

    expect(find.byKey(const ValueKey('minimalist-actions')), findsNothing);
  });

  testWidgets('an episode shows the show above its own name', (tester) async {
    final data = itemData('Episode')
      ..['Name'] = 'Robot Rampage'
      ..['SeriesName'] = 'The Backyardigans';
    await pumpContent(tester, viewModel('Episode', data: data));

    expect(find.byKey(const ValueKey('minimalist-branding')), findsOneWidget);
    final name = tester.widget<Text>(
      find.byKey(const ValueKey('minimalist-episode-name')),
    );
    expect(name.data, 'Robot Rampage');
    // Without a logo the show falls back to its name, so both lines show and
    // the episode isn't left looking like the whole series.
    expect(find.text('The Backyardigans'), findsOneWidget);
  });

  testWidgets('a movie gets no second line under its title', (tester) async {
    await pumpContent(tester, viewModel('Movie'));
    expect(find.byKey(const ValueKey('minimalist-episode-name')), findsNothing);
  });

  /// A series whose episodes span [seasons] seasons, three per season.
  ItemDetailViewModel seriesWithSeasons(int seasons) {
    final vm = viewModel('Series');
    final episodes = <Map<String, dynamic>>[
      for (var s = 1; s <= seasons; s++)
        for (var e = 1; e <= 3; e++)
          {
            'Id': 's${s}e$e',
            'Name': 'Episode $e',
            'Type': 'Episode',
            'IndexNumber': e,
            'ParentIndexNumber': s,
            'SeriesId': 'item-1',
          },
    ];
    when(
      () => itemsApi.getEpisodes(
        any(),
        seasonId: any(named: 'seasonId'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer((_) async => {'Items': episodes});
    return vm;
  }

  testWidgets('one season hides the tabs and still shows the episodes', (
    tester,
  ) async {
    await pumpContent(tester, seriesWithSeasons(1));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(SlidingPillTabs), findsNothing);
    expect(find.byKey(const ValueKey('minimalist-episode-rail')), findsOneWidget);
  });

  testWidgets('with the tabs gone the rail takes over as the way in', (
    tester,
  ) async {
    // Coming down from the play button aims at one node. If that node belongs
    // to tabs that are not on screen, the press escapes the screen entirely
    // and lands on the navbar.
    await pumpContent(tester, seriesWithSeasons(1));
    await tester.pump(const Duration(milliseconds: 500));

    final rail = tester.widget<LockedFocusRow<AggregatedItem>>(
      find.byType(LockedFocusRow<AggregatedItem>),
    );
    expect(rail.focusNode, isNotNull);
  });

  testWidgets('more than one season puts the entry on the tabs instead', (
    tester,
  ) async {
    await pumpContent(tester, seriesWithSeasons(3));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(SlidingPillTabs), findsOneWidget);
    final rail = tester.widget<LockedFocusRow<AggregatedItem>>(
      find.byType(LockedFocusRow<AggregatedItem>),
    );
    expect(rail.focusNode, isNull);
  });

  const landscape = Size(1600, 900);

  testWidgets('an episode shows its own still beside the title', (
    tester,
  ) async {
    final data = itemData('Episode')..['ImageTags'] = {'Primary': 'still-tag'};
    await pumpContent(tester, viewModel('Episode', data: data), size: landscape);

    expect(
      find.byKey(const ValueKey('minimalist-episode-still')),
      findsOneWidget,
    );
  });

  testWidgets('no still means no empty frame where one would go', (
    tester,
  ) async {
    await pumpContent(tester, viewModel('Episode'), size: landscape);
    expect(find.byKey(const ValueKey('minimalist-episode-still')), findsNothing);
  });

  testWidgets('the series thumbnail setting keeps the still off screen', (
    tester,
  ) async {
    // That preference exists to keep episode stills out of sight, so the one
    // place the still is largest has to honour it.
    await prefs.set(UserPreferences.detailUseSeriesThumbnails, true);
    final data = itemData('Episode')..['ImageTags'] = {'Primary': 'still-tag'};
    await pumpContent(tester, viewModel('Episode', data: data), size: landscape);

    expect(find.byKey(const ValueKey('minimalist-episode-still')), findsNothing);
  });

  testWidgets('a movie gets no still beside its title', (tester) async {
    final data = itemData('Movie')..['ImageTags'] = {'Primary': 'poster-tag'};
    await pumpContent(tester, viewModel('Movie', data: data), size: landscape);

    expect(find.byKey(const ValueKey('minimalist-episode-still')), findsNothing);
  });

  /// The canvas every TV normalizes to, and the raw one an Android TV reports
  /// on its own. The screen has to hold together on both.
  const tvCanvases = {
    'the normalized TV canvas': Size(1324, 745),
    'a raw 1080p Android TV canvas': Size(960, 540),
  };

  for (final entry in tvCanvases.entries) {
    testWidgets('the rail leaves the title and buttons alone on ${entry.key}', (
      tester,
    ) async {
      for (final scale in DesktopUiScale.values) {
        await prefs.set(UserPreferences.desktopUiScale, scale);
        await pumpContent(tester, seriesWithSeasons(3), size: entry.value);
        await tester.pump(const Duration(milliseconds: 500));

        // An overflow throws in a widget test, and an overflow here means
        // the rail has grown into the room the buttons above it are using.
        expect(
          tester.takeException(),
          isNull,
          reason: '${entry.key} at ${scale.name}',
        );

        final rail = tester.widget<LockedFocusRow<AggregatedItem>>(
          find.byType(LockedFocusRow<AggregatedItem>),
        );
        final tabs = tester.getRect(find.byType(SlidingPillTabs));
        final actions = tester.getRect(
          find.byKey(const ValueKey('minimalist-actions')),
        );
        expect(
          actions.bottom,
          lessThanOrEqualTo(tabs.top + 0.01),
          reason:
              'the buttons sat on the season tabs on '
              '${entry.key} at ${scale.name}',
        );

        // Everything the rail draws has to fit inside the height it declared,
        // or the row scrolls out of step with its own arithmetic.
        final railBox = tester.getSize(
          find.byKey(const ValueKey('minimalist-episode-rail')),
        );
        expect(
          railBox.height,
          closeTo(rail.height, 0.01),
          reason: '${entry.key} at ${scale.name}',
        );
      }
    });
  }

  testWidgets('a small canvas gets more than three cards', (tester) async {
    // A 1080p Android TV hands Flutter 960 points. A card sized for a wider
    // canvas takes better than a quarter of that, which fits three.
    await pumpContent(tester, seriesWithSeasons(3), size: const Size(960, 540));
    await tester.pump(const Duration(milliseconds: 500));

    final rail = tester.widget<LockedFocusRow<AggregatedItem>>(
      find.byType(LockedFocusRow<AggregatedItem>),
    );
    final railWidth = tester
        .getSize(find.byKey(const ValueKey('minimalist-episode-rail')))
        .width;
    final visible = railWidth / (rail.itemExtent + rail.itemSpacing);

    expect(rail.itemExtent, lessThan(266));
    expect(visible, greaterThan(4.0));
  });

  testWidgets('falls back to Modern for playlists', (tester) async {
    when(() => itemsApi.getPlaylistItems('item-1')).thenAnswer(
      (_) async => {'Items': []},
    );
    await pumpContent(tester, viewModel('Playlist'));
    await tester.pumpAndSettle();
    expect(find.byType(ModernDetailContent), findsOneWidget);
  });
}
