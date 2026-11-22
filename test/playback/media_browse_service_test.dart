import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/database/offline_database.dart'
    show DownloadedItem;
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/audiobook_resume_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/headless_session_bootstrap.dart';
import 'package:moonfin/playback/last_playback_session_store.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kPage = 'android.media.browse.extra.PAGE';
const _kPageSize = 'android.media.browse.extra.PAGE_SIZE';
const _kGroupTitle = 'android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT';
const _kSingleItemStyle = 'android.media.browse.CONTENT_STYLE_SINGLE_ITEM_HINT';
const _kCompletionStatus = 'android.media.extra.PLAYBACK_STATUS';
const _kCompletionPercentage =
    'androidx.media.MediaItem.Extras.COMPLETION_PERCENTAGE';

/// Serves [totalItems] fake albums with names spread across '#' and A-Z,
/// honoring the nameStartsWith/nameLessThan/startIndex/limit windows the same
/// way the Jellyfin/Emby items APIs do.
class _FakeItemsApi implements ItemsApi {
  _FakeItemsApi({
    required this.totalItems,
    this.delay,
    this.books,
    this.latestBooks,
    this.resume,
    this.itemsById,
    this.emptyViews = const {},
    this.recentTracks = const [],
    this.favAlbums = const [],
    this.favSongs = const [],
    this.favArtists = const [],
    this.artistTracks = const [],
    this.artistAlbums = const [],
  });

  /// Play history, served to the IsPlayed query.
  final List<Map<String, dynamic>> recentTracks;
  final List<Map<String, dynamic>> favAlbums;
  final List<Map<String, dynamic>> favSongs;
  final List<Map<String, dynamic>> favArtists;

  /// Served to artistIds queries, by included item type.
  final List<Map<String, dynamic>> artistTracks;
  final List<Map<String, dynamic>> artistAlbums;

  /// View ids that contain no audio; getItems with one of these as parentId
  /// returns nothing, so the content probe filters the view out.
  final Set<String> emptyViews;

  final int totalItems;
  final Duration? delay;
  int listCalls = 0;

  /// Optional fixed book dataset served when [getItems] is called with a
  /// parentId (the booklib fill), regardless of name filters. Books carry a
  /// SortName so the service can bucket them client-side.
  final List<Map<String, dynamic>>? books;

  /// Recently-added books returned by getLatestItems when a parentId (the book
  /// view) is passed; music latest (no parentId) returns empty.
  final List<Map<String, dynamic>>? latestBooks;

  /// Server-side resume rows (usually empty for this app's local tracking).
  final List<Map<String, dynamic>>? resume;

  /// Backs getItem lookups (e.g. local-resume books resolved for Home).
  final Map<String, Map<String, dynamic>>? itemsById;

  static String nameFor(int i) {
    final bucket = i % 27;
    if (bucket == 0) return '0 Item $i';
    return '${String.fromCharCode(64 + bucket)} Item $i';
  }

