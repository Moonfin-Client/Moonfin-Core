part of '../settings_side_panel.dart';

class _OfflineDownloadsScreen extends StatefulWidget {
  const _OfflineDownloadsScreen();

  @override
  State<_OfflineDownloadsScreen> createState() =>
      _OfflineDownloadsScreenState();
}

class _OfflineDownloadsScreenState extends State<_OfflineDownloadsScreen> {
  final _offlineScope = FocusScopeNode(
    debugLabel: 'OfflineDownloadsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _offlineScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsOfflineDownloads)),
      body: FocusScope(
        node: _offlineScope,
        autofocus: true,
        child: ListView(
          children: [
            adaptiveListSection(
              children: [
                StringPickerPreferenceTile(
                  preference: UserPreferences.defaultDownloadQuality,
                  title: l10n.defaultDownloadQuality,
                  icon: Icons.high_quality,
                  options: {
                    'original': l10n.original,
                    'high': l10n.settingsHigh,
                    'medium': l10n.medium,
                    'low': l10n.settingsLow,
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.downloadWifiOnly,
                  title: l10n.wifiOnlyDownloads,
                  subtitle: l10n.onlyDownloadOnWifi,
                  icon: Icons.wifi,
                ),
                SliderPreferenceTile(
                  preference: UserPreferences.downloadStorageLimitMb,
                  title: l10n.storageLimit,
                  icon: Icons.storage,
                  min: 0,
                  max: 102400,
                  divisions: 100,
                  labelOf: (v) => v == 0
                      ? l10n.noLimit
                      : l10n.gbValue((v / 1024).toStringAsFixed(1)),
                ),
                _EditableStringPreferenceTile(
                  preference: UserPreferences.customDownloadPath,
                  title: l10n.settingsCustomPath,
                  icon: Icons.folder_open,
                  hintText: l10n.settingsEnterDownloadFolderPath,
                  pickPath: () async {
                    String? initialDir;
                    try {
                      initialDir = (await getDownloadsDirectory())?.path;
                    } catch (_) {}
                    return FilePicker.getDirectoryPath(
                      initialDirectory: initialDir,
                    );
                  },
                ),
                IntPickerPreferenceTile(
                  preference: UserPreferences.downloadConcurrentCount,
                  title: l10n.settingsConcurrentDownloads,
                  description: l10n.settingsConcurrentDownloadsDescription,
                  icon: Icons.queue,
                  options: const {
                    1: '1',
                    2: '2',
                    3: '3',
                    4: '4',
                    5: '5',
                    6: '6',
                    7: '7',
                    8: '8',
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
