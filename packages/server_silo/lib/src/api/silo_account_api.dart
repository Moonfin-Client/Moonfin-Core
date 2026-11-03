import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_problem.dart';

/// What Silo allows for changing the account password, from
/// `GET /account/password/capability`.
class SiloPasswordCapability {
  const SiloPasswordCapability({
    required this.state,
    required this.allowed,
    required this.requiresCurrentPassword,
    required this.minimumLength,
    required this.maximumBytes,
  });

  factory SiloPasswordCapability.fromJson(Map<String, dynamic> json) {
    int? asInt(Object? v) => v is num ? v.toInt() : null;
    return SiloPasswordCapability(
      state: json['state'] as String? ?? '',
      allowed: json['allowed'] == true,
      requiresCurrentPassword: json['requires_current_password'] != false,
      minimumLength: asInt(json['minimum_password_length']) ?? 8,
      maximumBytes: asInt(json['maximum_password_bytes']) ?? 72,
    );
  }

  /// `available`, `disabled`, `not_configured` or `unsupported`.
  final String state;

  /// Whether this session may change the password. A session holding a
  /// temporary password may, unless the account doesn't sign in with a local
  /// password at all.
  final bool allowed;

  /// Always true today: a change sends the password in use.
  final bool requiresCurrentPassword;

  /// Fewest characters a new password may have.
  final int minimumLength;

  /// Most UTF-8 bytes a new password may have (bcrypt's limit).
  final int maximumBytes;

  bool get canChange => allowed && state == 'available';
}

/// Silo refused a new password: too short, too long, or the same as the
/// temporary one. [detail] is Silo's text for the person (English).
class SiloPasswordRejectedError implements Exception {
  const SiloPasswordRejectedError({required this.field, this.detail});

  /// The body member Silo named: `new_password` or `current_password`.
  final String field;
  final String? detail;

  @override
  String toString() =>
      'Silo refused the $field${detail == null ? '' : ': $detail'}';
}

/// The signed-in Silo account's own password. Not a Moonfin interface:
/// Jellyfin and Emby change passwords through their own user APIs, so only
/// the app's Silo sign-in uses it.
///
/// Both routes are among the few a session holding a temporary password may
/// call, along with `GET /account/me` and `POST /auth/logout`.
class SiloAccountApi {
  SiloAccountApi(this._dio);

  final Dio _dio;

  /// Whether this session may change the password, and the limits.
  Future<SiloPasswordCapability> passwordCapability() async {
    final response = await _dio.get<dynamic>(
      '/api/v2/account/password/capability',
    );
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected a password capability from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    return SiloPasswordCapability.fromJson(json);
  }

  /// Replaces the account password (`POST /account/password`, `204`).
  ///
  /// When the account held a temporary password, Silo also revokes every
  /// other session of the account. This one keeps going, and its next
  /// refresh drops the restriction.
  ///
  /// Throws [SiloPasswordRejectedError] when Silo refuses one of the two
  /// passwords (`422 validation_failed` naming the member). Any other failure
  /// is the [DioException] as is.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _dio.post<dynamic>(
        '/api/v2/account/password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
    } on DioException catch (e) {
      final problem = SiloProblem.of(e);
      if (problem?.code == 'validation_failed') {
        for (final error in problem!.errors) {
          final location = error.location;
          if (location == 'body.new_password' ||
              location == 'body.current_password') {
            throw SiloPasswordRejectedError(
              field: location!.substring('body.'.length),
              detail: error.detail ?? problem.message,
            );
          }
        }
      }
      rethrow;
    }
  }
}
