import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import 'moonbase_endpoint.dart';

/// Where to reach a user's PIN on the server: the address and the token of the
/// account, which is not always the one signed in, since the PIN is asked for
/// before a saved account is switched to.
class ServerPinAccount {
  const ServerPinAccount({
    required this.baseUrl,
    required this.accessToken,
    this.plexServerId,
  });

  final String baseUrl;
  final String accessToken;

  /// The saved id of a Plex server, whose PINs are kept by the Moonbase
  /// companion rather than at [baseUrl]. Null on every other server.
  final String? plexServerId;
}

/// Whether the server holds a PIN for the account.
enum ServerPinAvailability {
  /// The plugin keeps a PIN for this account.
  enabled,

  /// The plugin is there and keeps none.
  disabled,

  /// Not asked or not answered: no plugin, an older plugin, a token the server
  /// no longer accepts, or a server that could not be reached.
  unavailable,
}

/// What the server made of a PIN it was asked to check.
sealed class ServerPinVerdict {
  const ServerPinVerdict();
}

class ServerPinValid extends ServerPinVerdict {
  const ServerPinValid();
}

class ServerPinWrong extends ServerPinVerdict {
  const ServerPinWrong();
}

/// Too many wrong guesses. Nothing was checked.
class ServerPinLocked extends ServerPinVerdict {
  const ServerPinLocked(this.retryAfter);

  final Duration retryAfter;
}

/// The server has no PIN for the account.
class ServerPinNone extends ServerPinVerdict {
  const ServerPinNone();
}

/// The server could not say, so the PIN stored on the device decides.
class ServerPinUnavailable extends ServerPinVerdict {
  const ServerPinUnavailable();
}

/// The PIN a server keeps for an account, through the Moonfin plugin. The
/// plugin holds a salted slow hash and counts wrong guesses itself, so a PIN
/// set on one device holds on every other and clearing app data does not hand
/// back free guesses. Nothing here ever gets the hash back.
class ServerPinService {
  ServerPinService({required this.deviceInfo, @visibleForTesting Dio? dio})
    : _dio = dio ?? _newDio();

  final DeviceInfo deviceInfo;
  final Dio _dio;

