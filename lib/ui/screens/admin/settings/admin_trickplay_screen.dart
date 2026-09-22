import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../widgets/adaptive/adaptive_slider.dart';
import '../widgets/admin_form_styles.dart';

class AdminTrickplayScreen extends StatefulWidget {
  const AdminTrickplayScreen({super.key});

  @override
  State<AdminTrickplayScreen> createState() => _AdminTrickplayScreenState();
}

class _AdminTrickplayScreenState extends State<AdminTrickplayScreen> {
  late final AdminSystemApi _api;
  Map<String, dynamic>? _config;
  bool _loading = true;
  bool _saving = false;
  String? _error;

  static const _scanBehaviorKeys = ['NonBlocking', 'Blocking'];
  static const _priorityKeys = ['High', 'AboveNormal', 'Normal', 'BelowNormal', 'Idle'];

  List<(String, String)> _scanBehaviors(AppLocalizations l10n) => [
    ('NonBlocking', l10n.adminTrickplayNonBlocking),
    ('Blocking', l10n.adminTrickplayBlocking),
  ];

  List<(String, String)> _priorities(AppLocalizations l10n) => [
    ('High', l10n.adminTrickplayPriorityHigh),
    ('AboveNormal', l10n.adminTrickplayPriorityAboveNormal),
    ('Normal', l10n.adminTrickplayPriorityNormal),
    ('BelowNormal', l10n.adminTrickplayPriorityBelowNormal),
    ('Idle', l10n.adminTrickplayPriorityIdle),
  ];

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
        _config!['TrickplayOptions'] ??= <String, dynamic>{};
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
          SnackBar(content: Text(l10n.adminTrickplaySaved)),
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

  Map<String, dynamic> get _opts =>
      _config!['TrickplayOptions'] as Map<String, dynamic>;

  int _intOpt(String key, [int fallback = 0]) =>
      (_opts[key] as num?)?.toInt() ?? fallback;

  bool _boolOpt(String key) => _opts[key] as bool? ?? false;

  String _strOpt(String key, [String fallback = '']) =>
      _opts[key]?.toString() ?? fallback;

  String _widthResolutionsText() {
    final raw = _opts['WidthResolutions'];
    if (raw is List) return raw.map((e) => e.toString()).join(', ');
    return '320';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminTrickplayLoadFailed,
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

    final scanBehaviors = _scanBehaviors(l10n);
    final priorities = _priorities(l10n);

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminDrawerTrickplay,
          subtitle: l10n.adminTrickplayDescription,
          icon: Icons.view_comfy,
        ),
        adminSection(
          context,
          title: l10n.general,
          icon: Icons.tune,
          children: [
            adminSwitchRow(
              title: l10n.adminTrickplayHwAccel,
              value: _boolOpt('EnableHwAcceleration'),
              onChanged: (v) =>
                  setState(() => _opts['EnableHwAcceleration'] = v),
            ),
            adminSwitchRow(
              title: l10n.adminTrickplayHwEncoding,
              value: _boolOpt('EnableHwEncoding'),
              onChanged: (v) => setState(() => _opts['EnableHwEncoding'] = v),
            ),
            adminSwitchRow(
              title: l10n.adminTrickplayKeyFrameOnly,
              subtitle: l10n.adminTrickplayKeyFrameOnlySubtitle,
              value: _boolOpt('EnableKeyFrameOnlyExtraction'),
              onChanged: (v) =>
                  setState(() => _opts['EnableKeyFrameOnlyExtraction'] = v),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.spaceLg),
        DropdownButtonFormField<String>(
          initialValue: _scanBehaviorKeys.contains(_strOpt('ScanBehavior', 'NonBlocking'))
              ? _strOpt('ScanBehavior', 'NonBlocking')
              : 'NonBlocking',
          decoration: adminInputDecoration(label: l10n.adminTrickplayScanBehavior),
          items: scanBehaviors
              .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
              .toList(),
          onChanged: (v) => setState(() => _opts['ScanBehavior'] = v),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _priorityKeys.contains(_strOpt('ProcessPriority', 'BelowNormal'))
              ? _strOpt('ProcessPriority', 'BelowNormal')
              : 'BelowNormal',
          decoration:
              adminInputDecoration(label: l10n.adminTrickplayProcessPriority),
          items: priorities
              .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
              .toList(),
          onChanged: (v) => setState(() => _opts['ProcessPriority'] = v),
        ),
        adminSectionLabel(context, l10n.adminTrickplayImageSettings,
            icon: Icons.image_outlined),
        _intField('Interval', l10n.adminTrickplayInterval, fallback: 10000,
            subtitle: l10n.adminTrickplayIntervalSubtitle),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: _widthResolutionsText(),
          decoration: adminInputDecoration(
            label: l10n.adminTrickplayWidthResolutions,
            helper: l10n.adminTrickplayWidthResolutionsHint,
          ),
          onChanged: (v) {
            _opts['WidthResolutions'] = v
                .split(',')
                .map((s) => int.tryParse(s.trim()))
                .where((n) => n != null && n > 0)
                .toList();
          },
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _intField('TileWidth', l10n.adminTrickplayTileWidth, fallback: 10),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _intField('TileHeight', l10n.adminTrickplayTileHeight, fallback: 10),
            ),
          ],
        ),
        adminSectionLabel(context, l10n.adminTrickplayQuality,
            icon: Icons.high_quality_outlined),
        _sliderField('Qscale', l10n.adminTrickplayQScale, min: 2, max: 31, fallback: 4,
            subtitle: l10n.adminTrickplayQScaleSubtitle),
        const SizedBox(height: 16),
        _sliderField('JpegQuality', l10n.adminTrickplayJpegQuality, min: 1, max: 100,
            fallback: 90),
        adminSectionLabel(context, l10n.adminTrickplayProcessing,
            icon: Icons.memory),
        _intField('ProcessThreads', l10n.adminTrickplayProcessThreads, fallback: 1,
            subtitle: l10n.adminPlaybackAutomatic),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(label: l10n.save, saving: _saving, onPressed: _save),
      ],
    );
  }

  Widget _intField(String key, String label,
      {int fallback = 0, String? subtitle}) {
    return TextFormField(
      initialValue: _intOpt(key, fallback).toString(),
      decoration: adminInputDecoration(label: label, helper: subtitle),
      keyboardType: TextInputType.number,
      onChanged: (v) => _opts[key] = int.tryParse(v) ?? fallback,
    );
  }

  Widget _sliderField(
    String key,
    String label, {
    required double min,
    required double max,
    int fallback = 0,
    String? subtitle,
  }) {
    final value =
        _intOpt(key, fallback).clamp(min.toInt(), max.toInt()).toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        if (subtitle != null)
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        Row(
          children: [
            Expanded(
              child: adaptiveSlider(
                value: value,
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                label: value.toInt().toString(),
                onChanged: (v) => setState(() => _opts[key] = v.toInt()),
              ),
            ),
            SizedBox(
              width: 40,
              child: Text('${value.toInt()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ],
    );
  }
}
