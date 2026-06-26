import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/app_distribution.dart';
import '../../widgets/app_update_dialog.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final appVersion = GetIt.instance<DeviceInfo>().appVersion;

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.aboutTitle)),
        body: ListView(
          children: [
            const SizedBox(height: 32),
            Center(
              child: Image.asset('assets/images/logo_and_text.png', height: 80),
            ),
            const SizedBox(height: 4),
            Center(child: Text(l10n.versionValue(appVersion))),
            if (AppDistribution.supportsInAppUpdates) ...[
              const SizedBox(height: 16),
              const _CheckForUpdatesButton(),
            ],
            const SizedBox(height: 24),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.description),
              title: Text(l10n.openSourceLicenses),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Moonfin',
                applicationVersion: appVersion,
                applicationIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/logo_and_text.png',
                    height: 48,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: Text(l10n.sourceCode),
              subtitle: Text(l10n.sourceCodeUrl),
              onTap: () => launchUrl(
                Uri.parse('https://github.com/Moonfin-Client/Mobile-Desktop'),
              ),
            ),
            if (AppDistribution.supportsInAppUpdates) ...[
              const Divider(),
              SwitchPreferenceTile(
                preference: UserPreferences.updateNotificationsEnabled,
                title: l10n.updateNotifications,
                subtitle: l10n.showWhenUpdatesAvailable,
                icon: Icons.system_update,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CheckForUpdatesButton extends StatefulWidget {
  const _CheckForUpdatesButton();

  @override
  State<_CheckForUpdatesButton> createState() => _CheckForUpdatesButtonState();
}

class _CheckForUpdatesButtonState extends State<_CheckForUpdatesButton> {
  bool _checking = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: TextButton.icon(
        icon: _checking
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.system_update_alt, size: 18),
        label: Text(l10n.checkForUpdatesNow),
        onPressed: _checking ? null : () => _check(context),
      ),
    );
  }

  Future<void> _check(BuildContext context) async {
    setState(() => _checking = true);
    await checkAndShowUpdateResult(context);
    if (!mounted) return;
    setState(() => _checking = false);
  }
}
