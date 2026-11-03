import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_languages.dart';

/// Searching the subtitle providers the server's administrator set up for
/// one file (`POST /subtitles/search`) and saving a result to the server
/// (`POST /subtitles/download`). With no provider set up, a search finds
/// nothing.
///
/// Moonfin passes a download only the result's id, while Silo wants the
/// whole result back, so the id Moonfin gets carries it.
class SiloRemoteSubtitles {
  SiloRemoteSubtitles(this._dio);

  final Dio _dio;

  /// The results for file [fileId] in [language], as Jellyfin's
  /// `RemoteSubtitleInfo`.
  Future<List<Map<String, dynamic>>> search(
    String fileId,
    String language,
  ) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/subtitles/search',
      data: {
        'media_file_id': fileId,
        'languages': [siloLanguageCode(language)],
      },
    );
    final results = asJsonMap(response.data)?['results'] as List? ?? const [];
    return [
      for (final raw in results)
        if (asJsonMap(raw) case final result? when result['id'] is String)
          {
            'Id': _idOf(fileId, result),
            'Name': ?result['release_name'],
            'ProviderName': ?result['provider'],
            'Format': ?result['format'],
            'Language': ?result['language'],
            'HearingImpaired': result['hearing_impaired'] == true,
            'DownloadCount': ?result['downloads'],
          },
    ];
  }

  /// Saves the result [id] stands for. Silo marks this `non_retryable`, so
  /// it's sent once.
  Future<void> download(String id) async {
    final Object? result;
    try {
      result = jsonDecode(utf8.decode(base64Url.decode(id)));
    } on FormatException {
      throw ArgumentError.value(id, 'id', 'Not a Silo subtitle result');
    }
    await _dio.post<dynamic>('/api/v2/subtitles/download', data: result);
  }

  static String _idOf(String fileId, Map<String, dynamic> result) =>
      base64Url.encode(
        utf8.encode(
          jsonEncode({
            'media_file_id': fileId,
            'subtitle_id': result['id'],
            'provider': result['provider'],
            'language': result['language'],
            'release_name': result['release_name'],
            'score': result['score'],
            'hearing_impaired': result['hearing_impaired'] == true,
          }),
        ),
      );
}
