import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/di/modules/app_module.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/multi_server_fakes.dart';
import '../data/services/unified_catalog_fakes.dart';

class _Connectivity extends Fake implements ConnectivityService {
  @override
  bool isOnline = true;

  /// Whether the server being browsed answers.
  @override
  bool serverReachable = true;

  @override
  bool isCellularOnly = false;

  @override
  bool get canReachServer => isOnline && serverReachable;
}

class _Session extends Fake implements SessionRepository {
  @override
  String? get activeServerId => 'a';
}

void main() {
  final getIt = GetIt.instance;
  late OfflineDatabase db;
  late FakeCatalogServer a;
  late FakeCatalogServer b;
  late _Connectivity connectivity;
  late UserPreferences prefs;
  late UnifiedCatalogService catalog;

  setUp(() async {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    a = FakeCatalogServer('a')..stubApis();
    b = FakeCatalogServer('b')..stubApis();
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    connectivity = _Connectivity();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await turnOnMergedLibraries(prefs);
    getIt
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<ConnectivityService>(connectivity)
      ..registerSingleton<MultiServerRepository>(
        FakeMultiServerRepository([a.session, b.session]),
      )
      ..registerSingleton<SessionRepository>(_Session());
    catalog = buildUnifiedCatalogService(db);
    getIt.registerSingleton<UnifiedCatalogService>(
      catalog,
      dispose: (service) => service.dispose(),
    );
  });

  tearDown(() async {
    await getIt.reset();
    await db.close();
  });

  Future<List<CatalogEntry>> storedEntries() => db.select(db.catalogEntries).get();

  test('with only the server being browsed out of reach, every server is '
      'still read', () async {
    connectivity.serverReachable = false;
    // A 403 is a refusal, so the server is not retried after a wait.
    a.error = httpError(403);

    await catalog.syncNow();

    expect(catalog.unreachableServerCount, 1);
    expect((await storedEntries()).map((row) => row.serverId), ['b']);
  });

  test('with the device offline no server is asked', () async {
    connectivity.isOnline = false;

    await catalog.syncNow();

    expect(a.requests + b.requests, 0);
    expect(catalog.unreachableServerCount, 0);
  });

  test('on mobile data syncOnLaunch (launch check) does no full read', () async {
    connectivity.isCellularOnly = true;

    await catalog.syncOnLaunch();
    expect(a.fullPageRequests + b.fullPageRequests, 0);

    connectivity.isCellularOnly = false;
    await catalog.syncOnLaunch();
    expect(await storedEntries(), hasLength(2));
  });

  group('the stored rows', () {
    setUp(() async {
      watchMergedLibrariesSetting();
      await catalog.forceFullRead();
      expect(await storedEntries(), hasLength(2));
    });

    test('are deleted when merging the libraries is turned off', () async {
      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      await pumpEventQueue();

      expect(await storedEntries(), isEmpty);
      expect(await db.select(db.catalogSyncStates).get(), isEmpty);

      await catalog.forceFullRead();
      expect(await storedEntries(), isEmpty);
    });

    test('are deleted when multi-server libraries are turned off', () async {
      await prefs.set(UserPreferences.enableMultiServerLibraries, false);
      await pumpEventQueue();

      expect(await storedEntries(), isEmpty);
    });

    test('stay when some other setting changes', () async {
      await prefs.set(UserPreferences.mergeRecentRowsByType, true);
      await pumpEventQueue();

      expect(await storedEntries(), hasLength(2));
    });
  });
}
