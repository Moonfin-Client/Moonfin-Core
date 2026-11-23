import 'package:server_core/server_core.dart';

import 'api/iptv_image_api.dart';
import 'api/iptv_items_api.dart';
import 'api/iptv_live_tv_api.dart';
import 'api/iptv_misc_apis.dart';
import 'api/iptv_playback_api.dart';
import 'credentials/iptv_credential_store.dart';
import 'db/iptv_database.dart';
import 'iptv_backend.dart';
import 'iptv_labels.dart';
import 'services/tmdb_service.dart';

/// A [MediaServerClient] backed by the on-device IPTV catalog (Xtream/M3U
/// playlists imported into Drift) instead of a remote media server.
///
/// `userId` is the active local profile id, and `accessToken` carries the
/// profile sentinel and is never sent anywhere.
class IptvMediaServerClient extends MediaServerClient {
  final IptvBackend _backend;

  @override
  final DeviceInfo deviceInfo;

  IptvMediaServerClient({
    required IptvDatabase database,
    required IptvCredentialStore credentials,
    required this.deviceInfo,
    TmdbService? tmdbService,
    IptvLabels Function()? labels,
  }) : _backend = IptvBackend(
         db: database,
         credentials: credentials,
         tmdb: tmdbService,
         labels: labels,
       );

  String _baseUrl = 'iptv://local';
  String? _accessToken;

  @override
  ServerType get serverType => ServerType.iptv;

  @override
  String get baseUrl => _baseUrl;

  @override
  set baseUrl(String url) => _baseUrl = url;

  @override
  String? get accessToken => _accessToken;

  @override
  set accessToken(String? token) => _accessToken = token;

  @override
  String? get userId => _backend.profileId;

  @override
  set userId(String? id) => _backend.profileId = id;

  @override
  late final AuthApi authApi = IptvAuthApi();

  @override
  late final IptvItemsApi itemsApi = IptvItemsApi(_backend);

  @override
  late final PlaybackApi playbackApi = IptvPlaybackApi(_backend);

  @override
  late final ImageApi imageApi = IptvImageApi();

  @override
  late final SessionApi sessionApi = IptvSessionApi();

  @override
  late final SystemApi systemApi = IptvSystemApi();

  @override
  late final UserLibraryApi userLibraryApi = IptvUserLibraryApi(
    _backend,
    itemsApi,
  );

  @override
  late final UserViewsApi userViewsApi = IptvUserViewsApi(_backend);

  @override
  late final LiveTvApi liveTvApi = IptvLiveTvApi(_backend);

  @override
  late final InstantMixApi instantMixApi = IptvInstantMixApi();

  @override
  late final DisplayPreferencesApi displayPreferencesApi =
      IptvDisplayPreferencesApi();

  @override
  late final UsersApi usersApi = IptvUsersApi(_backend);

  @override
  AdminSystemApi get adminSystemApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminUsersApi get adminUsersApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminLibraryApi get adminLibraryApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminEnvironmentApi get adminEnvironmentApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminTasksApi get adminTasksApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminPluginsApi get adminPluginsApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminDevicesApi get adminDevicesApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminApiKeysApi get adminApiKeysApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminBackupApi get adminBackupApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminLiveTvApi get adminLiveTvApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  AdminItemsApi get adminItemsApi =>
      throw UnsupportedError('Admin not supported on IPTV');

  @override
  void dispose() {
    // The database is owned by the DI layer and shared with the import
    // services, so there's nothing to release here.
  }
}
