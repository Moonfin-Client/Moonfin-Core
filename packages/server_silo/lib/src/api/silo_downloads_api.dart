import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_item_mapper.dart' show siloOriginalKey;
import '../mappers/silo_media_source_mapper.dart';
import '../silo_kept_reads.dart';
import '../silo_problem.dart';

/// What Silo says about downloads for the acting profile
/// (`GET /capabilities/downloads`).
class SiloDownloadCapability {
  const SiloDownloadCapability({
    required this.state,
    required this.allowed,
    required this.enabled,
    required this.downloadAllowed,
    required this.qualityPresets,
    required this.qualityOptions,
    required this.prepareAgain,
  });

  factory SiloDownloadCapability.fromJson(Map<String, dynamic> json) {
    final presets = <String>[
      for (final p in json['quality_presets'] as List? ?? const [])
        if (p is String) p,
    ];
    final options = <SiloDownloadQualityOption>[
      for (final o in json['quality_options'] as List? ?? const [])
        if (asJsonMap(o) case final map? when map['preset'] is String)
          SiloDownloadQualityOption(
            preset: map['preset'] as String,
            bitrateKbps: (map['bitrate_kbps'] as num?)?.toInt(),
            maxHeight: (map['max_height'] as num?)?.toInt(),
          ),
    ];
    return SiloDownloadCapability(
      state: json['state'] as String? ?? 'unsupported',
      allowed: json['allowed'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      downloadAllowed: json['download_allowed'] as bool? ?? false,
      qualityPresets: presets,
      qualityOptions: options,
      prepareAgain: json['prepare_again'] as bool? ?? false,
    );
  }

  /// Support and configuration state (`available`, `disabled`,
  /// `not_configured`, `unsupported`), not health.
  final String state;

  /// The answer for this login: `download_allowed` and not refused by the
  /// server's demo mode.
  final bool allowed;

  /// Downloads are switched on on the server.
  final bool enabled;

  /// The account may download at all.
  final bool downloadAllowed;

  /// The qualities this account may ask for now, best first (`original`,
  /// `20mbps` down to `1mbps`). Empty when downloads are off for it.
  final List<String> qualityPresets;

  /// One entry per preset, in the same order: its video bitrate cap and the
  /// tallest picture it makes on this server (both absent for `original`).
  final List<SiloDownloadQualityOption> qualityOptions;

  /// The server can prepare a finished download's file again
  /// (`POST /downloads/{id}/prepare`) after cleaning it up.
  final bool prepareAgain;

  /// Whether the download actions should show: Silo's guide says to hide them
  /// unless downloads are enabled and allowed, and an empty preset list means
  /// the same.
  bool get permitsDownloads =>
      state == 'available' && enabled && allowed && qualityPresets.isNotEmpty;
}

/// One downloadable quality (`quality_options[]`).
class SiloDownloadQualityOption {
  const SiloDownloadQualityOption({
    required this.preset,
    this.bitrateKbps,
    this.maxHeight,
  });

  final String preset;
  final int? bitrateKbps;
  final int? maxHeight;
}

/// Silo's converted-download presets, best first, with their video bitrate
/// caps in kbit/s.
const siloDownloadPresets = {
  '20mbps': 20000,
  '10mbps': 10000,
  '5mbps': 5000,
  '2mbps': 2000,
  '1mbps': 1000,
};

/// The Silo preset for a converted download capped at [maxVideoBitrate]
/// (bit/s), among the presets the account may use ([allowed]), or null when
/// it may use none that fits.
///
/// The preset is the smallest whose cap reaches the bitrate asked for:
/// Moonfin's 1080p (4 Mbit/s) is `5mbps` (up to 1080p), 720p (2 Mbit/s) is
/// `2mbps` (720p), 480p (1 Mbit/s) and 360p (0.5 Mbit/s) are `1mbps` (480p).
/// When that preset isn't allowed, it's the next lower one that is, never a
/// higher one, which would be a bigger file than was asked for.
String? siloDownloadPreset(
  int maxVideoBitrate, {
  required List<String> allowed,
}) {
  final ascending = siloDownloadPresets.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  final ideal = ascending.firstWhere(
    (p) => p.value * 1000 >= maxVideoBitrate,
    orElse: () => ascending.last,
  );
  for (final preset in ascending.reversed) {
    if (preset.value <= ideal.value && allowed.contains(preset.key)) {
      return preset.key;
    }
  }
  return null;
}

/// Silo's downloads (`/api/v2/downloads…`, `/capabilities/downloads`).
///
/// Moonfin's Silo client sends `X-Silo-Device-Id` and `X-Profile-Id` on every
/// request, so every download it makes is a **managed** entry of this device
/// and profile: Silo keeps a registry of what the device holds, serves a
/// manifest for it, and can revoke it.
class SiloDownloadsApi implements ServerDownloadsApi {
  SiloDownloadsApi(
    this._dio, {
    required String Function() baseUrl,
    required Map<String, String> Function() headers,
    DateTime Function()? clock,
    this.preparationPollInterval = const Duration(seconds: 5),
  }) : _baseUrl = baseUrl,
       _headers = headers,
       _clock = clock ?? DateTime.now;

