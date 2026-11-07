import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/item_membership_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/context_action.dart';
import 'package:moonfin/ui/widgets/focus/context_menu_sheet.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockMutations extends Mock implements ItemMutationRepository {}

AggregatedItem _movie({String serverId = 'server-1'}) => AggregatedItem(
      id: 'movie-1',
      serverId: serverId,
      rawData: const {'Id': 'movie-1', 'Type': 'Movie', 'Name': 'Alpha'},
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late UserRepository users;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    client = _MockClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);

    users = UserRepository();

    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<UserRepository>(users);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<ItemMutationRepository>(_MockMutations());
  });

  tearDown(() => GetIt.instance.reset());

  void signIn({bool canManage = false, bool admin = false}) {
    users.setCurrentUser(
      PrivateUser(
        id: 'u1',
        name: 'Test',
        serverId: 'server-1',
        accessToken: 'token',
        lastUsed: DateTime(2026),
        isAdministrator: admin,
        canManageCollections: canManage,
      ),
    );
  }

  Future<List<ItemContextAction>> buildActions(
    WidgetTester tester, {
    List<ItemPlaylistMembership>? playlistMemberships,
    List<ItemCollectionMembership>? collectionMemberships,
    CollectionRemovalContext? collectionRemoval,
  }) async {
    late List<ItemContextAction> actions;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            actions = contextActionsFor(
              context,
              _movie(),
              playlistMemberships: playlistMemberships,
              collectionMemberships: collectionMemberships,
              collectionRemoval: collectionRemoval,
            );
            return const SizedBox.shrink();
          },
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    return actions;
  }

  group('Playlist and Collection conditional actions', () {
    testWidgets(
        'neither Remove from Playlist nor Remove from Collection is present when item belongs to none',
        (tester) async {
      signIn(canManage: true);
      final actions = await buildActions(
        tester,
        playlistMemberships: const [],
        collectionMemberships: const [],
      );

      final labels = actions.map((a) => a.label).toList();
      expect(labels, contains('Add to Collection'));
      expect(labels, contains('Add to Playlist'));
      expect(labels, isNot(contains('Remove from Playlist')));
      expect(labels, isNot(contains('Remove from Collection')));
    });

    testWidgets(
        'Remove from Playlist appears right below Add to Playlist when item is in a playlist',
        (tester) async {
      signIn(canManage: true);
      final actions = await buildActions(
        tester,
        playlistMemberships: const [
          ItemPlaylistMembership(
            playlistId: 'pl-1',
            playlistName: 'The Hux List',
            entryId: 'entry-1',
          ),
        ],
      );

      final labels = actions.map((a) => a.label).toList();
      expect(labels, contains('Remove from Playlist'));

      final addIndex = labels.indexOf('Add to Playlist');
      final removeIndex = labels.indexOf('Remove from Playlist');
      expect(removeIndex, equals(addIndex + 1));
    });

    testWidgets(
        'Remove from Collection appears right below Add to Collection when item is in a collection',
        (tester) async {
      signIn(canManage: true);
      final actions = await buildActions(
        tester,
        collectionMemberships: const [
          ItemCollectionMembership(
            collectionId: 'boxset-1',
            collectionName: 'Alien Collection',
          ),
        ],
      );

      final labels = actions.map((a) => a.label).toList();
      expect(labels, contains('Remove from Collection'));

      final addIndex = labels.indexOf('Add to Collection');
      final removeIndex = labels.indexOf('Remove from Collection');
      expect(removeIndex, equals(addIndex + 1));
    });

    testWidgets(
        'Both Remove from Collection and Remove from Playlist appear in correct relative order',
        (tester) async {
      signIn(canManage: true);
      final actions = await buildActions(
        tester,
        playlistMemberships: const [
          ItemPlaylistMembership(
            playlistId: 'pl-1',
            playlistName: 'The Hux List',
            entryId: 'entry-1',
          ),
        ],
        collectionMemberships: const [
          ItemCollectionMembership(
            collectionId: 'boxset-1',
            collectionName: 'Alien Collection',
          ),
        ],
      );

      final labels = actions.map((a) => a.label).toList();
      final addColIndex = labels.indexOf('Add to Collection');
      final remColIndex = labels.indexOf('Remove from Collection');
      final addPlIndex = labels.indexOf('Add to Playlist');
      final remPlIndex = labels.indexOf('Remove from Playlist');

      expect(remColIndex, equals(addColIndex + 1));
      expect(remPlIndex, equals(addPlIndex + 1));
      expect(addColIndex < remColIndex, isTrue);
      expect(remColIndex < addPlIndex, isTrue);
      expect(addPlIndex < remPlIndex, isTrue);
    });

    testWidgets('open menu keeps its rows when the card that opened it goes away',
        (tester) async {
      signIn();
      addTearDown(ItemMembershipService.instance.clearCache);
      final itemsApi = _MockItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final playlists = Completer<Map<String, dynamic>>();
      when(() => itemsApi.getPlaylists()).thenAnswer((_) => playlists.future);
      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: 'PlaylistItemId'),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-1'},
          ],
        },
      );

      final showCard = ValueNotifier(true);
      late BuildContext cardContext;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ValueListenableBuilder<bool>(
            valueListenable: showCard,
            builder: (_, show, _) => show
                ? Builder(builder: (context) {
                    cardContext = context;
                    return const SizedBox.shrink();
                  })
                : const SizedBox.shrink(),
          ),
        ),
      );

      unawaited(showContextMenu(cardContext, _movie()));
      await tester.pumpAndSettle();
      expect(find.text('Add to Playlist'), findsOneWidget);

      showCard.value = false;
      await tester.pump();
      playlists.complete({
        'Items': [
          {'Id': 'pl-1', 'Name': 'The Hux List'},
        ],
      });
      await tester.pumpAndSettle();

      expect(find.text('Add to Playlist'), findsOneWidget);
    });
  });
}

