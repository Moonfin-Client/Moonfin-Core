import 'package:flutter/material.dart';

class AppShapes {
  const AppShapes();

  static const double extraSmall = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 28;

  BorderRadius get extraSmallRadius => BorderRadius.circular(extraSmall);
  BorderRadius get smallRadius => BorderRadius.circular(small);
  BorderRadius get mediumRadius => BorderRadius.circular(medium);
  BorderRadius get largeRadius => BorderRadius.circular(large);
  BorderRadius get extraLargeRadius => BorderRadius.circular(extraLarge);
  BorderRadius get circular => BorderRadius.circular(9999);

  /// Apple-style continuous-corner squircle. Renders a true superellipse on
  /// Impeller and an approximation elsewhere. It stays paint-level with no
  /// clip ops, so it is safe on every platform.
  static RoundedSuperellipseBorder squircle(double radius) =>
      RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(radius));

  RoundedRectangleBorder get extraSmallShape =>
      RoundedRectangleBorder(borderRadius: extraSmallRadius);
  RoundedRectangleBorder get smallShape =>
      RoundedRectangleBorder(borderRadius: smallRadius);
  RoundedRectangleBorder get mediumShape =>
      RoundedRectangleBorder(borderRadius: mediumRadius);
  RoundedRectangleBorder get largeShape =>
      RoundedRectangleBorder(borderRadius: largeRadius);
  RoundedRectangleBorder get extraLargeShape =>
      RoundedRectangleBorder(borderRadius: extraLargeRadius);
}