  final Dio _dio;
  final String Function() _baseUrl;

  /// The client's request headers (login, profile, device), for transfers
  /// made outside this client.
  final Map<String, String> Function() _headers;
  final DateTime Function() _clock;

  /// Most entries read while looking for an item's existing entry: 10 pages
  /// of Silo's largest page.
  static const _entryScanPages = 10;
  static const _entryPageSize = 100;

  /// How long a capability answer is reused. It changes when an admin
  /// changes the account's download permission or the server's download
  /// settings, and the access-change path clears it at once.
  static const capabilityTtl = Duration(minutes: 1);

  late final _capability = SiloKeptReads<String, SiloDownloadCapability>(
    lifetime: capabilityTtl,
    clock: _clock,
  );

  /// The downloads capability for the acting profile, read at most once a
  /// minute (concurrent callers share one read). Throws when it can't be
  /// read.
  Future<SiloDownloadCapability> capability() =>
      _capability.get('downloads', _readCapability);

  Future<SiloDownloadCapability> _readCapability() async {
    final response = await _dio.get<dynamic>('/api/v2/capabilities/downloads');
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected a download capability from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    return SiloDownloadCapability.fromJson(json);
  }

  /// Forgets the capability, so the next read asks Silo (the account's
  /// access changed, or the login did).
  void invalidateCapability() {
    _capability.forget();
    _entriesByItem.forget();
  }

  /// Registers the download with Silo (`POST /downloads`) and returns the
  /// file to fetch (`GET /downloads/{id}/file`, with the client's headers).
  ///
  /// A movie is `content_id`. An episode is its series as `content_id` and
  /// itself as `episode_id`. The version is the request's media source (Silo
  /// file ids are Moonfin's media source ids). The request carries this
  /// device's `X-Silo-Device-Id`, so the entry is this device's own.
  ///
  /// Silo needs the entry's revision with a single managed request: `0` when
  /// the device has none for the item, or the existing entry's id and
  /// revision (Silo reuses it, revives it, or replaces its file). So the
  /// device's entries are read first ([existingEntry]), which is the
  /// reconciliation Silo's guide asks for before creating. Creation is
  /// `non_retryable` and is sent once.
  ///
  /// A converted quality is one of Silo's presets ([siloDownloadPreset]).
  /// Silo makes the file first, and this waits for it ([_waitUntilServable]).
  @override
  Future<ServerDownloadTicket> prepareDownload(
    ServerDownloadRequest request, {
    void Function(ServerDownloadPreparation preparation)? onPreparing,
    bool Function()? isCancelled,
  }) async {
    final capability = await this.capability();
    if (!capability.permitsDownloads) {
      throw const ServerDownloadRefused(
        'Downloads are switched off on this server.',
        reason: 'downloads_unavailable',
      );
    }
    final quality = request.original
        ? 'original'
        : siloDownloadPreset(
            request.maxVideoBitrate!,
            allowed: capability.qualityPresets,
          );
    if (quality == null) {
      throw const ServerDownloadRefused(
        'This server offers only original-quality downloads to this account.',
        reason: 'quality_unavailable',
      );
    }
    final existing = await existingEntry(request.itemId);
    var entry = await _create(request, quality: quality, existing: existing);
    (await _entryIndex())[request.itemId] = entry;
    // A converted file Silo cleaned up after an earlier download of this item
    // is made again on request. For anything else this changes nothing.
    if (entry.status == 'completed' &&
        entry.deliveryFormat != 'original' &&
        capability.prepareAgain) {
      entry = await _prepareAgain(entry);
    }
    entry = await _waitUntilServable(
      entry,
      onPreparing: onPreparing,
      isCancelled: isCancelled,
    );
    return _ticketFor(entry, request.itemId);
  }

