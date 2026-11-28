import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../abs_ids.dart';
import '../abs_item_mapper.dart';
import '../abs_progress.dart';

/// Opens Audiobookshelf playback sessions and reports into them.
///
/// A book in several files plays as the server's HLS stream of the whole
/// book, since the players take one stream per item and the book's chapters
/// and progress run over all of it.
class AbsPlaybackApi implements PlaybackApi {
  AbsPlaybackApi(
    this._dio,
    this._deviceInfo,
    this._baseUrl,
    this._accessToken,
    this._progress,
  );

  final Dio _dio;
  final DeviceInfo _deviceInfo;
  final String Function() _baseUrl;
  final String? Function() _accessToken;
  final AbsProgressCache _progress;

  /// When each open session last reported, to tell the server how long was
  /// listened since.
  final _lastReport = <String, ({DateTime at, double position})>{};

  static const _mimeByContainer = {
    'mp3': ['audio/mpeg', 'audio/mp3'],
    'aac': ['audio/aac', 'audio/x-aac'],
    'm4a': ['audio/mp4', 'audio/x-m4a'],
    'm4b': ['audio/mp4', 'audio/x-m4b'],
    'mp4': ['audio/mp4'],
    'flac': ['audio/flac', 'audio/x-flac'],
    'ogg': ['audio/ogg'],
    'oga': ['audio/ogg'],
    'opus': ['audio/ogg', 'audio/opus'],
    'webm': ['audio/webm'],
    'webma': ['audio/webm'],
    'wav': ['audio/wav', 'audio/x-wav'],
    'wma': ['audio/x-ms-wma'],
    'mka': ['audio/x-matroska'],
  };

  /// The audio types [profile] plays directly, or every type a player is
  /// likely to manage when there's no profile to go by.
  static List<String> supportedMimeTypes(Map<String, dynamic>? profile) {
    final containers = <String>{};
    for (final entry in profile?['DirectPlayProfiles'] as List? ?? const []) {
      if (entry is! Map) continue;
      final type = entry['Type'] as String?;
      if (type != null && type != 'Audio') continue;
      for (final container in '${entry['Container'] ?? ''}'.split(',')) {
        if (container.trim().isNotEmpty) containers.add(container.trim().toLowerCase());
      }
    }
    final keys = containers.isEmpty ? _mimeByContainer.keys : containers;
    return {
      for (final container in keys) ...?_mimeByContainer[container],
    }.toList();
  }

  Map<String, dynamic> get _device => {
    'deviceId': _deviceInfo.id,
    'clientName': _deviceInfo.appName,
    'clientVersion': _deviceInfo.appVersion,
    // The server names a device "<manufacturer> <model>" and ignores any
    // name sent with it.
    'manufacturer': 'Moonfin',
    'model': _deviceInfo.name,
  };

  String _playPath(String itemId) {
    final episode = absEpisodeKey(itemId);
    return episode == null
        ? '/api/items/$itemId/play'
        : '/api/items/${episode.itemId}/play/${episode.episodeId}';
  }

  Future<Map<String, dynamic>> _open(
    String itemId,
    List<String> mimeTypes, {
    required bool forceTranscode,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      _playPath(itemId),
      data: {
        'deviceInfo': _device,
        'mediaPlayer': _deviceInfo.appName,
        'supportedMimeTypes': mimeTypes,
        'forceDirectPlay': false,
        'forceTranscode': forceTranscode,
      },
    );
    return response.data ?? const {};
  }

