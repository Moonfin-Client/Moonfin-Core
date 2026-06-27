part of '../settings_side_panel.dart';

class _IntegrationsScreen extends StatefulWidget {
  const _IntegrationsScreen();

  @override
  State<_IntegrationsScreen> createState() => _IntegrationsScreenState();
}

class _IntegrationsScreenState extends State<_IntegrationsScreen> {
  final _integrationsScope = FocusScopeNode(
    debugLabel: 'IntegrationsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _integrationsScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.integrations)),
        body: FocusScope(
          node: _integrationsScope,
          autofocus: true,
          child: ListView(
            children: [
              _TvSettingsListTile(
                autofocus: true,
                leading: Image.asset(
                  'assets/icons/moonfin.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(l10n.pluginLabel),
                subtitle: Text(l10n.serverSyncAndPluginStatus),
                onTap: () => context.pushSettingsScreen(const _PluginScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.star, color: Color(0xFFFFC107)),
                title: Text(l10n.settingsMetadataAndRatings),
                subtitle: Text(l10n.mdbListTmdbRatingSources),
                onTap: () =>
                    context.pushSettingsScreen(const _MetadataRatingsScreen()),
              ),
              _TvSettingsListTile(
                leading: Image.asset(
                  'assets/icons/seerr.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(l10n.seerr),
                subtitle: Text(l10n.mediaRequestIntegration),
                onTap: () =>
                    context.pushSettingsScreen(const SeerrConfigScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.list_alt),
                title: Text(l10n.externalLists),
                subtitle: const Text('Configure external lists for display on the Home Screen.'),
                onTap: () =>
                    context.pushSettingsScreen(const _ExternalListsScreen()),
              ),
              _TvSettingsListTile(
                leading: Image.asset(
                  'assets/icons/hss.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(l10n.homeScreenSectionsTitle),
                subtitle: Text(l10n.homeScreenSectionsIntegrationDescription),
                onTap: () => context.pushSettingsScreen(
                  const HomeScreenSectionsIntegrationScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
