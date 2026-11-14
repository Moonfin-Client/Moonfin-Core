import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../util/error_message.dart';
import '../../widgets/sign_in_qr_code.dart';
import '../../widgets/track_selector_dialog.dart';

const moonbaseManifestUrl =
    'https://raw.githubusercontent.com/Moonfin-Client/Plugin/refs/heads/master/manifest.json';
const _moonbaseName = 'Moonbase';
const _moonbaseGuid = '8c5d0e91-4f2a-4b6d-9e3f-1a7c8d9e0f2b';

String moonbaseGuideUrl(ServerType type) =>
    'https://github.com/Moonfin-Client/Plugin/wiki/Installation#${type.name}';

/// Moonbase for Plex and Silo can't read the library, so they offer less.
List<String> moonbaseFeatures(AppLocalizations l10n, ServerType type) {
  final fullPlugin = type.features.supportsFullMoonfinPlugin;
  return [
    l10n.moonbaseFeatureSync,
    l10n.moonbaseFeatureRatings,
    if (fullPlugin) ...[
      l10n.setupTourBulletRequests,
      l10n.moonbaseFeatureRows,
    ],
    if (type.features.supportsRetroGames) l10n.moonbaseFeatureGames,
    if (type != ServerType.silo) l10n.moonbaseFeatureCalendar,
    if (!fullPlugin) l10n.moonbaseFeatureCollections,
    l10n.setupTourBulletThemes,
    l10n.moonbaseFeatureMessages,
  ];
}

/// Leaving the version out lets Jellyfin pick the newest one the server can
/// run. It answers once the plugin is on disk, and the plugin turns on at the
/// next restart.
Future<void> installMoonbase(AdminPluginsApi api) async {
  final repos = await api.getRepositories();
  if (!repos.any((r) => r.url == moonbaseManifestUrl && r.enabled)) {
    await api.setRepositories([
      ...repos.where((r) => r.url != moonbaseManifestUrl),
      const RepositoryInfo(name: _moonbaseName, url: moonbaseManifestUrl),
    ]);
  }
  await api.installPackage(
    _moonbaseName,
    assemblyGuid: _moonbaseGuid,
    repositoryUrl: moonbaseManifestUrl,
  );
}

/// True when Moonbase got installed, however the dialog was closed.
Future<bool> showMoonbaseDialog(
  BuildContext context,
  MediaServerClient client, {
  required bool isAdmin,
}) async {
  var installed = false;
  await showStyledPlayerDialog<void>(
    context,
    title: _moonbaseName,
    maxWidth: PlatformDetection.isTV ? 600 : 440,
    builder: (ctx) => _MoonbaseDialogBody(
      client: client,
      isAdmin: isAdmin,
      onInstalled: () => installed = true,
    ),
  );
  return installed;
}

enum _Stage { info, installing, installed, restarting, failed }

class _MoonbaseDialogBody extends StatefulWidget {
  const _MoonbaseDialogBody({
    required this.client,
    required this.isAdmin,
    required this.onInstalled,
  });

  final MediaServerClient client;
  final bool isAdmin;
  final VoidCallback onInstalled;

  @override
  State<_MoonbaseDialogBody> createState() => _MoonbaseDialogBodyState();
}

class _MoonbaseDialogBodyState extends State<_MoonbaseDialogBody> {
  _Stage _stage = _Stage.info;
  bool _installed = false;
  String _error = '';

  bool get _canInstall =>
      widget.isAdmin && widget.client.features.supportsMoonbaseInstall;

