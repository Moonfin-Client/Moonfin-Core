import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart' as pkg;
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../auth/store/authentication_store.dart';
import '../data/database/database_connection.dart';
import '../data/database/offline_database.dart';
import '../data/offline/offline_catalog.dart';
import '../data/repositories/offline_repository.dart';
import '../data/services/connectivity_service.dart';
import '../data/services/log_service.dart';
import '../data/services/media_server_client_factory.dart';
import '../data/services/recent_searches_store.dart';
import '../data/services/storage_path_service.dart';
import '../platform/web_runtime_config.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'modules/app_module.dart';
import 'modules/auth_module.dart';
import 'modules/server_module.dart';
import 'modules/playback_module.dart';
import 'modules/preference_module.dart';

final getIt = GetIt.instance;

const _legacyAudioBehaviorKey = 'audio_behavior';
const _legacyAudioBehaviorDownmixValue = 'downmixToStereo';
const _legacyAudioFallbackToStereoAacKey = 'audio_fallback_to_stereo_aac';
const _legacyAc3EnabledKey = 'pref_bitstream_ac3';
const _legacyTrueHdEnabledKey = 'pref_bitstream_truncated_hd';
const _legacyDtsEnabledKey = 'pref_bitstream_dts';

bool _legacyStereoAacFallbackDefaultForPlatform() {
  return !PlatformDetection.isAndroid || PlatformDetection.isTV;
}

String _clientName() {
  if (PlatformDetection.isAppleTV) return 'Moonfin for tvOS';
  if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
    return 'Moonfin for Android TV';
  }
  if (PlatformDetection.isWeb) {
    return webRuntimeConfig.pluginMode
        ? 'Moonfin for Web'
        : 'Moonfin on Github';
  }
  if (PlatformDetection.isAndroid) return 'Moonfin for Android';
  if (PlatformDetection.isIOS) return 'Moonfin for iOS';
  if (PlatformDetection.isMacOS) return 'Moonfin for macOS';
  if (PlatformDetection.isWindows) return 'Moonfin for Windows';
  if (PlatformDetection.isLinux) return 'Moonfin for Linux';
  return 'Moonfin';
}

String _joinNonEmpty(List<String?> parts, String separator) {
  return parts
      .whereType<String>()
      .map((part) => part.trim())
      .where((part) => part.isNotEmpty)
      .join(separator);
}

String _fallbackIfEmpty(String value, String fallback) {
  return value.trim().isEmpty ? fallback : value.trim();
}

String _resolveAndroidDeviceName(AndroidDeviceInfo info) {
  final manufacturer = info.manufacturer.trim();
  final model = info.model.trim();
  final brand = info.brand.trim();

  // Prefer the reported model first. On modern phones this is typically
  // the user-friendly marketing name, e.g. "Pixel 9 Pro XL".
  if (model.isNotEmpty && model.toLowerCase() != 'unknown') {
    final lowerModel = model.toLowerCase();
    final lowerManufacturer = manufacturer.toLowerCase();

    // Avoid repeating manufacturer when model already includes it.
    if (manufacturer.isNotEmpty && !lowerModel.startsWith(lowerManufacturer)) {
      return '$manufacturer $model';
    }

    return model;
  }

  // Fallback path for devices that do not expose a useful model string.
  final combined = _joinNonEmpty([
    manufacturer,
    brand,
    info.device,
    info.product,
  ], ' ');
  return _fallbackIfEmpty(combined, 'Android Device');
}

Future<String> _resolveDeviceName() async {
  if (PlatformDetection.isAppleTV) return 'Apple TV';
  final deviceInfo = DeviceInfoPlugin();

  try {
    if (PlatformDetection.isAndroid) {
      final info = await deviceInfo.androidInfo;
      final name = _resolveAndroidDeviceName(info);
      if (!info.isPhysicalDevice) {
        return '$name (emulator)';
      }
      return name;
    }

    if (PlatformDetection.isIOS) {
      final info = await deviceInfo.iosInfo;
      final marketingName = _joinNonEmpty([info.name, info.model], ' ');
      return _fallbackIfEmpty(marketingName, 'iPhone');
    }

    if (PlatformDetection.isMacOS) {
      final info = await deviceInfo.macOsInfo;
      return _fallbackIfEmpty(
        _joinNonEmpty([info.computerName, info.model], ' '),
        'Mac',
      );
    }

    if (PlatformDetection.isWindows) {
      final info = await deviceInfo.windowsInfo;
      return _fallbackIfEmpty(
        _joinNonEmpty([info.computerName, info.productName], ' '),
        'Windows PC',
      );
    }

    if (PlatformDetection.isLinux) {
      final info = await deviceInfo.linuxInfo;
      return _fallbackIfEmpty(
        _joinNonEmpty([info.name, info.prettyName], ' '),
        'Linux Device',
      );
    }
  } catch (_) {
    // Fall through to app-based fallback below.
  }

  return _clientName();
}

