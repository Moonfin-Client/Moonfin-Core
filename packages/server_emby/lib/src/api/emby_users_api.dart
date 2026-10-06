import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyUsersApi implements UsersApi {
  final Dio _dio;
  final String Function() _getUserId;

  /// Called after a configuration write, so anything cached from the old
  /// configuration can be dropped.
  final void Function()? _onConfigurationUpdated;

  EmbyUsersApi(
    this._dio,
    this._getUserId, {
    void Function()? onConfigurationUpdated,
  }) : _onConfigurationUpdated = onConfigurationUpdated;

  @override
  Future<ServerUser> getCurrentUser() async {
    final userId = _getUserId();
    final response = await _dio.get('/Users/$userId');
    return ServerUser.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final userId = _getUserId();
    final response = await _dio.get('/Users/$userId');
    final data = response.data as Map<String, dynamic>;
    final config = data['Configuration'] as Map<String, dynamic>? ?? const {};
    return UserConfiguration.fromJson(config);
  }

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    final userId = _getUserId();
    await _dio.post('/Users/$userId/Configuration', data: config.toJson());
    _onConfigurationUpdated?.call();
  }
}
