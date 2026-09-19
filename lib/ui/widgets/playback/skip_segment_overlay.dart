import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/media_segment.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../adaptive/adaptive_glass.dart';
import '../anime_marker_badge.dart';
import '../focus/focus_theme.dart';

class SkipSegmentOverlay extends StatefulWidget {
  final MediaSegment segment;
  final VoidCallback onSkip;
  final VoidCallback onDismiss;
  final FocusNode? focusNode;
  final Stream<Duration>? positionStream;

  /// Current playback position at build time, so a freshly created widget
  /// starts in sync instead of flashing the segment start until the next
  /// stream tick arrives.
  final Duration? initialPosition;

  /// The item that will be played next, if any.
  final AggregatedItem? nextItem;

  /// Distance from the bottom edge of the screen. The player passes the
  /// measured height of the on-screen controls so the capsule clears the
  /// time row instead of landing on top of it.
  final double bottomInset;

  const SkipSegmentOverlay({
    super.key,
    required this.segment,
    required this.onSkip,
    required this.onDismiss,
    this.focusNode,
    this.positionStream,
    this.initialPosition,
    this.nextItem,
    this.bottomInset = _fallbackBottomInset,
  });

  @override
  State<SkipSegmentOverlay> createState() => _SkipSegmentOverlayState();
}

