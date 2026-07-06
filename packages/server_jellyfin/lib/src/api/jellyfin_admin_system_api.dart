import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinAdminSystemApi implements AdminSystemApi {
  final Dio _dio;

  JellyfinAdminSystemApi(this._dio);

  @override
  Future<Map<String, dynamic>> getServerConfiguration() async {
    final response = await _dio.get('/System/Configuration');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> updateServerConfiguration(Map<String, dynamic> config) async {
    await _dio.post('/System/Configuration', data: config);
  }

  @override
  Future<Map<String, dynamic>> getNamedConfiguration(String key) async {
    final response = await _dio.get('/System/Configuration/$key');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> updateNamedConfiguration(
    String key,
    Map<String, dynamic> config,
  ) async {
    await _dio.post('/System/Configuration/$key', data: config);
  }

  @override
  Future<StorageInfo> getStorageInfo() async {
    final response = await _dio.get('/System/Info/Storage');
    return StorageInfo.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> restartServer() async {
    await _dio.post('/System/Restart');
  }

  @override
  Future<void> shutdownServer() async {
    await _dio.post('/System/Shutdown');
  }

  @override
  Future<List<LogFileInfo>> getLogFiles() async {
    final response = await _dio.get('/System/Logs');
    return (response.data as List<dynamic>)
        .map((e) => LogFileInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<String> getLogFileContent(String name) async {
    final response = await _dio.get(
      '/System/Logs/Log',
      queryParameters: {'name': name},
    );
    return response.data as String;
  }

  @override
  Future<ActivityLogResult> getActivityLog({
    int? startIndex,
    int? limit,
    bool? hasUserId,
    DateTime? minDate,
  }) async {
    final params = <String, dynamic>{};
    if (startIndex != null) params['startIndex'] = startIndex;
    if (limit != null) params['limit'] = limit;
    if (hasUserId != null) params['hasUserId'] = hasUserId;
    if (minDate != null) params['minDate'] = minDate.toUtc().toIso8601String();
    final response = await _dio.get(
      '/System/ActivityLog/Entries',
      queryParameters: params,
    );
    return ActivityLogResult.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<Map<String, dynamic>>> _getLocalizationList(String path) async {
    final response = await _dio.get(path);
    return (response.data as List<dynamic>)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getCultures() =>
      _getLocalizationList('/Localization/Cultures');

  @override
  Future<List<Map<String, dynamic>>> getCountries() =>
      _getLocalizationList('/Localization/Countries');

  @override
  Future<List<Map<String, dynamic>>> getParentalRatings() =>
      _getLocalizationList('/Localization/ParentalRatings');

  @override
  Future<List<Map<String, dynamic>>> getAuthProviders() =>
      _getLocalizationList('/Auth/Providers');

  @override
  Future<List<Map<String, dynamic>>> getPasswordResetProviders() =>
      _getLocalizationList('/Auth/PasswordResetProviders');

  @override
  Future<void> uploadSplashscreen(List<int> bytes, String contentType) async {
    await _dio.post(
      '/Branding/Splashscreen',
      data: base64Encode(bytes),
      options: Options(contentType: contentType),
    );
  }

  @override
  Future<void> deleteSplashscreen() async {
    await _dio.delete('/Branding/Splashscreen');
  }

  @override
  Future<Map<String, dynamic>> getItemCounts() async {
    final response = await _dio.get('/Items/Counts');
    return response.data as Map<String, dynamic>;
  }
}
