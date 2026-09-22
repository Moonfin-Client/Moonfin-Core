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
  void initState() {
    super.initState();
    // A session switch clears the flag before it knows whether it will get far
    // enough to probe again, so ask here rather than trust what login left.
    final achievements = GetIt.instance<AchievementsService>();
    if (!achievements.available &&
        GetIt.instance.isRegistered<MediaServerClient>()) {
      unawaited(
        achievements.refreshAvailability(GetIt.instance<MediaServerClient>()),
      );
    }
  }

  @override
  void dispose() {
    _integrationsScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final achievementsService = GetIt.instance<AchievementsService>();
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.integrations)),
        body: FocusScope(
          node: _integrationsScope,
          autofocus: true,
          // The plugin probe lands after sign in, so the list waits on it
          // rather than reading the flag once and never hearing the answer.
          child: ListenableBuilder(
            listenable: achievementsService,
            builder: (context, _) => _buildList(l10n, achievementsService),
          ),
        ),
      ),
    );
  }

  Widget _buildList(AppLocalizations l10n, AchievementsService achievements) {
    final seerrLabel = GetIt.instance<SeerrPreferences>().labelOrDefault(
      l10n.seerr,
    );
    return ListView(
      children: [
        _SectionHeader(l10n.general),
        adaptiveListSection(
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
              onTap: () =>
                  context.pushSettingsScreen(const _PluginScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.star, color: Color(0xFFFFC107)),
              title: Text(l10n.settingsMetadataAndRatings),
              subtitle: Text(l10n.mdbListTmdbRatingSources),
              onTap: () => context.pushSettingsScreen(
                const _MetadataRatingsScreen(),
              ),
            ),
            _TvSettingsListTile(
              leading: Image.asset(
                'assets/icons/seerr.png',
                width: 24,
                height: 24,
              ),
              title: Text(seerrLabel),
              subtitle: Text(l10n.mediaRequestIntegration),
              onTap: () =>
                  context.pushSettingsScreen(const SeerrConfigScreen()),
            ),
            if (achievements.available)
              _TvSettingsListTile(
                leading: const Icon(
                  Icons.military_tech,
                  color: Color(0xFFFFC107),
                ),
                title: Text(l10n.achievementBadges),
                subtitle: Text(l10n.achievementBadgesSubtitle),
                onTap: () => context.pushSettingsScreen(
                  const AchievementsScreen(),
                ),
              ),
            if (GetIt.instance<PluginSyncService>().seerrAvailable)
              _TvSettingsListTile(
                leading: const Icon(Icons.list_alt),
                title: Text(l10n.externalLists),
                subtitle: const Text(
                  'Configure external lists for display on the Home Screen.',
                ),
                onTap: () => context.pushSettingsScreen(
                  const _ExternalListsScreen(),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
