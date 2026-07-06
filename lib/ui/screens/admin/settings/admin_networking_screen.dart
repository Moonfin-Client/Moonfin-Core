import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../widgets/admin_form_styles.dart';
import '../widgets/filesystem_browser.dart';

class AdminNetworkingScreen extends StatefulWidget {
  const AdminNetworkingScreen({super.key});

  @override
  State<AdminNetworkingScreen> createState() => _AdminNetworkingScreenState();
}

class _AdminNetworkingScreenState extends State<AdminNetworkingScreen> {
  late final AdminSystemApi _api;
  Map<String, dynamic>? _config;
  bool _loading = true;
  bool _saving = false;
  String? _error;
  bool _showCertBrowser = false;
  final _listControllers = <String, TextEditingController>{};

  @override
  void initState() {
    super.initState();
    _api = GetIt.instance<MediaServerClient>().adminSystemApi;
    _load();
  }

  @override
  void dispose() {
    for (final c in _listControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final config = await _api.getNamedConfiguration('network');
      if (!mounted) return;
      setState(() {
        _config = config;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _save() async {
    if (_config == null) return;
    setState(() => _saving = true);
    try {
      await _api.updateNamedConfiguration('network', _config!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).adminNetworkingSaved),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).adminSettingsSaveFailed(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final l10n = AppLocalizations.of(context);
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminNetworkingLoadFailed,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(_error ?? l10n.adminUnknownError,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            FilledButton.tonal(onPressed: _load, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminNetworkingTitle,
          subtitle: l10n.adminNetworkingRestartWarning,
          icon: Icons.lan_outlined,
        ),
        adminSection(
          context,
          title: l10n.adminNetworkingRemoteAccess,
          icon: Icons.public,
          children: [
            _switchTile('EnableRemoteAccess', l10n.adminNetworkingRemoteAccess),
          ],
        ),
        adminSectionLabel(context, l10n.adminNetworkingPorts,
            icon: Icons.settings_ethernet),
        _portField('HttpServerPortNumber', 'InternalHttpPort', l10n.adminNetworkingHttpPort),
        const SizedBox(height: AppSpacing.spaceMd),
        _portField('HttpsPortNumber', 'InternalHttpsPort', l10n.adminNetworkingHttpsPort),
        const SizedBox(height: AppSpacing.spaceMd),
        _intField('PublicHttpPort', l10n.adminNetworkingPublicHttpPort),
        const SizedBox(height: AppSpacing.spaceMd),
        _intField('PublicHttpsPort', l10n.adminNetworkingPublicHttpsPort),
        const SizedBox(height: AppSpacing.spaceMd),
        _textField('BaseUrl', l10n.adminNetworkingBaseUrl,
            hint: l10n.adminNetworkingBaseUrlHint),
        adminSection(
          context,
          title: l10n.adminNetworkingIpSettings,
          icon: Icons.settings_input_antenna,
          children: [
            _switchTile('EnableIPv4', l10n.adminNetworkingEnableIpv4),
            _switchTile('EnableIPv6', l10n.adminNetworkingEnableIpv6),
            _switchTile('AutoDiscovery', l10n.adminNetworkingAutoDiscovery),
          ],
        ),
        adminSection(
          context,
          title: l10n.adminNetworkingHttps,
          icon: Icons.lock_outline,
          children: [
            _switchTile('EnableHttps', l10n.adminNetworkingEnableHttps),
            _switchTile('RequireHttps', l10n.adminNetworkingRequireHttps),
          ],
        ),
        const SizedBox(height: AppSpacing.spaceMd),
        _certPathField(),
        const SizedBox(height: AppSpacing.spaceMd),
        _textField('CertificatePassword', l10n.adminNetworkingCertPassword),
        adminSectionLabel(context, l10n.adminNetworkingLocalNetwork,
            icon: Icons.router_outlined),
        _listEditor(
          'LocalNetworkAddresses',
          l10n.adminNetworkingLocalAddresses,
          hint: l10n.adminNetworkingAddressHint,
        ),
        const SizedBox(height: AppSpacing.spaceLg),
        _listEditor(
          'LocalNetworkSubnets',
          l10n.adminNetworkingLocalSubnets,
          hint: l10n.adminNetworkingLocalSubnetsHint,
        ),
        const SizedBox(height: AppSpacing.spaceLg),
        _listEditor(
          'KnownProxies',
          l10n.adminNetworkingKnownProxies,
          hint: l10n.adminNetworkingProxyHint,
        ),
        adminSectionLabel(context, l10n.adminNetworkingPublishedUris,
            icon: Icons.link),
        _listEditor(
          'PublishedServerUriBySubnet',
          l10n.adminNetworkingPublishedUris,
          hint: l10n.adminNetworkingPublishedUriHint,
        ),
        adminSectionLabel(context, l10n.adminNetworkingRemoteIpFilter,
            icon: Icons.filter_alt_outlined),
        _filterModeSelector(),
        const SizedBox(height: AppSpacing.spaceMd),
        _listEditor(
          'RemoteIPFilter',
          l10n.adminNetworkingRemoteIpFilterLabel,
          hint: l10n.adminNetworkingAddressHint,
        ),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(
          label: l10n.save,
          saving: _saving,
          onPressed: _save,
        ),
      ],
    );
  }

  Widget _textField(String key, String label, {String? hint}) {
    return TextFormField(
      initialValue: _config![key]?.toString() ?? '',
      decoration: adminInputDecoration(label: label, hint: hint),
      onChanged: (v) => _config![key] = v,
    );
  }

  Widget _intField(String key, String label) {
    return TextFormField(
      initialValue: (_config![key] as num?)?.toString() ?? '0',
      decoration: adminInputDecoration(label: label),
      keyboardType: TextInputType.number,
      onChanged: (v) => _config![key] = int.tryParse(v) ?? 0,
    );
  }

  Widget _portField(String legacyKey, String modernKey, String label) {
    final String key = _config!.containsKey(modernKey) ? modernKey : legacyKey;
    return TextFormField(
      initialValue: (_config![key] as num?)?.toString() ?? '0',
      decoration: adminInputDecoration(label: label),
      keyboardType: TextInputType.number,
      onChanged: (v) {
        final val = int.tryParse(v) ?? 0;
        _config![key] = val;
        if (_config!.containsKey(modernKey)) {
          _config![modernKey] = val;
        }
        if (_config!.containsKey(legacyKey)) {
          _config![legacyKey] = val;
        }
      },
    );
  }

  Widget _switchTile(String key, String title) {
    return adminSwitchRow(
      title: title,
      value: _config![key] as bool? ?? false,
      onChanged: (v) => setState(() => _config![key] = v),
    );
  }

  Widget _certPathField() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: ValueKey(_config!['CertificatePath']),
                initialValue: _config!['CertificatePath']?.toString() ?? '',
                decoration:
                    adminInputDecoration(label: l10n.adminNetworkingCertPath),
                onChanged: (v) => _config!['CertificatePath'] = v,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon:
                  Icon(_showCertBrowser ? Icons.close : Icons.folder_open),
              tooltip: _showCertBrowser ? l10n.adminCloseBrowser : l10n.adminBrowse,
              onPressed: () =>
                  setState(() => _showCertBrowser = !_showCertBrowser),
            ),
          ],
        ),
        if (_showCertBrowser) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: FilesystemBrowser(
              initialPath: _config!['CertificatePath']?.toString(),
              onPathSelected: (path) {
                setState(() {
                  _config!['CertificatePath'] = path;
                  _showCertBrowser = false;
                });
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _filterModeSelector() {
    final l10n = AppLocalizations.of(context);
    final isBlacklist =
        _config!['IsRemoteIPFilterBlacklist'] as bool? ?? false;
    return Row(
      children: [
        ChoiceChip(
          label: Text(l10n.adminNetworkingWhitelist),
          selected: !isBlacklist,
          onSelected: (v) {
            if (v) {
              setState(
                  () => _config!['IsRemoteIPFilterBlacklist'] = false);
            }
          },
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: Text(l10n.adminNetworkingBlacklist),
          selected: isBlacklist,
          onSelected: (v) {
            if (v) {
              setState(
                  () => _config!['IsRemoteIPFilterBlacklist'] = true);
            }
          },
        ),
      ],
    );
  }

  TextEditingController _controllerFor(String key) {
    return _listControllers.putIfAbsent(key, () => TextEditingController());
  }

  void _addListItem(String key) {
    final controller = _controllerFor(key);
    final v = controller.text.trim();
    if (v.isEmpty) return;
    final items = List<String>.from(
        (_config![key] as List<dynamic>?) ?? <dynamic>[]);
    items.add(v);
    _config![key] = items;
    controller.clear();
    setState(() {});
  }

  Widget _listEditor(String key, String label, {String? hint}) {
    final items = List<String>.from(
        (_config![key] as List<dynamic>?) ?? <dynamic>[]);
    final controller = _controllerFor(key);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColorScheme.onSurface.withValues(alpha: 0.85),
            )),
        if (hint != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 4),
            child: Text(hint,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                )),
          ),
        const SizedBox(height: AppSpacing.spaceSm),
        if (items.isNotEmpty)
          Wrap(
            spacing: AppSpacing.spaceSm,
            runSpacing: AppSpacing.spaceXs,
            children: items
                .asMap()
                .entries
                .map((entry) => Chip(
                      label: Text(entry.value,
                          style: const TextStyle(
                              fontFamily: 'monospace', fontSize: 12.5)),
                      onDeleted: () {
                        setState(() {
                          items.removeAt(entry.key);
                          _config![key] = items;
                        });
                      },
                      backgroundColor:
                          AppColorScheme.onSurface.withValues(alpha: 0.06),
                      side: BorderSide(
                          color: AppColorScheme.onSurface
                              .withValues(alpha: 0.10)),
                    ))
                .toList(),
          ),
        if (items.isNotEmpty) const SizedBox(height: AppSpacing.spaceSm),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: adminInputDecoration(
                  hint: AppLocalizations.of(context).adminNetworkingAddEntry,
                ),
                onSubmitted: (_) => _addListItem(key),
              ),
            ),
            const SizedBox(width: AppSpacing.spaceSm),
            IconButton.filledTonal(
              icon: const Icon(Icons.add),
              onPressed: () => _addListItem(key),
            ),
          ],
        ),
      ],
    );
  }
}
