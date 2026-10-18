import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinUsersApi implements UsersApi {
  final Dio _dio;

  JellyfinUsersApi(this._dio);

  @override
  Future<ServerUser> getCurrentUser() async {
    final response = await _dio.get('/Users/Me');
    return ServerUser.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ServerUser> getUser(String userId) async {
    final response = await _dio.get('/Users/$userId');
    return ServerUser.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final response = await _dio.get('/Users/Me');
    final data = response.data as Map<String, dynamic>;
    final config = data['Configuration'] as Map<String, dynamic>? ?? const {};
    return UserConfiguration.fromJson(config);
  }

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    await _dio.post('/Users/Configuration', data: config.toJson());
  }
}
