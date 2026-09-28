import '../../../preference/preference_constants.dart';

/// Sizes shared by the three bottom navbar styles and everything that has to
/// leave room for them.
abstract final class BottomNavMetrics {
  /// Side inset of the floating styles, and their float gap above the screen
  /// edge where the system reports no inset of its own.
  static const double floatingInset = 12;

  static const double dockHeight = 64;
  static const double dockRadius = 26;
  static const double dockMaxWidth = 560;

  static const double splitHeight = 62;
  static const double splitMinimizedSize = 54;
  static const double splitGap = 10;

  static const double stripHeight = 60;
  static const double stripMaxWidth = 600;

  static const double capsulePlayerHeight = 58;
  static const double capsulePlayerRadius = 22;
  static const double capsulePlayerGap = 8;
  static const double rowPlayerHeight = 56;

  static const double indicatorWidth = 62;
  static const double indicatorHeight = 52;
  static const double indicatorRadius = 20;

  static const double hubRadius = 28;
  static const double iconSize = 24;
  static const double avatarSize = 26;

  static double floatingBottomGap(double bottomInset) =>
      bottomInset > 0 ? bottomInset : floatingInset;

  /// Room the bar takes along the bottom of the screen, system inset included.
  ///
  /// Split reports its expanded height even while minimised, so content padded
  /// by it doesn't jump every time the user changes scroll direction.
  static double heightFor(
    BottomNavbarStyle style, {
    required double bottomInset,
    required bool miniPlayer,
  }) {
    final gap = floatingBottomGap(bottomInset);
    const capsule = capsulePlayerHeight + capsulePlayerGap;
    return switch (style) {
      BottomNavbarStyle.dock => dockHeight + gap + (miniPlayer ? capsule : 0),
      BottomNavbarStyle.split =>
        splitHeight + gap + (miniPlayer ? capsule : 0),
      BottomNavbarStyle.strip =>
        stripHeight + bottomInset + (miniPlayer ? rowPlayerHeight : 0),
    };
  }
}
