import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../adaptive/sf_symbol.dart';

/// The delay stepper under a track picker. [autoOffset] is a correction the
/// backend applied on its own and only shows when there is one. It is
/// read only and rides beside the value the user sets, so Reset leaves it.
class DelayFooter extends StatefulWidget {
  const DelayFooter({
    super.key,
    required this.initialDelay,
    required this.label,
    this.minDelay,
    this.maxDelay,
    this.autoOffset = 0.0,
    this.autoOffsetStream,
    required this.onDelayChanged,
    required this.formatDelay,
  });

  final double initialDelay;
  final String label;
  final double? minDelay;
  final double? maxDelay;
  final double autoOffset;
  final Stream<double>? autoOffsetStream;
  final void Function(double delay) onDelayChanged;
  final String Function(double seconds) formatDelay;

  @override
  State<DelayFooter> createState() => _DelayFooterState();
}

class _DelayFooterState extends State<DelayFooter> {
  late double _delay;
  late double _autoOffset;
  StreamSubscription<double>? _autoOffsetSubscription;

  @override
  void initState() {
    super.initState();
    _delay = widget.initialDelay;
    _autoOffset = widget.autoOffset;
    _autoOffsetSubscription = widget.autoOffsetStream?.listen((offset) {
      if (!mounted || offset == _autoOffset) return;
      setState(() => _autoOffset = offset);
    });
  }

  @override
  void dispose() {
    _autoOffsetSubscription?.cancel();
    super.dispose();
  }

  void _adjust(double delta) {
    var next = ((_delay + delta) * 10).roundToDouble() / 10;
    final min = widget.minDelay;
    final max = widget.maxDelay;
    if (min != null && next < min) next = min;
    if (max != null && next > max) next = max;
    if (next == _delay) return;
    setState(() => _delay = next);
    widget.onDelayChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                widget.formatDelay(_delay),
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (_autoOffset != 0.0) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                l10n.subtitleDelayAuto(widget.formatDelay(_autoOffset)),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: AppTypography.fontSizeXs,
                ),
              ),
            ),
          ],
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _adjust(-0.1),
                icon: const AdaptiveIcon(
                  Icons.remove_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.delayMinusMs(100),
              ),
              Text(
                l10n.delayMinusMs(100),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: AppTypography.fontSizeXs,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  setState(() => _delay = 0.0);
                  widget.onDelayChanged(0.0);
                },
                style: OutlinedButton.styleFrom(
                  side: ThemeRegistry.active.borders.chipBorder,
                ),
                child: Text(
                  l10n.reset,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Text(
                l10n.delayPlusMs(100),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: AppTypography.fontSizeXs,
                ),
              ),
              IconButton(
                onPressed: () => _adjust(0.1),
                icon: const AdaptiveIcon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.delayPlusMs(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
