import 'dart:collection';

import 'package:drift/drift.dart';

import '../db/iptv_database.dart';
import '../models/xtream_models.dart';
import '../services/vod_title.dart' show splitGenres;
import 'chunks.dart';
import 'watch_state_repository.dart' show IptvItemKind;

extension XtreamDetailsColumns on XtreamDetails {
  /// [base] with these details added. What the panel didn't send keeps the
  /// value [base] already has, since copyWith overwrites with any Value.
  VodItemsCompanion onto(VodItemsCompanion base) {
    Value<T>? some<T>(T? v) => v == null ? null : Value(v);
    return base.copyWith(
      plot: some(plot),
      genre: some(genre),
      year: some(year),
      rating: some(rating),
      durationSeconds: some(durationSeconds),
      backdropUrl: some(backdropUrl),
      tmdbId: some(tmdbId),
    );
  }
}

class VodRepository {
  final IptvDatabase _db;

  VodRepository(this._db);

  /// Writes provider details onto a row, only into columns that are still
  /// empty, so the provider never replaces what TMDB enrichment wrote.
  Future<void> fillVodDetails(int id, XtreamDetails details) async {
    final fill = _fillMissing(details.onto(const VodItemsCompanion()));
    if (fill == null) return;
    await (_db.update(_db.vodItems)..where((v) => v.id.equals(id))).write(fill);
  }

  Insertable<VodItem>? _fillMissing(VodItemsCompanion c) {
    final t = _db.vodItems;
    Expression<T>? fill<T extends Object>(
      GeneratedColumn<T> column,
      Value<T?> value,
    ) {
      final v = value.present ? value.value : null;
      return v == null ? null : coalesce<T>([column, Variable<T>(v)]);
    }

    final update = VodItemsCompanion.custom(
      plot: fill(t.plot, c.plot),
      genre: fill(t.genre, c.genre),
      year: fill(t.year, c.year),
      rating: fill(t.rating, c.rating),
      durationSeconds: fill(t.durationSeconds, c.durationSeconds),
      backdropUrl: fill(t.backdropUrl, c.backdropUrl),
      tmdbId: fill(t.tmdbId, c.tmdbId),
    );
    return update.toColumns(false).isEmpty ? null : update;
  }

