import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/services/websocket_message_parser.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

AggregatedItem _episode({
  String id = 'ep1',
  bool played = false,
  int position = 0,
}) => AggregatedItem(
  id: id,
  serverId: 'srv',
  rawData: {
    'Id': id,
    'Name': 'An episode',
    'Type': 'Episode',
    'UserData': {'Played': played, 'PlaybackPositionTicks': position},
  },
);

AggregatedItem _series({String id = 'series-1', int unplayed = 8}) =>
    AggregatedItem(
      id: id,
      serverId: 'srv',
      rawData: {
        'Id': id,
        'Name': 'A series',
        'Type': 'Series',
        'UserData': {'Played': false, 'UnplayedItemCount': unplayed},
      },
    );

void main() {
  late UserDataSync sync;

  setUp(() => sync = UserDataSync());
  tearDown(() => sync.dispose());

  group('patching items', () {
    test('an item nothing is known about comes back untouched', () {
      final item = _episode();
      expect(identical(sync.apply(item), item), isTrue);
    });

    test('a published change lands on the item', () {
      sync.publish('ep1', {'Played': true});
      final patched = sync.apply(_episode());
      expect(patched.isPlayed, isTrue);
      expect(patched.name, 'An episode');
    });

    test('a patch merges rather than replacing what the item already had', () {
      sync.publish('ep1', {'Played': true});
      final patched = sync.apply(_episode(position: 500));
      expect(patched.isPlayed, isTrue);
      expect(patched.playbackPositionTicks, 500);
    });

    test('an item already in that state keeps its identity', () {
      sync.publish('ep1', {'Played': true});
      final item = _episode(played: true);
      expect(identical(sync.apply(item), item), isTrue);
    });

    test('clearing a field the item never carried is not a change', () {
      sync.publish('ep1', {'Played': false, 'PlayedPercentage': null});
      final item = AggregatedItem(
        id: 'ep1',
        serverId: 'srv',
        rawData: {
          'Id': 'ep1',
          'Type': 'Episode',
          'UserData': {'Played': false},
        },
      );
      expect(identical(sync.apply(item), item), isTrue);
    });

    test('clearing a field the item does carry drops it', () {
      sync.publish('ep1', {'PlayedPercentage': null});
      final item = AggregatedItem(
        id: 'ep1',
        serverId: 'srv',
        rawData: {
          'Id': 'ep1',
          'Type': 'Episode',
          'UserData': {'Played': false, 'PlayedPercentage': 40},
        },
      );
      expect(sync.apply(item).playedPercentage, isNull);
    });

    test('a list nothing changed in keeps its identity', () {
      sync.publish('other', {'Played': true});
      final items = [_episode(), _episode(id: 'ep2')];
      expect(identical(sync.applyAll(items), items), isTrue);
    });

    test('only the changed entry of a list is rebuilt', () {
      sync.publish('ep2', {'Played': true});
      final items = [_episode(), _episode(id: 'ep2')];
      final patched = sync.applyAll(items);
      expect(identical(patched, items), isFalse);
      expect(identical(patched[0], items[0]), isTrue);
      expect(patched[1].isPlayed, isTrue);
    });
  });

  group('notifications', () {
    test('a real change notifies', () {
      var notified = 0;
      sync.addListener(() => notified++);

      sync.publish('ep1', {'Played': true});
      expect(notified, 1);
    });

    test('republishing the same value is not a change', () {
      sync.publish('ep1', {'Played': true});
      var notified = 0;
      sync.addListener(() => notified++);

      sync.publish('ep1', {'Played': true});
      expect(notified, 0);
    });
  });

  group('the socket feed', () {
    test('carries the values the server sent, not just the ids', () {
      final message = WebSocketMessageParser.parseJson({
        'MessageType': 'UserDataChanged',
        'Data': {
          'UserId': 'user-1',
          'UserDataList': [
            {'ItemId': 'ep1', 'Played': true, 'PlaybackPositionTicks': 0},
          ],
        },
      });

      expect(message, isA<UserDataChangedMessage>());
      final userData = message as UserDataChangedMessage;
      expect(userData.itemIds, ['ep1']);
      expect(userData.userDataList.single['Played'], isTrue);
    });

    test('applies what the socket reports', () async {
      final events = StreamController<ServerWebSocketMessage>();
      addTearDown(events.close);
      sync.bindTo(events.stream, userId: 'user-1');

      events.add(
        const UserDataChangedMessage(
          userId: 'user-1',
          userDataList: [
            {'ItemId': 'ep1', 'Played': true},
          ],
        ),
      );
      await Future<void>.delayed(Duration.zero);

      expect(sync.apply(_episode()).isPlayed, isTrue);
    });

    test('ignores another account, however the id is punctuated', () async {
      final events = StreamController<ServerWebSocketMessage>();
      addTearDown(events.close);
      sync.bindTo(events.stream, userId: 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE');

      events.add(
        const UserDataChangedMessage(
          userId: 'someone-else',
          userDataList: [
            {'ItemId': 'ep1', 'Played': true},
          ],
        ),
      );
      // The same user, written the way Jellyfin sometimes writes it.
      events.add(
        const UserDataChangedMessage(
          userId: 'aaaaaaaabbbbccccddddeeeeeeeeeeee',
          userDataList: [
            {'ItemId': 'ep2', 'Played': true},
          ],
        ),
      );
      await Future<void>.delayed(Duration.zero);

      expect(sync.apply(_episode()).isPlayed, isFalse);
      expect(sync.apply(_episode(id: 'ep2')).isPlayed, isTrue);
    });

    test('the server is allowed to undo an optimistic patch', () async {
      sync.publish('ep1', {'Played': true});
      final events = StreamController<ServerWebSocketMessage>();
      addTearDown(events.close);
      sync.bindTo(events.stream, userId: 'user-1');

      events.add(
        const UserDataChangedMessage(
          userId: 'user-1',
          userDataList: [
            {'ItemId': 'ep1', 'Played': false},
          ],
        ),
      );
      await Future<void>.delayed(Duration.zero);

      expect(sync.apply(_episode()).isPlayed, isFalse);
    });
  });

  group('refreshing from the server', () {
    ({_MockClient client, _MockItemsApi itemsApi}) clientReturning(
      List<Map<String, dynamic>> items,
    ) {
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          recursive: any(named: 'recursive'),
          limit: any(named: 'limit'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        ),
      ).thenAnswer((_) async => {'Items': items});
      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      return (client: client, itemsApi: itemsApi);
    }

    test('publishes the user data the server returned', () async {
      final fake = clientReturning([
        {
          'Id': 'series-1',
          'UserData': {'UnplayedItemCount': 3, 'Played': false},
        },
      ]);

      await sync.refreshFromServer(fake.client, ['series-1']);

      expect(sync.apply(_series()).unplayedItemCount, 3);
    });

    test('asks for nothing when there are no ids', () async {
      final fake = clientReturning(const []);
      await sync.refreshFromServer(fake.client, const []);
      verifyNever(
        () => fake.itemsApi.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          recursive: any(named: 'recursive'),
          limit: any(named: 'limit'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        ),
      );
    });

    test('a failed request leaves what is known alone', () async {
      sync.publish('ep1', {'Played': true});
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          recursive: any(named: 'recursive'),
          limit: any(named: 'limit'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        ),
      ).thenThrow(Exception('offline'));
      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);

      await sync.refreshFromServer(client, ['ep1']);

      expect(sync.apply(_episode()).isPlayed, isTrue);
    });
  });

  test('reset drops everything so the next account starts clean', () {
    sync.publish('ep1', {'Played': true});
    sync.reset();
    final item = _episode();
    expect(identical(sync.apply(item), item), isTrue);
  });
}