Future<String> _resolveAppVersion() async {
  if (PlatformDetection.isAppleTV) {
    final native = PlatformDetection.clientVersion?.trim();
    if (native != null && native.isNotEmpty && native != 'Unknown') {
      return native;
    }
  }
  try {
    final info = await pkg.PackageInfo.fromPlatform();
    return info.version.trim().isNotEmpty ? info.version.trim() : '0.1.0';
  } catch (_) {
    return '0.1.0';
  }
}

Future<void> _migrateLegacyBitrateCap(PreferenceStore store) async {
  const migrationKey = 'pref_max_bitrate_migrated_v3';
  if (store.getBool(migrationKey) == true) {
    return;
  }

  final current = store.getString(UserPreferences.maxBitrate.key) ?? '';
  if (current == '100') {
    await store.setString(
      UserPreferences.maxBitrate.key,
      UserPreferences.maxBitrate.defaultValue,
    );
  } else {
    final parsed = int.tryParse(current);
    if (parsed != null && parsed >= 1000000) {
      await store.setString(
        UserPreferences.maxBitrate.key,
        '${parsed ~/ 1000000}',
      );
    }
  }

  await store.setBool(migrationKey, true);
}

Future<void> _migrateAndroidMobileStereoAacFallbackDefault(
  PreferenceStore store,
) async {
  const migrationKey = 'pref_audio_stereo_aac_fallback_android_mobile_v1';

  if (!PlatformDetection.isAndroid || PlatformDetection.isTV) {
    return;
  }

  if (store.getBool(migrationKey) == true) {
    return;
  }

  if (!store.containsKey(_legacyAudioFallbackToStereoAacKey)) {
    await store.setBool(_legacyAudioFallbackToStereoAacKey, false);
  }
  await store.setBool(migrationKey, true);
}

Future<void> _migrateAndroidMobileAudioDefaults(
  PreferenceStore store,
) async {
  const migrationKey = 'pref_audio_defaults_android_mobile_v1';

  if (!PlatformDetection.isAndroid || PlatformDetection.isTV) {
    return;
  }

  if (store.getBool(migrationKey) == true) {
    return;
  }

  await store.setBool(migrationKey, true);
}

Future<void> migrateAudioPreferenceSplit(PreferenceStore store) async {
  const migrationKey = 'pref_audio_preference_split_v3';

  if (store.getBool(migrationKey) == true) {
    return;
  }

  Future<void> setBoolIfMissing(Preference<bool> pref, bool value) async {
    if (!store.containsKey(pref.key)) {
      await store.setBool(pref.key, value);
    }
  }

  Future<void> setEnumIfMissing<T extends Enum>(
    EnumPreference<T> pref,
    T value,
  ) async {
    if (!store.containsKey(pref.key)) {
      await store.setString(pref.key, value.name);
    }
  }

  bool legacyOn(String key) =>
      store.containsKey(key) && (store.getBool(key) ?? false);

  var carriedOver = false;
  if (legacyOn(_legacyAc3EnabledKey)) {
    await setBoolIfMissing(UserPreferences.ac3PassthroughEnabled, true);
    await setBoolIfMissing(UserPreferences.eac3PassthroughEnabled, true);
    carriedOver = true;
  }
  if (legacyOn(_legacyDtsEnabledKey)) {
    await setBoolIfMissing(UserPreferences.dtsCorePassthroughEnabled, true);
    await setBoolIfMissing(UserPreferences.dtsHdPassthroughEnabled, true);
    carriedOver = true;
  }
  if (legacyOn(_legacyTrueHdEnabledKey)) {
    await setBoolIfMissing(UserPreferences.trueHdPassthroughEnabled, true);
    carriedOver = true;
  }

  final wasDownmix =
      store.containsKey(_legacyAudioBehaviorKey) &&
      store.getString(_legacyAudioBehaviorKey) ==
          _legacyAudioBehaviorDownmixValue;
  if (wasDownmix) {
    await setBoolIfMissing(UserPreferences.downmixToStereo, true);
    await setEnumIfMissing(
      UserPreferences.audioPassthroughMode,
      AudioPassthroughMode.disabled,
    );
  } else if (carriedOver) {
    await setEnumIfMissing(
      UserPreferences.audioPassthroughMode,
      AudioPassthroughMode.manual,
    );
  }

  if (store.containsKey(_legacyAudioFallbackToStereoAacKey)) {
    final legacyStereoAacFallback =
        store.getBool(_legacyAudioFallbackToStereoAacKey) ??
        _legacyStereoAacFallbackDefaultForPlatform();
    await setEnumIfMissing(
      UserPreferences.audioFallbackCodec,
      legacyStereoAacFallback
          ? AudioFallbackCodec.aac
          : AudioFallbackCodec.auto,
    );
  }

  final savedFallbackCodec = store.getString(UserPreferences.audioFallbackCodec.key);
  if (savedFallbackCodec != null) {
    final remappedName = switch (savedFallbackCodec) {
      'aacStereo' => 'aac',
      'ac3_5_1' => 'ac3',
      'eac3_5_1' => 'eac3',
      _ => null,
    };
    if (remappedName != null) {
      await store.setString(UserPreferences.audioFallbackCodec.key, remappedName);
    }
  }

  await store.setBool(migrationKey, true);
}

