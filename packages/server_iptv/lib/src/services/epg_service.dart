import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;

import '../credentials/iptv_credential_store.dart';
import '../db/iptv_database.dart';
import '../models/xtream_models.dart';
import '../repositories/epg_repository.dart';
import '../repositories/playlist_repository.dart';
import 'epg_category.dart';
import 'xmltv_parser.dart';
import 'xtream_api_client.dart';

/// Downloads each playlist's XMLTV guide into the catalog.
class EpgService {
  static const _keepPastDays = 7;
  static const _refetchAfter = Duration(hours: 6);

  final EpgRepository _epgRepository;
  final PlaylistRepository _playlistRepository;
  final IptvCredentialStore _credentialStore;
  final Dio _dio;

  Future<void>? _inFlight;
  String? _error;

  /// The last refresh's failure. A refresh runs in the background with no
  /// one to show it to, so this is only for diagnosis.
  String? get error => _error;

  EpgService({
    required EpgRepository epgRepository,
    required PlaylistRepository playlistRepository,
    required IptvCredentialStore credentialStore,
    Dio? dio,
  }) : _epgRepository = epgRepository,
       _playlistRepository = playlistRepository,
       _credentialStore = credentialStore,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: const Duration(seconds: 30),
               receiveTimeout: const Duration(minutes: 5),
             ),
           );

  /// A call while a refresh runs joins it. Setup and the session switch both
  /// start one when the first playlist is added.
  Future<void> refreshAllSources() =>
      _inFlight ??= _refreshAll().whenComplete(() => _inFlight = null);

  Future<void> _refreshAll() async {
    _error = null;
    try {
      for (final playlist in await _playlistRepository.getAllPlaylists()) {
        // One provider that's down shouldn't keep the others from a guide.
        try {
          await _refreshPlaylistEpg(playlist);
        } catch (e) {
          _error = '$e';
        }
      }
      await _epgRepository.deleteOldPrograms(
        DateTime.now().subtract(const Duration(days: _keepPastDays)),
      );
    } catch (e) {
      _error = '$e';
    }
  }

  /// A guide URL set on the playlist wins, an Xtream panel's own guide is the
  /// fallback.
  Future<void> _refreshPlaylistEpg(Playlist playlist) async {
    final custom = playlist.epgUrl;
    if (custom != null && custom.isNotEmpty) {
      return _refreshXmltvEpg(custom, playlist.id);
    }
    if (playlist.sourceType != PlaylistSourceType.xtreamCodes.name) return;
    final creds = await _credentialStore.getXtreamCredentials(playlist.id);
    if (creds == null) return;
    await _refreshXmltvEpg(
      XtreamApiClient(credentials: creds).xmltvUrl(),
      playlist.id,
    );
  }

  Future<void> _refreshXmltvEpg(String url, int playlistId) async {
    // The same URL is only fetched again after a while, a new one right away.
    final source = await _epgRepository.getEpgSource(playlistId);
    final fetched = source?.lastFetched;
    if (source?.url == url &&
        fetched != null &&
        DateTime.now().difference(fetched) < _refetchAfter) {
      return;
    }

    final response = await _dio.get<String>(url);
    final xmlContent = response.data;
    if (xmlContent == null || xmlContent.isEmpty) return;

    final result = await XmltvParser.parseInIsolate(xmlContent);

    final companions = <EpgProgramsCompanion>[];
    for (final program in result.programs) {
      final flags = EpgCategoryFlags.fromText(program.category);
      companions.add(
        EpgProgramsCompanion.insert(
          channelTvgId: program.channelId,
          title: program.title,
          description: Value(program.description),
          startTime: program.startTime,
          endTime: program.endTime,
          category: Value(program.category),
          icon: Value(program.icon),
          episodeTitle: Value(program.episodeTitle),
          isMovie: Value(flags.isMovie),
          isSeries: Value(flags.isSeries),
          isSports: Value(flags.isSports),
          isNews: Value(flags.isNews),
          isKids: Value(flags.isKids),
        ),
      );
    }

    if (companions.isNotEmpty) {
      await _epgRepository.replacePrograms(companions);
    }

    await _epgRepository.upsertEpgSource(playlistId: playlistId, url: url);
  }
}
