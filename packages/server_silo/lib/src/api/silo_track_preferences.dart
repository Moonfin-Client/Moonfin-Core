import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_media_source_mapper.dart';
import '../mappers/silo_subtitle_order.dart';

/// A series' remembered audio and subtitle choice on Silo.
///
/// Silo keeps, per profile and series:
///
/// - **Audio:** `GET/PUT /audio-prefs/{series}`: the chosen track's index
///   (Silo's audio ordinal), language and signature. Silo also writes this
///   row itself whenever a session starts or replans with an audio track,
///   and uses it when a start names none.
/// - **Subtitles:** `GET/PUT /subtitle-prefs/{series}`: the chosen track
///   (Silo's combined subtitle index, or -1 for off), language, mode and
///   signature, plus the settings `playback.subtitle_language` and
///   `playback.subtitle_mode` at `profile_series` scope, which Silo's web
///   player writes alongside and which outrank the row's language and mode.
///   Moonfin writes both, as the web player does.
///
/// Track indices are Silo's, so a write needs the playing file's track map:
/// the resolver hands it over with the playing file
/// ([SiloItemsApi.notePlayingFile]). A track Silo doesn't number (a
/// downloaded subtitle) isn't written.
class SiloTrackPreferences {
  SiloTrackPreferences(this._dio, this._playingSource);

  final Dio _dio;

  /// The mapped media source [itemId] plays, when the resolver noted one.
  final Map<String, dynamic>? Function(String itemId) _playingSource;

  static const subtitleLanguageKey = 'playback.subtitle_language';
  static const subtitleModeKey = 'playback.subtitle_mode';

  String _audioPath(String seriesId) =>
      '/api/v2/audio-prefs/${Uri.encodeComponent(seriesId)}';
  String _subtitlePath(String seriesId) =>
      '/api/v2/subtitle-prefs/${Uri.encodeComponent(seriesId)}';

  Future<Map<String, dynamic>?> _getOrNull(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: query,
        options: Options(listFormat: ListFormat.multi),
      );
      return asJsonMap(response.data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<SeriesTrackChoice?> audioChoice(String seriesId) async {
    final row = await _getOrNull(_audioPath(seriesId));
    if (row == null) return null;
    final index = row['audio_track_index'];
    if (index is! int || index < 0) return null;
    final signature = asJsonMap(row['track_signature']);
    final language =
        jsonText(row['audio_language']) ??
        jsonText(signature?['language']) ??
        '';
    // As Moonfin names a track: its own title, else the shown one.
    final title =
        jsonText(signature?['embedded_title']) ??
        jsonText(signature?['title']) ??
        '';
    if (language.isEmpty && title.isEmpty) return null;
    return SeriesTrackChoice(language: language, title: title);
  }

  Future<SeriesTrackChoice?> subtitleChoice(String seriesId) async {
    final (row, settings) = await (
      _getOrNull(_subtitlePath(seriesId)),
      _seriesSettings(seriesId),
    ).wait;
    final signature = asJsonMap(row?['track_signature']);
    final mode = settings.containsKey(subtitleModeKey)
        ? settings[subtitleModeKey]
        : jsonText(row?['subtitle_mode']);
    final index = row?['subtitle_track_index'];
    if (mode == 'off' || (row != null && index == -1)) {
      return const SeriesTrackChoice(off: true);
    }
    final language = settings.containsKey(subtitleLanguageKey)
        ? jsonText(settings[subtitleLanguageKey]) ?? ''
        : jsonText(row?['subtitle_language']) ??
              jsonText(signature?['language']) ??
              '';
    final labelLanguage = jsonText(signature?['language']);
    // The label belongs to the row's track, and a newer language from the
    // settings may name another one.
    final title = labelLanguage == null || labelLanguage == language
        ? jsonText(signature?['label']) ?? ''
        : '';
    if (language.isEmpty && title.isEmpty) return null;
    return SeriesTrackChoice(language: language, title: title);
  }

  /// The subtitle settings stored for [seriesId] itself (scope
  /// `profile_series`), by key. A value from another scope isn't a choice
  /// for this series.
  Future<Map<String, Object?>> _seriesSettings(String seriesId) async {
    final json = await _getOrNull(
      '/api/v2/settings/values/effective',
      query: {
        'keys': [subtitleLanguageKey, subtitleModeKey],
        'series_ids': [seriesId],
      },
    );
    return {
      for (final raw in (json?['items'] as List?) ?? const [])
        if (asJsonMap(raw) case final item?
            when (item['scope'] ?? item['source']) == 'profile_series' &&
                item['key'] is String)
          item['key'] as String: item['value'],
    };
  }

  Future<void> setAudio(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  }) async {
    final source = _playingSource(itemId);
    if (source == null) return;
    final track = siloTrackForStreamIndex(source, streamIndex);
    final stream = _stream(source, streamIndex);
    if (track == null || track.kind != SiloTrackKind.audio || stream == null) {
      return;
    }
    final language = jsonText(stream['Language']) ?? '';
    await _dio.put<dynamic>(
      _audioPath(seriesId),
      data: {
        'audio_language': language,
        'audio_track_index': track.ordinal,
        'track_signature': {
          if (language.isNotEmpty) 'language': language,
          'codec': ?jsonText(stream['Codec']),
          if (stream['Channels'] case final int channels) 'channels': channels,
          'layout': ?jsonText(stream['ChannelLayout']),
          'title': ?jsonText(stream['DisplayTitle']),
          'embedded_title': ?jsonText(stream['Title']),
          'default': stream['IsDefault'] == true,
        },
      },
    );
  }

