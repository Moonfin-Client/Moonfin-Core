import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/models/download_quality.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../data/services/download_service.dart';
import '../../../data/services/macos_download_dir.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../di/providers.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/download_utils.dart';
import '../../../util/platform_detection.dart';
import '../../../util/tv_image_cache_stub.dart'
    if (dart.library.io) '../../../util/tv_image_cache_io.dart';
import '../../../l10n/app_localizations.dart';
import '../downloads/downloads_panel.dart';
import 'settings_app_bar.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/focus/dpad_list_tile.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';

class DownloadSettingsScreen extends ConsumerWidget {
  const DownloadSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      RequestInitialFocus(child: _buildContent(context, ref));

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(userPreferencesProvider);
    final qualityName = prefs.get(UserPreferences.defaultDownloadQuality);
    final wifiOnly = prefs.get(UserPreferences.downloadWifiOnly);
    final reportActivity = prefs.get(UserPreferences.reportDownloadsAsActivity);
    final storageLimitMb = prefs.get(UserPreferences.downloadStorageLimitMb);
    final imageCacheLimitMb = prefs.get(UserPreferences.imageCacheLimitMb);
    final concurrentCount = prefs.get(UserPreferences.downloadConcurrentCount);
    final customPath = prefs.get(UserPreferences.customDownloadPath);
    final tvOfflineDownloads = prefs.get(UserPreferences.tvOfflineDownloads);
    final storage = ref.watch(storageUsedProvider);
    final l10n = AppLocalizations.of(context);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.settingsOfflineDownloads),
        ),
        body: ListView(
          children: [
            // The discovery point for the whole feature on TV: the panel
            // stays reachable while the item-page actions wait for opt-in.
            if (PlatformDetection.isTV)
              adaptiveListSection(
                children: [
                  DpadSwitchListTile(
                    useSettingsIconShell: true,
                    secondary: const Icon(Icons.download_for_offline),
                    title: Text(l10n.tvOfflineDownloads),
                    subtitle: Text(l10n.tvOfflineDownloadsSubtitle),
                    value: tvOfflineDownloads,
                    onChanged: (v) =>
                        prefs.set(UserPreferences.tvOfflineDownloads, v),
                  ),
                ],
              ),
            _Section(title: l10n.quality),
            adaptiveListSection(
              children: [
                DpadListTile(
                  autofocus: true,
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.high_quality),
                  title: Text(l10n.defaultDownloadQuality),
                  subtitle: Text(_qualityLabel(qualityName)),
                  onTap: () => showQualityPicker(context, prefs, qualityName),
                ),
              ],
            ),

            _Section(title: l10n.network),
            adaptiveListSection(
              children: [
                if (!PlatformDetection.useDesktopUi)
                  DpadSwitchListTile(
                    useSettingsIconShell: true,
                    secondary: const Icon(Icons.wifi),
                    title: Text(l10n.wifiOnlyDownloads),
                    subtitle: Text(l10n.onlyDownloadOnWifi),
                    value: wifiOnly,
                    onChanged: (v) =>
                        prefs.set(UserPreferences.downloadWifiOnly, v),
                  ),
                if (!PlatformDetection.isWeb)
                  DpadSwitchListTile(
                    useSettingsIconShell: true,
                    secondary: const Icon(Icons.podcasts),
                    title: Text(l10n.reportDownloadsActivity),
                    subtitle: Text(l10n.reportDownloadsActivitySubtitle),
                    value: reportActivity,
                    onChanged: (v) =>
                        prefs.set(UserPreferences.reportDownloadsAsActivity, v),
                  ),
                DpadListTile(
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.queue),
                  title: Text(l10n.settingsConcurrentDownloads),
                  subtitle: Text(l10n.settingsConcurrentDownloadsDescription),
                  trailing: Text('$concurrentCount'),
                  onTap: () =>
                      _pickConcurrentDownloads(context, prefs, concurrentCount),
                ),
              ],
            ),
            _Section(title: l10n.storage),
            adaptiveListSection(
              children: [
                storage.when(
                  data: (bytes) => DpadListTile(
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.storage),
                    title: Text(l10n.storageUsed),
                    subtitle: Text(formatBytes(bytes)),
                    trailing: PlatformDetection.isTV
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(l10n.manage),
                              const SizedBox(width: 4),
                              const Icon(Icons.chevron_right),
                            ],
                          )
                        : TextButton(
                            onPressed: () => showDownloadsDialog(context),
                            child: Text(l10n.manage),
                          ),
                    onTap: PlatformDetection.isTV
                        ? () => showDownloadsDialog(context)
                        : null,
                  ),
                  loading: () => PlatformDetection.isTV
                      ? DpadListTile(
                          useSettingsIconShell: true,
                          leading: const Icon(Icons.storage),
                          title: Text(l10n.storageUsed),
                          subtitle: Text(l10n.calculating),
                        )
                      : ListTile(
                          leading: const Icon(Icons.storage),
                          title: Text(l10n.storageUsed),
                          subtitle: Text(l10n.calculating),
                        ),
                  error: (_, _) => const SizedBox.shrink(),
                ),
                DpadListTile(
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.data_usage),
                  title: Text(l10n.storageLimit),
                  subtitle: Text(
                    storageLimitMb == 0
                        ? l10n.noLimit
                        : l10n.gbValue(
                            (storageLimitMb / 1024).toStringAsFixed(1),
                          ),
                  ),
                  onTap: () =>
                      showStorageLimitPicker(context, prefs, storageLimitMb),
                ),
                if (PlatformDetection.isAndroid)
                  DpadSwitchListTile(
                    useSettingsIconShell: true,
                    secondary: const Icon(Icons.folder_open),
                    title: Text(l10n.saveToDownloadsFolder),
                    subtitle: Text(l10n.downloadsVisibleToOtherApps),
                    value: customPath == 'mediastore',
                    onChanged: (v) => _toggleMediaStore(context, prefs, v),
                  ),
                if (PlatformDetection.useDesktopUi ||
                    (PlatformDetection.isAndroid && customPath != 'mediastore'))
                  DpadListTile(
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.folder_special),
                    title: Text(l10n.downloadLocation),
                    subtitle: Text(
                      customPath.isEmpty ? l10n.defaultLabel : customPath,
                    ),
                    onTap: () => PlatformDetection.isAndroid
                        ? _pickAndroidLocation(context, prefs, customPath)
                        : _pickFolder(context, prefs),
                  ),
                if (!PlatformDetection.isWeb) ...[
                  DpadListTile(
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.image_outlined),
                    title: Text(l10n.imageCacheLimit),
                    subtitle: Text(
                      imageCacheLimitMb == 0
                          ? l10n.noLimit
                          : l10n.mbValue(imageCacheLimitMb),
                    ),
                    onTap: () =>
                        _pickImageCacheLimit(context, prefs, imageCacheLimitMb),
                  ),
                  DpadListTile(
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.cleaning_services_outlined),
                    title: Text(l10n.clearImageCache),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _clearImageCache(context),
                  ),
                ],
              ],
            ),

            _Section(title: l10n.dangerZone),
            adaptiveListSection(
              children: [
                DpadListTile(
                  useSettingsIconShell: true,
                  leading: Icon(
                    Icons.delete_forever,
                    color: AppColorScheme.statusRequested,
                  ),
                  title: Text(
                    l10n.clearAllDownloads,
                    style: TextStyle(color: AppColorScheme.statusRequested),
                  ),
                  onTap: () => _confirmClearAll(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _qualityLabel(String name) {
    return DownloadQuality.values
            .where((q) => q.name == name)
            .map((q) => q.label)
            .firstOrNull ??
        'Original';
  }

  static void showQualityPicker(
    BuildContext context,
    UserPreferences prefs,
    String current,
  ) {
    final values = DownloadQuality.values;
    final hasCurrent = values.any((quality) => quality.name == current);
    if (PlatformDetection.isTV) {
      showFocusRestoringModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(ctx).height * 0.9,
            ),
            child: DpadRadioGroup<String>(
              groupValue: current,
              onChanged: (v) {
                if (v != null) {
                  prefs.set(UserPreferences.defaultDownloadQuality, v);
                }
                Navigator.pop(ctx);
              },
              child: ListView(
                shrinkWrap: true,
                children: values
                    .map(
                      (q) => DpadRadioListTile<String>(
                        autofocus: q.name == current ||
                            (!hasCurrent && q == values.first),
                        title: Text(q.label),
                        subtitle: Text(
                          q.isTranscoded
                              ? '${q.estimatedSizePerHour} • ${q.encodingInfo}'
                              : q.estimatedSizePerHour,
                        ),
                        value: q.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      );
      return;
    }

    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: DpadRadioGroup<String>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) {
              prefs.set(UserPreferences.defaultDownloadQuality, v);
            }
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: values
                .map(
                  (q) => DpadRadioListTile<String>(
                    autofocus:
                        q.name == current || (!hasCurrent && q == values.first),
                    title: Text(q.label),
                    subtitle: Text(
                      q.isTranscoded
                          ? '${q.estimatedSizePerHour} • ${q.encodingInfo}'
                          : q.estimatedSizePerHour,
                    ),
                    value: q.name,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  static void showStorageLimitPicker(
    BuildContext context,
    UserPreferences prefs,
    int current,
  ) {
    final l10n = AppLocalizations.of(context);
    final values = <int>{
      0,
      1024,
      2048,
      5120,
      10240,
      20480,
      51200,
      102400,
      current,
    }.toList()..sort();
    if (PlatformDetection.isTV) {
      showFocusRestoringModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(ctx).height * 0.9,
            ),
            child: DpadRadioGroup<int>(
              groupValue: current,
              onChanged: (v) {
                if (v != null) {
                  prefs.set(UserPreferences.downloadStorageLimitMb, v);
                }
                Navigator.pop(ctx);
              },
              child: ListView(
                shrinkWrap: true,
                children: values
                    .map(
                      (mb) => DpadRadioListTile<int>(
                        autofocus: mb == current,
                        title: Text(
                          mb == 0
                              ? l10n.noLimit
                              : l10n.gbValue((mb / 1024).toStringAsFixed(0)),
                        ),
                        value: mb,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      );
      return;
    }

    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: DpadRadioGroup<int>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) {
              prefs.set(UserPreferences.downloadStorageLimitMb, v);
            }
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: values
                .map(
                  (mb) => DpadRadioListTile<int>(
                    autofocus: mb == current,
                    title: Text(
                      mb == 0
                          ? l10n.noLimit
                          : l10n.gbValue((mb / 1024).toStringAsFixed(0)),
                    ),
                    value: mb,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _pickImageCacheLimit(
    BuildContext context,
    UserPreferences prefs,
    int current,
  ) {
    final l10n = AppLocalizations.of(context);
    final values = [0, 100, 200, 350, 500, 1024, 2048];
    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: DpadRadioGroup<int>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) {
              prefs.set(UserPreferences.imageCacheLimitMb, v);
              unawaited(enforceImageCacheBudget(v * 1024 * 1024));
            }
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: values
                .map(
                  (mb) => DpadRadioListTile<int>(
                    autofocus:
                        mb == current || (!values.contains(current) && mb == 0),
                    title: Text(mb == 0 ? l10n.noLimit : l10n.mbValue(mb)),
                    value: mb,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _pickConcurrentDownloads(
    BuildContext context,
    UserPreferences prefs,
    int current,
  ) {
    final hasCurrent = current >= 1 && current <= 8;
    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: DpadRadioGroup<int>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) {
              prefs.set(UserPreferences.downloadConcurrentCount, v);
            }
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var n = 1; n <= 8; n++)
                DpadRadioListTile<int>(
                  autofocus: n == current || (!hasCurrent && n == 1),
                  title: Text('$n'),
                  value: n,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _clearImageCache(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    await clearImageDiskCache();
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.imageCacheCleared)));
  }

  Future<void> _pickFolder(BuildContext context, UserPreferences prefs) async {
    // macOS is sandboxed: pick natively and keep a security-scoped bookmark so
    // the folder stays writable across launches. Windows and Linux can use the
    // picked path directly once we confirm it is writable.
    final String? result;
    String? bookmark;
    if (PlatformDetection.isMacOS) {
      final picked = await MacosDownloadDir.pick();
      result = picked?.path;
      bookmark = picked?.bookmark;
    } else {
      result = await FilePicker.getDirectoryPath();
    }
    if (result == null) return;

    final oldPath = prefs.get(UserPreferences.customDownloadPath);
    if (result == oldPath) return;
    if (!context.mounted) return;

    final l10n = AppLocalizations.of(context);
    if (!await _confirmLocationChange(context)) return;

    final storage = GetIt.instance<StoragePathService>();
    // On macOS the bookmark carries write access, so the probe would fail
    // outside the security scope. Other desktops probe the raw path.
    if (bookmark == null && !await storage.canWriteTo(result)) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.cannotWriteToFolder)));
      }
      return;
    }

    if (bookmark != null) {
      await prefs.set(UserPreferences.customDownloadPathBookmark, bookmark);
    }
    await prefs.set(UserPreferences.customDownloadPath, result);
    storage.clearCache();
  }

  /// Picks between the folders Android allows, which is the default plus
  /// whatever [StoragePathService.getRemovableDownloadDirs] turns up. The
  /// system folder picker hands back paths the app then can't write to.
  Future<void> _pickAndroidLocation(
    BuildContext context,
    UserPreferences prefs,
    String current,
  ) async {
    final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
    if (!context.mounted) return;
    // Android 10 and below still write through raw file paths, so the system
    // folder picker leads somewhere usable there.
    if (sdkInt <= 29) return _pickFolder(context, prefs);

    final storage = GetIt.instance<StoragePathService>();
    final removable = await storage.getRemovableDownloadDirs();
    if (!context.mounted) return;
    final hasCurrentRemovable = removable.any((dir) => dir.path == current);

    final l10n = AppLocalizations.of(context);
    final choice = await showFocusRestoringModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: DpadRadioGroup<String>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) Navigator.pop(ctx, v);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DpadRadioListTile<String>(
                autofocus: current.isEmpty || !hasCurrentRemovable,
                title: Text(l10n.defaultLabel),
                value: '',
              ),
              for (final dir in removable)
                DpadRadioListTile<String>(
                  autofocus: current == dir.path,
                  title: Text(l10n.sdCard),
                  subtitle: Text(dir.path),
                  value: dir.path,
                ),
              if (removable.isEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Text(
                    l10n.downloadLocationLimitedByAndroid,
                    style: Theme.of(ctx).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    if (choice == null || choice == current || !context.mounted) return;
    if (!await _confirmLocationChange(context)) return;

    if (choice.isNotEmpty && !await storage.canWriteTo(choice)) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.cannotWriteToFolder)));
      }
      return;
    }

    await prefs.set(UserPreferences.customDownloadPath, choice);
    storage.clearCache();
  }

  /// Existing downloads stay where they are, so the move is worth confirming.
  Future<bool> _confirmLocationChange(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.changeDownloadLocation),
        content: Text(l10n.changeDownloadLocationDescription),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
    return confirmed == true;
  }

  Future<void> _toggleMediaStore(
    BuildContext context,
    UserPreferences prefs,
    bool enable,
  ) async {
    if (!enable) {
      await prefs.set(UserPreferences.customDownloadPath, '');
      GetIt.instance<StoragePathService>().clearCache();
      return;
    }

    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.saveToDownloadsFolderQuestion),
        content: Text(l10n.saveToDownloadsFolderDescription),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.enable),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    // Android 10 and below write to the public Downloads folder through raw
    // file paths, which needs the storage permission at runtime. Android 11
    // and up can contribute files without it, and the permission no longer
    // exists there, so only ask on the old versions.
    final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
    if (sdkInt <= 29) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.cannotWriteToFolder)));
        }
        return;
      }
    }

    await prefs.set(UserPreferences.customDownloadPath, 'mediastore');
    GetIt.instance<StoragePathService>().clearCache();
  }

  Future<void> _confirmClearAll(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.clearAllDownloads),
        content: Text(l10n.clearAllDownloadsWarning),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.statusRequested,
            ),
            child: Text(l10n.clearAll),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final downloadService = GetIt.instance<DownloadService>();
    await downloadService.clearAllDownloads();
  }
}

class _Section extends StatelessWidget {
  final String title;
  const _Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
