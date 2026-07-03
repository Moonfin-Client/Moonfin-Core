part of '../settings_side_panel.dart';

class _PluginScreen extends StatefulWidget {
  const _PluginScreen();

  @override
  State<_PluginScreen> createState() => _PluginScreenState();
}

class _PluginScreenState extends State<_PluginScreen> {
  final _pluginScope = FocusScopeNode(
    debugLabel: 'PluginSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  final _scrollController = ScrollController();
  final _refreshFocusNode = FocusNode(debugLabel: 'PluginRefreshButton');

  @override
  void initState() {
    super.initState();
    _refreshFocusNode.addListener(_onRefreshFocusChange);
  }

  @override
  void dispose() {
    _refreshFocusNode.removeListener(_onRefreshFocusChange);
    _refreshFocusNode.dispose();
    _scrollController.dispose();
    _pluginScope.dispose();
    super.dispose();
  }

  void _onRefreshFocusChange() {
    if (_refreshFocusNode.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          final l10n = AppLocalizations.of(context);
          return FocusScope(
            node: _pluginScope,
            autofocus: true,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.pluginLabel),
                actions: [
                  IconButton(
                    focusNode: _refreshFocusNode,
                    autofocus: true,
                    icon: const Icon(Icons.refresh),
                    onPressed: () async {
                      if (GetIt.instance.isRegistered<MediaServerClient>()) {
                        final client = GetIt.instance<MediaServerClient>();
                        final syncService = GetIt.instance<PluginSyncService>();
                        await syncService.refreshAvailability(client);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                syncService.pluginAvailable
                                    ? l10n.pluginDetected
                                    : l10n.pluginNotDetected,
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
              body: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.only(bottom: 48),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: AppRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.extension,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              l10n.settingsPluginScreenDescription,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const PluginSettingsSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
