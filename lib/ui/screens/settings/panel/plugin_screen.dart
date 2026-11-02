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

  MediaServerClient? get _client =>
      GetIt.instance.isRegistered<MediaServerClient>()
      ? GetIt.instance<MediaServerClient>()
      : null;

  Future<void> _refresh(BuildContext context) async {
    final client = _client;
    if (client == null) return;
    final l10n = AppLocalizations.of(context);
    final syncService = GetIt.instance<PluginSyncService>();
    forgetMoonbaseEndpoint(client);
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

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          return FocusScope(
            node: _pluginScope,
            autofocus: true,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.settingsSync),
                actions: [
                  IconButton(
                    focusNode: _refreshFocusNode,
                    icon: const Icon(Icons.refresh),
                    onPressed: () => _refresh(context),
                  ),
                ],
              ),
              body: ListView(
                controller: _scrollController,
                padding: EdgeInsets.only(
                  bottom: 48 + MediaQuery.paddingOf(context).bottom,
                ),
                children: [
                  if (_client case final client?)
                    if (plexMoonbasePreference(client)
                        case final moonbaseUrl?)
                      _EditableStringPreferenceTile(
                        preference: moonbaseUrl,
                        title: l10n.moonbaseAddress,
                        icon: Icons.dns_outlined,
                        hintText: plexMoonbaseDefault(client) ?? '',
                        onChanged: (_) => _refresh(context),
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
