import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import 'adaptive/sf_symbol.dart';

IconData volumeIconFor(double fraction) => fraction <= 0
    ? Icons.volume_off_rounded
    : fraction < 0.5
    ? Icons.volume_down_rounded
    : Icons.volume_up_rounded;

/// A mute button and a slider for the player's own volume, which desktop drives
/// instead of the OS volume.
class PlayerVolumeControl extends StatelessWidget {
  const PlayerVolumeControl({
    super.key,
    required this.volume,
    required this.onChanged,
    required this.onToggleMute,
    this.max = 1,
  });

  /// The current level, from 0 to [max].
  final double volume;

  /// Above 1 where the player can amplify past full scale.
  final double max;
  final ValueChanged<double> onChanged;
  final VoidCallback onToggleMute;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final muted = volume <= 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: muted ? l10n.unmute : l10n.mute,
          icon: AdaptiveIcon(
            volumeIconFor(volume),
            size: 24,
            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          ),
          onPressed: onToggleMute,
        ),
        SizedBox(
          width: 120,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: AppColorScheme.rangeProgress,
              inactiveTrackColor: AppColorScheme.rangeTrack,
              thumbColor: AppColorScheme.rangeThumb,
              overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: volume.clamp(0.0, max),
              max: max,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