  Future<void> setSubtitle(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  }) async {
    if (streamIndex < 0) {
      await (
        _dio.put<dynamic>(
          _subtitlePath(seriesId),
          data: {
            'subtitle_track_index': -1,
            'subtitle_language': '',
            'subtitle_mode': 'off',
          },
        ),
        _putSetting(seriesId, subtitleLanguageKey, null),
        _putSetting(seriesId, subtitleModeKey, 'off'),
      ).wait;
      return;
    }
    final source = _playingSource(itemId);
    if (source == null) return;
    final combined = siloSubtitleCombinedIndex(source, streamIndex);
    final stream = _stream(source, streamIndex);
    if (combined == null || stream == null) return;
    final language = jsonText(stream['Language']) ?? '';
    await (
      _dio.put<dynamic>(
        _subtitlePath(seriesId),
        data: {
          'subtitle_track_index': combined,
          'subtitle_language': language,
          'subtitle_mode': 'always',
          'track_signature': {
            'source': stream['IsExternal'] == true ? 'external' : 'embedded',
            if (language.isNotEmpty) 'language': language,
            'codec': ?jsonText(stream['Codec']),
            'label':
                ?(jsonText(stream['DisplayTitle']) ??
                jsonText(stream['Title'])),
            'forced': stream['IsForced'] == true,
            'hearing_impaired': stream['IsHearingImpaired'] == true,
          },
        },
      ),
      _putSetting(
        seriesId,
        subtitleLanguageKey,
        language.isEmpty ? null : language,
      ),
      _putSetting(seriesId, subtitleModeKey, 'always'),
    ).wait;
  }

  Future<void> _putSetting(String seriesId, String key, Object? value) =>
      _dio.put<dynamic>(
        '/api/v2/settings/values/${Uri.encodeComponent(key)}',
        queryParameters: {'scope': 'profile_series', 'series_id': seriesId},
        data: {'value': value},
      );

  static Map<String, dynamic>? _stream(Map<String, dynamic> source, int index) {
    for (final s in (source['MediaStreams'] as List?) ?? const []) {
      if (s is Map && s['Index'] == index) return s.cast<String, dynamic>();
    }
    return null;
  }
}
