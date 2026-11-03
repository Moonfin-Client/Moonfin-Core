import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/download_quality.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/download_notification_service.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Records what the download service stores, without sqlite files.
class _Repo extends OfflineRepository {
  _Repo(super.db);

  final statuses = <String, int>{};
  final episodesBySeason = <String, List<DownloadedItem>>{};
  final imagePaths = <String, Map<String, String?>>{};
  final rows = <String, DownloadedItem>{};

  @override
  Future<void> upsertItem(DownloadedItemsCompanion item) async {}

  @override
  Future<void> updateDownloadStatus(
    String itemId,
    int status, {
    double? progress,
    String? error,
  }) async => statuses[itemId] = status;

  @override
  Future<void> setLocalFilePath(
    String itemId,
    String path, {
    int? fileSize,
  }) async {}

  @override
  Future<void> setImagePaths(
    String itemId, {
    String? poster,
    String? backdrop,
    String? logo,
    String? thumb,
  }) async {
    final paths = imagePaths[itemId] ??= {};
    if (poster != null) paths['poster'] = poster;
    if (backdrop != null) paths['backdrop'] = backdrop;
    if (logo != null) paths['logo'] = logo;
    if (thumb != null) paths['thumb'] = thumb;
  }

  @override
  Future<int> getTotalStorageUsed() async => 0;

  @override
  Future<List<DownloadedItem>> getItems({
    String? type,
    bool onlyCompleted = false,
  }) async => const [];

  @override
  Future<DownloadedItem?> getItem(String itemId) async => rows[itemId];

  @override
  Future<void> deleteItem(String itemId) async {}

  @override
  Future<void> deleteSeasonItems(String seasonId) async {}

  @override
  Future<List<DownloadedItem>> getSeasonEpisodes(String seasonId) async =>
      episodesBySeason[seasonId] ?? const [];

  final addedStreams = <String, List<Map<String, dynamic>>>{};

  @override
  Future<void> addMediaStreams(
    String itemId,
    List<Map<String, dynamic>> streams,
  ) async => (addedStreams[itemId] ??= []).addAll(streams);
}

class _Storage extends StoragePathService {
  _Storage(this.dir);

  final Directory dir;

  @override
  Future<Directory> getOfflineRoot() async => dir;

  @override
  Future<Directory> getImageCacheDir() async {
    final images = Directory('${dir.path}/images');
    if (!await images.exists()) await images.create(recursive: true);
    return images;
  }
}

class _Items implements ItemsApi {
  _Items(this.data);

  final Map<String, dynamic> data;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => data;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// A server with its own registry: hands out [fileUrl] with a bearer header.
class _Registry implements ServerDownloadsApi {
  _Registry(this.fileUrl);

  final Uri fileUrl;
  final requests = <ServerDownloadRequest>[];
  final finished = <ServerDownloadTicket>[];
  final removed = <List<String>>[];
  Object? refusal;

  /// Preparation reports to send before answering, one per check.
  List<ServerDownloadPreparation> preparing = const [];

  /// Completes when the test lets a preparing file become ready.
  Completer<void>? ready;

  @override
  Future<ServerDownloadTicket> prepareDownload(
    ServerDownloadRequest request, {
    void Function(ServerDownloadPreparation preparation)? onPreparing,
    bool Function()? isCancelled,
  }) async {
    requests.add(request);
    if (refusal case final error?) throw error;
    for (final report in preparing) {
      onPreparing?.call(report);
    }
    if (ready case final gate?) {
      while (!gate.isCompleted) {
        await Future<void>.delayed(const Duration(milliseconds: 10));
        if (isCancelled?.call() ?? false) throw const ServerDownloadCancelled();
      }
    }
    return ServerDownloadTicket(
      id: 'dl-1',
      itemId: request.itemId,
      url: fileUrl,
      headers: () => const {'Authorization': 'Bearer access-1'},
      revision: 1,
      sizeBytes: 2048,
      mediaSourceId: '4567',
    );
  }

  /// The highest video bitrate the server converts to, or null for none.
  int? convertsUpTo = 4000000;

  @override
  Future<bool> convertsDownloadsAt(int maxVideoBitrate) async =>
      maxVideoBitrate <= (convertsUpTo ?? -1);

  @override
  Future<Uri?> browserDownloadUrl(ServerDownloadRequest request) async => null;

  @override
  Future<void> downloadFinished(ServerDownloadTicket ticket) async =>
      finished.add(ticket);

  /// The artwork links the server answers.
  Map<ServerDownloadArtworkKind, Uri> artwork = const {};

  @override
  Future<Map<ServerDownloadArtworkKind, Uri>> downloadArtwork(
    ServerDownloadTicket ticket,
  ) async => artwork;

