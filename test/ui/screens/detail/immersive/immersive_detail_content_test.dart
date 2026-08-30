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
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/ui/screens/detail/immersive/immersive_detail_content.dart';
import 'package:moonfin/ui/screens/detail/immersive/person/immersive_person_content.dart';
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
    GetIt.instance.registerSingleton<RowDataSource>(RowDataSource(client));
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
            body: ImmersiveDetailContent(
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

  testWidgets('series and season expose episodes, movie and episode do not', (
    tester,
  ) async {
    for (final type in ['Series', 'Season']) {
      final vm = viewModel(type);
      await pumpContent(tester, vm);
      expect(
        find.byKey(const ValueKey('immersive-section-episodes')),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    }

    for (final type in ['Movie', 'Episode']) {
      final vm = viewModel(type);
      await pumpContent(tester, vm);
      expect(
        find.byKey(const ValueKey('immersive-section-episodes')),
        findsNothing,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    }
  });

  testWidgets(
    'chapters are excluded for media containers and shown for other types',
    (tester) async {
      final chapter = {'StartPositionTicks': 1000, 'Name': 'Chapter one'};
      for (final type in ['Movie', 'Episode', 'Series', 'Season']) {
        await pumpContent(
          tester,
          viewModel(type, data: itemData(type, chapters: [chapter])),
        );
        expect(
          find.byKey(const ValueKey('immersive-section-chapters')),
          findsNothing,
        );
      }

      await pumpContent(
        tester,
        viewModel('Video', data: itemData('Video', chapters: [chapter])),
      );
      expect(
        find.byKey(const ValueKey('immersive-section-chapters')),
        findsOneWidget,
      );

      await pumpContent(tester, viewModel('Video'));
      expect(
        find.byKey(const ValueKey('immersive-section-chapters')),
        findsNothing,
      );
    },
  );

  testWidgets('collection, extras, discovery and people use their gates', (
    tester,
  ) async {
    final people = [
      {'Name': 'Actor', 'Type': 'Actor', 'Id': 'person-1'},
    ];
    final boxSet = viewModel('BoxSet');
    await pumpContent(tester, boxSet);
    expect(
      find.byKey(const ValueKey('immersive-section-collection')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('immersive-section-people')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('immersive-section-extras')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('immersive-section-discovery')),
      findsNothing,
    );

    final movie = viewModel('Movie', data: itemData('Movie', people: people));
    await pumpContent(tester, movie);
    expect(
      find.byKey(const ValueKey('immersive-section-people')),
      findsOneWidget,
    );
  });

  testWidgets(
    'details remain present for normal items and Person uses its own flow',
    (tester) async {
      await pumpContent(tester, viewModel('Movie'));
      expect(
        find.byKey(const ValueKey('immersive-section-details')),
        findsOneWidget,
      );
      expect(find.text('A useful detail overview'), findsOneWidget);

      await pumpContent(tester, viewModel('Person'));
      expect(
        find.byKey(const ValueKey('immersive-section-details')),
        findsNothing,
      );
      expect(find.byType(ImmersivePersonContent), findsOneWidget);
    },
  );

  testWidgets('null metadata and empty rails render safely', (tester) async {
    final vm = viewModel(
      'Video',
      data: {'Id': 'item-1', 'Type': 'Video', 'Name': null, 'Chapters': null},
    );
    await pumpContent(tester, vm);
    expect(tester.takeException(), isNull);
    expect(
      find.byKey(const ValueKey('immersive-section-details')),
      findsOneWidget,
    );
  });
}
