import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockUserViewsApi extends Mock implements UserViewsApi {}

class _MockUsersApi extends Mock implements UsersApi {}

class _MockImageApi extends Mock implements ImageApi {}

/// The "now" of every test catalog. [seedCatalog] dates its full reads at
/// this moment, so a catalog whose clock stays here reads nothing again.
final unifiedTestNow = DateTime(2026, 11, 13, 12);

/// The error Dio throws when a server answers with [status].
DioException httpError(int status) {
  final request = RequestOptions(path: '/Items');
  return DioException(
    requestOptions: request,
    response: Response(requestOptions: request, statusCode: status),
    type: DioExceptionType.badResponse,
  );
}

/// A Jellyfin server named `Server <id>` at `http://<id>.test`, signed in to
/// as [userId] through [client].
ServerUserSession fakeSession(
  String id, {
  required MediaServerClient client,
  ServerType type = ServerType.jellyfin,
  String userId = 'user',
}) => ServerUserSession(
  server: Server(
    id: id,
    name: 'Server $id',
    address: 'http://$id.test',
    version: '10.11.0',
    serverType: type,
    dateAdded: DateTime(2026),
  ),
  userId: userId,
  client: client,
);

/// Fails the test if [asker] asks a server anything.
class UntouchedClient implements MediaServerClient {
  UntouchedClient([this.asker = 'the merged library']);

  final String asker;

  @override
  String get baseUrl => 'http://active.test';

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      fail('$asker asked a server for ${invocation.memberName}');
}

class FakeMdbListRepository implements MdbListRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Writes [items] to the stored catalog as user `user`'s rows for [serverId],
/// each under its own `Type`. With [markFullyRead], every library kind of the
/// server is also recorded as read in full at [unifiedTestNow], so opening a
/// library does not start a read.
Future<void> seedCatalog(
  OfflineDatabase db,
  String serverId,
  List<Map<String, dynamic>> items, {
  bool markFullyRead = true,
}) => db.batch((batch) {
  batch.insertAll(db.catalogEntries, [
    for (final item in items)
      CatalogEntriesCompanion.insert(
        serverId: serverId,
        userId: 'user',
        itemId: item['Id'] as String,
        kind: item['Type'] as String,
        metadataJson: jsonEncode(item),
      ),
  ]);
  if (!markFullyRead) return;
  batch.insertAll(db.catalogSyncStates, [
    for (final kind in UnifiedLibraryKind.values)
      CatalogSyncStatesCompanion.insert(
        serverId: serverId,
        userId: 'user',
        kind: kind.itemType,
        lastSyncedAt: unifiedTestNow,
        lastFullSyncAt: Value(unifiedTestNow),
      ),
  ]);
});

/// How many turns of the event loop pass while [work] runs: zero when it
/// never yields to timers.
Future<int> turnsDuring(Future<void> Function() work) async {
  var turns = 0;
  final timer = Timer.periodic(Duration.zero, (_) => turns++);
  try {
    await work();
  } finally {
    timer.cancel();
  }
  return turns;
}

class FakeCatalogServer {
  FakeCatalogServer(
    this.id, {
    this.type = ServerType.jellyfin,
    this.userId = 'user',
  });

  final String id;
  final ServerType type;
  final String userId;
  final client = _MockClient();
  final itemsApi = _MockItemsApi();
  final viewsApi = _MockUserViewsApi();
  final usersApi = _MockUsersApi();

  List<Map<String, dynamic>> movies = [];
  List<Map<String, dynamic>> series = [];

  /// A second movie library, listed only while it holds something.
  List<Map<String, dynamic>> moreMovies = [];

  /// Throws on the movie request for this start index.
  int? failAtStartIndex;

  /// From this start index on, movie pages come back empty but fully counted.
  int? emptyFromStartIndex;

  /// How many of the next answers about its libraries list none.
  int emptyViewsAnswers = 0;

  /// Runs before it lists its libraries, which starts every read and check.
  void Function()? onViewsRequest;

  /// Runs before each page of movies, full or ids only, with the page's start
  /// index.
  void Function(int startIndex)? onMoviePageRequest;

  int movieOvercount = 0;

  /// Sends every count as text, which some servers do.
  bool countsAsText = false;

  /// The app's client for this server, when it isn't the one asking it.
  MediaServerClient? appClient;

  Object? error;
  bool down = false;