  static Dio _newDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 15),
        // The answers are read by status, not thrown.
        validateStatus: (_) => true,
      ),
    );
    configureServerDio(dio);
    dio.interceptors.add(redirectInterceptor(dio));
    return dio;
  }

  /// Where the account's PIN routes start and how to sign them. Null on a Plex
  /// server whose Moonbase companion can't be found, which leaves the PIN on
  /// the device to decide.
  Future<MoonbaseEndpoint?> _endpoint(ServerPinAccount account) async {
    final plexServerId = account.plexServerId;
    if (plexServerId != null) {
      return plexAccountMoonbaseEndpoint(
        serverId: plexServerId,
        serverUrl: account.baseUrl,
        token: account.accessToken,
        dio: _dio,
      );
    }
    return (
      base: account.baseUrl,
      headers: {
        'Authorization': buildServerAuthorizationHeader(
          scheme: 'MediaBrowser',
          deviceInfo: deviceInfo,
          accessToken: account.accessToken,
        ),
      },
    );
  }

  /// Whether the server keeps a PIN for the account.
  Future<ServerPinAvailability> status(ServerPinAccount account) async {
    final at = await _endpoint(account);
    if (at == null) return ServerPinAvailability.unavailable;
    try {
      final response = await _dio.get<dynamic>(
        '${at.base}/Moonfin/Pin',
        options: Options(headers: at.headers),
      );
      final data = response.data;
      if (response.statusCode == 200 &&
          data is Map &&
          data['enabled'] is bool) {
        return data['enabled'] as bool
            ? ServerPinAvailability.enabled
            : ServerPinAvailability.disabled;
      }
    } on DioException {
      // Fall through to unavailable.
    }
    return ServerPinAvailability.unavailable;
  }

  /// Asks the server whether [pin] is the account's PIN.
  Future<ServerPinVerdict> verify(ServerPinAccount account, String pin) async {
    final at = await _endpoint(account);
    if (at == null) return const ServerPinUnavailable();
    try {
      final response = await _dio.post<dynamic>(
        '${at.base}/Moonfin/Pin/Verify',
        data: {'pin': pin},
        options: Options(headers: at.headers),
      );
      return _verdict(response);
    } on DioException {
      return const ServerPinUnavailable();
    }
  }

  /// Sets the account's PIN. A PIN that already exists has to be named in
  /// [currentPin], and a wrong one counts as a guess.
  Future<ServerPinVerdict> setPin(
    ServerPinAccount account,
    String pin, {
    String? currentPin,
  }) async {
    final at = await _endpoint(account);
    if (at == null) return const ServerPinUnavailable();
    try {
      final response = await _dio.put<dynamic>(
        '${at.base}/Moonfin/Pin',
        data: {'pin': pin, 'currentPin': ?currentPin},
        options: Options(headers: at.headers),
      );
      return _writeVerdict(response);
    } on DioException {
      return const ServerPinUnavailable();
    }
  }

  /// Removes the account's PIN, which takes the current one.
  Future<ServerPinVerdict> removePin(
    ServerPinAccount account, {
    String? currentPin,
  }) async {
    final at = await _endpoint(account);
    if (at == null) return const ServerPinUnavailable();
    try {
      final response = await _dio.delete<dynamic>(
        '${at.base}/Moonfin/Pin',
        data: {'currentPin': ?currentPin},
        options: Options(headers: at.headers),
      );
      return _writeVerdict(response);
    } on DioException {
      return const ServerPinUnavailable();
    }
  }

  /// Removes another user's PIN, or the account's own, without the current one.
  /// The server allows it to administrators only.
  Future<ServerPinVerdict> removePinFor(
    ServerPinAccount account,
    String userId,
  ) async {
    final at = await _endpoint(account);
    if (at == null) return const ServerPinUnavailable();
    try {
      final response = await _dio.delete<dynamic>(
        '${at.base}/Moonfin/Users/$userId/Pin',
        options: Options(headers: at.headers),
      );
      return response.statusCode == 200
          ? const ServerPinValid()
          : const ServerPinUnavailable();
    } on DioException {
      return const ServerPinUnavailable();
    }
  }

  ServerPinVerdict _verdict(Response<dynamic> response) {
    final data = response.data;
    switch (response.statusCode) {
      case 200:
        if (data is Map && data['valid'] is bool) {
          return data['valid'] as bool
              ? const ServerPinValid()
              : const ServerPinWrong();
        }
        return const ServerPinUnavailable();
      case 404:
        // Only the plugin says this. A server without it, or a proxy, answers
        // 404 with something else.
        return _errorIs(data, 'No PIN is set')
            ? const ServerPinNone()
            : const ServerPinUnavailable();
      case 429:
        return _locked(response);
      default:
        return const ServerPinUnavailable();
    }
  }

  ServerPinVerdict _writeVerdict(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return const ServerPinValid();
      case 403:
        return _errorIs(response.data, 'The current PIN is wrong')
            ? const ServerPinWrong()
            : const ServerPinUnavailable();
      case 429:
        return _locked(response);
      default:
        return const ServerPinUnavailable();
    }
  }

  ServerPinVerdict _locked(Response<dynamic> response) {
    final data = response.data;
    final seconds = data is Map && data['retryAfterSeconds'] is int
        ? data['retryAfterSeconds'] as int
        : int.tryParse(response.headers.value('retry-after') ?? '') ?? 30;
    return ServerPinLocked(Duration(seconds: seconds));
  }

  static bool _errorIs(dynamic data, String message) =>
      data is Map && data['error'] == message;
}
