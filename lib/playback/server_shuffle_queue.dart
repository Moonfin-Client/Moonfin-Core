import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';

/// A shuffle the server runs ([ServerShuffleApi] on Silo), as a playback
/// queue that grows one item at a time.
///
/// The server hands out the item to play now and the one after it. Moonfin
/// queues both. When the second becomes the queue's last item, the playback
/// module's queue extension asks [extend], which moves the server's shuffle
/// on from the first and queues the item it picks next. So the server's
/// current item is the one Moonfin plays, and its order carries on in the
/// server's own apps and on other devices.
///
/// One shuffle is followed at a time: starting another replaces it, and a
/// queue that no longer ends in the shuffle's next item isn't extended.
class ServerShuffleQueue {
  ServerShuffleQueue._();

  static final instance = ServerShuffleQueue._();

  _Active? _active;

  /// Starts the server's shuffle of [item] and returns its first items, or
  /// null when the server doesn't shuffle [item] itself.
  Future<List<AggregatedItem>?> start(
    MediaServerClient client,
    AggregatedItem item,
  ) async {
    final Object items = client.itemsApi;
    if (items is! ServerShuffleApi) return null;
    final api = items;
    if (!await api.canShuffle(item.rawData)) return null;
    final shuffle = await api.startShuffle(item.rawData);
    final current = _item(shuffle.current, item.serverId);
    final next = shuffle.next == null
        ? null
        : _item(shuffle.next!, item.serverId);
    if (current == null) return null;
    _active = _Active(
      api: api,
      id: shuffle.id,
      serverId: item.serverId,
      currentId: current.id,
      nextId: next?.id,
    );
    return [current, ?next];
  }

  /// The items to add after [lastItem], the queue's last, when it is the
  /// running shuffle's next item: the server moves on and picks another.
  /// Null when [lastItem] isn't the shuffle's, so the caller goes on as it
  /// would without one.
  Future<List<AggregatedItem>?> extend(dynamic lastItem) async {
    final active = _active;
    if (active == null || lastItem is! AggregatedItem) return null;
    if (active.nextId == null || lastItem.id != active.nextId) return null;
    final moved = await active.api.advanceShuffle(
      active.id,
      fromItemId: active.currentId,
    );
    if (moved == null) {
      _active = null;
      return const [];
    }
    active.currentId = '${moved.current['Id']}';
    final next = moved.next == null
        ? null
        : _item(moved.next!, active.serverId);
    active.nextId = next?.id;
    return [?next];
  }

  /// Forgets the running shuffle (tests).
  void reset() => _active = null;

  static AggregatedItem? _item(Map<String, dynamic> raw, String serverId) {
    final id = raw['Id']?.toString();
    if (id == null || id.isEmpty) return null;
    return AggregatedItem(id: id, serverId: serverId, rawData: raw);
  }
}

class _Active {
  _Active({
    required this.api,
    required this.id,
    required this.serverId,
    required this.currentId,
    required this.nextId,
  });

  final ServerShuffleApi api;
  final String id;
  final String serverId;
  String currentId;
  String? nextId;
}
