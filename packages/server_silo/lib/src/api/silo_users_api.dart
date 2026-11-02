import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_settings_mapper.dart';
import '../mappers/silo_user_mapper.dart';
import '../silo_image_registry.dart';
import '../silo_kept_reads.dart';
import 'silo_downloads_api.dart';
import 'silo_profiles_api.dart';

/// One household profile of the signed-in account, as Silo lists it and as
/// the Moonfin user it becomes.
class SiloHouseholdMember {
  const SiloHouseholdMember({required this.profile, required this.user});

  final SiloProfile profile;

  /// The profile as a Moonfin user: the same mapping
  /// [SiloUsersApi.getCurrentUser] uses, without the per-profile downloads
  /// capability (read when the profile is used).
  final ServerUser user;
}

/// Moonfin's `UsersApi` over Silo's account and profiles.
///
/// The Moonfin user is the household profile the client acts as
/// (`X-Profile-Id`).
class SiloUsersApi implements UsersApi {
  SiloUsersApi(
    this._dio,
    this._profiles,
    this._profileId, {
    this.images,
    this.onConfigurationUpdated,
    this.downloads,
  });

  /// Where the downloads capability is read, for the user's download
  /// permission.
  final SiloDownloadsApi? downloads;

  /// Called after settings were saved, so cached library lists are dropped.
  final void Function()? onConfigurationUpdated;

  /// Where the profile's avatar is recorded for `ImageApi.getUserImageUrl`.
  final SiloImageRegistry? images;

  final Dio _dio;
  final SiloProfilesApi _profiles;

  /// The profile the client currently acts as, or null before one is chosen.
  final String? Function() _profileId;

  /// The account and its profiles, read together and kept a moment: a
  /// session start asks for the current user and then the household, which
  /// need the same two reads.
  final _account =
      SiloKeptReads<
        String,
        ({Map<String, dynamic> account, List<SiloProfile> profiles})
      >(lifetime: const Duration(seconds: 5));

  /// Forgets the account read, so the next one asks Silo (its access
  /// changed).
  void forgetAccount() => _account.forget();

  Future<({Map<String, dynamic> account, List<SiloProfile> profiles})>
  _accountAndProfiles() => _account.get('me', () async {
    // Both start at once. Awaiting them one by one (rather than a record's
    // `.wait`, which wraps failures in a ParallelWaitError) keeps a 401 a
    // plain DioException, which is what the app signs out on.
    final accountFuture = _dio.get<dynamic>('/api/v2/account/me');
    final profilesFuture = _profiles.list();
    // If the account read fails first, the profile read's own failure is
    // dropped here instead of reported as unhandled.
    profilesFuture.ignore();
    final account = await accountFuture;
    final profiles = await profilesFuture;
    final accountJson = asJsonMap(account.data);
    if (accountJson == null) {
      throw FormatException(
        'Expected an account from Silo, got ${account.data.runtimeType}',
      );
    }
    return (account: accountJson, profiles: profiles);
  });

  /// The signed-in account and the profile the client acts as.
  ///
  /// Reads `GET /account/me` and `GET /profiles` together. With no profile
  /// chosen yet it describes the main profile, the one the client will act
  /// as. Throws a [StateError] when the chosen profile no longer exists (for
  /// example deleted on the web). That isn't a `401`, so it doesn't sign out.
  ///
  /// The policy's `EnableContentDownloading` is the account's
  /// `download_allowed`, switched off when Silo's downloads capability says
  /// downloads are off for this profile. The capability is read afresh each
  /// time, alongside the account (this runs at sign-in, at start and when
  /// Silo says access changed). A capability that can't be read leaves the
  /// account's flag as it is.
  @override
  Future<ServerUser> getCurrentUser() async {
    downloads?.invalidateCapability();
    final downloadsFuture = downloads?.capability();
    downloadsFuture?.ignore();
    final (:account, :profiles) = await _accountAndProfiles();
    final wanted = _profileId();
    final profile = wanted == null
        ? profiles.where((p) => p.isPrimary).firstOrNull
        : profiles.where((p) => p.id == wanted).firstOrNull;
    if (profile == null) {
      throw StateError(
        wanted == null
            ? 'Silo listed no primary profile for this account'
            : 'Silo profile $wanted no longer exists on this account',
      );
    }
    final user = _userDto(profile, account);
    if (downloadsFuture != null) {
      try {
        if (!(await downloadsFuture).permitsDownloads) {
          (user['Policy'] as Map<String, dynamic>)['EnableContentDownloading'] =
              false;
        }
      } catch (e) {
        ServerLog.network(
          'Silo downloads capability unreadable; keeping the account flag',
          level: ServerLogLevel.warning,
          error: e,
        );
      }
    }
    return ServerUser.fromJson(user);
  }

  /// Every profile on the signed-in account, each with its Moonfin user, in
  /// Silo's order. Reads `GET /account/me` and `GET /profiles`, the latter
  /// as the account.
  Future<List<SiloHouseholdMember>> getHousehold() async {
    final (:account, :profiles) = await _accountAndProfiles();
    return [
      for (final profile in profiles)
        SiloHouseholdMember(
          profile: profile,
          user: ServerUser.fromJson(_userDto(profile, account)),
        ),
    ];
  }

