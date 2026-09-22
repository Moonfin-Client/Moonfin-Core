import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../widgets/admin_form_styles.dart';
import '../widgets/filesystem_browser.dart';

class AdminGeneralSettingsScreen extends StatefulWidget {
  const AdminGeneralSettingsScreen({super.key});

  @override
  State<AdminGeneralSettingsScreen> createState() =>
      _AdminGeneralSettingsScreenState();
}

class _AdminGeneralSettingsScreenState
    extends State<AdminGeneralSettingsScreen> {
  late final AdminSystemApi _api;
  Map<String, dynamic>? _config;
  List<Map<String, dynamic>> _cultures = const [];
  List<Map<String, dynamic>> _countries = const [];
  List<Map<String, dynamic>> _localizationOptions = const [];
  bool _loading = true;
  bool _saving = false;
  String? _error;
  String? _browsingField;

  @override
  void initState() {
    super.initState();
    _api = GetIt.instance<MediaServerClient>().adminSystemApi;
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final config = await _api.getServerConfiguration();
      // Language/country lists are optional; degrade to empty on older servers.
      final cultures = await _api
          .getCultures()
          .catchError((_) => <Map<String, dynamic>>[]);
      final countries = await _api
          .getCountries()
          .catchError((_) => <Map<String, dynamic>>[]);
      final localizationOptions = await _api
          .getLocalizationOptions()
          .catchError((_) => <Map<String, dynamic>>[]);
      if (!mounted) return;
      setState(() {
        _config = config;
        _cultures = cultures;
        _countries = countries;
        _localizationOptions = localizationOptions;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  Future<void> _save() async {
    if (_config == null) return;
    setState(() => _saving = true);
    try {
      await _api.updateServerConfiguration(_config!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).adminSettingsSaved)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminSettingsSaveFailed(describeError(e, l10n)))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final l10n = AppLocalizations.of(context);
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminSettingsLoadFailed,
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

    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminGeneralSettingsTitle,
          icon: Icons.settings_outlined,
        ),
        adminSectionLabel(context, l10n.adminGeneralSectionServer,
            icon: Icons.dns_outlined),
        _textField('ServerName', l10n.adminGeneralServerName),
        const SizedBox(height: 12),
        _buildDisplayLanguageDropdown(l10n),
        const SizedBox(height: 8),
        adminGlassGroup(context, children: [
          _switchTile('QuickConnectAvailable', l10n.adminGeneralQuickConnect),
        ]),
        adminSectionLabel(context, l10n.adminGeneralSectionMetadata,
            icon: Icons.language),
        _buildLanguageDropdown(l10n),
        const SizedBox(height: 12),
        _buildCountryDropdown(l10n),
        adminSectionLabel(context, l10n.adminGeneralSectionPaths,
            icon: Icons.folder_outlined),
        _pathField('CachePath', l10n.adminGeneralCachePath),
        const SizedBox(height: 12),
        _pathField('MetadataPath', l10n.adminGeneralMetadataPath),
        adminSectionLabel(context, l10n.adminGeneralSectionPerformance,
            icon: Icons.speed),
        _intField('LibraryScanFanoutConcurrency',
            l10n.adminGeneralLibraryScanConcurrency),
        const SizedBox(height: 12),
        _intField(
            'ParallelImageEncodingLimit', l10n.adminGeneralImageEncodingLimit),
        const SizedBox(height: 12),
        _intField(
            'SlowResponseThresholdMs', l10n.adminGeneralSlowResponseThreshold),
        const SizedBox(height: 8),
        adminGlassGroup(context, children: [
          _switchTile(
              'EnableSlowResponseWarning', l10n.adminGeneralEnableSlowResponse),
        ]),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(
          label: l10n.save,
          saving: _saving,
          onPressed: _save,
        ),
      ],
    );
  }

  Widget _switchTile(String key, String title) {
    return adminSwitchRow(
      title: title,
      value: _config![key] as bool? ?? false,
      onChanged: (v) => setState(() => _config![key] = v),
    );
  }

  Widget _buildLanguageDropdown(AppLocalizations l10n) {
    final current = _config!['PreferredMetadataLanguage']?.toString() ?? '';
    if (_cultures.isEmpty) {
      return _textField('PreferredMetadataLanguage',
          l10n.adminGeneralMetadataLanguage,
          hint: l10n.adminGeneralMetadataLanguageHint);
    }
    return adminCodeDropdown(
      label: l10n.adminGeneralMetadataLanguage,
      defaultLabel: l10n.adminLibDefault,
      current: current,
      rawItems: _cultures.map((c) => (
            (c['TwoLetterISOLanguageName'] ?? c['ThreeLetterISOLanguageName'])
                ?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          )),
      onChanged: (v) =>
          setState(() => _config!['PreferredMetadataLanguage'] = v),
    );
  }

  Widget _buildDisplayLanguageDropdown(AppLocalizations l10n) {
    final current = _config!['UICulture']?.toString() ?? '';
    if (_localizationOptions.isEmpty) {
      return _textField('UICulture', l10n.adminGeneralDisplayLanguage);
    }
    return adminCodeDropdown(
      label: l10n.adminGeneralDisplayLanguage,
      defaultLabel: l10n.adminLibDefault,
      current: current,
      rawItems: _localizationOptions.map((o) => (
            o['Value']?.toString(),
            (o['Name'] ?? o['Value'])?.toString(),
          )),
      onChanged: (v) => setState(() => _config!['UICulture'] = v),
    );
  }

  Widget _buildCountryDropdown(AppLocalizations l10n) {
    final current = _config!['MetadataCountryCode']?.toString() ?? '';
    if (_countries.isEmpty) {
      return _textField('MetadataCountryCode', l10n.adminGeneralMetadataCountry,
          hint: l10n.adminGeneralMetadataCountryHint);
    }
    return adminCodeDropdown(
      label: l10n.adminGeneralMetadataCountry,
      defaultLabel: l10n.adminLibDefault,
      current: current,
      rawItems: _countries.map((c) => (
            (c['TwoLetterISORegionName'] ?? c['Name'])?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          )),
      onChanged: (v) => setState(() => _config!['MetadataCountryCode'] = v),
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

  Widget _pathField(String key, String label) {
    final isBrowsing = _browsingField == key;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: ValueKey(_config![key]),
                initialValue: _config![key]?.toString() ?? '',
                decoration: adminInputDecoration(label: label),
                onChanged: (v) => _config![key] = v,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(isBrowsing ? Icons.close : Icons.folder_open),
              tooltip: isBrowsing ? AppLocalizations.of(context).adminCloseBrowser : AppLocalizations.of(context).adminBrowse,
              onPressed: () => setState(() {
                _browsingField = isBrowsing ? null : key;
              }),
            ),
          ],
        ),
        if (isBrowsing) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: FilesystemBrowser(
              initialPath: _config![key]?.toString(),
              onPathSelected: (path) {
                setState(() {
                  _config![key] = path;
                  _browsingField = null;
                });
              },
            ),
          ),
        ],
      ],
    );
  }
}
