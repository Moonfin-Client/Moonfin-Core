import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import 'chunks.dart';
import 'watch_state_repository.dart';

class ChannelRepository {
  final IptvDatabase _db;

  ChannelRepository(this._db);

  Future<Channel?> getChannelById(int id) {
    return (_db.select(
      _db.channels,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  Future<List<Channel>> getChannelsByIds(List<int> ids) async => [
    for (final chunk in chunked(ids))
      ...await (_db.select(_db.channels)..where((c) => c.id.isIn(chunk))).get(),
  ];

  Future<Channel?> getChannelByStreamUrl(int playlistId, String streamUrl) {
    return (_db.select(_db.channels)
          ..where(
            (c) =>
                c.playlistId.equals(playlistId) & c.streamUrl.equals(streamUrl),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  /// One page of the live lineup in import order (channel number, then name)
  /// or by name. With a [profileId] its enabled-groups allowlist applies,
  /// when it has one.
  Future<List<Channel>> getLiveChannelsPage({
    String? profileId,
    bool byName = false,
    bool descending = false,
    int offset = 0,
    int? limit,
  }) {
    final mode = descending ? OrderingMode.desc : OrderingMode.asc;
    final query = _db.select(_db.channels)
      ..where((c) => _liveWhere(c, profileId))
      ..orderBy([
        if (byName)
          (c) => OrderingTerm(expression: c.name.lower(), mode: mode)
        else ...[
          (c) => OrderingTerm(expression: c.channelNumber, mode: mode),
          (c) => OrderingTerm(expression: c.name, mode: mode),
        ],
        (c) => OrderingTerm(expression: c.id, mode: mode),
      ]);
    if (limit != null || offset > 0) query.limit(limit ?? -1, offset: offset);
    return query.get();
  }

  Future<int> countLiveChannels({String? profileId}) async {
    final count = _db.channels.id.count();
    final row =
        await (_db.selectOnly(_db.channels)
              ..addColumns([count])
              ..where(_liveWhere(_db.channels, profileId)))
            .getSingle();
    return row.read(count) ?? 0;
  }

  Expression<bool> _liveWhere($ChannelsTable c, String? profileId) {
    final live = c.isVod.equals(false);
    if (profileId == null) return live;
    final enabled = _db.selectOnly(_db.enabledGroups)
      ..addColumns([_db.enabledGroups.groupId])
      ..where(_db.enabledGroups.profileId.equals(profileId));
    // No allowlist rows means every group is enabled.
    return live & (notExistsQuery(enabled) | c.groupId.isInQuery(enabled));
  }

  Future<int> countChannels({required bool vod}) async {
    final count = _db.channels.id.count();
    final query = _db.selectOnly(_db.channels)
      ..addColumns([count])
      ..where(_db.channels.isVod.equals(vod));
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  Future<List<ChannelGroup>> getGroupsForPlaylist(int playlistId) {
    return (_db.select(_db.channelGroups)
          ..where((g) => g.playlistId.equals(playlistId))
          ..orderBy([
            (g) => OrderingTerm.asc(g.sortOrder),
            (g) => OrderingTerm.asc(g.name),
          ]))
        .get();
  }

  Future<int> countChannelsInGroup(int groupId) async {
    final count = _db.channels.id.count();
    final query = _db.selectOnly(_db.channels)
      ..addColumns([count])
      ..where(_db.channels.groupId.equals(groupId));
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  Future<List<Channel>> getChannelsForGroup(int groupId) {
    return (_db.select(_db.channels)
          ..where((c) => c.groupId.equals(groupId))
          ..orderBy([
            (c) => OrderingTerm.asc(c.channelNumber),
            (c) => OrderingTerm.asc(c.name),
          ]))
        .get();
  }

  Future<List<Channel>> searchChannelsForPlaylist(
    int playlistId,
    String query, {
    int limit = 100,
  }) {
    return (_db.select(_db.channels)
          ..where(
            (c) => c.playlistId.equals(playlistId) & c.name.like('%$query%'),
          )
          ..orderBy([(c) => OrderingTerm.asc(c.name)])
          ..limit(limit))
        .get();
  }

  /// Editor changes are kept by stream as well, so a refresh puts them back.
  Future<void> renameChannel(int channelId, String name) => _edit(
    channelId,
    ChannelsCompanion(name: Value(name)),
    ChannelEditsCompanion(name: Value(name)),
  );

  Future<void> setChannelNumber(int channelId, int? number) => _edit(
    channelId,
    ChannelsCompanion(channelNumber: Value(number)),
    ChannelEditsCompanion(
      numberEdited: const Value(true),
      channelNumber: Value(number),
    ),
  );

  /// Removes channels the user doesn't want, and keeps them from coming back
  /// on the next refresh.
  Future<void> removeChannels(List<int> channelIds) {
    return _db.transaction(() async {
      for (final channel in await getChannelsByIds(channelIds)) {
        await _saveEdit(
          channel,
          const ChannelEditsCompanion(removed: Value(true)),
        );
      }
      await deleteChannels(channelIds);
    });
  }

  Future<void> _edit(
    int channelId,
    ChannelsCompanion change,
    ChannelEditsCompanion edit,
  ) {
    return _db.transaction(() async {
      final channel = await getChannelById(channelId);
      if (channel == null) return;
      await _saveEdit(channel, edit);
      await (_db.update(
        _db.channels,
      )..where((c) => c.id.equals(channelId))).write(change);
    });
  }

  Future<void> _saveEdit(Channel channel, ChannelEditsCompanion edit) {
    return _db
        .into(_db.channelEdits)
        .insert(
          edit.copyWith(
            playlistId: Value(channel.playlistId),
            streamUrl: Value(channel.streamUrl),
          ),
          onConflict: DoUpdate(
            (_) => edit,
            target: [_db.channelEdits.playlistId, _db.channelEdits.streamUrl],
          ),
        );
  }

  /// Deletes channels with the favorites, history, reminders and recording
  /// timers that point at them.
  Future<void> deleteChannels(List<int> channelIds) {
    return _db.transaction(() async {
      for (final chunk in chunked(channelIds)) {
        await (_db.delete(_db.favorites)..where(
              (f) =>
                  f.itemKind.equals(IptvItemKind.channel) & f.refId.isIn(chunk),
            ))
            .go();
        await (_db.delete(
          _db.watchHistory,
        )..where((w) => w.channelId.isIn(chunk))).go();
        await (_db.delete(
          _db.reminders,
        )..where((r) => r.channelId.isIn(chunk))).go();
        await (_db.delete(
          _db.scheduledRecordings,
        )..where((s) => s.channelId.isIn(chunk))).go();
        await (_db.delete(_db.channels)..where((c) => c.id.isIn(chunk))).go();
      }
    });
  }

  Future<void> renameGroup(int groupId, String name) async {
    await (_db.update(_db.channelGroups)..where((g) => g.id.equals(groupId)))
        .write(ChannelGroupsCompanion(name: Value(name)));
  }
}
