import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../util/subtitle_track_logic.dart';
import 'subtitle_cues.dart';
import 'subtitle_file.dart';

/// Fetches the lines of the subtitle track that's playing, for the subtitle
/// delay's timeline. Image tracks and anything that can't be read have none.
abstract final class SubtitleCueLoader {
  static final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.plain,
    ),
  );

  // The last track's lines, so opening the delay again shows them at once.
  static String? _loadedKey;
  static List<SubtitleCue>? _loadedCues;

  /// The lines of track [streamIndex] of what [manager] is playing. Null at
  /// once for a track that can't have any, and null later when they can't be
  /// read.
  static Future<List<SubtitleCue>?>? load(
    PlaybackManager manager,
    int? streamIndex, {
    MediaServerClient? client,
    String? itemId,
  }) {
    final resolution = manager.currentResolution;
    if (resolution == null || streamIndex == null || streamIndex < 0) {
      return null;
    }
    final stream = resolution.mediaStreams.where(
      (s) => s['Type'] == 'Subtitle' && s['Index'] == streamIndex,
    ).firstOrNull;
    if (stream == null || !isTextSubtitleStream(stream)) return null;

    final key = '${client?.baseUrl}|${resolution.mediaSourceId}|$streamIndex';
    final known = _loadedCues;
    if (key == _loadedKey && known != null) return SynchronousFuture(known);

    final file = [
      ...resolution.externalSubtitles,
      ...resolution.embeddedTextSubtitles,
    ].where((s) => s.streamIndex == streamIndex).firstOrNull;
    return () async {
      try {
        final cues = await _fetch(resolution, file, client, itemId, streamIndex);
        if (cues == null || cues.isEmpty) return null;
        cues.sort((a, b) => a.start.compareTo(b.start));
        _loadedKey = key;
        return _loadedCues = cues;
      } catch (_) {
        return null;
      }
    }();
  }

  static Future<List<SubtitleCue>?> _fetch(
    StreamResolutionResult resolution,
    ExternalSubtitle? file,
    MediaServerClient? client,
    String? itemId,
    int streamIndex,
  ) async {
    if (resolution.isLocalMedia) {
      final text = file == null ? null : await readSubtitleFile(file.deliveryUrl);
      return text == null ? null : parseSubtitleText(text);
    }

    // Jellyfin and Emby turn any text track into JSON, embedded ones and ASS
    // included, which a sidecar URL can't offer.
    final type = client?.serverType;
    if (client != null &&
        itemId != null &&
        (type == ServerType.jellyfin || type == ServerType.emby)) {
      final token = client.accessToken;
      final response = await _dio.get<String>(
        '${client.baseUrl}/Videos/${Uri.encodeComponent(itemId)}/'
        '${Uri.encodeComponent(resolution.mediaSourceId)}/Subtitles/$streamIndex/Stream.js',
        options: Options(headers: {
          'Authorization': buildServerAuthorizationHeader(
            scheme: type == ServerType.emby ? 'Emby' : 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: token,
          ),
          if (token != null && token.isNotEmpty) 'X-Emby-Token': token,
        }),
      );
      return cuesFromTrackEvents(jsonDecode(response.data ?? ''));
    }

    // Plex and Silo hand out a sidecar file as it is.
    if (file == null) return null;
    final response = await _dio.get<String>(
      file.deliveryUrl,
      options: Options(headers: resolution.requestHeaders),
    );
    return parseSubtitleText(response.data ?? '');
  }
}