  /// Whether [prepareDownload] finds an allowed preset for [maxVideoBitrate].
  @override
  Future<bool> convertsDownloadsAt(int maxVideoBitrate) async {
    final capability = await this.capability();
    return capability.permitsDownloads &&
        siloDownloadPreset(
              maxVideoBitrate,
              allowed: capability.qualityPresets,
            ) !=
            null;
  }

  /// How often a file Silo is preparing is checked on. Silo refreshes the
  /// preparation numbers at most every 5 seconds. Tests shorten it.
  Duration preparationPollInterval;

  /// `POST /downloads/{id}/prepare`: the entry back to `preparing` when its
  /// converted file was cleaned up (`natural_idempotent`, and unchanged when
  /// the file is still there).
  Future<SiloDownloadEntry> _prepareAgain(SiloDownloadEntry entry) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/downloads/${Uri.encodeComponent(entry.id)}/prepare',
    );
    final json = asJsonMap(response.data);
    return json == null ? entry : SiloDownloadEntry.fromJson(json);
  }

  /// Waits until [entry]'s file can be fetched, reading the device's entries
  /// every [preparationPollInterval] (the listed entry carries Silo's
  /// `preparation`: queue place, or encode progress and time left).
  Future<SiloDownloadEntry> _waitUntilServable(
    SiloDownloadEntry entry, {
    void Function(ServerDownloadPreparation preparation)? onPreparing,
    bool Function()? isCancelled,
  }) async {
    var current = entry;
    while (!current.servable) {
      switch (current.status) {
        case 'failed':
          throw const ServerDownloadRefused(
            "Silo couldn't prepare this file.",
            reason: 'failed',
          );
        case 'revoked' || 'cancelled' || 'canceled':
          throw ServerDownloadRefused(
            'Silo withdrew this download (${current.status}).',
            reason: current.status,
          );
      }
      onPreparing?.call(current.preparationProgress);
      await Future<void>.delayed(preparationPollInterval);
      if (isCancelled?.call() ?? false) throw const ServerDownloadCancelled();
      final listed = await _entryById(current.id);
      if (listed == null) {
        throw const ServerDownloadRefused(
          'Silo no longer has this download.',
          reason: 'not_found',
        );
      }
      current = listed;
    }
    return current;
  }

  Future<SiloDownloadEntry?> _entryById(String id) async {
    await for (final entry in _entries()) {
      if (entry.id == id) return entry;
    }
    return null;
  }

  /// Sends the create request and returns its entry. A refusal Silo lists in
  /// `skipped` (`no_file`, `quality_unavailable`) becomes a
  /// [ServerDownloadRefused].
  Future<SiloDownloadEntry> _create(
    ServerDownloadRequest request, {
    required String quality,
    required SiloDownloadEntry? existing,
  }) async {
    final isEpisode = request.seriesId != null && request.seriesId!.isNotEmpty;
    final Response<dynamic> response;
    try {
      response = await _dio.post<dynamic>(
        '/api/v2/downloads',
        data: {
          'content_id': isEpisode ? request.seriesId : request.itemId,
          if (isEpisode) 'episode_id': request.itemId,
          if (request.mediaSourceId case final id? when id.isNotEmpty)
            'media_file_id': id,
          'quality': quality,
          'expected_revision': existing?.revision ?? 0,
          if (existing != null) 'expected_download_id': existing.id,
        },
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 403 || status == 404 || status == 422) {
        final problem = SiloProblem.of(e);
        throw ServerDownloadRefused(
          problem?.message ?? 'Silo refused this download.',
          reason: problem?.code,
        );
      }
      rethrow;
    }
    final body = asJsonMap(response.data);
    final items = body?['items'] as List? ?? const [];
    final entry = items.isEmpty ? null : asJsonMap(items.first);
    if (entry == null) {
      final skipped = (body?['skipped'] as List? ?? const [])
          .map(asJsonMap)
          .whereType<Map<String, dynamic>>()
          .firstOrNull;
      final reason = skipped?['reason'] as String?;
      throw ServerDownloadRefused(switch (reason) {
        'no_file' => 'Silo has no file for this title.',
        'quality_unavailable' =>
          "Silo can't prepare this title at that quality.",
        _ => 'Silo registered no download for this title.',
      }, reason: reason);
    }
    return SiloDownloadEntry.fromJson(entry);
  }

  ServerDownloadTicket _ticketFor(
    SiloDownloadEntry entry,
    String itemId,
  ) => ServerDownloadTicket(
    id: entry.id,
    itemId: itemId,
    url: Uri.parse(
      '${_baseUrl()}/api/v2/downloads/${Uri.encodeComponent(entry.id)}/file',
    ),
    headers: () => {..._headers(), 'Accept': 'application/octet-stream'},
    revision: entry.revision,
    sizeBytes: entry.fileSize > 0 ? entry.fileSize : null,
    container: entry.deliveryFormat == 'original' ? null : 'mp4',
    mediaSourceId: entry.mediaFileId.isEmpty ? null : entry.mediaFileId,
  );

  /// This device's entry for the movie or episode [itemId], or null.
  Future<SiloDownloadEntry?> existingEntry(String itemId) async =>
      (await _entryIndex())[itemId];

  /// This device's entries by item, newest first winning: the device's
  /// entries (`GET /downloads`, newest first) for at most [_entryScanPages]
  /// pages. Kept a few seconds, so a season queued at once lists them once
  /// rather than once per episode. An entry this client creates is put in.
  Future<Map<String, SiloDownloadEntry>> _entryIndex() =>
      _entriesByItem.get('device', () async {
        final byItem = <String, SiloDownloadEntry>{};
        await for (final entry in _entries()) {
          byItem.putIfAbsent(entry.itemId, () => entry);
        }
        return byItem;
      });

  late final _entriesByItem =
      SiloKeptReads<String, Map<String, SiloDownloadEntry>>(
        lifetime: const Duration(seconds: 10),
        clock: _clock,
      );

  Stream<SiloDownloadEntry> _entries() async* {
    String? cursor;
    for (var page = 0; page < _entryScanPages; page++) {
      final response = await _dio.get<dynamic>(
        '/api/v2/downloads',
        queryParameters: {
          'limit': _entryPageSize,
          if (cursor != null) 'cursor': cursor,
        },
      );
      final body = asJsonMap(response.data);
      for (final raw in body?['items'] as List? ?? const []) {
        if (asJsonMap(raw) case final json?) {
          yield SiloDownloadEntry.fromJson(json);
        }
      }
      final pageInfo = asJsonMap(body?['page']);
      cursor = pageInfo?['next_cursor'] as String?;
      if (pageInfo?['has_more'] != true || cursor == null) return;
    }
  }

  /// A short-lived link for a browser (`POST /direct-download/links`): it
  /// carries its own credential (`dl`, five minutes), since a browser
  /// download sends no headers. Original files only.
  @override
  Future<Uri?> browserDownloadUrl(ServerDownloadRequest request) async {
    final fileId = request.mediaSourceId;
    if (!request.original || fileId == null || fileId.isEmpty) return null;
    final response = await _dio.post<dynamic>(
      '/api/v2/direct-download/links',
      data: {'file_id': fileId},
    );
    final url = asJsonMap(response.data)?['url'] as String?;
    if (url == null || url.isEmpty) return null;
    return Uri.parse('${_baseUrl()}$url');
  }

  /// Tells Silo the device holds the whole file (`PATCH /downloads/{id}`,
  /// `completed` for the ticket's revision, timed now).
  ///
  /// Silo refuses an event timed after its own clock (`400`, "invalid
  /// download status event"), so a device whose clock runs ahead of the
  /// server's would never get one accepted. On that refusal the event is sent
  /// once more, timed a second before the server's clock in the refusal's
  /// `Date` header. The route is `domain_identity`, so repeating a completion
  /// changes nothing.
  @override
  Future<void> downloadFinished(ServerDownloadTicket ticket) async {
    final revision = ticket.revision;
    if (revision == null) return;
    Future<void> report(DateTime at) => _dio.patch<dynamic>(
      '/api/v2/downloads/${Uri.encodeComponent(ticket.id)}',
      data: {
        'status': 'completed',
        'updated_at': at.toUtc().toIso8601String(),
        'revision': revision,
      },
    );
    try {
      await report(_clock());
    } on DioException catch (e) {
      final serverNow = SiloProblem.serverDate(e);
      if (e.response?.statusCode != 400 || serverNow == null) rethrow;
      await report(serverNow.subtract(const Duration(seconds: 1)));
    }
  }

  /// The download's manifest (`GET /downloads/{id}/manifest`): Silo's
  /// offline description of it, with authenticated links to its artwork and
  /// subtitles. Read once per download and kept for the other assets.
  Future<Map<String, dynamic>> manifest(ServerDownloadTicket ticket) {
    if (!_manifests.containsKey(ticket.id) && _manifests.length >= 8) {
      _manifests.remove(_manifests.keys.first);
    }
    return _manifests[ticket.id] ??= () async {
      try {
        final response = await _dio.get<dynamic>(
          '/api/v2/downloads/${Uri.encodeComponent(ticket.id)}/manifest',
        );
        final json = asJsonMap(response.data);
        if (json == null) {
          throw FormatException(
            'Expected a download manifest from Silo, got '
            '${response.data.runtimeType}',
          );
        }
        return json;
      } catch (_) {
        _manifests.remove(ticket.id);
        rethrow;
      }
    }();
  }

  // Manifests of the last few downloads. Their assets are fetched right
  // after the file.
  final _manifests = <String, Future<Map<String, dynamic>>>{};

  /// The manifest's `artwork_urls` (`/downloads/{id}/artwork/{kind}`, served
  /// to this device and profile only), made absolute.
  @override
  Future<Map<ServerDownloadArtworkKind, Uri>> downloadArtwork(
    ServerDownloadTicket ticket,
  ) async {
    final urls = asJsonMap((await manifest(ticket))['artwork_urls']);
    final result = <ServerDownloadArtworkKind, Uri>{};
    for (final (key, kind) in const [
      ('poster', ServerDownloadArtworkKind.poster),
      ('backdrop', ServerDownloadArtworkKind.backdrop),
      ('logo', ServerDownloadArtworkKind.logo),
      ('series_poster', ServerDownloadArtworkKind.seriesPoster),
    ]) {
      final path = urls?[key];
      if (path is String && path.isNotEmpty) {
        if (_absolute(path) case final url?) result[kind] = url;
      }
    }
    return result;
  }

  /// The manifest's `subtitles` that aren't in the downloaded file, each
  /// matched to its stream in Moonfin's [mediaSource] (`subtitles/{ref}`,
  /// served to this device and profile, timing corrections applied).
  ///
  /// Silo names them by reference: `external:{n}` is the file's n-th sidecar,
  /// and Moonfin's media source lists the version's subtitle tracks with the
  /// sidecars marked `external`, in the same order. `embedded:{n}` is the
  /// file's n-th subtitle track, an ASS or PGS track that a converted MP4
  /// can't hold (an original keeps its embedded tracks, so it gets none).
  /// `downloaded:{id}` (subtitles fetched into Silo by its subtitle search)
  /// has no stream in the media source, so each gets one after the file's
  /// own, as streaming numbers them.
  @override
  Future<List<ServerDownloadSubtitle>> downloadSubtitles(
    ServerDownloadTicket ticket, {
    required Map<String, dynamic> mediaSource,
  }) async {
    final manifest = await this.manifest(ticket);
    final converted = (manifest['delivery_format'] ?? 'original') != 'original';
    final tracks = [
      for (final t
          in asJsonMap(mediaSource[siloOriginalKey])?['subtitle_tracks']
                  as List? ??
              const [])
        asJsonMap(t) ?? const <String, dynamic>{},
    ];
    final sidecarOrdinals = [
      for (final (i, t) in tracks.indexed)
        if (t['external'] == true) i,
    ];
    var nextIndex = siloNextStreamIndex(mediaSource);
    final result = <ServerDownloadSubtitle>[];
    for (final raw in manifest['subtitles'] as List? ?? const []) {
      final subtitle = asJsonMap(raw);
      if (subtitle == null) continue;
      final url = subtitle['fetch_url'] as String?;
      final format = (subtitle['format'] as String?)?.toLowerCase();
      // The format becomes the saved file's extension.
      if (url == null ||
          url.isEmpty ||
          format == null ||
          !RegExp(r'^[a-z0-9]+$').hasMatch(format)) {
        continue;
      }
      final absolute = _absolute(url);
      if (absolute == null) continue;
      final ref = Uri.decodeComponent(url.split('/').last).split(':');
      final extension = format == 'ssa' ? 'ass' : format;
      if (ref.length == 2 && ref[0] == 'downloaded' && ref[1].isNotEmpty) {
        final index = nextIndex++;
        result.add(
          ServerDownloadSubtitle(
            url: absolute,
            streamIndex: index,
            format: extension,
            stream: siloAddedSubtitleStream(
              index: index,
              codec: extension,
              language: subtitle['language'] as String?,
              forced: subtitle['forced'] == true,
              hearingImpaired: subtitle['hearing_impaired'] == true,
            ),
          ),
        );
        continue;
      }
      final n = ref.length == 2 ? int.tryParse(ref[1]) : null;
      if (n == null || n < 0) continue;
      final ordinal = switch (ref[0]) {
        'external' when n < sidecarOrdinals.length => sidecarOrdinals[n],
        'embedded'
            when converted &&
                n < tracks.length &&
                tracks[n]['external'] != true =>
          n,
        _ => null,
      };
      if (ordinal == null) continue;
      final index = siloStreamIndexForTrack(
        mediaSource,
        SiloTrackKind.subtitle,
        ordinal,
      );
      if (index == null) continue;
      result.add(
        ServerDownloadSubtitle(
          url: absolute,
          streamIndex: index,
          format: extension,
        ),
      );
    }
    return result;
  }

  /// [path] made absolute, or null when it isn't on the server's origin: the
  /// download's headers carry the account's credentials.
  Uri? _absolute(String path) {
    final uri = Uri.tryParse(
      path.startsWith('http') ? path : '${_baseUrl()}$path',
    );
    final base = Uri.parse(_baseUrl());
    if (uri == null ||
        uri.scheme != base.scheme ||
        uri.host != base.host ||
        uri.port != base.port) {
      return null;
    }
    return uri;
  }

  /// Deletes this device's entries for [itemIds] (`DELETE /downloads/{id}`),
  /// found among the device's entries. One already gone (`404`) is fine.
  @override
  Future<void> downloadsRemoved(Iterable<String> itemIds) async {
    final wanted = itemIds.toSet();
    if (wanted.isEmpty) return;
    final found = <SiloDownloadEntry>[];
    await for (final entry in _entries()) {
      if (wanted.contains(entry.itemId)) found.add(entry);
    }
    _entriesByItem.forget();
    for (final entry in found) {
      try {
        await _dio.delete<dynamic>(
          '/api/v2/downloads/${Uri.encodeComponent(entry.id)}',
        );
      } on DioException catch (e) {
        if (e.response?.statusCode != 404) rethrow;
      }
    }
  }
}

