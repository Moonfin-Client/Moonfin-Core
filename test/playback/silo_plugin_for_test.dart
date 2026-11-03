import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/offline/offline_catalog.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/pending_rating_store.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/playback/silo_plugin_for.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';

Map<String, dynamic> _fixture(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

/// Silo's playback routes: capabilities, a start answering the remux plan,
/// and the stop.
class _Silo implements HttpClientAdapter {
  final requests = <RequestOptions>[];

  List<String> get calls => [
    for (final r in requests) '${r.method} ${r.uri.path}',
  ];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final (status, body) = switch (options.uri.path) {
      '/api/v2/playback/capabilities' => (
        200,
        _fixture(
          'packages/server_silo/test/fixtures/silo/playback_capabilities.json',
        ),
      ),
      '/api/v2/playback/start' => (
        201,
        _fixture('packages/playback_silo/test/fixtures/decision_remux.json'),
      ),
      '/api/v2/playback/$_session' => (200, {'stopped': true}),
      _ => (404, {'status': 404}),
    };
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late OfflineCatalog catalog;
  late PendingRatingStore pendingRatings;
  late OfflineRepository repo;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = PreferenceStore();
    await prefs.init();
    pendingRatings = PendingRatingStore(prefs);
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    catalog = OfflineCatalog(repo);
  });

  tearDown(() async {
    catalog.dispose();
    await db.close();
  });

  test('plays through the app\'s wrapped Silo client', () async {
    final server = _Silo();
    final now = DateTime.now().toUtc();
    final silo =
        SiloMediaServerClient(
            baseUrl: 'https://silo.example',
            deviceInfo: const DeviceInfo(
              id: 'device-1',
              name: 'Test Mac',
              appName: 'Moonfin',
              appVersion: '1.9.0',
            ),
            platform: 'macOS',
            httpClientAdapter: server,
          )
          ..session.setTokens(
            SiloTokens(
              accessToken: 'access-1',
              refreshToken: 'refresh-1',
              expiresAt: now.add(const Duration(hours: 1)),
              lifetime: const Duration(hours: 1),
            ),
          )
          ..profileId = 'p1';
    final wrapped = ConnectivityAwareMediaServerClient(
      silo,
      useOffline: () => false,
      catalog: catalog,
      storagePath: StoragePathService(),
      pendingRatings: pendingRatings,
      offlineRepo: repo,
    );
    final item = siloItemToBaseItemDto(
      _fixture('packages/server_silo/test/fixtures/silo/watch_movie.json'),
      images: SiloImageRegistry(() => 'https://silo.example'),
    )!;
    final profile = _fixture(
      'packages/playback_silo/test/fixtures/device_profile_mpv.json',
    );

    final plugin = siloPluginFor(wrapped);
    final stream = await plugin.createStreamResolver().resolve(
      item,
      deviceProfile: profile,
    );
    expect(stream.playSessionId, _session);

    // The session service shares the resolver's sessions, so the stop
    // reaches Silo.
    await plugin.createPlaySessionService().onPlaybackStop(
      item,
      stream,
      const Duration(minutes: 1),
    );
    expect(server.calls, [
      'GET /api/v2/playback/capabilities',
      'POST /api/v2/playback/start',
      'DELETE /api/v2/playback/$_session',
    ]);
  });
}
