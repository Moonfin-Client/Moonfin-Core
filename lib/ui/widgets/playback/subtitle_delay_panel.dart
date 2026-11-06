import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';

import '../../../playback/subtitle_cues.dart';
import 'delay_footer.dart';

/// The subtitle delay, with the lines around the playhead on a timeline under
/// the steps. The delay slides the lines past a fixed playhead, so a line can
/// be matched to the speech even while the subtitles are hard to read.
class SubtitleDelayPanel extends StatefulWidget {
  const SubtitleDelayPanel({
    super.key,
    required this.initialDelay,
    required this.label,
    this.minDelay,
    this.maxDelay,
    required this.onDelayChanged,
    required this.formatDelay,
    required this.state,
    this.cues,
  });

  final double initialDelay;
  final String label;
  final double? minDelay;
  final double? maxDelay;
  final void Function(double delay) onDelayChanged;
  final String Function(double seconds) formatDelay;

  /// Where playback is, in the media's own time.
  final PlayerState state;

  /// The track's lines, or null for a track with none, such as an image one.
  final Future<List<SubtitleCue>?>? cues;

  @override
  State<SubtitleDelayPanel> createState() => _SubtitleDelayPanelState();
}

class _SubtitleDelayPanelState extends State<SubtitleDelayPanel> {
  late final _delay = ValueNotifier<double>(widget.initialDelay);

  @override
  void dispose() {
    _delay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cues = widget.cues;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DelayFooter(
          initialDelay: widget.initialDelay,
          label: widget.label,
          minDelay: widget.minDelay,
          maxDelay: widget.maxDelay,
          formatDelay: widget.formatDelay,
          onDelayChanged: (delay) {
            _delay.value = delay;
            widget.onDelayChanged(delay);
          },
        ),
        if (cues != null)
          FutureBuilder<List<SubtitleCue>?>(
            future: cues,
            builder: (context, snapshot) {
              final lines = snapshot.data;
              // Room is kept while the lines load, so the panel doesn't jump
              // when they arrive.
              if (snapshot.connectionState != ConnectionState.done) {
                return const SizedBox(height: _timelineHeight + 16);
              }
              if (lines == null || lines.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
                child: StreamBuilder<Duration>(
                  stream: widget.state.positionStream,
                  initialData: widget.state.position,
                  builder: (context, position) => ValueListenableBuilder<double>(
                    valueListenable: _delay,
                    builder: (context, delay, _) => _Timeline(
                      timeline: buildSubtitleTimeline(
                        lines,
                        (position.data ?? Duration.zero).inMilliseconds / 1000,
                        delay,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

const _rulerHeight = 16.0;
const _trackHeight = 40.0;
const _timelineHeight = _rulerHeight + 4 + _trackHeight;

class _Timeline extends StatelessWidget {
  const _Timeline({required this.timeline});

  final SubtitleTimeline timeline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _timelineHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              for (final (second, at) in timeline.markers)
                Positioned(
                  left: width * at - 20,
                  width: 40,
                  top: 0,
                  height: _rulerHeight,
                  child: Text(
                    formatTimelineMarker(second),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: AppTypography.fontSizeXs - 2,
                    ),
                  ),
                ),
              Positioned(
                left: 0,
                right: 0,
                top: _rulerHeight + 4,
                height: _trackHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    borderRadius: AppRadius.circular(8),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(8),
                    child: Stack(
                      children: [
                        for (final bar in timeline.bars)
                          Positioned(
                            left: width * bar.left,
                            width: width * bar.width,
                            top: 6,
                            bottom: 6,
                            child: _Bar(bar: bar),
                          ),
                        Positioned(
                          left: width * timeline.playhead - 1,
                          width: 2,
                          top: 0,
                          bottom: 0,
                          child: const ColoredBox(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.bar});

  final SubtitleTimelineBar bar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: bar.active
            ? AppColorScheme.accent.withValues(alpha: 0.85)
            : Colors.white.withValues(alpha: 0.16),
        borderRadius: AppRadius.circular(4),
      ),
      child: Text(
        bar.text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
          color: bar.active ? Colors.white : Colors.white70,
          fontSize: AppTypography.fontSizeXs,
        ),
      ),
    );
  }
}
