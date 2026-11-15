import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/utils/merged_copies.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/context_action.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

class _MockFactory extends Mock implements MediaServerClientFactory {}

class _MockAuthStore extends Mock implements AuthenticationStore {}

class _ItemsApi extends Mock implements ItemsApi {}

Server _server(String id) => Server(
  id: id,
  name: 'Server $id',
  address: 'http://$id',
  version: '10.11.0',
  serverType: ServerType.emby,
  dateAdded: DateTime(2026),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, _MockUserLibraryApi> libraries;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    libraries = {};
    final factory = _MockFactory();
    for (final serverId in ['a', 'b']) {
      final api = _MockUserLibraryApi();
      when(() => api.markFavorite(any())).thenAnswer((_) async {});
      final client = _MockClient();
      when(() => client.userLibraryApi).thenReturn(api);
      when(() => client.serverType).thenReturn(ServerType.emby);
      when(() => client.baseUrl).thenReturn('http://$serverId');
      when(() => client.itemsApi).thenReturn(_ItemsApi());
      when(() => factory.clientForServerOrActive(serverId)).thenReturn(client);
      libraries[serverId] = api;
      if (serverId == 'a') {
        GetIt.instance.registerSingleton<MediaServerClient>(client);
        GetIt.instance.registerSingleton<ItemMutationRepository>(
          ItemMutationRepository(client),
        );
      }
    }
    final auth = _MockAuthStore();
    when(auth.getServers).thenReturn([_server('a'), _server('b')]);

    final users = UserRepository();
    users.setCurrentUser(
      PrivateUser(
        id: 'u1',
        name: 'Test',
        serverId: 'a',
        accessToken: 'token',
        lastUsed: DateTime(2026),
      ),
    );
    GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
    GetIt.instance.registerSingleton<AuthenticationStore>(auth);
    GetIt.instance.registerSingleton<UserRepository>(users);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  /// One title both servers hold, under the same numeric id unless [idOnB]
  /// says otherwise, as Emby's ids often are.
  AggregatedItem sharedTitle(String id, {String? idOnB}) {
    AggregatedItem copy(String serverId, String copyId) => AggregatedItem(
      id: copyId,
      serverId: serverId,
      rawData: {
        'Id': copyId,
        'Type': 'Movie',
        'Name': 'Movie',
        'ProviderIds': {'Tmdb': '603'},
        'UserData': {'IsFavorite': false},
      },
    );
    return foldCopies([copy('a', id), copy('b', idOnB ?? id)]).single;
  }

  Future<void> select(WidgetTester tester, AggregatedItem item) async {
    late List<ItemContextAction> actions;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              actions = contextActionsFor(context, item);
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
    await actions.firstWhere((a) => a.label == 'Add to Favorites').onSelect();
    await tester.pump();
  }

  testWidgets('a favorite reaches every server even when the ids match', (
    tester,
  ) async {
    await select(tester, sharedTitle('7'));

    verify(() => libraries['a']!.markFavorite('7')).called(1);
    verify(() => libraries['b']!.markFavorite('7')).called(1);
    expect(userDataSync.favoriteFor('7'), isTrue);
  });

  testWidgets('a copy whose id another server already marked a favorite is '
      'still sent', (tester) async {
    // Another title on server a already uses the id of b's copy.
    userDataSync.publish('10', {'IsFavorite': true});

    await select(tester, sharedTitle('9', idOnB: '10'));

    verify(() => libraries['a']!.markFavorite('9')).called(1);
    verify(() => libraries['b']!.markFavorite('10')).called(1);
  });

  testWidgets('one server refusing keeps the other server\'s favorite and '
      'names the one that refused', (tester) async {
    when(() => libraries['a']!.markFavorite('8'))
        .thenThrow(StateError('refused'));

    await select(tester, sharedTitle('8'));

    verify(() => libraries['b']!.markFavorite('8')).called(1);
    expect(userDataSync.favoriteFor('8'), isTrue);
    expect(find.text('Not changed on Server a'), findsOneWidget);
  });
}
