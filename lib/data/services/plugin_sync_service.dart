import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../data/repositories/seerr_repository.dart';
import 'storage_path_service.dart';
import '../../ui/widgets/navigation_layout.dart';
import '../../preference/home_section_config.dart';
import '../../preference/preference_constants.dart' as prefs;
import '../../preference/seerr_preferences.dart';
import '../../preference/seerr_row_config.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';

enum _PluginAvailabilityStatus { available, unavailable, unknown }

class PluginSyncService extends ChangeNotifier {
  static const List<String> supportedProfiles = <String>[
    'global',
    'desktop',
    'mobile',
    'tv',
  ];

  final UserPreferences _prefs;
  final PreferenceStore _store;
  final Dio _dio;

  SeerrPreferences get _seerrPrefs => GetIt.instance<SeerrPreferences>();

  bool _pluginAvailable = false;
  bool get pluginAvailable => _pluginAvailable;

  String? _pluginVersion;
  String? get pluginVersion => _pluginVersion;

  String? _selectedCustomizationProfile;

  String? _seerrUrl;
  String? get seerrUrl => _seerrUrl;
  bool _seerrEnabled = false;
  bool get seerrEnabled => _seerrEnabled;
  bool _seerrInfoAvailable = false;
  bool get seerrInfoAvailable => _seerrInfoAvailable;

  bool _mdblistAvailable = false;
  bool get mdblistAvailable => _mdblistAvailable;
  bool _tmdbAvailable = false;
  bool get tmdbAvailable => _tmdbAvailable;
  String? _activeThemeCacheServerId;
  void Function(String message)? onAdminMessage;
  CancelToken? _settingsStreamCancelToken;
  StreamSubscription<String>? _settingsStreamSubscription;
  bool _settingsStreamReconnectPending = false;
  int _settingsStreamReconnectAttempt = 0;

  PluginSyncService(this._prefs, this._store) : _dio = Dio() {
    configureServerDio(_dio);
    _dio.interceptors.add(redirectInterceptor(_dio));
  }

  String _serverSyncKey(MediaServerClient client, {String? serverId}) {
    if (serverId != null && serverId.trim().isNotEmpty) {
      return serverId.trim();
    }
    final normalized = client.baseUrl.toLowerCase().trim();
    return normalized.replaceAll(RegExp(r'[^a-z0-9]+'), '_');
  }

  Map<String, String>? _authHeaders(MediaServerClient client) {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return null;

    return {
      'Authorization': buildServerAuthorizationHeader(
        scheme: 'MediaBrowser',
        deviceInfo: client.deviceInfo,
        accessToken: token,
      ),
    };
  }

  dynamic _readValue(Map<String, dynamic> data, String key) {
    if (data.containsKey(key)) {
      return data[key];
    }

    if (key.isNotEmpty) {
      final pascal = '${key[0].toUpperCase()}${key.substring(1)}';
      if (data.containsKey(pascal)) {
        return data[pascal];
      }
    }

    return null;
  }

  bool? _readBool(Map<String, dynamic> data, String key) {
    final value = _readValue(data, key);
    return value is bool ? value : null;
  }

  String? _readString(Map<String, dynamic> data, String key) {
    final value = _readValue(data, key);
    return value is String ? value : null;
  }

  void resetState({bool notify = true, bool stopStream = true}) {
    if (stopStream) {
      _stopSettingsStream();
    }
    _pluginAvailable = false;
    _pluginVersion = null;
    _seerrUrl = null;
    _seerrEnabled = false;
    _seerrInfoAvailable = false;
    _mdblistAvailable = false;
    _tmdbAvailable = false;
    _activeThemeCacheServerId = null;
    if (notify) {
      _setLocalSeerrEnabled(false);
    }
    if (notify) {
      notifyListeners();
    }
  }

  void _setLocalSeerrEnabled(bool enabled) {
    if (_prefs.get(UserPreferences.seerrEnabled) == enabled) {
      return;
    }
    _store.set(UserPreferences.seerrEnabled, enabled);
    _prefs.notifyPreferenceChanged();
  }

