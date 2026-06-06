import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';

class NextUpOverlay extends StatefulWidget {
  final AggregatedItem nextItem;
  final String? imageUrl;
  final int timeoutMs;
  final VoidCallback onPlayNext;
  final VoidCallback onDismiss;
  final VoidCallback? onTimeout;
  final FocusNode? focusNode;
  final FocusNode? dismissFocusNode;

  const NextUpOverlay({
    super.key,
    required this.nextItem,
    this.imageUrl,
    required this.timeoutMs,
    required this.onPlayNext,
    required this.onDismiss,
    this.onTimeout,
    this.focusNode,
    this.dismissFocusNode,
  });

  @override
  State<NextUpOverlay> createState() => _NextUpOverlayState();
}

class _NextUpOverlayState extends State<NextUpOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _countdownController;
  Timer? _timer;
  bool _playFocused = false;
  bool _dismissFocused = false;

  @override
  void initState() {
    super.initState();
    _countdownController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.timeoutMs),
    )..forward();

    if (widget.timeoutMs > 0) {
      _timer = Timer(
        Duration(milliseconds: widget.timeoutMs),
        widget.onTimeout ?? widget.onDismiss,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final item = widget.nextItem;
    final tvFocusMode = widget.focusNode != null || widget.dismissFocusNode != null;
    final epInfo = item.indexNumber != null
        ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
        : null;

    final prefs = GetIt.instance<UserPreferences>();
    final mediaSegmentCountdown = prefs.get(UserPreferences.mediaSegmentCountdown);
    final showProgressBar = mediaSegmentCountdown == MediaSegmentCountdown.progressBar ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;
    final showTimer = mediaSegmentCountdown == MediaSegmentCountdown.timer ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;

    return Positioned(
      right: 24,
      bottom: 120,
      child: Container(
        width: 340,
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.imageUrl != null)
              SizedBox(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) =>
                      Container(color: AppColorScheme.surfaceVariant),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.upNext,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (showTimer && widget.timeoutMs > 0)
                        AnimatedBuilder(
                          animation: _countdownController,
                          builder: (context, _) {
                            final remainingMs = widget.timeoutMs * (1.0 - _countdownController.value);
                            final remainingSeconds = (remainingMs / 1000).ceil();
                            final int minutes = remainingSeconds ~/ 60;
                            final int secs = remainingSeconds % 60;
                            final timerText = remainingSeconds >= 60
                                ? '$minutes:${secs.toString().padLeft(2, '0')}'
                                : ':${secs.toString().padLeft(2, '0')}';
                            return Text(
                              l10n.endsIn(timerText),
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    [epInfo, item.name]
                        .where((s) => s != null && s.isNotEmpty)
                        .join(' — '),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Focus(
                          focusNode: widget.focusNode,
                          onFocusChange: (focused) {
                            if (_playFocused != focused) {
                              setState(() => _playFocused = focused);
                            }
                          },
                          onKeyEvent: (_, event) {
                            if (event is KeyDownEvent &&
                                (event.logicalKey == LogicalKeyboardKey.select ||
                                    event.logicalKey == LogicalKeyboardKey.enter)) {
                              widget.onPlayNext();
                              return KeyEventResult.handled;
                            }
                            return KeyEventResult.ignored;
                          },
                          child: ElevatedButton(
                            autofocus: widget.focusNode == null,
                            onPressed: widget.onPlayNext,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tvFocusMode
                                  ? (_playFocused
                                      ? AppColorScheme.accent
                                      : AppColorScheme.surfaceVariant.withValues(alpha: 0.9))
                                  : AppColorScheme.accent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: Text(l10n.playNext),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Focus(
                        focusNode: widget.dismissFocusNode,
                        onFocusChange: (focused) {
                          if (_dismissFocused != focused) {
                            setState(() => _dismissFocused = focused);
                          }
                        },
                        onKeyEvent: (_, event) {
                          if (event is KeyDownEvent &&
                              (event.logicalKey == LogicalKeyboardKey.select ||
                                  event.logicalKey == LogicalKeyboardKey.enter)) {
                            widget.onDismiss();
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                        },
                        child: OutlinedButton(
                          onPressed: widget.onDismiss,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: _dismissFocused
                                ? AppColorScheme.accent.withValues(alpha: 0.24)
                                : Colors.transparent,
                            side: _dismissFocused
                                ? ThemeRegistry.active.borders.focusBorder
                                : ThemeRegistry.active.borders.chipBorder,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text(l10n.close),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showProgressBar && widget.timeoutMs > 0)
              AnimatedBuilder(
                animation: _countdownController,
                builder: (context, _) => LinearProgressIndicator(
                  value: 1.0 - _countdownController.value,
                  backgroundColor: Colors.transparent,
                  color: AppColorScheme.accent,
                  minHeight: 6,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
