/// The one design canvas every television lays out on.
///
/// A TV hands Flutter whatever logical size its density claims, and the two
/// common answers are a long way apart: tvOS reports 1920 points across, a
/// 1080p Android TV at density two reports 960. Every constant in a ten foot
/// layout is written for one of them, so on the other the whole app draws at
/// the wrong size.
///
/// So the app doesn't lay out on the panel's canvas at all. It lays out on
/// this one and scales the result to fill the screen, which makes every TV
/// agree whatever density it reports.
///
/// Platform views can't follow a Dart side canvas, so each one undoes this for
/// itself through UnscaledPlatformView rather than being sized from here.
library;

import 'package:flutter/material.dart';

/// The scale a 1920 wide panel is driven at, and with it the canvas width
/// every TV normalizes to. A 1080p panel lands on 1324x745 at an effective
/// density of 1.45, which is what the ten foot layouts are written against.
const double kTvTargetScale = 1.45;
const double kTvDesignWidth = 1920 / kTvTargetScale;

/// How much to magnify the design canvas to fill a panel [realWidth] points
/// across. One means the panel is already the design canvas.
double tvUiScaleFor(double realWidth) =>
    realWidth <= 0 ? 1.0 : realWidth / kTvDesignWidth;

/// The canvas a panel of [realSize] lays out on. Always [kTvDesignWidth]
/// across, whatever density the platform reported.
Size tvUiLogicalSize(Size realSize) {
  final scale = tvUiScaleFor(realSize.width);
  return Size(realSize.width / scale, realSize.height / scale);
}

/// Whether a panel of [realWidth] is near enough the design canvas that
/// scaling it would buy nothing but a transform layer.
bool tvUiScaleIsNegligible(double realWidth) =>
    (tvUiScaleFor(realWidth) - 1.0).abs() < 0.005;

/// Lays [child] out on the design canvas and scales it to fill the screen.
class TvUiScale extends StatelessWidget {
  const TvUiScale({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final realSize = mq.size;
    if (tvUiScaleIsNegligible(realSize.width)) return child;
    final scale = tvUiScaleFor(realSize.width);
    final logicalSize = tvUiLogicalSize(realSize);
    EdgeInsets scaleInsets(EdgeInsets insets, {bool zeroTop = false}) =>
        EdgeInsets.fromLTRB(
          insets.left / scale,
          zeroTop ? 0 : insets.top / scale,
          insets.right / scale,
          insets.bottom / scale,
        );
    return FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(
        width: logicalSize.width,
        height: logicalSize.height,
        child: MediaQuery(
          data: mq.copyWith(
            size: logicalSize,
            devicePixelRatio: mq.devicePixelRatio * scale,
            padding: scaleInsets(mq.padding, zeroTop: true),
            viewPadding: scaleInsets(mq.viewPadding, zeroTop: true),
            viewInsets: scaleInsets(mq.viewInsets),
          ),
          child: child,
        ),
      ),
    );
  }
}
