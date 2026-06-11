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

bool _legacyBitstreamDefaultForPlatform() {
  return !(PlatformDetection.isAndroid && PlatformDetection.isTV);
}

bool _legacyStereoAacFallbackDefaultForPlatform() {
  return !PlatformDetection.isAndroid || PlatformDetection.isTV;
}

String _clientName() {
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

Future<void> _migrateLegacyMediaBarMode(PreferenceStore store) async {
  const migrationKey = 'pref_media_bar_mode_migrated_v1';
  if (store.getBool(migrationKey) == true) {
    return;
  }

  final existingMode = store.getString(UserPreferences.mediaBarMode.key);
  if (existingMode == null || existingMode.trim().isEmpty) {
    final legacyEnabled = store.getBool(UserPreferences.mediaBarEnabled.key);
    final nextMode = legacyEnabled == false
        ? UserPreferences.mediaBarModeOff
        : UserPreferences.mediaBarModeMoonfin;
    await store.setString(UserPreferences.mediaBarMode.key, nextMode);
  } else {
    final normalized = UserPreferences.normalizeMediaBarMode(existingMode);
    if (normalized != existingMode) {
      await store.setString(UserPreferences.mediaBarMode.key, normalized);
    }
  }

  await store.setBool(migrationKey, true);
}

Future<void> _migrateAndroidTvPassthroughDefaults(
  PreferenceStore store,
) async {
  const migrationKey = 'pref_audio_passthrough_defaults_android_tv_v1';

  if (!PlatformDetection.isAndroid || !PlatformDetection.isTV) {
    return;
  }

  if (store.getBool(migrationKey) == true) {
    return;
  }

  await store.setBool(UserPreferences.audioPrefsAutoDetected.key, false);

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

  if (store.containsKey(_legacyAudioBehaviorKey)) {
    final legacyAudioBehavior = store.getString(_legacyAudioBehaviorKey);
    await setEnumIfMissing(
      UserPreferences.audioOutputMode,
      legacyAudioBehavior == _legacyAudioBehaviorDownmixValue
          ? AudioOutputMode.forceStereo
          : AudioOutputMode.auto,
    );
  }

  if (store.containsKey(_legacyAc3EnabledKey)) {
    final legacyAc3 =
        store.getBool(_legacyAc3EnabledKey) ??
        _legacyBitstreamDefaultForPlatform();
    await setBoolIfMissing(UserPreferences.ac3PassthroughEnabled, legacyAc3);
    await setBoolIfMissing(UserPreferences.eac3PassthroughEnabled, legacyAc3);
  }

  if (store.containsKey(_legacyDtsEnabledKey)) {
    final legacyDts = store.getBool(_legacyDtsEnabledKey) ?? false;
    await setBoolIfMissing(UserPreferences.dtsCorePassthroughEnabled, legacyDts);
    await setBoolIfMissing(UserPreferences.dtsHdPassthroughEnabled, legacyDts);
    await setBoolIfMissing(UserPreferences.dtsXPassthroughEnabled, legacyDts);
  } else {
    await setBoolIfMissing(UserPreferences.dtsXPassthroughEnabled, false);
  }

  if (store.containsKey(_legacyTrueHdEnabledKey)) {
    final legacyTrueHd =
        store.getBool(_legacyTrueHdEnabledKey) ??
        _legacyBitstreamDefaultForPlatform();
    await setBoolIfMissing(UserPreferences.trueHdPassthroughEnabled, legacyTrueHd);
    await setBoolIfMissing(
      UserPreferences.trueHdAtmosPassthroughEnabled,
      legacyTrueHd,
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

  if (store.containsKey(_legacyAc3EnabledKey)) {
    await setBoolIfMissing(UserPreferences.eac3JocPassthroughEnabled, false);
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

Future<void> configureDependencies() async {
  final preferenceStore = PreferenceStore();
  await preferenceStore.init();
  final appVersion = await _resolveAppVersion();
  await _migrateLegacyBitrateCap(preferenceStore);
  await _migrateLegacyMediaBarMode(preferenceStore);
  await _migrateAndroidTvPassthroughDefaults(preferenceStore);
  await _migrateAndroidMobileStereoAacFallbackDefault(preferenceStore);
  await _migrateAndroidMobileAudioDefaults(preferenceStore);
  await migrateAudioPreferenceSplit(preferenceStore);

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
