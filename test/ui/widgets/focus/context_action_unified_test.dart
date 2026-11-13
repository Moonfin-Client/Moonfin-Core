import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/context_action.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

/// The active client and the factory's are two of these around one client.
class _WrappedClient extends Mock
    implements ConnectivityAwareMediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _Factory extends Mock implements MediaServerClientFactory {}

/// A movie shown from [shownOn], with a copy on server a and one on server
/// b, each under that server's own id.
///
/// [idOn] gives a server's copy another id, as when two servers hand out the
/// same one.
AggregatedItem _sharedMovie({
  String shownOn = 'a',
  bool played = false,
  bool favorite = false,
  Map<String, String> idOn = const {},
}) => AggregatedItem(
  id: idOn[shownOn] ?? '${shownOn}1',
  serverId: shownOn,
  rawData: {
    'Id': idOn[shownOn] ?? '${shownOn}1',
    'Type': 'Movie',
    'Name': 'Altovar',
    'UserData': {'Played': played, 'IsFavorite': favorite},
    unifiedServerIdKey: shownOn,
    unifiedCopiesKey: [
      for (final id in ['a', 'b'])
        UnifiedCopy(
          serverId: id,
          itemId: idOn[id] ?? '${id}1',
          serverName: 'Server $id',
          played: played,
          positionTicks: 0,
          playedPercentage: null,
          reachable: true,
        ).toJson(),
    ],
  },
);

