import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../widgets/admin_form_styles.dart';

/// Kodi/NFO metadata saver settings, backed by the named `xbmcmetadata`
/// configuration. Mirrors jellyfin-web's Libraries > NFO Settings page.
class AdminLibraryNfoScreen extends StatefulWidget {
  const AdminLibraryNfoScreen({super.key});

  @override
  State<AdminLibraryNfoScreen> createState() => _AdminLibraryNfoScreenState();
}

class _AdminLibraryNfoScreenState extends State<AdminLibraryNfoScreen> {
  late final MediaServerClient _client;
  Map<String, dynamic>? _config;
  List<ServerUser> _users = const [];
  bool _loading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _client = GetIt.instance<MediaServerClient>();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final config =
          await _client.adminSystemApi.getNamedConfiguration('xbmcmetadata');
      final users = await _client.adminUsersApi
          .getUsers()
          .catchError((_) => <ServerUser>[]);
      if (!mounted) return;
      setState(() {
        _config = config;
        _users = users;
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
      final format = (_config!['ReleaseDateFormat'] as String?) ?? '';
      _config!['ReleaseDateFormat'] =
          format.isEmpty ? 'yyyy-MM-dd' : format;
      await _client.adminSystemApi
          .updateNamedConfiguration('xbmcmetadata', _config!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).adminSettingsSaved)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.adminSettingsSaveFailed(describeError(e, l10n))),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _switchTile(String key, String title) {
    return adminSwitchRow(
      title: title,
      value: _config![key] as bool? ?? false,
      onChanged: (v) => setState(() => _config![key] = v),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
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
    final currentUser = _config!['UserId']?.toString() ?? '';
    final userIds = _users.map((u) => u.id).toList();
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminLibNfoTitle,
          subtitle: l10n.adminLibNfoHelp,
          icon: Icons.text_snippet_outlined,
        ),
        adminSectionLabel(context, l10n.adminLibKodiUser, icon: Icons.person_outline),
        DropdownButtonFormField<String>(
          initialValue: userIds.contains(currentUser) ? currentUser : '',
          decoration: adminInputDecoration(label: l10n.adminLibKodiUser),
          items: [
            DropdownMenuItem(value: '', child: Text(l10n.adminLibNone)),
            ..._users.map((u) =>
                DropdownMenuItem(value: u.id, child: Text(u.name ?? u.id))),
          ],
          onChanged: (v) =>
              setState(() => _config!['UserId'] = (v ?? '').isEmpty ? null : v),
        ),
        adminSection(
          context,
          title: l10n.adminDrawerNfo,
          icon: Icons.tune,
          children: [
            _switchTile('SaveImagePathsInNfo', l10n.adminLibSaveImagePaths),
            _switchTile('EnablePathSubstitution', l10n.adminLibPathSubstitution),
            _switchTile(
                'EnableExtraThumbsDuplication', l10n.adminLibExtraThumbs),
          ],
        ),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(label: l10n.save, saving: _saving, onPressed: _save),
      ],
    );
  }
}