  Future<Map<String, dynamic>> _page(Invocation invocation) async {
    listCalls++;
    if (delay != null) await Future<void>.delayed(delay!);
    final parentId = invocation.namedArguments[#parentId] as String?;
    final startsWith = invocation.namedArguments[#nameStartsWith] as String?;
    final lessThan = invocation.namedArguments[#nameLessThan] as String?;
    final start = invocation.namedArguments[#startIndex] as int? ?? 0;
    final limit = invocation.namedArguments[#limit] as int?;
    final filters = invocation.namedArguments[#filters] as List<String>?;
    final types = invocation.namedArguments[#includeItemTypes] as List<String>?;
    final favorite = invocation.namedArguments[#isFavorite] as bool?;
    final artistIds = invocation.namedArguments[#artistIds] as List<String>?;
    final ids = invocation.namedArguments[#ids] as List<String>?;
    List<Map<String, dynamic>>? fixed;
    if (filters?.contains('IsPlayed') == true) {
      fixed = recentTracks;
    } else if (favorite == true) {
      fixed = invocation.memberName == #getAlbumArtists
          ? favArtists
          : types?.contains('Audio') == true
              ? favSongs
              : favAlbums;
    } else if (artistIds != null) {
      fixed = types?.contains('Audio') == true ? artistTracks : artistAlbums;
    } else if (ids != null) {
      fixed = [
        for (final id in ids) ?itemsById?[id],
      ];
    }
    if (fixed != null) {
      final end = limit == null ? fixed.length : limit.clamp(0, fixed.length);
      return {'Items': fixed.sublist(0, end)};
    }

    // Book libraries fetch by parentId with no name filters; the service
    // buckets the whole list client-side off each item's SortName.
    final matching = parentId != null && emptyViews.contains(parentId)
        ? const <Map<String, dynamic>>[]
        : parentId != null && books != null
        ? books!
        : <Map<String, dynamic>>[
            for (var i = 0; i < totalItems; i++)
              if ((startsWith == null || nameFor(i).startsWith(startsWith)) &&
                  (lessThan == null || nameFor(i).compareTo(lessThan) < 0))
                {'Id': 'a$i', 'Name': nameFor(i), 'Type': 'MusicAlbum'},
          ];
    final end =
        limit == null ? matching.length : (start + limit).clamp(0, matching.length).toInt();
    return {
      'Items': matching.sublist(start.clamp(0, matching.length), end),
      'TotalRecordCount': matching.length,
    };
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    switch (invocation.memberName) {
      case #getItems:
      case #getAlbumArtists:
        return _page(invocation);
      case #getGenres:
        final parentId = invocation.namedArguments[#parentId] as String?;
        return Future<Map<String, dynamic>>.value({
          'Items': [
            if (parentId == 'm1' || parentId == 'm2')
              {'Id': 'g1', 'Name': 'Jazz', 'Type': 'MusicGenre'},
            if (parentId == 'mv')
              {'Id': 'g9', 'Name': 'Thriller', 'Type': 'Genre'},
          ],
        });
      case #getResumeItems:
        return Future<Map<String, dynamic>>.value({'Items': resume ?? const []});
      case #getLatestItems:
        final parentId = invocation.namedArguments[#parentId] as String?;
        return Future<Map<String, dynamic>>.value(
            {'Items': parentId != null ? (latestBooks ?? const []) : const []});
      case #getItem:
        final id = invocation.positionalArguments.first as String;
        final item = itemsById?[id];
        return item != null
            ? Future<Map<String, dynamic>>.value(item)
            : Future<Map<String, dynamic>>.error(StateError('no item $id'));
      default:
        return super.noSuchMethod(invocation);
    }
  }
}

class _FakeImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) =>
      'http://fake/Items/$itemId/Images/Primary?tag=$tag';

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeUserViewsApi implements UserViewsApi {
  _FakeUserViewsApi(this.views);

  final List<Map<String, dynamic>> views;

  @override
  Future<Map<String, dynamic>> getUserViews({
    bool includeHidden = false,
  }) async =>
      {'Items': views};

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this._itemsApi, {List<Map<String, dynamic>> views = const []})
      : _userViewsApi = _FakeUserViewsApi(views);

  final _FakeItemsApi _itemsApi;
  final _FakeUserViewsApi _userViewsApi;

  @override
  ItemsApi get itemsApi => _itemsApi;

  @override
  UserViewsApi get userViewsApi => _userViewsApi;

  final _imageApi = _FakeImageApi();

  @override
  ImageApi get imageApi => _imageApi;

  @override
  String? get accessToken => null;

  @override
  String get baseUrl => 'http://fake';

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeClientFactory implements MediaServerClientFactory {
  _FakeClientFactory(this._client);

  final MediaServerClient _client;

  @override
  Map<String, MediaServerClient> get clients => {'srv': _client};

  @override
  MediaServerClient getActiveClient() => _client;

  @override
  MediaServerClient? getClientIfExists(String serverId) =>
      serverId == 'srv' ? _client : null;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

// Two saved servers, registered in this order, so getActiveClient (the last
// one) is not the signed-in account's.
class _TwoServerFactory implements MediaServerClientFactory {
  _TwoServerFactory(this._signedIn, this._other);

  final MediaServerClient _signedIn;
  final MediaServerClient _other;

  @override
  Map<String, MediaServerClient> get clients =>
      {'signedin': _signedIn, 'other': _other};

  @override
  MediaServerClient getActiveClient() => _other;

  @override
  MediaServerClient? getClientIfExists(String serverId) => clients[serverId];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeSessionRepository implements SessionRepository {
  @override
  String? get activeServerId => 'signedin';

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeBootstrap implements HeadlessSessionBootstrap {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeResumeService implements AudiobookResumeService {
  _FakeResumeService([this.entries = const {}, this.byServer = const {}]);

  final Map<String, int> entries;

  /// Positions keyed 'serverId|itemId', checked before [entries].
  final Map<String, int> byServer;

  @override
  Future<Map<String, int>> loadAll(String serverId) async => entries;

  @override
  Future<int?> load(String serverId, String itemId) async =>
      byServer['$serverId|$itemId'] ?? entries[itemId];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeOfflineRepository implements OfflineRepository {
  _FakeOfflineRepository([this.rows = const []]);

  final List<DownloadedItem> rows;

  @override
  Future<List<DownloadedItem>> getItems({
    String? type,
    bool onlyCompleted = false,
  }) async =>
      rows.where((r) => !onlyCompleted || r.downloadStatus == 2).toList();

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

DownloadedItem _download(
  Map<String, dynamic> raw, {
  int status = 2,
  String serverId = 'srv',
}) =>
    DownloadedItem(
      itemId: raw['Id'] as String,
      serverId: serverId,
      type: raw['Type'] as String,
      name: raw['Name'] as String,
      metadataJson: jsonEncode(raw),
      downloadStatus: status,
      downloadProgress: status == 2 ? 1 : 0.5,
      fileSizeBytes: 1,
      playbackPositionTicks: 0,
      progressSynced: true,
      qualityPreset: 'original',
      downloadSource: 'manual',
    );

class _FakeSessionStore implements LastPlaybackSessionStore {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

MediaBrowseService _service(
  _FakeItemsApi api, {
  List<Map<String, dynamic>> views = const [],
  Map<String, int> localResume = const {},
  List<DownloadedItem> downloads = const [],
  Map<String, int> resumeByServer = const {},
}) =>
    MediaBrowseService(
      _FakeClientFactory(_FakeClient(api, views: views)),
      _FakeBootstrap(),
      _FakeResumeService(localResume, resumeByServer),
      _FakeSessionStore(),
      _FakeOfflineRepository(downloads),
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('MediaBrowseService car browse', () {
    test('section node ends on 27 letter tiles under one heading', () async {
      final api = _FakeItemsApi(totalItems: 300);
      final service = _service(api);

      final nodes = await service.getChildren('sec|albums|srv');

      // No play history, so the letter tiles are all there is.
      expect(nodes.length, 27);
      expect(nodes.first.id, 'sec|albums|srv|az|#');
      expect(nodes.first.title, '#');
      expect(nodes.last.id, 'sec|albums|srv|az|Z');
      expect(nodes.every((n) => n.playable == false), isTrue);
      expect(
        nodes.map((n) => n.extras?[_kSingleItemStyle]).toSet(),
        {AndroidContentStyle.categoryGridItemHintValue},
      );
      expect(
        nodes.map((n) => n.extras?[_kGroupTitle]).toSet(),
        {'Browse by Letter'},
      );
      // The tiles still style each letter's albums as a cover grid.
      expect(
        nodes.first.extras?[AndroidContentStyle.browsableHintKey],
        AndroidContentStyle.gridItemHintValue,
      );
    });

    test('letter folder lists only matching names in a single call',
        () async {
      final api = _FakeItemsApi(totalItems: 1200);
      final service = _service(api);

      final bItems = await service.getChildren('sec|albums|srv|az|B');

      expect(bItems, isNotEmpty);
      expect(bItems.every((i) => i.title.startsWith('B')), isTrue);
      expect(api.listCalls, 1);

      final hashItems = await service.getChildren('sec|albums|srv|az|#');
      expect(hashItems, isNotEmpty);
      expect(hashItems.every((i) => i.title.startsWith('0')), isTrue);
      expect(api.listCalls, 2);
    });

    test('paged host gets exactly the requested window from the cache',
        () async {
      final api = _FakeItemsApi(totalItems: 1200);
      final service = _service(api);

      final all = await service.getChildren('sec|albums|srv|az|B');
      final callsAfterFill = api.listCalls;

      final page1 = await service.getChildren(
        'sec|albums|srv|az|B',
        {_kPage: 1, _kPageSize: 10},
      );
      expect(page1.length, 10);
      expect(page1.first.title, all[10].title);
      expect(api.listCalls, callsAfterFill);

      final pastEnd = await service.getChildren(
        'sec|albums|srv|az|B',
        {_kPage: 999, _kPageSize: 10},
      );
      expect(pastEnd, isEmpty);
      expect(api.listCalls, callsAfterFill);
    });

    test('concurrent requests for one node share a single fetch', () async {
      final api = _FakeItemsApi(
        totalItems: 300,
        delay: const Duration(milliseconds: 10),
      );
      final service = _service(api);

      final results = await Future.wait([
        service.getChildren('sec|albums|srv|az|A'),
        service.getChildren('sec|albums|srv|az|A'),
      ]);

      expect(results[0], isNotEmpty);
      expect(results[0].length, results[1].length);
      expect(api.listCalls, 1);
    });
  });

  group('MediaBrowseService book letter buckets', () {
    final books = <Map<String, dynamic>>[
      {'Id': 'b1', 'Name': 'apple', 'SortName': 'apple', 'Type': 'Audio'},
      {'Id': 'b2', 'Name': 'Banana Saga', 'SortName': 'banana saga', 'Type': 'AudioBook'},
      {'Id': 'b3', 'Name': 'The Hobbit', 'SortName': 'Hobbit, The', 'Type': 'AudioBook'},
      {'Id': 'b4', 'Name': 'Ábba Lives', 'SortName': 'Ábba Lives', 'Type': 'AudioBook'},
      {'Id': 'b5', 'Name': 'Ølavg', 'SortName': 'Ølavg', 'Type': 'AudioBook'},
      {'Id': 'b6', 'Name': 'Яндекс', 'SortName': 'Яндекс', 'Type': 'AudioBook'},
      {'Id': 'b7', 'Name': '中文书', 'SortName': '中文书', 'Type': 'AudioBook'},
      {'Id': 'b8', 'Name': '123 Numbers', 'SortName': '123 Numbers', 'Type': 'AudioBook'},
      {'Id': 'b9', 'Name': 'NoSort Book', 'Type': 'AudioBook'},
    ];

    List<String> bookIds(List<MediaItem> items) =>
        items.map((m) => m.id.split('|').last).toList();

    test('buckets by SortName client-side, case-insensitively', () async {
      final api = _FakeItemsApi(totalItems: 0, books: books);
      final service = _service(api);

      final a = await service.getChildren('sec|booklib|srv|view1|az|A');
      final b = await service.getChildren('sec|booklib|srv|view1|az|B');

      expect(bookIds(a), containsAll(['b1', 'b4'])); // lowercase 'apple' + accented 'Ábba'
      expect(bookIds(b), contains('b2')); // lowercase 'banana saga'
      // One whole-library fetch fills all folders; the sibling is cache-served.
      expect(api.listCalls, 1);
    });

    test('files items by SortName, not display Name', () async {
      final api = _FakeItemsApi(totalItems: 0, books: books);
      final service = _service(api);

      final h = await service.getChildren('sec|booklib|srv|view1|az|H');
      final t = await service.getChildren('sec|booklib|srv|view1|az|T');

      expect(bookIds(h), contains('b3')); // 'Hobbit, The' -> H
      expect(bookIds(t), isNot(contains('b3'))); // not under its Name letter T
    });

    test('accented Latin folds to its base letter', () async {
      final api = _FakeItemsApi(totalItems: 0, books: books);
      final service = _service(api);

      final o = await service.getChildren('sec|booklib|srv|view1|az|O');

      expect(bookIds(o), contains('b5')); // 'Ø' -> O
    });

    test('# is a true catch-all for digits and non-Latin scripts', () async {
      final api = _FakeItemsApi(totalItems: 0, books: books);
      final service = _service(api);

      final hash = await service.getChildren('sec|booklib|srv|view1|az|#');

      expect(bookIds(hash), containsAll(['b6', 'b7', 'b8'])); // Cyrillic, CJK, digit
      expect(bookIds(hash), isNot(contains('b1'))); // A-Z items excluded
      expect(bookIds(hash), isNot(contains('b5'))); // 'Ø' folded to O, not '#'
    });

    test('empty SortName falls back to display Name', () async {
      final api = _FakeItemsApi(totalItems: 0, books: books);
      final service = _service(api);

      final n = await service.getChildren('sec|booklib|srv|view1|az|N');

      expect(bookIds(n), contains('b9'));
    });

    test('a letter bucket is capped at the binder parcel size', () async {
      final many = <Map<String, dynamic>>[
        for (var i = 0; i < 600; i++)
          {'Id': 'x$i', 'Name': 'Aaa $i', 'SortName': 'aaa $i', 'Type': 'AudioBook'},
      ];
      final api = _FakeItemsApi(totalItems: 0, books: many);
      final service = _service(api);

      final a = await service.getChildren('sec|booklib|srv|view1|az|A');

      expect(a.length, 500); // capped for the host, though all 600 were fetched
      expect(api.listCalls, 1);
    });

    test('concurrent distinct letters share one fetch', () async {
      final api = _FakeItemsApi(
        totalItems: 0,
        books: books,
        delay: const Duration(milliseconds: 10),
      );
      final service = _service(api);

      final results = await Future.wait([
        service.getChildren('sec|booklib|srv|view1|az|#'),
        service.getChildren('sec|booklib|srv|view1|az|A'),
      ]);

      expect(results[0], isNotEmpty);
      expect(results[1], isNotEmpty);
      expect(api.listCalls, 1);
    });
  });

  group('MediaBrowseService audiobook tab + home', () {
    final bookViews = [
      {'Id': 'view1', 'CollectionType': 'audiobooks', 'Name': 'Books'},
    ];
    // Any non-empty dataset keeps view1 alive through the content probe.
    final someBooks = [
      {'Id': 'p1', 'Name': 'Probe Book', 'Type': 'AudioBook'},
    ];

    test('books tab uses list hints so art-less letter folders are not grid',
        () async {
      final api = _FakeItemsApi(totalItems: 0, books: someBooks);
      final service = _service(api, views: bookViews);

      final tabs = await service.getChildren(AudioService.browsableRootId);
      final books = tabs.firstWhere((t) => t.id == 'tab|books');

      // List, not grid: grid would render the art-less letter folders as
      // broken-image tiles.
      expect(
        books.extras?[AndroidContentStyle.browsableHintKey],
        AndroidContentStyle.listItemHintValue,
      );
    });

    test('Home is not empty for an audiobook-only user with local resume',
        () async {
      // No music albums, empty server resume: Home used to return "No items".
      final api = _FakeItemsApi(
        totalItems: 0,
        books: someBooks,
        latestBooks: const [
          {'Id': 'nb1', 'Name': 'New Book 1', 'Type': 'AudioBook'},
          {'Id': 'nb2', 'Name': 'New Book 2', 'Type': 'AudioBook'},
        ],
        resume: const [],
        itemsById: const {
          'bk1': {'Id': 'bk1', 'Name': 'In Progress', 'Type': 'AudioBook'},
        },
      );
      final service = _service(api, views: bookViews, localResume: {'bk1': 5000});

      final home = await service.getChildren('tab|home');
      final ids = home.map((m) => m.id).toList();

      expect(home, isNotEmpty);
      // Local in-progress book surfaces as a book leaf (with its resume path).
      expect(ids, contains('book|srv|bk1'));
      // Recently added audiobooks are shelved too, and open the book page.
      expect(ids, containsAll(['bookpage|srv|nb1', 'bookpage|srv|nb2']));
    });

    test('ebook-only library is filtered out and the picker is skipped',
        () async {
      final api = _FakeItemsApi(
        totalItems: 0,
        books: someBooks,
        emptyViews: {'view0'},
      );
      final service = _service(api, views: [
        {'Id': 'view0', 'CollectionType': 'books', 'Name': 'Ebooks'},
        {'Id': 'view1', 'CollectionType': 'audiobooks', 'Name': 'Audio'},
      ]);

      final children = await service.getChildren('tab|books');

      // Only the audio library survives, so tab|books skips the library picker
      // and returns its letter folders directly.
      expect(children.length, 27);
      expect(children.first.id, 'sec|booklib|srv|view1|az|#');
    });

    test('library nodes carry the view Primary image when one exists',
        () async {
      final api = _FakeItemsApi(totalItems: 0, books: someBooks);
      final service = _service(api, views: [
        {
          'Id': 'view1',
          'CollectionType': 'audiobooks',
          'Name': 'With Art',
          'ImageTags': {'Primary': 'tag1'},
        },
        {'Id': 'view2', 'CollectionType': 'audiobooks', 'Name': 'No Art'},
      ]);

      final children = await service.getChildren('tab|books');
      final withArt =
          children.firstWhere((c) => c.id == 'sec|booklib|srv|view1');
      final noArt =
          children.firstWhere((c) => c.id == 'sec|booklib|srv|view2');

      expect(withArt.artUri, isNotNull);
      expect(withArt.artUri.toString(), contains('view1'));
      expect(noArt.artUri, isNull);
    });

    test('recent root returns empty instead of throwing', () async {
      // The fake session store throws on asRecentMediaItems; the host must
      // still get an answer or the resumption card spins.
      final api = _FakeItemsApi(totalItems: 0);
      final service = _service(api);

      final recent = await service.getChildren(AudioService.recentRootId);

      expect(recent, isEmpty);
    });
  });

  group('MediaBrowseService Listen Now, Library and pages', () {
    Map<String, dynamic> track(String id, String album, String artistId,
            {String? name}) =>
        {
          'Id': id,
          'Name': name ?? 'Track $id',
          'Type': 'Audio',
          'Album': album,
          'AlbumId': 'al-$album',
          'AlbumArtist': 'Artist $artistId',
          'AlbumArtists': [
            {'Name': 'Artist $artistId', 'Id': artistId},
          ],
        };
    final history = [
      track('t1', 'Rumours', 'ar1'),
      track('t2', 'Rumours', 'ar1'),
      track('t3', 'Thriller', 'ar2'),
    ];

    test('root tabs are Listen Now and Library, Downloads only with downloads',
        () async {
      final api = _FakeItemsApi(totalItems: 0);
      final plain = await _service(api)
          .getChildren(AudioService.browsableRootId);
      expect(plain.map((t) => t.id), ['tab|home', 'tab|music']);
      expect(plain.map((t) => t.title), ['Listen Now', 'Library']);
      expect(
        plain.last.extras?[AndroidContentStyle.browsableHintKey],
        AndroidContentStyle.categoryListItemHintValue,
      );

      final withDownloads = await _service(api, downloads: [
        _download({'Id': 'd1', 'Name': 'Song', 'Type': 'Audio'}),
      ]).getChildren(AudioService.browsableRootId);
      expect(withDownloads.map((t) => t.id).last, 'tab|downloads');

      // An unfinished download doesn't count.
      final partial = await _service(api, downloads: [
        _download({'Id': 'd1', 'Name': 'Song', 'Type': 'Audio'}, status: 1),
      ]).getChildren(AudioService.browsableRootId);
      expect(partial.map((t) => t.id), isNot(contains('tab|downloads')));
    });

    test('Library lists the five music categories without a server call',
        () async {
      final api = _FakeItemsApi(totalItems: 0);
      final library = await _service(api).getChildren('tab|music');

      expect(library.map((c) => c.id), [
        'sec|albums|srv',
        'sec|artists|srv',
        'sec|musicplaylists|srv',
        'sec|genres|srv',
        'sec|favorites|srv',
      ]);
      expect(api.listCalls, 0);
    });

    test('Listen Now starts with quick tiles, then Jump Back In', () async {
      final api = _FakeItemsApi(totalItems: 0, recentTracks: history);
      final home = await _service(api).getChildren('tab|home');
      final ids = home.map((m) => m.id).toList();

      expect(ids.take(3),
          ['shuffle|srv|all', 'sec|favorites|srv', 'sec|recent|srv']);
      expect(home.take(3).map((m) => m.extras?[_kSingleItemStyle]).toSet(),
          {AndroidContentStyle.categoryGridItemHintValue});
      // One tile per album, in play order.
      final jump =
          home.where((m) => m.extras?[_kGroupTitle] == 'Jump Back In');
      expect(jump.map((m) => m.id),
          ['album|srv|al-Rumours', 'album|srv|al-Thriller']);
    });

    test('albums and artists put recently played above the letter tiles',
        () async {
      final api = _FakeItemsApi(totalItems: 0, recentTracks: history);
      final service = _service(api);

      final albums = await service.getChildren('sec|albums|srv');
      expect(albums.take(2).map((m) => m.id),
          ['album|srv|al-Rumours', 'album|srv|al-Thriller']);
      expect(albums.first.extras?[_kGroupTitle], 'Recently Played');
      expect(albums.length, 2 + 27);
      expect(albums[2].id, 'sec|albums|srv|az|#');

      final artists = await service.getChildren('sec|artists|srv');
      expect(artists.take(2).map((m) => m.id),
          ['artist|srv|ar1', 'artist|srv|ar2']);
      expect(artists.length, 2 + 27);
      // One history fetch feeds both shelves.
      expect(api.listCalls, 1);
    });

    test('dropRecents forgets history shelves and keeps letter folders',
        () async {
      final api = _FakeItemsApi(totalItems: 30, recentTracks: history);
      final service = _service(api);
      await service.getChildren('tab|home');
      await service.getChildren('tab|music');
      await service.getChildren('sec|albums|srv');
      await service.getChildren('sec|albums|srv|az|A');

      expect(service.dropRecents(),
          unorderedEquals(['tab|home', 'sec|albums|srv']));

      // The letter folder still comes from the cache, while the albums root
      // and its history are fetched again.
      final calls = api.listCalls;
      await service.getChildren('sec|albums|srv|az|A');
      expect(api.listCalls, calls);
      await service.getChildren('sec|albums|srv');
      expect(api.listCalls, calls + 1);
    });

    test('an audiobook typed Audio stays out of the music history', () async {
      // Emby types an m4b as Audio. Its chapters and length mark it a book.
      final book = {
        ...track('bk', 'The Lighthouse Keeper', 'ar9'),
        'MediaType': 'Audio',
        'RunTimeTicks': 40 * 60 * 10000000,
        'Chapters': [
          {'Name': 'Arrival', 'StartPositionTicks': 0},
        ],
      };
      final api =
          _FakeItemsApi(totalItems: 0, recentTracks: [book, ...history]);
      final rows = await _service(api).getChildren('sec|recent|srv');

      expect(rows.map((r) => r.id), isNot(contains('track|srv|bk|recent|-')));
      expect(rows.length, history.length);
    });

    test('a Recently Played row queues the whole history', () async {
      final api = _FakeItemsApi(totalItems: 0, recentTracks: history);
      final service = _service(api);

      final rows = await service.getChildren('sec|recent|srv');
      expect(rows.map((r) => r.id).first, 'track|srv|t1|recent|-');

      final request = await service.resolvePlayRequest('track|srv|t2|recent|-');
      expect(request!.items.map((i) => i.id), ['t1', 't2', 't3']);
      expect(request.startIndex, 1);
    });

    test('artist page is shuffle, most played, then the albums', () async {
      final api = _FakeItemsApi(
        totalItems: 0,
        artistTracks: [track('t9', 'Rumours', 'ar1', name: 'Dreams')],
        artistAlbums: const [
          {'Id': 'al1', 'Name': 'Rumours', 'Type': 'MusicAlbum'},
        ],
      );
      final page = await _service(api).getChildren('artist|srv|ar1');

      expect(page.map((m) => m.id), [
        'shuffle|srv|artist|ar1',
        'track|srv|t9|top|ar1',
        'album|srv|al1',
      ]);
      expect(page[1].extras?[_kGroupTitle], 'Most Played');
      expect(page[1].displaySubtitle, 'Rumours');
      expect(page[2].extras?[_kSingleItemStyle],
          AndroidContentStyle.gridItemHintValue);
    });

    test('favorites shuffle only shows when there are favorite songs',
        () async {
      final none = await _service(_FakeItemsApi(
        totalItems: 0,
        favAlbums: const [
          {'Id': 'al1', 'Name': 'Thriller', 'Type': 'MusicAlbum'},
        ],
      )).getChildren('sec|favorites|srv');
      expect(none.map((m) => m.id), ['album|srv|al1']);

      final some = await _service(_FakeItemsApi(
        totalItems: 0,
        favSongs: [track('t1', 'Rumours', 'ar1')],
        favArtists: const [
          {'Id': 'ar1', 'Name': 'Fleetwood Mac', 'Type': 'MusicArtist'},
        ],
      )).getChildren('sec|favorites|srv');
      expect(some.map((m) => m.id),
          ['shuffle|srv|fav', 'artist|srv|ar1', 'track|srv|t1|fav|-']);
    });

    test('genres list per music library, and a genre opens on shuffle',
        () async {
      // Two music libraries that share a genre list it once, and other
      // libraries aren't asked.
      final service = _service(_FakeItemsApi(totalItems: 2), views: const [
        {'Id': 'm1', 'CollectionType': 'music', 'Name': 'Music'},
        {'Id': 'm2', 'CollectionType': 'music', 'Name': 'More Music'},
        {'Id': 'mv', 'CollectionType': 'movies', 'Name': 'Movies'},
      ]);
      final genres = await service.getChildren('sec|genres|srv');
      expect(genres.map((g) => g.id), ['genre|srv|g1']);
      expect(genres.single.title, 'Jazz');

      final jazz = await service.getChildren('genre|srv|g1');
      expect(jazz.first.id, 'shuffle|srv|genre|g1');
      expect(jazz.skip(1).every((m) => m.id.startsWith('album|srv|')), isTrue);
    });

    group('book page', () {
      const minute = 60 * 10000000;
      final book = {
        'Id': 'bk1',
        'Name': 'The Lighthouse',
        'Type': 'AudioBook',
        'AlbumArtist': 'Ada Vale',
        'RunTimeTicks': 30 * minute,
        'Chapters': [
          {'Name': 'Arrival', 'StartPositionTicks': 0},
          {'Name': 'The Storm', 'StartPositionTicks': 10 * minute},
          {'Name': '', 'StartPositionTicks': 20 * minute},
        ],
      };

      test('resume row plus chapters marked by the saved position', () async {
        final api = _FakeItemsApi(totalItems: 0, itemsById: {'bk1': book});
        // 15 minutes in: chapter 1 done, chapter 2 halfway.
        final page = await _service(api, localResume: {'bk1': 15 * 60 * 1000})
            .getChildren('bookpage|srv|bk1');

        expect(page.map((m) => m.id), [
          'book|srv|bk1',
          'bookch|srv|bk1|0',
          'bookch|srv|bk1|1',
          'bookch|srv|bk1|2',
        ]);
        expect(page.first.title, 'Resume from 15:00');
        expect(page.first.artist, 'The Storm');
        expect(page[1].extras?[_kCompletionStatus], 2);
        expect(page[2].extras?[_kCompletionStatus], 1);
        expect(page[2].extras?[_kCompletionPercentage], closeTo(0.5, 0.001));
        expect(page[3].extras?[_kCompletionStatus], isNull);
        // A chapter with no name is numbered.
        expect(page[3].title, 'Chapter 3');
        // The subtitle says it in words too.
        expect(page[1].artist, 'Finished');
        expect(page[2].artist, '5:00 remaining');
        expect(page[3].artist, '10:00');
        expect(page[1].extras?[_kGroupTitle], 'Chapters');
      });

      test("the page isn't cached, so a new position shows at once",
          () async {
        final api = _FakeItemsApi(totalItems: 0, itemsById: {'bk1': book});
        final resume = <String, int>{};
        final service = _service(api, localResume: resume);

        expect((await service.getChildren('bookpage|srv|bk1')).first.title,
            'Play');
        resume['bk1'] = 15 * 60 * 1000;
        expect((await service.getChildren('bookpage|srv|bk1')).first.title,
            'Resume from 15:00');
      });

      test('an unstarted book offers Play and no progress', () async {
        final api = _FakeItemsApi(totalItems: 0, itemsById: {'bk1': book});
        final page = await _service(api).getChildren('bookpage|srv|bk1');

        expect(page.first.title, 'Play');
        expect(page.first.artist, 'Ada Vale');
        expect(page.skip(1).every((m) => m.extras?[_kCompletionStatus] == null),
            isTrue);
      });

      test('a chapter plays the book from the chapter start', () async {
        final api = _FakeItemsApi(totalItems: 0, itemsById: {'bk1': book});
        final request =
            await _service(api).resolvePlayRequest('bookch|srv|bk1|1');

        expect(request!.items.single.id, 'bk1');
        expect(request.startPosition, const Duration(minutes: 10));
        expect(await _service(api).resolvePlayRequest('bookch|srv|bk1|9'),
            isNull);
      });

      test('a book library opens on its in-progress books, then letters',
          () async {
        final api = _FakeItemsApi(
          totalItems: 0,
          books: const [
            {'Id': 'p1', 'Name': 'Probe Book', 'Type': 'AudioBook'},
          ],
          itemsById: {'bk1': book},
        );
        final children = await _service(api,
            views: const [
              {'Id': 'view1', 'CollectionType': 'audiobooks', 'Name': 'Books'},
            ],
            localResume: {'bk1': 15 * 60 * 1000}).getChildren('tab|books');

        expect(children.first.id, 'book|srv|bk1');
        expect(children.first.extras?[_kGroupTitle], 'Continue Listening');
        expect(children.first.extras?[_kCompletionPercentage],
            closeTo(0.5, 0.001));
        expect(children[1].id, 'sec|booklib|srv|view1|az|#');
      });
    });

    group('downloads', () {
      final rows = [
        _download({'Id': 'b1', 'Name': 'A Book', 'Type': 'AudioBook'}),
        _download({
          'Id': 's2',
          'Name': 'Second',
          'Type': 'Audio',
          'AlbumId': 'al1',
          'Album': 'Rumours',
          'IndexNumber': 2,
        }),
        _download({
          'Id': 's1',
          'Name': 'First',
          'Type': 'Audio',
          'AlbumId': 'al1',
          'Album': 'Rumours',
          'IndexNumber': 1,
        }),
        _download({'Id': 's9', 'Name': 'Loose', 'Type': 'Audio'}),
        _download({'Id': 'm1', 'Name': 'A Movie', 'Type': 'Movie'}),
      ];

      test('the tab groups books, albums and loose songs with no server',
          () async {
        final api = _FakeItemsApi(totalItems: 0);
        final service = _service(api, downloads: rows);
        final tab = await service.getChildren('tab|downloads');

        expect(tab.map((m) => m.id), [
          'dlshuffle|-|all',
          'dl|srv|b1',
          'dlalbum|srv|al1',
          'dl|srv|s9',
        ]);

        final album = await service.getChildren('dlalbum|srv|al1');
        expect(album.map((m) => m.id),
            ['dl|srv|s1|al1', 'dl|srv|s2|al1']);
        // Read from the offline database only, so it works with no server.
        expect(api.listCalls, 0);
      });

      test('a download stored under the base URL resumes at the furthest '
          'saved position', () async {
        final book = _download({
          'Id': 'b1',
          'Name': 'A Book',
          'Type': 'AudioBook',
        }, serverId: 'http://fake');
        Future<Duration> start(Map<String, int> positions) async =>
            (await _service(_FakeItemsApi(totalItems: 0),
                    downloads: [book], resumeByServer: positions)
                .resolvePlayRequest('dl|http://fake|b1'))!
                .startPosition;

        // 'srv' is the factory id of the client whose base URL is http://fake.
        expect(await start({'srv|b1': 90000, 'http://fake|b1': 5000}),
            const Duration(seconds: 90));
        expect(await start({'srv|b1': 5000, 'http://fake|b1': 90000}),
            const Duration(seconds: 90));
      });

      test('a downloaded album track queues the album in track order',
          () async {
        final service =
            _service(_FakeItemsApi(totalItems: 0), downloads: rows);
        final request = await service.resolvePlayRequest('dl|srv|s2|al1');

        expect(request!.items.map((i) => i.id), ['s1', 's2']);
        expect(request.startIndex, 1);
        expect(await service.resolvePlayRequest('dl|srv|missing'), isNull);
      });
    });
  });

  test('the car browses the signed-in account\'s server, not the last one '
      'registered', () async {
    GetIt.instance.registerSingleton<SessionRepository>(_FakeSessionRepository());
    addTearDown(() => GetIt.instance.unregister<SessionRepository>());
    final service = MediaBrowseService(
      _TwoServerFactory(
        _FakeClient(_FakeItemsApi(totalItems: 0)),
        _FakeClient(_FakeItemsApi(totalItems: 0)),
      ),
      _FakeBootstrap(),
      _FakeResumeService(),
      _FakeSessionStore(),
      _FakeOfflineRepository(),
    );

    final nodes = await service.getChildren('tab|music');

    expect(nodes.first.id, 'sec|albums|signedin');
  });
}
