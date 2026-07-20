import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyConnectService {
  static const _connectBaseUrl = 'https://connect.emby.media/service/';

  final DeviceInfo _deviceInfo;
  final Dio _dio;

  EmbyConnectService({required DeviceInfo deviceInfo})
    : _deviceInfo = deviceInfo,
      _dio = Dio(
        BaseOptions(
          baseUrl: _connectBaseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ) {
    configureServerDio(_dio);
  }

  String get _applicationHeader =>
      '${_deviceInfo.appName}/${_deviceInfo.appVersion}';

  Future<EmbyConnectAuthResult> authenticate({
    required String username,
    required String password,
  }) async {
    final credentials = {'nameOrEmail': username, 'rawpw': password};
    final headers = {
      'X-Application': _applicationHeader,
      'Accept': 'application/json',
    };

    // The form-urlencoded POST is the call the official Emby clients use and the
    // only one that authenticates. A GET is tried first, but its 401 isn't final
    // since it 401s even for valid credentials, so it falls through to the POST.
    Response<dynamic> response;
    try {
      response = await _dio.get<dynamic>(
        'user/authenticate',
        queryParameters: credentials,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
    } on DioException {
      response = await _dio.post<dynamic>(
        'user/authenticate',
        data: credentials,
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
        ),
      );
    }

    final data = _asJsonMap(response.data, context: 'authenticate');
    return EmbyConnectAuthResult.fromJson(data);
  }

  Object? _decodeJsonIfString(Object? data) {
    if (data is! String) return data;
    final trimmed = data.trim();
    if (trimmed.isEmpty) return data;
    return jsonDecode(trimmed);
  }

  Map<String, dynamic> _asJsonMap(Object? data, {required String context}) {
    data = _decodeJsonIfString(data);
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    throw FormatException(
      'Invalid Emby Connect $context response: expected JSON object',
    );
  }

  List<dynamic> _asJsonList(Object? data, {required String context}) {
    data = _decodeJsonIfString(data);
    if (data is List<dynamic>) return data;
    if (data is List) return List<dynamic>.from(data);
    if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      final nested = map['Items'] ?? map['Servers'];
      if (nested is List<dynamic>) return nested;
      if (nested is List) return List<dynamic>.from(nested);
    }
    throw FormatException(
      'Invalid Emby Connect $context response: expected JSON array',
    );
  }

  Future<List<EmbyConnectServer>> getServers({
    required String connectUserId,
    required String connectAccessToken,
  }) async {
    final response = await _dio.get<dynamic>(
      'servers',
      queryParameters: {'userId': connectUserId},
      options: Options(
        headers: {
          'X-Application': _applicationHeader,
          'X-Connect-UserToken': connectAccessToken,
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    final data = _asJsonList(response.data, context: 'servers');

    return data
        .whereType<Map>()
        .map(
          (entry) =>
              EmbyConnectServer.fromJson(Map<String, dynamic>.from(entry)),
        )
        .toList(growable: false);
  }

  Future<EmbyConnectExchangeResult> exchange({
    required String serverAddress,
    required String connectUserId,
    required String accessKey,
  }) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    configureServerDio(dio);

    DioException? lastDioError;
    Object? lastError;

    try {
      for (final exchangeUri in _exchangeUris(serverAddress)) {
        try {
          final queryUri = exchangeUri.replace(
            queryParameters: {
              ...exchangeUri.queryParameters,
              'format': 'json',
              'ConnectUserId': connectUserId,
            },
          );

          final response = await dio.getUri<dynamic>(
            queryUri,
            options: Options(
              headers: {
                'X-Emby-Token': accessKey,
                'X-Application': _applicationHeader,
                'Accept': 'application/json',
                'X-Emby-Authorization': buildServerAuthorizationHeader(
                  scheme: 'Emby',
                  deviceInfo: _deviceInfo,
                ),
              },
              responseType: ResponseType.json,
            ),
          );

          final data = _asJsonMap(response.data, context: 'exchange');

          return EmbyConnectExchangeResult.fromJson(
            data,
            resolvedBaseUrl: _baseUrlFromExchangeUri(exchangeUri),
          );
        } on DioException catch (e) {
          lastDioError = e;
          lastError = e;
          continue;
        } catch (e) {
          lastError = e;
          continue;
        }
      }

      if (lastDioError != null) throw lastDioError;
      throw lastError ?? const FormatException('Invalid exchange response');
    } finally {
      dio.close();
    }
  }

  Iterable<Uri> _exchangeUris(String serverAddress) sync* {
    final normalized = serverAddress.endsWith('/')
        ? serverAddress
        : '$serverAddress/';
    final base = Uri.parse(normalized);

    yield base.resolve('Connect/Exchange');

    final root = base.replace(path: '/', query: '', fragment: '');
    yield root.resolve('emby/Connect/Exchange');
  }

  String _baseUrlFromExchangeUri(Uri exchangeUri) {
    final path = exchangeUri.path;
    const suffix = '/Connect/Exchange';
    var basePath = path;
    if (path.toLowerCase().endsWith(suffix.toLowerCase())) {
      basePath = path.substring(0, path.length - suffix.length);
    }
    final trimmedPath = basePath.endsWith('/') && basePath.length > 1
        ? basePath.substring(0, basePath.length - 1)
        : basePath;
    final base = exchangeUri.replace(
      path: trimmedPath,
      query: '',
      fragment: '',
    );
    return base.toString();
  }
}

class EmbyConnectAuthResult {
  final String accessToken;
  final EmbyConnectUser user;

  const EmbyConnectAuthResult({required this.accessToken, required this.user});

  factory EmbyConnectAuthResult.fromJson(Map<String, dynamic> json) {
    final rawUser = (json['User'] ?? json['user']) as Map?;
    final userJson = rawUser?.cast<String, dynamic>() ?? json;

    return EmbyConnectAuthResult(
      accessToken:
          json['AccessToken']?.toString() ??
          json['accessToken']?.toString() ??
          json['ConnectAccessToken']?.toString() ??
          json['connectAccessToken']?.toString() ??
          '',
      user: EmbyConnectUser.fromJson(userJson),
    );
  }
}

class EmbyConnectUser {
  final String id;
  final String name;

  const EmbyConnectUser({required this.id, required this.name});

  factory EmbyConnectUser.fromJson(Map<String, dynamic> json) {
    return EmbyConnectUser(
      id:
          json['Id']?.toString() ??
          json['UserId']?.toString() ??
          json['ConnectUserId']?.toString() ??
          json['connectUserId']?.toString() ??
          '',
      name: json['Name']?.toString() ?? json['Username']?.toString() ?? '',
    );
  }
}

class EmbyConnectServer {
  final String accessKey;
  final String systemId;
  final String name;
  final String? url;
  final String? localAddress;

  const EmbyConnectServer({
    required this.accessKey,
    required this.systemId,
    required this.name,
    required this.url,
    required this.localAddress,
  });

  List<String> get candidateAddresses {
    final seen = <String>{};
    final addresses = <String>[];
    for (final candidate in [url, localAddress]) {
      final trimmed = candidate?.trim();
      if (trimmed == null || trimmed.isEmpty) {
        continue;
      }
      for (final normalized in _normalizedCandidates(trimmed)) {
        if (seen.add(normalized.toLowerCase())) {
          addresses.add(normalized);
        }
      }
    }
    return addresses;
  }

  Iterable<String> _normalizedCandidates(String value) sync* {
    var sanitized = value.endsWith('/')
        ? value.substring(0, value.length - 1)
        : value;

    try {
      final uri = Uri.parse(sanitized);
      // Rebuild the URI without its query or fragment. Passing empty strings to
      // Uri.replace keeps an empty query and fragment that serialize as a
      // trailing "?#", which corrupts the exchange URL and the address shown in
      // the server list.
      sanitized = Uri(
        scheme: uri.hasScheme ? uri.scheme : null,
        userInfo: uri.userInfo.isEmpty ? null : uri.userInfo,
        host: uri.host.isEmpty ? null : uri.host,
        port: uri.hasPort ? uri.port : null,
        path: uri.path,
      ).toString();
      if (sanitized.endsWith('/')) {
        sanitized = sanitized.substring(0, sanitized.length - 1);
      }
    } catch (_) {}

    if (sanitized.startsWith('http://') || sanitized.startsWith('https://')) {
      yield sanitized;
      return;
    }

    yield 'https://$sanitized';
    yield 'http://$sanitized';
  }

  factory EmbyConnectServer.fromJson(Map<String, dynamic> json) {
    return EmbyConnectServer(
      accessKey:
          json['AccessKey']?.toString() ??
          json['ConnectAccessKey']?.toString() ??
          json['UserAccessToken']?.toString() ??
          '',
      systemId: json['SystemId']?.toString() ?? '',
      name: json['Name']?.toString() ?? '',
      url: json['Url']?.toString() ?? json['Address']?.toString(),
      localAddress:
          json['LocalAddress']?.toString() ?? json['LocalAddress1']?.toString(),
    );
  }
}

class EmbyConnectExchangeResult {
  final String localUserId;
  final String accessToken;
  final String resolvedBaseUrl;

  const EmbyConnectExchangeResult({
    required this.localUserId,
    required this.accessToken,
    required this.resolvedBaseUrl,
  });

  factory EmbyConnectExchangeResult.fromJson(
    Map<String, dynamic> json, {
    required String resolvedBaseUrl,
  }) {
    return EmbyConnectExchangeResult(
      localUserId:
          json['LocalUserId']?.toString() ??
          json['localUserId']?.toString() ??
          '',
      accessToken:
          json['AccessToken']?.toString() ??
          json['accessToken']?.toString() ??
          '',
      resolvedBaseUrl: resolvedBaseUrl,
    );
  }
}
