import 'credentials/iptv_credential_store.dart';
import 'db/iptv_database.dart';
import 'iptv_labels.dart';
import 'models/xtream_models.dart';
import 'repositories/channel_repository.dart';
import 'repositories/epg_repository.dart';
import 'repositories/playlist_repository.dart';
import 'repositories/recordings_repository.dart';
import 'repositories/vod_repository.dart';
import 'repositories/watch_state_repository.dart';
import 'services/stream_url_builder.dart';
import 'services/tmdb_enricher.dart';
import 'services/tmdb_service.dart';
import 'services/xtream_api_client.dart';

/// Shared context for the IPTV API implementations: the catalog database,
/// its repositories, the credential store, and the active profile.
class IptvBackend {
  final IptvDatabase db;
  final IptvCredentialStore credentials;

  late final PlaylistRepository playlists = PlaylistRepository(db);
  late final ChannelRepository channels = ChannelRepository(db);
  late final EpgRepository epg = EpgRepository(db);
  late final VodRepository vod = VodRepository(db);
  late final WatchStateRepository watchState = WatchStateRepository(db);
  late final RecordingsRepository recordings = RecordingsRepository(db);

  /// The active profile id, mirrors `MediaServerClient.userId`.
  String? profileId;

  /// Null without a TMDB service. With one, it only runs once a key is set.
  late final TmdbEnricher? enricher;

  /// Called on every use so a language change applies without a restart.
  final IptvLabels Function() labels;

  final Map<int, XtreamCredentials> _credsCache = {};
  final Map<int, Duration> _serverOffsets = {};

  IptvBackend({
    required this.db,
    required this.credentials,
    TmdbService? tmdb,
    IptvLabels Function()? labels,
  }) : labels = labels ?? (() => const IptvLabels()) {
    enricher = tmdb == null ? null : TmdbEnricher(tmdb: tmdb, vod: vod);
  }

  /// [profileId], or null when no profile is signed in.
  String? get activeProfileId {
    final id = profileId;
    return id == null || id.isEmpty ? null : id;
  }

  String get requireProfileId =>
      activeProfileId ?? (throw StateError('No active IPTV profile'));

  Future<XtreamCredentials?> xtreamCredentialsFor(int playlistId) async {
    final cached = _credsCache[playlistId];
    if (cached != null) return cached;
    try {
      final loaded = await credentials.getXtreamCredentials(playlistId);
      if (loaded != null) {
        _credsCache[playlistId] = loaded;
      }
      return loaded;
    } catch (_) {
      // A failed keychain read means the stream URL can't be built, which
      // surfaces as a playback error instead of a crash.
      return null;
    }
  }

  Future<String?> channelStreamUrl(Channel channel) =>
      resolveChannelStreamUrl(channel, xtreamCredentialsFor);

  /// How far the panel's clock is from UTC, which its timeshift URLs are
  /// written in. Without an answer it guesses the device's own zone.
  Future<Duration> xtreamServerOffset(
    int playlistId,
    XtreamCredentials credentials,
  ) async {
    final known = _serverOffsets[playlistId];
    if (known != null) return known;
    try {
      final offset = await XtreamApiClient(
        credentials: credentials,
      ).serverUtcOffset();
      if (offset != null) return _serverOffsets[playlistId] = offset;
    } catch (_) {}
    return DateTime.now().timeZoneOffset;
  }

  Future<List<int>> allPlaylistIds() async {
    final lists = await playlists.getAllPlaylists();
    return [for (final p in lists) p.id];
  }
}
