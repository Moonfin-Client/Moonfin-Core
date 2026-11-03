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
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late OfflineRepository repo;
  late OfflineCatalog catalog;
  late PendingRatingStore pendingRatings;

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

  ConnectivityAwareMediaServerClient wrap(MediaServerClient online) =>
      ConnectivityAwareMediaServerClient(
        online,
        useOffline: () => false,
        catalog: catalog,
        storagePath: StoragePathService(),
        pendingRatings: pendingRatings,
        offlineRepo: repo,
      );

  test('forwards profile fields and headers to a Silo client', () {
    final silo = SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: _device,
    )..accessToken = 'tok';
    final wrapped = wrap(silo);

    wrapped.profileId = 'p1';
    wrapped.profileToken = 'pvt_1';
    expect(silo.profileId, 'p1');
    expect(silo.profileToken, 'pvt_1');
    expect(wrapped.profileId, 'p1');
    expect(clientProfileId(wrapped), 'p1');

    final headers = serverAuthHeaders(wrapped);
    expect(headers['Authorization'], 'Bearer tok');
    expect(headers['X-Profile-Id'], 'p1');
    expect(headers['X-Profile-Token'], 'pvt_1');
  });

  test('is inert for a Jellyfin client', () {
    final jellyfin = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'tok';
    final wrapped = wrap(jellyfin);

    wrapped.profileId = 'ignored';
    expect(wrapped.profileId, isNull);
    expect(wrapped.profileToken, isNull);
    expect(serverAuthHeaders(wrapped), {
      'Authorization': buildServerAuthorizationHeader(
        scheme: 'MediaBrowser',
        deviceInfo: _device,
        accessToken: 'tok',
      ),
    });
  });
}
