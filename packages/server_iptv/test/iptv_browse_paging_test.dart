import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';
import 'package:server_iptv/server_iptv.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const profile = 'iptvp_test_profile';
  late IptvDatabase db;
  late IptvMediaServerClient client;
  late int playlistId;
  var nextStreamId = 0;

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
    client.userId = profile;
    playlistId = await db
        .into(db.playlists)
        .insert(PlaylistsCompanion.insert(name: 'P', sourceType: 'xtream'));
  });

  tearDown(() => db.close());

  Future<void> addVod(
    String name, {
    String? genre,
    bool isSeries = false,
    DateTime? addedAt,
  }) => db.batch(
    (batch) => batch.insert(
      db.vodItems,
      VodItemsCompanion.insert(
        playlistId: playlistId,
        streamId: nextStreamId++,
        name: name,
        genre: Value(genre),
        isSeries: Value(isSeries),
        addedAt: addedAt != null ? Value(addedAt) : const Value.absent(),
      ),
    ),
  );

  List<String> names(Map<String, dynamic> result) => [
    for (final item in result['Items'] as List) (item as Map)['Name'] as String,
  ];

  test('genre hash is 32-bit FNV-1a over the lowercased name', () {
    expect(genreHash('a'), 0xe40c292c);
    expect(genreHash('Action'), genreHash('action'));
  });

  test('a genre id from getGenres filters getItems to that genre', () async {
    await addVod('Raid', genre: 'Action/Adventure');
    await addVod('Heat', genre: 'Action');
    await addVod('Quiet', genre: 'Drama');
    await addVod('Mixed', genre: 'Comedy | Action, Drama');

    final genres = (await client.itemsApi.getGenres())['Items'] as List;
    final action = genres.cast<Map<String, dynamic>>().firstWhere(
      (g) => g['Name'] == 'Action',
    );

    final result = await client.itemsApi.getItems(
      parentId: IptvLibraryIds.movies,
      genreIds: [action['Id'] as String],
      sortBy: 'SortName',
    );
    expect(names(result), ['Heat', 'Mixed', 'Raid']);
    expect(result['TotalRecordCount'], 3);

    final count = await client.itemsApi.getItems(
      genreIds: [action['Id'] as String],
      limit: 0,
    );
    expect(count['Items'], isEmpty);
    expect(count['TotalRecordCount'], 3);

    // An id no catalog genre hashes to matches nothing.
    final unknown = await client.itemsApi.getItems(genreIds: ['iptv_genre_1']);
    expect(unknown['Items'], isEmpty);
  });

  test(
    'the Latest row returns series for shows and both kinds mixed',
    () async {
      final now = DateTime.now();
      for (var i = 0; i < 5; i++) {
        await addVod('Movie $i', addedAt: now.subtract(Duration(days: i)));
      }
      await addVod(
        'Old Show',
        isSeries: true,
        addedAt: now.subtract(const Duration(days: 30)),
      );
      await addVod(
        'New Show',
        isSeries: true,
        addedAt: now.add(const Duration(hours: 1)),
      );

      final shows = await client.itemsApi.getLatestItems(
        parentId: IptvLibraryIds.shows,
        limit: 3,
      );
      expect(names(shows), ['New Show', 'Old Show']);

      final mixed = await client.itemsApi.getLatestItems(limit: 3);
      expect(names(mixed), ['New Show', 'Movie 0', 'Movie 1']);

      final movies = await client.itemsApi.getLatestItems(
        includeItemTypes: ['Movie'],
      );
      expect(names(movies), hasLength(5));
    },
  );

  test('movie paging spans catalog rows and M3U movie files', () async {
    String title(int i) => 'Movie ${i.toString().padLeft(2, '0')}';
    for (var i = 1; i <= 25; i++) {
      if (i == 13) continue;
      await addVod(title(i));
    }
    // Movie 13 is an M3U movie file, stored as a VOD-flagged channel row.
    await db
        .into(db.channels)
        .insert(
          ChannelsCompanion.insert(
            playlistId: playlistId,
            name: title(13),
            streamUrl: 'https://example.com/13.mp4',
            isVod: const Value(true),
          ),
        );

    final page = await client.itemsApi.getItems(
      parentId: IptvLibraryIds.movies,
      includeItemTypes: ['Movie'],
      sortBy: 'SortName',
      startIndex: 10,
      limit: 10,
    );
    expect(names(page), [for (var i = 11; i <= 20; i++) title(i)]);
    expect(page['TotalRecordCount'], 25);
    final file = (page['Items'] as List).cast<Map<String, dynamic>>()[2];
    expect((file['Id'] as String).startsWith('iptv_ch_'), isTrue);

    final descending = await client.itemsApi.getItems(
      parentId: IptvLibraryIds.movies,
      sortBy: 'SortName',
      sortOrder: 'Descending',
      limit: 2,
    );
    expect(names(descending), [title(25), title(24)]);

    final count = await client.itemsApi.getItems(
      parentId: IptvLibraryIds.movies,
      limit: 0,
    );
    expect(count['Items'], isEmpty);
    expect(count['TotalRecordCount'], 25);
  });

  test('channel paging applies the group allowlist', () async {
    final groups = [
      for (final name in ['Sports', 'News'])
        await db
            .into(db.channelGroups)
            .insert(
              ChannelGroupsCompanion.insert(
                playlistId: playlistId,
                name: name,
                providerName: name,
              ),
            ),
    ];
    for (var i = 1; i <= 8; i++) {
      final name = 'Ch $i';
      await db
          .into(db.channels)
          .insert(
            ChannelsCompanion.insert(
              playlistId: playlistId,
              name: name,
              streamUrl: 'https://example.com/$i.ts',
              channelNumber: Value(i),
              // Odd numbers are Sports, even numbers News.
              groupId: Value(groups[(i + 1) % 2]),
            ),
          );
    }
    await PersonalizationRepository(
      db,
    ).setEnabledGroupIds(profile, {groups[0]});

    // The allowlist leaves the Sports channels 1, 3, 5 and 7.
    final page = await client.liveTvApi.getChannels(startIndex: 1, limit: 2);
    expect(names(page), ['Ch 3', 'Ch 5']);
    expect(page['TotalRecordCount'], 4);

    final byNameDescending = await client.liveTvApi.getChannels(
      sortBy: 'SortName',
      sortOrder: 'Descending',
      limit: 1,
    );
    expect(names(byNameDescending), ['Ch 7']);

    // Another profile has no allowlist.
    client.userId = 'iptvp_other_profile';
    final all = await client.liveTvApi.getChannels(startIndex: 6, limit: 5);
    expect(names(all), ['Ch 7', 'Ch 8']);
    expect(all['TotalRecordCount'], 8);
  });

  test('search pages past the first page', () async {
    for (var i = 1; i <= 30; i++) {
      await addVod('Star ${i.toString().padLeft(2, '0')}', isSeries: i > 25);
    }
    await addVod('Moon');

    final second = await client.itemsApi.getItems(
      searchTerm: 'star',
      startIndex: 20,
      limit: 20,
    );
    expect(names(second), hasLength(10));
    expect(second['TotalRecordCount'], 30);

    final seriesOnly = await client.itemsApi.getItems(
      searchTerm: 'star',
      includeItemTypes: ['Series'],
      startIndex: 2,
      limit: 2,
    );
    expect(names(seriesOnly), ['Star 28', 'Star 29']);
    expect(seriesOnly['TotalRecordCount'], 5);
  });

  test('getItems with ids keeps order, favorites and progress', () async {
    await addVod('First');
    await addVod('Second');
    final rows = await db.select(db.vodItems).get();
    final first = rows.firstWhere((r) => r.name == 'First');
    final second = rows.firstWhere((r) => r.name == 'Second');
    String id(VodItem row) =>
        IptvVodId(playlistId: playlistId, vodRowId: row.id).encode();

    await client.userLibraryApi.markFavorite(id(second));
    await WatchStateRepository(db).upsertMovieProgress(
      profileId: profile,
      vodItemId: first.id,
      positionMs: 60000,
      durationMs: 600000,
    );

    final result = await client.itemsApi.getItems(
      ids: [id(second), 'iptv_vod_1_999999', id(first)],
    );
    final items = (result['Items'] as List).cast<Map<String, dynamic>>();
    expect(items.map((i) => i['Name']), ['Second', 'First']);
    expect((items[0]['UserData'] as Map)['IsFavorite'], isTrue);
    expect(
      (items[1]['UserData'] as Map)['PlaybackPositionTicks'],
      60000 * 10000,
    );

    final favorites = await client.itemsApi.getItems(isFavorite: true);
    expect(names(favorites), ['Second']);
    expect(favorites['TotalRecordCount'], 1);
  });
}
