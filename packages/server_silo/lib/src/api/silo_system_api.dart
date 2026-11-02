import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// System info over Silo's native endpoints, in the Jellyfin `SystemInfo`
/// shape the app reads (see [siloPublicInfoToJellyfinShape]).
class SiloSystemApi implements SystemApi {
  final Dio _dio;

  SiloSystemApi(this._dio);

  /// `/system/info` decides success. Identity, branding and setup are fetched
  /// alongside it and left out if they fail, since they only add the id, name
  /// and setup state to a server already known to be Silo.
  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async {
    final results = await Future.wait([
      _getMap(siloSystemInfoPath),
      _tryGetMap('/api/v2/system/identity'),
      _tryGetMap('/api/v2/theme/branding'),
      _tryGetMap('/api/v2/system/setup'),
    ]);
    final systemInfo = results[0]!;
    if (!isSiloSystemInfo(systemInfo)) {
      throw const FormatException('Not a Silo /api/v2/system/info response');
    }
    return siloPublicInfoToJellyfinShape(
      systemInfo: systemInfo,
      identity: results[1],
      branding: results[2],
      setup: results[3],
    );
  }

  /// Public info plus the signed-in account. Jellyfin's `/System/Info`
  /// requires a valid session, so this does too: a missing, revoked or
  /// expired login fails here with Silo's 401 rather than passing silently.
  @override
  Future<Map<String, dynamic>> getSystemInfo() async {
    final results = await Future.wait([
      getPublicSystemInfo(),
      _getMap('/api/v2/account/me'),
    ]);
    return {...results[0]!, 'SiloAccount': results[1]};
  }

  /// Silo has no ping route. `/system/identity` is public, tiny and answered
  /// by every API node, so it stands in for one. The connectivity check asks
  /// this rather than Jellyfin's `/System/Ping`.
  @override
  Future<bool> ping() async {
    try {
      final response = await _dio.get<dynamic>(
        '/api/v2/system/identity',
        options: Options(receiveTimeout: SystemApi.pingTimeout),
      );
      return response.statusCode == 200;
    } catch (e) {
      // The route is public and runs no sign-in check, so a 401 would only
      // come from something in front of Silo. It still counts as an answer,
      // as for every server type.
      return pingAnsweredDespite(e);
    }
  }

  Future<Map<String, dynamic>?> _getMap(String path) async {
    final response = await _dio.get<dynamic>(path);
    return asJsonMap(response.data) ??
        (throw FormatException('Expected a JSON object from Silo $path'));
  }

  Future<Map<String, dynamic>?> _tryGetMap(String path) async {
    try {
      return await _getMap(path);
    } catch (_) {
      return null;
    }
  }
}
