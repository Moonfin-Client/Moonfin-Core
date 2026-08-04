import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The three time slots that sit above or below a playback progress bar.
///
/// Each slot takes an equal third so the center label stays centered whatever
/// its neighbours hold.
class PlaybackTimeRow extends StatelessWidget {
  const PlaybackTimeRow({
    super.key,
    required this.left,
    required this.center,
    required this.right,
    this.bold = false,
  });

  final String left;
  final String center;
  final String right;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Colors.white70,
      fontSize: AppTypography.fontSizeXs,
      fontWeight: bold ? FontWeight.w600 : null,
    );
    Widget cell(String text, TextAlign align) => Expanded(
      child: Text(
        text,
        style: style,
        textAlign: align,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
    return Row(
      children: [
        cell(left, TextAlign.left),
        cell(center, TextAlign.center),
        cell(right, TextAlign.right),
      ],
    );
  }
}
