import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/kefin_tweaks_service.dart';
import '../../../data/services/home_screen_sections_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/settings_panel.dart';
import 'home_sections_screen.dart';
import 'settings_app_bar.dart';

/// Settings > Integrations > KefinTweaks.
///
/// Surfaces per-server detection state for the third-party "KefinTweaks"
/// front-end Jellyfin enhancement and lets the user trigger a refresh.
class KefinTweaksIntegrationScreen extends StatefulWidget {
  const KefinTweaksIntegrationScreen({super.key});

  @override
  State<KefinTweaksIntegrationScreen> createState() =>
      _KefinTweaksIntegrationScreenState();
}

class _KefinTweaksIntegrationScreenState
    extends State<KefinTweaksIntegrationScreen> {
  KefinTweaksService get _service => GetIt.instance<KefinTweaksService>();
  bool _refreshing = false;

  @override
  void initState() {
    super.initState();
    _service.addListener(_onChanged);
    _refresh();
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _refresh() async {
    if (_refreshing) return;
    setState(() => _refreshing = true);
    try {
      await _service.refreshAll();
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          final theme = Theme.of(context);
          final caps = _service.allCapabilities.toList();
          return Scaffold(
            appBar: buildSettingsAppBar(
              context,
              Text(l10n.kefinTweaksTitle),
              actions: [
                IconButton(
                  tooltip: l10n.refresh,
                  icon: _refreshing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.refresh),
                  onPressed: _refreshing ? null : _refresh,
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    l10n.kefinTweaksIntegrationDescription,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                if (caps.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(l10n.kefinTweaksIntegrationNoServers),
                  )
                else
                  ...caps.map(_buildCapabilityTile),
                const Divider(),
                if (_canOpenHomeSections())
                  ListTile(
                    leading: const Icon(Icons.tune),
                    title: Text(l10n.integrationOpenHomeSections),
                    subtitle: Text(
                      l10n.integrationOpenHomeSectionsSubtitle,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.pushSettingsScreen(
                      const HomeSectionsScreen(showGeneralOptions: false),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _canOpenHomeSections() {
    final hssAvailable = GetIt.instance.isRegistered<HomeScreenSectionsService>() &&
        GetIt.instance<HomeScreenSectionsService>().availableServers.isNotEmpty;
    final kefinAvailable = _service.availableServers.isNotEmpty;
    return hssAvailable || kefinAvailable;
  }

  Widget _buildCapabilityTile(KefinTweaksCapability cap) {
    final l10n = AppLocalizations.of(context);
    final status = cap.installed
        ? (cap.enabled ? l10n.enabled : l10n.integrationInstalledButDisabled)
        : l10n.integrationNotInstalled;
    final subtitle = StringBuffer(status);
    if (cap.version != null) subtitle.write(' • v${cap.version}');
    if (cap.sections.isNotEmpty) {
      subtitle.write(
        ' • ${l10n.integrationRowsDiscoveredCount(cap.sections.length)}',
      );
    }
    if (cap.lastError != null && !cap.installed) {
      subtitle.write('\n${cap.lastError}');
    }
    return ListTile(
      leading: Icon(
        cap.isAvailable ? Icons.check_circle : Icons.error_outline,
        color: cap.isAvailable ? AppColorScheme.statusAvailable : null,
      ),
      title: Text(cap.serverId),
      subtitle: Text(subtitle.toString()),
      isThreeLine: cap.lastError != null,
    );
  }
}
