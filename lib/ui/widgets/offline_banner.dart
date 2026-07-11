import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../di/providers.dart';
import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';
import '../screens/downloads/downloads_panel.dart';

/// Floating glass pill shown while the device is offline or the server is
/// unreachable. Auto-dismisses after a few seconds and comes back whenever
/// the connection state changes again. On TV it stays non-focusable so it
/// never steals d-pad focus from the content underneath.
class OfflineBanner extends ConsumerStatefulWidget {
  const OfflineBanner({super.key});

  @override
  ConsumerState<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends ConsumerState<OfflineBanner>
    with SingleTickerProviderStateMixin {
  static const _autoDismissDuration = Duration(seconds: 7);

  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
    reverseDuration: const Duration(milliseconds: 180),
  );
  late final CurvedAnimation _entranceCurve = CurvedAnimation(
    parent: _entrance,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );

  bool _dismissed = false;
  bool _lastIsOnline = true;
  bool _lastServerReachable = true;
  Timer? _autoDismissTimer;

  /// Bumped on every visibility reset so the TV countdown bar restarts.
  int _epoch = 0;

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _entranceCurve.dispose();
    _entrance.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    await _entrance.reverse();
    if (mounted) setState(() => _dismissed = true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isOnline = ref.watch(isOnlineProvider);
    final serverReachable = ref.watch(activeServerReachableProvider);
    final isTv = PlatformDetection.useLeanbackUi;

    if (isOnline != _lastIsOnline || serverReachable != _lastServerReachable) {
      _lastIsOnline = isOnline;
      _lastServerReachable = serverReachable;
      _dismissed = false;
      _epoch++;
      _autoDismissTimer?.cancel();
      _autoDismissTimer = null;
      _entrance.value = 0;
    }

    if ((isOnline && serverReachable) || _dismissed) {
      return const SizedBox.shrink();
    }

    if (_entrance.status == AnimationStatus.dismissed) {
      _entrance.forward();
    }
    _autoDismissTimer ??= Timer(_autoDismissDuration, _dismiss);

    final isServerUnavailable = isOnline && !serverReachable;
    final tint = isServerUnavailable
        ? AppColorScheme.statusRequested
        : AppColorScheme.statusPending;
    final onSurface = AppColorScheme.onSurface;

    final pill = GlassSurface(
      cornerRadius: 16,
      reinforced: true,
      fallbackColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.95),
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.16),
              borderRadius: AppRadius.circular(10),
            ),
            child: Icon(
              isServerUnavailable
                  ? Icons.cloud_off_rounded
                  : Icons.wifi_off_rounded,
              size: 18,
              color: tint,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isServerUnavailable
                      ? l10n.serverUnreachableBannerTitle
                      : l10n.offlineBannerTitle,
                  style: TextStyle(
                    color: onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // TV can't download, so the downloads subtitle only shows on
                // platforms that can.
                if (!isTv)
                  Text(
                    isServerUnavailable
                        ? l10n.serverUnreachableBannerSubtitle
                        : l10n.offlineBannerSubtitle,
                    style: TextStyle(
                      color: onSurface.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (isTv)
            _CountdownBar(
              key: ValueKey(_epoch),
              duration: _autoDismissDuration,
              color: tint,
            )
          else ...[
            _ActionCapsule(
              label: isServerUnavailable
                  ? l10n.offlineSwitchServer
                  : l10n.offlineBannerAction,
              tint: tint,
              onTap: () {
                if (isServerUnavailable) {
                  appRouter.go(Destinations.serverSelect);
                } else {
                  showDownloadsDialog(context);
                }
              },
            ),
            const SizedBox(width: 2),
            IconButton(
              onPressed: _dismiss,
              icon: Icon(
                Icons.close_rounded,
                size: 16,
                color: onSurface.withValues(alpha: 0.45),
              ),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ],
        ],
      ),
    );

    Widget banner = SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: pill,
        ),
      ),
    );

    if (!isTv) {
      banner = Dismissible(
        key: ValueKey(
          'offline_banner_${isServerUnavailable ? 'server' : 'network'}',
        ),
        direction: DismissDirection.horizontal,
        onDismissed: (_) {
          _autoDismissTimer?.cancel();
          _autoDismissTimer = null;
          setState(() => _dismissed = true);
        },
        child: banner,
      );
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -0.4),
        end: Offset.zero,
      ).animate(_entranceCurve),
      child: FadeTransition(opacity: _entranceCurve, child: banner),
    );
  }
}

class _ActionCapsule extends StatelessWidget {
  final String label;
  final Color tint;
  final VoidCallback onTap;

  const _ActionCapsule({
    required this.label,
    required this.tint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: tint.withValues(alpha: 0.14),
      borderRadius: AppRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Text(
            label,
            style: TextStyle(
              color: tint,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Thin bar that drains while the auto-dismiss timer counts down.
class _CountdownBar extends StatelessWidget {
  final Duration duration;
  final Color color;

  const _CountdownBar({super.key, required this.duration, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 3,
      child: ClipRRect(
        borderRadius: AppRadius.circular(2),
        child: ColoredBox(
          color: AppColorScheme.onSurface.withValues(alpha: 0.14),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: 0),
            duration: duration,
            builder: (context, value, _) => FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value,
              child: ColoredBox(color: color.withValues(alpha: 0.7)),
            ),
          ),
        ),
      ),
    );
  }
}
