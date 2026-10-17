import 'dart:math';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';
import 'plex_apis.dart';

const _plexNames = {
  'ts': 'mpegts',
  'm2ts': 'mpegts',
  'm4v': 'mp4',
  'm4a': 'mp4',
  'm4b': 'mp4',
  'ogm': 'ogg',
  'ogv': 'ogg',
  'oga': 'ogg',
  'wmv': 'asf',
  'wma': 'asf',
  'vob': 'mpeg',
  'dts': 'dca',
  'mpeg': 'mpeg1video',
};
const _anyContainer = 'mkv,mp4,mov,avi,mpegts,webm,asf,ogg,mpeg';
const _anyMusicContainer = 'mp3,flac,mp4,ogg,wav,aac';
const _anyVideoCodec = 'h264,hevc,mpeg1video,mpeg2video,mpeg4,vc1,vp8,vp9,av1';
const _anyAudioCodec = 'aac,ac3,eac3,mp3,dca,truehd,flac,opus,vorbis,pcm';

/// The app's Jellyfin device profile in Plex's client profile terms, so Plex
/// makes the direct play and transcode calls Jellyfin would. Plex reads a
/// missing codec list as none, where Jellyfin reads it as any.
String plexClientProfile(Map<String, dynamic>? profile) {
  String names(Object? list, String any) {
    final mapped = {
      for (final name in '${list ?? ''}'.split(','))
        if (name.trim().isNotEmpty) _plexNames[name.trim()] ?? name.trim(),
    };
    return mapped.isEmpty ? any : mapped.join(',');
  }

  Map? hls(String type) =>
      (profile?['TranscodingProfiles'] as List? ?? const [])
          .whereType<Map>()
          .where(
            (p) =>
                p['Type'] == type &&
                p['Protocol'] == 'hls' &&
                p['Container'] == 'ts',
          )
          .firstOrNull;
  final videoHls = hls('Video');
  return [
    // The player switches audio tracks itself, so a file whose chosen track
    // isn't the first can still direct play.
    'add-settings(DirectPlayStreamSelection=true)',
    for (final p in profile?['DirectPlayProfiles'] as List? ?? const [])
      if (p is Map && p['Type'] == 'Video')
        'add-direct-play-profile(type=videoProfile'
            '&container=${names(p['Container'], _anyContainer)}'
            '&videoCodec=${names(p['VideoCodec'], _anyVideoCodec)}'
            '&audioCodec=${names(p['AudioCodec'], _anyAudioCodec)})'
      else if (p is Map && p['Type'] == 'Audio')
        'add-direct-play-profile(type=musicProfile'
            '&container=${names(p['Container'], _anyMusicContainer)}'
            '&audioCodec=${names(p['AudioCodec'], _anyAudioCodec)})',
    'add-transcode-target(type=videoProfile&context=streaming&protocol=hls'
        '&container=mpegts'
        '&videoCodec=${names(videoHls?['VideoCodec'], 'h264')}'
        '&audioCodec=${names(videoHls?['AudioCodec'], 'aac')})',
    'add-transcode-target(type=musicProfile&context=streaming&protocol=hls'
        '&container=mpegts'
        '&audioCodec=${names(hls('Audio')?['AudioCodec'], 'aac')})',
  ].join('+');
}

class PlexPlaybackApi implements PlaybackApi {
  final Dio _dio;
  final Map<String, String> _identity;

  PlexPlaybackApi(this._dio, this._identity);

  static final _random = Random.secure();

  /// Answers in Jellyfin's PlaybackInfo shape from Plex's own transcode
  /// decision, with the original file as Path for direct play.
  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final request = requestBody ?? const <String, dynamic>{};
    final container = await plexContainer(_dio, '/library/metadata/$itemId');
    final item = _first(container['Metadata']);
    final medias = (item?['Media'] as List? ?? const [])
        .whereType<Map<String, dynamic>>()
        .toList();
    if (item == null || medias.isEmpty) {
      throw StateError('Plex item $itemId has no media');
    }
    final mediaIndex = max(
      0,
      medias.indexWhere((m) => '${m['id']}' == request['MediaSourceId']),
    );
    final media = medias[mediaIndex];
    final part = _first(media['Part'])!;
    // Closed captions stay out here too, as they do in the item's streams.
    final streams = (part['Stream'] as List? ?? const [])
        .whereType<Map<String, dynamic>>()
        .where((s) => s['embeddedInVideo'] == null)
        .toList();

    // The app picks tracks by the Index the mapper gave them, while Plex
    // selects them by its own stream ids.
    Map<String, dynamic>? byIndex(Object? index) =>
        streams.where((s) => (s['index'] ?? s['id']) == index).firstOrNull;
    Map<String, dynamic>? selected(int streamType) => streams
        .where((s) => s['streamType'] == streamType && s['selected'] == true)
        .firstOrNull;
    final audioIndex = request['AudioStreamIndex'] as int?;
    final subtitleIndex = request['SubtitleStreamIndex'] as int?;
    if (audioIndex != null || subtitleIndex != null) {
      await _dio.put<dynamic>(
        '/library/parts/${part['id']}',
        queryParameters: {
          if (byIndex(audioIndex) case final audio?)
            'audioStreamID': audio['id'],
          if (subtitleIndex != null)
            'subtitleStreamID': byIndex(subtitleIndex)?['id'] ?? 0,
          'allParts': 1,
        },
      );
    }
    final audio = byIndex(audioIndex) ?? selected(2);
    final subtitle = subtitleIndex == null
        ? selected(3)
        : (subtitleIndex < 0 ? null : byIndex(subtitleIndex));
    final shownSubtitle = subtitle == null
        ? -1
        : subtitle['index'] ?? subtitle['id'];

