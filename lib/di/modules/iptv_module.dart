import 'package:get_it/get_it.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/store/authentication_store.dart';
import '../../data/database/iptv_database_connection.dart';
import '../../data/services/iptv/iptv_profiles_service.dart';
import '../../data/services/iptv/iptv_recording_service.dart';
import '../../data/services/iptv/iptv_reminder_service.dart';
import '../../l10n/current_app_localizations.dart';

final _getIt = GetIt.instance;

/// IPTV backend services. Everything is lazy, so users who
/// never add an IPTV account pay nothing.
void registerIptvModule() {
  _getIt.registerLazySingleton<IptvDatabase>(
    () => IptvDatabase.withExecutor(openIptvConnection()),
    dispose: (db) => db.close(),
  );

  _getIt.registerLazySingleton<IptvCredentialStore>(
    () => IptvCredentialStore(),
  );

  _getIt.registerLazySingleton<PlaylistService>(() {
    final db = _getIt<IptvDatabase>();
    return PlaylistService(
      repository: PlaylistRepository(db),
      vodRepository: VodRepository(db),
      credentialStore: _getIt<IptvCredentialStore>(),
      labels: iptvLabels,
    );
  }, dispose: (s) => s.dispose());

  _getIt.registerLazySingleton<EpgService>(() {
    final db = _getIt<IptvDatabase>();
    return EpgService(
      epgRepository: EpgRepository(db),
      playlistRepository: PlaylistRepository(db),
      credentialStore: _getIt<IptvCredentialStore>(),
    );
  });

  _getIt.registerLazySingleton<IptvRecordingService>(
    () => IptvRecordingService(
      _getIt<IptvDatabase>(),
      _getIt<IptvCredentialStore>(),
    ),
    dispose: (s) => s.dispose(),
  );

  _getIt.registerLazySingleton<IptvReminderService>(
    () => IptvReminderService(_getIt<IptvDatabase>()),
  );

  _getIt.registerLazySingleton<IptvProfilesService>(
    () => IptvProfilesService(
      _getIt<AuthenticationStore>(),
      _getIt<ServerRepository>(),
    ),
  );
}

/// The names the IPTV backend writes into items and groups, read in the
/// current app language each time.
IptvLabels iptvLabels() {
  final l10n = currentAppLocalizations();
  return IptvLabels(
    liveTv: l10n.liveTv,
    movies: l10n.movies,
    shows: l10n.iptvShows,
    season: l10n.seasonNumber,
    episode: l10n.episodeNumber,
    profileName: l10n.iptvProfileUserName,
    uncategorized: l10n.uncategorized,
  );
}