class _SkipSegmentOverlayState extends State<SkipSegmentOverlay> {
  StreamSubscription<Duration>? _positionSubscription;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.initialPosition ?? widget.segment.start;
    _subscribe();
  }

  @override
  void didUpdateWidget(SkipSegmentOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.positionStream != widget.positionStream ||
        oldWidget.segment != widget.segment) {
      _unsubscribe();
      if (widget.segment != oldWidget.segment) {
        _currentPosition = widget.initialPosition ?? widget.segment.start;
      }
      _subscribe();
    }
    // Keep the countdown in sync when the parent rebuilds with a fresh
    // position (e.g. after a seek) before the next stream tick arrives.
    final initial = widget.initialPosition;
    if (initial != null && initial != oldWidget.initialPosition) {
      _currentPosition = initial;
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _subscribe() {
    if (widget.positionStream != null) {
      _positionSubscription = widget.positionStream!.listen((position) {
        if (mounted) {
          setState(() {
            _currentPosition = position;
          });
        }
      });
    }
  }

  void _unsubscribe() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final prefs = GetIt.instance<UserPreferences>();
    final mediaSegmentCountdown = prefs.get(UserPreferences.mediaSegmentCountdown);
    final showProgressBar = mediaSegmentCountdown == MediaSegmentCountdown.progressBar ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;
    final showTimer = mediaSegmentCountdown == MediaSegmentCountdown.timer ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;

    final segmentDuration = widget.segment.duration;
    final elapsed = _currentPosition - widget.segment.start;
    final progress = segmentDuration.inMilliseconds > 0
        ? (1.0 - (elapsed.inMilliseconds / segmentDuration.inMilliseconds)).clamp(0.0, 1.0)
        : 0.0;

    final remaining = widget.segment.end - _currentPosition;
    final remainingSec = remaining.inSeconds.clamp(0, segmentDuration.inSeconds);

    final int minutes = remainingSec ~/ 60;
    final int seconds = remainingSec % 60;
    final timerText = remainingSec >= 60
        ? '$minutes:${seconds.toString().padLeft(2, '0')}'
        : ':${seconds.toString().padLeft(2, '0')}';

    final bool showRing = showProgressBar;
    final bool numberInRing = showTimer && showRing && remainingSec < 60;
    final bool showInlineTimer = showTimer && !numberInRing;

    // TV dismisses with the back button, so this is for touch and desktop.
    final bool showDismissButton = !PlatformDetection.isTV;

    final effectiveRadius = AppColorScheme.isPixel ? 0.0 : _capsuleRadius;
    final borders = ThemeRegistry.active.borders;
    final borderWidth = FocusTheme.borderWidth;

    return Positioned(
      right: 24,
      bottom: widget.bottomInset,
      child: Material(
        color: Colors.transparent,
        child: Focus(
          focusNode: widget.focusNode,
          onKeyEvent: (_, event) {
            if (widget.focusNode == null) {
              return KeyEventResult.ignored;
            }
            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.select ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onSkip();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showDismissButton) ...[
                _SkipDismissButton(
                  onPressed: widget.onDismiss,
                  label: l10n.dismiss,
                ),
                const SizedBox(height: 8),
              ],
              InkWell(
                onTap: widget.onSkip,
                borderRadius: AppRadius.circular(effectiveRadius),
                child: Container(
                  decoration: FocusTheme.focusDecoration(
                    isFocused: true,
                    radius: effectiveRadius,
                    color: null,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.passthrough,
                    children: [
                      adaptiveGlass(
                        context: context,
                        cornerRadius: effectiveRadius,
                        blur: 24,
                        fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
                        tint: AppColorScheme.surface.withValues(alpha: 0.18),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 16, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.skip_next_rounded,
                                color: AppColorScheme.accent,
                                size: 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                l10n.skipSegment(widget.segment.type.displayName),
                                style: TextStyle(
                                  color: AppColorScheme.onSurface,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (widget.nextItem case final next?)
                                AnimeMarkerBadge(
                                  seriesId: next.seriesId,
                                  episodeId: next.id,
                                  scale: 0.9,
                                  padding: const EdgeInsets.only(left: 8),
                                ),
                              if (showInlineTimer) ...[
                                const SizedBox(width: 8),
                                Text(
                                  l10n.endsIn(timerText),
                                  style: TextStyle(
                                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFeatures: const [FontFeature.tabularFigures()],
                                  ),
                                ),
                              ],
                              if (showRing) ...[
                                const SizedBox(width: 13),
                                _CountdownRing(
                                  progress: progress,
                                  center: numberInRing
                                      ? Text(
                                          '$remainingSec',
                                          style: TextStyle(
                                            color: AppColorScheme.onSurface,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFeatures: const [
                                              FontFeature.tabularFigures()
                                            ],
                                          ),
                                        )
                                      : Icon(
                                          Icons.skip_next_rounded,
                                          color: AppColorScheme.accent,
                                          size: 15,
                                        ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: AppRadius.circular(effectiveRadius),
                              border: Border.fromBorderSide(
                                borders.focusBorder.copyWith(
                                  color: AppColorScheme.accent,
                                  width: borderWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountdownRing extends StatelessWidget {
  const _CountdownRing({required this.progress, this.center});

  final double progress;
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: 3,
              backgroundColor: AppColorScheme.onSurface.withValues(alpha: 0.16),
              valueColor: AlwaysStoppedAnimation<Color>(AppColorScheme.accent),
            ),
          ),
          ?center,
        ],
      ),
    );
  }
}

/// The close chip above the skip capsule. The padding widens the tap target
/// without making the chip itself any bigger.
class _SkipDismissButton extends StatelessWidget {
  const _SkipDismissButton({required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final dismissRadius = AppColorScheme.isPixel ? 0.0 : _dismissChipSize / 2;
    return Tooltip(
      message: label,
      excludeFromSemantics: true,
      child: Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: onPressed,
          customBorder: AppColorScheme.isPixel
              ? const RoundedRectangleBorder()
              : const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(_dismissTapPadding),
            child: adaptiveGlass(
              context: context,
              cornerRadius: dismissRadius,
              blur: 24,
              fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
              tint: AppColorScheme.surface.withValues(alpha: 0.18),
              child: SizedBox(
                width: _dismissChipSize,
                height: _dismissChipSize,
                child: Icon(
                  Icons.close_rounded,
                  size: 18,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const double _capsuleRadius = 28;
const double _dismissChipSize = 32;
const double _dismissTapPadding = 6;

// The capsule rides above the seekbar chrome, so the fallback before the
// first measurement arrives is the same height the player reserves for it.
const double _fallbackBottomInset = 150;