  /// While set, each library request waits for its entry in [heldRequests]
  /// to complete.
  bool holdRequests = false;
  final heldRequests = <Completer<void>>[];

  int? failIdsAtStartIndex;

  /// Ids the server lists but won't hand the rows of.
  final withheldIds = <String>{};

  /// The start index of each full page of the first movie library.
  final fullPageStartIndexes = <int>[];

  /// Full pages requested, of any library.
  int fullPageRequests = 0;

  /// The fields each full page was asked with.
  final fullPageFields = <String?>[];

  int countRequests = 0;

  /// The start index of each page of ids only, of any library.
  final idPageStartIndexes = <int>[];

  /// The ids of each request for the full rows of chosen titles.
  final rowRequests = <List<String>>[];

  /// Titles sent in full, with every field the grid shows.
  int rowsSent = 0;

  int viewsRequests = 0;

  int get requests =>
      viewsRequests +
      fullPageRequests +
      countRequests +
      idPageStartIndexes.length +
      rowRequests.length +
      userDataRequests.length +
      parentRequests.length;

  final userDataRequests = <List<String>>[];

  /// The series each episode or season id belongs to.
  final seriesOf = <String, String>{};

  /// The ids of each request for what holds them.
  final parentRequests = <List<String>>[];

  void Function()? afterUserDataRequest;

  ServerUserSession get session => fakeSession(
    id,
    client: appClient ?? client,
    type: type,
    userId: userId,
  );

  /// Answers the oldest held request.
  void releaseNext() => heldRequests.removeAt(0).complete();

  /// Stops holding requests and answers every one held so far.
  void letThrough() {
    holdRequests = false;
    while (heldRequests.isNotEmpty) {
      releaseNext();
    }
  }

