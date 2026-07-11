import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/download_quality.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../data/services/download_service.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../di/providers.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/download_utils.dart';
import '../../../util/platform_detection.dart';
import '../../../l10n/app_localizations.dart';
import '../downloads/downloads_panel.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
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
    final storageLimitMb = prefs.get(UserPreferences.downloadStorageLimitMb);
    final customPath = prefs.get(UserPreferences.customDownloadPath);
    final storage = ref.watch(storageUsedProvider);
    final l10n = AppLocalizations.of(context);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: AppBar(title: Text(l10n.download)),
        body: ListView(
          children: [
            _Section(title: l10n.quality),
            adaptiveListSection(
              children: [
                ListTile(
                  leading: const Icon(Icons.high_quality),
                  title: Text(l10n.defaultDownloadQuality),
                  subtitle: Text(_qualityLabel(qualityName)),
                  onTap: () => _pickQuality(context, prefs, qualityName),
                ),
              ],
            ),

            _Section(title: l10n.network),
            adaptiveListSection(
              children: [
                if (!PlatformDetection.useDesktopUi)
                  SwitchListTile.adaptive(
                    secondary: const Icon(Icons.wifi),
                    title: Text(l10n.wifiOnlyDownloads),
                    subtitle: Text(l10n.onlyDownloadOnWifi),
                    value: wifiOnly,
                    onChanged: (v) =>
                        prefs.set(UserPreferences.downloadWifiOnly, v),
                  ),
              ],
            ),
            _Section(title: l10n.storage),
            adaptiveListSection(
              children: [
                storage.when(
                  data: (bytes) => ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text(l10n.storageUsed),
                    subtitle: Text(formatBytes(bytes)),
                    trailing: TextButton(
                      child: Text(l10n.manage),
                      onPressed: () => showDownloadsDialog(context),
                    ),
                  ),
                  loading: () => ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text(l10n.storageUsed),
                    subtitle: Text(l10n.calculating),
                  ),
                  error: (_, _) => const SizedBox.shrink(),
                ),
                ListTile(
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
                      _pickStorageLimit(context, prefs, storageLimitMb),
                ),
                if (PlatformDetection.useDesktopUi)
                  ListTile(
                    leading: const Icon(Icons.folder_open),
                    title: Text(l10n.downloadLocation),
                    subtitle: Text(
                      customPath.isEmpty ? l10n.defaultLabel : customPath,
                    ),
                    onTap: () => _pickFolder(context, prefs),
                  ),
                if (PlatformDetection.isAndroid)
                  SwitchListTile.adaptive(
                    secondary: const Icon(Icons.folder_open),
                    title: Text(l10n.saveToDownloadsFolder),
                    subtitle: Text(l10n.downloadsVisibleToOtherApps),
                    value: customPath == 'mediastore',
                    onChanged: (v) => _toggleMediaStore(context, prefs, v),
                  ),
              ],
            ),

            _Section(title: l10n.dangerZone),
            adaptiveListSection(
              children: [
                ListTile(
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

  void _pickQuality(
    BuildContext context,
    UserPreferences prefs,
    String current,
  ) {
    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: RadioGroup<String>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) prefs.set(UserPreferences.defaultDownloadQuality, v);
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: DownloadQuality.values
                .map(
                  (q) => RadioListTile<String>(
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

  void _pickStorageLimit(
    BuildContext context,
    UserPreferences prefs,
    int current,
  ) {
    final l10n = AppLocalizations.of(context);
    final values = [0, 1024, 2048, 5120, 10240, 20480, 51200, 102400];
    showFocusRestoringModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: RadioGroup<int>(
          groupValue: current,
          onChanged: (v) {
            if (v != null) prefs.set(UserPreferences.downloadStorageLimitMb, v);
            Navigator.pop(ctx);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: values
                .map(
                  (mb) => RadioListTile<int>(
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

  Future<void> _pickFolder(BuildContext context, UserPreferences prefs) async {
    final result = await FilePicker.getDirectoryPath();
    if (result == null) return;

    final oldPath = prefs.get(UserPreferences.customDownloadPath);
    if (result == oldPath) return;
    if (!context.mounted) return;

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
    if (confirmed != true) return;

    final storage = GetIt.instance<StoragePathService>();
    if (!await storage.canWriteTo(result)) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.cannotWriteToFolder)));
      }
      return;
    }

    await prefs.set(UserPreferences.customDownloadPath, result);
    storage.clearCache();
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