// Retired keys from the preset era, read raw because the prefs no longer exist.
const _oldPresetKey = 'pref_audio_passthrough_preset';
const _oldOutputModeKey = 'audio_output_mode';
const _oldToggleKeys = <String>[
  'pref_passthrough_ac3',
  'pref_passthrough_eac3',
  'pref_passthrough_eac3_joc',
  'pref_passthrough_dts_core',
  'pref_passthrough_dts_hd',
  'pref_passthrough_dts_x',
  'pref_passthrough_truehd',
  'pref_passthrough_truehd_atmos',
];

/// Folds the retired preset, output mode, and variant toggles into the
/// passthrough mode and downmix prefs. The five base toggle keys keep their
/// stored values. The variant keys are left behind, since a variant-only ON
/// was a no-op once its base toggle was off.
Future<void> migrateAudioPassthroughMode(PreferenceStore store) async {
  if (store.getBool(UserPreferences.audioModeMigrated.key) == true) {
    return;
  }

  final preset = store.getString(_oldPresetKey);
  final outputMode = store.getString(_oldOutputModeKey);
  final anyToggleSet = _oldToggleKeys.any(store.containsKey);

  final AudioPassthroughMode mode;
  var downmix = false;
  if (preset == 'stereo' || outputMode == 'forceStereo') {
    // The old stereo path meant no passthrough plus a local downmix.
    mode = AudioPassthroughMode.disabled;
    downmix = true;
  } else if (preset == 'advanced' || anyToggleSet) {
    // Hand-managed toggles keep their intent. Absent base keys get filled
    // from the probe after startup detection.
    mode = AudioPassthroughMode.manual;
  } else {
    mode = AudioPassthroughMode.auto;
  }

  if (mode != AudioPassthroughMode.auto &&
      !store.containsKey(UserPreferences.audioPassthroughMode.key)) {
    await store.setString(UserPreferences.audioPassthroughMode.key, mode.name);
  }
  if (downmix && !store.containsKey(UserPreferences.downmixToStereo.key)) {
    await store.setBool(UserPreferences.downmixToStereo.key, true);
  }

  await store.setBool(UserPreferences.audioModeMigrated.key, true);
}

// Minimal DI for background isolates like the Watch Next worker. This must not
// call registerPlaybackModule: constructing Media3PlayerBackend subscribes to
// the process-global moonfin/media3_video_events channel and would hijack the
// foreground engine's event sink, freezing the player OSD mid-playback.
Future<void> configureBackgroundDependencies() async {
  if (getIt.isRegistered<DeviceInfo>()) return;

  final preferenceStore = PreferenceStore();
  await preferenceStore.init();

  final deviceId = preferenceStore.getString('device_id') ?? const Uuid().v4();
  final appVersion = await _resolveAppVersion();
  setServerUserAgentVersion(appVersion);
  getIt.registerSingleton<DeviceInfo>(
    DeviceInfo(
      id: deviceId,
      name: await _resolveDeviceName(),
      appName: _clientName(),
      appVersion: appVersion,
    ),
  );

  registerPreferenceModule(preferenceStore);
  registerServerModule();
  registerAuthModule();
  await getIt<AuthenticationStore>().init();
}

