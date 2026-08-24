import 'package:flutter/material.dart';

/// A small red circle with a count, sitting on the top right corner of [child].
///
/// Draws nothing when [count] is zero, so callers can pass the count straight
/// through without checking first. Counts above 9 show as "9+" to keep the
/// circle small enough for a collapsed navbar icon.
class UnreadBadge extends StatelessWidget {
  final int count;
  final Widget child;

  const UnreadBadge({super.key, required this.count, required this.child});

  static const _badgeRed = Color(0xFFE03B36);

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return child;

    final label = count > 9 ? '9+' : '$count';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -5,
          right: -8,
          child: Container(
            constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: _badgeRed,
              shape: BoxShape.circle,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                height: 1.2,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
