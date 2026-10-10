import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_user_mapper.dart';

/// The current Moonfin user on Silo: the selected household profile of the
/// signed-in account.
class SiloUsersApi implements UsersApi {
  SiloUsersApi(
    this._dio, {
    required String? Function() profileId,
    required Future<String?> Function() serverId,
    this.onConfigurationUpdated,
  }) : _profileId = profileId,
       _serverId = serverId;

  final Dio _dio;
  final String? Function() _profileId;
  final Future<String?> Function() _serverId;
  final void Function()? onConfigurationUpdated;

  @override
  Future<ServerUser> getCurrentUser() async {
    return ServerUser.fromJson(await _currentUserDto());
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final dto = await _currentUserDto();
    return UserConfiguration.fromJson(
      Map<String, dynamic>.from(dto['Configuration'] as Map),
    );
  }

  /// Writes the settings Silo keeps on the profile: languages and subtitle
  /// mode. Moonfin-only settings (ordered views, latest excludes, ...) have no
  /// Silo counterpart and stay local.
  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    final profileId = _requireProfileId();
    final json = config.toJson();
    final subtitles = jellyfinSubtitleModeToSilo(json['SubtitleMode'] as String?);
    await _dio.patch<dynamic>(
      '/api/v2/profiles/${Uri.encodeComponent(profileId)}',
      data: {
        'language': json['AudioLanguagePreference'] as String? ?? '',
        'subtitle_language': json['SubtitleLanguagePreference'] as String? ?? '',
        'subtitle_mode': subtitles.mode,
        'show_forced_subtitles': subtitles.showForced,
      },
    );
    onConfigurationUpdated?.call();
  }

  Future<Map<String, dynamic>> _currentUserDto() async {
    final profileId = _requireProfileId();
    final results = await Future.wait([
      _dio.get<dynamic>('/api/v2/account/me'),
      _dio.get<dynamic>('/api/v2/profiles'),
    ]);
    final account = asJsonMap(results[0].data) ??
        (throw const FormatException('Expected the Silo account as JSON'));
    final items = asJsonMap(results[1].data)?['items'];
    final profile = items is List
        ? items.whereType<Map>().map(Map<String, dynamic>.from).firstWhere(
            (p) => p['id']?.toString() == profileId,
            orElse: () => throw StateError(
              'Silo profile $profileId is not on this account any more',
            ),
          )
        : throw const FormatException('Silo returned no profile list');
    return siloProfileToUserDto(
      profile: profile,
      account: account,
      serverId: await _serverId(),
    );
  }

  String _requireProfileId() {
    final id = _profileId();
    if (id == null || id.isEmpty) {
      throw StateError('No Silo profile is selected');
    }
    return id;
  }
}
