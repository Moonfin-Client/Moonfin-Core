import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../data/services/plugin_sync_service.dart';

/// A member of a household the signed in user manages, as the plugin's
/// Moonfin/Household read lists it.
@immutable
class HouseholdMember {
  final String id;
  final String name;

  /// The member's avatar tag on the server, when it has one.
  final String? imageTag;

  /// Disabled accounts cannot be signed in, so they are never offered.
  final bool isDisabled;

  /// True when this device already keeps a sign in for the account, so the
  /// server itself says it is not missing here.
  final bool signedInOnThisDevice;

  const HouseholdMember({
    required this.id,
    required this.name,
    this.imageTag,
    this.isDisabled = false,
    this.signedInOnThisDevice = false,
  });

  factory HouseholdMember.fromJson(Map<String, dynamic> json) => HouseholdMember(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    imageTag: json['primaryImageTag'] as String?,
    isDisabled: json['isDisabled'] as bool? ?? false,
    signedInOnThisDevice: json['signedInOnThisDevice'] as bool? ?? false,
  );
}

/// The signed in user's household, or nothing to manage. Non-managers get
/// [isManager] false and an empty [members] list, so one read decides
/// whether to offer household setup.
@immutable
class HouseholdInfo {
  final bool isManager;
  final bool sessionsSupported;
  final List<HouseholdMember> members;

  const HouseholdInfo({
    required this.isManager,
    required this.sessionsSupported,
    required this.members,
  });

  factory HouseholdInfo.fromJson(Map<String, dynamic> json) {
    final users = json['users'];
    return HouseholdInfo(
      isManager: json['isManager'] as bool? ?? false,
      sessionsSupported: json['sessionsSupported'] as bool? ?? false,
      members: users is! List
          ? const []
          : [
              for (final entry in users)
                if (entry is Map)
                  HouseholdMember.fromJson(Map<String, dynamic>.from(entry)),
            ],
    );
  }
}

/// One account the plugin signed in (or tried to) on this device.
@immutable
class HouseholdSessionResult {
  final String userId;
  final String? name;
  final bool success;

  /// True when the account already had a sign in on this device and the
  /// server handed that token back instead of minting a new one.
  final bool reused;
  final String? accessToken;

  /// The member's avatar tag as the plugin's result carries it.
  final String? imageTag;

  const HouseholdSessionResult({
    required this.userId,
    required this.success,
    this.name,
    this.reused = false,
    this.accessToken,
    this.imageTag,
  });

  factory HouseholdSessionResult.fromJson(Map<String, dynamic> json) {
    // The nested user is Jellyfin's own sign in answer, PascalCase.
    final user = json['user'];
    return HouseholdSessionResult(
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ??
          (user is Map ? user['Name'] as String? : null),
      success: json['success'] as bool? ?? false,
      reused: json['reused'] as bool? ?? false,
      accessToken: json['accessToken'] as String?,
      imageTag: user is Map ? user['PrimaryImageTag'] as String? : null,
    );
  }
}

/// Names as a sentence lists them: "A", "A and B", "A, B and C".
String householdJoinNames(Iterable<String> names) {
  final list = names.where((name) => name.trim().isNotEmpty).toList();
  if (list.length <= 1) return list.singleOrNull ?? '';
  final last = list.removeLast();
  return '${list.join(', ')} and $last';
}

/// The household members this device should be offered: enabled, not already
/// signed in here per the server, and not already kept by this device itself.
List<HouseholdMember> missingHouseholdMembers(
  HouseholdInfo info,
  Iterable<String> storedUserIds,
) {
  final stored = storedUserIds.toSet();
  return [
    for (final member in info.members)
      if (!member.isDisabled && !member.signedInOnThisDevice)
        if (!stored.contains(member.id)) member,
  ];
}

/// Talks to the plugin's household endpoints. The server runs them at the
/// server root on Jellyfin and Emby, like the rest of the Moonfin services.
class HouseholdService {
  final MediaServerClient? Function() _client;
  final Dio _dio;

  HouseholdService({
    required MediaServerClient? Function() client,
    @visibleForTesting Dio? dio,
  }) : _client = client,
       _dio = dio ?? Dio(pluginRequestOptions()) {
    if (dio == null) {
      configureServerDio(_dio);
      _dio.interceptors.add(redirectInterceptor(_dio));
    }
  }

  /// The caller's household, or null when the server's plugin predates
  /// households or the request failed.
  Future<HouseholdInfo?> household() async {
    final response = await _raw('GET', '/Moonfin/Household');
    final status = response?.statusCode ?? 0;
    final data = response?.data;
    if (status < 200 || status >= 300 || data is! Map) return null;
    return HouseholdInfo.fromJson(Map<String, dynamic>.from(data));
  }

  /// Signs the named accounts in on this device and returns the result for
  /// each, with its token when that worked. Null when the request failed.
  Future<List<HouseholdSessionResult>?> createSessions(
    List<String> userIds,
  ) async {
    final response = await _raw(
      'POST',
      '/Moonfin/Household/Sessions',
      {'userIds': userIds},
    );
    final status = response?.statusCode ?? 0;
    final data = response?.data;
    if (status < 200 || status >= 300 || data is! Map) return null;
    final results = data['results'];
    return results is! List
        ? null
        : [
            for (final entry in results)
              if (entry is Map)
                HouseholdSessionResult.fromJson(Map<String, dynamic>.from(entry)),
          ];
  }

  Future<Response<Object?>?> _raw(
    String method,
    String path,
    [Object? body]
  ) async {
    final client = _client();
    final token = client?.accessToken;
    if (client == null || token == null || token.isEmpty) return null;
    try {
      return await _dio.request<Object?>(
        '${client.baseUrl}$path',
        data: body,
        options: Options(
          method: method,
          headers: {
            'Authorization': buildServerAuthorizationHeader(
              scheme: 'MediaBrowser',
              deviceInfo: client.deviceInfo,
              accessToken: token,
            ),
            'Accept': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      // A refusal still has a status worth reading; anything else is an
      // outage, which the callers treat as "no household to offer".
      return e.response;
    } catch (_) {
      return null;
    }
  }
}
