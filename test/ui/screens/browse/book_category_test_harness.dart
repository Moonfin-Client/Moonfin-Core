import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/book_category_screen.dart';
import 'package:moonfin/ui/screens/browse/book_library_screen.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The book screens render inside the navigation chrome, so the whole chrome's
// dependency set has to be standing.
class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;

  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  @override
  bool get seerrAvailable => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockClient extends Mock implements MediaServerClient {}

class _FakeImageApi extends Fake implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxHeight,
    int? maxWidth,
    int? quality,
    String? tag,
  }) => 'http://server/Items/$itemId/Images/Primary';

  @override
  dynamic noSuchMethod(Invocation invocation) => '';
}

/// One title of the fake library.
Map<String, dynamic> bookTitle(
  String id,
  String name, {
  String type = 'Book',
  String author = 'Mara Ellison',
  String? series,
  int? index,
  List<String> genres = const ['Fantasy'],
  String added = '2024-01-01T00:00:00Z',
  double played = 0,
  bool finished = false,
  bool favorite = false,
}) => {
  'Id': id,
  'Name': name,
  'Type': type,
  'ServerId': 'server',
  'People': [
    {'Name': author, 'Type': 'Author', 'Id': 'person-$author'},
  ],
  'SeriesName': ?series,
  'IndexNumber': ?index,
  'Genres': genres,
  'DateCreated': added,
  if (type == 'AudioBook') 'RunTimeTicks': 36000000000,
  'ImageTags': {'Primary': 'tag-$id'},
  'UserData': {
    'PlayedPercentage': ?(played > 0 ? played : null),
    'Played': finished,
    'IsFavorite': favorite,
  },
};

/// A small mixed library of books and audiobooks: a series of three, two
/// authors, three genres, a collection, and a few favorites.
class FakeBookLibrary extends Fake implements ItemsApi {
  final List<Map<String, dynamic>> titles;
  final List<Map<String, dynamic>> artists;
  final Map<String, List<String>> collections;

  FakeBookLibrary({
    List<Map<String, dynamic>>? titles,
    this.artists = const [],
    Map<String, List<String>>? collections,
  }) : titles =
           titles ??
           [
             bookTitle(
               'lc1',
               'The Lantern Coast',
               series: 'Lantern',
               index: 1,
               finished: true,
               added: '2024-01-01T00:00:00Z',
             ),
             bookTitle(
               'lc2',
               'Tidewright',
               series: 'Lantern',
               index: 2,
               played: 42,
               favorite: true,
               added: '2024-02-01T00:00:00Z',
             ),
             bookTitle(
               'lc3',
               'The Glass Harbor',
               series: 'Lantern',
               index: 3,
               added: '2024-03-01T00:00:00Z',
             ),
             bookTitle(
               'ho1',
               'The Hollow House',
               type: 'AudioBook',
               author: 'August Lowe',
               genres: const ['Horror'],
               played: 35,
               favorite: true,
               added: '2024-04-01T00:00:00Z',
             ),
             bookTitle(
               'ma1',
               'What the Marsh Keeps',
               author: 'August Lowe',
               genres: const ['Horror', 'Mystery'],
               added: '2024-05-01T00:00:00Z',
             ),
           ],
       collections = collections ?? {'box-1': ['lc1', 'ho1']};

  static String _named(Symbol symbol) {
    final text = symbol.toString();
    return text.substring(8, text.length - 2);
  }

  Map<String, dynamic> _page(List<Map<String, dynamic>> items, Map args) {
    final start = args['startIndex'] as int? ?? 0;
    final limit = args['limit'] as int? ?? items.length;
    return {
      'Items': items.skip(start).take(limit).toList(),
      'TotalRecordCount': items.length,
    };
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final args = {
      for (final entry in invocation.namedArguments.entries)
        _named(entry.key): entry.value,
    };
    switch (_named(invocation.memberName)) {
      case 'getItem':
        final id = invocation.positionalArguments.first as String;
        if (id == 'lib-1') {
          return Future.value({
            'Id': 'lib-1',
            'Name': 'Books',
            'CollectionType': 'books',
          });
        }
        return Future.value(
          titles.firstWhere(
            (title) => title['Id'] == id,
            orElse: () => {'Id': id, 'Name': id},
          )..putIfAbsent('Overview', () => 'An overview of $id.'),
        );
      case 'getArtists':
        final favorites = args['isFavorite'] == true;
        return Future.value(
          _page([
            for (final artist in artists)
              if (!favorites ||
                  (artist['UserData'] as Map?)?['IsFavorite'] == true)
                artist,
          ], args),
        );
      case 'getGenres':
        final names = {
          for (final title in titles) ...(title['Genres'] as List),
        }.toList()..sort();
        return Future.value(
          _page([
            for (final name in names) {'Id': 'genre-$name', 'Name': name},
          ], args),
        );
      case 'getItems':
        return Future.value(_items(args));
    }
    return Future.value(const {'Items': <dynamic>[], 'TotalRecordCount': 0});
  }

