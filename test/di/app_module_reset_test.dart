import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/di/modules/app_module.dart';

void main() {
  final getIt = GetIt.instance;
  late OfflineDatabase db;

  setUp(() {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
  });

  tearDown(() async {
    await getIt.reset();
    await db.close();
  });

  test('the merged libraries are reset once the repository that names the '
      'signed-in accounts is registered again', () {
    final catalog = UnifiedCatalogService(
      database: db,
      loadSessions: () async => const [],
      activeServerId: () => null,
    );
    getIt.registerSingleton(catalog, dispose: (service) => service.dispose());
    final session = catalog.session;
    final titles = catalog.titlesRevision;
    // A merged library on screen reloads on the reset, which asks the
    // repository who is signed in.
    final couldAskWhoIsSignedIn = <bool>[];
    catalog.addListener(
      () => couldAskWhoIsSignedIn.add(
        getIt.isRegistered<MultiServerRepository>(),
      ),
    );

    resetUserScopedSingletons();

    // A screen compares this number with the one it opened under to tell
    // that the accounts changed.
    expect(catalog.session, session + 1);
    expect(catalog.titlesRevision, greaterThan(titles));
    expect(couldAskWhoIsSignedIn, [true]);
  });

  test('with no catalog registered there is nothing to reset', () {
    expect(resetUserScopedSingletons, returnsNormally);
    expect(getIt.isRegistered<UnifiedCatalogService>(), isFalse);
  });
}
