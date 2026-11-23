import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import '../credentials/iptv_credential_store.dart';
import '../db/iptv_database.dart';
import '../iptv_labels.dart';
import '../models/m3u_entry.dart';
import '../models/xtream_models.dart';
import '../repositories/playlist_repository.dart';
import '../repositories/vod_repository.dart';
import 'm3u_parser.dart';
import 'stream_url_builder.dart';
import 'vod_title.dart';
import 'xtream_api_client.dart';

enum PlaylistErrorKind {
  authenticationFailed,
  connectionFailed,
  noChannelsInPlaylist,
  noChannelsInFile,
  importFailed,
  fileImportFailed,
  fileNotFound,
  fileNoLongerExists,
  playlistNotFound,
  noUrl,
  noFilePath,
  credentialsNotFound,
  connectionTimeout,
  receiveTimeout,
  unreachable,
  badResponse,
  network,
  unexpected,
}

/// A failure the app turns into a localized message. [detail] holds the
/// status code or exception text for the kinds that show one.
typedef PlaylistError = ({PlaylistErrorKind kind, String? detail});

class PlaylistService extends ChangeNotifier {
  final PlaylistRepository _repository;
  final VodRepository _vodRepository;
  final IptvCredentialStore _credentialStore;
  final Dio _dio;
  Timer? _refreshTimer;

  bool _isLoading = false;
  PlaylistError? _error;
  double _progress = 0;

  bool get isLoading => _isLoading;
  PlaylistError? get error => _error;
  double get progress => _progress;

