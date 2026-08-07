import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/services/app_update_service.dart';
import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import 'status_banner_pill.dart';

/// Floating glass pill announcing a newer GitHub release. Mirrors the offline
/// banner: slides in, auto-dismisses on a countdown, and stays non-focusable
/// on TV so it never steals d-pad focus from the content underneath.
class AppUpdateBanner extends StatefulWidget {
  /// Overrides the update lookup in tests. Defaults to the registered
  /// [AppUpdateService]'s cooldown-respecting check.
  final Future<DesktopUpdateInfo?> Function()? checkForUpdate;

  const AppUpdateBanner({super.key, this.checkForUpdate});

  @override
  State<AppUpdateBanner> createState() => _AppUpdateBannerState();
}

class _AppUpdateBannerState extends State<AppUpdateBanner>
    with SingleTickerProviderStateMixin {
  static const _autoDismissDuration = Duration(seconds: 7);

  // Built in initState, not as field initializers: a banner that never becomes
  // visible would otherwise run them from dispose, and creating a ticker on a
  // deactivated element throws.
  late final AnimationController _entrance;
  late final CurvedAnimation _entranceCurve;

  DesktopUpdateInfo? _update;
  bool _dismissed = false;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 180),
    );
    _entranceCurve = CurvedAnimation(
      parent: _entrance,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_check());
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _entranceCurve.dispose();
    _entrance.dispose();
    super.dispose();
  }

  Future<void> _check() async {
    try {
      final check =
          widget.checkForUpdate ??
          GetIt.instance<AppUpdateService>().checkForUpdateIfDue;
      final update = await check();
      if (!mounted || update == null) return;
      setState(() => _update = update);
      _entrance.forward();
      _autoDismissTimer = Timer(_autoDismissDuration, _dismiss);
    } catch (_) {}
  }

  Future<void> _dismiss() async {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    await _entrance.reverse();
    if (mounted) setState(() => _dismissed = true);
  }

  @override
  Widget build(BuildContext context) {
    final update = _update;
    if (update == null || _dismissed) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context);
    final isTv = PlatformDetection.useLeanbackUi;
    final tint = AppColorScheme.statusAvailable;

    final pill = StatusBannerPill(
      icon: Icons.system_update_alt_rounded,
      tint: tint,
      title: l10n.updateAvailableVersion(update.version),
      trailing: [
        if (isTv)
          BannerCountdownBar(duration: _autoDismissDuration, color: tint)
        else ...[
          BannerActionCapsule(
            label: l10n.download,
            tint: tint,
            onTap: () {
              unawaited(
                launchUrl(
                  update.downloadUri,
                  mode: LaunchMode.externalApplication,
                ),
              );
              unawaited(_dismiss());
            },
          ),
          const SizedBox(width: 2),
          IconButton(
            onPressed: _dismiss,
            icon: Icon(
              Icons.close_rounded,
              size: 16,
              color: AppColorScheme.onSurface.withValues(alpha: 0.45),
            ),
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ],
    );

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -0.4),
        end: Offset.zero,
      ).animate(_entranceCurve),
      child: FadeTransition(
        opacity: _entranceCurve,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: pill,
            ),
          ),
        ),
      ),
    );
  }
}