  String _absolute(String contentUrl, {required bool signed}) {
    final url = contentUrl.startsWith('http')
        ? contentUrl
        : '${_baseUrl()}$contentUrl';
    final token = _accessToken();
    if (!signed || token == null || token.isEmpty) return url;
    return '$url${url.contains('?') ? '&' : '?'}token=${Uri.encodeQueryComponent(token)}';
  }

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final mimeTypes = supportedMimeTypes(
      (requestBody?['DeviceProfile'] as Map?)?.cast<String, dynamic>(),
    );
    // Opening a session closes every other one this device has open, the
    // book playing now included, so a caller only asking what would play
    // gets an answer from the item.
    if (!waitForMediaProbe) return _describe(itemId, mimeTypes);
    var session = await _open(itemId, mimeTypes, forceTranscode: false);
    var tracks = session['audioTracks'] as List? ?? const [];
    if (tracks.length > 1) {
      await _close(session['id'] as String?);
      session = await _open(itemId, mimeTypes, forceTranscode: true);
      tracks = session['audioTracks'] as List? ?? const [];
    }
    final track = tracks.firstOrNull;
    if (track is! Map) {
      await _close(session['id'] as String?);
      return {'MediaSources': const [], 'ErrorCode': 'NoCompatibleStream'};
    }
    final sessionId = session['id'] as String;
    final contentUrl = track['contentUrl'] as String;
    final hls = contentUrl.contains('.m3u8');
    final directPlay = (session['playMethod'] as int? ?? 0) == 0;
    final ext = (track['metadata'] as Map?)?['ext'] as String?;
    final container = hls
        ? 'aac'
        : (ext ?? '').replaceFirst('.', '').toLowerCase();
    _lastReport[sessionId] = (
      at: DateTime.now(),
      position: (session['currentTime'] as num? ?? 0).toDouble(),
    );
    final url = _absolute(contentUrl, signed: !hls);
    return {
      'PlaySessionId': sessionId,
      'MediaSources': [
        {
          'Id': itemId,
          'Name': session['displayTitle'],
          'Container': container,
          'Path': directPlay ? url : null,
          'TranscodingUrl': directPlay ? null : url,
          'Protocol': 'Http',
          'IsRemote': true,
          'SupportsDirectPlay': directPlay,
          'SupportsDirectStream': false,
          'SupportsTranscoding': !directPlay,
          'RunTimeTicks': absTicks(session['duration']),
          'Bitrate': track['bitRate'],
          'MediaStreams': [
            {
              'Type': 'Audio',
              'Index': 0,
              'Codec': track['codec'] ?? (hls ? 'aac' : container),
              'Channels': track['channels'],
              'BitRate': track['bitRate'],
              'IsDefault': true,
            },
          ],
          'DefaultAudioStreamIndex': 0,
        },
      ],
      'AbsCurrentTimeTicks': absTicks(session['currentTime']),
      'AbsChapters': absChapters(session['chapters']),
    };
  }

  Future<Map<String, dynamic>> _describe(
    String itemId,
    List<String> mimeTypes,
  ) async {
    final episode = absEpisodeKey(itemId);
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/items/${absItemIdOf(itemId)}',
      queryParameters: {'expanded': 1},
    );
    final item = response.data ?? const {};
    final media = (item['media'] as Map?) ?? const {};
    final List tracks;
    if (episode == null) {
      tracks = media['tracks'] as List? ?? const [];
    } else {
      final found = (media['episodes'] as List? ?? const []).whereType<Map>().where(
        (e) => e['id'] == episode.episodeId,
      );
      final track = found.isEmpty ? null : found.first['audioTrack'];
      tracks = [?track];
    }
    final track = tracks.isEmpty ? null : tracks.first as Map;
    if (track == null) {
      return {'MediaSources': const [], 'ErrorCode': 'NoCompatibleStream'};
    }
    final directPlay =
        tracks.length == 1 && mimeTypes.contains(track['mimeType']);
    final ext = ((track['metadata'] as Map?)?['ext'] as String? ?? '')
        .replaceFirst('.', '')
        .toLowerCase();
    final url = _absolute(track['contentUrl'] as String, signed: true);
    return {
      'MediaSources': [
        {
          'Id': itemId,
          'Container': tracks.length == 1 ? ext : 'aac',
          'Path': directPlay ? url : null,
          'Protocol': 'Http',
          'IsRemote': true,
          'SupportsDirectPlay': directPlay,
          'SupportsDirectStream': false,
          'SupportsTranscoding': !directPlay,
          'RunTimeTicks': absTicks(media['duration'] ?? track['duration']),
          'Bitrate': track['bitRate'],
          'MediaStreams': [
            {
              'Type': 'Audio',
              'Index': 0,
              'Codec': track['codec'],
              'Channels': track['channels'],
              'BitRate': track['bitRate'],
              'IsDefault': true,
            },
          ],
          'DefaultAudioStreamIndex': 0,
        },
      ],
    };
  }

  @override
  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  }) => _absolute('/api/items/${absItemIdOf(itemId)}/download', signed: true);

  Map<String, dynamic> _syncBody(String sessionId, Map<String, dynamic> info) {
    final position = absSeconds(info['PositionTicks'] as int? ?? 0);
    final paused = info['IsPaused'] == true;
    final now = DateTime.now();
    final last = _lastReport[sessionId];
    var listened = 0.0;
    if (last != null && !paused) {
      final wall = now.difference(last.at).inMilliseconds / 1000;
      final moved = (position - last.position).abs();
      // A seek moves the position without anyone listening to it.
      listened = moved < wall + 5 ? wall : 0;
    }
    _lastReport[sessionId] = (at: now, position: position);
    return {
      'currentTime': position,
      'timeListened': listened,
      'duration': ?(info['RunTimeTicks'] is int
          ? absSeconds(info['RunTimeTicks'] as int)
          : null),
    };
  }

  /// When each item played from a download last saved its position.
  final _lastLocalSave = <String, DateTime>{};
  static const _localSaveInterval = Duration(seconds: 15);

  /// A download plays without a server session, as does the offline catch
  /// up after it, so its position goes straight to the item's progress.
  Future<void> _saveLocalPosition(
    Map<String, dynamic> info, {
    required bool force,
  }) async {
    final itemId = info['ItemId'] as String?;
    if (itemId == null) return;
    final now = DateTime.now();
    final last = _lastLocalSave[itemId];
    if (!force && last != null && now.difference(last) < _localSaveInterval) {
      return;
    }
    _lastLocalSave[itemId] = now;
    final runTimeTicks = info['RunTimeTicks'];
    await _dio.patch<dynamic>(
      absProgressPath(itemId),
      data: absPositionBody(
        absSeconds(info['PositionTicks'] as int? ?? 0),
        runTimeTicks is int ? absSeconds(runTimeTicks) : null,
      ),
    );
    _progress.invalidate();
  }

  @override
  Future<void> reportPlaybackStart(Map<String, dynamic> info) async {
    final sessionId = info['PlaySessionId'] as String?;
    if (sessionId == null) return;
    _lastReport[sessionId] = (
      at: DateTime.now(),
      position: absSeconds(info['PositionTicks'] as int? ?? 0),
    );
  }

  @override
  Future<void> reportPlaybackProgress(Map<String, dynamic> info) async {
    final sessionId = info['PlaySessionId'] as String?;
    if (sessionId == null) return _saveLocalPosition(info, force: false);
    await _dio.post<dynamic>(
      '/api/session/$sessionId/sync',
      data: _syncBody(sessionId, info),
    );
    _progress.invalidate();
  }

  @override
  Future<void> reportPlaybackStopped(Map<String, dynamic> info) async {
    final sessionId = info['PlaySessionId'] as String?;
    if (sessionId == null) {
      _lastLocalSave.remove(info['ItemId']);
      return _saveLocalPosition(info, force: true);
    }
    final body = _syncBody(sessionId, info);
    _lastReport.remove(sessionId);
    try {
      await _dio.post<dynamic>('/api/session/$sessionId/close', data: body);
    } finally {
      _progress.invalidate();
    }
  }

  Future<void> _close(String? sessionId) async {
    if (sessionId == null) return;
    _lastReport.remove(sessionId);
    try {
      await _dio.post<dynamic>('/api/session/$sessionId/close');
    } on DioException {
      // A session that's already gone has nothing left to close.
    }
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopActiveEncodings({
    required String deviceId,
    String? playSessionId,
  }) async {}
}