  /// The subtitle files the server answers.
  List<ServerDownloadSubtitle> subtitles = const [];
  final subtitleSources = <Map<String, dynamic>>[];

  @override
  Future<List<ServerDownloadSubtitle>> downloadSubtitles(
    ServerDownloadTicket ticket, {
    required Map<String, dynamic> mediaSource,
  }) async {
    subtitleSources.add(mediaSource);
    return subtitles;
  }

  @override
  Future<void> downloadsRemoved(Iterable<String> itemIds) async =>
      removed.add(itemIds.toList());
}

class _Client implements MediaServerClient, ServerDownloadsProvider {
  _Client(this._items, this.serverDownloads);

  final ItemsApi _items;

  @override
  final ServerDownloadsApi serverDownloads;

  @override
  ItemsApi get itemsApi => _items;

  @override
  ImageApi get imageApi => throw UnimplementedError('no artwork here');

  @override
  String? get accessToken => 'access-1';

  @override
  String get baseUrl => 'http://127.0.0.1:1';

  @override
  ServerType get serverType => ServerType.silo;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<void> _waitFor(bool Function() condition) async {
  for (var attempt = 0; attempt < 300; attempt++) {
    if (condition()) return;
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  fail('Condition was not met in time.');
}

DownloadedItem _row(String id, {String type = 'Episode'}) => DownloadedItem(
  itemId: id,
  serverId: 's1',
  type: type,
  name: id,
  metadataJson: '{}',
  downloadStatus: 2,
  downloadProgress: 1,
  fileSizeBytes: 0,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
);

/// The finished download's best-effort tasks (subtitles, artwork,
/// notification) run on after it. Let them end before tearing down.
Future<void> _afterCompletionTasks() =>
    Future<void>.delayed(const Duration(milliseconds: 500));

void main() {
  late OfflineDatabase db;
  late Directory tempDir;
  late _Repo repo;
  late HttpServer fileServer;
  late List<HttpRequest> fileRequests;
  late List<int> fileBytes;
  late _Registry registry;
  late DownloadService service;

  late Map<String, dynamic> movie;
  Map<String, dynamic> freshMovie() => <String, dynamic>{
    'Id': 'movie-imdb-tt0295701',
    'Type': 'Movie',
    'Name': 'xXx',
    'ProductionYear': 2002,
    'MediaSources': [
      {
        'Id': '4567',
        'Container': 'mkv',
        'Size': 2048,
        'MediaStreams': [
          {'Type': 'Video', 'Index': 0, 'Codec': 'h264'},
        ],
      },
    ],
  };

  setUp(() async {
    movie = freshMovie();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    tempDir = await Directory.systemTemp.createTemp('moonfin_server_dl');
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = _Repo(db);

    fileRequests = [];
    // A Matroska file starts with the EBML magic, and Moonfin checks it
    // against the `.mkv` name.
    fileBytes = [0x1A, 0x45, 0xDF, 0xA3, ...List.filled(2044, 7)];
    fileServer = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    fileServer.listen((request) {
      fileRequests.add(request);
      if (request.uri.path.startsWith('/subs/')) {
        request.response
          ..statusCode = 200
          ..headers.contentType = ContentType.text
          ..write('1\n00:00:01,000 --> 00:00:02,000\nHello\n');
        request.response.close();
        return;
      }
      if (request.uri.path.startsWith('/art/')) {
        request.response
          ..statusCode = 200
          ..headers.contentType = ContentType('image', 'jpeg')
          ..write('art:${request.uri.pathSegments.last}');
        request.response.close();
        return;
      }
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.binary
        ..headers.contentLength = 2048
        ..add(fileBytes);
      request.response.close();
    });
    registry = _Registry(
      Uri.parse(
        'http://127.0.0.1:${fileServer.port}/api/v2/downloads/dl-1/file',
      ),
    );

    final getIt = GetIt.instance;
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<StoragePathService>(_Storage(tempDir));
    getIt.registerSingleton<OfflineRepository>(repo);
    service = DownloadService(
      _Client(_Items(movie), registry),
      DownloadNotificationService(),
    );
  });

  tearDown(() async {
    service.dispose();
    await fileServer.close(force: true);
    await GetIt.instance.reset();
    await db.close();
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  AggregatedItem item() => AggregatedItem(
    id: movie['Id'] as String,
    serverId: 'http://127.0.0.1:1',
    rawData: movie,
  );

  test('fetches the file the server prepared, with its credentials', () async {
    await service.downloadItem(item());
    await _waitFor(
      () =>
          repo.statuses[item().id] == 2 ||
          service.activeDownloads[item().id]?.error != null,
    );
    expect(service.activeDownloads[item().id]?.error, isNull);

    final request = registry.requests.single;
    expect(request.itemId, 'movie-imdb-tt0295701');
    expect(request.seriesId, isNull);
    expect(request.mediaSourceId, '4567');
    expect(request.original, isTrue);

    final fetch = fileRequests.single;
    expect(fetch.uri.path, '/api/v2/downloads/dl-1/file');
    expect(fetch.headers.value('authorization'), 'Bearer access-1');
    expect(fetch.headers.value('x-emby-token'), isNull);
    expect(service.activeDownloads[item().id]?.isComplete, isTrue);

    await _waitFor(() => registry.finished.isNotEmpty);
    expect(registry.finished.single.id, 'dl-1');
    await _afterCompletionTasks();
  });

  test('an episode names its series', () async {
    movie
      ..['Type'] = 'Episode'
      ..['Id'] = 'episode-imdb-tt1641384-1-1'
      ..['SeriesId'] = 'series-imdb-tt1641384'
      ..['SeriesName'] = 'Young Justice'
      ..['ParentIndexNumber'] = 1
      ..['IndexNumber'] = 1;

    await service.downloadItem(item());
    await _waitFor(() => repo.statuses[item().id] == 2);

    expect(registry.requests.single.seriesId, 'series-imdb-tt1641384');
    await _afterCompletionTasks();
  });

  test("a refusal is the download's error, and nothing is fetched", () async {
    registry.refusal = const ServerDownloadRefused(
      'Silo has no file for this title.',
      reason: 'no_file',
    );
    final errors = <String>[];
    final sub = service.errors.listen(errors.add);

    await service.downloadItem(item());
    await _waitFor(() => errors.isNotEmpty);

    expect(errors.single, contains('Silo has no file for this title.'));
    expect(
      service.activeDownloads[item().id]?.error,
      contains('Silo has no file'),
    );
    expect(fileRequests, isEmpty);
    expect(registry.finished, isEmpty);
    await sub.cancel();
  });

  test('a converted quality: progress while the server makes it, then '
      'an mp4', () async {
    registry
      ..preparing = const [
        ServerDownloadPreparation(progress: 0.4, remainingSeconds: 90),
      ]
      ..ready = Completer<void>();

    unawaited(service.downloadItem(item(), quality: DownloadQuality.high1080p));
    await _waitFor(() => service.activeDownloads[item().id]?.etaSeconds == 90);
    final preparing = service.activeDownloads[item().id]!;
    expect(preparing.progress, 0.4);
    expect(preparing.isQueued, isFalse);
    expect(preparing.isTranscoded, isTrue);
    expect(registry.requests.single.maxVideoBitrate, 4000000);
    expect(registry.requests.single.original, isFalse);

    // An mp4 now: the name follows the quality.
    fileBytes = [
      0,
      0,
      0,
      0x20,
      0x66,
      0x74,
      0x79,
      0x70,
      ...List.filled(2040, 7),
    ];
    registry.ready!.complete();
    await _waitFor(
      () =>
          repo.statuses[item().id] == 2 ||
          service.activeDownloads[item().id]?.error != null,
    );
    expect(service.activeDownloads[item().id]?.error, isNull);
    expect(fileRequests.single.uri.path, '/api/v2/downloads/dl-1/file');
    await _afterCompletionTasks();
  });

  test('cancelling while the server prepares tells it to forget', () async {
    registry.ready = Completer<void>();

    unawaited(
      service.downloadItem(item(), quality: DownloadQuality.medium720p),
    );
    await _waitFor(() => registry.requests.isNotEmpty);
    service.cancelDownload(item().id);

    await _waitFor(() => registry.removed.isNotEmpty);
    expect(registry.removed.single, ['movie-imdb-tt0295701']);
    expect(fileRequests, isEmpty);
    expect(service.activeDownloads[item().id], isNull);
  });

  test("artwork comes from the server's links, with the ticket's "
      'credentials', () async {
    Uri art(String kind) =>
        Uri.parse('http://127.0.0.1:${fileServer.port}/art/$kind');
    registry.artwork = {
      ServerDownloadArtworkKind.poster: art('poster'),
      ServerDownloadArtworkKind.backdrop: art('backdrop'),
      ServerDownloadArtworkKind.seriesPoster: art('series_poster'),
    };
    movie
      ..['Type'] = 'Episode'
      ..['Id'] = 'episode-imdb-tt1641384-1-1'
      ..['SeriesId'] = 'series-imdb-tt1641384'
      ..['SeriesName'] = 'Young Justice'
      ..['ParentIndexNumber'] = 1
      ..['IndexNumber'] = 1;
    // The series' row exists, without a poster of its own.
    repo.rows['series-imdb-tt1641384'] = _row(
      'series-imdb-tt1641384',
      type: 'Series',
    );

    await service.downloadItem(item());
    await _waitFor(
      () => repo.imagePaths['series-imdb-tt1641384']?['poster'] != null,
    );

    final paths = repo.imagePaths['episode-imdb-tt1641384-1-1']!;
    expect(paths['poster'], endsWith('/episode-imdb-tt1641384-1-1/poster.jpg'));
    expect(
      paths['backdrop'],
      endsWith('/episode-imdb-tt1641384-1-1/backdrop.jpg'),
    );
    expect(paths.containsKey('logo'), isFalse);
    expect(await File(paths['poster']!).readAsString(), 'art:poster');
    expect(
      repo.imagePaths['series-imdb-tt1641384']!['poster'],
      endsWith('/series-imdb-tt1641384/series_poster.jpg'),
    );
    final artRequests = fileRequests.where(
      (r) => r.uri.path.startsWith('/art/'),
    );
    expect(artRequests.map((r) => r.uri.path).toSet(), {
      '/art/poster',
      '/art/backdrop',
      '/art/series_poster',
    });
    expect(
      artRequests.every(
        (r) => r.headers.value('authorization') == 'Bearer access-1',
      ),
      isTrue,
    );
    await _afterCompletionTasks();
  });

  test("subtitles are saved beside the file, named by their stream", () async {
    registry.subtitles = [
      ServerDownloadSubtitle(
        url: Uri.parse('http://127.0.0.1:${fileServer.port}/subs/external:0'),
        streamIndex: 4,
        format: 'srt',
      ),
    ];

    await service.downloadItem(item());
    await _waitFor(
      () => fileRequests.any((r) => r.uri.path.startsWith('/subs/')),
    );
    await _afterCompletionTasks();

    // The version the file is of.
    expect(registry.subtitleSources.single['Id'], '4567');
    final saved = tempDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('_sub_4.srt'))
        .toList();
    expect(saved, hasLength(1));
    expect(saved.single.readAsStringSync(), contains('Hello'));
    final request = fileRequests.firstWhere(
      (r) => r.uri.path.startsWith('/subs/'),
    );
    expect(request.headers.value('authorization'), 'Bearer access-1');
    // No Jellyfin subtitle URL was tried.
    expect(
      fileRequests.where((r) => r.uri.path.startsWith('/Videos/')),
      isEmpty,
    );
  });

  test('a subtitle the server keeps beside the file is saved with its '
      'stream', () async {
    const stream = {
      'Type': 'Subtitle',
      'Index': 5,
      'Codec': 'srt',
      'Language': 'en',
      'IsExternal': true,
    };
    registry.subtitles = [
      ServerDownloadSubtitle(
        url: Uri.parse(
          'http://127.0.0.1:${fileServer.port}/subs/downloaded:1',
        ),
        streamIndex: 5,
        format: 'srt',
        stream: stream,
      ),
    ];

    await service.downloadItem(item());
    await _waitFor(() => repo.addedStreams.isNotEmpty);
    await _afterCompletionTasks();

    expect(repo.addedStreams[item().id], [stream]);
    final saved = tempDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('_sub_5.srt'));
    expect(saved, hasLength(1));
  });

  test('only the qualities the server converts to are offered', () async {
    expect(await service.offeredQualities(), DownloadQuality.values);

    registry.convertsUpTo = 1000000;
    expect(await service.offeredQualities(), [
      DownloadQuality.original,
      DownloadQuality.low480p,
      DownloadQuality.mobile360p,
    ]);

    registry.convertsUpTo = null;
    expect(await service.offeredQualities(), [DownloadQuality.original]);
  });

  test('deleting a download tells the server', () async {
    expect(await service.deleteDownloadedFiles(item()), isTrue);

    await _waitFor(() => registry.removed.isNotEmpty);
    expect(registry.removed.single, ['movie-imdb-tt0295701']);
  });

  test('deleting a season names each of its downloaded episodes', () async {
    repo.episodesBySeason['season-imdb-tt1641384-1'] = [
      _row('episode-imdb-tt1641384-1-1'),
      _row('episode-imdb-tt1641384-1-2'),
    ];

    await service.deleteDownloadedFiles(
      AggregatedItem(
        id: 'season-imdb-tt1641384-1',
        serverId: 's1',
        rawData: const {
          'Id': 'season-imdb-tt1641384-1',
          'Type': 'Season',
          'Name': 'Season 1',
          'SeriesName': 'Young Justice',
        },
      ),
    );

    await _waitFor(() => registry.removed.isNotEmpty);
    expect(registry.removed.single, [
      'episode-imdb-tt1641384-1-1',
      'episode-imdb-tt1641384-1-2',
    ]);
  });
}
