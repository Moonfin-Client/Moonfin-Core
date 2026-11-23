import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import 'chunks.dart';

String channelEpgKey(Channel channel) {
  final tvgId = channel.tvgId?.trim();
  if (tvgId != null && tvgId.isNotEmpty) return tvgId;
  return 'ch-${channel.id}';
}

class EpgRepository {
  final IptvDatabase _db;

  EpgRepository(this._db);

  Future<Map<String, List<EpgProgram>>> getProgramsForChannels(
    List<String> channelTvgIds,
    DateTime start,
    DateTime end,
  ) async {
    final result = <String, List<EpgProgram>>{};
    if (channelTvgIds.isEmpty) return result;
    for (final slice in chunked(channelTvgIds)) {
      final rows =
          await (_db.select(_db.epgPrograms)
                ..where(
                  (p) =>
                      p.channelTvgId.isIn(slice) &
                      p.startTime.isSmallerThanValue(end) &
                      p.endTime.isBiggerThanValue(start),
                )
                ..orderBy([(p) => OrderingTerm.asc(p.startTime)]))
              .get();
      for (final row in rows) {
        (result[row.channelTvgId] ??= <EpgProgram>[]).add(row);
      }
    }
    return result;
  }

  Future<void> insertPrograms(List<EpgProgramsCompanion> programs) async {
    await _db.batch((batch) => batch.insertAll(_db.epgPrograms, programs));
  }

  /// Swaps in a fresh guide for the channels in [programs] in one
  /// transaction, so a failure part way leaves the old guide in place.
  Future<void> replacePrograms(List<EpgProgramsCompanion> programs) {
    final keys = {for (final p in programs) p.channelTvgId.value}.toList();
    return _db.transaction(() async {
      for (final chunk in chunked(keys)) {
        await (_db.delete(
          _db.epgPrograms,
        )..where((p) => p.channelTvgId.isIn(chunk))).go();
      }
      await insertPrograms(programs);
    });
  }

  Future<void> deleteOldPrograms(DateTime before) async {
    await (_db.delete(
      _db.epgPrograms,
    )..where((p) => p.endTime.isSmallerThanValue(before))).go();
  }

  Future<Set<String>> channelsWithProgramsInWindow(
    List<String> channelTvgIds,
    DateTime start,
    DateTime end,
  ) async {
    final found = <String>{};
    if (channelTvgIds.isEmpty) return found;
    for (final slice in chunked(channelTvgIds)) {
      final query = _db.selectOnly(_db.epgPrograms, distinct: true)
        ..addColumns([_db.epgPrograms.channelTvgId])
        ..where(
          _db.epgPrograms.channelTvgId.isIn(slice) &
              _db.epgPrograms.startTime.isSmallerThanValue(end) &
              _db.epgPrograms.endTime.isBiggerThanValue(start),
        );
      final rows = await query.get();
      for (final row in rows) {
        final id = row.read(_db.epgPrograms.channelTvgId);
        if (id != null) found.add(id);
      }
    }
    return found;
  }

  /// Fills [start] to [end] with two hour blocks named after the channel for
  /// channels without a guide there, so the grid still has something to tap.
  /// [namesByKey] maps an epg key to its channel name. The guide calls this
  /// for the channels it shows, since doing it for a whole lineup means
  /// hundreds of thousands of rows on big providers.
  Future<void> ensureFallbackPrograms(
    Map<String, String> namesByKey,
    DateTime start,
    DateTime end,
  ) async {
    if (namesByKey.isEmpty) return;
    final utc = start.toUtc();
    final windowStart = DateTime.utc(utc.year, utc.month, utc.day, utc.hour);
    final windowEnd = end.toUtc();
    const block = Duration(hours: 2);
    final existing = await channelsWithProgramsInWindow(
      namesByKey.keys.toList(),
      windowStart,
      windowEnd,
    );
    final companions = <EpgProgramsCompanion>[
      for (final MapEntry(key: key, value: name) in namesByKey.entries)
        if (!existing.contains(key))
          for (
            var cursor = windowStart;
            cursor.isBefore(windowEnd);
            cursor = cursor.add(block)
          )
            EpgProgramsCompanion.insert(
              channelTvgId: key,
              title: name,
              startTime: cursor,
              endTime: cursor.add(block),
            ),
    ];
    if (companions.isNotEmpty) await insertPrograms(companions);
  }

  Future<EpgProgram?> getProgramById(int id) {
    return (_db.select(
      _db.epgPrograms,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<EpgSource?> getEpgSource(int playlistId) {
    return (_db.select(
      _db.epgSources,
    )..where((s) => s.playlistId.equals(playlistId))).getSingleOrNull();
  }

  Future<void> upsertEpgSource({
    required int playlistId,
    required String url,
  }) async {
    final existing = await getEpgSource(playlistId);
    if (existing != null) {
      await (_db.update(
        _db.epgSources,
      )..where((s) => s.id.equals(existing.id))).write(
        EpgSourcesCompanion(
          url: Value(url),
          lastFetched: Value(DateTime.now()),
        ),
      );
    } else {
      await _db
          .into(_db.epgSources)
          .insert(
            EpgSourcesCompanion.insert(
              playlistId: playlistId,
              url: url,
              lastFetched: Value(DateTime.now()),
            ),
          );
    }
  }
}
