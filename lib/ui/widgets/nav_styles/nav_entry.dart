import 'package:flutter/material.dart';

import '../../../data/models/aggregated_library.dart';

enum NavEntryKind { profile, home, liveTv, seerr, library, other }

/// One destination of the Reel and Mosaic sidebars.
class NavEntry {
  const NavEntry({
    required this.id,
    required this.label,
    required this.onSelect,
    this.icon,
    this.iconBuilder,
    this.kind = NavEntryKind.other,
    this.current = false,
    this.badge = 0,
    this.library,
  });

  final String id;
  final String label;
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final VoidCallback onSelect;
  final NavEntryKind kind;

  /// Whether this entry opens the page on screen.
  final bool current;
  final int badge;
  final AggregatedLibrary? library;

  Widget buildIcon(double size, Color color) =>
      iconBuilder?.call(size, color) ?? Icon(icon, size: size, color: color);
}

/// Reel and Mosaic are laid out for a 720 point tall screen and scale from
/// there, while phones keep their own sizes.
double navStyleScale(Size screen, {required bool phone}) =>
    phone ? 1.0 : (screen.height / 720).clamp(0.75, 1.25);

/// The entry of the page on screen, or Home when none of them is.
int currentNavEntryIndex(List<NavEntry> entries) {
  var home = 0;
  for (var i = 0; i < entries.length; i++) {
    if (entries[i].current) return i;
    if (entries[i].kind == NavEntryKind.home) home = i;
  }
  return home;
}

Widget navPhoneBackButton(VoidCallback onBack) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: onBack,
  child: Container(
    width: 40,
    height: 40,
    margin: const EdgeInsets.only(left: 6),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: 0.4),
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.arrow_back,
      size: 20,
      color: Colors.white.withValues(alpha: 0.9),
    ),
  ),
);
