import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../widgets/admin_form_styles.dart';

class AdminStreamingScreen extends StatefulWidget {
  const AdminStreamingScreen({super.key});

  @override
  State<AdminStreamingScreen> createState() => _AdminStreamingScreenState();
}

class _AdminStreamingScreenState extends State<AdminStreamingScreen> {
  late final AdminSystemApi _api;
  Map<String, dynamic>? _config;
  bool _loading = true;
  bool _saving = false;
  String? _error;

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
      if (!mounted) return;
      setState(() {
        _config = config;
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
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminStreamingSaved)),
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

  double _bitrateAsMbps() {
    final bps = (_config!['RemoteClientBitrateLimit'] as num?)?.toInt() ?? 0;
    return bps / 1000000.0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminStreamingLoadFailed,
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

    final mbps = _bitrateAsMbps();
    final bottomSafe = MediaQuery.of(context).padding.bottom;

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminDrawerStreaming,
          subtitle: l10n.adminStreamingDescription,
          icon: Icons.stream,
        ),
        adminSectionLabel(context, l10n.adminStreamingBitrateLimit,
            icon: Icons.speed),
        TextFormField(
          key: ValueKey(mbps),
          initialValue: mbps > 0 ? mbps.toStringAsFixed(1) : '',
          decoration: adminInputDecoration(
            label: l10n.adminStreamingBitrateLimit,
            helper: l10n.adminStreamingBitrateLimitHint,
            suffixText: 'Mbps',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (v) {
            final parsed = double.tryParse(v) ?? 0;
            _config!['RemoteClientBitrateLimit'] =
                (parsed * 1000000).truncate();
          },
        ),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(label: l10n.save, saving: _saving, onPressed: _save),
      ],
    );
  }
}
