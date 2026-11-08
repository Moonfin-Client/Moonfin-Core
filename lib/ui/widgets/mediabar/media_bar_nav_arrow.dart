import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The previous and next arrows on the sides of a media bar. In a right to
/// left locale they swap sides so next still points the reading direction.
List<Widget> mediaBarNavArrows(
  BuildContext context, {
  required VoidCallback? onPrevious,
  required VoidCallback onNext,
  double leftInset = 0,
  double rightInset = 0,
  double bottomInset = 0,
}) {
  final isRtl = Directionality.of(context) == TextDirection.rtl;
  final previous = _NavArrow(icon: Icons.chevron_left, onTap: onPrevious);
  final next = _NavArrow(icon: Icons.chevron_right, onTap: onNext);
  return [
    Positioned(
      left: leftInset,
      top: 0,
      bottom: bottomInset,
      child: Center(child: isRtl ? next : previous),
    ),
    Positioned(
      right: rightInset,
      top: 0,
      bottom: bottomInset,
      child: Center(child: isRtl ? previous : next),
    ),
  ];
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavArrow({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          canRequestFocus: false,
          customBorder: const CircleBorder(),
          child: AnimatedOpacity(
            opacity: onTap != null ? 1.0 : 0.3,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.scrim.withValues(alpha: 0.4),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.cardBorder,
                ),
              ),
              child: Icon(
                icon,
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
