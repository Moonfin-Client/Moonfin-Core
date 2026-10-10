import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_problem.dart';
import '../silo_session.dart';

/// A Silo household profile, as the profile picker needs it.
class SiloProfile {
  final String id;
  final String name;
  final bool hasPin;
  final bool isPrimary;
  final bool isChild;

  /// Root-relative or absolute avatar URL, if the profile has one.
  final String? avatarUrl;
  final Map<String, dynamic> raw;

  const SiloProfile({
    required this.id,
    required this.name,
    required this.hasPin,
    required this.isPrimary,
    required this.isChild,
    required this.raw,
    this.avatarUrl,
  });

  factory SiloProfile.fromJson(Map<String, dynamic> json) => SiloProfile(
    id: json['id']?.toString() ?? '',
    name: json['name'] as String? ?? '',
    hasPin: json['has_pin'] as bool? ?? false,
    isPrimary: json['is_primary'] as bool? ?? false,
    isChild: json['is_child'] as bool? ?? false,
    avatarUrl: (json['avatar_url'] as String?)?.trim().isEmpty ?? true
        ? null
        : json['avatar_url'] as String,
    raw: json,
  );
}

/// The answer to a PIN check.
sealed class SiloPinResult {
  const SiloPinResult();
}

/// The PIN matched: send [profileToken] as `X-Profile-Token`.
class SiloPinAccepted extends SiloPinResult {
  final String profileToken;
  final DateTime? expiresAt;
  const SiloPinAccepted(this.profileToken, {this.expiresAt});
}

class SiloPinRejected extends SiloPinResult {
  const SiloPinRejected();
}

/// Too many wrong PINs: the profile is locked for [retryAfter].
class SiloPinLocked extends SiloPinResult {
  final Duration? retryAfter;
  const SiloPinLocked(this.retryAfter);
}

/// Household profiles of the signed-in account.
class SiloProfilesApi {
  final Dio _dio;

  SiloProfilesApi(this._dio);

  /// The account's profiles. Needs a session but no selected profile.
  Future<List<SiloProfile>> listProfiles() async {
    final response = await _dio.get<dynamic>('/api/v2/profiles');
    final items = asJsonMap(response.data)?['items'];
    if (items is! List) return const [];
    return items
        .whereType<Map>()
        .map((e) => SiloProfile.fromJson(Map<String, dynamic>.from(e)))
        .where((p) => p.id.isNotEmpty)
        .toList(growable: false);
  }

  /// Checks [pin] for [profileId].
  ///
  /// Every attempt counts towards Silo's lockout, so this is never retried
  /// automatically.
  Future<SiloPinResult> verifyPin(String profileId, String pin) async {
    try {
      final response = await _dio.post<dynamic>(
        '/api/v2/profiles/${Uri.encodeComponent(profileId)}/verify-pin',
        data: {'pin': pin},
        options: Options(extra: const {siloNoRefreshExtra: true}),
      );
      final data = asJsonMap(response.data) ?? const {};
      final token = data['profile_token'] as String?;
      if (data['valid'] == true && token != null && token.isNotEmpty) {
        return SiloPinAccepted(
          token,
          expiresAt: DateTime.tryParse(data['expires_at'] as String? ?? ''),
        );
      }
      return const SiloPinRejected();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        final seconds = SiloProblem.retryAfterSeconds(e);
        return SiloPinLocked(seconds == null ? null : Duration(seconds: seconds));
      }
      rethrow;
    }
  }
}
