import 'dart:collection';

import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import 'channel_repository.dart';
import 'chunks.dart';
import 'watch_state_repository.dart' show IptvItemKind;

class PlaylistRepository {
  final IptvDatabase _db;

  PlaylistRepository(this._db);

  Future<List<Playlist>> getAllPlaylists() => _db.select(_db.playlists).get();

  Future<Playlist?> getPlaylistById(int id) => (_db.select(
    _db.playlists,
  )..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<int> insertPlaylist(PlaylistsCompanion playlist) =>
      _db.into(_db.playlists).insert(playlist);

  /// Writes only the columns [changes] sets, so the rest of the row stays.
  Future<int> updatePlaylist(int id, PlaylistsCompanion changes) =>
      (_db.update(_db.playlists)..where((p) => p.id.equals(id))).write(changes);

  /// Deletes the playlist with everything that belongs to it and returns the
  /// paths of its recording files, which the caller removes from disk.
  Future<List<String>> deletePlaylist(int id) async {
    return _db.transaction(() async {
      // Subqueries instead of id lists, since a big playlist would pass
      // SQLite's bound variable limit.
      JoinedSelectStatement channelIds() => _db.selectOnly(_db.channels)
        ..addColumns([_db.channels.id])
        ..where(_db.channels.playlistId.equals(id));
      JoinedSelectStatement vodIds() => _db.selectOnly(_db.vodItems)
        ..addColumns([_db.vodItems.id])
        ..where(_db.vodItems.playlistId.equals(id));
      JoinedSelectStatement episodeIds() => _db.selectOnly(_db.seriesEpisodes)
        ..addColumns([_db.seriesEpisodes.id])
        ..where(_db.seriesEpisodes.playlistId.equals(id));

      await (_db.delete(_db.favorites)..where(
            (f) =>
                (f.itemKind.equals(IptvItemKind.channel) &
                    f.refId.isInQuery(channelIds())) |
                (f.itemKind.equals(IptvItemKind.vod) &
                    f.refId.isInQuery(vodIds())),
          ))
          .go();
      await (_db.delete(_db.watchHistory)..where(
            (w) =>
                w.channelId.isInQuery(channelIds()) |
                w.vodItemId.isInQuery(vodIds()) |
                w.episodeId.isInQuery(episodeIds()),
          ))
          .go();
      await (_db.delete(
        _db.reminders,
      )..where((r) => r.channelId.isInQuery(channelIds()))).go();
      await (_db.delete(
        _db.scheduledRecordings,
      )..where((s) => s.playlistId.equals(id))).go();
      final recordingFiles =
          await (_db.selectOnly(_db.recordings)
                ..addColumns([_db.recordings.filePath])
                ..where(_db.recordings.playlistId.equals(id)))
              .map((row) => row.read(_db.recordings.filePath)!)
              .get();
      await (_db.delete(
        _db.recordings,
      )..where((r) => r.playlistId.equals(id))).go();
      await (_db.delete(
        _db.seriesEpisodes,
      )..where((e) => e.playlistId.equals(id))).go();
      await (_db.delete(
        _db.seriesSeasons,
      )..where((s) => s.playlistId.equals(id))).go();
      await (_db.delete(
        _db.seriesDetailsCache,
      )..where((c) => c.playlistId.equals(id))).go();
      await (_db.delete(
        _db.vodItems,
      )..where((v) => v.playlistId.equals(id))).go();
      await (_db.delete(
        _db.epgSources,
      )..where((e) => e.playlistId.equals(id))).go();
      await (_db.delete(
        _db.channels,
      )..where((c) => c.playlistId.equals(id))).go();
      await (_db.delete(
        _db.channelEdits,
      )..where((e) => e.playlistId.equals(id))).go();
      await (_db.delete(_db.enabledGroups)..where(
            (g) => g.groupId.isInQuery(
              _db.selectOnly(_db.channelGroups)
                ..addColumns([_db.channelGroups.id])
                ..where(_db.channelGroups.playlistId.equals(id)),
            ),
          ))
          .go();
      await (_db.delete(
        _db.channelGroups,
      )..where((g) => g.playlistId.equals(id))).go();
      await (_db.delete(_db.playlists)..where((p) => p.id.equals(id))).go();
      return recordingFiles;
    });
  }

  /// Syncs the playlist's groups and channels with a fresh provider lineup.
  /// Groups match by provider name and channels by stream URL, so surviving
  /// rows keep their ids and everything that points at them. Rows the
  /// provider dropped are deleted along with their favorites, history,
  /// reminders and timers. Editor changes are applied again on top.
  Future<void> replaceChannelsForPlaylist(
    int playlistId,
    List<ChannelGroupsCompanion> groups,
    List<ChannelsCompanion> Function(Map<String, int> groupNameToId)
    channelBuilder,
  ) async {
    await _db.transaction(() async {
      final existingGroups =
          await (_db.select(_db.channelGroups)
                ..where((g) => g.playlistId.equals(playlistId))
                ..orderBy([(g) => OrderingTerm.asc(g.id)]))
              .get();
      final existingGroupIds = <String, int>{};
      final staleGroupIds = <int>[];
      for (final group in existingGroups) {
        if (existingGroupIds.containsKey(group.providerName)) {
          staleGroupIds.add(group.id);
        } else {
          existingGroupIds[group.providerName] = group.id;
        }
      }

      final groupNameToId = <String, int>{};
      final groupUpdates = <(int, ChannelGroupsCompanion)>[];
      for (final group in groups) {
        final name = group.providerName.value;
        final id = existingGroupIds.remove(name);
        if (id != null) {
          groupNameToId[name] = id;
          // The name stays, since it may be one picked in the editor.
          groupUpdates.add((
            id,
            ChannelGroupsCompanion(sortOrder: group.sortOrder),
          ));
        } else {
          groupNameToId[name] = await _db.into(_db.channelGroups).insert(group);
        }
      }
      staleGroupIds.addAll(existingGroupIds.values);

      final existingChannels =
          await (_db.selectOnly(_db.channels)
                ..addColumns([_db.channels.id, _db.channels.streamUrl])
                ..where(_db.channels.playlistId.equals(playlistId))
                ..orderBy([OrderingTerm.asc(_db.channels.id)]))
              .get();
      final idsByUrl = <String, ListQueue<int>>{};
      for (final row in existingChannels) {
        idsByUrl
            .putIfAbsent(row.read(_db.channels.streamUrl)!, ListQueue.new)
            .add(row.read(_db.channels.id)!);
      }

      final edits = {
        for (final edit in await (_db.select(
          _db.channelEdits,
        )..where((e) => e.playlistId.equals(playlistId))).get())
          edit.streamUrl: edit,
      };
      final channels = <ChannelsCompanion>[];
      for (final channel in channelBuilder(groupNameToId)) {
        final edit = edits[channel.streamUrl.value];
        if (edit == null) {
          channels.add(channel);
        } else if (!edit.removed) {
          channels.add(
            channel.copyWith(
              name: edit.name == null ? null : Value(edit.name!),
              channelNumber: edit.numberEdited
                  ? Value(edit.channelNumber)
                  : null,
            ),
          );
        }
      }
      await _db.batch((batch) {
        for (final (id, group) in groupUpdates) {
          batch.update(_db.channelGroups, group, where: (g) => g.id.equals(id));
        }
        final inserts = <ChannelsCompanion>[];
        for (final channel in channels) {
          final ids = idsByUrl[channel.streamUrl.value];
          if (ids != null && ids.isNotEmpty) {
            final id = ids.removeFirst();
            batch.update(_db.channels, channel, where: (c) => c.id.equals(id));
          } else {
            inserts.add(channel);
          }
        }
        batch.insertAll(_db.channels, inserts);
      });

      await ChannelRepository(
        _db,
      ).deleteChannels([for (final ids in idsByUrl.values) ...ids]);
      for (final chunk in chunked(staleGroupIds)) {
        await (_db.delete(
          _db.enabledGroups,
        )..where((g) => g.groupId.isIn(chunk))).go();
        await (_db.delete(
          _db.channelGroups,
        )..where((g) => g.id.isIn(chunk))).go();
      }

      await (_db.update(_db.playlists)..where((p) => p.id.equals(playlistId)))
          .write(PlaylistsCompanion(lastRefreshed: Value(DateTime.now())));
    });
  }
}
