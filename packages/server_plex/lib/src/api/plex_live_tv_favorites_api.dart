import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// The Plex Cloud favorite-channel endpoint. This API uses a Plex *account*
/// token supplied by its caller, which may differ from a PMS access token.
///
/// A PUT replaces the full account list, including channels on other servers.
class PlexLiveTvFavoritesApi {
  static const _url = 'https://epg.provider.plex.tv/settings/favoriteChannels';

  final Dio _dio;

  PlexLiveTvFavoritesApi({Dio? dio})
    : _dio = dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 8),
              receiveTimeout: const Duration(seconds: 15),
            ),
          );

  static Map<String, String> _headers(
    DeviceInfo deviceInfo,
    String accountToken,
  ) => {
    'X-Plex-Token': accountToken,
    'X-Plex-Client-Identifier': deviceInfo.id,
    'X-Plex-Product': deviceInfo.appName,
    'X-Plex-Provider-Version': '5.1',
    'Accept': 'application/json',
  };

  Future<List<Map<String, dynamic>>> readFavorites({
    required DeviceInfo deviceInfo,
    required String accountToken,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url,
      options: Options(headers: _headers(deviceInfo, accountToken)),
    );
    final container = response.data?['MediaContainer'];
    if (container is! Map) {
      throw const FormatException('Invalid Plex favorite-channel response');
    }
    final raw = container['FavoriteChannel'];
    final size = container['size'];
    if (raw == null && (size == 0 || size == '0')) return [];
    bool hasValue(dynamic value) => value is String && value.trim().isNotEmpty;
    if (raw is! List ||
        (size != null && int.tryParse('$size') != raw.length) ||
        raw.any((row) => row is! Map || !hasValue(row['source']) || !hasValue(row['id']))) {
      throw const FormatException('Invalid Plex favorite-channel list');
    }
    return [for (final row in raw) Map<String, dynamic>.from(row as Map)];
  }

  Future<void> writeFavorites({
    required DeviceInfo deviceInfo,
    required String accountToken,
    required List<Map<String, dynamic>> rows,
  }) async {
    await _dio.put<void>(
      _url,
      data: rows,
      options: Options(
        headers: {
          ..._headers(deviceInfo, accountToken),
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
