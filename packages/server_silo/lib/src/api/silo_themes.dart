import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_ticks.dart';
import '../silo_image_registry.dart' show resolveSiloUrl;
import '../silo_kept_reads.dart';

/// Silo's theme music.
///
/// - **What a title has.** An item's detail lists its local theme songs
///   (`themes`: `owner_id` and `items` of `ThemeSong`: `id`, `title`,
///   `container`, `duration_seconds`). [themeMedia] answers them as
///   Jellyfin's `getThemeMedia` result (`ThemeSongsResult`).
/// - **Whether Silo serves them.** `GET /catalog/themes/capabilities`
///   (kept [capabilitiesTtl]): with `state` other than `available`, or not
///   `allowed`, a title has none.
/// - **Playing one.** A song is played through a short-lived grant
///   (`POST /catalog/items/{owner}/themes/{id}/playback`, lasting
///   `grant_lifetime_seconds`, 300 on this server) whose `url` carries its
///   own credential, relative to the server or on a proxy node. The request
///   names the formats the player decodes, and Silo picks the original when
///   one matches, else AAC in MP4 when the player accepts that. [streamUrl]
///   asks for a new grant on every play.
class SiloThemes {
  SiloThemes(
    this._dio, {
    required Future<Map<String, dynamic>> Function(String itemId) detail,
    DateTime Function()? clock,
  }) : _detail = detail,
       _available = SiloKeptReads(
        lifetime: capabilitiesTtl,
        keep: (available) => available,
        clock: clock,
      );

  final Dio _dio;

  /// A title's detail, shared with the page that shows it.
  final Future<Map<String, dynamic>> Function(String itemId) _detail;

  static const capabilitiesTtl = Duration(minutes: 10);

  final SiloKeptReads<String, bool> _available;

  /// Whether Silo serves theme music to this login. A yes is kept, and a no
  /// or a failed read is asked again next time.
  Future<bool> available() => _available.get('capabilities', _readAvailable);

  Future<bool> _readAvailable() async {
    try {
      final response = await _dio.get<dynamic>(
        '/api/v2/catalog/themes/capabilities',
      );
      final json = asJsonMap(response.data);
      return json?['state'] == 'available' && json?['allowed'] != false;
    } on DioException {
      return false;
    }
  }

  /// [itemId]'s theme songs as Jellyfin's `getThemeMedia` answer. Silo has
  /// no theme videos or soundtracks, so those lists are empty.
  Future<Map<String, dynamic>> themeMedia(String itemId) async {
    if (!await available()) return _empty(itemId);
    final themes = asJsonMap((await _detail(itemId))['themes']);
    final owner = themes?['owner_id'] is String
        ? themes!['owner_id'] as String
        : itemId;
    final songs = <Map<String, dynamic>>[
      for (final raw in (themes?['items'] as List?) ?? const [])
        if (asJsonMap(raw) case final song? when song['id'] != null)
          {
            'Id': '${song['id']}',
            'Name': song['title'] is String ? song['title'] : 'Theme',
            'Type': 'Audio',
            'MediaType': 'Audio',
            if (song['container'] is String) 'Container': song['container'],
            if (song['duration_seconds'] case final num d when d > 0)
              'RunTimeTicks': secondsToTicks(d),
            'ParentId': owner,
          },
    ];
    return {
      'ThemeSongsResult': {
        'OwnerId': owner,
        'Items': songs,
        'TotalRecordCount': songs.length,
      },
      'ThemeVideosResult': _list(owner),
      'SoundtrackSongsResult': _list(owner),
    };
  }

  /// A fresh grant's URL for song [songId] of [ownerId], absolute, or null
  /// when Silo can't serve it in any of [accepts].
  Future<String?> streamUrl(
    String ownerId,
    String songId,
    List<ThemeAudioFormat> accepts, {
    required String baseUrl,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        '/api/v2/catalog/items/${Uri.encodeComponent(ownerId)}'
        '/themes/${Uri.encodeComponent(songId)}/playback',
        data: {
          if (accepts.isNotEmpty)
            'accepted_formats': [
              for (final f in accepts)
                {'container': f.container, 'audio_codec': ?f.codec},
            ],
        },
      );
      final url = asJsonMap(response.data)?['url'];
      return resolveSiloUrl(url is String ? url : null, baseUrl);
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      // Gone, not acceptable, or no route: nothing to play.
      if (status == 404 || status == 406 || status == 503) return null;
      rethrow;
    }
  }

  static Map<String, dynamic> _list(String owner) => {
    'OwnerId': owner,
    'Items': const <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
  };

  static Map<String, dynamic> _empty(String owner) => {
    'ThemeSongsResult': _list(owner),
    'ThemeVideosResult': _list(owner),
    'SoundtrackSongsResult': _list(owner),
  };
}