    final session = [
      for (var i = 0; i < 16; i++)
        _random.nextInt(256).toRadixString(16).padLeft(2, '0'),
    ].join();
    // Burning an embedded subtitle in rules out a direct play, so only the
    // transcode asks for it. Plex can't decode a track it lists as codec none
    // (WebVTT), and burning one kills its transcoder, so a transcode leaves
    // it out. A sidecar file reaches the player on its own.
    final burnSubtitle =
        subtitle != null &&
        subtitle['key'] == null &&
        subtitle['codec'] != 'none';
    final directStream = request['EnableDirectStream'] == false ? '0' : '1';
    final params = {
      ..._identity,
      'path': '/library/metadata/$itemId',
      'mediaIndex': '$mediaIndex',
      'partIndex': '0',
      'protocol': 'hls',
      'fastSeek': '1',
      'directPlay': request['EnableDirectPlay'] == false ? '0' : '1',
      'directStream': directStream,
      'directStreamAudio': directStream,
      if (request['MaxStreamingBitrate'] case final int bitrate)
        'maxVideoBitrate': '${bitrate ~/ 1000}',
      'subtitles': 'none',
      'X-Plex-Platform': 'Generic',
      'X-Plex-Client-Profile-Extra': plexClientProfile(
        request['DeviceProfile'] as Map<String, dynamic>?,
      ),
    };
    // Plex turns down an HLS start for a track on the video transcoder.
    final transcoder = item['type'] == 'track'
        ? '/music/:/transcode/universal'
        : '/video/:/transcode/universal';
    Future<bool> decide(Map<String, String> query) async {
      final decision = await plexContainer(_dio, '$transcoder/decision', query);
      final decided = _first(
        _first(_first(decision['Metadata'])?['Media'])?['Part'],
      )?['decision'];
      if (decided != 'directplay' && decided != 'transcode') {
        throw StateError(
          decision['generalDecisionText'] as String? ??
              "Plex can't play item $itemId",
        );
      }
      return decided == 'directplay';
    }

    // The first decision goes without a session or a burn, because Plex keeps
    // a session's first answer and a burn would rule out direct play.
    final directPlay = await decide(params);
    final start = {
      ...params,
      'directPlay': '0',
      if (burnSubtitle) 'subtitles': 'burn',
      'session': session,
      'X-Plex-Session-Identifier': session,
    };
    // Plex can refuse a start whose session has no decision of its own.
    if (!directPlay) await decide(start);

    final source = (plexItemToJellyfin(item)['MediaSources'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((s) => s['Id'] == '${media['id']}');
    return {
      'PlaySessionId': session,
      'MediaSources': [
        {
          ...source,
          'Path': part['key'],
          'SupportsDirectPlay': directPlay,
          'SupportsTranscoding': !directPlay,
          if (!directPlay)
            'TranscodingUrl': Uri(
              path: '$transcoder/start.m3u8',
              queryParameters: start,
            ).toString(),
          'DefaultAudioStreamIndex': audio?['index'] ?? audio?['id'],
          'DefaultSubtitleStreamIndex': shownSubtitle,
          if (!directPlay && burnSubtitle)
            'MediaStreams': [
              for (final stream in source['MediaStreams'] as List)
                stream['Type'] == 'Subtitle' && stream['Index'] == shownSubtitle
                    ? {
                        ...stream as Map<String, dynamic>,
                        'DeliveryMethod': 'Encode',
                      }
                    : stream,
            ],
        },
      ],
    };
  }

  static Map<String, dynamic>? _first(Object? list) =>
      list is List && list.isNotEmpty && list.first is Map<String, dynamic>
      ? list.first as Map<String, dynamic>
      : null;

  /// Plex keeps resume points and watched state through its timeline, which
  /// ignores a report that has no runtime.
  Future<void> _timeline(Map<String, dynamic> info, String state) =>
      _dio.get<dynamic>(
        '/:/timeline',
        queryParameters: {
          'ratingKey': info['ItemId'],
          'key': '/library/metadata/${info['ItemId']}',
          'state': state,
          'time': (info['PositionTicks'] as int? ?? 0) ~/ 10000,
          if (info['RunTimeTicks'] case final int runTime)
            'duration': runTime ~/ 10000,
          if (info['PlaySessionId'] case final String session)
            'X-Plex-Session-Identifier': session,
        },
      );

  @override
  Future<void> reportPlaybackStart(Map<String, dynamic> info) =>
      _timeline(info, 'playing');

  @override
  Future<void> reportPlaybackProgress(Map<String, dynamic> info) =>
      _timeline(info, info['IsPaused'] == true ? 'paused' : 'playing');

  @override
  Future<void> reportPlaybackStopped(Map<String, dynamic> info) =>
      _timeline(info, 'stopped');

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopActiveEncodings({
    required String deviceId,
    String? playSessionId,
  }) async {
    if (playSessionId == null) return;
    // This ends a track's transcode too.
    await _dio.get<dynamic>(
      '/video/:/transcode/universal/stop',
      queryParameters: {'session': playSessionId},
    );
  }

  @override
  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  }) => throw UnsupportedError(
    'Plex stream URLs come from getPlaybackInfo, which picks the file part',
  );
}
