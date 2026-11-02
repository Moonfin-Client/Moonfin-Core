import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/screens/detail/premiere/premiere_detail_content.dart';
import 'package:moonfin/ui/screens/detail/stage/stage_track_chips.dart';
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
            // The detail screen rebuilds this whenever either one changes.
            body: ListenableBuilder(
              listenable: Listenable.merge([vm, prefs]),
              builder: (context, _) => PremiereDetailContent(
                viewModel: vm,
                prefs: prefs,
                backdropUrl: ValueNotifier<String?>(null),
                selectedMediaSourceId: null,
                onSelectedMediaSourceChanged: (_) {},
                initialFocusNode: playNode,
                actionsExpanded: false,
                onActionsExpandedChanged: (_) {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 500));
  }

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
        {'Id': 'source-1', 'Name': '4K', 'MediaStreams': streams},
      ],
    };
  }

  testWidgets('a movie centers its title over the backdrop', (tester) async {
    final vm = viewModel('Movie', data: movieWithTracks());
    await pumpContent(tester, vm);

    expect(find.byKey(const ValueKey('premiere-hero')), findsOneWidget);
    expect(find.text('MOVIE TITLE'), findsOneWidget);
  });

  testWidgets('the tracks get a section of their own', (tester) async {
    final vm = viewModel('Movie', data: movieWithTracks());
    await pumpContent(tester, vm);
    await tester.pump();

    expect(find.byType(StageTrackChips), findsOneWidget);
    expect(find.text('English TrueHD 7.1'), findsOneWidget);
  });

  testWidgets('down from the buttons enters the first section, up comes back', (
    tester,
  ) async {
    final play = FocusNode(debugLabel: 'play');
    addTearDown(play.dispose);
    final vm = viewModel('Movie', data: movieWithTracks());
    await pumpContent(tester, vm, playNode: play);
    await tester.pump();

    play.requestFocus();
    await tester.pump();
    expect(play.hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump(const Duration(milliseconds: 400));
    final chips = find.byType(StageTrackChips);
    expect(
      Focus.of(
        tester.element(
          find.descendant(of: chips, matching: find.byType(Text)).first,
        ),
      ).hasFocus,
      isTrue,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump(const Duration(milliseconds: 400));
    expect(play.hasPrimaryFocus, isTrue);
  });

  testWidgets('a TV shows the whole overview unless there is no room', (
    tester,
  ) async {
    final overview = List.filled(12, 'A longer overview runs on.').join(' ');
    await pumpContent(
      tester,
      viewModel('Movie', data: {...itemData('Movie'), 'Overview': overview}),
    );
    expect(
      tester
          .renderObject<RenderParagraph>(find.text(overview))
          .didExceedMaxLines,
      isFalse,
    );

    final endless = List.filled(300, 'An endless overview runs on.').join(' ');
    await pumpContent(
      tester,
      viewModel('Movie', data: {...itemData('Movie'), 'Overview': endless}),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('MOVIE TITLE'), findsOneWidget);
    expect(
      tester
          .renderObject<RenderParagraph>(find.text(endless))
          .didExceedMaxLines,
      isTrue,
    );
  });

  testWidgets('a phone stacks the page without overflowing', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    final vm = viewModel('Movie', data: movieWithTracks());
    await pumpContent(tester, vm, size: const Size(390, 844));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byKey(const ValueKey('premiere-hero')), findsOneWidget);
    expect(find.byType(StageTrackChips), findsOneWidget);
  });
}
