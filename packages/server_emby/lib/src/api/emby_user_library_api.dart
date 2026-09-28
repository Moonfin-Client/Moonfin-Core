import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyUserLibraryApi implements UserLibraryApi {
  final Dio _dio;
  final String Function() _getUserId;

  EmbyUserLibraryApi(this._dio, this._getUserId);

  @override
  bool get supportsNumericUserRatings => true;

  @override
  Future<void> markFavorite(String itemId) async {
    final userId = _getUserId();
    await _dio.post('/Users/$userId/FavoriteItems/$itemId');
  }

  @override
  Future<void> unmarkFavorite(String itemId) async {
    final userId = _getUserId();
    await _dio.delete('/Users/$userId/FavoriteItems/$itemId');
  }

  @override
  Future<void> markPlayed(String itemId, {DateTime? datePlayed}) async {
    final userId = _getUserId();
    await _dio.post(
      '/Users/$userId/PlayedItems/$itemId',
      queryParameters: {'DatePlayed': ?_embyDate(datePlayed)},
    );
  }

  // Emby parses DatePlayed as UTC yyyyMMddHHmmss.
  static String? _embyDate(DateTime? value) {
    if (value == null) return null;
    final utc = value.toUtc();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${utc.year.toString().padLeft(4, '0')}${two(utc.month)}'
        '${two(utc.day)}${two(utc.hour)}${two(utc.minute)}${two(utc.second)}';
  }

  @override
  Future<void> unmarkPlayed(String itemId) async {
    final userId = _getUserId();
    await _dio.delete('/Users/$userId/PlayedItems/$itemId');
  }

  // Emby's own rating routes answer 200 and store nothing, and it leaves the
  // rating out of the item it hands back, so a rating written through them is
  // lost. These go through Moonbase, which writes the user data store the
  // server keeps underneath those routes. A server without Moonbase has no
  // such route, and there is nowhere to keep a rating anyway, so a 404 is not
  // worth failing the gesture over.
  Future<void> _rate(Future<dynamic> Function() send) async {
    try {
      await send();
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
    }
  }

  @override
  Future<void> updateUserRating(String itemId, {required bool likes}) {
    return _rate(
      () => _dio.post(
        '/Moonfin/UserRatings/$itemId',
        queryParameters: {'Likes': likes},
      ),
    );
  }

  @override
  Future<void> updateNumericUserRating(
    String itemId, {
    required double rating,
  }) {
    return _rate(
      () => _dio.post(
        '/Moonfin/UserRatings/$itemId',
        queryParameters: {'Rating': rating},
      ),
    );
  }

  @override
  Future<void> deleteUserRating(String itemId) {
    return _rate(() => _dio.delete('/Moonfin/UserRatings/$itemId'));
  }

  @override
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final userId = _getUserId();
    final response = await _dio.get('/Users/$userId/Items/$itemId');
    return response.data as Map<String, dynamic>;
  }
}
