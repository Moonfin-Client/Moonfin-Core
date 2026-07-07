import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../auth/repositories/server_repository.dart';
import '../auth/store/authentication_preferences.dart';
import '../auth/store/authentication_store.dart';
import '../auth/store/credential_store.dart';
import '../data/services/media_server_client_factory.dart';
import '../di/modules/playback_module.dart';
import '../di/modules/server_module.dart';
import '../preference/preference_constants.dart';

/// Widget-free session restore for car/background entry points.
///
/// Android Auto and CarPlay can boot the engine headlessly (no widgets, so
/// StartupScreen never runs SessionRepository.restoreSession). This restores
/// the saved server client and stream resolver from stored credentials so
/// browse and playback work before (or without) the UI ever appearing.
class HeadlessSessionBootstrap {
  Future<MediaServerClient?>? _inflight;

  Future<MediaServerClient?> ensureSession() =>
      _inflight ??= _restore().then((client) {
        // A failed restore shouldn't be cached forever: credentials may appear
        // after the user signs in on the phone.
        if (client == null) _inflight = null;
        return client;
      });

  void invalidate() {
    _inflight = null;
  }

  Future<MediaServerClient?> _restore() async {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      final hadClient = factory.clients.isNotEmpty;
      final client = await restoreClient();
      if (client == null) return null;
      if (!hadClient) setActiveServerClient(client);
      setActiveStreamResolver(client);
      return client;
    } catch (_) {
      return null;
    }
  }

  Future<MediaServerClient?> restoreClient() async {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      if (factory.clients.isNotEmpty) {
        return factory.getActiveClient();
      }

      final authPrefs = GetIt.instance<AuthenticationPreferences>();
      final String serverId;
      final String userId;
      switch (authPrefs.loginBehavior) {
        case UserSelectBehavior.disabled:
          return null;
        case UserSelectBehavior.lastUser:
          serverId = authPrefs.savedLastServerId;
          userId = authPrefs.savedLastUserId;
        case UserSelectBehavior.currentUser:
          serverId = authPrefs.savedAutoLoginServerId;
          userId = authPrefs.savedAutoLoginUserId;
      }
      if (serverId.isEmpty || userId.isEmpty) return null;

      final server =
          GetIt.instance<ServerRepository>().getServer(serverId);
      if (server == null) return null;

      final users = GetIt.instance<AuthenticationStore>().getUsers(serverId);
      final userIndex = users.indexWhere((u) => u.id == userId);
      if (userIndex < 0) return null;
      final user = users[userIndex];

      final storedToken =
          await GetIt.instance<CredentialStore>().getToken(serverId);
      final accessToken =
          user.accessToken.isNotEmpty ? user.accessToken : storedToken;
      if (accessToken == null || accessToken.isEmpty) return null;

      final client = factory.getClient(
        serverId: serverId,
        serverType: server.serverType,
        baseUrl: server.address,
      );
      client.accessToken = accessToken;
      client.userId = userId;
      return client;
    } catch (_) {
      return null;
    }
  }
}
