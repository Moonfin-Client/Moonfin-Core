import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_segment.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../adaptive/adaptive_glass.dart';
import '../focus/focus_theme.dart';

class SkipSegmentOverlay extends StatefulWidget {
  final MediaSegment segment;
  final VoidCallback onSkip;
  final VoidCallback onDismiss;
  final FocusNode? focusNode;
  final Stream<Duration>? positionStream;

  const SkipSegmentOverlay({
    super.key,
    required this.segment,
    required this.onSkip,
    required this.onDismiss,
    this.focusNode,
    this.positionStream,
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
    _currentPosition = widget.segment.start;
    _subscribe();
  }

  @override
  void didUpdateWidget(SkipSegmentOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.positionStream != widget.positionStream ||
        oldWidget.segment != widget.segment) {
      _unsubscribe();
      if (widget.segment != oldWidget.segment) {
        _currentPosition = widget.segment.start;
      }
      _subscribe();
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
    final isDesktop = PlatformDetection.useDesktopUi;

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

    return Positioned(
      right: 24,
      bottom: 120,
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
          child: Stack(
            children: [
              InkWell(
                onTap: widget.onSkip,
                borderRadius: AppRadius.circular(_capsuleRadius),
                child: Container(
                  decoration: FocusTheme.focusDecoration(
                    isFocused: true,
                    radius: _capsuleRadius,
                    color: AppColorScheme.accent,
                  ),
                  child: adaptiveGlass(
                    context: context,
                    cornerRadius: _capsuleRadius,
                    blur: 24,
                    fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
                    tint: AppColorScheme.surface.withValues(alpha: 0.18),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, isDesktop ? 40 : 16, 10),
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
                ),
              ),
              if (isDesktop)
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    onPressed: widget.onDismiss,
                    tooltip: l10n.close,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints.tightFor(
                      width: 24,
                      height: 24,
                    ),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: AppColorScheme.onSurface,
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

const double _capsuleRadius = 28;
