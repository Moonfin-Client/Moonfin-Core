import 'package:server_core/server_core.dart';

import '../silo_media_server_client.dart';
import 'silo_events_api.dart';

/// Turns frames from Silo's events socket into the messages Moonfin's other
/// servers send: `UserDataChanged` and `LibraryChanged`.
///
/// Silo's events say what changed, not the new values (a `progress` change
/// carries no position), and Jellyfin's `UserDataChanged` carries an item's
/// whole user data, which the app patches onto the cards it holds. So each
/// changed item's user data is read back from Silo before it is passed on,
/// as Jellyfin would have sent it. Every change is also noted on the Silo
/// client, which forgets the reads it made stale.
class SiloEventsTranslator {
  SiloEventsTranslator(this._client);

  final SiloMediaServerClient _client;

  /// Items read back per batch. A batch mutation on the web (a whole season
  /// marked watched) sends one event per episode. Past this many, the rest
  /// pass on what the events themselves say.
  static const maxReadBacks = 25;

  /// The `user_state` changes that move what a card shows (watched,
  /// favorite, resume point), and are read back.
  static const _readBackChanges = {
    'watched',
    'favorite',
    'progress',
    'history',
  };

  /// The messages for [frames], received together. Never throws: a read that
  /// fails passes on what the event said.
  Future<List<ServerWebSocketMessage>> translate(
    Iterable<SiloEventFrame> frames,
  ) async {
    final userData = <String, Map<String, dynamic>>{};
    final readBack = <String>{};
    final itemsUpdated = <String>{};
    final items = _client.itemsApi;

    for (final frame in frames) {
      switch (frame) {
        // Sent on every connect: anything may have changed while the client
        // wasn't listening, so the lists it keeps are read again.
        case SiloEventFrame(type: 'snapshot'):
          items.noteCatalogChanged();
        case SiloEventFrame(
          type: 'event',
          channel: 'user_state',
          event: 'user_state.changed',
          :final data?,
        ):
          final id = data['content_id'];
          // Silo sends every profile's changes to the account's sockets.
          if (data['profile_id'] != _client.profileId ||
              id is! String ||
              id.isEmpty) {
            continue;
          }
          items.noteUserDataChanged(id);
          if (!_readBackChanges.contains(data['change'])) continue;
          final said = userData.putIfAbsent(id, () => {});
          if (data['played'] case final bool played) said['Played'] = played;
          if (data['is_favorite'] case final bool favorite) {
            said['IsFavorite'] = favorite;
          }
          readBack.add(id);
        case SiloEventFrame(
          type: 'event',
          channel: 'catalog',
          :final event,
          :final data,
        ):
          // The legacy names (`library.changed`, `metadata.updated`, …)
          // repeat these two and are left alone.
          if (event == 'catalog.item.changed') {
            items.noteCatalogChanged();
            if (data?['content_id'] case final String id when id.isNotEmpty) {
              itemsUpdated.add(id);
            }
          } else if (event == 'catalog.library.changed') {
            // A scan names its counts, not its items, so there's nothing to
            // pass on and the lists are read again.
            items.noteCatalogChanged();
          }
        default:
      }
    }

    final read = await _readUserData(readBack.take(maxReadBacks));
    final messages = <ServerWebSocketMessage>[];
    final userId = _client.userId ?? _client.profileId;
    if (userData.isNotEmpty && userId != null) {
      messages.add(
        UserDataChangedMessage(
          userId: userId,
          userDataList: [
            for (final MapEntry(key: id, value: said) in userData.entries)
              {'ItemId': id, ...said, ...?read[id]},
          ],
        ),
      );
    }
    if (itemsUpdated.isNotEmpty) {
      messages.add(LibraryChangedMessage(itemsUpdated: itemsUpdated.toList()));
    }
    return messages;
  }

  /// Each item's user data as Silo now has it, in Jellyfin's `UserData`
  /// shape. An item that can't be read is left out.
  Future<Map<String, Map<String, dynamic>>> _readUserData(
    Iterable<String> ids,
  ) async {
    final wanted = ids.toList();
    if (wanted.isEmpty) return const {};
    try {
      final answer = await _client.itemsApi.getItems(
        ids: wanted,
        fields: 'UserData',
        limit: wanted.length,
        enableTotalRecordCount: false,
      );
      return {
        for (final item in answer['Items'] as List? ?? const [])
          if (asJsonMap(item) case {
            'Id': final String id,
            'UserData': final Map<dynamic, dynamic> userData,
          })
            id: Map<String, dynamic>.from(userData),
      };
    } catch (_) {
      return const {};
    }
  }
}
