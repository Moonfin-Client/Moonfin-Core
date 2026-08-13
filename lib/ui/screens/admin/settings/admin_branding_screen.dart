import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../util/image_mime.dart';
import '../widgets/admin_form_styles.dart';

class AdminBrandingScreen extends StatefulWidget {
  const AdminBrandingScreen({super.key});

  @override
  State<AdminBrandingScreen> createState() => _AdminBrandingScreenState();
}

class _AdminBrandingScreenState extends State<AdminBrandingScreen> {
  late final MediaServerClient _client;
  AdminSystemApi get _api => _client.adminSystemApi;
  Map<String, dynamic>? _config;
  bool _loading = true;
  bool _saving = false;
  bool _uploadingSplash = false;
  int _splashVersion = 0;
  String? _error;

  @override
  void initState() {
    super.initState();
    _client = GetIt.instance<MediaServerClient>();
    _load();
  }

  Future<void> _uploadSplashscreen() async {
    final l10n = AppLocalizations.of(context);
    final result = await FilePicker.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: const ['png', 'jpg', 'jpeg', 'webp', 'gif', 'bmp'],
      withData: true,
    );
    if (!mounted || result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final contentType = imageContentTypeForFileName(file.name);
    final bytes = file.bytes ??
        (file.path != null ? await File(file.path!).readAsBytes() : null);
    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    if (contentType == null || bytes == null) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminBrandingSplashUploadFailed)),
      );
      return;
    }
    setState(() => _uploadingSplash = true);
    try {
      await _api.uploadSplashscreen(bytes, contentType);
      if (!mounted) return;
      setState(() => _splashVersion++);
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminBrandingSplashUploaded)),
      );
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminBrandingSplashUploadFailed)),
      );
    } finally {
      if (mounted) setState(() => _uploadingSplash = false);
    }
  }

  Future<void> _deleteSplashscreen() async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _uploadingSplash = true);
    try {
      await _api.deleteSplashscreen();
      if (!mounted) return;
      setState(() => _splashVersion++);
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminBrandingSplashDeleted)),
      );
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminSettingsSaveFailed(e.toString()))),
      );
    } finally {
      if (mounted) setState(() => _uploadingSplash = false);
    }
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final config = await _api.getNamedConfiguration('branding');
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
      await _api.updateNamedConfiguration('branding', _config!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).adminBrandingSaved)),
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

  Widget _buildSplashscreenManager(AppLocalizations l10n) {
    final base = _client.baseUrl.replaceAll(RegExp(r'/+$'), '');
    final url = '$base/Branding/Splashscreen?t=$_splashVersion';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: AppRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColorScheme.onSurface.withValues(alpha: 0.05),
              ),
              child: Image.network(
                url,
                key: ValueKey(_splashVersion),
                headers: serverImageHeaders,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.image_not_supported_outlined,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.4)),
                      const SizedBox(height: 8),
                      Text(
                        l10n.adminBrandingNoSplash,
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spaceMd),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: _uploadingSplash ? null : _uploadSplashscreen,
                icon: _uploadingSplash
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.upload_outlined),
                label: Text(l10n.adminBrandingSplashUpload),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: _uploadingSplash ? null : _deleteSplashscreen,
              icon: const Icon(Icons.delete_outline),
              label: Text(l10n.delete),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminBrandingLoadFailed,
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
          title: l10n.adminBrandingTitle,
          icon: Icons.brush_outlined,
        ),
        adminSectionLabel(context, l10n.adminBrandingLoginDisclaimer,
            icon: Icons.gavel_outlined),
        TextFormField(
          initialValue: _config!['LoginDisclaimer']?.toString() ?? '',
          decoration: adminInputDecoration(
            label: l10n.adminBrandingLoginDisclaimer,
            hint: l10n.adminBrandingLoginDisclaimerHint,
          ),
          maxLines: 5,
          onChanged: (v) => _config!['LoginDisclaimer'] = v,
        ),
        adminSectionLabel(context, l10n.adminBrandingCustomCss,
            icon: Icons.code),
        TextFormField(
          initialValue: _config!['CustomCss']?.toString() ?? '',
          decoration: adminInputDecoration(
            label: l10n.adminBrandingCustomCss,
            hint: l10n.adminBrandingCustomCssHint,
          ),
          maxLines: 10,
          style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
          onChanged: (v) => _config!['CustomCss'] = v,
        ),
        adminSection(
          context,
          title: l10n.adminBrandingEnableSplash,
          icon: Icons.image_outlined,
          children: [
            adminSwitchRow(
              title: l10n.adminBrandingEnableSplash,
              value: _config!['SplashscreenEnabled'] as bool? ?? false,
              onChanged: (v) =>
                  setState(() => _config!['SplashscreenEnabled'] = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.spaceMd),
        _buildSplashscreenManager(l10n),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(label: l10n.save, saving: _saving, onPressed: _save),
      ],
    );
  }
}
