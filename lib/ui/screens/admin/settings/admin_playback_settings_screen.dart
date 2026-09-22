import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../widgets/admin_form_styles.dart';
import '../widgets/filesystem_browser.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';

class AdminPlaybackSettingsScreen extends StatefulWidget {
  const AdminPlaybackSettingsScreen({super.key});

  @override
  State<AdminPlaybackSettingsScreen> createState() =>
      _AdminPlaybackSettingsScreenState();
}

class _AdminPlaybackSettingsScreenState
    extends State<AdminPlaybackSettingsScreen> {
  late final AdminSystemApi _api;
  Map<String, dynamic>? _config;
  bool _loading = true;
  bool _saving = false;
  String? _error;
  String? _browsingField;

  static const _hwAccelOptions = [
    ('none', 'none'),
    ('amf', 'AMD AMF'),
    ('vaapi', 'VA-API'),
    ('qsv', 'qsv'),
    ('nvenc', 'NVIDIA NVENC'),
    ('v4l2m2m', 'V4L2'),
    ('rkmpp', 'rkmpp'),
    ('videotoolbox', 'VideoToolbox'),
  ];

  static const _hwDecodeCodecs = [
    ('h264', 'H.264'),
    ('hevc', 'HEVC'),
    ('mpeg2video', 'MPEG-2'),
    ('vc1', 'VC-1'),
    ('vp8', 'VP8'),
    ('vp9', 'VP9'),
    ('av1', 'AV1'),
  ];

  // Dropdown option lists (value, display label). "Auto"/"None" sentinels use
  // the server's own empty-string / literal values so the round-trip is exact.
  static const _tonemapAlgorithms = [
    ('none', 'None'),
    ('clip', 'Clip'),
    ('linear', 'Linear'),
    ('gamma', 'Gamma'),
    ('reinhard', 'Reinhard'),
    ('hable', 'Hable'),
    ('mobius', 'Mobius'),
    ('bt2390', 'BT.2390'),
  ];
  static const _tonemapModes = [
    ('auto', 'Auto'),
    ('max', 'Max'),
    ('rgb', 'RGB'),
    ('lum', 'Luminance'),
    ('itp', 'ITP'),
  ];
  static const _tonemapRanges = [
    ('auto', 'Auto'),
    ('tv', 'TV'),
    ('pc', 'PC'),
  ];
  static const _encoderPresets = [
    ('', 'Auto'),
    ('veryslow', 'veryslow'),
    ('slower', 'slower'),
    ('slow', 'slow'),
    ('medium', 'medium'),
    ('fast', 'fast'),
    ('faster', 'faster'),
    ('veryfast', 'veryfast'),
    ('superfast', 'superfast'),
    ('ultrafast', 'ultrafast'),
  ];
  static const _deinterlaceMethods = [
    ('yadif', 'YADIF'),
    ('bwdif', 'BWDIF'),
  ];
  static const _downmixAlgorithms = [
    ('None', 'None'),
    ('Dave750', 'Dave750'),
    ('NightmodeDialogue', 'Nightmode Dialogue'),
    ('Rfc7845', 'RFC 7845'),
    ('Ac4', 'AC-4'),
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
      final config = await _api.getNamedConfiguration('encoding');
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
      await _api.updateNamedConfiguration('encoding', _config!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).adminPlaybackSaved)),
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

  List<String> _getHardwareDecodingCodecs() {
    final raw = _config!['HardwareDecodingCodecs'];
    if (raw is List) return List<String>.from(raw);
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null || _config == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminPlaybackLoadFailed,
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

    final currentAccel =
        _config!['HardwareAccelerationType']?.toString() ?? 'none';

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomSafe + 40),
      children: [
        adminScreenHeader(
          context,
          title: l10n.adminPlaybackTranscoding,
          subtitle: l10n.adminPlaybackHwAccel,
          icon: Icons.swap_horiz,
        ),
        _sectionHeader(l10n.adminPlaybackHwAccel),
        DropdownButtonFormField<String>(
          initialValue: _hwAccelOptions.any((o) => o.$1 == currentAccel)
              ? currentAccel
              : 'none',
          decoration:
              adminInputDecoration(label: l10n.adminPlaybackHwAccelLabel),
          items: _hwAccelOptions
              .map(
                (o) => DropdownMenuItem(
                  value: o.$1,
                  child: Text(_hwAccelLabel(o.$1, o.$2, l10n)),
                ),
              )
              .toList(),
          onChanged: (v) =>
              setState(() => _config!['HardwareAccelerationType'] = v),
        ),
        if (currentAccel == 'vaapi') ...[
          const SizedBox(height: 12),
          _textField('VaapiDevice', l10n.adminPlaybackVaapiDevice,
              hint: '/dev/dri/renderD128'),
        ],
        const SizedBox(height: 16),
        _switchTile('EnableHardwareEncoding', l10n.adminPlaybackEnableHwEncoding),
        const SizedBox(height: 8),
        Text(l10n.adminPlaybackEnableHwDecoding,
            style: Theme.of(context).textTheme.titleSmall),
        ..._buildCodecToggles(),
        if (currentAccel == 'qsv') ...[
          const SizedBox(height: 12),
          _textField('QsvDevice', l10n.adminPlaybackQsvDevice),
        ],
        if (currentAccel == 'nvenc')
          _switchTile(
              'EnableEnhancedNvdecDecoder', l10n.adminPlaybackEnhancedNvdec),
        if (currentAccel != 'none')
          _switchTile('PreferSystemNativeHwDecoder',
              l10n.adminPlaybackPreferNativeDecoder),
        const SizedBox(height: 8),
        Text(l10n.adminPlaybackColorDepth,
            style: Theme.of(context).textTheme.titleSmall),
        _switchTile(
            'EnableDecodingColorDepth10Hevc', l10n.adminPlaybackColorDepth10Hevc),
        _switchTile(
            'EnableDecodingColorDepth10Vp9', l10n.adminPlaybackColorDepth10Vp9),
        _switchTile('EnableDecodingColorDepth10HevcRext',
            l10n.adminPlaybackColorDepth10HevcRext),
        _switchTile('EnableDecodingColorDepth12HevcRext',
            l10n.adminPlaybackColorDepth12HevcRext),
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackHwEncodingSection),
        _switchTile('AllowHevcEncoding', l10n.adminPlaybackAllowHevcEncoding),
        _switchTile('AllowAv1Encoding', l10n.adminPlaybackAllowAv1Encoding),
        if (currentAccel == 'qsv' || currentAccel == 'vaapi') ...[
          _switchTile('EnableIntelLowPowerH264HwEncoder',
              l10n.adminPlaybackIntelLowPowerH264),
          _switchTile('EnableIntelLowPowerHevcHwEncoder',
              l10n.adminPlaybackIntelLowPowerHevc),
        ],
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackToneMapping),
        _switchTile('EnableTonemapping', l10n.adminPlaybackEnableTonemapping),
        if (currentAccel == 'qsv' || currentAccel == 'vaapi')
          _switchTile(
              'EnableVppTonemapping', l10n.adminPlaybackEnableVppTonemapping),
        if (currentAccel == 'videotoolbox')
          _switchTile('EnableVideoToolboxTonemapping',
              l10n.adminPlaybackEnableVtTonemapping),
        const SizedBox(height: 12),
        _dropdownField('TonemappingAlgorithm',
            l10n.adminPlaybackTonemappingAlgorithm, _tonemapAlgorithms),
        const SizedBox(height: 12),
        _dropdownField('TonemappingMode', l10n.adminPlaybackTonemappingMode,
            _tonemapModes),
        const SizedBox(height: 12),
        _dropdownField('TonemappingRange', l10n.adminPlaybackTonemappingRange,
            _tonemapRanges),
        const SizedBox(height: 12),
        _doubleField('TonemappingDesat', l10n.adminPlaybackTonemappingDesat),
        const SizedBox(height: 12),
        _doubleField('TonemappingPeak', l10n.adminPlaybackTonemappingPeak),
        const SizedBox(height: 12),
        _doubleField('TonemappingParam', l10n.adminPlaybackTonemappingParam),
        if (currentAccel == 'qsv' || currentAccel == 'vaapi') ...[
          const SizedBox(height: 12),
          _doubleField('VppTonemappingBrightness',
              l10n.adminPlaybackVppTonemappingBrightness),
          const SizedBox(height: 12),
          _doubleField('VppTonemappingContrast',
              l10n.adminPlaybackVppTonemappingContrast),
        ],
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackPresetsQuality),
        _dropdownField('EncoderPreset', l10n.adminPlaybackEncoderPreset,
            _encoderPresets),
        const SizedBox(height: 12),
        _intField('H264Crf', l10n.adminPlaybackH264Crf),
        const SizedBox(height: 12),
        _intField('H265Crf', l10n.adminPlaybackH265Crf),
        const SizedBox(height: 12),
        _dropdownField('DeinterlaceMethod',
            l10n.adminPlaybackDeinterlaceMethod, _deinterlaceMethods),
        _switchTile(
            'DeinterlaceDoubleRate', l10n.adminPlaybackDeinterlaceDoubleRate),
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackAudioSection),
        _switchTile('EnableAudioVbr', l10n.adminPlaybackEnableAudioVbr),
        const SizedBox(height: 12),
        _doubleField('DownMixAudioBoost', l10n.adminPlaybackDownmixBoost),
        const SizedBox(height: 12),
        _dropdownField('DownMixStereoAlgorithm',
            l10n.adminPlaybackDownmixAlgorithm, _downmixAlgorithms),
        const SizedBox(height: 12),
        _intField('MaxMuxingQueueSize', l10n.adminPlaybackMaxMuxingQueue),
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackEncoding),
        _intField('EncodingThreadCount', l10n.adminPlaybackEncodingThreads,
            subtitle: l10n.adminPlaybackAutomatic),
        const SizedBox(height: 12),
        _pathField('TranscodingTempPath', l10n.adminPlaybackTranscodeTempPath),
        const SizedBox(height: 12),
        _switchTile('EnableFallbackFont', l10n.adminPlaybackFallbackFont),
        if (_config!['EnableFallbackFont'] == true) ...[
          const SizedBox(height: 8),
          _pathField('FallbackFontPath', l10n.adminPlaybackFallbackFontPath),
        ],
        const SizedBox(height: 8),
        _switchTile('EnableSubtitleExtraction',
            l10n.adminPlaybackEnableSubtitleExtraction),
        const Divider(height: 32),
        _sectionHeader(l10n.adminPlaybackStreaming),
        _switchTile(
            'EnableSegmentDeletion', l10n.adminPlaybackSegmentDeletion),
        const SizedBox(height: 8),
        _intField('SegmentKeepSeconds', l10n.adminPlaybackSegmentKeep),
        const SizedBox(height: 12),
        _switchTile('EnableThrottling', l10n.adminPlaybackThrottleBuffering),
        const SizedBox(height: 8),
        _intField('ThrottleDelaySeconds', l10n.adminPlaybackThrottleDelay),
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(
          label: l10n.save,
          saving: _saving,
          onPressed: _save,
        ),
      ],
    );
  }

  List<Widget> _buildCodecToggles() {
    final enabled = _getHardwareDecodingCodecs();
    return _hwDecodeCodecs.map((codec) {
      return SwitchListTile.adaptive(
        title: Text(codec.$2),
        dense: true,
        value: enabled.contains(codec.$1),
        onChanged: (v) {
          setState(() {
            final codecs = _getHardwareDecodingCodecs();
            if (v) {
              codecs.add(codec.$1);
            } else {
              codecs.remove(codec.$1);
            }
            _config!['HardwareDecodingCodecs'] = codecs;
          });
        },
      );
    }).toList();
  }

  String _hwAccelLabel(String value, String fallback, AppLocalizations l10n) {
    switch (value) {
      case 'none':
        return l10n.none;
      case 'qsv':
        return l10n.intelQuickSync;
      case 'rkmpp':
        return l10n.rockchipMpp;
      default:
        return fallback;
    }
  }

  Widget _sectionHeader(String text) {
    return adminSectionLabel(context, text);
  }

  Widget _textField(String key, String label, {String? hint}) {
    return TextFormField(
      initialValue: _config![key]?.toString() ?? '',
      decoration: adminInputDecoration(label: label, hint: hint),
      onChanged: (v) => _config![key] = v,
    );
  }

  Widget _intField(String key, String label, {String? subtitle}) {
    return TextFormField(
      initialValue: (_config![key] as num?)?.toString() ?? '0',
      decoration: adminInputDecoration(label: label, helper: subtitle),
      keyboardType: TextInputType.number,
      onChanged: (v) => _config![key] = int.tryParse(v) ?? 0,
    );
  }

  Widget _switchTile(String key, String title) {
    return adminSwitchRow(
      title: title,
      value: _config![key] as bool? ?? false,
      onChanged: (v) => setState(() => _config![key] = v),
    );
  }

  Widget _doubleField(String key, String label) {
    return TextFormField(
      initialValue: (_config![key] as num?)?.toString() ?? '',
      decoration: adminInputDecoration(label: label),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (v) {
        final parsed = double.tryParse(v);
        if (parsed != null) _config![key] = parsed;
      },
    );
  }

  Widget _dropdownField(
    String key,
    String label,
    List<(String, String)> options,
  ) {
    final current = _config![key]?.toString() ?? '';
    final value =
        options.any((o) => o.$1 == current) ? current : options.first.$1;
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: adminInputDecoration(label: label),
      items: options
          .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
          .toList(),
      onChanged: (v) => setState(() => _config![key] = v),
    );
  }

  Widget _pathField(String key, String label) {
    final l10n = AppLocalizations.of(context);
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
                decoration: InputDecoration(
                  labelText: label,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (v) => _config![key] = v,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(isBrowsing ? Icons.close : Icons.folder_open),
              tooltip: isBrowsing ? l10n.adminCloseBrowser : l10n.adminBrowse,
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