AggregatedItem _singleServerMovie(String serverId) => AggregatedItem(
  id: 'h1',
  serverId: serverId,
  rawData: {
    'Id': 'h1',
    'Type': 'Movie',
    'Name': 'Hodrimel',
    'UserData': {'Played': false, 'IsFavorite': false},
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Map<String, _UserLibraryApi> libraries;
  late Map<String, _Client> clients;
  late _Factory factory;
  late UserRepository users;
  late UserPreferences prefs;

  void signIn({String serverId = 'a'}) => users.setCurrentUser(
    PrivateUser(
      id: 'u1',
      name: 'Test',
      serverId: serverId,
      accessToken: 'token',
      lastUsed: DateTime(2026),
      isAdministrator: true,
    ),
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    clients = {};
    libraries = {};
    for (final id in ['a', 'b']) {
      final client = _Client();
      final library = _UserLibraryApi();
      for (final call in [
        library.markPlayed,
        library.unmarkPlayed,
        library.markFavorite,
        library.unmarkFavorite,
      ]) {
        when(() => call(any())).thenAnswer((_) async {});
      }
      when(() => client.userLibraryApi).thenReturn(library);
      when(() => client.itemsApi).thenReturn(_ItemsApi());
      when(() => client.baseUrl).thenReturn('http://$id.example');
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      clients[id] = client;
      libraries[id] = library;
    }
    factory = _Factory();
    when(
      () => factory.getClientIfExists(any()),
    ).thenAnswer((invocation) => clients[invocation.positionalArguments.first]);
    when(() => factory.clientForServerOrActive(any())).thenAnswer(
      (invocation) =>
          clients[invocation.positionalArguments.first] ?? clients['a']!,
    );

    users = UserRepository();
    signIn();
    prefs = UserPreferences(store);

    GetIt.instance
      ..registerSingleton<MediaServerClient>(clients['a']!)
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..registerSingleton<UserRepository>(users)
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<ItemMutationRepository>(
        ItemMutationRepository(clients['a']!),
      );
  });

  tearDown(() async {
    userDataSync.reset();
    await GetIt.instance.reset();
  });

  /// A route pushed from the menu shows as `opened <uri>`.
  Future<List<ItemContextAction>> actionsFor(
    WidgetTester tester,
    AggregatedItem item, {
    VoidCallback? onChanged,
    bool isContinueWatchingOrNextUp = false,
  }) async {
    late List<ItemContextAction> actions;
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => Scaffold(
            body: Builder(
              builder: (context) {
                actions = contextActionsFor(
                  context,
                  item,
                  onChanged: onChanged,
                  isContinueWatchingOrNextUp: isContinueWatchingOrNextUp,
                );
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
      errorBuilder: (_, state) => Scaffold(body: Text('opened ${state.uri}')),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    return actions;
  }

  List<String> labelsOf(List<ItemContextAction> actions) => [
    for (final action in actions) action.label,
  ];

  Future<void> select(
    WidgetTester tester,
    AggregatedItem item,
    String label,
  ) async {
    final actions = await actionsFor(tester, item);
    await tester.runAsync(
      () => actions.firstWhere((action) => action.label == label).onSelect(),
    );
  }

  group('a title several servers hold', () {
    testWidgets('is marked watched on each server, under its own id', (
      tester,
    ) async {
      await select(tester, _sharedMovie(), 'Mark as Watched');

      verify(() => libraries['a']!.markPlayed('a1')).called(1);
      verify(() => libraries['b']!.markPlayed('b1')).called(1);
      verifyNever(() => libraries['a']!.markPlayed('b1'));
      verifyNever(() => libraries['b']!.markPlayed('a1'));
    });

    testWidgets('is marked unwatched on each server', (tester) async {
      await select(tester, _sharedMovie(played: true), 'Mark as Unwatched');

      verify(() => libraries['a']!.unmarkPlayed('a1')).called(1);
      verify(() => libraries['b']!.unmarkPlayed('b1')).called(1);
    });

    testWidgets('shown from the other server still reaches both', (
      tester,
    ) async {
      await select(tester, _sharedMovie(shownOn: 'b'), 'Mark as Watched');

      verify(() => libraries['a']!.markPlayed('a1')).called(1);
      verify(() => libraries['b']!.markPlayed('b1')).called(1);
    });

    testWidgets('is made a favorite on each server', (tester) async {
      await select(tester, _sharedMovie(), 'Add to Favorites');

      verify(() => libraries['a']!.markFavorite('a1')).called(1);
      verify(() => libraries['b']!.markFavorite('b1')).called(1);
    });

    testWidgets('stops being a favorite on each server', (tester) async {
      await select(
        tester,
        _sharedMovie(favorite: true),
        'Remove from Favorites',
      );

      verify(() => libraries['a']!.unmarkFavorite('a1')).called(1);
      verify(() => libraries['b']!.unmarkFavorite('b1')).called(1);
    });

    group('under the same id on both servers', () {
      const sameId = {'a': 'x1', 'b': 'x1'};

      testWidgets('is made a favorite on each server', (tester) async {
        await select(tester, _sharedMovie(idOn: sameId), 'Add to Favorites');

        verify(() => libraries['a']!.markFavorite('x1')).called(1);
        verify(() => libraries['b']!.markFavorite('x1')).called(1);
      });

      testWidgets('stops being a favorite on each server', (tester) async {
        await select(
          tester,
          _sharedMovie(idOn: sameId, favorite: true),
          'Remove from Favorites',
        );

        verify(() => libraries['a']!.unmarkFavorite('x1')).called(1);
        verify(() => libraries['b']!.unmarkFavorite('x1')).called(1);
      });

      testWidgets('is marked watched on each server', (tester) async {
        await select(tester, _sharedMovie(idOn: sameId), 'Mark as Watched');

        verify(() => libraries['a']!.markPlayed('x1')).called(1);
        verify(() => libraries['b']!.markPlayed('x1')).called(1);
      });

      testWidgets('names the server whose copy could not be changed', (
        tester,
      ) async {
        when(
          () => libraries['b']!.markFavorite(any()),
        ).thenThrow(Exception('offline'));

        await select(tester, _sharedMovie(idOn: sameId), 'Add to Favorites');
        await tester.pump();

        verify(() => libraries['a']!.markFavorite('x1')).called(1);
        expect(find.textContaining('Server b'), findsOneWidget);
        expect(find.textContaining('Server a'), findsNothing);
      });
    });

    testWidgets('is made a favorite on each server while another title '
        'there is being changed under one of its ids', (tester) async {
      // Server b's own title x1 is not a copy of this one.
      final actions = await actionsFor(
        tester,
        _sharedMovie(idOn: {'a': 'x1', 'b': 'x2'}),
      );

      await tester.runAsync(() async {
        // Made in here: one made under the test's fake clock never completes
        // for code waiting in real time.
        final unrelated = Completer<void>();
        when(
          () => libraries['b']!.markFavorite('x1'),
        ).thenAnswer((_) => unrelated.future);
        final other = ItemMutationRepository(
          clients['b']!,
        ).setFavorite('x1', isFavorite: true);
        await Future<void>.delayed(Duration.zero);
        final selected = actions
            .firstWhere((action) => action.label == 'Add to Favorites')
            .onSelect();
        await Future<void>.delayed(const Duration(milliseconds: 20));

        verify(() => libraries['a']!.markFavorite('x1')).called(1);
        verify(() => libraries['b']!.markFavorite('x2')).called(1);
        verify(() => libraries['b']!.markFavorite('x1')).called(1);
        unrelated.complete();
        await Future.wait<void>([other, Future.sync(() => selected)]);
      });
    });

    testWidgets('changes the servers that answer and names the one that '
        'did not', (tester) async {
      when(() => libraries['b']!.unmarkPlayed(any()))
          .thenAnswer((_) async => throw StateError('server b is down'));
      var changed = false;
      final actions = await actionsFor(
        tester,
        _sharedMovie(played: true),
        onChanged: () => changed = true,
      );

      await tester.runAsync(
        () => actions
            .firstWhere((action) => action.label == 'Mark as Unwatched')
            .onSelect(),
      );
      await tester.pump();

      verify(() => libraries['a']!.unmarkPlayed('a1')).called(1);
      verify(() => libraries['b']!.unmarkPlayed('b1')).called(1);
      expect(changed, isTrue);
      expect(find.text('Not changed on Server b'), findsOneWidget);
    });

    testWidgets('names every server in a message when none could be '
        'changed', (tester) async {
      for (final library in libraries.values) {
        when(() => library.unmarkPlayed(any()))
            .thenAnswer((_) async => throw StateError('down'));
      }
      var changed = false;
      final actions = await actionsFor(
        tester,
        _sharedMovie(played: true),
        onChanged: () => changed = true,
      );

      // The action must not throw: the menu has nowhere to show an error.
      await tester.runAsync(
        () => actions
            .firstWhere((action) => action.label == 'Mark as Unwatched')
            .onSelect(),
      );
      await tester.pump();

      expect(
        find.text('Not changed on Server a, Server b'),
        findsOneWidget,
      );
      expect(changed, isFalse);
    });

    testWidgets('names a server the app holds no client for', (tester) async {
      when(() => factory.getClientIfExists('b')).thenReturn(null);
      var changed = false;
      final actions = await actionsFor(
        tester,
        _sharedMovie(),
        onChanged: () => changed = true,
      );

      await tester.runAsync(
        () => actions
            .firstWhere((action) => action.label == 'Mark as Watched')
            .onSelect(),
      );
      await tester.pump();

      verify(() => libraries['a']!.markPlayed('a1')).called(1);
      verifyNever(() => libraries['b']!.markPlayed(any()));
      expect(changed, isTrue);
      expect(find.text('Not changed on Server b'), findsOneWidget);
      expect(find.textContaining('No client'), findsNothing);
    });

    testWidgets('Play opens the server picker before it plays', (
      tester,
    ) async {
      final actions = await actionsFor(tester, _sharedMovie());

      unawaited(actions.firstWhere((a) => a.label == 'Play').onSelect());
      await tester.pumpAndSettle();

      expect(find.textContaining('opened'), findsNothing);
      expect(find.text('Select Server'), findsOneWidget);

      await tester.tap(find.text('Server b'));
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
      expect(find.textContaining('serverId=b'), findsOneWidget);
      expect(find.textContaining('autoPlay=true'), findsOneWidget);
    });

    testWidgets('Play plays nothing when the server picker is dismissed', (
      tester,
    ) async {
      final actions = await actionsFor(tester, _sharedMovie());

      unawaited(actions.firstWhere((a) => a.label == 'Play').onSelect());
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();

      expect(find.text('Select Server'), findsNothing);
      expect(find.textContaining('opened'), findsNothing);
    });

    testWidgets('opening its details opens the server picker too', (
      tester,
    ) async {
      // On a play-on-select card the menu's first row opens the details.
      await prefs.set(
        UserPreferences.continueWatchingDefaultAction,
        ContinueWatchingDefaultAction.play,
      );
      final actions = await actionsFor(
        tester,
        _sharedMovie(),
        isContinueWatchingOrNextUp: true,
      );

      unawaited(actions.first.onSelect());
      await tester.pumpAndSettle();
      expect(find.text('Select Server'), findsOneWidget);

      await tester.tap(find.text('Server b'));
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
      expect(find.textContaining('autoPlay'), findsNothing);
    });
  });

  testWidgets('a title on one server is changed there alone', (tester) async {
    await select(tester, _singleServerMovie('b'), 'Mark as Watched');

    verify(() => libraries['b']!.markPlayed('h1')).called(1);
    verifyNever(() => libraries['a']!.markPlayed(any()));
  });

  group('a title whose server has no client', () {
    // Sent to the active server instead, its id could name another title
    // there.
    setUp(() {
      when(() => factory.getClientIfExists('b')).thenReturn(null);
    });

    /// A movie from a merged library that only server b holds.
    AggregatedItem onlyOnB({int positionTicks = 0}) => AggregatedItem(
      id: 'b1',
      serverId: 'b',
      rawData: {
        'Id': 'b1',
        'Type': 'Movie',
        'Name': 'Altovar',
        'UserData': {
          'Played': false,
          'IsFavorite': false,
          'PlaybackPositionTicks': positionTicks,
        },
        unifiedServerIdKey: 'b',
        unifiedCopiesKey: [
          UnifiedCopy(
            serverId: 'b',
            itemId: 'b1',
            serverName: 'Server b',
            played: false,
            positionTicks: positionTicks,
            playedPercentage: null,
            reachable: true,
          ).toJson(),
        ],
      },
    );

    Future<bool> selectAndReport(
      WidgetTester tester,
      AggregatedItem item,
      String label,
    ) async {
      var changed = false;
      final actions = await actionsFor(
        tester,
        item,
        onChanged: () => changed = true,
      );
      await tester.runAsync(
        () => actions.firstWhere((action) => action.label == label).onSelect(),
      );
      await tester.pump();
      return changed;
    }

    void expectNothingSent() {
      for (final library in libraries.values) {
        verifyNever(() => library.markPlayed(any()));
        verifyNever(() => library.unmarkPlayed(any()));
        verifyNever(() => library.markFavorite(any()));
      }
    }

    testWidgets('is not marked watched on the active server', (tester) async {
      final changed = await selectAndReport(
        tester,
        onlyOnB(),
        'Mark as Watched',
      );

      expectNothingSent();
      expect(changed, isFalse);
      expect(find.text('Not changed on Server b'), findsOneWidget);
    });

    testWidgets('is not made a favorite on the active server', (tester) async {
      await selectAndReport(tester, onlyOnB(), 'Add to Favorites');

      expectNothingSent();
      expect(find.text('Not changed on Server b'), findsOneWidget);
    });

    testWidgets('shown from that server still changes the other copy', (
      tester,
    ) async {
      final changed = await selectAndReport(
        tester,
        _sharedMovie(shownOn: 'b'),
        'Mark as Watched',
      );

      verify(() => libraries['a']!.markPlayed('a1')).called(1);
      verifyNever(() => libraries['a']!.markPlayed('b1'));
      expect(changed, isTrue);
      expect(find.text('Not changed on Server b'), findsOneWidget);
    });

    testWidgets('keeps its progress on the active server when hidden from '
        'Continue Watching', (tester) async {
      await selectAndReport(
        tester,
        onlyOnB(positionTicks: 600),
        'Hide from Continue Watching',
      );

      expectNothingSent();
    });

    testWidgets('is left alone when only the stored servers name it', (
      tester,
    ) async {
      // A card outside a merged library carries no copies to name its server.
      final store = AuthenticationStore();
      await store.putServer(
        Server(
          id: 'b',
          name: 'Brindlemoor',
          address: 'http://b.example',
          version: '1',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
        ),
      );
      GetIt.instance.registerSingleton<AuthenticationStore>(store);

      await selectAndReport(tester, _singleServerMovie('b'), 'Mark as Watched');

      expectNothingSent();
      expect(find.text('Not changed on Brindlemoor'), findsOneWidget);
    });

    testWidgets('still goes to the active server when nothing says it is '
        'another server\'s', (tester) async {
      // Search results carry the id the server gives itself, which no client
      // and no stored server goes by. They are the active server's.
      final changed = await selectAndReport(
        tester,
        _singleServerMovie('id-the-server-gives-itself'),
        'Mark as Watched',
      );

      verify(() => libraries['a']!.markPlayed('h1')).called(1);
      expect(changed, isTrue);
      expect(find.textContaining('Not changed'), findsNothing);
    });
  });

  testWidgets('Play on a title on one server plays it straight away', (
    tester,
  ) async {
    final actions = await actionsFor(tester, _singleServerMovie('b'));

    unawaited(actions.firstWhere((a) => a.label == 'Play').onSelect());
    await tester.pumpAndSettle();

    expect(find.byType(Dialog), findsNothing);
    expect(find.textContaining('opened /item/h1'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
    expect(find.textContaining('autoPlay=true'), findsOneWidget);
  });

  group('admin actions', () {
    const adminLabels = ['Refresh Metadata', 'Identify', 'Change Artwork'];

    testWidgets('are offered for the signed-in server\'s item', (tester) async {
      final labels = labelsOf(await actionsFor(tester, _sharedMovie()));

      expect(labels, containsAll(adminLabels));
    });

    testWidgets('are offered for an item named by that server\'s address', (
      tester,
    ) async {
      // How a single server's library names its items.
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('http://a.example')),
      );

      expect(labels, containsAll(adminLabels));
    });

    testWidgets('are offered for an item that names no server', (tester) async {
      // An item with no server came from the one being browsed.
      when(() => factory.getClientIfExists('')).thenReturn(null);

      final labels = labelsOf(await actionsFor(tester, _singleServerMovie('')));

      expect(labels, containsAll(adminLabels));
    });

    testWidgets('are left out for another server\'s item', (tester) async {
      final labels = labelsOf(
        await actionsFor(tester, _sharedMovie(shownOn: 'b')),
      );

      for (final label in adminLabels) {
        expect(labels, isNot(contains(label)));
      }
      expect(labels, contains('Mark as Watched'));
    });

    testWidgets('are left out for an item whose server has no client', (
      tester,
    ) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('gone')),
      );

      for (final label in adminLabels) {
        expect(labels, isNot(contains(label)));
      }
      expect(labels, contains('Mark as Watched'));
    });
  });

  group('the collection permission', () {
    // Only a card that names its server by the id the user is signed in under
    // needs the permission. A Home row's cards name the server by its address.
    setUp(() {
      users.setCurrentUser(
        PrivateUser(
          id: 'u1',
          name: 'Test',
          serverId: 'a',
          accessToken: 'token',
          lastUsed: DateTime(2026),
        ),
      );
    });

    testWidgets('is needed for a card named by the server\'s id', (
      tester,
    ) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('a')),
      );

      expect(labels, isNot(contains('Add to Collection')));
    });

    testWidgets('is not asked of a card named by the server\'s address', (
      tester,
    ) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('http://a.example')),
      );

      expect(labels, contains('Add to Collection'));
    });

    testWidgets('is not asked of a card that names no server', (tester) async {
      when(() => factory.getClientIfExists('')).thenReturn(null);

      final labels = labelsOf(await actionsFor(tester, _singleServerMovie('')));

      expect(labels, contains('Add to Collection'));
    });

    testWidgets('is not asked of another server\'s card', (tester) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('b')),
      );

      expect(labels, contains('Add to Collection'));
    });

    testWidgets('lets through a user who holds it', (tester) async {
      users.setCurrentUser(
        PrivateUser(
          id: 'u1',
          name: 'Test',
          serverId: 'a',
          accessToken: 'token',
          lastUsed: DateTime(2026),
          canManageCollections: true,
        ),
      );

      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('a')),
      );

      expect(labels, contains('Add to Collection'));
    });
  });

  group('with the app\'s own clients', () {
    // The active client and the factory's are separate wrappers around one
    // client. The user is known by the server's id and the item by the app's,
    // so only the clients can say the item is the signed-in server's.
    late _UserLibraryApi registered;

    setUp(() async {
      final active = _WrappedClient();
      final fromFactory = _WrappedClient();
      for (final wrapper in [active, fromFactory]) {
        when(() => wrapper.onlineClient).thenReturn(clients['a']!);
        when(() => wrapper.baseUrl).thenReturn('http://elsewhere.example');
        when(() => wrapper.serverType).thenReturn(ServerType.jellyfin);
        when(() => wrapper.itemsApi).thenReturn(_ItemsApi());
        when(() => wrapper.userLibraryApi).thenReturn(libraries['a']!);
      }
      when(() => factory.getClientIfExists('a')).thenReturn(fromFactory);
      signIn(serverId: 'the-servers-own-id');

      final registeredClient = _Client();
      registered = _UserLibraryApi();
      when(() => registered.markPlayed(any())).thenAnswer((_) async {});
      when(() => registeredClient.userLibraryApi).thenReturn(registered);
      final getIt = GetIt.instance;
      await getIt.unregister<MediaServerClient>();
      await getIt.unregister<ItemMutationRepository>();
      getIt
        ..registerSingleton<MediaServerClient>(active)
        ..registerSingleton<ItemMutationRepository>(
          ItemMutationRepository(registeredClient),
        );
    });

    testWidgets('the signed-in server\'s item keeps its admin actions', (
      tester,
    ) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('a')),
      );

      expect(
        labels,
        containsAll(['Refresh Metadata', 'Identify', 'Change Artwork']),
      );
    });

    testWidgets('and is changed through the registered repository', (
      tester,
    ) async {
      await select(tester, _singleServerMovie('a'), 'Mark as Watched');

      verify(() => registered.markPlayed('h1')).called(1);
      verifyNever(() => libraries['a']!.markPlayed(any()));
    });

    testWidgets('another server\'s item still goes to its own server', (
      tester,
    ) async {
      final labels = labelsOf(
        await actionsFor(tester, _singleServerMovie('b')),
      );
      expect(labels, isNot(contains('Refresh Metadata')));

      await select(tester, _singleServerMovie('b'), 'Mark as Watched');

      verify(() => libraries['b']!.markPlayed('h1')).called(1);
      verifyNever(() => registered.markPlayed(any()));
    });
  });
}
