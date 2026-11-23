import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import 'chunks.dart';

/// The kinds of item a favorite points at.
abstract final class IptvItemKind {
  static const channel = 'channel';
  static const vod = 'vod';
}

/// Content types stored in watch history.
abstract final class IptvContentType {
  static const channel = 'channel';
  static const movie = 'movie';
  static const episode = 'episode';
}

/// Profile-scoped favorites and watch history, which holds resume state.
class WatchStateRepository {
  final IptvDatabase _db;

  static const int maxRecentChannelEntries = 20;

  /// Position past this fraction of the runtime counts as fully watched.
  static const double watchedThreshold = 0.92;

  static Value<bool> _playedFromPosition(int positionMs, int? durationMs) {
    if (durationMs == null || durationMs <= 0) return const Value.absent();
    return Value(positionMs / durationMs >= watchedThreshold);
  }

  WatchStateRepository(this._db);

  /// Toggles the favorite and returns true when the item is now a favorite.
  Future<bool> toggleFavorite({
    required String profileId,
    required String itemKind,
    required int refId,
  }) async {
    final existing =
        await (_db.select(_db.favorites)..where(
              (f) =>
                  f.profileId.equals(profileId) &
                  f.itemKind.equals(itemKind) &
                  f.refId.equals(refId),
            ))
            .getSingleOrNull();

    if (existing != null) {
      await (_db.delete(
        _db.favorites,
      )..where((f) => f.id.equals(existing.id))).go();
      return false;
    }
    await _db
        .into(_db.favorites)
        .insert(
          FavoritesCompanion.insert(
            profileId: profileId,
            itemKind: itemKind,
            refId: refId,
          ),
          mode: InsertMode.insertOrReplace,
        );
    return true;
  }

  Future<bool> isFavorite({
    required String profileId,
    required String itemKind,
    required int refId,
  }) async {
    final row =
        await (_db.select(_db.favorites)
              ..where(
                (f) =>
                    f.profileId.equals(profileId) &
                    f.itemKind.equals(itemKind) &
                    f.refId.equals(refId),
              )
              ..limit(1))
            .getSingleOrNull();
    return row != null;
  }

  /// The profile's favorite ref ids. With [among] it may narrow the lookup to
  /// those ids, so callers should still check membership.
  Future<List<int>> getFavoriteRefIds(
    String profileId,
    String itemKind, {
    List<int>? among,
  }) async {
    final query = _db.selectOnly(_db.favorites)
      ..addColumns([_db.favorites.refId])
      ..where(
        _db.favorites.profileId.equals(profileId) &
            _db.favorites.itemKind.equals(itemKind),
      );
    // A long list would pass SQLite's bound variable limit, and loading every
    // favorite is still correct.
    if (among != null && among.length <= 900) {
      query.where(_db.favorites.refId.isIn(among));
    }
    final rows = await query.get();
    return rows.map((r) => r.read(_db.favorites.refId)!).toList();
  }

  /// Records a live channel zap (one row per channel per profile, trimmed to
  /// [maxRecentChannelEntries]).
  Future<void> recordChannelZap({
    required String profileId,
    required int channelId,
  }) async {
    await (_db.delete(_db.watchHistory)..where(
          (w) =>
              w.profileId.equals(profileId) &
              w.channelId.equals(channelId) &
              w.contentType.equals(IptvContentType.channel),
        ))
        .go();

    await _db
        .into(_db.watchHistory)
        .insert(
          WatchHistoryCompanion(
            profileId: Value(profileId),
            channelId: Value(channelId),
            contentType: const Value(IptvContentType.channel),
          ),
        );

    await _trimChannelHistory(profileId);
  }

  Future<void> upsertMovieProgress({
    required String profileId,
    required int vodItemId,
    required int positionMs,
    int? durationMs,
  }) => _upsertProgress(
    profileId,
    IptvContentType.movie,
    vodItemId: vodItemId,
    positionMs: positionMs,
    durationMs: durationMs,
  );

  Future<void> upsertEpisodeProgress({
    required String profileId,
    required int episodeId,
    required int positionMs,
    int? durationMs,
  }) => _upsertProgress(
    profileId,
    IptvContentType.episode,
    episodeId: episodeId,
    positionMs: positionMs,
    durationMs: durationMs,
  );

  /// One history row per profile and movie or episode, holding its resume
  /// point.
  Future<void> _upsertProgress(
    String profileId,
    String contentType, {
    int? vodItemId,
    int? episodeId,
    required int positionMs,
    int? durationMs,
  }) async {
    final existing =
        await (_db.select(_db.watchHistory)
              ..where(
                (w) =>
                    w.profileId.equals(profileId) &
                    w.contentType.equals(contentType) &
                    (vodItemId != null
                        ? w.vodItemId.equals(vodItemId)
                        : w.episodeId.equals(episodeId!)),
              )
              ..limit(1))
            .getSingleOrNull();

    final played = _playedFromPosition(
      positionMs,
      durationMs ?? existing?.durationMs,
    );
    if (existing != null) {
      await (_db.update(
        _db.watchHistory,
      )..where((w) => w.id.equals(existing.id))).write(
        WatchHistoryCompanion(
          positionMs: Value(positionMs),
          durationMs: Value.absentIfNull(durationMs),
          played: played,
          watchedAt: Value(DateTime.now()),
        ),
      );
      return;
    }

    await _db
        .into(_db.watchHistory)
        .insert(
          WatchHistoryCompanion(
            profileId: Value(profileId),
            contentType: Value(contentType),
            vodItemId: Value(vodItemId),
            episodeId: Value(episodeId),
            positionMs: Value(positionMs),
            durationMs: Value(durationMs),
            played: played,
          ),
        );
  }

