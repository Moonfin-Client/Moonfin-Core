import 'package:dio/dio.dart';

import '../api/user_library_api.dart';
import '../server_dialect.dart';

class ServerUserLibraryApi implements UserLibraryApi {
  final Dio _dio;
  final ServerDialect _dialect;
  final String Function() _getUserId;

  ServerUserLibraryApi(this._dio, this._dialect, this._getUserId);

  @override
  Future<void> markFavorite(String itemId) async {
    await _dio.post(_dialect.favoriteItemPath(_getUserId(), itemId));
  }

  @override
  Future<void> unmarkFavorite(String itemId) async {
    await _dio.delete(_dialect.favoriteItemPath(_getUserId(), itemId));
  }

  @override
  Future<void> markPlayed(String itemId) async {
    await _dio.post(_dialect.playedItemPath(_getUserId(), itemId));
  }

  @override
  Future<void> unmarkPlayed(String itemId) async {
    await _dio.delete(_dialect.playedItemPath(_getUserId(), itemId));
  }

  @override
  Future<void> updateUserRating(String itemId, {required bool likes}) async {
    await _dio.post(
      _dialect.ratingPath(_getUserId(), itemId),
      queryParameters: {'Likes': likes},
    );
  }

  @override
  Future<void> deleteUserRating(String itemId) async {
    await _dio.delete(_dialect.ratingPath(_getUserId(), itemId));
  }

  @override
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final response = await _dio.get(
      _dialect.libraryItemPath(_getUserId(), itemId),
      queryParameters: {'Fields': ?_dialect.defaultItemFields},
    );
    return response.data as Map<String, dynamic>;
  }
}