  Map<String, dynamic> _items(Map<String, dynamic> args) {
    final types = (args['includeItemTypes'] as List?)?.cast<String>();
    final parent = args['parentId'] as String?;
    if (types != null && types.contains('BoxSet')) {
      return _page([
        for (final id in collections.keys)
          {
            'Id': id,
            'Name': 'Book Club',
            'Type': 'BoxSet',
            'Overview': 'This year\'s picks.',
            'ChildCount': collections[id]!.length,
          },
      ], args);
    }
    if (types != null && types.contains('Folder')) return _page(const [], args);
    var items = titles.where((title) {
      if (parent != null && collections.containsKey(parent)) {
        return collections[parent]!.contains(title['Id']);
      }
      return true;
    }).toList();
    if (types != null) {
      items = items.where((title) => types.contains(title['Type'])).toList();
    }
    if (args['isFavorite'] == true) {
      items = items
          .where((title) => (title['UserData'] as Map)['IsFavorite'] == true)
          .toList();
    }
    final genres = (args['genres'] as List?)?.cast<String>();
    if (genres != null) {
      items = items
          .where((title) => (title['Genres'] as List).any(genres.contains))
          .toList();
    }
    final filters = (args['filters'] as List?)?.cast<String>() ?? const [];
    if (filters.contains('IsResumable')) {
      items = items.where((title) {
        final data = title['UserData'] as Map;
        return data['PlayedPercentage'] != null && data['Played'] != true;
      }).toList();
    }
    if ((args['sortBy'] as String?)?.startsWith('DateCreated') ?? false) {
      items.sort(
        (a, b) => (b['DateCreated'] as String).compareTo(
          a['DateCreated'] as String,
        ),
      );
    }
    return _page(items, args);
  }
}

/// Stands up the chrome's dependencies around [library] and returns the user
/// preferences, for a test's setUp.
Future<UserPreferences> setUpBookScreens(FakeBookLibrary library) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);

  final client = _MockClient();
  when(() => client.baseUrl).thenReturn('http://server');
  when(() => client.userId).thenReturn('user-1');
  when(() => client.itemsApi).thenReturn(library);
  when(() => client.imageApi).thenReturn(_FakeImageApi());

  final getIt = GetIt.instance;
  getIt.registerSingleton<PreferenceStore>(store);
  getIt.registerSingleton<UserPreferences>(prefs);
  getIt.registerSingleton<UserRepository>(_FakeUserRepository());
  getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
  getIt.registerSingleton<PluginSyncService>(_FakePluginSyncService());
  getIt.registerSingleton<SeerrPreferences>(
    SeerrPreferences(store, _FakeSessionRepository()),
  );
  getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
  getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
  getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
  getIt.registerSingleton<MediaServerClient>(client);
  getIt.registerSingleton<RowDataSource>(RowDataSource(client));
  PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
  return prefs;
}

Future<void> tearDownBookScreens() async {
  PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
  NavigationLayout.chromeFocusRoots.clear();
  await GetIt.instance.reset();
}

/// The app showing [kind] of library `lib-1`, or the library itself when
/// [kind] is null. Anywhere a screen goes shows its address instead.
Widget bookScreenApp({BookCategoryKind? kind}) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => kind == null
            ? const BookLibraryScreen(libraryId: 'lib-1', collectionType: 'books')
            : BookCategoryScreen(
                libraryId: 'lib-1',
                kind: kind,
                collectionType: 'books',
              ),
      ),
    ],
    errorBuilder: (_, state) => Scaffold(body: Text(state.uri.toString())),
  );
  addTearDown(router.dispose);
  return MaterialApp.router(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: router,
  );
}

Future<void> pumpBookScreen(
  WidgetTester tester, {
  BookCategoryKind? kind,
}) async {
  await tester.pumpWidget(bookScreenApp(kind: kind));
  await tester.pumpAndSettle();
}

/// A desktop window the size a TV lays out at.
Future<void> pumpWideBookScreen(
  WidgetTester tester, {
  BookCategoryKind? kind,
}) async {
  tester.view.physicalSize = const Size(1920, 1080);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
  PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  await pumpBookScreen(tester, kind: kind);
}

String? focusedBookNode() => FocusManager.instance.primaryFocus?.debugLabel;

void focusBookNode(String label) => FocusManager.instance.rootScope.descendants
    .firstWhere((node) => node.debugLabel == label)
    .requestFocus();

Future<void> pressKey(WidgetTester tester, LogicalKeyboardKey key) async {
  await tester.sendKeyEvent(key);
  await tester.pumpAndSettle();
}
