import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:server_iptv/server_iptv.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late IptvDatabase db;
  late int playlistId;

  Future<int> addChannel(
    String name,
    String url, {
    String? tvgId,
    int? groupId,
  }) {
    return db
        .into(db.channels)
        .insert(
          ChannelsCompanion.insert(
            playlistId: playlistId,
            name: name,
            streamUrl: url,
            tvgId: Value(tvgId),
            groupId: Value(groupId),
          ),
        );
  }

  setUp(() async {
    db = IptvDatabase.withExecutor(NativeDatabase.memory());
    playlistId = await db
        .into(db.playlists)
        .insert(PlaylistsCompanion.insert(name: 'Test', sourceType: 'm3uUrl'));
  });

  tearDown(() => db.close());

  test('m3u titles keep their commas', () {
    final entries = M3uParser().parse('''
#EXTM3U
#EXTINF:-1 tvg-id="ct" group-title="Movies, Drama",Crouching Tiger, Hidden Dragon
https://example.com/vod/ct.mp4
#EXTINF:-1,Plain, Title
https://example.com/live/plain
''');
    expect(entries.map((e) => e.name), [
      'Crouching Tiger, Hidden Dragon',
      'Plain, Title',
    ]);
    expect(entries.first.groupTitle, 'Movies, Drama');
  });

  test(
    'updateVodEnrichment writes TMDB fields and keeps provider data',
    () async {
      final vod = VodRepository(db);
      final id = await db
          .into(db.vodItems)
          .insert(
            VodItemsCompanion.insert(
              playlistId: playlistId,
              streamId: 42,
              name: 'Sintel 2010 1080p',
              streamIcon: const Value('https://provider/icon.jpg'),
            ),
          );

      await vod.updateVodEnrichment(
        id,
        backdropUrl: 'https://tmdb/backdrop.jpg',
        plot: 'A lonely warrior.',
        rating: 7.5,
        tmdbId: 45745,
      );

      final row = await vod.getVodById(id);
      expect(row!.backdropUrl, 'https://tmdb/backdrop.jpg');
      expect(row.plot, 'A lonely warrior.');
      expect(row.tmdbId, 45745);
      expect(row.streamIcon, 'https://provider/icon.jpg');

      final found = await vod.getVodByStreamId(playlistId, 42, isSeries: false);
      expect(found!.id, id);
    },
  );

  test(
    'duplicate detection groups by tvg-id and url, merge deletes losers',
    () async {
      final keep = await addChannel(
        'CNN HD',
        'https://a/cnn1',
        tvgId: 'cnn.us',
      );
      final dupe = await addChannel(
        'CNN FHD',
        'https://a/cnn2',
        tvgId: 'cnn.us',
      );
      await addChannel('Other', 'https://a/other');

      final service = DuplicateDetectionService(db);
      final groups = await service.detectDuplicates(playlistId);
      expect(groups, hasLength(1));
      expect(groups.first.channels.map((c) => c.id), containsAll([keep, dupe]));
      expect(groups.first.reason, DuplicateReason.tvgId);
      expect(groups.first.match, 'cnn.us');

      await db
          .into(db.favorites)
          .insert(
            FavoritesCompanion.insert(
              profileId: 'p1',
              itemKind: IptvItemKind.channel,
              refId: dupe,
            ),
          );

      await service.mergeChannels(keep, [keep, dupe]);
      final channels = ChannelRepository(db);
      expect(await channels.getChannelById(dupe), isNull);
      expect(await channels.getChannelById(keep), isNotNull);
      final favorites = await db.select(db.favorites).get();
      expect(favorites, isEmpty);
    },
  );

  test(
    'channel editing renames, renumbers, and deletes with cleanup',
    () async {
      final groupId = await db
          .into(db.channelGroups)
          .insert(
            ChannelGroupsCompanion.insert(
              playlistId: playlistId,
              name: 'News',
              providerName: 'News',
            ),
          );
      final id = await addChannel('BBC', 'https://a/bbc', groupId: groupId);

      final channels = ChannelRepository(db);
      await channels.renameChannel(id, 'BBC One');
      await channels.setChannelNumber(id, 101);
      var row = await channels.getChannelById(id);
      expect(row!.name, 'BBC One');
      expect(row.channelNumber, 101);

      expect(await channels.countChannelsInGroup(groupId), 1);
      await channels.renameGroup(groupId, 'World News');
      final groups = await channels.getGroupsForPlaylist(playlistId);
      expect(groups.single.name, 'World News');

      await db
          .into(db.favorites)
          .insert(
            FavoritesCompanion.insert(
              profileId: 'iptvp_test',
              itemKind: IptvItemKind.channel,
              refId: id,
            ),
          );
      await db
          .into(db.scheduledRecordings)
          .insert(
            ScheduledRecordingsCompanion.insert(
              playlistId: playlistId,
              channelId: id,
              title: 'News at Ten',
              programStart: DateTime.utc(2030),
              programEnd: DateTime.utc(2030, 1, 1, 1),
            ),
          );

      await channels.deleteChannels([id]);
      expect(await channels.getChannelById(id), isNull);
      expect(await db.select(db.favorites).get(), isEmpty);
      expect(await db.select(db.scheduledRecordings).get(), isEmpty);
    },
  );

  test('xtream streams carry the provider added date', () {
    final movie = XtreamStream.fromJson({
      'stream_id': 1,
      'name': 'Movie',
      'added': '1700000000',
    });
    expect(movie.addedAt, DateTime.utc(2023, 11, 14, 22, 13, 20));

    final series = XtreamStream.fromJson({
      'series_id': 2,
      'name': 'Show',
      'last_modified': '1700000000',
    });
    expect(series.addedAt, movie.addedAt);
    expect(XtreamStream.fromJson({'stream_id': 3}).addedAt, isNull);
  });

  test('xtream details read list entries and get_vod_info alike', () {
    final series = XtreamStream.fromJson({
      'series_id': 7,
      'name': 'Show',
      'plot': 'A plot.',
      'genre': 'Drama / Crime',
      'releaseDate': '2019-04-02',
      'rating': '7.5',
      'backdrop_path': ['', 'https://img.test/back.jpg'],
    }).details;
    expect(series.plot, 'A plot.');
    expect(series.genre, 'Drama / Crime');
    expect(series.year, 2019);
    expect(series.rating, 7.5);
    expect(series.backdropUrl, 'https://img.test/back.jpg');

    final movie = XtreamDetails.fromJson({
      'description': 'From info.',
      'duration': '01:42:10',
      'tmdb_id': '603',
      'rating': '0',
      'genre': '',
    });
    expect(movie.plot, 'From info.');
    expect(movie.durationSeconds, 6130);
    expect(movie.tmdbId, 603);
    expect(movie.rating, isNull);
    expect(movie.genre, isNull);
  });

  test('a year suffix comes off and the rest of the name stays', () {
    String title(String raw) => splitTitleYear(raw).title;
    expect(title('Avengers: Infinity War - 2018'), 'Avengers: Infinity War');
    expect(splitTitleYear('Cowboy Bebop (1998)').year, 1998);
    expect(title('Transylvania 6-5000 - 1985'), 'Transylvania 6-5000');
    expect(title('ATL - 2006'), 'ATL');
    expect(title('CSI - Vegas'), 'CSI - Vegas');
    expect(title('NFL 2025-2026'), 'NFL 2025-2026');
    expect(title('Blade Runner 2049'), 'Blade Runner 2049');
    expect(
      title('The Room Next Door (2024) [CAM]'),
      'The Room Next Door (2024) [CAM]',
    );
    expect(splitTitleYear('Blade Runner 2049').year, isNull);

    final search = cleanVodTitle('Blade Runner 2049 - 2017');
    expect(search.title, 'Blade Runner 2049');
    expect(search.year, 2017);
    expect(cleanVodTitle('ATL - 2006').title, 'ATL');
    expect(cleanVodTitle('EN - The Hammer - 2023').title, 'The Hammer');
  });

  test('episode titles drop the show and number panels repeat', () {
    expect(episodeTitleOnly('The Office - S01E02 - The Wake'), 'The Wake');
    expect(episodeTitleOnly('Show S2 E10: Finale'), 'Finale');
    expect(episodeTitleOnly('The Office - S01E02'), isNull);
    expect(episodeTitleOnly('Pilot'), 'Pilot');
    expect(episodeTitleOnly(''), isNull);
  });

  test('xtream names lose the padding panels put around them', () {
    expect(XtreamStream.fromJson({'name': ' :AHL  15 '}).name, ':AHL  15');
    expect(
      XtreamCategory.fromJson({'category_name': ' Sports '}).name,
      'Sports',
    );
  });
}
