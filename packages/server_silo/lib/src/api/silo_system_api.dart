import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// System info over Silo's native endpoints, returned in the Jellyfin
/// `SystemInfo` shape the app reads.
class SiloSystemApi implements SystemApi {
  final Dio _dio;

  SiloSystemApi(this._dio);

  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async {
    final systemInfo = await _getMap('/api/v2/system/info');
    final results = await Future.wait([
      _tryGetMap('/api/v2/system/identity'),
      _tryGetMap('/api/v2/theme/branding'),
      _tryGetMap('/api/v2/system/setup'),
    ]);
    return siloPublicInfoToJellyfinShape(
      systemInfo: systemInfo,
      identity: results[0],
      branding: results[1],
      setup: results[2],
    );
  }

  /// Public info plus a call that needs a valid session, so a revoked or
  /// expired login surfaces here as it would on Jellyfin's `/System/Info`.
  @override
  Future<Map<String, dynamic>> getSystemInfo() async {
    final info = await getPublicSystemInfo();
    final account = await _getMap('/api/v2/account/me');
    return {...info, 'SiloAccount': account};
  }

  /// Silo has no ping route. Identity is public, tiny and served by every API
  /// node, so it stands in for one.
  @override
  Future<bool> ping() async {
    try {
      final response = await _dio.get<dynamic>('/api/v2/system/identity');
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  Future<Map<String, dynamic>> _getMap(String path) async {
    final response = await _dio.get<dynamic>(path);
    return _asMap(response.data);
  }

  Future<Map<String, dynamic>?> _tryGetMap(String path) async {
    try {
      return await _getMap(path);
    } catch (_) {
      return null;
    }
  }

  static Map<String, dynamic> _asMap(Object? data) =>
      asJsonMap(data) ??
      (throw FormatException(
        'Expected a JSON object from Silo, got ${data.runtimeType}',
      ));
}