  Future<void> _install() async {
    setState(() => _stage = _Stage.installing);
    try {
      await installMoonbase(widget.client.adminPluginsApi);
      _installed = true;
      widget.onInstalled();
      if (mounted) setState(() => _stage = _Stage.installed);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _stage = _Stage.failed;
        _error = describeError(e, AppLocalizations.of(context));
      });
    }
  }

  Future<void> _restart() async {
    setState(() => _stage = _Stage.restarting);
    final messenger = ScaffoldMessenger.maybeOf(context);
    final l10n = AppLocalizations.of(context);
    try {
      await widget.client.adminSystemApi.restartServer();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _stage = _Stage.failed;
        _error = describeError(e, l10n);
      });
      return;
    }
    messenger?.showSnackBar(
      SnackBar(content: Text(l10n.setupMoonbaseRestarting)),
    );
    if (mounted) Navigator.of(context).pop();
  }

  void _close() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isTv = PlatformDetection.isTV;
    final url = moonbaseGuideUrl(widget.client.serverType);
    final showLink = !_canInstall;

    final features = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(l10n.setupMoonbaseIntro, style: _bodyStyle),
        const SizedBox(height: 2),
        for (final feature in moonbaseFeatures(l10n, widget.client.serverType))
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 16,
                  color: Colors.white70,
                ),
              ),
              Expanded(child: Text(feature, style: _bodyStyle)),
            ],
          ),
        if (showLink) ...[
          const SizedBox(height: 6),
          Text(
            widget.isAdmin
                ? l10n.setupMoonbaseManualSteps
                : l10n.setupMoonbaseAskAdmin,
            style: _bodyStyle.copyWith(color: Colors.white),
          ),
        ],
      ],
    );

    final status = switch (_stage) {
      _Stage.info => null,
      _Stage.installing => l10n.setupMoonbaseInstalling,
      _Stage.restarting => l10n.setupMoonbaseRestarting,
      _Stage.installed => l10n.setupMoonbaseInstalled,
      _Stage.failed =>
        _installed ? _error : l10n.setupMoonbaseInstallFailed(_error),
    };
    final busy = _stage == _Stage.installing || _stage == _Stage.restarting;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
            child: showLink && isTv
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      Expanded(child: features),
                      Column(
                        spacing: 8,
                        children: [
                          SignInQrCode(data: url, size: 150),
                          Text(
                            l10n.scanWithYourPhone,
                            style: _bodyStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  )
                : features,
          ),
          if (status != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Row(
                spacing: 12,
                children: [
                  if (busy)
                    const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  Expanded(
                    child: Text(
                      status,
                      style: _bodyStyle.copyWith(
                        color: _stage == _Stage.failed
                            ? Colors.redAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (!busy) ...[
            Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
            const SizedBox(height: 4),
            // Keyed by stage so the remote lands on the new first action.
            for (final (i, action) in <(IconData, String, VoidCallback)>[
              if (_stage == _Stage.info && _canInstall)
                (Icons.download_rounded, l10n.install, _install),
              if (_stage == _Stage.failed)
                (
                  Icons.refresh_rounded,
                  l10n.tryAgain,
                  _installed ? _restart : _install,
                ),
              if (_stage == _Stage.installed)
                (Icons.restart_alt_rounded, l10n.adminRestartServer, _restart),
              if (showLink && !isTv)
                (
                  Icons.open_in_browser,
                  l10n.openLink,
                  () => launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              (Icons.close_rounded, l10n.close, _close),
            ].indexed)
              _Action(
                key: ValueKey('${_stage.name}-$i'),
                autofocus: i == 0,
                icon: action.$1,
                label: action.$2,
                onTap: action.$3,
              ),
          ],
        ],
      ),
    );
  }
}

const _bodyStyle = TextStyle(fontSize: 14, color: Colors.white70, height: 1.35);

class _Action extends StatelessWidget {
  const _Action({
    super.key,
    required this.autofocus,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final bool autofocus;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final focus = GetIt.instance<UserPreferences>().get(
      UserPreferences.focusColor,
    );
    // Its own Material, or the ink lands under the panel and focus never shows.
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        autofocus: autofocus,
        focusColor: Color(focus.colorValue).withValues(alpha: 0.2),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            spacing: 16,
            children: [
              Icon(icon, size: 22, color: Colors.white70),
              Text(
                label,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
