import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/platform_detection.dart';
import 'audiobook_focus_ring.dart';

class AudiobookTransportRow extends StatelessWidget {
  const AudiobookTransportRow({
    super.key,
    required this.isPlaying,
    required this.tvFocusIndex,
    required this.skipBackSeconds,
    required this.skipForwardSeconds,
    required this.onPrevChapter,
    required this.onSkipBack,
    required this.onPlayPause,
    required this.onSkipForward,
    required this.onNextChapter,
  });

  final bool isPlaying;
  final int tvFocusIndex;
  final int skipBackSeconds;
  final int skipForwardSeconds;
  final VoidCallback onPrevChapter;
  final VoidCallback onSkipBack;
  final VoidCallback onPlayPause;
  final VoidCallback onSkipForward;
  final VoidCallback onNextChapter;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final onSurface = AppColorScheme.onSurface;

    Widget chapterButton(IconData icon, VoidCallback onTap) {
      if (apple) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: const Size.square(44),
          onPressed: onTap,
          child: Icon(icon, size: 26, color: onSurface),
        );
      }
      return IconButton(icon: Icon(icon, size: 28), onPressed: onTap);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AudiobookFocusRing(
          focused: tvFocusIndex == 0,
          child: chapterButton(
            apple ? CupertinoIcons.backward_end_alt : Icons.first_page,
            onPrevChapter,
          ),
        ),
        AudiobookFocusRing(
          focused: tvFocusIndex == 1,
          child: AudiobookSkipButton(
            seconds: skipBackSeconds,
            forward: false,
            onTap: onSkipBack,
          ),
        ),
        AudiobookFocusRing(
          focused: tvFocusIndex == 2,
          borderRadius: BorderRadius.circular(38),
          borderColor: AppColorScheme.onSurface,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(4),
          child: AudiobookPlayButton(isPlaying: isPlaying, onTap: onPlayPause),
        ),
        AudiobookFocusRing(
          focused: tvFocusIndex == 3,
          child: AudiobookSkipButton(
            seconds: skipForwardSeconds,
            forward: true,
            onTap: onSkipForward,
          ),
        ),
        AudiobookFocusRing(
          focused: tvFocusIndex == 4,
          child: chapterButton(
            apple ? CupertinoIcons.forward_end_alt : Icons.last_page,
            onNextChapter,
          ),
        ),
      ],
    );
  }
}

class AudiobookPlayButton extends StatelessWidget {
  const AudiobookPlayButton({
    super.key,
    required this.isPlaying,
    required this.onTap,
  });

  final bool isPlaying;
  final VoidCallback onTap;

  static const double _size = 68;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;

    if (apple) {
      final icon = isPlaying
          ? CupertinoIcons.pause_fill
          : CupertinoIcons.play_fill;
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: _size,
          height: _size,
          child: ClipOval(
            child: _withTransportBlur(
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorScheme.accent.withValues(
                    alpha: GlassSettings.blursBackdrop ? 0.32 : 0.55,
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.30),
                    width: 0.8,
                  ),
                ),
                child: Center(child: Icon(icon, size: 30, color: Colors.white)),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: _size,
      height: _size,
      child: Material(
        color: AppColorScheme.accent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 36,
            color: AppColorScheme.onAccent,
          ),
        ),
      ),
    );
  }
}

class AudiobookSkipButton extends StatelessWidget {
  const AudiobookSkipButton({
    super.key,
    required this.seconds,
    required this.forward,
    required this.onTap,
  });

  final int seconds;
  final bool forward;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final color = AppColorScheme.onSurface;

    final IconData icon = forward ? CupertinoIcons.goforward : CupertinoIcons.gobackward;

    final glyph = Stack(
      alignment: Alignment.center,
      children: [
        Icon(icon, size: 40, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            seconds.toString(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ],
    );

    if (apple) {
      return CupertinoButton(
        padding: const EdgeInsets.all(8),
        minimumSize: const Size.square(44),
        onPressed: onTap,
        child: glyph,
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(8), child: glyph),
      ),
    );
  }
}

Widget _withTransportBlur(Widget child) {
  if (!GlassSettings.blursBackdrop) return child;
  return BackdropFilter(
    filter: ImageFilter.blur(
      sigmaX: GlassSettings.capSigma(18),
      sigmaY: GlassSettings.capSigma(18),
    ),
    child: child,
  );
}