  Future<Map<int, WatchHistoryData>> getMovieProgressMap(
    String profileId,
    List<int> vodItemIds,
  ) => _progressMap(profileId, IptvContentType.movie, vodItemIds);

  Future<Map<int, WatchHistoryData>> getEpisodeProgressMap(
    String profileId,
    List<int> episodeRowIds,
  ) => _progressMap(profileId, IptvContentType.episode, episodeRowIds);

  Future<Map<int, WatchHistoryData>> _progressMap(
    String profileId,
    String contentType,
    List<int> ids,
  ) async {
    final movie = contentType == IptvContentType.movie;
    final byId = <int, WatchHistoryData>{};
    for (final chunk in chunked(ids)) {
      final rows =
          await (_db.select(_db.watchHistory)..where(
                (w) =>
                    w.profileId.equals(profileId) &
                    w.contentType.equals(contentType) &
                    (movie ? w.vodItemId : w.episodeId).isIn(chunk),
              ))
              .get();
      for (final row in rows) {
        byId[(movie ? row.vodItemId : row.episodeId)!] = row;
      }
    }
    return byId;
  }

  /// Movies and episodes with in-progress playback, newest first.
  Future<List<WatchHistoryData>> getContinueWatching(
    String profileId, {
    int limit = 20,
  }) {
    return (_db.select(_db.watchHistory)
          ..where(
            (w) =>
                w.profileId.equals(profileId) &
                w.contentType.isIn(const [
                  IptvContentType.movie,
                  IptvContentType.episode,
                ]) &
                w.positionMs.isBiggerThanValue(0) &
                w.played.equals(false),
          )
          ..orderBy([(w) => OrderingTerm.desc(w.watchedAt)])
          ..limit(limit))
        .get();
  }

  /// Sets the played flag, adding a history row for an item that was never
  /// started.
  Future<void> markPlayed({
    required String profileId,
    required String contentType,
    int? vodItemId,
    int? episodeId,
    bool played = true,
  }) async {
    final query = _db.update(_db.watchHistory)
      ..where(
        (w) =>
            w.profileId.equals(profileId) & w.contentType.equals(contentType),
      );
    if (vodItemId != null) {
      query.where((w) => w.vodItemId.equals(vodItemId));
    }
    if (episodeId != null) {
      query.where((w) => w.episodeId.equals(episodeId));
    }
    final updated = await query.write(
      WatchHistoryCompanion(
        played: Value(played),
        // A near-finished position would count as played again in userData.
        positionMs: played ? const Value.absent() : const Value(0),
      ),
    );
    if (updated > 0 || !played) return;

    await _db
        .into(_db.watchHistory)
        .insert(
          WatchHistoryCompanion(
            profileId: Value(profileId),
            contentType: Value(contentType),
            vodItemId: Value(vodItemId),
            episodeId: Value(episodeId),
            played: const Value(true),
          ),
        );
  }

  /// Removes every row owned by [profileId]: favorites and watch history.
  /// Used when a profile is deleted.
  Future<void> clearProfileData(String profileId) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.favorites,
      )..where((f) => f.profileId.equals(profileId))).go();
      await (_db.delete(
        _db.watchHistory,
      )..where((w) => w.profileId.equals(profileId))).go();
    });
  }

  Future<List<WatchHistoryData>> getAllHistory(
    String profileId, {
    String? contentType,
  }) {
    final query = _db.select(_db.watchHistory)
      ..where((w) => w.profileId.equals(profileId))
      ..orderBy([(w) => OrderingTerm.desc(w.watchedAt)]);
    if (contentType != null) {
      query.where((w) => w.contentType.equals(contentType));
    }
    return query.get();
  }

  Future<void> _trimChannelHistory(String profileId) async {
    final all =
        await (_db.select(_db.watchHistory)
              ..where(
                (w) =>
                    w.profileId.equals(profileId) &
                    w.contentType.equals(IptvContentType.channel),
              )
              ..orderBy([(w) => OrderingTerm.desc(w.watchedAt)]))
            .get();
    if (all.length > maxRecentChannelEntries) {
      final idsToDelete = all
          .sublist(maxRecentChannelEntries)
          .map((e) => e.id)
          .toList();
      await (_db.delete(
        _db.watchHistory,
      )..where((w) => w.id.isIn(idsToDelete))).go();
    }
  }
}