  PlaylistService({
    required PlaylistRepository repository,
    required VodRepository vodRepository,
    required IptvCredentialStore credentialStore,
    Dio? dio,
    IptvLabels Function()? labels,
  }) : _repository = repository,
       _vodRepository = vodRepository,
       _credentialStore = credentialStore,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: const Duration(seconds: 30),
               // Big playlists take a while on slow providers.
               receiveTimeout: const Duration(minutes: 5),
             ),
           ),
       _labels = labels ?? (() => const IptvLabels());

  final IptvLabels Function() _labels;

  void _setLoading(bool loading) {
    _isLoading = loading;
    if (loading) _error = null;
    notifyListeners();
  }

  void _setProgress(double value) {
    _progress = value;
    notifyListeners();
  }

  void _setError(PlaylistErrorKind kind, [String? detail]) {
    _error = (kind: kind, detail: detail);
    _isLoading = false;
    notifyListeners();
  }

  /// Clears any lingering error (like a background refresh failure) so it
  /// doesn't surface on unrelated screens.
  void clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }

  Future<PlaylistError?> testXtreamConnection({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    try {
      final credentials = XtreamCredentials(
        serverUrl: serverUrl,
        username: username,
        password: password,
      );
      final client = XtreamApiClient(credentials: credentials);
      if (!await client.signIn()) {
        return (kind: PlaylistErrorKind.authenticationFailed, detail: null);
      }
      return null;
    } on DioException catch (e) {
      return _dioError(e);
    } catch (e) {
      return (kind: PlaylistErrorKind.connectionFailed, detail: '$e');
    }
  }

  Future<int?> addM3uUrlPlaylist({
    required String name,
    required String url,
    String? epgUrl,
  }) async {
    _setLoading(true);
    try {
      _setProgress(0.1);
      final response = await _dio.get(url);
      final content = response.data.toString();

      _setProgress(0.3);
      final entries = await _parseM3u(content);
      if (entries.isEmpty) {
        _setError(PlaylistErrorKind.noChannelsInPlaylist);
        return null;
      }

      _setProgress(0.5);
      final playlistId = await _repository.insertPlaylist(
        PlaylistsCompanion(
          name: Value(name),
          sourceType: Value(PlaylistSourceType.m3uUrl.name),
          url: Value(url),
          epgUrl: Value(epgUrl),
        ),
      );

      _setProgress(0.7);
      await _importOrDiscard(
        playlistId,
        () => _importEntries(playlistId, entries),
      );
      _setProgress(1.0);
      _setLoading(false);
      return playlistId;
    } on DioException catch (e) {
      final (:kind, :detail) = _dioError(e);
      _setError(kind, detail);
      return null;
    } catch (e) {
      _setError(PlaylistErrorKind.importFailed, '$e');
      return null;
    }
  }

  Future<int?> addM3uFilePlaylist({
    required String name,
    required String filePath,
    String? epgUrl,
  }) async {
    _setLoading(true);
    try {
      _setProgress(0.1);
      final file = File(filePath);
      if (!await file.exists()) {
        _setError(PlaylistErrorKind.fileNotFound);
        return null;
      }

      final content = await file.readAsString();
      _setProgress(0.3);
      final entries = await _parseM3u(content);
      if (entries.isEmpty) {
        _setError(PlaylistErrorKind.noChannelsInFile);
        return null;
      }

      _setProgress(0.5);
      final playlistId = await _repository.insertPlaylist(
        PlaylistsCompanion(
          name: Value(name),
          sourceType: Value(PlaylistSourceType.m3uFile.name),
          filePath: Value(filePath),
          epgUrl: Value(epgUrl),
        ),
      );

      _setProgress(0.7);
      await _importOrDiscard(
        playlistId,
        () => _importEntries(playlistId, entries),
      );
      _setProgress(1.0);
      _setLoading(false);
      return playlistId;
    } catch (e) {
      _setError(PlaylistErrorKind.fileImportFailed, '$e');
      return null;
    }
  }

  Future<int?> addXtreamPlaylist({
    required String name,
    required String serverUrl,
    required String username,
    required String password,
    String? epgUrl,
  }) async {
    _setLoading(true);
    try {
      _setProgress(0.1);
      final credentials = XtreamCredentials(
        serverUrl: serverUrl,
        username: username,
        password: password,
      );
      final client = XtreamApiClient(credentials: credentials);

      _setProgress(0.2);
      if (!await client.signIn()) {
        _setError(PlaylistErrorKind.authenticationFailed);
        return null;
      }

      _setProgress(0.3);
      final fetch = await _fetchXtreamCatalog(client);

      _setProgress(0.6);
      final playlistId = await _repository.insertPlaylist(
        PlaylistsCompanion(
          name: Value(name),
          sourceType: Value(PlaylistSourceType.xtreamCodes.name),
          url: Value(credentials.baseUrl),
          epgUrl: Value(epgUrl),
        ),
      );

      _setProgress(0.8);
      await _importOrDiscard(playlistId, () async {
        await _credentialStore.saveXtreamCredentials(
          playlistId: playlistId,
          serverUrl: serverUrl,
          username: username,
          password: password,
        );
        await _importEntries(playlistId, fetch.entries);
        await _importXtreamVod(playlistId, fetch);
      });
      _setProgress(1.0);
      _setLoading(false);
      return playlistId;
    } on DioException catch (e) {
      final (:kind, :detail) = _dioError(e);
      _setError(kind, detail);
      return null;
    } catch (e) {
      _setError(PlaylistErrorKind.connectionFailed, '$e');
      return null;
    }
  }

  Future<void> refreshPlaylist(int playlistId) async {
    _setLoading(true);
    try {
      final playlist = await _repository.getPlaylistById(playlistId);
      if (playlist == null) {
        _setError(PlaylistErrorKind.playlistNotFound);
        return;
      }

      final sourceType = PlaylistSourceType.values.firstWhere(
        (t) => t.name == playlist.sourceType,
        orElse: () => PlaylistSourceType.m3uUrl,
      );

      switch (sourceType) {
        case PlaylistSourceType.m3uUrl:
          if (playlist.url == null) {
            _setError(PlaylistErrorKind.noUrl);
            return;
          }
          _setProgress(0.2);
          final response = await _dio.get(playlist.url!);
          final entries = await _parseM3u(response.data.toString());
          if (entries.isEmpty) {
            _setError(PlaylistErrorKind.noChannelsInPlaylist);
            return;
          }
          _setProgress(0.6);
          await _importEntries(playlistId, entries);
          break;

        case PlaylistSourceType.m3uFile:
          if (playlist.filePath == null) {
            _setError(PlaylistErrorKind.noFilePath);
            return;
          }
          _setProgress(0.2);
          final file = File(playlist.filePath!);
          if (!await file.exists()) {
            _setError(PlaylistErrorKind.fileNoLongerExists);
            return;
          }
          final content = await file.readAsString();
          final entries = await _parseM3u(content);
          if (entries.isEmpty) {
            _setError(PlaylistErrorKind.noChannelsInFile);
            return;
          }
          _setProgress(0.6);
          await _importEntries(playlistId, entries);
          break;

        case PlaylistSourceType.xtreamCodes:
          final credentials = await _credentialStore.getXtreamCredentials(
            playlistId,
          );
          if (credentials == null) {
            _setError(PlaylistErrorKind.credentialsNotFound);
            return;
          }
          final client = XtreamApiClient(credentials: credentials);
          _setProgress(0.2);
          final fetch = await _fetchXtreamCatalog(client);
          if (fetch.entries.isEmpty &&
              fetch.vodStreams.isEmpty &&
              fetch.seriesStreams.isEmpty) {
            _setError(PlaylistErrorKind.noChannelsInPlaylist);
            return;
          }
          _setProgress(0.7);
          // An empty section is more likely a failed fetch than a provider
          // dropping it, and syncing it would delete its favorites and history.
          if (fetch.entries.isNotEmpty) {
            await _importEntries(playlistId, fetch.entries);
          }
          if (fetch.vodStreams.isNotEmpty || fetch.seriesStreams.isNotEmpty) {
            await _importXtreamVod(playlistId, fetch);
          }
          break;
      }

      // An Xtream refresh that skips an empty live section doesn't stamp it,
      // and the hourly check would then fetch the whole catalog again.
      await _repository.updatePlaylist(
        playlistId,
        PlaylistsCompanion(lastRefreshed: Value(DateTime.now())),
      );
      _setProgress(1.0);
      _setLoading(false);
    } on DioException catch (e) {
      final (:kind, :detail) = _dioError(e);
      _setError(kind, detail);
    } catch (e) {
      _setError(PlaylistErrorKind.unexpected, '$e');
    }
  }

  /// Renames the playlist or changes its guide URL. An empty [epgUrl] clears
  /// the guide URL.
  Future<void> updatePlaylist({
    required int id,
    String? name,
    String? epgUrl,
  }) async {
    await _repository.updatePlaylist(
      id,
      PlaylistsCompanion(
        name: Value.absentIfNull(name),
        epgUrl: epgUrl == null
            ? const Value.absent()
            : Value(epgUrl.isEmpty ? null : epgUrl),
      ),
    );
    notifyListeners();
  }

  /// The rows go first, so a failed delete doesn't leave a playlist that
  /// lost its credentials. Its recordings go from disk too.
  Future<void> deletePlaylist(int id) async {
    final recordingFiles = await _repository.deletePlaylist(id);
    await _credentialStore.deleteCredentials(id);
    for (final path in recordingFiles) {
      try {
        final file = File(path);
        if (await file.exists()) await file.delete();
      } catch (_) {}
    }
    notifyListeners();
  }

  /// Removes a playlist that was just added when its import fails, so a
  /// retry doesn't leave an empty one behind.
  Future<void> _importOrDiscard(
    int playlistId,
    Future<void> Function() import,
  ) async {
    try {
      await import();
    } catch (_) {
      await _repository.deletePlaylist(playlistId);
      await _credentialStore.deleteCredentials(playlistId);
      rethrow;
    }
  }

  // Off the main isolate, since big playlists run to tens of thousands of
  // entries. Browsers have no isolates, so compute runs it inline there.
  static Future<List<M3uEntry>> _parseM3u(String content) =>
      compute(parseM3u, content);

  void startAutoRefresh(Duration interval) {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(interval, (_) => _refreshAllDue());
  }

  void stopAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  Future<void> _refreshAllDue() async {
    final playlists = await _repository.getAllPlaylists();
    final now = DateTime.now();
    for (final playlist in playlists) {
      if (playlist.lastRefreshed == null) continue;
      final nextRefresh = playlist.lastRefreshed!.add(
        Duration(milliseconds: playlist.refreshIntervalMs),
      );
      if (now.isAfter(nextRefresh)) {
        await refreshPlaylist(playlist.id);
      }
    }
  }

  Future<void> _importEntries(int playlistId, List<M3uEntry> entries) async {
    final groupNames =
        entries
            .map((e) => e.groupTitle)
            .whereType<String>()
            .where((g) => g.isNotEmpty)
            .toSet()
            .toList()
          ..sort();

    final groups = groupNames.asMap().entries.map((e) {
      return ChannelGroupsCompanion(
        playlistId: Value(playlistId),
        name: Value(e.value),
        providerName: Value(e.value),
        sortOrder: Value(e.key),
      );
    }).toList();

    await _repository.replaceChannelsForPlaylist(playlistId, groups, (
      groupMap,
    ) {
      return entries.map((entry) {
        final groupId = entry.groupTitle != null
            ? groupMap[entry.groupTitle]
            : null;
        final attrs = entry.attributes;
        final catchupMode = attrs['catchup'] ?? attrs['timeshift'];
        final catchupSource =
            attrs['catchup-source'] ??
            attrs['catchup_source'] ??
            attrs['timeshift-source'] ??
            attrs['timeshift_source'];
        final catchupDays = _parseCatchupDays(attrs);
        return ChannelsCompanion(
          playlistId: Value(playlistId),
          groupId: Value(groupId),
          name: Value(entry.name),
          streamUrl: Value(entry.streamUrl),
          logoUrl: Value(entry.tvgLogo),
          tvgId: Value(entry.tvgId),
          channelNumber: Value(entry.channelNumber),
          isVod: Value(entry.isVod),
          catchupMode: Value(catchupMode),
          catchupSource: Value(catchupSource),
          catchupDays: Value(catchupDays),
        );
      }).toList();
    });
  }

  int? _parseCatchupDays(Map<String, String> attrs) {
    final raw =
        attrs['catchup-days'] ??
        attrs['catchup_days'] ??
        attrs['timeshift'] ??
        attrs['timeshift-days'];
    if (raw == null || raw.trim().isEmpty) return null;

    final asInt = int.tryParse(raw.trim());
    if (asInt != null && asInt > 0) return asInt;

    final asDouble = double.tryParse(raw.trim());
    if (asDouble != null && asDouble > 0) {
      return asDouble.ceil();
    }
    return null;
  }

  List<M3uEntry> _xtreamStreamsToEntries(
    List<XtreamStream> liveStreams, {
    Map<String, String>? liveCategoryMap,
  }) {
    final entries = <M3uEntry>[];
    for (final stream in liveStreams) {
      final groupTitle = _resolveCategoryName(
        stream.categoryId,
        stream.categoryName,
        liveCategoryMap,
      );
      entries.add(
        M3uEntry(
          name: stream.name,
          streamUrl: xtreamLiveRef(stream.id),
          groupTitle: groupTitle,
          tvgId: stream.epgChannelId,
          tvgLogo: stream.streamIcon,
          channelNumber: stream.channelNumber,
          // Archive flags travel through the same attributes the M3U path
          // uses, so one import writer handles catchup for both sources.
          attributes: stream.tvArchive
              ? {
                  'catchup': 'default',
                  if (stream.tvArchiveDurationDays != null)
                    'catchup-days': '${stream.tvArchiveDurationDays}',
                }
              : const {},
        ),
      );
    }
    return entries;
  }

  Future<_XtreamCatalog> _fetchXtreamCatalog(XtreamApiClient client) async {
    final results = await Future.wait<dynamic>([
      client.getLiveCategories(),
      client.getLiveStreams(),
      client.getVodStreams(),
      client.getSeries(),
    ]);

    final liveCategoryMap = _buildCategoryMap(
      results[0] as List<XtreamCategory>,
    );
    final liveStreams = results[1] as List<XtreamStream>;
    final vodStreams = results[2] as List<XtreamStream>;
    final seriesStreams = results[3] as List<XtreamStream>;

    // Movies only go into VodItems, an isVod channel row as well would list
    // each one twice under Movies.
    final entries = _xtreamStreamsToEntries(
      liveStreams,
      liveCategoryMap: liveCategoryMap,
    );

    return _XtreamCatalog(
      entries: entries,
      vodStreams: vodStreams,
      seriesStreams: seriesStreams,
    );
  }

  Future<void> _importXtreamVod(int playlistId, _XtreamCatalog catalog) async {
    VodItemsCompanion row(XtreamStream s, {required bool isSeries}) {
      final title = splitTitleYear(s.name);
      final year = s.details.year ?? title.year;
      return s.details.onto(
        VodItemsCompanion.insert(
          playlistId: playlistId,
          streamId: s.id,
          name: title.title,
          year: Value.absentIfNull(year),
          streamIcon: Value(s.streamIcon),
          containerExtension: isSeries
              ? const Value.absent()
              : Value(s.containerExtension),
          isSeries: Value(isSeries),
          addedAt: Value.absentIfNull(s.addedAt),
        ),
      );
    }

    await _vodRepository.syncVodForPlaylist(playlistId, [
      for (final s in catalog.vodStreams) row(s, isSeries: false),
      for (final s in catalog.seriesStreams) row(s, isSeries: true),
    ]);
  }

  Map<String, String> _buildCategoryMap(List<XtreamCategory> categories) {
    final map = <String, String>{};
    for (final category in categories) {
      final name = category.name.trim();
      if (name.isEmpty) continue;
      final rawKey = category.id.trim();
      if (rawKey.isEmpty) continue;
      map[rawKey] = name;
      final normalizedKey = _normalizeCategoryKey(rawKey);
      if (normalizedKey.isNotEmpty) {
        map[normalizedKey] = name;
      }
    }
    return map;
  }

  String _resolveCategoryName(
    String categoryId,
    String? categoryName,
    Map<String, String>? categoryMap,
  ) {
    final streamName = categoryName?.trim();
    if (streamName != null && streamName.isNotEmpty) {
      return streamName;
    }

    final rawId = categoryId.trim();
    if (rawId.isEmpty) return _labels().uncategorized;

    final directMatch = categoryMap?[rawId];
    if (directMatch != null && directMatch.isNotEmpty) {
      return directMatch;
    }

    final normalizedId = _normalizeCategoryKey(rawId);
    final normalizedMatch = normalizedId.isNotEmpty
        ? (categoryMap?[normalizedId])
        : null;
    if (normalizedMatch != null && normalizedMatch.isNotEmpty) {
      return normalizedMatch;
    }

    return rawId;
  }

  String _normalizeCategoryKey(String value) {
    final trimmed = value.trim();
    final asInt = int.tryParse(trimmed);
    if (asInt != null) return asInt.toString();
    return trimmed;
  }

  PlaylistError _dioError(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout => (
        kind: PlaylistErrorKind.connectionTimeout,
        detail: null,
      ),
      DioExceptionType.receiveTimeout => (
        kind: PlaylistErrorKind.receiveTimeout,
        detail: null,
      ),
      DioExceptionType.connectionError => (
        kind: PlaylistErrorKind.unreachable,
        detail: null,
      ),
      DioExceptionType.badResponse => (
        kind: PlaylistErrorKind.badResponse,
        detail: '${e.response?.statusCode}',
      ),
      _ => (kind: PlaylistErrorKind.network, detail: e.message),
    };
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}

class _XtreamCatalog {
  final List<M3uEntry> entries;
  final List<XtreamStream> vodStreams;
  final List<XtreamStream> seriesStreams;

  const _XtreamCatalog({
    required this.entries,
    required this.vodStreams,
    required this.seriesStreams,
  });
}