  Future<_PluginAvailabilityStatus> _refreshAvailabilityStatus(
    MediaServerClient client,
  ) async {
    resetState(notify: false, stopStream: false);

    try {
      final pingResult = await _ping(client);
      if (pingResult == null) {
        _stopSettingsStream();
        _setLocalSeerrEnabled(false);
        notifyListeners();
        return _PluginAvailabilityStatus.unknown;
      }

      final installed = _readBool(pingResult, 'installed');
      if (installed != null && !installed) {
        _stopSettingsStream();
        _setLocalSeerrEnabled(false);
        notifyListeners();
        return _PluginAvailabilityStatus.unavailable;
      }

      final syncEnabled = _readBool(pingResult, 'settingsSyncEnabled');
      if (syncEnabled != null && !syncEnabled) {
        _stopSettingsStream();
        _setLocalSeerrEnabled(false);
        notifyListeners();
        return _PluginAvailabilityStatus.unavailable;
      }

      _pluginAvailable = true;
      _pluginVersion = _readString(pingResult, 'version');
      _seerrUrl = _readString(pingResult, 'jellyseerrUrl');
      _seerrEnabled = _readBool(pingResult, 'jellyseerrEnabled') ?? false;
      _mdblistAvailable = _readBool(pingResult, 'mdblistAvailable') ?? false;
      _tmdbAvailable = _readBool(pingResult, 'tmdbAvailable') ?? false;

      final seerrConfig = await _fetchJellyseerrConfig(client);
      if (seerrConfig != null) {
        _seerrInfoAvailable = true;
        _seerrUrl = _readString(seerrConfig, 'url') ?? _seerrUrl;

        final enabled = _readBool(seerrConfig, 'enabled');
        final userEnabled = _readBool(seerrConfig, 'userEnabled');
        _seerrEnabled = (enabled ?? _seerrEnabled) && (userEnabled ?? true);

        final variant = _readString(seerrConfig, 'variant');
        if (variant != null && variant.trim().isNotEmpty) {
          await _seerrPrefs.setMoonfinVariant(variant);
        }

        final displayName = _readString(seerrConfig, 'displayName');
        if (displayName != null && displayName.trim().isNotEmpty) {
          await _seerrPrefs.setMoonfinDisplayName(displayName);
        }
      }

      _setLocalSeerrEnabled(_seerrEnabled);

      notifyListeners();
      return _PluginAvailabilityStatus.available;
    } catch (_) {
      resetState();
      return _PluginAvailabilityStatus.unknown;
    }
  }

  Future<bool> refreshAvailability(MediaServerClient client) async {
    final status = await _refreshAvailabilityStatus(client);
    return status == _PluginAvailabilityStatus.available;
  }

  String get _profileName {
    if (PlatformDetection.isTV) return 'tv';
    if (PlatformDetection.useMobileUi) return 'mobile';
    return 'desktop';
  }

  String get currentDeviceProfile => _profileName;
  String get selectedCustomizationProfile =>
      _selectedCustomizationProfile ?? _profileName;

  bool isSyncInitializedForServer(
    MediaServerClient client, {
    String? serverId,
  }) {
    final syncInitializedPref = UserPreferences.pluginSyncInitializedForServer(
      _serverSyncKey(client, serverId: serverId),
    );
    return _prefs.get(syncInitializedPref);
  }

  void setSelectedCustomizationProfile(String profile) {
    if (!supportedProfiles.contains(profile)) return;
    if (_selectedCustomizationProfile == profile) return;
    _selectedCustomizationProfile = profile;
    notifyListeners();
  }

  Future<void> syncOnLogin(MediaServerClient client, {String? serverId}) async {
    try {
      _activeThemeCacheServerId = serverId;
      await _hydrateCachedThemes(client, serverId: serverId);

      final availability = await _refreshAvailabilityStatus(client);

      final syncInitializedPref =
          UserPreferences.pluginSyncInitializedForServer(
            _serverSyncKey(client, serverId: serverId),
          );
      if (_prefs.get(syncInitializedPref)) {
        if (_prefs.get(UserPreferences.pluginSyncEnabled) &&
            availability == _PluginAvailabilityStatus.available) {
          await _refreshCustomThemes(client, serverId: serverId);

          final resolved = await _fetchResolvedProfile(client, _profileName);
          if (resolved != null) {
            await _applyServerSettings(resolved);
          }

          await _startSettingsStream(client);
        }
        return;
      }

      if (availability == _PluginAvailabilityStatus.unknown) {
        return;
      }

      if (availability != _PluginAvailabilityStatus.available) {
        await _prefs.set(syncInitializedPref, true);
        await _applyFallbackHomeRows();
        return;
      }

      await _refreshCustomThemes(client, serverId: serverId);

      final resolved = await _fetchResolvedProfile(client, _profileName);
      if (resolved == null) {
        // Keep initialization pending so a later login can retry profile pull.
        return;
      }

      await _prefs.set(UserPreferences.pluginSyncEnabled, true);

      await _applyServerSettings(resolved);
      await _prefs.set(syncInitializedPref, true);
      await _startSettingsStream(client);
    } catch (_) {
      resetState();
    }
  }

  void _stopSettingsStream() {
    _settingsStreamReconnectPending = false;
    _settingsStreamReconnectAttempt = 0;

    final cancelToken = _settingsStreamCancelToken;
    _settingsStreamCancelToken = null;
    cancelToken?.cancel('settings stream stopped');

    final subscription = _settingsStreamSubscription;
    _settingsStreamSubscription = null;
    if (subscription != null) {
      unawaited(subscription.cancel());
    }
  }

  void _scheduleSettingsStreamReconnect(MediaServerClient client) {
    if (_settingsStreamReconnectPending) {
      return;
    }

    final exponent = _settingsStreamReconnectAttempt < 6
        ? _settingsStreamReconnectAttempt
        : 6;
    var delayMs = 1000 * (1 << exponent);
    if (delayMs > 30000) {
      delayMs = 30000;
    }
    if (_settingsStreamReconnectAttempt < 6) {
      _settingsStreamReconnectAttempt += 1;
    }

    _settingsStreamReconnectPending = true;
    unawaited(
      Future<void>.delayed(Duration(milliseconds: delayMs), () async {
        _settingsStreamReconnectPending = false;

        final cancelToken = _settingsStreamCancelToken;
        if (cancelToken == null || cancelToken.isCancelled) {
          return;
        }

        if (!_pluginAvailable ||
            !_prefs.get(UserPreferences.pluginSyncEnabled)) {
          return;
        }

        await _startSettingsStream(client);
      }),
    );
  }

