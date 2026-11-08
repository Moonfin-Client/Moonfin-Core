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
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async {
    // By id rather than /Users/Me: the server lets this one through outside the
    // schedule and turns the other away.
    final response = await _dio.get('/Users/$userId');
    final user = ServerUser.fromJson(response.data as Map<String, dynamic>);
    return user.policy?.accessSchedules;
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
    try {
      await _dio.post('/Users/Configuration', data: config.toJson());
    } on DioException catch (e) {
      final status = e.response?.statusCode ?? 0;
      // Jellyfin's 400 doesn't say which field it couldn't read, so log the
      // ids it was sent.
      if (status >= 400 && status < 500) {
        ServerLog.network(
          'User configuration rejected with $status. '
          'OrderedViews: ${config.orderedViews}, '
          'MyMediaExcludes: ${config.myMediaExcludes}, '
          'LatestItemsExcludes: ${config.latestItemsExcludes}, '
          'GroupedFolders: ${config.groupedFolders}',
          level: ServerLogLevel.error,
        );
      }
      rethrow;
    }
  }
}
