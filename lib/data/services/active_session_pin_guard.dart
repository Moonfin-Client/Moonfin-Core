import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/server_user_repository.dart';
import '../../auth/repositories/session_repository.dart';
import 'pin_guard.dart';
import 'server_pin_service.dart';

/// The guard for the PIN of whoever is signed in, or null when nobody is.
PinGuard? activeSessionPinGuard() {
  final session = GetIt.instance<SessionRepository>();
  final userId = session.activeUserId;
  if (userId == null) return null;
  final serverId = session.activeServerId;
  return PinGuard.forAccount(
    store: GetIt.instance<PreferenceStore>(),
    service: GetIt.instance<ServerPinService>(),
    userId: userId,
    serverAddress: serverId == null
        ? null
        : GetIt.instance<ServerRepository>().getServer(serverId)?.address,
    accessToken: serverId == null
        ? null
        : GetIt.instance<ServerUserRepository>()
              .getStoredServerUsers(serverId)
              .where((stored) => stored.id == userId)
              .map((stored) => stored.accessToken)
              .firstOrNull,
  );
}