  /// Syncs the playlist's movie and series rows with a fresh provider catalog.
  /// Rows match by stream id and kind, so surviving rows keep their ids, TMDB
  /// enrichment and added date. Rows the provider dropped are deleted with
  /// their favorites and history, and a dropped series takes its
  /// cached seasons and episodes with it.
  Future<void> syncVodForPlaylist(
    int playlistId,
    List<VodItemsCompanion> items,
  ) async {
    await _db.transaction(() async {
      final existing =
          await (_db.selectOnly(_db.vodItems)
                ..addColumns([
                  _db.vodItems.id,
                  _db.vodItems.streamId,
                  _db.vodItems.isSeries,
                ])
                ..where(_db.vodItems.playlistId.equals(playlistId))
                ..orderBy([OrderingTerm.asc(_db.vodItems.id)]))
              .get();
      final idsByKey = <(int, bool), ListQueue<int>>{};
      for (final row in existing) {
        final key = (
          row.read(_db.vodItems.streamId)!,
          row.read(_db.vodItems.isSeries)!,
        );
        idsByKey
            .putIfAbsent(key, ListQueue.new)
            .add(row.read(_db.vodItems.id)!);
      }

      final keptSeries = <int>{};
      await _db.batch((batch) {
        final inserts = <VodItemsCompanion>[];
        for (final item in items) {
          final streamId = item.streamId.value;
          final isSeries = item.isSeries.present && item.isSeries.value;
          if (isSeries) keptSeries.add(streamId);
          final ids = idsByKey[(streamId, isSeries)];
          if (ids != null && ids.isNotEmpty) {
            final id = ids.removeFirst();
            // Only the importer's own columns, with addedAt only when the
            // provider sent one. streamIcon stays out because TMDB enrichment
            // may have swapped in its own poster.
            batch.update(
              _db.vodItems,
              VodItemsCompanion(
                name: item.name,
                containerExtension: item.containerExtension,
                addedAt: item.addedAt,
              ),
              where: (v) => v.id.equals(id),
            );
            final details = _fillMissing(item);
            if (details != null) {
              batch.update(
                _db.vodItems,
                details,
                where: (v) => v.id.equals(id),
              );
            }
          } else {
            inserts.add(item);
          }
        }
        batch.insertAll(_db.vodItems, inserts);
      });

      final staleIds = <int>[];
      final staleSeries = <int>[];
      for (final MapEntry(key: (streamId, isSeries), value: ids)
          in idsByKey.entries) {
        if (ids.isEmpty) continue;
        staleIds.addAll(ids);
        // A leftover duplicate shares its seasons with the row that stayed.
        if (isSeries && !keptSeries.contains(streamId)) {
          staleSeries.add(streamId);
        }
      }

      for (final chunk in chunked(staleIds)) {
        await (_db.delete(_db.favorites)..where(
              (f) => f.itemKind.equals(IptvItemKind.vod) & f.refId.isIn(chunk),
            ))
            .go();
        await (_db.delete(
          _db.watchHistory,
        )..where((w) => w.vodItemId.isIn(chunk))).go();
        await (_db.delete(_db.vodItems)..where((v) => v.id.isIn(chunk))).go();
      }

      for (final chunk in chunked(staleSeries)) {
        final episodeIds =
            await (_db.selectOnly(_db.seriesEpisodes)
                  ..addColumns([_db.seriesEpisodes.id])
                  ..where(
                    _db.seriesEpisodes.playlistId.equals(playlistId) &
                        _db.seriesEpisodes.seriesId.isIn(chunk),
                  ))
                .map((row) => row.read(_db.seriesEpisodes.id)!)
                .get();
        await _deleteEpisodeHistory(episodeIds);
        await (_db.delete(_db.seriesEpisodes)..where(
              (e) => e.playlistId.equals(playlistId) & e.seriesId.isIn(chunk),
            ))
            .go();
        await (_db.delete(_db.seriesSeasons)..where(
              (s) => s.playlistId.equals(playlistId) & s.seriesId.isIn(chunk),
            ))
            .go();
        await (_db.delete(_db.seriesDetailsCache)..where(
              (c) => c.playlistId.equals(playlistId) & c.seriesId.isIn(chunk),
            ))
            .go();
      }
    });
  }

  Future<void> _deleteEpisodeHistory(List<int> episodeRowIds) async {
    for (final chunk in chunked(episodeRowIds)) {
      await (_db.delete(
        _db.watchHistory,
      )..where((w) => w.episodeId.isIn(chunk))).go();
    }
  }

  Future<VodItem?> getVodById(int id) {
    return (_db.select(
      _db.vodItems,
    )..where((v) => v.id.equals(id))).getSingleOrNull();
  }

