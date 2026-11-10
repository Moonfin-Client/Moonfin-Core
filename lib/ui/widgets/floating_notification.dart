import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/platform_detection.dart';

class FloatingNotification {
  FloatingNotification._();

  /// How long a notification stays up before it dismisses itself.
  static const Duration displayDuration = Duration(seconds: 7);

  static void show(
    BuildContext context,
    String title,
    String body,
    VoidCallback? onTap, {
    IconData icon = Icons.notifications_active_outlined,
    Duration duration = displayDuration,
    List<(String, VoidCallback)> actions = const [],
  }) {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (entryContext) => _FloatingNotificationCard(
        title: title,
        body: body,
        icon: icon,
        onTap: onTap,
        duration: duration,
        actions: actions,
        onDismissed: () {
          if (entry.mounted) entry.remove();
        },
      ),
    );
    overlay.insert(entry);
  }
}

class _FloatingNotificationCard extends StatefulWidget {
  final String title;
  final String body;
  final IconData icon;
  final VoidCallback? onTap;
  final VoidCallback onDismissed;

  const _FloatingNotificationCard({
    required this.title,
    required this.body,
    required this.icon,
    required this.onTap,
    required this.onDismissed,
    required this.duration,
    required this.actions,
  });

  final Duration duration;
  final List<(String, VoidCallback)> actions;

  @override
  State<_FloatingNotificationCard> createState() =>
      _FloatingNotificationCardState();
}

class _FloatingNotificationCardState extends State<_FloatingNotificationCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  Timer? _autoDismissTimer;
  bool _dismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    _autoDismissTimer = Timer(widget.duration, _dismiss);
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    if (_dismissing) return;
    _dismissing = true;
    _autoDismissTimer?.cancel();
    _controller.reverse().whenComplete(widget.onDismissed);
  }

  void _handleTap() {
    widget.onTap?.call();
    _dismiss();
  }

  @override
  Widget build(BuildContext context) {
    final isTv = PlatformDetection.useLeanbackUi;
    final tappable = !isTv && widget.onTap != null;

    final card = Container(
      constraints: const BoxConstraints(maxWidth: 380),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColorScheme.surface.withValues(alpha: 0.96),
        borderRadius: AppRadius.circular(14),
        border: Border.all(
          color: AppColorScheme.accent.withValues(alpha: 0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColorScheme.scrim.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(widget.icon, color: AppColorScheme.accent, size: 20),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title.isNotEmpty)
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColorScheme.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (widget.body.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
                if (widget.actions.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final (label, onPressed) in widget.actions)
                        TextButton(
                          onPressed: () {
                            onPressed();
                            _dismiss();
                          },
                          child: Text(label),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );

    return Positioned(
      top: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              // The Material is there even when the card can't be tapped, as on
              // TV. Without it the text has no theme and draws in the debug
              // style, underlined in yellow.
              child: Material(
                type: MaterialType.transparency,
                child: tappable
                    ? InkWell(
                        borderRadius: AppRadius.circular(14),
                        onTap: _handleTap,
                        child: card,
                      )
                    : card,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