  Future<void> _handleSettingsStreamEvent(
    MediaServerClient client,
    String payload,
  ) async {
    try {
      final parsed = jsonDecode(payload);
      if (parsed is! Map<String, dynamic>) {
        return;
      }

      if (parsed['type'] == 'adminMessage') {
        final text = parsed['text'];
        if (text is String) {
          final trimmed = text.trim();
          if (trimmed.isNotEmpty) {
            onAdminMessage?.call(trimmed);
          }
        }
        return;
      }

      if (parsed['type'] == 'themesChanged') {
        await _refreshCustomThemes(client);
        notifyListeners();
        return;
      }

      if (parsed['type'] != 'settingsUpdated') {
        return;
      }

      final resolved = await _fetchResolvedProfile(client, _profileName);
      if (resolved == null) {
        return;
      }

      await _applyServerSettings(resolved);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _startSettingsStream(MediaServerClient client) async {
    if (!_pluginAvailable || !_prefs.get(UserPreferences.pluginSyncEnabled)) {
      return;
    }

    final headers = _authHeaders(client);
    if (headers == null) {
      return;
    }

    _stopSettingsStream();

    final cancelToken = CancelToken();
    _settingsStreamCancelToken = cancelToken;

    try {
      final response = await _dio.get<ResponseBody>(
        '${client.baseUrl}/Moonfin/Settings/Stream',
        options: Options(headers: headers, responseType: ResponseType.stream),
        cancelToken: cancelToken,
      );

      final body = response.data;
      if (body == null) {
        if (!cancelToken.isCancelled) {
          _scheduleSettingsStreamReconnect(client);
        }
        return;
      }

      _settingsStreamReconnectAttempt = 0;

      _settingsStreamSubscription = body.stream
          .cast<List<int>>()
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen(
            (line) {
              if (!line.startsWith('data:')) {
                return;
              }

              final payload = line.substring(5).trim();
              if (payload.isEmpty) {
                return;
              }

              unawaited(_handleSettingsStreamEvent(client, payload));
            },
            onError: (_) {
              if (!cancelToken.isCancelled) {
                _scheduleSettingsStreamReconnect(client);
              }
            },
            onDone: () {
              if (!cancelToken.isCancelled) {
                _scheduleSettingsStreamReconnect(client);
              }
            },
            cancelOnError: false,
          );
    } catch (_) {
      if (!cancelToken.isCancelled) {
        _scheduleSettingsStreamReconnect(client);
      }
    }
  }

  Future<void> configureSeerr(
    MediaServerClient client, {
    String? username,
    String? password,
  }) async {
    if (!_pluginAvailable) return;

    final token = client.accessToken;
    if (token == null || token.isEmpty) return;

    try {
      final seerrRepo = await GetIt.instance.getAsync<SeerrRepository>();
      final status = await seerrRepo.configureWithMoonfin(
        jellyfinBaseUrl: client.baseUrl,
        jellyfinToken: token,
      );

      if (!status.authenticated &&
          status.enabled &&
          username != null &&
          username.isNotEmpty &&
          password != null &&
          password.isNotEmpty) {
        await seerrRepo.loginWithMoonfin(
          username: username,
          password: password,
        );
      }
    } catch (_) {}
  }

  Future<void> pushSettings(MediaServerClient client) async {
    await pushSettingsForProfile(client, profile: selectedCustomizationProfile);
  }

  Future<void> pushSettingsForProfile(
    MediaServerClient client, {
    required String profile,
  }) async {
    if (!_pluginAvailable) return;
    if (!_prefs.get(UserPreferences.pluginSyncEnabled)) return;

    if (!supportedProfiles.contains(profile)) return;

    try {
      final payloadProfile = _buildProfileFromLocal();
      final headers = _authHeaders(client);
      if (headers == null) return;

      await _dio.post(
        '${client.baseUrl}/Moonfin/Settings/Profile/$profile',
        data: {'profile': payloadProfile, 'clientId': 'moonfin-flutter'},
        options: Options(
          headers: {...headers, 'Content-Type': 'application/json'},
        ),
      );
    } catch (_) {}
  }

  Future<bool> pullSettingsForProfile(
    MediaServerClient client, {
    required String profile,
  }) async {
    if (!supportedProfiles.contains(profile)) return false;
    if (!_pluginAvailable) return false;

    await _refreshCustomThemes(client);

    final resolved = await _fetchResolvedProfile(client, profile);
    if (resolved == null) {
      return false;
    }

    _applyServerSettings(resolved);
    return true;
  }

  Future<Map<String, dynamic>?> _ping(MediaServerClient client) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get(
        '${client.baseUrl}/Moonfin/Ping',
        options: Options(headers: headers),
      );
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
    } catch (_) {}
    return null;
  }