  void stubApis() {
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userViewsApi).thenReturn(viewsApi);
    when(() => client.usersApi).thenReturn(usersApi);
    when(() => client.imageApi).thenReturn(_MockImageApi());
    when(() => usersApi.getUserConfiguration())
        .thenAnswer((_) async => const UserConfiguration());
    when(
      () => viewsApi.getUserViews(includeHidden: any(named: 'includeHidden')),
    ).thenAnswer((_) async {
      viewsRequests++;
      onViewsRequest?.call();
      if (down) throw StateError('$id is down');
      if (emptyViewsAnswers > 0) {
        emptyViewsAnswers--;
        return {'Items': <Map<String, dynamic>>[]};
      }
      return {
        'Items': [
          {'Id': '$id-movies', 'CollectionType': 'movies'},
          if (moreMovies.isNotEmpty)
            {'Id': '$id-movies2', 'CollectionType': 'movies'},
          {'Id': '$id-shows', 'CollectionType': 'tvshows'},
          {'Id': '$id-music', 'CollectionType': 'music'},
        ],
      };
    });
    when(
      () => itemsApi.getItems(
        parentId: any(named: 'parentId'),
        ids: any(named: 'ids'),
        includeItemTypes: any(named: 'includeItemTypes'),
        recursive: any(named: 'recursive'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableUserData: any(named: 'enableUserData'),
        enableImages: any(named: 'enableImages'),
      ),
    ).thenAnswer((invocation) {
      final named = invocation.namedArguments;
      final ids = (named[#ids] as List?)?.cast<String>();
      if (ids != null) {
        if (named[#enableUserData] == false) return _answerParents(ids);
        return named[#fields] == 'UserData'
            ? _answerUserData(ids)
            : _answerRows(ids);
      }
      return _answerLibrary(
        parent: named[#parentId] as String,
        start: named[#startIndex] as int? ?? 0,
        limit: named[#limit] as int,
        idsOnly: named[#enableUserData] == false && named[#enableImages] == false,
        fields: named[#fields] as String?,
      );
    });
  }

  Future<Map<String, dynamic>> _answerLibrary({
    required String parent,
    required int start,
    required int limit,
    required bool idsOnly,
    required String? fields,
  }) async {
    final isMovies = parent == '$id-movies';
    final isCount = idsOnly && limit == 1;
    final isIdPage = idsOnly && !isCount;
    if (isCount) {
      countRequests++;
    } else if (isIdPage) {
      idPageStartIndexes.add(start);
    } else {
      fullPageRequests++;
      fullPageFields.add(fields);
      if (isMovies) fullPageStartIndexes.add(start);
    }
    // An ids-only request must ask for no extra fields.
    if (idsOnly && fields != null) {
      throw StateError('an ids-only request asked for the fields $fields');
    }
    await _gate();
    if (down) throw StateError('$id is down');
    if (error case final error?) throw error;
    if (isMovies && !isCount) onMoviePageRequest?.call(start);
    if (isMovies && !idsOnly && failAtStartIndex == start) {
      throw StateError('$id dropped the connection');
    }
    if (isMovies && isIdPage && failIdsAtStartIndex == start) {
      throw StateError('$id dropped the connection');
    }
    final all = isMovies
        ? movies
        : parent == '$id-movies2'
        ? moreMovies
        : series;
    final cutShort =
        isMovies &&
        !isCount &&
        emptyFromStartIndex != null &&
        start >= emptyFromStartIndex!;
    final items = cutShort
        ? <Map<String, dynamic>>[]
        : [
            for (final item in all.skip(start).take(limit))
              if (idsOnly)
                {'Id': item['Id'], 'Name': item['Name'], 'Type': item['Type']}
              else
                _copyOf(item),
          ];
    if (!idsOnly) rowsSent += items.length;
    final total = all.length + (isMovies ? movieOvercount : 0);
    return {
      'Items': items,
      'TotalRecordCount': countsAsText ? '$total' : total,
    };
  }

  Future<Map<String, dynamic>> _answerRows(List<String> ids) async {
    rowRequests.add(ids);
    await _gate();
    if (down) throw StateError('$id is down');
    if (error case final error?) throw error;
    final items = [
      for (final item in [...movies, ...moreMovies, ...series])
        if (ids.contains('${item['Id']}') &&
            !withheldIds.contains('${item['Id']}'))
          _copyOf(item),
    ];
    rowsSent += items.length;
    return {'Items': items};
  }

  Future<Map<String, dynamic>> _answerUserData(List<String> ids) async {
    if (down) throw StateError('$id is down');
    userDataRequests.add(ids);
    final answer = {
      'Items': [
        for (final item in [...movies, ...series])
          if (ids.contains('${item['Id']}'))
            {
              'Id': item['Id'],
              'UserData': item['UserData'] is Map
                  ? Map<String, dynamic>.from(item['UserData'] as Map)
                  : item['UserData'],
            },
      ],
    };
    afterUserDataRequest?.call();
    return answer;
  }

  Future<Map<String, dynamic>> _answerParents(List<String> ids) async {
    if (down) throw StateError('$id is down');
    parentRequests.add(ids);
    return {
      'Items': [
        for (final id in ids)
          if (seriesOf[id] case final series?)
            {'Id': id, 'Type': 'Episode', 'SeriesId': series},
      ],
    };
  }

  Future<void> _gate() async {
    if (!holdRequests) return;
    final gate = Completer<void>();
    heldRequests.add(gate);
    await gate.future;
  }

  // A server's answer is a fresh object: the stored catalog must not change
  // when the test changes what the server holds.
  static Map<String, dynamic> _copyOf(Map<String, dynamic> item) =>
      jsonDecode(jsonEncode(item)) as Map<String, dynamic>;

  void setUserData(String itemId, Map<String, dynamic> userData) {
    for (final item in [...movies, ...series]) {
      if (item['Id'] == itemId) item['UserData'] = userData;
    }
  }
}

/// A title as a server sends it: a movie unless [type] says otherwise.
///
/// [added] is a `yyyy-MM-dd` date, [percent] the played percentage and
/// [score] the community rating.
Map<String, dynamic> catalogMovie(
  String id,
  String name, {
  String type = 'Movie',
  String? tmdb,
  String? imdb,
  String? rating,
  List<String> genres = const [],
  String? added,
  int? year,
  double? score,
  bool played = false,
  bool? favorite,
  int? positionTicks,
  double? percent,
}) => {
  'Id': id,
  'Name': name,
  'Type': type,
  if (tmdb != null || imdb != null)
    'ProviderIds': {'Tmdb': ?tmdb, 'Imdb': ?imdb},
  'OfficialRating': ?rating,
  if (genres.isNotEmpty) 'Genres': genres,
  if (added != null) 'DateCreated': '${added}T00:00:00.0000000Z',
  'ProductionYear': ?year,
  'CommunityRating': ?score,
  'UserData': <String, dynamic>{
    'Played': played,
    'IsFavorite': ?favorite,
    'PlaybackPositionTicks': ?positionTicks,
    'PlayedPercentage': ?percent,
  },
};
