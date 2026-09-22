import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../auth/models/user.dart';
import '../auth/repositories/user_repository.dart';
import '../data/services/connectivity_service.dart';
import '../data/services/media_server_client_factory.dart';
import '../data/services/socket_handler.dart';
import '../data/services/sync_service.dart';
import '../preference/user_preferences.dart';
import '../syncplay/syncplay_manager.dart';
import '../syncplay/syncplay_runtime_coordinator.dart';
import 'injection.dart';

final deviceInfoProvider = Provider<DeviceInfo>((_) => getIt<DeviceInfo>());

final mediaServerClientFactoryProvider = Provider<MediaServerClientFactory>(
  (_) => getIt<MediaServerClientFactory>(),
);

final activeServerClientProvider = StateProvider<MediaServerClient?>(
  (_) => null,
);

final playbackManagerProvider = Provider<PlaybackManager>(
  (_) => getIt<PlaybackManager>(),
);

final socketHandlerProvider = Provider<SocketHandler>(
  (_) => getIt<SocketHandler>(),
);

final userPreferencesProvider = ChangeNotifierProvider<UserPreferences>(
  (_) => getIt<UserPreferences>(),
);

final currentUserProvider = StreamProvider<User?>((ref) {
  final repo = getIt<UserRepository>();
  // Broadcast streams don't replay past events, so seed with the current value
  return _seededStream(repo);
});

Stream<User?> _seededStream(UserRepository repo) async* {
  yield repo.currentUser;
  yield* repo.currentUserStream;
}

final isAdminProvider = Provider<bool>((ref) {
  final userAsync = ref.watch(currentUserProvider);
  return userAsync.valueOrNull?.isAdministrator ?? false;
});

final kidsModeProvider = Provider<bool>((ref) {
  final prefs = ref.watch(userPreferencesProvider);
  return prefs.get(UserPreferences.kidsModeEnabled);
});

final connectivityServiceProvider = ChangeNotifierProvider<ConnectivityService>(
  (_) => getIt<ConnectivityService>(),
);

final isOnlineProvider = Provider<bool>((ref) {
  return ref.watch(connectivityServiceProvider).isOnline;
});

final activeServerReachableProvider = Provider<bool>((ref) {
  return ref.watch(connectivityServiceProvider).canReachServer;
});

final syncServiceProvider = ChangeNotifierProvider<SyncService>(
  (_) => getIt<SyncService>(),
);

final syncStateProvider = Provider<SyncState>((ref) {
  return ref.watch(syncServiceProvider).state;
});

final syncPlayManagerProvider = ChangeNotifierProvider<SyncPlayManager>(
  (_) => getIt<SyncPlayManager>(),
);

final syncPlayRuntimeCoordinatorProvider = Provider<SyncPlayRuntimeCoordinator>(
  (ref) {
    final coordinator = SyncPlayRuntimeCoordinator(
      ref.read(syncPlayManagerProvider),
      ref.read(socketHandlerProvider),
    );
    coordinator.start(ref, activeServerClientProvider);
    ref.onDispose(coordinator.stop);
    return coordinator;
  },
);
