import 'dart:convert';

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
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async =>
      const [];

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

  /// Emby lets a user change their own picture unless their policy turns
  /// off preference access (admins always can).
  @override
  Future<UserImageUpload?> userImageUpload(String userId) async {
    final response = await _dio.get('/Users/$userId');
    final policy = asJsonMap(asJsonMap(response.data)?['Policy']) ?? const {};
    final allowed =
        policy['IsAdministrator'] == true ||
        policy['EnableUserPreferenceAccess'] != false;
    return allowed ? UserImageUpload.jellyfinAndEmby : null;
  }

  /// The body is the file in base64, as Emby reads it.
  @override
  Future<void> uploadUserImage(
    String userId, {
    required List<int> bytes,
    required String contentType,
  }) async {
    await _dio.post(
      '/Users/$userId/Images/Primary',
      data: base64Encode(bytes),
      options: Options(contentType: contentType),
    );
  }

  @override
  Future<void> deleteUserImage(String userId) async {
    await _dio.delete('/Users/$userId/Images/Primary');
  }
}
