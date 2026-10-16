import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/services/plex_tv_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../util/error_message.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/server_type_icon.dart';

class PlexSignInScreen extends StatefulWidget {
  const PlexSignInScreen({super.key});

  @override
  State<PlexSignInScreen> createState() => _PlexSignInScreenState();
}

class _PlexSignInScreenState extends State<PlexSignInScreen> {
  final _plexTv = GetIt.instance<PlexTvService>();

  PlexPin? _pin;
  List<PlexServer>? _servers;
  String? _errorMessage;
  Timer? _pollTimer;
  bool _polling = false;

  @override
  void initState() {
    super.initState();
    _requestPin();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _requestPin() async {
    _pollTimer?.cancel();
    try {
      final pin = await _plexTv.createPin();
      if (!mounted) return;
      setState(() => _pin = pin);
      // plex.tv asks native apps to poll once a second.
      _pollTimer = Timer.periodic(const Duration(seconds: 1), (_) => _poll());
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> _poll() async {
    final pin = _pin;
    if (_polling || pin == null) return;
    if (DateTime.now().isAfter(pin.expiresAt)) {
      await _requestPin();
      return;
    }

    _polling = true;
    String? token;
    try {
      token = await _plexTv.checkPin(pin);
    } on DioException catch (e) {
      // Dropped connections, 429 and 5xx usually clear up, so the next tick
      // retries those. Any other answer won't fix itself.
      final status = e.response?.statusCode;
      if (status != null && status < 500 && status != 429) _showError(e);
      return;
    } finally {
      _polling = false;
    }
    if (token == null || !mounted) return;

    _pollTimer?.cancel();
    try {
      final servers = await _plexTv.getServers(token);
      if (mounted) setState(() => _servers = servers);
    } catch (e) {
      _showError(e);
    }
  }

  void _showError(Object e) {
    if (!mounted) return;
    _pollTimer?.cancel();
    setState(
      () => _errorMessage = describeError(e, AppLocalizations.of(context)),
    );
  }

  void _retry() {
    setState(() {
      _errorMessage = null;
      _pin = null;
      _servers = null;
    });
    _requestPin();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return RequestInitialFocus(
      child: LoginScaffold(
        maxWidth: 700,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Image.asset('assets/images/logo_and_text.png', height: 80),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PlexLogoIcon(size: 28),
                const SizedBox(width: 10),
                Text(
                  l10n.signInWithPlex,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildBody(l10n),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.go(Destinations.serverSelect),
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(l10n.back),
                    ),
                    style: _focusableButtonStyle(),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _retry,
                      icon: const Icon(Icons.refresh, size: 18),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(l10n.tryAgain),
                      ),
                      style: _focusableButtonStyle(),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(AppLocalizations l10n) {
    final secondary = AppColorScheme.onSurface.withValues(alpha: 0.7);
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: TextStyle(color: AppColorScheme.statusRequested),
        textAlign: TextAlign.center,
      );
    }

    final servers = _servers;
    if (servers != null) {
      if (servers.isEmpty) {
        return Text(l10n.plexNoServers, style: TextStyle(color: secondary));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.selectAServer,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...servers.map(_buildServerTile),
        ],
      );
    }

    final pin = _pin;
    if (pin == null) {
      return const SizedBox(
        height: 28,
        width: 28,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Column(
      children: [
        Text(
          l10n.plexLinkInstructions,
          style: TextStyle(color: secondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          pin.code,
          style: const TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
          ),
        ),
        const SizedBox(height: 16),
        // A TV has no browser, so it offers a QR for a phone instead.
        if (PlatformDetection.isTV)
          QrImageView(
            data: pin.linkUrl,
            size: 160,
            backgroundColor: Colors.white,
          )
        else
          OutlinedButton.icon(
            onPressed: () => launchUrl(
              Uri.parse(pin.linkUrl),
              mode: LaunchMode.externalApplication,
            ),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(l10n.plexOpenLink),
            style: _focusableButtonStyle(),
          ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 10),
            Text(
              l10n.plexWaitingForApproval,
              style: TextStyle(color: secondary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServerTile(PlexServer server) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColorScheme.surface.withValues(alpha: 0.5),
        borderRadius: AppRadius.circular(12),
      ),
      child: Row(
        children: [
          const PlexLogoIcon(size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  server.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.9),
                  ),
                ),
                Text(
                  server.address ??
                      AppLocalizations.of(context).noReachableAddress,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle _focusableButtonStyle() {
    return ButtonStyle(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return BorderSide(color: AppColorScheme.accent, width: 2);
        }
        return BorderSide(
          color: AppColorScheme.onSurface.withValues(alpha: 0.2),
        );
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return AppColorScheme.accent;
        }
        return AppColorScheme.onSurface.withValues(alpha: 0.8);
      }),
    );
  }
}