  Future<Map<String, dynamic>?> _fetchJellyseerrConfig(
    MediaServerClient client,
  ) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get(
        '${client.baseUrl}/Moonfin/Jellyseerr/Config',
        options: Options(headers: headers),
      );
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
    } catch (_) {}
    return null;
  }

  Future<Map<String, dynamic>?> _fetchResolvedProfile(
    MediaServerClient client,
    String profile,
  ) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get(
        '${client.baseUrl}/Moonfin/Settings/Resolved/$profile',
        options: Options(headers: headers),
      );
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
    } catch (_) {}
    return null;
  }

  Future<dynamic> _fetchThemesPayload(MediaServerClient client) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get(
        '${client.baseUrl}/Moonfin/Themes',
        options: Options(headers: headers),
      );
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Iterable<dynamic> _extractThemeObjects(dynamic payload) {
    if (payload is List) {
      return payload;
    }
    if (payload is Map) {
      final map = payload.cast<String, dynamic>();
      final themes = map['themes'];
      if (themes is List) {
        return themes;
      }
      final items = map['items'];
      if (items is List) {
        return items;
      }
      final values = map.values.whereType<Map>().toList();
      if (values.isNotEmpty) {
        return values;
      }
    }
    return const [];
  }

  String _sanitizeThemeCacheFileNameStem(String id) {
    final trimmed = id.trim().toLowerCase();
    final sanitized = trimmed.replaceAll(RegExp(r'[^a-z0-9_-]+'), '_');
    return sanitized.isEmpty ? 'theme' : sanitized;
  }

  Future<Directory?> _getThemeCacheDirectory(
    MediaServerClient client, {
    String? serverId,
  }) async {
    try {
      final baseDirectory = await GetIt.instance<StoragePathService>()
          .getThemeCacheDir();
      final effectiveServerId = serverId ?? _activeThemeCacheServerId;
      final scopedDirectory = Directory(
        '${baseDirectory.path}/${_serverSyncKey(client, serverId: effectiveServerId)}',
      );
      if (!await scopedDirectory.exists()) {
        await scopedDirectory.create(recursive: true);
      }
      return scopedDirectory;
    } catch (_) {
      return null;
    }
  }

  Future<List<ThemeSpec>> _loadCachedCustomThemes(
    Directory cacheDirectory,
  ) async {
    final specs = <ThemeSpec>[];
    if (!await cacheDirectory.exists()) {
      return specs;
    }

    final files =
        cacheDirectory
            .listSync()
            .whereType<File>()
            .where((file) => file.path.toLowerCase().endsWith('.json'))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    for (final file in files) {
      try {
        final raw = await file.readAsString();
        final decoded = jsonDecode(raw);
        if (decoded is! Map) {
          continue;
        }

        specs.add(ThemeSpec.fromJson(Map<String, dynamic>.from(decoded)));
      } catch (_) {}
    }

    return specs;
  }

  Future<void> _writeCachedCustomThemes(
    Directory cacheDirectory,
    List<ThemeSpec> specs,
  ) async {
    if (!await cacheDirectory.exists()) {
      await cacheDirectory.create(recursive: true);
    }

    final desiredFileNames = <String>{};
    const encoder = JsonEncoder.withIndent('  ');

    for (final spec in specs) {
      final fileName = '${_sanitizeThemeCacheFileNameStem(spec.id)}.json';
      desiredFileNames.add(fileName);

      final file = File('${cacheDirectory.path}/$fileName');
      final json = encoder.convert(spec.toJson());
      await file.writeAsString(json);
    }

    final existingFiles = cacheDirectory.listSync().whereType<File>().where(
      (file) => file.path.toLowerCase().endsWith('.json'),
    );

    for (final file in existingFiles) {
      final fileName = file.uri.pathSegments.isNotEmpty
          ? file.uri.pathSegments.last
          : '';
      if (!desiredFileNames.contains(fileName)) {
        try {
          await file.delete();
        } catch (_) {}
      }
    }
  }

  void _clearMissingCustomThemeSelection() {
    final customThemeId = _prefs.get(UserPreferences.customThemeId);
    if (customThemeId.isNotEmpty &&
        !ThemeRegistry.availableThemes.containsKey(customThemeId)) {
      _store.set(UserPreferences.customThemeId, '');
      _prefs.notifyPreferenceChanged();
    }
  }

  Future<Directory?> _hydrateCachedThemes(
    MediaServerClient client, {
    String? serverId,
  }) async {
    final cacheDirectory = await _getThemeCacheDirectory(
      client,
      serverId: serverId,
    );

    if (cacheDirectory == null) {
      return null;
    }

    final cachedSpecs = await _loadCachedCustomThemes(cacheDirectory);
    ThemeRegistry.replaceCustomThemes(cachedSpecs);
    return cacheDirectory;
  }

  Future<void> _refreshCustomThemes(
    MediaServerClient client, {
    String? serverId,
  }) async {
    final cacheDirectory = await _hydrateCachedThemes(
      client,
      serverId: serverId,
    );

    final payload = await _fetchThemesPayload(client);
    if (payload == null) {
      _clearMissingCustomThemeSelection();
      return;
    }

    final objects = _extractThemeObjects(payload);
    final specs = <ThemeSpec>[];

    for (final entry in objects) {
      if (entry is! Map) continue;
      try {
        specs.add(ThemeSpec.fromJson(Map<String, dynamic>.from(entry)));
      } catch (_) {}
    }

    ThemeRegistry.replaceCustomThemes(specs);

    if (cacheDirectory != null) {
      try {
        await _writeCachedCustomThemes(cacheDirectory, specs);
      } catch (_) {}
    }

    _clearMissingCustomThemeSelection();
  }

  Future<void> _applyServerSettings(Map<String, dynamic> resolved) async {
    _applyString(
      resolved,
      'visualTheme',
      UserPreferences.visualTheme,
      enumValues: prefs.VisualThemeId.values,
    );
    _applyString(resolved, 'customThemeId', UserPreferences.customThemeId);
    _applyString(
      resolved,
      'navbarPosition',
      UserPreferences.navbarPosition,
      enumValues: NavigationLayout.availableNavbarPositions,
    );
    _applyString(
      resolved,
      'focusColor',
      UserPreferences.focusColor,
      enumValues: prefs.AppTheme.values,
    );
    _applyString(
      resolved,
      'watchedIndicator',
      UserPreferences.watchedIndicatorBehavior,
      enumValues: prefs.WatchedIndicatorBehavior.values,
    );
    _applyBool(
      resolved,
      'cardFocusExpansion',
      UserPreferences.cardFocusExpansion,
    );
    _applyString(
      resolved,
      'homeRowsStyle',
      UserPreferences.homeRowsStyle,
      enumValues: prefs.HomeRowsStyle.values,
    );
    _applyString(
      resolved,
      'homeImageTypeContinueWatching',
      UserPreferences.homeRowImageType(prefs.HomeSectionType.resume),
      enumValues: prefs.ImageType.values,
    );
    _applyString(
      resolved,
      'posterSize',
      UserPreferences.posterSize,
      enumValues: prefs.PosterSize.values,
    );
    _applyBool(
      resolved,
      'displayFavoritesRows',
      UserPreferences.displayFavoritesRows,
    );
    _applyBool(
      resolved,
      'displayCollectionsRows',
      UserPreferences.displayCollectionsRows,
    );
    _applyBool(
      resolved,
      'displayGenresRows',
      UserPreferences.displayGenresRows,
    );
    _applyString(
      resolved,
      'favoritesRowSortBy',
      UserPreferences.favoritesRowSortBy,
      enumValues: prefs.LibrarySortBy.values,
    );
    _applyString(
      resolved,
      'collectionsRowSortBy',
      UserPreferences.collectionsRowSortBy,
      enumValues: prefs.LibrarySortBy.values,
    );
    _applyString(
      resolved,
      'genresRowSortBy',
      UserPreferences.genresRowSortBy,
      enumValues: prefs.LibrarySortBy.values,
    );
    _applyString(
      resolved,
      'genresRowItemFilter',
      UserPreferences.genresRowItemFilter,
      enumValues: prefs.GenresRowItemFilter.values,
    );
    _applyBool(
      resolved,
      'showShuffleButton',
      UserPreferences.showShuffleButton,
    );
    _applyBool(resolved, 'showGenresButton', UserPreferences.showGenresButton);
    _applyBool(
      resolved,
      'showFavoritesButton',
      UserPreferences.showFavoritesButton,
    );
    _applyBool(
      resolved,
      'showSyncPlayButton',
      UserPreferences.showSyncPlayButton,
    );
    _applyBool(
      resolved,
      'showLibrariesInToolbar',
      UserPreferences.showLibrariesInToolbar,
    );
    _applyString(
      resolved,
      'shuffleContentType',
      UserPreferences.shuffleContentType,
    );
    _applyBool(
      resolved,
      'mergeContinueWatchingNextUp',
      UserPreferences.mergeContinueWatchingNextUp,
    );
    _applyBool(
      resolved,
      'enableMultiServerLibraries',
      UserPreferences.enableMultiServerLibraries,
    );
    _applyBool(resolved, 'enableFolderView', UserPreferences.enableFolderView);
    _applyString(
      resolved,
      'seasonalSurprise',
      UserPreferences.seasonalSurprise,
    );

    _applyMediaBarMode(resolved);
    _applyString(
      resolved,
      'mediaBarSourceType',
      UserPreferences.mediaBarContentType,
    );
    _applyInt(resolved, 'mediaBarItemCount', UserPreferences.mediaBarItemCount);
    _applyInt(
      resolved,
      'mediaBarOpacity',
      UserPreferences.mediaBarOverlayOpacity,
    );
    _applyString(
      resolved,
      'mediaBarOverlayColor',
      UserPreferences.mediaBarOverlayColor,
    );
    _applyInt(resolved, 'navbarOpacity', UserPreferences.navbarOpacity);
    _applyString(resolved, 'navbarColor', UserPreferences.navbarColor);
    _applyBool(
      resolved,
      'mediaBarAutoAdvance',
      UserPreferences.mediaBarAutoAdvance,
    );
    _applyInt(
      resolved,
      'mediaBarIntervalMs',
      UserPreferences.mediaBarIntervalMs,
    );
    _applyBool(
      resolved,
      'mediaBarTrailerPreview',
      UserPreferences.mediaBarTrailerPreview,
    );
    _applyBool(
      resolved,
      'mediaBarTrailerAudio',
      UserPreferences.mediaBarTrailerAudio,
    );
    _applyBool(
      resolved,
      'episodePreviewEnabled',
      UserPreferences.episodePreviewEnabled,
    );
    _applyBool(
      resolved,
      'previewAudioEnabled',
      UserPreferences.previewAudioEnabled,
    );

    _applyStringList(
      resolved,
      'mediaBarLibraryIds',
      UserPreferences.mediaBarLibraryIds,
    );
    _applyStringList(
      resolved,
      'mediaBarCollectionIds',
      UserPreferences.mediaBarCollectionIds,
    );
    _applyStringList(
      resolved,
      'mediaBarExcludedGenres',
      UserPreferences.mediaBarExcludedGenres,
    );

    _applyBool(
      resolved,
      'themeMusicEnabled',
      UserPreferences.themeMusicEnabled,
    );
    _applyInt(resolved, 'themeMusicVolume', UserPreferences.themeMusicVolume);
    _applyBool(
      resolved,
      'themeMusicOnHomeRows',
      UserPreferences.themeMusicOnHomeRows,
    );

    _applyBool(
      resolved,
      'homeRowsImageTypeOverride',
      UserPreferences.homeRowsUniversalOverride,
    );
    _applyString(
      resolved,
      'homeRowsImageType',
      UserPreferences.homeRowsUniversalImageType,
      enumValues: prefs.ImageType.values,
    );
    _applyBool(
      resolved,
      'homeImageUseSeriesImage',
      UserPreferences.seriesThumbnailsEnabled,
    );

    _applyBool(resolved, 'backdropEnabled', UserPreferences.backdropEnabled);
    _applyString(
      resolved,
      'detailsScreenBlur',
      UserPreferences.detailsBackgroundBlurAmount,
      intFromString: true,
    );
    _applyString(
      resolved,
      'browsingBlur',
      UserPreferences.browsingBackgroundBlurAmount,
      intFromString: true,
    );

    _applyBool(
      resolved,
      'mdblistEnabled',
      UserPreferences.enableAdditionalRatings,
    );
    _applyString(resolved, 'mdblistApiKey', UserPreferences.mdblistApiKey);
    _applyBool(
      resolved,
      'mdblistShowRatingNames',
      UserPreferences.showRatingLabels,
    );
    _applyBool(
      resolved,
      'mdblistShowRatingBadges',
      UserPreferences.showRatingBadges,
    );
    _applyBool(
      resolved,
      'tmdbEpisodeRatingsEnabled',
      UserPreferences.enableEpisodeRatings,
    );
    _applyString(resolved, 'tmdbApiKey', UserPreferences.tmdbApiKey);

    _applyBool(resolved, 'jellyseerrEnabled', UserPreferences.seerrEnabled);
    _applyBool(
      resolved,
      'jellyseerrBlockNsfw',
      UserPreferences.jellyseerrBlockNsfw,
    );

    if (resolved['mdblistRatingSources'] is List) {
      final sources = (resolved['mdblistRatingSources'] as List)
          .cast<String>()
          .join(',');
      _store.set(UserPreferences.enabledRatings, sources);
    }

    if (resolved['homeRowOrder'] is List) {
      final serverOrder = (resolved['homeRowOrder'] as List).cast<String>();
      // Preserve any plugin-discovered dynamic sections so they survive a
      // server-driven preference sync.
      final pluginEntries = _prefs.homeSectionsConfig
          .where((c) => c.isPluginDynamic)
          .toList(growable: false);
      if (serverOrder.isEmpty) {
        await _applyFallbackHomeRows(preserve: pluginEntries);
      } else {
        final sections = <HomeSectionConfig>[];
        var order = 0;
        for (final name in serverOrder) {
          final type = prefs.HomeSectionType.fromSerialized(name);
          if (type == prefs.HomeSectionType.none) continue;
          sections.add(
            HomeSectionConfig(type: type, enabled: true, order: order++),
          );
        }
        if (sections.isEmpty) {
          await _applyFallbackHomeRows(preserve: pluginEntries);
        } else {
          final enabledTypes = sections.map((s) => s.type).toSet();
          for (final type in prefs.HomeSectionType.values) {
            if (type == prefs.HomeSectionType.none) continue;
            if (!enabledTypes.contains(type)) {
              sections.add(
                HomeSectionConfig(type: type, enabled: false, order: order++),
              );
            }
          }
          for (final entry in pluginEntries) {
            sections.add(entry.copyWith(order: order++));
          }
          await _prefs.setHomeSectionsConfig(sections);
        }
      }
    }

    if (resolved['jellyseerrRows'] is Map<String, dynamic>) {
      final rowsData = resolved['jellyseerrRows'] as Map<String, dynamic>;
      if (rowsData['rowOrder'] is List) {
        final serverOrder = (rowsData['rowOrder'] as List).cast<String>();
        if (serverOrder.isNotEmpty) {
          final configs = <SeerrRowConfig>[];
          var order = 0;
          for (final name in serverOrder) {
            final type = prefs.SeerrRowType.fromSerialized(name);
            configs.add(
              SeerrRowConfig(type: type, enabled: true, order: order++),
            );
          }
          final enabledTypes = configs.map((c) => c.type).toSet();
          for (final type in prefs.SeerrRowType.values) {
            if (!enabledTypes.contains(type)) {
              configs.add(
                SeerrRowConfig(type: type, enabled: false, order: order++),
              );
            }
          }
          await _seerrPrefs.setRowsConfig(configs);
        }
      }
    }

    _prefs.notifyPreferenceChanged();

    final currentNavbarPos = _prefs.get(UserPreferences.navbarPosition);
    final navbarPos = NavigationLayout.sanitizeNavbarPosition(currentNavbarPos);
    if (currentNavbarPos != navbarPos) {
      await _prefs.set(UserPreferences.navbarPosition, navbarPos);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      NavigationLayout.positionNotifier.value = navbarPos;
    });
  }

  Future<void> _applyFallbackHomeRows({
    List<HomeSectionConfig> preserve = const [],
  }) async {
    const fallbackEnabled = <prefs.HomeSectionType>[
      prefs.HomeSectionType.resume,
      prefs.HomeSectionType.nextUp,
      prefs.HomeSectionType.latestMedia,
    ];

    final sections = <HomeSectionConfig>[];
    var order = 0;

    for (final type in fallbackEnabled) {
      sections.add(
        HomeSectionConfig(type: type, enabled: true, order: order++),
      );
    }

    for (final type in prefs.HomeSectionType.values) {
      if (type == prefs.HomeSectionType.none ||
          fallbackEnabled.contains(type)) {
        continue;
      }
      sections.add(
        HomeSectionConfig(type: type, enabled: false, order: order++),
      );
    }

    for (final entry in preserve) {
      sections.add(entry.copyWith(order: order++));
    }

    await _prefs.setHomeSectionsConfig(sections);
  }

  void _applyBool(
    Map<String, dynamic> data,
    String serverKey,
    Preference<bool> pref,
  ) {
    final value = data[serverKey];
    if (value is bool) {
      _store.set(pref, value);
    }
  }

  void _applyInt(
    Map<String, dynamic> data,
    String serverKey,
    Preference<dynamic> pref,
  ) {
    final value = data[serverKey];
    if (value is int) {
      if (pref.defaultValue is String) {
        _store.set(pref as Preference<String>, value.toString());
      } else {
        _store.set(pref as Preference<int>, value);
      }
    }
  }

  void _applyString<T>(
    Map<String, dynamic> data,
    String serverKey,
    Preference<T> pref, {
    List<Enum>? enumValues,
    bool intFromString = false,
  }) {
    final value = data[serverKey];
    if (value == null) return;

    if (intFromString && value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) {
        _store.set(pref as Preference<int>, parsed);
      }
      return;
    }

    if (enumValues != null && pref is EnumPreference) {
      if (value is String) {
        final match = enumValues.cast<Enum>().where(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
        );
        if (match.isNotEmpty) {
          _store.set(pref, match.first as T);
        }
      }
      return;
    }

    if (value is String) {
      _store.set(pref as Preference<String>, value);
    }
  }

  void _applyStringList(
    Map<String, dynamic> data,
    String serverKey,
    Preference<String> pref,
  ) {
    final value = data[serverKey];
    if (value is List) {
      _store.set(pref, value.cast<String>().join(','));
    }
  }

  void _applyMediaBarMode(Map<String, dynamic> data) {
    final modeFromServer = _readString(data, 'mediaBarMode');
    if (modeFromServer != null && modeFromServer.trim().isNotEmpty) {
      final normalized = UserPreferences.normalizeMediaBarMode(modeFromServer);
      _store.set(UserPreferences.mediaBarMode, normalized);
      _store.set(
        UserPreferences.mediaBarEnabled,
        UserPreferences.isMediaBarModeEnabled(normalized),
      );
      return;
    }

    final legacyEnabled = _readBool(data, 'mediaBarEnabled');
    if (legacyEnabled != null) {
      _store.set(UserPreferences.mediaBarEnabled, legacyEnabled);
      _store.set(
        UserPreferences.mediaBarMode,
        legacyEnabled
            ? UserPreferences.mediaBarModeMoonfin
            : UserPreferences.mediaBarModeOff,
      );
    }
  }

  List<String> _csvToList(Preference<String> pref) {
    return _prefs.get(pref).split(',').where((s) => s.isNotEmpty).toList();
  }

  Map<String, dynamic> _buildProfileFromLocal() {
    final mediaBarMode = UserPreferences.normalizeMediaBarMode(
      _prefs.get(UserPreferences.mediaBarMode),
    );
    final mediaBarEnabled = UserPreferences.isMediaBarModeEnabled(mediaBarMode);
    return {
      'visualTheme': _prefs.get(UserPreferences.visualTheme).name,
      'customThemeId': _prefs.get(UserPreferences.customThemeId),
      'navbarPosition': _prefs.get(UserPreferences.navbarPosition).name,
      'focusColor': _prefs.get(UserPreferences.focusColor).name,
      'watchedIndicator': _prefs
          .get(UserPreferences.watchedIndicatorBehavior)
          .name,
      'cardFocusExpansion': _prefs.get(UserPreferences.cardFocusExpansion),
      'homeRowsStyle': _prefs.get(UserPreferences.homeRowsStyle).name,
      'homeImageTypeContinueWatching': _prefs
          .get(UserPreferences.homeRowImageType(prefs.HomeSectionType.resume))
          .name,
      'posterSize': _prefs.get(UserPreferences.posterSize).name,
      'displayFavoritesRows': _prefs.get(UserPreferences.displayFavoritesRows),
      'displayCollectionsRows': _prefs.get(
        UserPreferences.displayCollectionsRows,
      ),
      'displayGenresRows': _prefs.get(UserPreferences.displayGenresRows),
      'favoritesRowSortBy': _prefs.get(UserPreferences.favoritesRowSortBy).name,
      'collectionsRowSortBy': _prefs
          .get(UserPreferences.collectionsRowSortBy)
          .name,
      'genresRowSortBy': _prefs.get(UserPreferences.genresRowSortBy).name,
      'genresRowItemFilter': _prefs
          .get(UserPreferences.genresRowItemFilter)
          .name,
      'showShuffleButton': _prefs.get(UserPreferences.showShuffleButton),
      'showGenresButton': _prefs.get(UserPreferences.showGenresButton),
      'showFavoritesButton': _prefs.get(UserPreferences.showFavoritesButton),
      'showSyncPlayButton': _prefs.get(UserPreferences.showSyncPlayButton),
      'showLibrariesInToolbar': _prefs.get(
        UserPreferences.showLibrariesInToolbar,
      ),
      'shuffleContentType': _prefs.get(UserPreferences.shuffleContentType),
      'mergeContinueWatchingNextUp': _prefs.get(
        UserPreferences.mergeContinueWatchingNextUp,
      ),
      'enableMultiServerLibraries': _prefs.get(
        UserPreferences.enableMultiServerLibraries,
      ),
      'enableFolderView': _prefs.get(UserPreferences.enableFolderView),
      'seasonalSurprise': _prefs.get(UserPreferences.seasonalSurprise),
      'mediaBarEnabled': mediaBarEnabled,
      'mediaBarMode': mediaBarMode,
      'mediaBarSourceType': _prefs.get(UserPreferences.mediaBarContentType),
      'mediaBarItemCount':
          int.tryParse(_prefs.get(UserPreferences.mediaBarItemCount)) ?? 10,
      'mediaBarOpacity': _prefs.get(UserPreferences.mediaBarOverlayOpacity),
      'mediaBarOverlayColor': _prefs.get(UserPreferences.mediaBarOverlayColor),
      'navbarOpacity': _prefs.get(UserPreferences.navbarOpacity),
      'navbarColor': _prefs.get(UserPreferences.navbarColor),
      'mediaBarAutoAdvance': _prefs.get(UserPreferences.mediaBarAutoAdvance),
      'mediaBarIntervalMs': _prefs.get(UserPreferences.mediaBarIntervalMs),
      'mediaBarTrailerPreview': _prefs.get(
        UserPreferences.mediaBarTrailerPreview,
      ),
      'mediaBarTrailerAudio': _prefs.get(UserPreferences.mediaBarTrailerAudio),
      'episodePreviewEnabled': _prefs.get(
        UserPreferences.episodePreviewEnabled,
      ),
      'previewAudioEnabled': _prefs.get(UserPreferences.previewAudioEnabled),
      'mediaBarLibraryIds': _csvToList(UserPreferences.mediaBarLibraryIds),
      'mediaBarCollectionIds': _csvToList(
        UserPreferences.mediaBarCollectionIds,
      ),
      'mediaBarExcludedGenres': _csvToList(
        UserPreferences.mediaBarExcludedGenres,
      ),
      'themeMusicEnabled': _prefs.get(UserPreferences.themeMusicEnabled),
      'themeMusicVolume': _prefs.get(UserPreferences.themeMusicVolume),
      'themeMusicOnHomeRows': _prefs.get(UserPreferences.themeMusicOnHomeRows),
      'homeRowsImageTypeOverride': _prefs.get(
        UserPreferences.homeRowsUniversalOverride,
      ),
      'homeRowsImageType': _prefs
          .get(UserPreferences.homeRowsUniversalImageType)
          .name,
      'homeImageUseSeriesImage': _prefs.get(
        UserPreferences.seriesThumbnailsEnabled,
      ),
      'backdropEnabled': _prefs.get(UserPreferences.backdropEnabled),
      'detailsScreenBlur': _prefs
          .get(UserPreferences.detailsBackgroundBlurAmount)
          .toString(),
      'browsingBlur': _prefs
          .get(UserPreferences.browsingBackgroundBlurAmount)
          .toString(),
      'mdblistEnabled': _prefs.get(UserPreferences.enableAdditionalRatings),
      'mdblistApiKey': _prefs.get(UserPreferences.mdblistApiKey),
      'mdblistShowRatingNames': _prefs.get(UserPreferences.showRatingLabels),
      'mdblistShowRatingBadges': _prefs.get(UserPreferences.showRatingBadges),
      'tmdbEpisodeRatingsEnabled': _prefs.get(
        UserPreferences.enableEpisodeRatings,
      ),
      'tmdbApiKey': _prefs.get(UserPreferences.tmdbApiKey),
      'jellyseerrEnabled': _prefs.get(UserPreferences.seerrEnabled),
      'jellyseerrBlockNsfw': _prefs.get(UserPreferences.jellyseerrBlockNsfw),
      'mdblistRatingSources': _csvToList(UserPreferences.enabledRatings),
      'homeRowOrder': _prefs.homeSectionsConfig
          .where((c) => c.enabled)
          .map((c) => c.type.serializedName)
          .toList(),
      'jellyseerrRows': {
        'rowOrder': _seerrPrefs.activeRows
            .map((t) => t.serializedName)
            .toList(),
      },
    };
  }

  @override
  void dispose() {
    _stopSettingsStream();
    super.dispose();
  }
}
