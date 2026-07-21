import 'package:dio/dio.dart';

import '../api/auth_api.dart';
import '../server_dialect.dart';

class ServerAuthApi implements AuthApi {
  final Dio _dio;
  final ServerDialect _dialect;

  ServerAuthApi(this._dio, this._dialect);

  void _requireQuickConnect() {
    if (!_dialect.supportsQuickConnect) {
      throw UnsupportedError(
        'QuickConnect is not supported on this server',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async {
    final response = await _dio.post(
      '/Users/AuthenticateByName',
      data: {'Username': username, 'Pw': password},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> initiateQuickConnect() async {
    _requireQuickConnect();
    final response = await _dio.post('/QuickConnect/Initiate');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) async {
    _requireQuickConnect();
    final response = await _dio.get(
      '/QuickConnect/Connect',
      queryParameters: {'Secret': secret},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async {
    _requireQuickConnect();
    final response = await _dio.post(
      '/QuickConnect/Authorize',
      queryParameters: {
        'code': code,
        if (userId != null && userId.isNotEmpty) 'userId': userId,
      },
    );
    return response.data == true;
  }

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(
    String secret,
  ) async {
    _requireQuickConnect();
    final response = await _dio.post(
      '/Users/AuthenticateWithQuickConnect',
      data: {'Secret': secret},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> logout() async {
    await _dio.post('/Sessions/Logout');
  }
}
