import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

class _MockAuthStore extends Mock implements AuthenticationStore {}

class _MockCredentialStore extends Mock implements CredentialStore {}

class _MockClientFactory extends Mock implements MediaServerClientFactory {}

class _MockSessionRepository extends Mock implements SessionRepository {}

/// The real [MultiServerRepository] over fake sign-in stores, signed in to
/// every server of [servers] as `user-<id>`, the first being the active one.
///
/// Each server is named `Server <id>` and lives at `http://<id>`. Its client
/// is a mock that knows only its server type: [stubClient] stubs the APIs the
/// test's servers answer with.
MultiServerRepository fakeMultiServerRepository(
  Map<String, ServerType> servers, {
  required void Function(String id, MediaServerClient client) stubClient,
}) {
  final authStore = _MockAuthStore();
  final credentials = _MockCredentialStore();
  final factory = _MockClientFactory();
  final session = _MockSessionRepository();
  final stored = <Server>[];
  for (final MapEntry(key: id, value: type) in servers.entries) {
    final client = _MockClient();
    when(() => client.serverType).thenReturn(type);
    stubClient(id, client);
    stored.add(
      Server(
        id: id,
        name: 'Server $id',
        address: 'http://$id',
        version: '10.11.0',
        serverType: type,
        dateAdded: DateTime(2026),
      ),
    );
    when(() => authStore.getUsers(id)).thenReturn([
      PrivateUser(
        id: 'user-$id',
        name: 'user',
        serverId: id,
        accessToken: 'token-$id',
        lastUsed: DateTime(2026),
      ),
    ]);
    when(() => credentials.getToken(id)).thenAnswer((_) async => null);
    when(
      () => factory.getClient(
        serverId: id,
        serverType: type,
        baseUrl: 'http://$id',
      ),
    ).thenReturn(client);
    when(() => factory.getClientIfExists(id)).thenReturn(client);
  }
  when(authStore.getServers).thenReturn(stored);
  when(() => session.activeServerId).thenReturn(servers.keys.first);
  when(() => session.activeUserId).thenReturn('user-${servers.keys.first}');
  return MultiServerRepository(authStore, credentials, factory, session);
}

/// Stands in for [MultiServerRepository] without the sign-in stores the real
/// one reads: [sessions] are the servers signed in to, and a search asks each
/// of them through its session's client.
class FakeMultiServerRepository extends Fake implements MultiServerRepository {
  FakeMultiServerRepository(this.sessions);

  final List<ServerUserSession> sessions;

  @override
  Future<List<ServerUserSession>> getLoggedInServers() async => sessions;

  @override
  ImageApi getImageApiForServer(String serverId) => _MockImageApi();

  @override
  Future<List<List<AggregatedItem>>> searchEachServer(
    Future<List<AggregatedItem>> Function(SearchRepository repository) search, {
    required String label,
  }) async => [
    for (final session in sessions)
      [
        for (final item in await search(SearchRepository(session.client)))
          AggregatedItem(
            id: item.id,
            serverId: session.server.id,
            rawData: item.rawData,
          ),
      ],
  ];
}

/// The app with its server out of reach, browsing its downloads.
class UnreachableConnectivity extends Fake implements ConnectivityService {
  @override
  bool get canReachServer => false;
}

/// Turns on merged libraries: multi-server libraries, merged by type.
Future<void> turnOnMergedLibraries(UserPreferences prefs) async {
  await prefs.set(UserPreferences.enableMultiServerLibraries, true);
  await prefs.set(UserPreferences.mergeLibrariesByType, true);
}
