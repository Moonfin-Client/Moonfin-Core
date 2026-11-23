import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/socket_handler.dart';

class _FakeAuthStore extends Fake implements AuthenticationStore {}

class _FakeAuthPrefs extends Fake implements AuthenticationPreferences {}

class _FakeCredentialStore extends Fake implements CredentialStore {}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeServerRepository extends Fake implements ServerRepository {}

class _FakeUserRepository extends Fake implements UserRepository {}

class _FakePluginSyncService extends Fake implements PluginSyncService {}

class _FakeResolution extends Fake implements StreamResolutionResult {}

class _CountingSocketHandler extends Fake implements SocketHandler {
  int disconnects = 0;

  @override
  Future<void> disconnect() async => disconnects++;
}

class _FakeManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  StreamResolutionResult? currentResolution;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeManager manager;
  late _CountingSocketHandler socket;
  late SessionRepository repository;

  setUp(() async {
    await GetIt.instance.reset();
    manager = _FakeManager();
    socket = _CountingSocketHandler();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    repository = SessionRepository(
      _FakeAuthStore(),
      _FakeAuthPrefs(),
      _FakeCredentialStore(),
      _FakeClientFactory(),
      socket,
      _FakeServerRepository(),
      _FakeUserRepository(),
      _FakePluginSyncService(),
    );
  });

  tearDown(() => GetIt.instance.reset());

  test('a paused stream keeps the socket open in the background', () {
    fakeAsync((async) {
      manager.currentResolution = _FakeResolution();
      repository.onAppBackgrounded();
      async.elapse(const Duration(minutes: 5));
      expect(socket.disconnects, 0);

      // Playback stops while the app stays in the background.
      manager.currentResolution = null;
      async.elapse(const Duration(seconds: 61));
      expect(socket.disconnects, 1);
    });
  });

  test('nothing loaded drops the socket after the grace period', () {
    fakeAsync((async) {
      repository.onAppBackgrounded();
      async.elapse(const Duration(seconds: 59));
      expect(socket.disconnects, 0);
      async.elapse(const Duration(seconds: 2));
      expect(socket.disconnects, 1);
    });
  });
}
