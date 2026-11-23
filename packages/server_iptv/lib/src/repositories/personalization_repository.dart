import 'package:drift/drift.dart';

import '../db/iptv_database.dart';

/// A channel group together with how many live channels it holds.
class GroupWithCount {
  final ChannelGroup group;
  final int channelCount;
  const GroupWithCount({required this.group, required this.channelCount});
}

/// Per-profile personalization: the enabled-groups allowlist that keeps huge
/// provider lineups manageable.
class PersonalizationRepository {
  final IptvDatabase _db;

  PersonalizationRepository(this._db);

  /// Group ids are row ids, which start at 1, so 0 can stand for an
  /// allowlist with nothing on it.
  static const _noGroups = 0;

  /// Enabled group ids for [profileId], or null when the profile has no
  /// allowlist rows, which means every group is enabled. An empty set means
  /// none are.
  Future<Set<int>?> getEnabledGroupIds(String profileId) async {
    final rows =
        await (_db.selectOnly(_db.enabledGroups)
              ..addColumns([_db.enabledGroups.groupId])
              ..where(_db.enabledGroups.profileId.equals(profileId)))
            .get();
    if (rows.isEmpty) return null;
    return {for (final row in rows) row.read(_db.enabledGroups.groupId)!}
      ..remove(_noGroups);
  }

  /// Replaces the allowlist for [profileId]. Null clears it, which puts the
  /// profile back to every group enabled.
  Future<void> setEnabledGroupIds(String profileId, Set<int>? groupIds) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.enabledGroups,
      )..where((g) => g.profileId.equals(profileId))).go();
      if (groupIds == null) return;
      await _db.batch((batch) {
        batch.insertAll(_db.enabledGroups, [
          for (final groupId in groupIds.isEmpty ? {_noGroups} : groupIds)
            EnabledGroupsCompanion.insert(
              profileId: profileId,
              groupId: groupId,
            ),
        ]);
      });
    });
  }

  /// Removes the profile's allowlist rows. Used when a profile is deleted.
  Future<void> clearProfile(String profileId) =>
      setEnabledGroupIds(profileId, null);

  /// Every channel group across all playlists with its live channel count,
  /// ordered by name. VOD-flagged rows don't count toward the totals.
  Future<List<GroupWithCount>> getLiveGroupsWithCounts() async {
    final count = _db.channels.id.count();
    final query =
        _db.select(_db.channelGroups).join([
            leftOuterJoin(
              _db.channels,
              _db.channels.groupId.equalsExp(_db.channelGroups.id) &
                  _db.channels.isVod.equals(false),
            ),
          ])
          ..addColumns([count])
          ..groupBy([_db.channelGroups.id])
          ..orderBy([OrderingTerm.asc(_db.channelGroups.name)]);

    final rows = await query.get();
    return [
      for (final row in rows)
        GroupWithCount(
          group: row.readTable(_db.channelGroups),
          channelCount: row.read(count) ?? 0,
        ),
    ];
  }
}
