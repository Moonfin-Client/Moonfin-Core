import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/playback_info_sections.dart';
import '../../../playback/playback_network_stats.dart';

/// Live network and buffer stats drawn over the playing video, with rolling
/// graphs, like YouTube's "Stats for nerds".
///
/// It calls [read] once a second. The screen keeps it out of focus and hit
/// testing, so the D-pad and touch go to the player underneath.
class PlaybackStatsOverlay extends StatefulWidget {
  const PlaybackStatsOverlay({
    super.key,
    required this.read,
    this.serverBitrate,
  });

  final PlaybackNetworkStats? Function() read;

  /// The stream's bitrate as the server reports it.
  final int? serverBitrate;

  @override
  State<PlaybackStatsOverlay> createState() => _PlaybackStatsOverlayState();
}

class _PlaybackStatsOverlayState extends State<PlaybackStatsOverlay> {
  static const _interval = Duration(seconds: 1);
  static const _historyLength = 60;

  final _activityBps = <double>[];
  final _bufferSeconds = <double>[];
  Timer? _timer;
  PlaybackNetworkStats? _stats;

  @override
  void initState() {
    super.initState();
    _sample();
    _timer = Timer.periodic(_interval, (_) => _sample());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _sample() {
    final stats = widget.read();
    if (stats == null) {
      // A source reload resets the reading, so the new source starts fresh.
      if (_stats != null) {
        setState(() {
          _stats = null;
          _activityBps.clear();
          _bufferSeconds.clear();
        });
      }
      return;
    }
    setState(() {
      _stats = stats;
      if (stats.activityBitsPerSecond case final bps?) {
        _push(_activityBps, bps.toDouble());
      }
      _push(_bufferSeconds, stats.bufferAhead.inMilliseconds / 1000);
    });
  }

  void _push(List<double> history, double value) {
    history.add(value);
    if (history.length > _historyLength) history.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    final stats = _stats;
    if (stats == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final ceiling = stats.bufferCeiling;
    final buffer = _bufferSeconds.last.toStringAsFixed(1);
    final rows = [
      if (stats.activityBitsPerSecond case final bps?)
        _row(
          l10n.playbackStatsNetworkActivity,
          formatPlaybackBitrate(bps),
          _graph(_activityBps, const Color(0xFFFFB74D), bars: true),
        ),
      _row(
        l10n.playbackStatsBufferHealth,
        ceiling == null ? '$buffer s' : '$buffer / ${ceiling.inSeconds} s',
        _graph(
          _bufferSeconds,
          const Color(0xFF81C784),
          max: ceiling == null ? null : ceiling.inMilliseconds / 1000,
        ),
      ),
      if (stats.targetBufferBytes case final target?)
        _row(
          l10n.playbackStatsBufferMemory,
          '${_mb(stats.bufferedBytes ?? 0)} / ${_mb(target)} MB',
        ),
      if (widget.serverBitrate case final bitrate?)
        _row(l10n.bitrate, formatPlaybackBitrate(bitrate)),
      if (stats.rebuffers case final rebuffers?)
        _row(l10n.playbackStatsRebuffers, '$rebuffers'),
    ];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xB3000000),
        borderRadius: BorderRadius.circular(AppSpacing.spaceSm),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceSm),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.4,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
          // Labels size to the longest translation; values get a fixed
          // width so the graphs don't shift as the numbers change.
          child: Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FixedColumnWidth(96),
              2: FixedColumnWidth(80),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: rows,
          ),
        ),
      ),
    );
  }

  TableRow _row(String label, String value, [Widget? graph]) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.spaceMd),
          child: Text(label),
        ),
        Text(value),
        graph == null
            ? const SizedBox.shrink()
            : SizedBox(height: 16, child: graph),
      ],
    );
  }

  Widget _graph(
    List<double> values,
    Color color, {
    double? max,
    bool bars = false,
  }) {
    return CustomPaint(
      painter: _SparklinePainter(List.of(values), color, max, bars),
    );
  }

  static String _mb(int bytes) => (bytes / 1048576).toStringAsFixed(0);
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter(this.values, this.color, this.max, this.bars);

  final List<double> values;
  final Color color;

  /// The value at the top of the graph. Without it the graph scales to the
  /// largest value it holds.
  final double? max;

  /// Bars suit a per-second amount, a line a level.
  final bool bars;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0x22FFFFFF),
    );
    if (values.isEmpty) return;
    final top = max ?? values.reduce(math.max);
    if (top <= 0) return;
    const slots = _PlaybackStatsOverlayState._historyLength;
    final step = size.width / (slots - 1);
    // The newest reading sits at the right edge, like a scrolling chart.
    final start = slots - values.length;
    double x(int i) => (start + i) * step;
    double y(double v) => size.height - (v / top).clamp(0.0, 1.0) * size.height;
    if (bars) {
      final paint = Paint()..color = color;
      for (var i = 0; i < values.length; i++) {
        canvas.drawRect(
          Rect.fromLTRB(
            x(i) - step / 2,
            y(values[i]),
            x(i) + step / 2,
            size.height,
          ),
          paint,
        );
      }
      return;
    }
    final line = Path()..moveTo(x(0), y(values[0]));
    for (var i = 1; i < values.length; i++) {
      line.lineTo(x(i), y(values[i]));
    }
    final fill = Path.from(line)
      ..lineTo(x(values.length - 1), size.height)
      ..lineTo(x(0), size.height)
      ..close();
    canvas.drawPath(fill, Paint()..color = color.withAlpha(0x55));
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_SparklinePainter old) => true;
}