  Future<VodItem?> getVodByStreamId(
    int playlistId,
    int streamId, {
    required bool isSeries,
  }) {
    return (_db.select(_db.vodItems)
          ..where(
            (v) =>
                v.playlistId.equals(playlistId) &
                v.streamId.equals(streamId) &
                v.isSeries.equals(isSeries),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  /// Writes TMDB fields onto a VOD row. Null arguments leave the existing
  /// column value alone so a partial match never erases provider data.
  Future<void> updateVodEnrichment(
    int id, {
    String? streamIcon,
    String? backdropUrl,
    String? logoUrl,
    String? tagline,
    String? plot,
    String? genre,
    int? year,
    double? rating,
    int? durationSeconds,
    int? tmdbId,
  }) async {
    await (_db.update(_db.vodItems)..where((v) => v.id.equals(id))).write(
      VodItemsCompanion(
        streamIcon: Value.absentIfNull(streamIcon),
        backdropUrl: Value.absentIfNull(backdropUrl),
        logoUrl: Value.absentIfNull(logoUrl),
        tagline: Value.absentIfNull(tagline),
        plot: Value.absentIfNull(plot),
        genre: Value.absentIfNull(genre),
        year: Value.absentIfNull(year),
        rating: Value.absentIfNull(rating),
        durationSeconds: Value.absentIfNull(durationSeconds),
        tmdbId: Value.absentIfNull(tmdbId),
      ),
    );
  }

  /// Newest catalog rows first. A null [isSeries] lists movies and series
  /// together.
  Future<List<VodItem>> getRecentlyAddedForPlaylists(
    List<int> playlistIds, {
    bool? isSeries,
    int limit = 60,
  }) {
    if (playlistIds.isEmpty) return Future.value(const []);
    final query = _db.select(_db.vodItems)
      ..where((v) => v.playlistId.isIn(playlistIds))
      ..orderBy([(v) => OrderingTerm.desc(v.addedAt)])
      ..limit(limit);
    if (isSeries != null) query.where((v) => v.isSeries.equals(isSeries));
    return query.get();
  }

  Future<List<VodItem>> getVodByIds(List<int> ids) async => [
    for (final chunk in chunked(ids))
      ...await (_db.select(_db.vodItems)..where((v) => v.id.isIn(chunk))).get(),
  ];

  /// Series rows keyed by (playlistId, streamId), for mapping episodes.
  Future<Map<(int, int), VodItem>> getSeriesByStreamIds(
    Set<(int, int)> keys,
  ) async {
    if (keys.isEmpty) return const {};
    final rows =
        await (_db.select(_db.vodItems)
              ..where(
                (v) =>
                    v.isSeries.equals(true) &
                    v.playlistId.isIn({for (final k in keys) k.$1}) &
                    v.streamId.isIn({for (final k in keys) k.$2}),
              )
              ..orderBy([(v) => OrderingTerm.asc(v.id)]))
            .get();
    final byKey = <(int, int), VodItem>{};
    for (final row in rows) {
      byKey.putIfAbsent((row.playlistId, row.streamId), () => row);
    }
    return byKey;
  }

  /// One page of the Movies and Shows catalog as (isChannel, rowId) pairs in
  /// page order. M3U movie files are VOD-flagged channel rows, so with
  /// [VodCatalogQuery.withChannelMovies] both tables page together in SQL.
  Future<List<({bool isChannel, int id})>> getCatalogPage(
    VodCatalogQuery query, {
    VodCatalogSort sort = VodCatalogSort.name,
    bool descending = false,
    int offset = 0,
    int? limit,
  }) async {
    final (union, variables) = _catalogUnion(query);
    final dir = descending ? 'DESC' : 'ASC';
    final orderBy = switch (sort) {
      VodCatalogSort.name => 'sort_name $dir, kind $dir, id $dir',
      // Channel movies have no date, year or rating, so they follow the
      // catalog rows by name, as they always have.
      _ => 'kind ASC, ${sort.name} $dir, sort_name ASC, id ASC',
    };
    final paging = limit != null || offset > 0
        ? ' LIMIT ${limit ?? -1} OFFSET $offset'
        : '';
    final rows = await _db
        .customSelect('$union ORDER BY $orderBy$paging', variables: variables)
        .get();
    return [
      for (final row in rows)
        (isChannel: row.read<int>('kind') == 1, id: row.read<int>('id')),
    ];
  }

  Future<int> countCatalog(VodCatalogQuery query) async {
    final (union, variables) = _catalogUnion(query);
    final row = await _db
        .customSelect(
          'SELECT COUNT(*) AS total FROM ($union)',
          variables: variables,
        )
        .getSingle();
    return row.read<int>('total');
  }

  (String, List<Variable<Object>>) _catalogUnion(VodCatalogQuery q) {
    final variables = <Variable<Object>>[];
    String bind(Object value) {
      variables.add(
        value is int ? Variable<int>(value) : Variable<String>(value as String),
      );
      return '?';
    }

    String where(String alias, String itemKind) {
      final sql = StringBuffer(
        '$alias.playlist_id IN (${q.playlistIds.map(bind).join(', ')})',
      );
      final profileId = q.profileId;
      if (profileId != null && q.favoritesOnly) {
        sql.write(
          ' AND $alias.id IN (SELECT ref_id FROM favorites '
          'WHERE profile_id = ${bind(profileId)} '
          'AND item_kind = ${bind(itemKind)})',
        );
      }
      final term = q.nameContains;
      if (term != null) {
        final escaped = term.replaceAllMapped(
          RegExp(r'[\\%_]'),
          (m) => '\\${m[0]}',
        );
        sql.write(" AND $alias.name LIKE ${bind('%$escaped%')} ESCAPE '\\'");
      }
      return sql.toString();
    }

    final vodWhere = StringBuffer(where('v', IptvItemKind.vod));
    if (q.isSeries case final isSeries?) {
      vodWhere.write(' AND v.is_series = ${isSeries ? 1 : 0}');
    }
    if (q.genreValues case final values?) {
      // Inlined as literals because a popular genre can match more distinct
      // values than SQLite allows bound variables.
      final literals = values.map(_db.typeMapping.mapToSqlLiteral).join(', ');
      vodWhere.write(' AND v.genre IN ($literals)');
    }
    if ((q.played, q.profileId) case (final played?, final profileId?)) {
      vodWhere.write(' AND ${_playedSql(played, profileId, bind)}');
    }
    var union =
        'SELECT 0 AS kind, v.id AS id, lower(v.name) AS sort_name, '
        'v.added_at AS added, COALESCE(v.year, 0) AS year, '
        'COALESCE(v.rating, 0) AS rating FROM vod_items v WHERE $vodWhere';
    // M3U movie files keep no progress, so they only count as unplayed.
    if (q.withChannelMovies &&
        (q.played == null || q.played == CatalogPlayed.unplayed)) {
      union +=
          ' UNION ALL SELECT 1, c.id, lower(c.name), NULL, 0, 0 '
          'FROM channels c WHERE c.is_vod = 1 AND '
          '${where('c', IptvItemKind.channel)}';
    }
    return (union, variables);
  }

  /// A movie is played or in progress by its own history row. A series is
  /// played once every cached episode is, and in progress while any episode
  /// is part way through.
  static String _playedSql(
    CatalogPlayed played,
    String profileId,
    String Function(Object) bind,
  ) {
    String history(String type, String column, String rest) =>
        'EXISTS (SELECT 1 FROM watch_history w '
        'WHERE w.profile_id = ${bind(profileId)} '
        "AND w.content_type = '$type' AND w.$column $rest)";
    const episodes =
        'FROM series_episodes e '
        'WHERE e.playlist_id = v.playlist_id AND e.series_id = v.stream_id';

    // Each call binds its own variable, so only the parts that end up in the
    // query are built, in query order.
    String moviePlayed() =>
        history('movie', 'vod_item_id', '= v.id AND w.played = 1');
    String seriesPlayed() =>
        'EXISTS (SELECT 1 $episodes) AND NOT EXISTS (SELECT 1 $episodes '
        "AND NOT ${history('episode', 'episode_id', '= e.id AND w.played = 1')})";
    const inProgress = 'AND w.played = 0 AND w.position_ms > 0';
    final (movie, series) = switch (played) {
      CatalogPlayed.played => (moviePlayed(), seriesPlayed()),
      CatalogPlayed.unplayed => (
        'NOT ${moviePlayed()}',
        'NOT (${seriesPlayed()})',
      ),
      CatalogPlayed.resumable => (
        history('movie', 'vod_item_id', '= v.id $inProgress'),
        'EXISTS (SELECT 1 $episodes AND '
            "${history('episode', 'episode_id', '= e.id $inProgress')})",
      ),
    };
    return '((v.is_series = 0 AND $movie) OR (v.is_series = 1 AND $series))';
  }

  /// How many episodes each series has cached and how many of them the
  /// profile finished, keyed by series row id. Series never opened have no
  /// cached episodes and no entry.
  Future<Map<int, ({int total, int played})>> getEpisodeCounts(
    List<VodItem> series, {
    String? profileId,
  }) async {
    final rowsByKey = <(int, int), List<int>>{};
    for (final s in series) {
      if (s.isSeries) {
        rowsByKey.putIfAbsent((s.playlistId, s.streamId), () => []).add(s.id);
      }
    }
    final counts = <int, ({int total, int played})>{};
    for (final keys in chunked(rowsByKey.keys.toList(), 400)) {
      final rows = await _db
          .customSelect(
            'SELECT e.playlist_id AS p, e.series_id AS s, COUNT(*) AS total, '
            'SUM(EXISTS (SELECT 1 FROM watch_history w '
            "WHERE w.profile_id = ? AND w.content_type = 'episode' "
            'AND w.episode_id = e.id AND w.played = 1)) AS played '
            'FROM series_episodes e WHERE '
            '${keys.map((_) => '(e.playlist_id = ? AND e.series_id = ?)').join(' OR ')} '
            'GROUP BY e.playlist_id, e.series_id',
            variables: [
              Variable<String>(profileId ?? ''),
              for (final (playlistId, seriesId) in keys) ...[
                Variable<int>(playlistId),
                Variable<int>(seriesId),
              ],
            ],
          )
          .get();
      for (final row in rows) {
        final key = (row.read<int>('p'), row.read<int>('s'));
        for (final id in rowsByKey[key] ?? const <int>[]) {
          counts[id] = (
            total: row.read<int>('total'),
            played: row.read<int>('played'),
          );
        }
      }
    }
    return counts;
  }

  Future<List<VodItem>> getSimilarByGenreForPlaylists(
    List<int> playlistIds,
    String genre,
    int excludeId, {
    int limit = 40,
  }) {
    if (playlistIds.isEmpty) return Future.value(const []);
    return (_db.select(_db.vodItems)
          ..where(
            (v) =>
                v.playlistId.isIn(playlistIds) &
                v.genre.like('%$genre%') &
                v.id.isNotValue(excludeId),
          )
          ..limit(limit))
        .get();
  }

  Future<List<String>> getAllGenresForPlaylists(List<int> playlistIds) async {
    final values = await getDistinctGenreValues(playlistIds);
    // Genre ids hash the lowercased name, so "Drama" and "drama" are one.
    final byKey = <String, String>{};
    for (final value in values) {
      for (final genre in splitGenres(value)) {
        byKey.putIfAbsent(genre.toLowerCase(), () => genre);
      }
    }
    return byKey.values.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  /// Every distinct raw genre column value, like "Action, Drama".
  Future<List<String>> getDistinctGenreValues(List<int> playlistIds) async {
    if (playlistIds.isEmpty) return const [];
    final genre = _db.vodItems.genre;
    final rows =
        await (_db.selectOnly(_db.vodItems, distinct: true)
              ..addColumns([genre])
              ..where(
                _db.vodItems.playlistId.isIn(playlistIds) & genre.isNotNull(),
              ))
            .get();
    return [for (final row in rows) row.read(genre)!];
  }

  Future<int> countVod(int playlistId, {bool seriesOnly = false}) async {
    final countExpr = _db.vodItems.id.count();
    final query = _db.selectOnly(_db.vodItems)
      ..addColumns([countExpr])
      ..where(
        _db.vodItems.playlistId.equals(playlistId) &
            _db.vodItems.isSeries.equals(seriesOnly),
      );
    final result = await query.getSingle();
    return result.read(countExpr) ?? 0;
  }

  /// The series catalog row whose Xtream series id is [streamId].
  Future<VodItem?> getSeriesByStreamId(int playlistId, int streamId) =>
      getVodByStreamId(playlistId, streamId, isSeries: true);

  /// Upserts the cached seasons and episodes for one series, drops the ones
  /// the provider no longer lists and stamps the fetch time. Episodes keep
  /// their row ids, so resume progress survives a refetch.
  Future<void> replaceSeriesDetails({
    required int playlistId,
    required int seriesId,
    required List<SeriesSeasonsCompanion> seasons,
    required List<SeriesEpisodesCompanion> episodes,
  }) async {
    await _db.transaction(() async {
      await _db.batch((batch) {
        for (final season in seasons) {
          batch.insert(
            _db.seriesSeasons,
            season,
            onConflict: DoUpdate(
              (_) => season,
              target: [
                _db.seriesSeasons.playlistId,
                _db.seriesSeasons.seriesId,
                _db.seriesSeasons.seasonNumber,
              ],
            ),
          );
        }
        for (final episode in episodes) {
          batch.insert(
            _db.seriesEpisodes,
            episode,
            onConflict: DoUpdate(
              (_) => episode,
              target: [
                _db.seriesEpisodes.playlistId,
                _db.seriesEpisodes.episodeId,
              ],
            ),
          );
        }
      });

      final seasonNumbers = {for (final s in seasons) s.seasonNumber.value};
      final staleSeasonIds = [
        for (final s in await getSeasonsForSeries(playlistId, seriesId))
          if (!seasonNumbers.contains(s.seasonNumber)) s.id,
      ];
      final episodeIds = {for (final e in episodes) e.episodeId.value};
      final staleEpisodeIds = [
        for (final e in await getEpisodesForSeries(playlistId, seriesId))
          if (!episodeIds.contains(e.episodeId)) e.id,
      ];
      await _deleteEpisodeHistory(staleEpisodeIds);
      for (final chunk in chunked(staleEpisodeIds)) {
        await (_db.delete(
          _db.seriesEpisodes,
        )..where((e) => e.id.isIn(chunk))).go();
      }
      for (final chunk in chunked(staleSeasonIds)) {
        await (_db.delete(
          _db.seriesSeasons,
        )..where((s) => s.id.isIn(chunk))).go();
      }
      await _db
          .into(_db.seriesDetailsCache)
          .insert(
            SeriesDetailsCacheCompanion.insert(
              playlistId: playlistId,
              seriesId: seriesId,
              fetchedAt: DateTime.now(),
            ),
            onConflict: DoUpdate(
              (_) =>
                  SeriesDetailsCacheCompanion(fetchedAt: Value(DateTime.now())),
              target: [
                _db.seriesDetailsCache.playlistId,
                _db.seriesDetailsCache.seriesId,
              ],
            ),
          );
    });
  }

  Future<List<SeriesSeason>> getSeasonsForSeries(int playlistId, int seriesId) {
    return (_db.select(_db.seriesSeasons)
          ..where(
            (s) =>
                s.playlistId.equals(playlistId) & s.seriesId.equals(seriesId),
          )
          ..orderBy([(s) => OrderingTerm.asc(s.seasonNumber)]))
        .get();
  }

  Future<List<SeriesEpisode>> getEpisodesForSeason(
    int playlistId,
    int seriesId,
    int seasonNumber,
  ) {
    return (_db.select(_db.seriesEpisodes)
          ..where(
            (e) =>
                e.playlistId.equals(playlistId) &
                e.seriesId.equals(seriesId) &
                e.seasonNumber.equals(seasonNumber),
          )
          ..orderBy([(e) => OrderingTerm.asc(e.episodeNumber)]))
        .get();
  }

  Future<List<SeriesEpisode>> getEpisodesForSeries(
    int playlistId,
    int seriesId,
  ) {
    return (_db.select(_db.seriesEpisodes)
          ..where(
            (e) =>
                e.playlistId.equals(playlistId) & e.seriesId.equals(seriesId),
          )
          ..orderBy([
            (e) => OrderingTerm.asc(e.seasonNumber),
            (e) => OrderingTerm.asc(e.episodeNumber),
          ]))
        .get();
  }

  Future<SeriesEpisode?> getEpisodeByRowId(int rowId) {
    return (_db.select(
      _db.seriesEpisodes,
    )..where((e) => e.id.equals(rowId))).getSingleOrNull();
  }

  Future<List<SeriesEpisode>> getEpisodesByRowIds(List<int> rowIds) async => [
    for (final chunk in chunked(rowIds))
      ...await (_db.select(
        _db.seriesEpisodes,
      )..where((e) => e.id.isIn(chunk))).get(),
  ];

  /// When the series details were last fetched, or null if never cached.
  Future<DateTime?> getSeriesDetailsFetchedAt(
    int playlistId,
    int seriesId,
  ) async {
    final row =
        await (_db.select(_db.seriesDetailsCache)..where(
              (c) =>
                  c.playlistId.equals(playlistId) & c.seriesId.equals(seriesId),
            ))
            .getSingleOrNull();
    return row?.fetchedAt;
  }
}

enum VodCatalogSort { name, added, year, rating }

enum CatalogPlayed { played, unplayed, resumable }

/// Filters for [VodRepository.getCatalogPage] and
/// [VodRepository.countCatalog].
class VodCatalogQuery {
  const VodCatalogQuery({
    required this.playlistIds,
    this.isSeries,
    this.withChannelMovies = false,
    this.profileId,
    this.favoritesOnly = false,
    this.genreValues,
    this.nameContains,
    this.played,
  });

  final List<int> playlistIds;

  /// Null lists movies and series together.
  final bool? isSeries;

  /// Adds the VOD-flagged channel rows M3U movie files import as.
  final bool withChannelMovies;

  /// With [favoritesOnly] or [played], keeps only what applies to this
  /// profile.
  final String? profileId;
  final bool favoritesOnly;
  final CatalogPlayed? played;

  /// Raw genre column values to keep, or null for no genre filter.
  final List<String>? genreValues;
  final String? nameContains;
}
