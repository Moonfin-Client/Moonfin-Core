part of '../settings_side_panel.dart';

/// Proxy, client identity and Emby authorization settings.
class _NetworkSettingsScreen extends StatefulWidget {
  const _NetworkSettingsScreen();

  @override
  State<_NetworkSettingsScreen> createState() => _NetworkSettingsScreenState();
}

/// What the request-header dialog returns: a header to save, or a removal.
class _RequestHeaderEditResult {
  const _RequestHeaderEditResult.save(this.header) : remove = false;
  const _RequestHeaderEditResult.remove() : header = null, remove = true;

  final ServerRequestHeader? header;
  final bool remove;
}

/// Adds or edits one custom request header.
///
/// The fields go through [_SettingsDialogTextField] so a remote's D-pad can
/// open a keyboard, and validation runs on save and reports under the value
/// field, which is the only place an incomplete row shows itself.
class _RequestHeaderDialog extends StatefulWidget {
  final ServerRequestHeader? current;

  const _RequestHeaderDialog({this.current});

  @override
  State<_RequestHeaderDialog> createState() => _RequestHeaderDialogState();
}

class _RequestHeaderDialogState extends State<_RequestHeaderDialog> {
  late final _address = TextEditingController(
    text: widget.current?.origin ?? '',
  );
  late final _name = TextEditingController(text: widget.current?.name ?? '');
  late final _value = TextEditingController(text: widget.current?.value ?? '');
  String? _error;

  @override
  void dispose() {
    _address.dispose();
    _name.dispose();
    _value.dispose();
    super.dispose();
  }

  void _save() {
    final l10n = AppLocalizations.of(context);
    final candidate = ServerRequestHeader.tryCreate(
      serverUrl: _address.text,
      name: _name.text,
      value: _value.text,
    );
    if (candidate == null) {
      setState(() => _error = l10n.settingsRequestHeaderInvalid);
      return;
    }
    if (gServerRequestHeaders.any(
      (entry) => entry != widget.current && entry.matches(candidate),
    )) {
      setState(() => _error = l10n.settingsRequestHeaderDuplicate);
      return;
    }
    Navigator.pop(context, _RequestHeaderEditResult.save(candidate));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog.adaptive(
      title: Text(
        widget.current == null ? l10n.settingsAddRequestHeader : l10n.edit,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SettingsDialogTextField(
              key: const ValueKey('request-header-server'),
              controller: _address,
              label: l10n.settingsRequestHeaderServer,
              hint: 'https://server.example',
              autofocus: true,
            ),
            _SettingsDialogTextField(
              key: const ValueKey('request-header-name'),
              controller: _name,
              label: l10n.settingsRequestHeaderName,
              hint: 'X-Custom-Header',
            ),
            _SettingsDialogTextField(
              key: const ValueKey('request-header-value'),
              controller: _value,
              label: l10n.settingsRequestHeaderValue,
              errorText: _error,
            ),
          ],
        ),
      ),
      actions: [
        if (widget.current != null)
          adaptiveDialogAction(
            onPressed: () =>
                Navigator.pop(context, const _RequestHeaderEditResult.remove()),
            child: Text(l10n.remove),
          ),
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        adaptiveDialogAction(onPressed: _save, child: Text(l10n.save)),
      ],
    );
  }
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
    final result = await showFocusRestoringDialog<_RequestHeaderEditResult>(
      context: context,
      builder: (_) => _RequestHeaderDialog(current: current),
    );

    if (!mounted || result == null) return;
    final updated = result.remove
        ? [
            for (final entry in gServerRequestHeaders)
              if (entry != current) entry,
          ]
        : [
            for (final entry in gServerRequestHeaders)
              if (entry == current) result.header! else entry,
            if (current == null) result.header!,
          ];
    final store = GetIt.instance<PreferenceStore>();
    setState(() => gServerRequestHeaders = List.unmodifiable(updated));
    await store.set(UserPreferences.serverRequestHeaders, [
      for (final entry in updated) jsonEncode(entry.toJson()),
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
                  // Empty means a direct connection. Anything else has to parse
                  // into a host and port that dart:io can route through.
                  validator: (value) =>
                      value.trim().isEmpty || serverProxyRuleFor(value) != null
                      ? null
                      : l10n.settingsProxyUrlInvalid,
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
