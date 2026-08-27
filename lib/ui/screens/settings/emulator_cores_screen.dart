import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/core_download_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/game_cores.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/focus/focusable_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import 'emulator_core_settings_screen.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';

/// Lets the user download libretro cores so games play natively on Android and
/// desktop. Cores are not bundled, so each system is fetched on demand from the
/// libretro buildbot and can be removed to reclaim space.
class EmulatorCoresScreen extends StatefulWidget {
  const EmulatorCoresScreen({super.key});

  @override
  State<EmulatorCoresScreen> createState() => _EmulatorCoresScreenState();
}

class _EmulatorCoresScreenState extends State<EmulatorCoresScreen> {
  late final CoreDownloadService _service =
      CoreDownloadService(GetIt.instance<PreferenceStore>());

  final Set<String> _installed = {};
  final Map<String, double> _downloading = {};
  final Map<String, CancelToken> _cancelTokens = {};

  final FocusNode _firstTileFocusNode = FocusNode(debugLabel: 'first_core_tile');

  @override
  void initState() {
    super.initState();
    _installed.addAll(_service.installed);
  }

  @override
  void dispose() {
    for (final token in _cancelTokens.values) {
      token.cancel();
    }
    _firstTileFocusNode.dispose();
    super.dispose();
  }

  Future<void> _toggle(GameCore core, bool enable) async {
    if (enable) {
      await _install(core);
    } else {
      await _service.remove(core.coreId);
      if (mounted) setState(() => _installed.remove(core.coreId));
    }
  }

  Future<void> _install(GameCore core) async {
    final token = CancelToken();
    setState(() {
      _downloading[core.coreId] = 0;
      _cancelTokens[core.coreId] = token;
    });
    try {
      await _service.download(
        core.coreId,
        cancelToken: token,
        onProgress: (p) {
          if (mounted) setState(() => _downloading[core.coreId] = p);
        },
      );
      if (!mounted) return;
      setState(() {
        _installed.add(core.coreId);
        _downloading.remove(core.coreId);
        _cancelTokens.remove(core.coreId);
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _downloading.remove(core.coreId);
        _cancelTokens.remove(core.coreId);
      });
      if (token.isCancelled) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.emulatorCoreDownloadFailed)),
      );
    }
  }

  void _openSettings(GameCore core) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => EmulatorCoreSettingsScreen(
          coreId: core.coreId,
          system: core.system,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstTileFocusNode : null,
        child: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.emulatorCores)),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(l10n.emulatorCoresDescription),
            ),
            adaptiveListSection(
              children: [
                for (final core in downloadableCores) _buildCoreTile(core),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoreTile(GameCore core) {
    final l10n = AppLocalizations.of(context);
    final available = _service.isAvailable(core.coreId);
    final progress = _downloading[core.coreId];
    final downloading = progress != null;
    final installed = _installed.contains(core.coreId);
    final isFirst = core.coreId == downloadableCores.first.coreId;

    final String subtitle;
    if (!available) {
      subtitle = l10n.emulatorCoreUnavailable;
    } else if (downloading) {
      subtitle = l10n.emulatorCoreDownloading;
    } else {
      subtitle = '~${core.approxSizeMb.toStringAsFixed(0)} MB';
    }

    return Row(
      children: [
        Expanded(
          child: TvFocusHighlight(
            builder: (_, focused) => SwitchListTile.adaptive(
              focusNode: isFirst ? _firstTileFocusNode : null,
              secondary: downloading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        value: progress > 0 ? progress : null,
                        strokeWidth: 2,
                      ),
                    )
                  : Icon(
                      Icons.videogame_asset,
                      color: focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : null,
                    ),
              title: Text(
                core.system,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.87)
                      : AppColorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(
                  color: focused ? AppColors.black.withValues(alpha: 0.54) : null,
                ),
              ),
              value: installed || downloading,
              onChanged: (available && !downloading)
                  ? (v) => _toggle(core, v)
                  : null,
            ),
          ),
        ),
        // Reset now lives inside this screen, alongside editing.
        Tooltip(
          message: l10n.emulatorCoreResetSettings(core.system),
          child: FocusableButton(
            semanticLabel: l10n.emulatorCoreResetSettings(core.system),
            onPressed: installed ? () => _openSettings(core) : null,
            child: const Icon(Icons.tune),
          ),
        ),
      ],
    );
  }
}
