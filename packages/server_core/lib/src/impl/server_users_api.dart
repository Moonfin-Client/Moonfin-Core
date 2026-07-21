import 'package:dio/dio.dart';

import '../api/users_api.dart';
import '../models/server_models.dart';
import '../models/system_models.dart';
import '../server_dialect.dart';

class ServerUsersApi implements UsersApi {
  final Dio _dio;
  final ServerDialect _dialect;
  final String Function() _getUserId;

  ServerUsersApi(this._dio, this._dialect, this._getUserId);

  @override
  Future<ServerUser> getCurrentUser() async {
    final response = await _dio.get(_dialect.currentUserPath(_getUserId()));
    return ServerUser.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final response = await _dio.get(_dialect.currentUserPath(_getUserId()));
    final data = response.data as Map<String, dynamic>;
    final config = data['Configuration'] as Map<String, dynamic>? ?? const {};
    return UserConfiguration.fromJson(config);
  }

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    await _dio.post(
      _dialect.userConfigPath(_getUserId()),
      data: config.toJson(),
    );
  }
}
