import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DetailCollectionsDisplay;
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
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

// Classic chains its sections by hand: each row is told which row sits above
// and below it. Switching a section off has to take it out of that chain too,
// or the row next to it keeps pointing at something that isn't there and the
// remote stops moving.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    client = _Client();
    itemsApi = _ItemsApi();
    final userLibrary = _UserLibraryApi();
    when(() => userLibrary.supportsNumericUserRatings).thenReturn(false);

    final plugin = _PluginSync();
    when(() => plugin.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(plugin);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    GetIt.instance.registerSingleton<PlaybackManager>(_PlaybackManager());
    GetIt.instance.registerSingleton<OfflineRepository>(_OfflineRepository());
    when(() => GetIt.instance<PlaybackManager>().queueService)
        .thenReturn(_QueueService());
    when(() => GetIt.instance<OfflineRepository>().getItem(any()))
        .thenAnswer((_) async => null);
    final seerrStore = PreferenceStore();
    await seerrStore.init();
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(seerrStore, _SessionRepository()),
    );

    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibrary);
    final imageApi = _ImageApi();
    when(
      () => imageApi.getChapterImageUrl(
        any(),
        index: any(named: 'index'),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('');
    when(() => client.imageApi).thenReturn(imageApi);
    when(() => client.baseUrl).thenReturn('http://test-server');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    GetIt.instance.registerSingleton<RowDataSource>(RowDataSource(client));
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    PlatformDetection.setTvMode(true);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  ItemDetailViewModel movie() {
    final raw = <String, dynamic>{
      'Id': 'item-1',
      'Name': 'Movie title',
      'Type': 'Movie',
      'ProviderIds': const {},
      'Chapters': const [
        {'StartPositionTicks': 0, 'Name': 'Opening'},
        {'StartPositionTicks': 6000000000, 'Name': 'Middle'},
      ],
      'People': const [
        {'Name': 'Director', 'Type': 'Director', 'Id': 'person-1'},
        {'Name': 'Lead', 'Type': 'Actor', 'Id': 'person-2'},
        {'Name': 'Support', 'Type': 'Actor', 'Id': 'person-3'},
      ],
    };
    when(() => itemsApi.getItem('item-1')).thenAnswer((_) async => raw);
    when(
      () => itemsApi.getItem(
        'item-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer((_) async => raw);
    return ItemDetailViewModel(
      itemId: 'item-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, TmdbRepository(client)),
      tmdbRepository: TmdbRepository(client),
    );
  }

  Future<void> hide(List<DetailSection> sections) => prefs.set(
    detailSectionLayout.hiddenPreference,
    sections.map((s) => s.id).join(','),
  );

  /// Files the movie under one collection holding it and [others].
  void inCollection(List<String> others) {
    when(() => itemsApi.getAncestors('item-1')).thenAnswer(
      (_) async => [
        {'Id': 'box-1', 'Type': 'BoxSet', 'Name': 'James Bond Collection'},
      ],
    );
    when(
      () => itemsApi.getItems(
        parentId: 'box-1',
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          for (final id in ['item-1', ...others])
            {'Id': id, 'Type': 'Movie', 'Name': id},
        ],
      },
    );
  }

  Future<FocusNode> pumpMovie(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final vm = movie();
    await vm.load();
    final play = FocusNode(debugLabel: 'play');
    addTearDown(play.dispose);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: classicDetailContentForTesting(
            viewModel: vm,
            prefs: prefs,
            initialFocusNode: play,
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 500));
    play.requestFocus();
    await tester.pump(const Duration(milliseconds: 100));
    return play;
  }

  Future<String?> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    // A move scrolls the page and can wait a frame for the row to lay out.
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    return FocusManager.instance.primaryFocus?.debugLabel;
  }

  testWidgets('with everything on, Down walks crew, chapters, then cast', (
    tester,
  ) async {
    await pumpMovie(tester);

    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieMetadata',
    );
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailFirstChapter',
    );
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCast',
    );
    // The last row stops Down rather than letting it wander.
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCast',
    );
    expect(
      await press(tester, LogicalKeyboardKey.arrowUp),
      'detailFirstChapter',
    );
  });

  testWidgets('hidden sections are skipped in both directions', (tester) async {
    await hide([DetailSection.crew, DetailSection.chapters]);
    await pumpMovie(tester);

    expect(find.byType(DetailMetadataSection), findsNothing);
    expect(find.byType(DetailChaptersRow), findsNothing);
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCast',
    );
    expect(await press(tester, LogicalKeyboardKey.arrowUp), 'play');
  });

  testWidgets('hiding the last row makes the one above it the end', (
    tester,
  ) async {
    await hide([DetailSection.cast]);
    await pumpMovie(tester);

    expect(find.byType(DetailCastRow), findsNothing);
    await press(tester, LogicalKeyboardKey.arrowDown);
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailFirstChapter',
    );
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailFirstChapter',
    );
  });

  testWidgets('switching a section off while the page is open rewires it', (
    tester,
  ) async {
    await pumpMovie(tester);
    expect(find.byType(DetailChaptersRow), findsOneWidget);

    await hide([DetailSection.crew, DetailSection.chapters]);
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(DetailChaptersRow), findsNothing);
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCast',
    );
  });

  testWidgets('a collection row lists the other titles, not the open movie', (
    tester,
  ) async {
    inCollection(const ['movie-2']);
    await pumpMovie(tester);

    for (var i = 0; i < 3; i++) {
      await press(tester, LogicalKeyboardKey.arrowDown);
    }
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCollection:box-1',
    );
    expect(find.text('James Bond Collection'), findsOneWidget);
    expect(find.text('movie-2'), findsWidgets);
    expect(find.text('item-1'), findsNothing);
  });

  testWidgets('a collection holding only the open movie gets no row', (
    tester,
  ) async {
    inCollection(const []);
    await pumpMovie(tester);

    for (var i = 0; i < 3; i++) {
      await press(tester, LogicalKeyboardKey.arrowDown);
    }
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCast',
    );
    expect(find.text('James Bond Collection'), findsNothing);
  });

  testWidgets('as collection cards, the collection opens from its own row', (
    tester,
  ) async {
    await prefs.set(
      UserPreferences.detailCollectionsDisplay,
      DetailCollectionsDisplay.cards,
    );
    inCollection(const ['movie-2']);
    await pumpMovie(tester);

    for (var i = 0; i < 3; i++) {
      await press(tester, LogicalKeyboardKey.arrowDown);
    }
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieCollections',
    );
    expect(
      await press(tester, LogicalKeyboardKey.arrowDown),
      'detailMovieMoreFrom:box-1',
    );
    expect(find.text('More from James Bond Collection'), findsOneWidget);
  });
}