  /// [profile] as a Moonfin user DTO, its avatar recorded.
  Map<String, dynamic> _userDto(
    SiloProfile profile,
    Map<String, dynamic> account,
  ) {
    final user = siloProfileToUserDto(profile: profile.json, account: account);
    // The avatar, when the profile has one to fetch (`avatar_url`: a preset
    // or an upload), under the profile id, which is the Moonfin user id.
    images?.note(profile.id);
    final avatarTag = images?.register(
      profile.id,
      SiloImageType.primary,
      profile.json['avatar_url'] as String?,
    );
    if (avatarTag != null) user['PrimaryImageTag'] = avatarTag;
    return user;
  }

  /// Silo has no access schedules (Jellyfin's allowed hours per user), so
  /// there is never one to enforce.
  @override
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async =>
      const [];

  /// The settings Moonfin reads from a `UserConfiguration`, resolved by Silo
  /// for the acting profile on this device (`GET /settings/values/effective`).
  ///
  /// What Moonfin uses today is the library order and the libraries hidden
  /// from My Media (Silo's `ui.library_order` and `ui.disabled_library_ids`).
  /// The playback keys come along in the same request. See
  /// `silo_settings_mapper.dart` for the mapping.
  @override
  Future<UserConfiguration> getUserConfiguration() async {
    final profileId = _requireProfile('getUserConfiguration');
    final values = await _readSettings();
    final config = UserConfiguration.fromJson(
      siloSettingsToUserConfiguration(values),
    );
    _lastRead = (profileId: profileId, values: values, config: config);
    return config;
  }

  /// Writes back the settings that changed since the last read, one
  /// `PUT /settings/values/{key}?scope=profile` each.
  ///
  /// Only changed keys are written: the library settings screens pass the
  /// whole configuration back after changing one list, and rewriting the
  /// others would turn Silo's defaults into stored values. Keys with no Silo
  /// equivalent (`LatestItemsExcludes`, `GroupedFolders`, the remember
  /// switches) aren't saved.
  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {
    final profileId = _requireProfile('updateUserConfiguration');
    var last = _lastRead;
    if (last == null || last.profileId != profileId) {
      await getUserConfiguration();
      last = _lastRead!;
    }
    final before = _toSilo(last.config, last.values);
    final after = _toSilo(config, last.values);
    final written = Map<String, Object?>.of(last.values);
    try {
      for (final key in siloUserConfigurationKeys) {
        if (_same(before[key], after[key])) continue;
        await _dio.put<dynamic>(
          '/api/v2/settings/values/${Uri.encodeComponent(key)}',
          queryParameters: const {'scope': 'profile'},
          data: {'value': after[key]},
        );
        written[key] = after[key];
      }
    } finally {
      onConfigurationUpdated?.call();
      // What was saved is the new baseline, even if a later key failed.
      final values = Map<String, Object?>.unmodifiable(written);
      _lastRead = (
        profileId: profileId,
        values: values,
        config: UserConfiguration.fromJson(
          siloSettingsToUserConfiguration(values),
        ),
      );
    }
  }

  /// The last settings read or written, for the acting profile, so an update
  /// writes only what changed.
  ({String profileId, Map<String, Object?> values, UserConfiguration config})?
  _lastRead;

  Future<Map<String, Object?>> _readSettings() async {
    final response = await _dio.get<dynamic>(
      '/api/v2/settings/values/effective',
      queryParameters: const {'keys': siloUserConfigurationKeys},
      options: Options(listFormat: ListFormat.multi),
    );
    final items = asJsonMap(response.data)?['items'];
    if (items is! List) {
      throw FormatException(
        'Expected settings from Silo, got ${response.data.runtimeType}',
      );
    }
    return Map.unmodifiable({
      for (final item in items)
        if (asJsonMap(item) case final setting?)
          if (setting['key'] case final String key) key: setting['value'],
    });
  }

  /// The settings routes require `X-Profile-Id`. Without one Silo answers
  /// 422, so say why instead.
  String _requireProfile(String member) =>
      _profileId() ??
      (throw StateError(
        'Silo UsersApi.$member needs a profile; set profileId first',
      ));

  static Map<String, Object?> _toSilo(
    UserConfiguration c,
    Map<String, Object?> current,
  ) => userConfigurationToSiloSettings(
    orderedViews: c.orderedViews,
    myMediaExcludes: c.myMediaExcludes,
    enableNextEpisodeAutoPlay: c.enableNextEpisodeAutoPlay,
    audioLanguagePreference: c.audioLanguagePreference,
    subtitleLanguagePreference: c.subtitleLanguagePreference,
    subtitleMode: c.subtitleMode,
    current: current,
  );

  static bool _same(Object? a, Object? b) {
    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (var i = 0; i < a.length; i++) {
        if (a[i] != b[i]) return false;
      }
      return true;
    }
    return a == b;
  }
}
