import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';
import 'package:server_iptv/server_iptv.dart';

// Movie-file URLs like .mp4 and .mkv auto-detect as VOD. Live channels use
// .ts, .m3u8, or extension-less URLs.
const _m3u = '''
#EXTM3U
#EXTINF:-1 tvg-id="bigbuck" tvg-name="Big Buck Bunny" tvg-logo="https://example.com/bbb.jpg" group-title="Demo",Big Buck Bunny
https://example.com/streams/bbb.m3u8
#EXTINF:-1 tvg-id="sintel" tvg-name="Sintel" group-title="Demo",Sintel
https://example.com/streams/sintel.ts
#EXTINF:-1 group-title="News",No TVG Channel
https://example.com/streams/news
#EXTINF:-1 tvg-name="Tears of Steel" group-title="Movies",Tears of Steel
https://example.com/vod/tears.mp4
''';

Future<void> insertVod(IptvDatabase db, List<VodItemsCompanion> rows) =>
    db.batch((batch) => batch.insertAll(db.vodItems, rows));

Future<List<VodItem>> vodRows(IptvDatabase db, {required bool series}) =>
    (db.select(db.vodItems)..where((v) => v.isSeries.equals(series))).get();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late IptvDatabase db;
  late IptvMediaServerClient client;
  late File m3uFile;

  setUp(() async {
    db = IptvDatabase.withExecutor(NativeDatabase.memory());
    client = IptvMediaServerClient(
      database: db,
      credentials: IptvCredentialStore(),
      deviceInfo: const DeviceInfo(
        id: 'test-device',
        name: 'Test',
        appName: 'Moonfin',
        appVersion: '1.0',
      ),
    );
    client.userId = 'iptvp_test_profile';

    m3uFile = File(
      '${Directory.systemTemp.createTempSync('iptv_test').path}/list.m3u',
    );
    m3uFile.writeAsStringSync(_m3u);

    final service = PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: IptvCredentialStore(),
    );
    final playlistId = await service.addM3uFilePlaylist(
      name: 'Test Playlist',
      filePath: m3uFile.path,
    );
    expect(playlistId, isNotNull, reason: '${service.error}');
  });

  tearDown(() async {
    await db.close();
    m3uFile.parent.deleteSync(recursive: true);
  });

  test('imported channels surface through liveTvApi.getChannels', () async {
    final result = await client.liveTvApi.getChannels();
    final items = (result['Items'] as List).cast<Map<String, dynamic>>();

    expect(items, hasLength(3));
    expect(result['TotalRecordCount'], 3);

    for (final item in items) {
      expect(item['Id'], isA<String>());
      expect((item['Id'] as String).startsWith('iptv_ch_'), isTrue);
      expect(item['Type'], 'TvChannel');
      final userData = item['UserData'] as Map<String, dynamic>;
      expect(userData['IsFavorite'], isFalse);
    }

    final bbb = items.firstWhere((i) => i['Name'] == 'Big Buck Bunny');
    expect((bbb['ImageTags'] as Map)['Primary'], 'https://example.com/bbb.jpg');
    expect(
      client.imageApi.getPrimaryImageUrl(
        bbb['Id'] as String,
        tag: (bbb['ImageTags'] as Map)['Primary'] as String?,
      ),
      'https://example.com/bbb.jpg',
    );
  });

  test('getPlaybackInfo synthesizes a remote direct-play source', () async {
    final channels = await client.liveTvApi.getChannels();
    final first = (channels['Items'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((i) => i['Name'] == 'Big Buck Bunny');

    final info = await client.playbackApi.getPlaybackInfo(
      first['Id'] as String,
    );
    final sources = (info['MediaSources'] as List).cast<Map<String, dynamic>>();

    expect(sources, hasLength(1));
    final source = sources.first;
    expect(source['Path'], 'https://example.com/streams/bbb.m3u8');
    expect(source['IsRemote'], isTrue);
    expect(source['SupportsDirectPlay'], isTrue);
    expect(source['Container'], 'm3u8');
  });

  test('extension-less live channels default to a ts container', () async {
    final channels = await client.liveTvApi.getChannels();
    final channel = (channels['Items'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((i) => i['Name'] == 'No TVG Channel');

    final info = await client.playbackApi.getPlaybackInfo(
      channel['Id'] as String,
    );
    final source = (info['MediaSources'] as List)
        .cast<Map<String, dynamic>>()
        .first;
    expect(source['Path'], 'https://example.com/streams/news');
    expect(source['Container'], 'ts');
  });

  test('favorites round-trip per profile via userLibraryApi', () async {
    final channels = await client.liveTvApi.getChannels();
    final first = (channels['Items'] as List)
        .cast<Map<String, dynamic>>()
        .first;
    final id = first['Id'] as String;

    await client.userLibraryApi.markFavorite(id);
    var refreshed = await client.liveTvApi.getChannels();
    var item = (refreshed['Items'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((i) => i['Id'] == id);
    expect((item['UserData'] as Map)['IsFavorite'], isTrue);

    // A different profile doesn't share the favorite.
    client.userId = 'iptvp_other_profile';
    refreshed = await client.liveTvApi.getChannels();
    item = (refreshed['Items'] as List).cast<Map<String, dynamic>>().firstWhere(
      (i) => i['Id'] == id,
    );
    expect((item['UserData'] as Map)['IsFavorite'], isFalse);

    client.userId = 'iptvp_test_profile';
    await client.userLibraryApi.unmarkFavorite(id);
    refreshed = await client.liveTvApi.getChannels();
    item = (refreshed['Items'] as List).cast<Map<String, dynamic>>().firstWhere(
      (i) => i['Id'] == id,
    );
    expect((item['UserData'] as Map)['IsFavorite'], isFalse);
  });

  test(
    'aggregation-reachable stubs return empty results, never throw',
    () async {
      expect((await client.itemsApi.getResumeItems())['Items'], isEmpty);
      expect((await client.itemsApi.getNextUp())['Items'], isEmpty);
      expect((await client.itemsApi.getPlaylists())['Items'], isEmpty);
      expect((await client.itemsApi.getArtists())['Items'], isEmpty);
      expect((await client.itemsApi.getAlbumArtists())['Items'], isEmpty);
      expect(
        (await client.itemsApi.getItems(
          includeItemTypes: ['Playlist'],
        ))['Items'],
        isEmpty,
      );
      expect((await client.liveTvApi.getTimers())['Items'], isEmpty);
      expect((await client.liveTvApi.getRecordings())['Items'], isEmpty);
      // Views only appear for content the catalog has.
      final views = await client.userViewsApi.getUserViews();
      final viewIds = [
        for (final v in (views['Items'] as List)) (v as Map)['Id'],
      ];
      expect(viewIds, contains('iptv_lib_live'));
      // The .mp4 entry was imported as a VOD movie, so the Movies view exists.
      expect(viewIds, contains('iptv_lib_movies'));
    },
  );

  test('a catalog with no live channels has no Live TV view', () async {
    await (db.delete(db.channels)..where((c) => c.isVod.equals(false))).go();

    final views = await client.userViewsApi.getUserViews();
    final viewIds = [
      for (final v in (views['Items'] as List)) (v as Map)['Id'],
    ];
    expect(viewIds, isNot(contains('iptv_lib_live')));
    expect(viewIds, contains('iptv_lib_movies'));
  });

  test('mp4 playlist entries import as VOD movies with string ids', () async {
    final movies = await client.itemsApi.getItems(
      parentId: IptvLibraryIds.movies,
      includeItemTypes: ['Movie'],
    );
    final items = (movies['Items'] as List).cast<Map<String, dynamic>>();
    expect(items, hasLength(1));
    final tears = items.first;
    expect(tears['Name'], 'Tears of Steel');
    expect(tears['Type'], 'Movie');
    expect(tears['Id'], isA<String>());
    // M3U movie entries are VOD-flagged channel rows, so they keep channel
    // ids.
    expect((tears['Id'] as String).startsWith('iptv_ch_'), isTrue);

    final info = await client.playbackApi.getPlaybackInfo(
      tears['Id'] as String,
    );
    final sources = (info['MediaSources'] as List).cast<Map<String, dynamic>>();
    expect(sources, hasLength(1));
    expect(sources.first['Path'], 'https://example.com/vod/tears.mp4');
    expect(sources.first['IsRemote'], isTrue);
  });

  test(
    'enabled-groups allowlist narrows the channel lineup per profile',
    () async {
      final personalization = PersonalizationRepository(db);
      final groups = await personalization.getLiveGroupsWithCounts();
      // Demo (2 live channels), Movies (0 live, VOD only), News (1 live).
      expect(groups.map((g) => g.group.name), containsAll(['Demo', 'News']));

      final demo = groups.firstWhere((g) => g.group.name == 'Demo');
      expect(demo.channelCount, 2);

      await personalization.setEnabledGroupIds('iptvp_test_profile', {
        demo.group.id,
      });
      var result = await client.liveTvApi.getChannels();
      expect((result['Items'] as List), hasLength(2));

      // Another profile still sees the full lineup.
      client.userId = 'iptvp_other_profile';
      result = await client.liveTvApi.getChannels();
      expect((result['Items'] as List), hasLength(3));

      // Clearing the allowlist restores every group.
      client.userId = 'iptvp_test_profile';
      await personalization.setEnabledGroupIds('iptvp_test_profile', null);
      result = await client.liveTvApi.getChannels();
      expect((result['Items'] as List), hasLength(3));
    },
  );

  // Seeds a series with a fresh details cache so no provider fetch runs.
  Future<String> seedSpaceShow() async {
    final vodRepo = VodRepository(db);
    await insertVod(db, [
      VodItemsCompanion.insert(
        playlistId: 1,
        streamId: 900,
        name: 'Space Show',
        isSeries: const Value(true),
      ),
    ]);
    final series = (await vodRows(db, series: true)).single;
    await vodRepo.replaceSeriesDetails(
      playlistId: 1,
      seriesId: 900,
      seasons: [
        SeriesSeasonsCompanion.insert(
          playlistId: 1,
          seriesId: 900,
          seasonNumber: 1,
          episodeCount: const Value(2),
        ),
      ],
      episodes: [
        SeriesEpisodesCompanion.insert(
          playlistId: 1,
          seriesId: 900,
          episodeId: 9001,
          seasonNumber: 1,
          episodeNumber: const Value(1),
          title: 'Pilot',
        ),
        SeriesEpisodesCompanion.insert(
          playlistId: 1,
          seriesId: 900,
          episodeId: 9002,
          seasonNumber: 1,
          episodeNumber: const Value(2),
          title: 'Second Contact',
        ),
      ],
    );
    return IptvSeriesId(playlistId: 1, vodRowId: series.id).encode();
  }

  test(
    'series drill-down serves cached seasons and tracks episode progress',
    () async {
      final seriesEncodedId = await seedSpaceShow();

      final seasons = await client.itemsApi.getSeasons(seriesEncodedId);
      final seasonItems = (seasons['Items'] as List)
          .cast<Map<String, dynamic>>();
      expect(seasonItems, hasLength(1));
      expect(seasonItems.first['Type'], 'Season');
      expect(seasonItems.first['IndexNumber'], 1);

      final episodes = await client.itemsApi.getEpisodes(
        seriesEncodedId,
        seasonId: seasonItems.first['Id'] as String,
      );
      final episodeItems = (episodes['Items'] as List)
          .cast<Map<String, dynamic>>();
      expect(episodeItems, hasLength(2));
      expect(episodeItems.first['Name'], 'Pilot');
      expect(
        (episodeItems.first['Id'] as String).startsWith('iptv_ep_'),
        isTrue,
      );

      // Finish the pilot, then resume state and next up both reflect it.
      final pilotId = episodeItems.first['Id'] as String;
      await client.playbackApi.reportPlaybackProgress({
        'ItemId': pilotId,
        'PositionTicks': 22 * 60 * 1000 * 10000,
        'RunTimeTicks': 23 * 60 * 1000 * 10000,
      });

      final refreshed = await client.itemsApi.getEpisodes(seriesEncodedId);
      final pilot = (refreshed['Items'] as List)
          .cast<Map<String, dynamic>>()
          .firstWhere((e) => e['Id'] == pilotId);
      expect((pilot['UserData'] as Map)['Played'], isTrue);

      final nextUp = await client.itemsApi.getNextUp();
      final nextItems = (nextUp['Items'] as List).cast<Map<String, dynamic>>();
      expect(nextItems, hasLength(1));
      expect(nextItems.first['Name'], 'Second Contact');

      // A series counts its episodes so the detail screen doesn't read it as
      // fully watched.
      final series = await client.userLibraryApi.getItem(seriesEncodedId);
      expect(series['RecursiveItemCount'], refreshed['Items'].length);
      expect(
        (series['UserData'] as Map)['UnplayedItemCount'],
        (refreshed['Items'] as List).length - 1,
      );
    },
  );

  test(
    'getItem resolves episodes and seasons from resume and next up',
    () async {
      final seriesEncodedId = await seedSpaceShow();
      final episodes = await client.itemsApi.getEpisodes(seriesEncodedId);
      final episodeItems = (episodes['Items'] as List)
          .cast<Map<String, dynamic>>();
      final pilotId = episodeItems.first['Id'] as String;
      final secondId = episodeItems.last['Id'] as String;

      await client.playbackApi.reportPlaybackProgress({
        'ItemId': pilotId,
        'PositionTicks': 5 * 60 * 1000 * 10000,
        'RunTimeTicks': 23 * 60 * 1000 * 10000,
      });
      final resume = await client.itemsApi.getResumeItems();
      final resumeId =
          ((resume['Items'] as List).single as Map)['Id'] as String;
      expect(resumeId, pilotId);

      final pilot = await client.itemsApi.getItem(resumeId);
      expect(pilot['Type'], 'Episode');
      expect(pilot['Name'], 'Pilot');
      expect(pilot['SeriesName'], 'Space Show');
      expect(
        (pilot['UserData'] as Map)['PlaybackPositionTicks'],
        5 * 60 * 1000 * 10000,
      );

      final season = await client.itemsApi.getItem(pilot['SeasonId'] as String);
      expect(season['Type'], 'Season');
      expect(season['IndexNumber'], 1);

      // Marking a never-started episode played adds its history row, and
      // unmarking clears it again.
      await client.userLibraryApi.markPlayed(secondId);
      var second = await client.itemsApi.getItem(secondId);
      expect((second['UserData'] as Map)['Played'], isTrue);
      await client.userLibraryApi.unmarkPlayed(secondId);
      second = await client.itemsApi.getItem(secondId);
      expect((second['UserData'] as Map)['Played'], isFalse);
    },
  );

  test('editing a playlist keeps the fields the edit leaves out', () async {
    final service = PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: IptvCredentialStore(),
    );
    final before = (await PlaylistRepository(db).getAllPlaylists()).single;

    await service.updatePlaylist(id: before.id, name: 'Renamed', epgUrl: '');

    final after = (await PlaylistRepository(db).getAllPlaylists()).single;
    expect(after.name, 'Renamed');
    expect(after.filePath, before.filePath);
    expect(after.filePath, isNotNull);
    expect(after.epgUrl, isNull);
  });

  test('a refresh that fetches nothing keeps the existing catalog', () async {
    final playlistId = (await PlaylistRepository(
      db,
    ).getAllPlaylists()).single.id;
    m3uFile.writeAsStringSync('<html>Account expired</html>');

    final service = PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: IptvCredentialStore(),
    );
    await service.refreshPlaylist(playlistId);

    expect(service.error?.kind, PlaylistErrorKind.noChannelsInFile);
    final channels = await client.liveTvApi.getChannels();
    expect(channels['Items'] as List, hasLength(3));
  });

  test('clearing a profile removes only that profile\'s data', () async {
    final watchState = WatchStateRepository(db);
    final personalization = PersonalizationRepository(db);
    final channels = await client.liveTvApi.getChannels();
    final firstId = ((channels['Items'] as List).first as Map)['Id'] as String;

    for (final profile in ['iptvp_a', 'iptvp_b']) {
      client.userId = profile;
      await client.userLibraryApi.markFavorite(firstId);
      await client.playbackApi.reportPlaybackStart({
        'ItemId': firstId,
        'PositionTicks': 0,
      });
      await personalization.setEnabledGroupIds(profile, {1});
    }

    await watchState.clearProfileData('iptvp_a');
    await personalization.clearProfile('iptvp_a');

    expect(await watchState.getFavoriteRefIds('iptvp_a', 'channel'), isEmpty);
    expect(await watchState.getAllHistory('iptvp_a'), isEmpty);
    expect(await personalization.getEnabledGroupIds('iptvp_a'), isNull);

    expect(
      await watchState.getFavoriteRefIds('iptvp_b', 'channel'),
      isNotEmpty,
    );
    expect(await watchState.getAllHistory('iptvp_b'), isNotEmpty);
    expect(await personalization.getEnabledGroupIds('iptvp_b'), {1});
  });

  test(
    'archived guide programs flag catchup and resolve archive URLs',
    () async {
      // Give Sintel a catchup template and both channels a program from
      // yesterday, inside the 3 day archive window.
      await (db.update(
        db.channels,
      )..where((c) => c.name.equals('Sintel'))).write(
        const ChannelsCompanion(
          catchupMode: Value('default'),
          catchupSource: Value(
            'https://example.com/archive/{Y}-{m}-{d}/{H}{M}/{duration:60}.m3u8',
          ),
          catchupDays: Value(3),
        ),
      );

      final yesterday = DateTime.now().toUtc().subtract(
        const Duration(days: 1),
      );
      final startUtc = DateTime.utc(
        yesterday.year,
        yesterday.month,
        yesterday.day,
        10,
      );
      final start = startUtc.toLocal();
      String two(int v) => v.toString().padLeft(2, '0');
      final stamp =
          '${start.year}-${two(start.month)}-${two(start.day)}/'
          '${two(start.hour)}${two(start.minute)}';
      final end = start.add(const Duration(minutes: 90));
      final epg = EpgRepository(db);
      await epg.insertPrograms([
        EpgProgramsCompanion.insert(
          channelTvgId: 'sintel',
          title: 'Archived Show',
          startTime: start,
          endTime: end,
        ),
        EpgProgramsCompanion.insert(
          channelTvgId: 'bigbuck',
          title: 'No Archive Show',
          startTime: start,
          endTime: end,
        ),
      ]);

      final channels = await client.liveTvApi.getChannels();
      final channelItems = (channels['Items'] as List)
          .cast<Map<String, dynamic>>();
      final guide = await client.liveTvApi.getGuide(
        channelIds: [for (final c in channelItems) c['Id'] as String],
        startDate: start.subtract(const Duration(hours: 1)),
        endDate: end.add(const Duration(hours: 1)),
      );
      final programs = (guide['Items'] as List).cast<Map<String, dynamic>>();

      final archived = programs.firstWhere((p) => p['Name'] == 'Archived Show');
      final plain = programs.firstWhere((p) => p['Name'] == 'No Archive Show');
      expect(archived['SupportsCatchup'], isTrue);
      expect(plain['SupportsCatchup'], isFalse);

      final info = await client.playbackApi.getPlaybackInfo(
        archived['Id'] as String,
      );
      final sources = (info['MediaSources'] as List)
          .cast<Map<String, dynamic>>();
      expect(sources, hasLength(1));
      expect(
        sources.first['Path'],
        'https://example.com/archive/$stamp/90.m3u8',
      );

      // A channel without catchup yields no sources.
      final noInfo = await client.playbackApi.getPlaybackInfo(
        plain['Id'] as String,
      );
      expect(noInfo['MediaSources'], isEmpty);
    },
  );

  group('catchup URLs', () {
    final start = DateTime.utc(2026, 7, 17, 21, 30, 15);
    final end = start.add(const Duration(hours: 2));
    final now = start.add(const Duration(minutes: 10));
    int unix(DateTime t) => t.millisecondsSinceEpoch ~/ 1000;
    String two(int v) => v.toString().padLeft(2, '0');
    final local = start.toLocal();
    final localStamp =
        '${local.year}-${two(local.month)}-${two(local.day)}:'
        '${two(local.hour)}-${two(local.minute)}';

    String? expand(String template) =>
        expandCatchupTemplate(template, start: start, end: end, now: now);
    String? build(String mode, String streamUrl, [String? source]) =>
        buildCatchupUrl(
          streamUrl: streamUrl,
          catchupMode: mode,
          catchupSource: source,
          start: start,
          end: end,
          now: now,
        );

    test('placeholders mean what they mean in Kodi', () {
      expect(
        expand('x/{utc}/{utcend}/{lutc}/{duration}/{duration:60}/{offset:60}'),
        'x/${unix(start)}/${unix(end)}/${unix(now)}/7200/120/10',
      );
      expect(
        expand(r'x?from=${start}&to=${end}&t=${timestamp}&o=${offset}'),
        'x?from=${unix(start)}&to=${unix(end)}&t=${unix(now)}&o=600',
      );
      expect(
        expand('x/{Y}{m}{d}/{H}-{M}-{S}/{utc:Y-m-d H:M}/{catchup-id}'),
        'x/${local.year}${two(local.month)}${two(local.day)}/'
        '${two(local.hour)}-${two(local.minute)}-${two(local.second)}/'
        '${local.year}-${two(local.month)}-${two(local.day)} '
        '${two(local.hour)}:${two(local.minute)}/{catchup-id}',
      );
    });

    test('modes build the archive URL from the stream URL', () {
      expect(
        build('shift', 'http://h/ch/1.m3u8'),
        'http://h/ch/1.m3u8?utc=${unix(start)}&lutc=${unix(now)}',
      );
      expect(
        build('shift', 'http://h/ch?id=1'),
        'http://h/ch?id=1&utc=${unix(start)}&lutc=${unix(now)}',
      );
      expect(
        build('append', 'http://h/ch/1.m3u8', '?start={utc}'),
        'http://h/ch/1.m3u8?start=${unix(start)}',
      );
      expect(build('append', 'http://h/ch/1.m3u8'), isNull);
      expect(
        build('default', 'http://h/ch/1.m3u8', 'http://a/{utc}.ts'),
        'http://a/${unix(start)}.ts',
      );
      expect(build('default', 'http://h/ch/1.m3u8'), isNull);
      expect(
        build('fs', 'http://h/sport/mpegts'),
        'http://h/sport/timeshift_abs-${unix(start)}.ts',
      );
      expect(
        build('flussonic', 'http://h/sport/index.m3u8?token=a'),
        'http://h/sport/timeshift_rel-600.m3u8?token=a',
      );
      expect(
        build('flussonic', 'http://h/sport/mono.m3u8'),
        'http://h/sport/mono-timeshift_rel-600.m3u8',
      );
      expect(
        build('xc', 'http://h:8080/live/u/p/42.m3u8'),
        'http://h:8080/timeshift/u/p/120/$localStamp/42.m3u8',
      );
      expect(
        build('xc', 'http://h:8080/u/p/42'),
        'http://h:8080/timeshift/u/p/120/$localStamp/42.ts',
      );
    });

    test('Xtream timeshift uses the panel clock and escapes the login', () {
      expect(
        xtreamTimeshiftUrl(
          const XtreamCredentials(
            serverUrl: 'http://provider.example:8080/',
            username: 'u',
            password: 'p/w#1',
          ),
          42,
          start: start,
          end: end,
          serverOffset: const Duration(hours: 1),
        ),
        'http://provider.example:8080/timeshift/u/p%2Fw%231/120/'
        '2026-07-17:22-30/42.ts',
      );
    });
  });

  test('recording timers round-trip through the live TV API', () async {
    final start = DateTime.now().add(const Duration(hours: 2));
    final epg = EpgRepository(db);
    await epg.insertPrograms([
      EpgProgramsCompanion.insert(
        channelTvgId: 'sintel',
        title: 'Future Show',
        startTime: start,
        endTime: start.add(const Duration(hours: 1)),
      ),
    ]);

    final channels = await client.liveTvApi.getChannels();
    final channelIds = [
      for (final c in (channels['Items'] as List)) (c as Map)['Id'] as String,
    ];
    var guide = await client.liveTvApi.getGuide(
      channelIds: channelIds,
      startDate: start.subtract(const Duration(hours: 1)),
      endDate: start.add(const Duration(hours: 2)),
    );
    var program = ((guide['Items'] as List).cast<Map<String, dynamic>>())
        .firstWhere((p) => p['Name'] == 'Future Show');
    expect(program['TimerId'], isNull);

    await client.liveTvApi.createTimer(program['Id'] as String);
    // Creating the same timer twice keeps one schedule.
    await client.liveTvApi.createTimer(program['Id'] as String);

    final timers = await client.liveTvApi.getTimers();
    final timerItems = (timers['Items'] as List).cast<Map<String, dynamic>>();
    expect(timerItems, hasLength(1));
    expect(timerItems.first['Name'], 'Future Show');
    expect(timerItems.first['ChannelName'], 'Sintel');

    guide = await client.liveTvApi.getGuide(
      channelIds: channelIds,
      startDate: start.subtract(const Duration(hours: 1)),
      endDate: start.add(const Duration(hours: 2)),
    );
    program = ((guide['Items'] as List).cast<Map<String, dynamic>>())
        .firstWhere((p) => p['Name'] == 'Future Show');
    expect(program['TimerId'], timerItems.first['Id']);

    await client.liveTvApi.cancelTimer(timerItems.first['Id'] as String);
    final cancelled = await client.liveTvApi.getTimers();
    expect((cancelled['Items'] as List), isEmpty);
  });

  test('completed recordings list and resolve to their local files', () async {
    final recordings = RecordingsRepository(db);
    final id = await recordings.insertRecording(
      RecordingsCompanion.insert(
        title: 'Saved Show',
        filePath: '/tmp/saved_show.ts',
        status: const Value(IptvRecordingStatus.completed),
        durationMs: const Value(60000),
      ),
    );

    final listed = await client.liveTvApi.getRecordings();
    final items = (listed['Items'] as List).cast<Map<String, dynamic>>();
    expect(items, hasLength(1));
    expect(items.first['Name'], 'Saved Show');
    expect(items.first['Id'], 'iptv_rec_$id');

    final info = await client.playbackApi.getPlaybackInfo(
      items.first['Id'] as String,
    );
    final sources = (info['MediaSources'] as List).cast<Map<String, dynamic>>();
    expect(sources.first['Path'], '/tmp/saved_show.ts');
  });

  test('live channel playback report records a channel zap', () async {
    final channels = await client.liveTvApi.getChannels();
    final first = (channels['Items'] as List)
        .cast<Map<String, dynamic>>()
        .first;

    await client.playbackApi.reportPlaybackStart({
      'ItemId': first['Id'],
      'PositionTicks': 0,
    });

    final watchState = WatchStateRepository(db);
    final history = await watchState.getAllHistory('iptvp_test_profile');
    expect(history, hasLength(1));
    expect(history.first.contentType, 'channel');
  });

  // Rewrites the playlist file when given new content, then refreshes it.
  Future<void> refreshFile([String? content]) async {
    if (content != null) m3uFile.writeAsStringSync(content);
    final service = PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: IptvCredentialStore(),
    );
    await service.refreshPlaylist(1);
    expect(service.error, isNull);
  }

  Future<Map<String, int>> channelIdsByUrl() async => {
    for (final c in await db.select(db.channels).get()) c.streamUrl: c.id,
  };

  Future<Map<String, int>> groupIdsByName() async => {
    for (final g in await db.select(db.channelGroups).get()) g.name: g.id,
  };

  test(
    'refreshing identical content keeps ids, favorites, history and groups',
    () async {
      final channelsBefore = await channelIdsByUrl();
      final groupsBefore = await groupIdsByName();
      final bbbId = IptvChannelId(
        playlistId: 1,
        channelRowId: channelsBefore['https://example.com/streams/bbb.m3u8']!,
      ).encode();

      await client.userLibraryApi.markFavorite(bbbId);
      await client.playbackApi.reportPlaybackStart({
        'ItemId': bbbId,
        'PositionTicks': 0,
      });
      await PersonalizationRepository(
        db,
      ).setEnabledGroupIds('iptvp_test_profile', {groupsBefore['Demo']!});

      await refreshFile();

      // The map includes the .mp4 entry, so VOD-flagged channel rows are
      // covered too.
      expect(await channelIdsByUrl(), channelsBefore);
      expect(channelsBefore, hasLength(4));
      expect(await groupIdsByName(), groupsBefore);

      final lineup = ((await client.liveTvApi.getChannels())['Items'] as List)
          .cast<Map<String, dynamic>>();
      expect(lineup, hasLength(2));
      final bbb = lineup.firstWhere((i) => i['Id'] == bbbId);
      expect((bbb['UserData'] as Map)['IsFavorite'], isTrue);

      final history = await WatchStateRepository(
        db,
      ).getAllHistory('iptvp_test_profile');
      final zapped = await ChannelRepository(
        db,
      ).getChannelById(history.single.channelId!);
      expect(zapped?.name, 'Big Buck Bunny');
    },
  );

  test('deleting a playlist clears what pointed at its rows', () async {
    final channels = await channelIdsByUrl();
    final groups = await groupIdsByName();
    final bbbId = IptvChannelId(
      playlistId: 1,
      channelRowId: channels['https://example.com/streams/bbb.m3u8']!,
    ).encode();
    await client.userLibraryApi.markFavorite(bbbId);
    await client.playbackApi.reportPlaybackStart({
      'ItemId': bbbId,
      'PositionTicks': 0,
    });
    await PersonalizationRepository(
      db,
    ).setEnabledGroupIds('iptvp_test_profile', {groups['Demo']!});

    await PlaylistRepository(db).deletePlaylist(1);

    expect(await db.select(db.channels).get(), isEmpty);
    expect(await db.select(db.favorites).get(), isEmpty);
    expect(await db.select(db.watchHistory).get(), isEmpty);
    expect(await db.select(db.enabledGroups).get(), isEmpty);
    expect(await db.select(db.channelGroups).get(), isEmpty);
  });

  test(
    'a refresh drops removed channels with their favorites and adds new ones',
    () async {
      final before = await channelIdsByUrl();
      final groupsBefore = await groupIdsByName();
      final watchState = WatchStateRepository(db);
      for (final url in [
        'https://example.com/streams/bbb.m3u8',
        'https://example.com/streams/news',
      ]) {
        await watchState.toggleFavorite(
          profileId: 'iptvp_test_profile',
          itemKind: IptvItemKind.channel,
          refId: before[url]!,
        );
      }
      final personalization = PersonalizationRepository(db);
      await personalization.setEnabledGroupIds('iptvp_test_profile', {
        groupsBefore['Demo']!,
        groupsBefore['News']!,
      });

      // News loses its only channel, so the group goes too.
      await refreshFile(
        _m3u.replaceFirst(
          '#EXTINF:-1 group-title="News",No TVG Channel\n'
              'https://example.com/streams/news\n',
          '#EXTINF:-1 tvg-id="elephants" group-title="Demo",Elephants Dream\n'
              'https://example.com/streams/elephants.m3u8\n',
        ),
      );

      final after = await channelIdsByUrl();
      expect(after.containsKey('https://example.com/streams/news'), isFalse);
      expect(after['https://example.com/streams/elephants.m3u8'], isNotNull);
      for (final url in [
        'https://example.com/streams/bbb.m3u8',
        'https://example.com/streams/sintel.ts',
        'https://example.com/vod/tears.mp4',
      ]) {
        expect(after[url], before[url]);
      }

      expect(
        await watchState.getFavoriteRefIds(
          'iptvp_test_profile',
          IptvItemKind.channel,
        ),
        [before['https://example.com/streams/bbb.m3u8']],
      );
      final groupsAfter = await groupIdsByName();
      expect(groupsAfter.containsKey('News'), isFalse);
      expect(groupsAfter['Demo'], groupsBefore['Demo']);
      expect(await personalization.getEnabledGroupIds('iptvp_test_profile'), {
        groupsBefore['Demo'],
      });
    },
  );

  test(
    'duplicate stream URLs keep one row per occurrence across refreshes',
    () async {
      const sintelUrl = 'https://example.com/streams/sintel.ts';
      await refreshFile(
        '$_m3u#EXTINF:-1 tvg-id="sintel" group-title="Demo",Sintel Backup\n'
        '$sintelUrl\n',
      );

      Future<List<Channel>> sintelRows() async =>
          (await db.select(db.channels).get())
              .where((c) => c.streamUrl == sintelUrl)
              .toList()
            ..sort((a, b) => a.id.compareTo(b.id));

      final before = await sintelRows();
      expect(before.map((c) => c.name), ['Sintel', 'Sintel Backup']);

      await refreshFile();

      final after = await sintelRows();
      expect(after.map((c) => c.id), before.map((c) => c.id));
      expect(after.map((c) => c.name), ['Sintel', 'Sintel Backup']);
    },
  );

  test(
    'provider details fill empty columns and leave TMDB ones alone',
    () async {
      final vod = VodRepository(db);
      final base = VodItemsCompanion.insert(
        playlistId: 1,
        streamId: 100,
        name: 'Big Movie',
        isSeries: const Value(false),
      );
      await vod.syncVodForPlaylist(1, [base]);
      final row = (await vodRows(db, series: false)).single;
      await vod.updateVodEnrichment(row.id, plot: 'From TMDB');

      // A refresh carries the panel's own details for the same movie.
      await vod.syncVodForPlaylist(1, [
        const XtreamDetails(plot: 'From the panel', genre: 'Drama').onto(base),
      ]);
      var refreshed = (await vodRows(db, series: false)).single;
      expect(refreshed.id, row.id);
      expect(refreshed.plot, 'From TMDB');
      expect(refreshed.genre, 'Drama');

      await vod.fillVodDetails(
        row.id,
        const XtreamDetails(durationSeconds: 6130, genre: 'Comedy'),
      );
      refreshed = (await vod.getVodById(row.id))!;
      expect(refreshed.durationSeconds, 6130);
      expect(refreshed.genre, 'Drama');
    },
  );

  test(
    'VOD sync keeps movie ids and TMDB fields and drops removed series',
    () async {
      final vod = VodRepository(db);
      final watchState = WatchStateRepository(db);
      VodItemsCompanion movie(String name) => VodItemsCompanion.insert(
        playlistId: 1,
        streamId: 100,
        name: name,
        streamIcon: const Value('https://provider.example/poster.jpg'),
        isSeries: const Value(false),
      );

      await vod.syncVodForPlaylist(1, [
        movie('Big Movie'),
        VodItemsCompanion.insert(
          playlistId: 1,
          streamId: 900,
          name: 'Space Show',
          isSeries: const Value(true),
        ),
      ]);
      final movieRow = (await vodRows(db, series: false)).single;
      final seriesRow = (await vodRows(db, series: true)).single;
      await vod.updateVodEnrichment(
        movieRow.id,
        streamIcon: 'https://tmdb.example/poster.jpg',
        backdropUrl: 'https://tmdb.example/backdrop.jpg',
        tmdbId: 42,
      );
      await vod.replaceSeriesDetails(
        playlistId: 1,
        seriesId: 900,
        seasons: [
          SeriesSeasonsCompanion.insert(
            playlistId: 1,
            seriesId: 900,
            seasonNumber: 1,
          ),
        ],
        episodes: [
          SeriesEpisodesCompanion.insert(
            playlistId: 1,
            seriesId: 900,
            episodeId: 9001,
            seasonNumber: 1,
            title: 'Pilot',
          ),
        ],
      );
      final episode = (await vod.getEpisodesForSeries(1, 900)).single;
      await watchState.upsertEpisodeProgress(
        profileId: 'iptvp_test_profile',
        episodeId: episode.id,
        positionMs: 60000,
      );
      await watchState.toggleFavorite(
        profileId: 'iptvp_test_profile',
        itemKind: IptvItemKind.vod,
        refId: seriesRow.id,
      );

      await vod.syncVodForPlaylist(1, [movie('Big Movie (2020)')]);

      final resynced = (await vodRows(db, series: false)).single;
      expect(resynced.id, movieRow.id);
      expect(resynced.name, 'Big Movie (2020)');
      expect(resynced.tmdbId, 42);
      expect(resynced.backdropUrl, 'https://tmdb.example/backdrop.jpg');
      expect(resynced.streamIcon, 'https://tmdb.example/poster.jpg');

      expect(await vodRows(db, series: true), isEmpty);
      expect(await vod.getSeasonsForSeries(1, 900), isEmpty);
      expect(await vod.getEpisodesForSeries(1, 900), isEmpty);
      expect(await vod.getSeriesDetailsFetchedAt(1, 900), isNull);
      expect(
        await watchState.getFavoriteRefIds(
          'iptvp_test_profile',
          IptvItemKind.vod,
        ),
        isEmpty,
      );
      expect(await watchState.getAllHistory('iptvp_test_profile'), isEmpty);
    },
  );

  test(
    'refetching series details keeps episode ids and their progress',
    () async {
      await seedSpaceShow();
      final vod = VodRepository(db);
      final watchState = WatchStateRepository(db);
      final pilot = (await vod.getEpisodesForSeries(1, 900)).first;
      await watchState.upsertEpisodeProgress(
        profileId: 'iptvp_test_profile',
        episodeId: pilot.id,
        positionMs: 5 * 60 * 1000,
        durationMs: 23 * 60 * 1000,
      );

      // The provider retitles the pilot and stops listing the second episode.
      await vod.replaceSeriesDetails(
        playlistId: 1,
        seriesId: 900,
        seasons: [
          SeriesSeasonsCompanion.insert(
            playlistId: 1,
            seriesId: 900,
            seasonNumber: 1,
            episodeCount: const Value(1),
          ),
        ],
        episodes: [
          SeriesEpisodesCompanion.insert(
            playlistId: 1,
            seriesId: 900,
            episodeId: 9001,
            seasonNumber: 1,
            episodeNumber: const Value(1),
            title: 'Pilot (Remastered)',
          ),
        ],
      );

      final episodes = await vod.getEpisodesForSeries(1, 900);
      expect(episodes.single.id, pilot.id);
      expect(episodes.single.title, 'Pilot (Remastered)');
      expect((await vod.getSeasonsForSeries(1, 900)).single.episodeCount, 1);
      final progress = await watchState.getEpisodeProgressMap(
        'iptvp_test_profile',
        [pilot.id],
      );
      expect(progress[pilot.id]?.positionMs, 5 * 60 * 1000);
    },
  );

  test('the guide fills placeholders only for the channels it shows', () async {
    final channels = ((await client.liveTvApi.getChannels())['Items'] as List)
        .cast<Map<String, dynamic>>();
    final shown = channels.first;
    final now = DateTime.now();

    final guide = await client.liveTvApi.getGuide(
      channelIds: [shown['Id'] as String],
      startDate: now,
      endDate: now.add(const Duration(hours: 6)),
    );

    final programs = (guide['Items'] as List).cast<Map<String, dynamic>>();
    expect(programs, isNotEmpty);
    expect(programs.map((p) => p['Name']).toSet(), {shown['Name']});
    expect(programs.map((p) => p['ChannelId']).toSet(), {shown['Id']});
    final stored = await db.select(db.epgPrograms).get();
    expect(stored.map((p) => p.channelTvgId).toSet(), hasLength(1));
  });

  test('channels that share a tvg id both get its guide', () async {
    final sintel = await (db.select(
      db.channels,
    )..where((c) => c.tvgId.equals('sintel'))).getSingle();
    final twinId = await db
        .into(db.channels)
        .insert(
          ChannelsCompanion.insert(
            playlistId: sintel.playlistId,
            name: 'Sintel HD',
            streamUrl: 'https://example.com/streams/sintel-hd.ts',
            tvgId: const Value('sintel'),
          ),
        );
    final now = DateTime.now();
    await EpgRepository(db).insertPrograms([
      EpgProgramsCompanion.insert(
        channelTvgId: 'sintel',
        title: 'Sintel Live',
        startTime: now.subtract(const Duration(minutes: 30)),
        endTime: now.add(const Duration(minutes: 30)),
      ),
    ]);
    String idOf(int rowId) => IptvChannelId(
      playlistId: sintel.playlistId,
      channelRowId: rowId,
    ).encode();

    final guide = await client.liveTvApi.getGuide(
      channelIds: [idOf(sintel.id), idOf(twinId)],
      startDate: now,
      endDate: now.add(const Duration(hours: 1)),
    );

    final programs = (guide['Items'] as List).cast<Map<String, dynamic>>();
    expect(
      {for (final p in programs) p['ChannelId']},
      {idOf(sintel.id), idOf(twinId)},
    );
    expect(programs.map((p) => p['Name']).toSet(), {'Sintel Live'});
  });

  test('editor changes and removals survive a refresh', () async {
    final ids = await channelIdsByUrl();
    final groups = await groupIdsByName();
    final bbb = ids['https://example.com/streams/bbb.m3u8']!;
    final channels = ChannelRepository(db);
    await channels.renameChannel(bbb, 'Bunny');
    await channels.setChannelNumber(bbb, 7);
    await DuplicateDetectionService(
      db,
    ).mergeChannels(bbb, [bbb, ids['https://example.com/streams/news']!]);
    await channels.renameGroup(groups['Demo']!, 'Picks');
    final personalization = PersonalizationRepository(db);
    await personalization.setEnabledGroupIds('iptvp_test_profile', {
      groups['Demo']!,
    });

    await refreshFile();

    final after = {
      for (final c in await db.select(db.channels).get()) c.streamUrl: c,
    };
    expect(after, isNot(contains('https://example.com/streams/news')));
    final bunny = after['https://example.com/streams/bbb.m3u8']!;
    expect(bunny.id, bbb);
    expect(bunny.name, 'Bunny');
    expect(bunny.channelNumber, 7);
    expect(await groupIdsByName(), containsPair('Picks', groups['Demo']));
    expect(await personalization.getEnabledGroupIds('iptvp_test_profile'), {
      groups['Demo']!,
    });
  });

  test('an allowlist with no groups on it hides every channel', () async {
    final personalization = PersonalizationRepository(db);
    await personalization.setEnabledGroupIds('iptvp_test_profile', {});
    expect(
      await personalization.getEnabledGroupIds('iptvp_test_profile'),
      equals(<int>{}),
    );
    expect((await client.liveTvApi.getChannels())['Items'], isEmpty);

    await personalization.setEnabledGroupIds('iptvp_test_profile', null);
    expect((await client.liveTvApi.getChannels())['Items'], hasLength(3));
  });

  test('a timer goes to the twin channel its program was picked on', () async {
    final sintel = await (db.select(
      db.channels,
    )..where((c) => c.tvgId.equals('sintel'))).getSingle();
    final twinId = await db
        .into(db.channels)
        .insert(
          ChannelsCompanion.insert(
            playlistId: sintel.playlistId,
            name: 'Sintel HD',
            streamUrl: 'https://example.com/streams/sintel-hd.ts',
            tvgId: const Value('sintel'),
          ),
        );
    final start = DateTime.now().add(const Duration(hours: 1));
    await EpgRepository(db).insertPrograms([
      EpgProgramsCompanion.insert(
        channelTvgId: 'sintel',
        title: 'Sintel Later',
        startTime: start,
        endTime: start.add(const Duration(hours: 1)),
      ),
    ]);

    final guide = await client.liveTvApi.getGuide(
      channelIds: [
        IptvChannelId(
          playlistId: sintel.playlistId,
          channelRowId: twinId,
        ).encode(),
      ],
      startDate: start,
      endDate: start.add(const Duration(hours: 1)),
    );
    final program = (guide['Items'] as List)
        .cast<Map<String, dynamic>>()
        .singleWhere((p) => p['Name'] == 'Sintel Later');
    await client.liveTvApi.createTimer(program['Id'] as String);

    final schedule = (await RecordingsRepository(
      db,
    ).getActiveSchedules()).single;
    expect(schedule.channelId, twinId);
  });

  test(
    'the library filters by watched state and counts series episodes',
    () async {
      await seedSpaceShow();
      final vod = VodRepository(db);
      final watchState = WatchStateRepository(db);
      await insertVod(db, [
        VodItemsCompanion.insert(
          playlistId: 1,
          streamId: 77,
          name: 'Half Watched',
        ),
      ]);
      final movie = await vod.getVodByStreamId(1, 77, isSeries: false);
      await watchState.upsertMovieProgress(
        profileId: 'iptvp_test_profile',
        vodItemId: movie!.id,
        positionMs: 60 * 1000,
        durationMs: 100 * 60 * 1000,
      );
      final episodes = await vod.getEpisodesForSeries(1, 900);
      Future<void> finish(SeriesEpisode episode) => watchState.markPlayed(
        profileId: 'iptvp_test_profile',
        contentType: IptvContentType.episode,
        episodeId: episode.id,
      );
      await finish(episodes.first);

      Future<List<String>> names(List<String> filters) async {
        final result = await client.itemsApi.getItems(
          includeItemTypes: const ['Movie', 'Series'],
          filters: filters,
        );
        return [
          for (final item in result['Items'] as List)
            (item as Map)['Name'] as String,
        ]..sort();
      }

      expect(await names(['IsResumable']), ['Half Watched']);
      expect(await names(['IsPlayed']), isEmpty);
      expect(await names(['IsUnplayed']), [
        'Half Watched',
        'Space Show',
        'Tears of Steel',
      ]);
      expect(await names(['Likes']), isEmpty);

      final shows = await client.itemsApi.getItems(
        includeItemTypes: const ['Series'],
      );
      final show = (shows['Items'] as List).single as Map<String, dynamic>;
      expect(show['RecursiveItemCount'], 2);
      expect((show['UserData'] as Map)['UnplayedItemCount'], 1);

      await finish(episodes.last);
      expect(await names(['IsPlayed']), ['Space Show']);
    },
  );

  test('a series opened for the first time loads', () async {
    await insertVod(db, [
      VodItemsCompanion.insert(
        playlistId: 1,
        streamId: 901,
        name: 'Never Opened',
        isSeries: const Value(true),
      ),
    ]);
    final id = IptvSeriesId(
      playlistId: 1,
      vodRowId: (await vodRows(db, series: true)).single.id,
    ).encode();

    // The page asks for all three at once, and they share one fetch.
    final results = await Future.wait([
      client.itemsApi.getItem(id),
      client.itemsApi.getSeasons(id),
      client.itemsApi.getEpisodes(id),
    ]).timeout(const Duration(seconds: 5));
    expect(results.first['Name'], 'Never Opened');
  });

  test('next up keeps the same series id on two playlists apart', () async {
    await seedSpaceShow();
    final otherPlaylist = await PlaylistRepository(db).insertPlaylist(
      PlaylistsCompanion.insert(name: 'Other', sourceType: 'm3uUrl'),
    );
    final vod = VodRepository(db);
    await insertVod(db, [
      VodItemsCompanion.insert(
        playlistId: otherPlaylist,
        streamId: 900,
        name: 'Other Show',
        isSeries: const Value(true),
      ),
    ]);
    await vod.replaceSeriesDetails(
      playlistId: otherPlaylist,
      seriesId: 900,
      seasons: [
        SeriesSeasonsCompanion.insert(
          playlistId: otherPlaylist,
          seriesId: 900,
          seasonNumber: 1,
        ),
      ],
      episodes: [
        for (final (number, title) in [(1, 'Other Pilot'), (2, 'Other Two')])
          SeriesEpisodesCompanion.insert(
            playlistId: otherPlaylist,
            seriesId: 900,
            episodeId: 9000 + number,
            seasonNumber: 1,
            episodeNumber: Value(number),
            title: title,
          ),
      ],
    );
    final watchState = WatchStateRepository(db);
    for (final playlistId in [1, otherPlaylist]) {
      await watchState.markPlayed(
        profileId: 'iptvp_test_profile',
        contentType: IptvContentType.episode,
        episodeId: (await vod.getEpisodesForSeries(playlistId, 900)).first.id,
      );
    }

    final nextUp = (await client.itemsApi.getNextUp())['Items'] as List;
    expect(
      {for (final item in nextUp) (item as Map)['Name']},
      {'Second Contact', 'Other Two'},
    );
  });

  test('a guide source that fails does not stop the next one', () async {
    final playlists = PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: IptvCredentialStore(),
    );
    await playlists.addM3uFilePlaylist(
      name: 'Down',
      filePath: m3uFile.path,
      epgUrl: 'http://down.test/epg.xml',
    );
    await playlists.addM3uFilePlaylist(
      name: 'Up',
      filePath: m3uFile.path,
      epgUrl: 'http://up.test/epg.xml',
    );
    final epg = EpgService(
      epgRepository: EpgRepository(db),
      playlistRepository: PlaylistRepository(db),
      credentialStore: IptvCredentialStore(),
      dio: Dio()..httpClientAdapter = _GuideAdapter(),
    );

    await epg.refreshAllSources();

    expect(epg.error, isNotNull);
    final stored = await db.select(db.epgPrograms).get();
    expect(stored.map((p) => p.title), contains('Sintel Live'));
  });
}

/// Fails for down.test and serves a one program guide everywhere else.
class _GuideAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.uri.host == 'down.test') {
      throw DioException.connectionError(
        requestOptions: options,
        reason: 'down',
      );
    }
    String stamp(DateTime t) {
      final u = t.toUtc();
      String two(int v) => v.toString().padLeft(2, '0');
      return '${u.year}${two(u.month)}${two(u.day)}'
          '${two(u.hour)}${two(u.minute)}00 +0000';
    }

    final now = DateTime.now();
    final start = stamp(now.subtract(const Duration(hours: 1)));
    final stop = stamp(now.add(const Duration(hours: 1)));
    return ResponseBody.fromString(
      '<tv><programme start="$start" stop="$stop" channel="sintel">'
      '<title>Sintel Live</title></programme></tv>',
      200,
    );
  }

  @override
  void close({bool force = false}) {}
}
