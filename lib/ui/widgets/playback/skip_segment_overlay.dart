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

/// Shows the Skip button over playback, or inline with Cinema Mode actions when [inline] is
/// true.
class SkipSegmentOverlay extends StatefulWidget {
  final MediaSegment segment;
  final VoidCallback onSkip;
  final VoidCallback onDismiss;
  final MediaSegmentCountdown? countdownStyle;
  final FocusNode? focusNode;
  final Stream<Duration>? positionStream;

  /// Current playback position at build time, so a freshly created widget
  /// starts in sync instead of flashing the segment start until the next
  /// stream tick arrives.
  final Duration? initialPosition;

  /// The item that will be played next, if any.
  final AggregatedItem? nextItem;

  final String? actionLabel;
  final List<String> labelAlternatives;
  final bool handleActivationKeys;
  final Color? outlineColor;
  final bool inline;
  final double bottomInset;

  const SkipSegmentOverlay({
    super.key,
    required this.segment,
    required this.onSkip,
    required this.onDismiss,
    this.countdownStyle,
    this.focusNode,
    this.positionStream,
    this.initialPosition,
    this.nextItem,
    this.actionLabel,
    this.labelAlternatives = const [],
    this.handleActivationKeys = true,
    this.outlineColor,
    this.inline = false,
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
    // A new segment resets progress; only a new position stream needs a resubscription.
    if (oldWidget.positionStream != widget.positionStream) {
      _unsubscribe();
      _subscribe();
    }
    final oldSegment = oldWidget.segment;
    final segment = widget.segment;
    if (oldSegment.id != segment.id ||
        oldSegment.itemId != segment.itemId ||
        oldSegment.type != segment.type ||
        oldSegment.start != segment.start) {
      _currentPosition = widget.initialPosition ?? segment.start;
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
    final mediaSegmentCountdown =
        widget.countdownStyle ??
        prefs.get(UserPreferences.mediaSegmentCountdown);
    final showProgressBar =
        mediaSegmentCountdown == MediaSegmentCountdown.progressBar ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;
    final showTimer =
        mediaSegmentCountdown == MediaSegmentCountdown.timer ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;

    final segmentDuration = widget.segment.duration;
    final elapsed = _currentPosition - widget.segment.start;
    final progress = segmentDuration.inMilliseconds > 0
        ? (1.0 - (elapsed.inMilliseconds / segmentDuration.inMilliseconds))
              .clamp(0.0, 1.0)
        : 0.0;

    final remaining = widget.segment.end - _currentPosition;
    final remainingSec = remaining.inSeconds.clamp(
      0,
      segmentDuration.inSeconds,
    );

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

    // Both Cinema Mode and Skip Segment use the same outline style.
    // Keep icons and countdowns in the foreground color.
    // Use the accent outline on touch and to indicate focus on TV.
    // Cinema passes its focus color; Skip Segment reads its focus node.
    final outlineColor = widget.outlineColor ??
        (PlatformDetection.isTV && widget.focusNode != null
            ? (widget.focusNode!.hasFocus
                ? AppColorScheme.accent
                : AppColorScheme.onSurface)
            : AppColorScheme.accent);

    final button = Material(
      color: Colors.transparent,
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (_) {
          if (mounted &&
              widget.outlineColor == null &&
              PlatformDetection.isTV &&
              widget.focusNode != null) {
            setState(() {});
          }
        },
        onKeyEvent: (_, event) {
          if (widget.focusNode == null || !widget.handleActivationKeys) {
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
              key: const ValueKey('skip-segment-capsule'),
              onTap: widget.onSkip,
              borderRadius: AppRadius.circular(28),
              child: playbackGlassAction(
                context: context,
                outlineColor: outlineColor,
                outlineKey: const ValueKey('skip-segment-outline'),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 16, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.skip_next_rounded,
                        color: AppColorScheme.onSurface,
                        size: 20,
                      ),
                      const SizedBox(width: 9),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          for (final label in widget.labelAlternatives)
                            ExcludeSemantics(
                              child: Opacity(
                                opacity: 0,
                                child: _label(label),
                              ),
                            ),
                          _label(
                            widget.actionLabel ??
                                l10n.skipSegment(
                                  widget.segment.type.displayName,
                                ),
                          ),
                        ],
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
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.5,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFeatures: const [
                              FontFeature.tabularFigures(),
                            ],
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
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                )
                              : Icon(
                                  Icons.skip_next_rounded,
                                  color: AppColorScheme.onSurface,
                                  size: 15,
                                ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return widget.inline
        ? button
        : Positioned(right: 24, bottom: widget.bottomInset, child: button);
  }

  Widget _label(String value) => Text(
    value,
    style: TextStyle(
      color: AppColorScheme.onSurface,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
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
              valueColor: AlwaysStoppedAnimation<Color>(AppColorScheme.onSurface),
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
  const _SkipDismissButton({
    required this.onPressed,
    required this.label,
  });

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

/// One capsule outline shared by Skip and Request. Null hides the outline.
Widget playbackGlassAction({
  required BuildContext context,
  required Widget child,
  required Key outlineKey,
  Color? outlineColor,
}) {
  final radius = AppColorScheme.isPixel ? 0.0 : _capsuleRadius;
  return Container(
    key: outlineKey,
    foregroundDecoration: outlineColor == null
        ? null
        : BoxDecoration(
            borderRadius: AppRadius.circular(radius),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.focusBorder.copyWith(
                color: outlineColor,
              ),
            ),
          ),
    child: adaptiveGlass(
      context: context,
      cornerRadius: radius,
      blur: 24,
      fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
      tint: AppColorScheme.surface.withValues(alpha: 0.18),
      child: child,
    ),
  );
}

const double _capsuleRadius = 28;
const double _dismissChipSize = 32;
const double _dismissTapPadding = 6;

// The capsule rides above the seekbar chrome, so the fallback before the
// first measurement arrives is the same height the player reserves for it.
const double _fallbackBottomInset = 150;
