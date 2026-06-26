part of '../settings_side_panel.dart';

class _AboutCategoryScreen extends StatelessWidget {
  const _AboutCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final appVersion = GetIt.instance<DeviceInfo>().appVersion;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.aboutTitle)),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Image.asset('assets/images/logo_and_text.png', height: 72),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              l10n.versionValue(appVersion),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          _SectionHeader(l10n.settingsAppInfo),
          _TvSettingsListTile(
            autofocus: true,
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.version),
            subtitle: Text(appVersion),
            trailing: const SizedBox.shrink(),
            onTap: () {},
          ),
          if (AppDistribution.supportsInAppUpdates)
            const _CheckForUpdatesTile(),
          _TvSettingsListTile(
            leading: const Icon(Icons.code),
            title: Text(l10n.sourceCode),
            subtitle: Text(l10n.sourceCodeUrl),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://github.com/Moonfin-Client/Mobile-Desktop',
              title: l10n.sourceCode,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.bug_report),
            title: Text(l10n.settingsReportAnIssue),
            subtitle: Text(l10n.settingsReportAnIssueSubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://github.com/Moonfin-Client/Mobile-Desktop/issues',
              title: l10n.settingsReportAnIssue,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.troubleshoot),
            title: const Text('Diagnostics & Logging'),
            subtitle: const Text(
              'Capture media, login and network logs and send them to the '
              'server as a report',
            ),
            onTap: () =>
                context.pushSettingsScreen(const DiagnosticsSettingsScreen()),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.forum),
            title: Text(l10n.settingsJoinDiscord),
            subtitle: Text(l10n.settingsJoinDiscordSubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://discord.gg/moonfin',
              title: l10n.settingsJoinTheDiscord,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.favorite),
            title: Text(l10n.settingsSupportMoonfin),
            subtitle: Text(l10n.settingsSupportMoonfinSubtitle),
            onTap: () => showSupportDialog(context),
          ),
          _SectionHeader(l10n.settingsLegal),
          _TvSettingsListTile(
            leading: const Icon(Icons.description),
            title: Text(l10n.settingsLicenses),
            subtitle: Text(l10n.settingsOpenSourceLicenseNotices),
            onTap: () => showQrOrLaunch(
              context,
              url:
                  'https://github.com/Moonfin-Client/Mobile-Desktop/blob/main/LICENSE',
              title: l10n.settingsLicenses,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.privacy_tip),
            title: Text(l10n.settingsPrivacyPolicy),
            subtitle: Text(l10n.settingsPrivacyPolicySubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url:
                  'https://github.com/Moonfin-Client/Mobile-Desktop/blob/main/PRIVACY_POLICY.md',
              title: l10n.settingsPrivacyPolicy,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckForUpdatesTile extends StatefulWidget {
  const _CheckForUpdatesTile();

  @override
  State<_CheckForUpdatesTile> createState() => _CheckForUpdatesTileState();
}

class _CheckForUpdatesTileState extends State<_CheckForUpdatesTile> {
  bool _checking = false;

  Future<void> _check() async {
    setState(() => _checking = true);
    await checkAndShowUpdateResult(context);
    if (!mounted) return;
    setState(() => _checking = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _TvSettingsListTile(
      leading: _checking
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.system_update_alt),
      title: Text(l10n.settingsCheckForUpdates),
      subtitle: Text(l10n.settingsCheckForUpdatesSubtitle),
      onTap: _checking ? null : _check,
    );
  }
}
