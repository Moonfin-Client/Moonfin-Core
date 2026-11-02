import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_problem.dart';
import '../silo_session.dart';

/// One Silo household profile, as `GET /profiles` lists it.
///
/// Only the fields Moonfin decides on are typed. [json] keeps the whole
/// profile for the user and settings mappers.
class SiloProfile {
  const SiloProfile({
    required this.id,
    required this.name,
    required this.isPrimary,
    required this.hasPin,
    required this.isChild,
    this.json = const {},
  });

  factory SiloProfile.fromJson(Map<String, dynamic> json) => SiloProfile(
    id: json['id']?.toString() ?? '',
    name: json['name'] as String? ?? '',
    isPrimary: json['is_primary'] == true,
    hasPin: json['has_pin'] == true,
    isChild: json['is_child'] == true,
    json: json,
  );

  final String id;
  final String name;

  /// The account's main profile, created with the account.
  final bool isPrimary;

  /// Locked with a PIN: requests acting as it need an `X-Profile-Token`
  /// from `verify-pin`.
  final bool hasPin;

  final bool isChild;

  /// The profile exactly as Silo sent it.
  final Map<String, dynamic> json;
}

/// The answer to a profile PIN check ([SiloProfilesApi.verifyPin]).
sealed class SiloPinResult {
  const SiloPinResult();
}

/// The PIN matched. Requests acting as the profile send [profileToken] as
/// `X-Profile-Token` with its `X-Profile-Id`.
///
/// The token is bound to this login (its session) and to the profile's
/// current PIN: it stops working when the login ends or the PIN changes.
/// [expiresAt] is null when it doesn't expire otherwise.
class SiloPinAccepted extends SiloPinResult {
  const SiloPinAccepted(this.profileToken, {this.expiresAt});

  final String profileToken;
  final DateTime? expiresAt;
}

/// The PIN didn't match. Silo counted the attempt.
class SiloPinRejected extends SiloPinResult {
  const SiloPinRejected();
}

/// Too many wrong PINs: Silo refuses every check for this profile, the right
/// PIN included, for [retryAfter] (five minutes after the fifth wrong one).
class SiloPinLocked extends SiloPinResult {
  const SiloPinLocked(this.retryAfter);

  /// From Silo's `Retry-After`, null when it sent none.
  final Duration? retryAfter;
}

/// Silo's household profiles. Not a Moonfin interface: Jellyfin and Emby have
/// no equivalent, so only Silo-aware code (the app's Silo sign-in) uses it.
class SiloProfilesApi {
  SiloProfilesApi(this._dio);

  final Dio _dio;

  /// Every profile on the signed-in account, in Silo's order. Asked as the
  /// account, without a profile ([siloNoProfileExtra]), so a profile that
  /// is selected but not (or no longer) unlocked doesn't get it refused.
  Future<List<SiloProfile>> list() async {
    final response = await _dio.get<dynamic>(
      '/api/v2/profiles',
      options: Options(extra: const {siloNoProfileExtra: true}),
    );
    final items = asJsonMap(response.data)?['items'];
    if (items is! List) {
      throw FormatException(
        'Expected a profile list from Silo, got ${response.data.runtimeType}',
      );
    }
    return [
      for (final item in items)
        if (asJsonMap(item) case final json?) SiloProfile.fromJson(json),
    ].where((p) => p.id.isNotEmpty).toList();
  }

  /// Checks [pin] for [profileId] (`POST /profiles/{id}/verify-pin`).
  ///
  /// Every check counts toward Silo's lockout (five wrong PINs lock the
  /// profile for five minutes), so a PIN is only ever sent when the person
  /// entered it: nothing here tries again on its own. The session's only
  /// replay, after a `401` (an expired token), happens before Silo looked at
  /// the PIN, so it doesn't count. Other failures (no network, `404` for a
  /// deleted profile) are thrown.
  Future<SiloPinResult> verifyPin(String profileId, String pin) async {
    try {
      final response = await _dio.post<dynamic>(
        '/api/v2/profiles/${Uri.encodeComponent(profileId)}/verify-pin',
        data: {'pin': pin},
        // As the account: the profile being unlocked can't be named yet,
        // and Silo doesn't need it here.
        options: Options(extra: const {siloNoProfileExtra: true}),
      );
      final data = asJsonMap(response.data) ?? const <String, dynamic>{};
      final token = data['profile_token'];
      if (data['valid'] == true && token is String && token.isNotEmpty) {
        final expires = data['expires_at'];
        return SiloPinAccepted(
          token,
          expiresAt: expires is String ? DateTime.tryParse(expires) : null,
        );
      }
      return const SiloPinRejected();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        return SiloPinLocked(SiloProblem.retryAfter(e));
      }
      rethrow;
    }
  }
}
