part of '../settings_side_panel.dart';

/// Proxy, client identity and Emby authorization settings.
class _NetworkSettingsScreen extends StatefulWidget {
  const _NetworkSettingsScreen();

  @override
  State<_NetworkSettingsScreen> createState() => _NetworkSettingsScreenState();
}

class _NetworkSettingsScreenState extends State<_NetworkSettingsScreen> {
  final _networkScope = FocusScopeNode(
    debugLabel: 'NetworkSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _networkScope.dispose();
    super.dispose();
  }

  Future<void> _editRequestHeader([ServerRequestHeader? current]) async {
    final l10n = AppLocalizations.of(context);
    final formKey = GlobalKey<FormState>();
    var address = current?.origin ?? '';
    var name = current?.name ?? '';
    var value = current?.value ?? '';
    ServerRequestHeader? header;

    final result = await showFocusRestoringDialog<List<ServerRequestHeader>>(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        title: Text(
          current == null ? l10n.settingsAddRequestHeader : l10n.edit,
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: address,
                  autofocus: true,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: l10n.settingsRequestHeaderServer,
                    hintText: 'https://server.example',
                  ),
                  onChanged: (text) => address = text,
                ),
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(
                    labelText: l10n.settingsRequestHeaderName,
                    hintText: 'X-Custom-Header',
                  ),
                  onChanged: (text) => name = text,
                ),
                TextFormField(
                  initialValue: value,
                  decoration: InputDecoration(
                    labelText: l10n.settingsRequestHeaderValue,
                  ),
                  onChanged: (text) => value = text,
                  validator: (_) {
                    final candidate = ServerRequestHeader.tryCreate(
                      serverUrl: address,
                      name: name,
                      value: value,
                    );
                    if (candidate == null) {
                      return l10n.settingsRequestHeaderInvalid;
                    }
                    if (gServerRequestHeaders.any(
                      (entry) => entry != current && entry.matches(candidate),
                    )) {
                      return l10n.settingsRequestHeaderDuplicate;
                    }
                    header = candidate;
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          if (current != null)
            adaptiveDialogAction(
              onPressed: () => Navigator.pop(dialogContext, [
                for (final entry in gServerRequestHeaders)
                  if (entry != current) entry,
              ]),
              child: Text(l10n.remove),
            ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(dialogContext, [
                for (final entry in gServerRequestHeaders)
                  if (entry == current) header! else entry,
                if (current == null) header!,
              ]);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    if (!mounted || result == null) return;
    final store = GetIt.instance<PreferenceStore>();
    setState(() => gServerRequestHeaders = List.unmodifiable(result));
    await store.set(UserPreferences.serverRequestHeaders, [
      for (final entry in result) jsonEncode(entry.toJson()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomPad =
        (PlatformDetection.isTV ? 96.0 : 24.0) +
        MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsNetwork)),
      body: FocusScope(
        node: _networkScope,
        autofocus: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            _SectionHeader(l10n.settingsProxySection),
            adaptiveListSection(
              children: [
                _EditableStringPreferenceTile(
                  autofocus: true,
                  preference: UserPreferences.proxyUrl,
                  title: l10n.settingsProxyUrl,
                  icon: Icons.lan_outlined,
                  hintText: l10n.settingsProxyUrlHint,
                  onChanged: (value) => gServerProxyUrl = value,
                ),
              ],
            ),
            _SectionHeader(l10n.settingsClientIdentitySection),
            adaptiveListSection(
              children: [
                _EditableStringPreferenceTile(
                  preference: UserPreferences.serverUserAgent,
                  title: l10n.settingsUserAgent,
                  icon: Icons.badge_outlined,
                  hintText: l10n.settingsUserAgentHint,
                  onChanged: (value) => gServerUserAgentOverride = value,
                ),
                _EditableStringPreferenceTile(
                  preference: UserPreferences.serverClientName,
                  title: l10n.settingsClientName,
                  icon: Icons.apps_outlined,
                  hintText: l10n.settingsClientNameHint,
                  onChanged: (value) => gServerClientNameOverride = value,
                ),
              ],
            ),
            _SectionHeader(l10n.settingsCustomRequestHeaders),
            adaptiveListSection(
              children: [
                for (final header in gServerRequestHeaders)
                  _TvSettingsListTile(
                    key: ValueKey((header.origin, header.name.toLowerCase())),
                    leading: const Icon(Icons.http_outlined),
                    title: Text(header.name),
                    subtitle: Text(header.origin),
                    onTap: () => _editRequestHeader(header),
                  ),
                _TvSettingsListTile(
                  leading: const Icon(Icons.add),
                  title: Text(l10n.settingsAddRequestHeader),
                  subtitle: Text(l10n.settingsCustomRequestHeadersSubtitle),
                  onTap: () => _editRequestHeader(),
                ),
              ],
            ),
            _SectionHeader(l10n.settingsEmbyAuthorization),
            adaptiveListSection(
              children: [
                EnumPreferenceTile(
                  preference: UserPreferences.embyAuthorizationHeader,
                  title: l10n.settingsEmbyAuthorizationHeader,
                  icon: Icons.http_outlined,
                  labelOf: (value) => value.value,
                  onChangedValue: (value) => gEmbyAuthorizationHeader = value,
                ),
                EnumPreferenceTile(
                  preference: UserPreferences.embyAuthorizationScheme,
                  title: l10n.settingsEmbyAuthorizationScheme,
                  icon: Icons.key_outlined,
                  labelOf: (value) => value.value,
                  onChangedValue: (value) => gEmbyAuthorizationScheme = value,
                ),
                _EditableStringPreferenceTile(
                  preference: UserPreferences.embyDeviceName,
                  title: l10n.settingsEmbyDeviceName,
                  icon: Icons.devices_outlined,
                  hintText: l10n.settingsEmbyIdentityDefaultHint,
                  onChanged: (value) => gEmbyDeviceNameOverride = value,
                ),
                _EditableStringPreferenceTile(
                  preference: UserPreferences.embyDeviceId,
                  title: l10n.settingsEmbyDeviceId,
                  icon: Icons.fingerprint,
                  hintText: l10n.settingsEmbyIdentityDefaultHint,
                  onChanged: (value) => gEmbyDeviceIdOverride = value,
                ),
                _EditableStringPreferenceTile(
                  preference: UserPreferences.embyClientVersion,
                  title: l10n.settingsEmbyClientVersion,
                  icon: Icons.numbers_outlined,
                  hintText: l10n.settingsEmbyIdentityDefaultHint,
                  onChanged: (value) => gEmbyClientVersionOverride = value,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