/// One entry of the device's download registry (`DownloadEntry`).
class SiloDownloadEntry {
  const SiloDownloadEntry({
    required this.id,
    required this.contentId,
    required this.episodeId,
    required this.status,
    required this.revision,
    required this.fileSize,
    required this.deliveryFormat,
    this.mediaFileId = '',
    this.preparation,
  });

  factory SiloDownloadEntry.fromJson(Map<String, dynamic> json) =>
      SiloDownloadEntry(
        id: json['id']?.toString() ?? '',
        contentId: json['content_id']?.toString() ?? '',
        episodeId: json['episode_id']?.toString() ?? '',
        status: json['status'] as String? ?? '',
        revision: (json['revision'] as num?)?.toInt() ?? 0,
        fileSize: (json['file_size'] as num?)?.toInt() ?? 0,
        deliveryFormat: json['delivery_format'] as String? ?? 'original',
        mediaFileId: json['media_file_id']?.toString() ?? '',
        preparation: asJsonMap(json['preparation']),
      );

  final String id;
  final String contentId;

  /// The episode, or empty for a movie.
  final String episodeId;

  /// `ready`, `preparing`, `downloading`, `completed`, `failed`, `revoked`…
  final String status;
  final int revision;
  final int fileSize;

  /// `original`, `remux` or `transcode`.
  final String deliveryFormat;

  /// The file (version) the entry is of.
  final String mediaFileId;

  /// Where a preparing file is in Silo's queue (listed entries only).
  final Map<String, dynamic>? preparation;

  /// The movie or episode the entry is for: Moonfin's item id.
  String get itemId => episodeId.isNotEmpty ? episodeId : contentId;

  /// Silo's `preparation` as the shared shape.
  ServerDownloadPreparation get preparationProgress =>
      ServerDownloadPreparation(
        progress: (preparation?['progress'] as num?)?.toDouble(),
        remainingSeconds: (preparation?['remaining_seconds'] as num?)?.toInt(),
        queuePosition: (preparation?['queue_position'] as num?)?.toInt(),
      );

  /// Whether Silo serves its file now: `ready`, or `downloading` and
  /// `completed`, which a device reports on a ready file (an earlier
  /// download of the same item that Silo hands back on registering).
  bool get servable =>
      status == 'ready' || status == 'downloading' || status == 'completed';
}