Future<void> configureDependencies() async {
  final preferenceStore = PreferenceStore();
  await preferenceStore.init();
  final appVersion = await _resolveAppVersion();
  setServerUserAgentVersion(appVersion);
  await _migrateLegacyBitrateCap(preferenceStore);
  await _migrateAndroidMobileStereoAacFallbackDefault(preferenceStore);
  await _migrateAndroidMobileAudioDefaults(preferenceStore);
  await migrateAudioPreferenceSplit(preferenceStore);
  await migrateAudioPassthroughMode(preferenceStore);

  var deviceId = preferenceStore.getString('device_id');
  if (deviceId == null) {
    deviceId = const Uuid().v4();
    await preferenceStore.setString('device_id', deviceId);
  }

  final clientName = _clientName();
  final deviceName = await _resolveDeviceName();
  getIt.registerSingleton<DeviceInfo>(
    DeviceInfo(
      id: deviceId,
      name: deviceName,
      appName: clientName,
      appVersion: appVersion,
    ),
  );

  registerPreferenceModule(preferenceStore);
  getIt.registerLazySingleton<RecentSearchesStore>(
    () => RecentSearchesStore(preferenceStore),
  );

  final storagePath = StoragePathService();
  getIt.registerSingleton<StoragePathService>(storagePath);
  getIt.registerSingleton<OfflineDatabase>(OfflineDatabase(openConnection()));
  final offlineRepo = OfflineRepository(getIt<OfflineDatabase>());
  getIt.registerSingleton<OfflineRepository>(offlineRepo);
  await _migrateIosPaths(offlineRepo);

  final offlineCatalog = OfflineCatalog(offlineRepo);
  getIt.registerSingleton<OfflineCatalog>(offlineCatalog);
  await offlineCatalog.warm();

  final connectivityService = ConnectivityService();
  connectivityService.initialize();
  getIt.registerSingleton<ConnectivityService>(connectivityService);

  registerServerModule();
  registerAuthModule();
  await getIt<AuthenticationStore>().init();
  registerPlaybackModule();
  registerAppModule();

  getIt.registerSingleton<LogService>(
    LogService(
      getIt<UserPreferences>(),
      getIt<MediaServerClientFactory>(),
      getIt<DeviceInfo>(),
    ),
  );
}

String? migrateIosPath(String? storedPath, String currentDocsPath) {
  if (storedPath == null) return null;
  final docsIndex = storedPath.indexOf('/Documents/');
  if (docsIndex == -1) return storedPath;
  final relativePath = storedPath.substring(docsIndex + '/Documents/'.length);
  return '$currentDocsPath/$relativePath';
}

Future<void> _migrateIosPaths(OfflineRepository repo) async {
  if (!PlatformDetection.isIOS) return;

  try {
    final docs = await getApplicationDocumentsDirectory();
    final currentDocsPath = docs.path;

    final items = await repo.getItems();
    for (final item in items) {
      final newLocalFilePath = migrateIosPath(item.localFilePath, currentDocsPath);
      final newPosterPath = migrateIosPath(item.posterPath, currentDocsPath);
      final newBackdropPath = migrateIosPath(item.backdropPath, currentDocsPath);
      final newLogoPath = migrateIosPath(item.logoPath, currentDocsPath);
      final newThumbPath = migrateIosPath(item.thumbPath, currentDocsPath);

      if (newLocalFilePath != item.localFilePath ||
          newPosterPath != item.posterPath ||
          newBackdropPath != item.backdropPath ||
          newLogoPath != item.logoPath ||
          newThumbPath != item.thumbPath) {
        await repo.updateItemPaths(
          itemId: item.itemId,
          serverId: item.serverId,
          localFilePath: newLocalFilePath,
          posterPath: newPosterPath,
          backdropPath: newBackdropPath,
          logoPath: newLogoPath,
          thumbPath: newThumbPath,
        );
      }
    }
  } catch (_) {
    // Fail-silent to not block startup if anything goes wrong
  }
}
