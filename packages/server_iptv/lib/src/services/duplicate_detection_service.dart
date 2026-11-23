import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import '../repositories/channel_repository.dart';

enum DuplicateReason { tvgId, streamUrl, name }

/// Channels that look like the same stream listed more than once, with the
/// signal that grouped them and the value they share. Names are compared
/// lowercased, so [match] is too.
class DuplicateChannelGroup {
  final List<Channel> channels;
  final DuplicateReason reason;
  final String match;

  const DuplicateChannelGroup({
    required this.channels,
    required this.reason,
    required this.match,
  });
}

/// Finds duplicate channels within a playlist and can merge a group down to
/// one keeper. Favorites, history, reminders and timers on the other rows go
/// with them, nothing moves to the keeper, and a refresh leaves them out.
class DuplicateDetectionService {
  final IptvDatabase _db;

  DuplicateDetectionService(this._db);

  Future<List<DuplicateChannelGroup>> detectDuplicates(
    int playlistId, {
    bool byTvgId = true,
    bool byStreamUrl = true,
    bool byName = false,
  }) async {
    final channels =
        await (_db.select(_db.channels)..where(
              (c) => c.playlistId.equals(playlistId) & c.isVod.equals(false),
            ))
            .get();

    return [
      if (byTvgId)
        ..._group(channels, DuplicateReason.tvgId, (c) => c.tvgId ?? ''),
      if (byStreamUrl)
        ..._group(channels, DuplicateReason.streamUrl, (c) => c.streamUrl),
      if (byName)
        ..._group(channels, DuplicateReason.name, (c) => c.name.toLowerCase()),
    ];
  }

  List<DuplicateChannelGroup> _group(
    List<Channel> channels,
    DuplicateReason reason,
    String Function(Channel) keyOf,
  ) {
    final grouped = <String, List<Channel>>{};
    for (final channel in channels) {
      final key = keyOf(channel).trim();
      if (key.isNotEmpty) grouped.putIfAbsent(key, () => []).add(channel);
    }
    return [
      for (final MapEntry(key: match, value: group) in grouped.entries)
        if (group.length > 1)
          DuplicateChannelGroup(channels: group, reason: reason, match: match),
    ];
  }

  Future<void> mergeChannels(int keepChannelId, List<int> deleteChannelIds) {
    return ChannelRepository(_db).removeChannels(
      {
        for (final id in deleteChannelIds)
          if (id != keepChannelId) id,
      }.toList(),
    );
  }
}
