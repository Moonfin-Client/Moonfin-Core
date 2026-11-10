import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../bounded_network_image.dart';

/// One card of the Home Watch Parties row: a room, a SyncPlay group, or
/// Start a watch party.
class WatchPartyHomeCard extends StatelessWidget {
  const WatchPartyHomeCard({
    super.key,
    required this.width,
    required this.height,
    required this.focused,
    required this.focusColor,
    required this.title,
    required this.onTap,
    this.line,
    this.chips = const [],
    this.imageUrl,
    this.icon,
  });

  final double width;
  final double height;
  final bool focused;
  final Color focusColor;
  final String title;
  final String? line;
  final List<Widget> chips;
  final String? imageUrl;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    final radius = BorderRadius.circular(12);
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (chips.isNotEmpty) Wrap(spacing: 6, runSpacing: 4, children: chips),
        const Spacer(),
        if (icon != null) ...[
          Icon(icon, color: AppColorScheme.onSurface, size: 28),
          const SizedBox(height: 6),
        ],
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (line case final line?)
          Text(
            line,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
      ],
    );
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColorScheme.surface,
          borderRadius: radius,
          border: Border.all(
            color: focused ? focusColor : Colors.white.withValues(alpha: 0.08),
            width: focused ? 3 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (url != null)
                BoundedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              if (url != null)
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x33000000), Color(0xDD000000)],
                    ),
                  ),
                ),
              Padding(padding: const EdgeInsets.all(12), child: text),
            ],
          ),
        ),
      ),
    );
  }
}
